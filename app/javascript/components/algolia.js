const search = () => {
  cosnt client = algoliasearch('FSKD2HT855', '17e56f601a8c4a972b13cc571c698202');
  const index = client.initIndex('Ateliyay');
  index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
}
