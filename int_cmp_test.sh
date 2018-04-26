x='[1-2][0-9]'
for i in $(seq 1000000); do
  #[ -36 -le 36 ]
  case 12 in -*|$x|[0-9]|3[0-6]) :;; esac
done >/dev/null

exit 0

# ge
case 36 in 3[6-9]|[4-9][0-9]|[1-9]??*) :;; esac
case 39 in 39|[4-9][0-9]|[1-9]??*) :;; esac
case 40 in [4-9][0-9]|[1-9]??*) :;; esac
# gt (we can add one to number being compared against here and use same method as ge)
case 36 in 3[7-9]|[4-9][0-9]|[1-9]??*) :;; esac
case 39 in [4-9][0-9]|[1-9]??*) :;; esac
case 40 in 4[1-9]|[5-9][0-9]|[1-9]??*) :;; esac
# le
case 36 in 3[0-6]|[1-2][0-9]|[0-9]|-*) :;; esac
