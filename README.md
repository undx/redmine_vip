# Redmine VIP plugin

## Installing

Check [Redmine plugin installation procedure](http://www.redmine.org/wiki/plugins).

This plugin has been developped tested on Redmine 2.1-stable branch. 
It should work on 2.x

## Configuration

Go to Administration -> Users and then select a user.
In _Information_ part below `Administrator`, you should see a `VIP` checkbox.


## Usage

To check if the user is VIP one, you can send it a `:vip?` message.

    author.vip?
    assignee.vip?
    User.current.vip?
    ...

## Other

Look at my [SLA plugin](http://github.com/undx/redmine_sla) to see it in action.
