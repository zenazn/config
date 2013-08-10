class base {
  include ntp
}

# We want any node that hasn't explicitly been configured to error out
node default {
  fail("Who are you, $fqdn?")
}
