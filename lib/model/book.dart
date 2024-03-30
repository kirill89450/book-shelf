
class Book{

  final String? title;
  final String? authors;
  final String? thumbnailUrl;
  final String? categories;
  final String? isbn13;
  final int? totalItems;
  final double? averageRating;
  final String? ratingCount;
  final String? description;
  final String? publishedDate;
  final String? publisher;
  final String? pageCount;
  final String? infoLink;
  final bool? embeddable;
  final String? previewLink;

  Book({
    this.title,
    this.authors,
    this.isbn13,
    this.thumbnailUrl,
    this.categories,
    this.averageRating,
    this.totalItems,
    this.ratingCount,
    this.description,
    this.pageCount,
    this.publishedDate,
    this.publisher,
    this.infoLink,
    this.embeddable,
    this.previewLink,
  });
}
