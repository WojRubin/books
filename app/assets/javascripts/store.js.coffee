# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Books.Adapter = DS.RESTAdapter.extend
  namespace: 'api/v1'


Books.GenreAdapter = Books.Adapter.extend()
Books.BookAdapter = Books.Adapter.extend()
Books.AuthorAdapter = Books.Adapter.extend()

Books.ApplicationSerializer = DS.ActiveModelSerializer.extend()
Books.ApplicationSerializer.typeForRoot("id")
