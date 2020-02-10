Content-Type: multipart/mixed; boundary="===============5494563299490321873=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [gpio:devel-cleanup-irqchip-threaded 1/1] include/asm-generic/gpio.h:61:9: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast
Date: Tue, 11 Feb 2020 02:26:05 +0800
Message-ID: <202002110251.lNDTV07b%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5494563299490321873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.g=
it devel-cleanup-irqchip-threaded
head:   bf5b241314ea9d338b03df6f54b7c02113ab0f87
commit: bf5b241314ea9d338b03df6f54b7c02113ab0f87 [1/1] gpio: Handle generic=
 and threaded IRQs on gpio irqchips
config: openrisc-or1ksim_defconfig (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout bf5b241314ea9d338b03df6f54b7c02113ab0f87
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:13:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:13:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib.c:17:
   include/linux/gpio/driver.h: At top level:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from drivers/gpio/gpiolib.h:12,
                    from drivers/gpio/gpiolib.c:31:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   drivers/gpio/gpiolib.c: In function 'gpiochip_get_desc':
   drivers/gpio/gpiolib.c:145:33: error: dereferencing pointer to incomplet=
e type 'struct gpio_chip'
     145 |  struct gpio_device *gdev =3D chip->gpiodev;
         |                                 ^~
   drivers/gpio/gpiolib.c: At top level:
   drivers/gpio/gpiolib.c:174:19: error: conflicting types for 'gpiod_to_ch=
ip'
     174 | struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib.c:13:
   include/asm-generic/gpio.h:61:9: note: previous implicit declaration of =
'gpiod_to_chip' was here
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
   In file included from arch/openrisc/include/asm/bitops.h:25,
                    from include/linux/bitops.h:29,
                    from include/linux/bitmap.h:8,
                    from drivers/gpio/gpiolib.c:2:
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_valid':
   drivers/gpio/gpiolib.c:413:22: error: dereferencing pointer to incomplet=
e type 'const struct gpio_chip'
     413 |  if (likely(!gpiochip->valid_mask))
         |                      ^~
   include/linux/compiler.h:77:40: note: in definition of macro 'likely'
      77 | # define likely(x) __builtin_expect(!!(x), 1)
         |                                        ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_add_data_with_key':
   drivers/gpio/gpiolib.c:1571:2: error: implicit declaration of function '=
gpiochip_remove_pin_ranges'; did you mean 'gpiochip_add_pin_ranges'? [-Werr=
or=3Dimplicit-function-declaration]
    1571 |  gpiochip_remove_pin_ranges(chip);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |  gpiochip_add_pin_ranges
   drivers/gpio/gpiolib.c: In function 'devm_gpiochip_add_data':
   drivers/gpio/gpiolib.c:1692:8: error: implicit declaration of function '=
gpiochip_add_data'; did you mean 'gpiochip_get_data'? [-Werror=3Dimplicit-f=
unction-declaration]
    1692 |  ret =3D gpiochip_add_data(chip, data);
         |        ^~~~~~~~~~~~~~~~~
         |        gpiochip_get_data
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_valid':
   drivers/gpio/gpiolib.c:416:1: warning: control reaches end of non-void f=
unction [-Wreturn-type]
     416 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_get_data':
   drivers/gpio/gpiolib.c:1603:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    1603 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_generic_request':
   drivers/gpio/gpiolib.c:2610:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    2610 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_generic_config':
   drivers/gpio/gpiolib.c:2634:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    2634 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpio_set_config':
   drivers/gpio/gpiolib.c:3045:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    3045 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiod_cansleep':
   drivers/gpio/gpiolib.c:3912:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    3912 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_irq':
   drivers/gpio/gpiolib.c:4076:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    4076 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_open_drain':
   drivers/gpio/gpiolib.c:4109:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    4109 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_open_source':
   drivers/gpio/gpiolib.c:4118:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    4118 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_line_is_persistent':
   drivers/gpio/gpiolib.c:4127:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    4127 | }
         | ^
   drivers/gpio/gpiolib.c: In function 'gpiochip_match_name':
   drivers/gpio/gpiolib.c:1742:1: warning: control reaches end of non-void =
function [-Wreturn-type]
    1742 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib-devres.c:11:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib-devres.c:11:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib.h:12,
                    from drivers/gpio/gpiolib-devres.c:16:
   include/linux/gpio/driver.h: At top level:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   cc1: some warnings being treated as errors
--
   In file included from drivers/gpio/gpiolib-legacy.c:3:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib-legacy.c:5:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from drivers/gpio/gpiolib-legacy.c:5:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib.h:12,
                    from drivers/gpio/gpiolib-legacy.c:7:
   include/linux/gpio/driver.h: At top level:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from include/linux/of_gpio.h:16,
                    from drivers/gpio/gpiolib-of.c:18:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from include/linux/of_gpio.h:16,
                    from drivers/gpio/gpiolib-of.c:18:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib-of.c:18:
   include/linux/of_gpio.h: At top level:
   include/linux/of_gpio.h:41:19: error: field 'gc' has incomplete type
      41 |  struct gpio_chip gc;
         |                   ^~
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from drivers/gpio/gpiolib-of.c:10:
   include/linux/of_gpio.h: In function 'to_of_mm_gpio_chip':
   include/linux/kernel.h:987:32: error: dereferencing pointer to incomplet=
e type 'struct gpio_chip'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                ^~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compilet=
ime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletim=
e_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LI=
NE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/linux/of_gpio.h:48:9: note: in expansion of macro 'container_of'
      48 |  return container_of(gc, struct of_mm_gpio_chip, gc);
         |         ^~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib.h:12,
                    from drivers/gpio/gpiolib-of.c:23:
   include/linux/gpio/driver.h: At top level:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   drivers/gpio/gpiolib-of.c: In function 'of_find_gpiochip_by_xlate':
>> drivers/gpio/gpiolib-of.c:92:9: error: implicit declaration of function =
'gpiochip_find' [-Werror=3Dimplicit-function-declaration]
      92 |  return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate=
);
         |         ^~~~~~~~~~~~~
>> drivers/gpio/gpiolib-of.c:92:9: warning: returning 'int' from a function=
 with return type 'struct gpio_chip *' makes pointer from integer without a=
 cast [-Wint-conversion]
      92 |  return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate=
);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpio_need_valid_mask':
   drivers/gpio/gpiolib-of.c:121:29: error: dereferencing pointer to incomp=
lete type 'const struct gpio_chip'
     121 |  struct device_node *np =3D gc->of_node;
         |                             ^~
   drivers/gpio/gpiolib-of.c: In function 'of_mm_gpiochip_add_data':
>> drivers/gpio/gpiolib-of.c:725:8: error: implicit declaration of function=
 'gpiochip_add_data' [-Werror=3Dimplicit-function-declaration]
     725 |  ret =3D gpiochip_add_data(gc, data);
         |        ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_mm_gpiochip_remove':
   drivers/gpio/gpiolib-of.c:751:2: error: implicit declaration of function=
 'gpiochip_remove'; did you mean 'of_gpiochip_remove'? [-Werror=3Dimplicit-=
function-declaration]
     751 |  gpiochip_remove(gc);
         |  ^~~~~~~~~~~~~~~
         |  of_gpiochip_remove
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_add':
>> drivers/gpio/gpiolib-of.c:888:3: error: implicit declaration of function=
 'devprop_gpiochip_set_names' [-Werror=3Dimplicit-function-declaration]
     888 |   devprop_gpiochip_set_names(chip,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib-of.c:16:
   include/linux/of.h:175:28: error: invalid type argument of '->' (have 'i=
nt')
     175 |    &__of_fwnode_handle_node->fwnode : NULL; \
         |                            ^~
   drivers/gpio/gpiolib-of.c:889:9: note: in expansion of macro 'of_fwnode_=
handle'
     889 |         of_fwnode_handle(chip->of_node));
         |         ^~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_gpiochip_match_node_and_xlate=
':
   drivers/gpio/gpiolib-of.c:87:1: warning: control reaches end of non-void=
 function [-Wreturn-type]
      87 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from drivers/net/phy/mdio_bus.c:20:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from drivers/net/phy/mdio_bus.c:20:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/mdio_bus.c:24:
   include/linux/of_gpio.h: At top level:
   include/linux/of_gpio.h:41:19: error: field 'gc' has incomplete type
      41 |  struct gpio_chip gc;
         |                   ^~
   In file included from include/linux/kernel.h:11,
                    from drivers/net/phy/mdio_bus.c:11:
   include/linux/of_gpio.h: In function 'to_of_mm_gpio_chip':
   include/linux/kernel.h:987:32: error: dereferencing pointer to incomplet=
e type 'struct gpio_chip'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                                ^~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compilet=
ime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletim=
e_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LI=
NE__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |  ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     987 |  BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
         |                    ^~~~~~~~~~~
   include/linux/of_gpio.h:48:9: note: in expansion of macro 'container_of'
      48 |  return container_of(gc, struct of_mm_gpio_chip, gc);
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13,
                    from include/linux/gpio.h:62,
                    from drivers/net/phy/mdio_device.c:10:
   include/linux/gpio/driver.h:2: error: unterminated #ifndef
       2 | #ifndef __LINUX_GPIO_DRIVER_H
         | =

   In file included from include/linux/gpio.h:62,
                    from drivers/net/phy/mdio_device.c:10:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
   include/asm-generic/gpio.h:61:9: error: implicit declaration of function=
 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=3Dimplicit-function=
-declaration]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~
         |         gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: returning 'int' from a functio=
n with return type 'struct gpio_chip *' makes pointer from integer without =
a cast [-Wint-conversion]
      61 |  return gpiod_to_chip(gpio_to_desc(gpio));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..

vim +61 include/asm-generic/gpio.h

d2876d08d86f22 David Brownell    2008-02-04  57  =

79a9becda8940d Alexandre Courbot 2013-10-17  58  /* caller holds gpio_lock =
*OR* gpio is marked as requested */
79a9becda8940d Alexandre Courbot 2013-10-17  59  static inline struct gpio_=
chip *gpio_to_chip(unsigned gpio)
79a9becda8940d Alexandre Courbot 2013-10-17  60  {
79a9becda8940d Alexandre Courbot 2013-10-17 @61  	return gpiod_to_chip(gpio=
_to_desc(gpio));
79a9becda8940d Alexandre Courbot 2013-10-17  62  }
d2876d08d86f22 David Brownell    2008-02-04  63  =


:::::: The code at line 61 was first introduced by commit
:::::: 79a9becda8940deb2274b5aa4577c86d52ee7ecb gpiolib: export descriptor-=
based GPIO interface

:::::: TO: Alexandre Courbot <acourbot@nvidia.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5494563299490321873==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5494563299490321873==--

