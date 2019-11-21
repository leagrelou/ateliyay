const search = () => {
  const client = algoliasearch('FSKD2HT855', '17e56f601a8c4a972b13cc571c698202');
  const index = client.initIndex('Studio');

  const query = document.querySelector("#search_query");

  query.addEventListener('input', (event) => {
    // console.log(query.value);


    index.search(query.value, { hitsPerPage: 100, page: 0 })
      .then((content) => {
        const hiddenCards = document.querySelectorAll(".card-trip-link");
        hiddenCards.forEach((card) => {
          card.style.display = "none";
        }) 

        // console.log(content);
        content.hits.forEach((hit) => {
          const card = document.querySelector(`#studio-${hit.objectID}`);
          card.style.display = "block";
        })
      })
  })
}

export { search};

// const searchTerm = query.value;

// const search_trigger = document.querySelector("#search_submit");
// results = document.addEventListener('submit', (event) => {
//   event.preventDefault();
// }

// result => {
//   const hits = result.hits.map (
//     hit.
//     )
// }
