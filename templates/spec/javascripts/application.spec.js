//= require application

describe("application", function() {
  it("uses unobtrusive scripting adapter for jQuery", function() {
    expect($.rails).toBeDefined();
  });
});
