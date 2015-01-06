class User
  constructor: (@firstName, @lastName) ->
    @fullName = "#{@firstName} #{@lastName}"


class UserListViewModel
  constructor: () ->
    @users = ko.observableArray()
    @firstNameValue = ko.observable("")
    @lastNameValue = ko.observable("")

  addUser: () =>
    if @firstNameValue().length is 0 or @lastNameValue().length is 0
      return
    @users.unshift(User(@firstNameValue(), @lastNameValue()))
    @firstNameValue("")
    @lastNameValue("")
    return

  removeUser: (user) =>
    if user?
      @users.remove(user)
      return
    console.log "user undefined"
    return

$ ->
  ko.applyBindings(new UserListViewModel())
