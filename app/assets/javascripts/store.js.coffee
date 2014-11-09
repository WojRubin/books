# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Books.BookAdapter = DS.RESTAdapter.extend
  namespace: 'api/v1'