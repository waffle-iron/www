describe('ShoppingListItemAddForm', function() {
  var react_dom;
  var dom_node;
  var names_added;
  var prefetch_url;
  var remote_url;

  function localBloodhound(p,r) {
    prefetch_url = p;
    remote_url = r
    return new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.whitespace,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      sufficient: 3,
      local: ['Bread', 'Oranges', 'Cheese', 'Chicken', 'Carrots', 'Corn', 'Chips']
    });
  }

  function stubAdd(name) {
    names_added.push(name);
  }

  beforeEach(function() {
    names_added = [];
    react_dom = TestUtils.renderIntoDocument(
        <ShoppingListItemAddForm handleAdd={stubAdd}
                                 bloodhoundBuilder={localBloodhound}
                                 price_book_pages_url="/my_url"
                                 item_names_url="/my_other"
                                 authenticity_token="asd"/>
    );
    dom_node = ReactDOM.findDOMNode(react_dom);
  });

  it("renders DIV", function () {
    expect(dom_node.nodeName).toEqual('DIV');
  });

  it("sets prefetch_url", function () {
    expect(prefetch_url).toEqual('/my_url');
  });

  it("sets remote_url", function () {
    expect(remote_url).toEqual('/my_other');
  });

  it("enables input", function () {
    const input = dom_node.querySelector('#shopping_list_item_name');

    expect(input.disabled).toEqual(false);
  });

  it("enables button", function () {
    const button = dom_node.querySelector('button');

    expect(button.disabled).toEqual(false);
  });

  it("adds the item", function () {
    const input = dom_node.querySelector('#shopping_list_item_name');
    const form = dom_node.querySelector('form');

    input.value = 'Cheese';
    TestUtils.Simulate.change(input);
    TestUtils.Simulate.submit(form);

    expect(names_added).toEqual(["Cheese"]);
  });

  it("adds the item from suggestion", function () {
    const input = dom_node.querySelector('#shopping_list_item_name');

    input.value = 'Br';
    TestUtils.Simulate.change(input);

    const button = dom_node.querySelector('button.name-suggestion');
    TestUtils.Simulate.click(button);

    expect(names_added).toEqual(["Bread"]);
  });

  it("shows only 3 suggestions", function () {
    const input = dom_node.querySelector('#shopping_list_item_name');

    input.value = 'C';
    TestUtils.Simulate.change(input);

    const buttons = dom_node.querySelectorAll('button.name-suggestion');

    expect(buttons.length).toEqual(3);
  });

  describe('disabled', function() {
    beforeEach(function() {
      react_dom = TestUtils.renderIntoDocument(
          <ShoppingListItemAddForm handleAdd={stubAdd}
                                   bloodhoundBuilder={localBloodhound}
                                   price_book_pages_url="/my_url"
                                   item_names_url="/my_other"
                                   authenticity_token="asd"
                                   disabled={true} />
      );
      dom_node = ReactDOM.findDOMNode(react_dom);
    });

    it("disables input", function () {
      const input = dom_node.querySelector('#shopping_list_item_name');

      expect(input.disabled).toEqual(true);
    });

    it("disables button", function () {
      const button = dom_node.querySelector('button');

      expect(button.disabled).toEqual(true);
    });
  });
});