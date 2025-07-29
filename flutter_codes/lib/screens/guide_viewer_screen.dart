import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';

import 'package:telefon_akademiyasi/api/data_service.dart';
import 'package:telefon_akademiyasi/models/guide.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';
import 'package:telefon_akademiyasi/utils/dialog_manager.dart';

class GuideViewerScreen extends StatefulWidget {
  final Guide guide;
  const GuideViewerScreen({super.key, required this.guide});

  @override
  State<GuideViewerScreen> createState() => _GuideViewerScreenState();
}

class _GuideViewerScreenState extends State<GuideViewerScreen> {
  String _errorMessage = '';
  PdfDocument? _pdfDocument;
  late PageController _pageController;
  final FocusNode _focusNode = FocusNode();

  int _currentPage = 0;
  int _pdfPagesCount = 0;
  int _visualPagesCount = 0;
  bool _isLoading = true;

  final Map<int, Uint8List> _pageCache = {}; 
  final Map<int, String> _pageErrors = {}; 

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _fetchDocumentAndLoadPdf();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _pdfDocument?.close();
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _fetchDocumentAndLoadPdf() async {
    if (!mounted) return;

    setState(() {
      _errorMessage = '';
      _isLoading = true;
      _pageCache.clear(); 
      _pageErrors.clear(); 
    });

    bool hasInternet = await DialogManager.checkInternetAndShowDialog(onRetry: _fetchDocumentAndLoadPdf);
    if (!hasInternet) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Internetga ulanish yo\'q. Iltimos, internetingizni tekshiring va qayta urining.';
          _isLoading = false;
        });
      }
      return;
    }

    try {
      final bytes = await DataService().fetchAndDeobfuscateDocument(widget.guide.documentUrl);
      if (mounted) {
        if (_pdfDocument != null) {
          await _pdfDocument!.close();
          _pdfDocument = null;
        }

        _pdfDocument = await PdfDocument.openData(bytes);
        _pdfPagesCount = _pdfDocument!.pagesCount;
        _visualPagesCount = (_pdfPagesCount / 4).ceil();

        for (int i = 0; i < _pdfPagesCount; i++) {

          double renderWidth = 350.0;
          double renderHeight = renderWidth * (1280.0 / 720.0);

          if (mounted) { 
            try {
              final bytes = await _renderPdfPageAsImage(i, renderWidth, renderHeight);
              if (bytes != null) {
                _pageCache[i] = bytes;
              } else {

                _pageErrors[i] = 'Sahifa ${i + 1} bo\'sh. PDF fayl buzilgan bo\'lishi mumkin.';
                debugPrint('Sahifa ${i + 1} bo\'sh. PDF fayl buzilgan bo\'lishi mumkin.');
              }
            } catch (renderError) {
              _pageErrors[i] = 'Sahifa ${i + 1} renderlashda xato yuz berdi: ${renderError.toString()}';
              debugPrint('Sahifa ${i + 1} renderlashda xato yuz berdi: ${renderError.toString()}');
            }
          }
        }

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Hujjatni yuklashda yoki PDFni ochishda kutilmagan xato yuz berdi: ${e.toString()}';
          _isLoading = false;
        });
        DialogManager.showAlertDialog(
          title: 'Xato!',
          message: _errorMessage,
          buttonText: 'Qayta urinish',
          onPressed: () {
            _fetchDocumentAndLoadPdf();
          },
        );
      }
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft || event.logicalKey == LogicalKeyboardKey.keyA) {
        if (_currentPage > 0) {
          _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight || event.logicalKey == LogicalKeyboardKey.keyD) {
        if (_currentPage < _visualPagesCount - 1) {
          _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      }
    }
  }

  Future<Uint8List?> _renderPdfPageAsImage(int pdfPageIndex, double width, double height) async {
    if (_pdfDocument == null || pdfPageIndex >= _pdfDocument!.pagesCount) {
      return null;
    }
    try {
      final pdfPage = await _pdfDocument!.getPage(pdfPageIndex + 1);
      final pdfPageImage = await pdfPage.render(
        width: width,
        height: height,
        format: PdfPageImageFormat.jpeg,
        quality: 75,
      );
      await pdfPage.close();
      return pdfPageImage?.bytes;
    } catch (e) {
      debugPrint('Sahifani rasmga renderlashda xato ($pdfPageIndex): $e');
      rethrow; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: Text(widget.guide.title, style: const TextStyle(color: AppColors.textColor)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
              ),
            )
          : _errorMessage.isNotEmpty || _pdfDocument == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: AppColors.errorColor,
                          size: 60,
                        ),
                        const SizedBox(height: 20),

                        SelectableText(
                          _errorMessage.isNotEmpty ? _errorMessage : 'Hujjatni yuklashda xato yuz berdi. Iltimos, keyinroq qayta urining.',
                          style: const TextStyle(color: AppColors.errorColor, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: _fetchDocumentAndLoadPdf,
                          child: const Text(
                            'Qayta urinish',
                            style: TextStyle(color: AppColors.textColor, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : KeyboardListener(
                  focusNode: _focusNode,
                  onKeyEvent: _handleKeyEvent,
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      if (orientation == Orientation.landscape || MediaQuery.of(context).size.width > 600) {
                        return _buildFourPagesLayout();
                      } else {
                        return _buildSinglePageLayout();
                      }
                    },
                  ),
                ),
    );
  }

  Widget _buildSinglePageLayout() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: _pdfPagesCount,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        final imageData = _pageCache[index];
        final error = _pageErrors[index];

        if (error != null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: AppColors.errorColor, size: 60),
                  const SizedBox(height: 10),
                  SelectableText(
                    'Sahifa ${index + 1} yuklanmadi:',
                    style: const TextStyle(color: AppColors.errorColor, fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  SelectableText(
                    error, 
                    style: const TextStyle(color: AppColors.errorColor, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else if (imageData == null) {

          return const Center(child: CircularProgressIndicator());
        } else {
          return InteractiveViewer(
            maxScale: 5.0,
            minScale: 0.1,
            child: Image.memory(
              imageData,
              fit: BoxFit.contain,
            ),
          );
        }
      },
    );
  }

  Widget _buildFourPagesLayout() {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _visualPagesCount,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, visualPageIndex) {
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: (MediaQuery.of(context).size.width / 4) / MediaQuery.of(context).size.height,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 4,
              itemBuilder: (context, gridItemIndex) {
                final pdfPageIndex = (visualPageIndex * 4) + gridItemIndex;

                if (pdfPageIndex >= _pdfPagesCount) {
                  return const SizedBox();
                }

                final imageData = _pageCache[pdfPageIndex];
                final error = _pageErrors[pdfPageIndex];

                if (error != null) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.errorColor, width: 2.0),

                      color: AppColors.errorColor.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: AppColors.errorColor, size: 30),
                            const SizedBox(height: 5),
                            SelectableText(
                              'Sahifa ${pdfPageIndex + 1} yuklanmadi:',
                              style: const TextStyle(color: AppColors.errorColor, fontSize: 10, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 2),
                            SelectableText(
                              error,
                              style: const TextStyle(color: AppColors.errorColor, fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (imageData == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryBlue.withAlpha((255 * 0.5).round()), width: 1.0),
                    ),
                    child: InteractiveViewer(
                      maxScale: 5.0,
                      minScale: 0.1,
                      child: Image.memory(
                        imageData,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),

        Positioned(
          left: 16.0,
          top: MediaQuery.of(context).size.height / 2 - 30, 
          child: Opacity(
            opacity: _currentPage > 0 ? 1.0 : 0.3, 
            child: GestureDetector(
              onTap: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_left, color: AppColors.textColor, size: 30),
                    Text('A', style: TextStyle(color: AppColors.textColor, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          right: 16.0,
          top: MediaQuery.of(context).size.height / 2 - 30, 
          child: Opacity(
            opacity: _currentPage < _visualPagesCount - 1 ? 1.0 : 0.3, 
            child: GestureDetector(
              onTap: () {
                if (_currentPage < _visualPagesCount - 1) {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_right, color: AppColors.textColor, size: 30),
                    Text('D', style: TextStyle(color: AppColors.textColor, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}