Content-Type: multipart/mixed; boundary="===============8049642298664415165=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:master 48/53] drivers//gpio/gpio-xilinx.c:68:25: error: field 'mmchip' has incomplete type
Date: Tue, 25 Feb 2020 05:45:31 +0800
Message-ID: <202002250502.3nHjNFnn%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8049642298664415165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx master
head:   0bf5e5fe96bf3663f5d47e01d7f8d0e4d737e492
commit: 8a0be21c42a2613cc1b9ddb339447b9fe199134b [48/53] Merge remote-track=
ing branch 'xlnx_rebase_v5.4' into master-next-test
config: i386-randconfig-f001-20200224 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        git checkout 8a0be21c42a2613cc1b9ddb339447b9fe199134b
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers//gpio/gpio-xilinx.c:68:25: error: field 'mmchip' has incomplete =
type
     struct of_mm_gpio_chip mmchip;
                            ^~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_get':
>> drivers//gpio/gpio-xilinx.c:94:34: error: implicit declaration of functi=
on 'to_of_mm_gpio_chip' [-Werror=3Dimplicit-function-declaration]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c:94:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
   In file included from arch/x86/include/asm/bitops.h:16:0,
                    from include/linux/bitops.h:26,
                    from drivers//gpio/gpio-xilinx.c:15:
>> include/linux/kernel.h:994:32: error: dereferencing pointer to incomplet=
e type 'struct of_mm_gpio_chip'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                   ^~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compilet=
ime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletim=
e_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:994:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:994:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
>> drivers//gpio/gpio-xilinx.c:96:6: note: in expansion of macro 'container=
_of'
         container_of(mm_gc, struct xgpio_instance, mmchip);
         ^~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_set':
   drivers//gpio/gpio-xilinx.c:115:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_set_multiple':
   drivers//gpio/gpio-xilinx.c:147:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_dir_in':
   drivers//gpio/gpio-xilinx.c:187:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_dir_out':
   drivers//gpio/gpio-xilinx.c:218:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_xlate':
   drivers//gpio/gpio-xilinx.c:274:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
>> drivers//gpio/gpio-xilinx.c:277:8: error: 'struct gpio_chip' has no memb=
er named 'of_gpio_n_cells'
     if (gc->of_gpio_n_cells =3D=3D 3 && flags)
           ^~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_to_irq':
   drivers//gpio/gpio-xilinx.c:392:34: warning: initialization makes pointe=
r from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_remove':
>> drivers//gpio/gpio-xilinx.c:576:2: error: implicit declaration of functi=
on 'of_mm_gpiochip_remove'; did you mean 'gpiochip_remove'? [-Werror=3Dimpl=
icit-function-declaration]
     of_mm_gpiochip_remove(&chip->mmchip);
     ^~~~~~~~~~~~~~~~~~~~~
     gpiochip_remove
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_of_probe':
>> drivers//gpio/gpio-xilinx.c:676:11: error: implicit declaration of funct=
ion 'of_mm_gpiochip_add'; did you mean 'gpiochip_add'? [-Werror=3Dimplicit-=
function-declaration]
     status =3D of_mm_gpiochip_add(np, &chip->mmchip);
              ^~~~~~~~~~~~~~~~~~
              gpiochip_add
   cc1: some warnings being treated as errors
--
   drivers/gpio/gpio-xilinx.c:68:25: error: field 'mmchip' has incomplete t=
ype
     struct of_mm_gpio_chip mmchip;
                            ^~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_get':
   drivers/gpio/gpio-xilinx.c:94:34: error: implicit declaration of functio=
n 'to_of_mm_gpio_chip' [-Werror=3Dimplicit-function-declaration]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:94:34: warning: initialization makes pointer =
from integer without a cast [-Wint-conversion]
   In file included from arch/x86/include/asm/bitops.h:16:0,
                    from include/linux/bitops.h:26,
                    from drivers/gpio/gpio-xilinx.c:15:
>> include/linux/kernel.h:994:32: error: dereferencing pointer to incomplet=
e type 'struct of_mm_gpio_chip'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                   ^~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compilet=
ime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletim=
e_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:994:2: note: in expansion of macro 'BUILD_BUG_ON_=
MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:994:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:96:6: note: in expansion of macro 'container_=
of'
         container_of(mm_gc, struct xgpio_instance, mmchip);
         ^~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_set':
   drivers/gpio/gpio-xilinx.c:115:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_set_multiple':
   drivers/gpio/gpio-xilinx.c:147:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_dir_in':
   drivers/gpio/gpio-xilinx.c:187:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_dir_out':
   drivers/gpio/gpio-xilinx.c:218:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_xlate':
   drivers/gpio/gpio-xilinx.c:274:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c:277:8: error: 'struct gpio_chip' has no membe=
r named 'of_gpio_n_cells'
     if (gc->of_gpio_n_cells =3D=3D 3 && flags)
           ^~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_to_irq':
   drivers/gpio/gpio-xilinx.c:392:34: warning: initialization makes pointer=
 from integer without a cast [-Wint-conversion]
     struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
                                     ^~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_remove':
   drivers/gpio/gpio-xilinx.c:576:2: error: implicit declaration of functio=
n 'of_mm_gpiochip_remove'; did you mean 'gpiochip_remove'? [-Werror=3Dimpli=
cit-function-declaration]
     of_mm_gpiochip_remove(&chip->mmchip);
     ^~~~~~~~~~~~~~~~~~~~~
     gpiochip_remove
   drivers/gpio/gpio-xilinx.c: In function 'xgpio_of_probe':
   drivers/gpio/gpio-xilinx.c:676:11: error: implicit declaration of functi=
on 'of_mm_gpiochip_add'; did you mean 'gpiochip_add'? [-Werror=3Dimplicit-f=
unction-declaration]
     status =3D of_mm_gpiochip_add(np, &chip->mmchip);
              ^~~~~~~~~~~~~~~~~~
              gpiochip_add
   cc1: some warnings being treated as errors

vim +/mmchip +68 drivers//gpio/gpio-xilinx.c

e9a98626baf3b3 drivers/gpio/gpio-xilinx.c John Linn          2012-06-29   5=
2  =

b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   5=
3  /**
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   5=
4   * struct xgpio_instance - Stores information about GPIO device
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   5=
5   * @mmchip: OF GPIO chip for memory mapped banks
7c9997cc698ba9 drivers/gpio/gpio-xilinx.c Nava kishore Manne 2018-10-16   5=
6   * @mmchip_dual: Pointer to the OF dual gpio chip
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   5=
7   * @gpio_state: GPIO state shadow register
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   5=
8   * @gpio_dir: GPIO direction shadow register
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   5=
9   * @offset: GPIO channel offset
796ae5e3e4ae5f drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   6=
0   * @irq_base: GPIO channel irq base address
796ae5e3e4ae5f drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   6=
1   * @irq_enable: GPIO irq enable/disable bitfield
184f4682479b34 drivers/gpio/gpio-xilinx.c Shubhrajyoti Datta 2018-05-03   6=
2   * @no_init: No intitialisation at probe
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   6=
3   * @gpio_lock: Lock used for synchronization
796ae5e3e4ae5f drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   6=
4   * @irq_domain: irq_domain of the controller
34b6b71b142476 drivers/gpio/gpio-xilinx.c Maulik Jodhani     2017-02-10   6=
5   * @clk: clock resource for this driver
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   6=
6   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   6=
7  struct xgpio_instance {
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  @6=
8  	struct of_mm_gpio_chip mmchip;
7c9997cc698ba9 drivers/gpio/gpio-xilinx.c Nava kishore Manne 2018-10-16   6=
9  	struct of_mm_gpio_chip *mmchip_dual;
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   7=
0  	u32 gpio_state;
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   7=
1  	u32 gpio_dir;
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19   7=
2  	u32 offset;
32161b344f3eb8 drivers/gpio/gpio-xilinx.c Michal Simek       2013-09-03   7=
3  	int irq_base;
796ae5e3e4ae5f drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   7=
4  	u32 irq_enable;
184f4682479b34 drivers/gpio/gpio-xilinx.c Shubhrajyoti Datta 2018-05-03   7=
5  	bool no_init;
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29   7=
6  	spinlock_t gpio_lock;
796ae5e3e4ae5f drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   7=
7  	struct irq_domain *irq_domain;
34b6b71b142476 drivers/gpio/gpio-xilinx.c Maulik Jodhani     2017-02-10   7=
8  	struct clk *clk;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   7=
9  };
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
0  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
1  /**
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
2   * xgpio_get - Read the specified signal of the GPIO device.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
3   * @gc:     Pointer to gpio_chip device structure.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
4   * @gpio:   GPIO signal number.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   8=
5   *
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   8=
6   * This function reads the specified signal of the GPIO device.
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   8=
7   *
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   8=
8   * Return:
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   8=
9   * 0 if direction of GPIO signals is set as input otherwise it
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19   9=
0   * returns negative error value.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   9=
1   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   9=
2  static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12   9=
3  {
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  @9=
4  	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19   9=
5  	struct xgpio_instance *chip =3D
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19  @9=
6  	    container_of(mm_gc, struct xgpio_instance, mmchip);
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19   9=
7  =

fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19   9=
8  	void __iomem *regs =3D mm_gc->regs + chip->offset;
324c11445a4877 drivers/gpio/gpio-xilinx.c Michal Simek       2012-11-27   9=
9  =

b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29  10=
0  	return !!(xgpio_readreg(regs + XGPIO_DATA_OFFSET) & BIT(gpio));
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
1  }
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
2  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
3  /**
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
4   * xgpio_set - Write the specified signal of the GPIO device.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
5   * @gc:     Pointer to gpio_chip device structure.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
6   * @gpio:   GPIO signal number.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
7   * @val:    Value to be written to specified signal.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
8   *
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  10=
9   * This function writes the specified value in to the specified signal o=
f the
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
0   * GPIO device.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
1   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
2  static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
3  {
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
4  	unsigned long flags;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
5  	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
6  	struct xgpio_instance *chip =3D
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
7  	    container_of(mm_gc, struct xgpio_instance, mmchip);
e9a98626baf3b3 drivers/gpio/gpio-xilinx.c John Linn          2012-06-29  11=
8  	void __iomem *regs =3D mm_gc->regs;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  11=
9  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  12=
0  	spin_lock_irqsave(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  12=
1  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  12=
2  	/* Write to GPIO signal and set its direction to output */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  12=
3  	if (val)
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  12=
4  		chip->gpio_state |=3D BIT(gpio);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  12=
5  	else
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  12=
6  		chip->gpio_state &=3D ~BIT(gpio);
e9a98626baf3b3 drivers/gpio/gpio-xilinx.c John Linn          2012-06-29  12=
7  =

fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19  12=
8  	xgpio_writereg(regs + chip->offset + XGPIO_DATA_OFFSET,
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19  12=
9  							 chip->gpio_state);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  13=
0  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  13=
1  	spin_unlock_irqrestore(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  13=
2  }
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  13=
3  =

63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
4  /**
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
5   * xgpio_set_multiple - Write the specified signals of the GPIO device.
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
6   * @gc:     Pointer to gpio_chip device structure.
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
7   * @mask:   Mask of the GPIOS to modify.
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
8   * @bits:   Value to be wrote on each GPIO
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  13=
9   *
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
0   * This function writes the specified values into the specified signals =
of the
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
1   * GPIO devices.
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
2   */
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
3  static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
4  			       unsigned long *bits)
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
5  {
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
6  	unsigned long flags;
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
7  	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
8  	struct xgpio_instance *chip =3D
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  14=
9  	    container_of(mm_gc, struct xgpio_instance, mmchip);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
0  	void __iomem *regs =3D mm_gc->regs;
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
1  	int i;
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
2  =

63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
3  	spin_lock_irqsave(&chip->gpio_lock, flags);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
4  =

63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
5  	/* Write to GPIO signals */
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
6  	for (i =3D 0; i < gc->ngpio; i++) {
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
7  		if (*mask =3D=3D 0)
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
8  			break;
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  15=
9  		if (__test_and_clear_bit(i, mask)) {
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
0  			if (test_bit(i, bits))
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
1  				chip->gpio_state |=3D BIT(i);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
2  			else
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
3  				chip->gpio_state &=3D ~BIT(i);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
4  		}
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
5  	}
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
6  =

63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
7  	xgpio_writereg(regs + chip->offset + XGPIO_DATA_OFFSET,
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
8  		       chip->gpio_state);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  16=
9  =

63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  17=
0  	spin_unlock_irqrestore(&chip->gpio_lock, flags);
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  17=
1  }
63bcc8b82965b1 drivers/gpio/gpio-xilinx.c Iban Rodriguez     2016-05-13  17=
2  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
3  /**
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
4   * xgpio_dir_in - Set the direction of the specified GPIO signal as inpu=
t.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
5   * @gc:     Pointer to gpio_chip device structure.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
6   * @gpio:   GPIO signal number.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
7   *
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  17=
8   * This function sets the direction of specified GPIO signal as input.
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  17=
9   *
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  18=
0   * Return:
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  18=
1   * 0 - if direction of GPIO signals is set as input
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  18=
2   * otherwise it returns negative error value.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
3   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
4  static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
5  {
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
6  	unsigned long flags;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
7  	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
8  	struct xgpio_instance *chip =3D
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  18=
9  	    container_of(mm_gc, struct xgpio_instance, mmchip);
e9a98626baf3b3 drivers/gpio/gpio-xilinx.c John Linn          2012-06-29  19=
0  	void __iomem *regs =3D mm_gc->regs;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
1  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
2  	spin_lock_irqsave(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
3  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
4  	/* Set the GPIO bit in shadow register and set direction as input */
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  19=
5  	chip->gpio_dir |=3D BIT(gpio);
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19  19=
6  	xgpio_writereg(regs + chip->offset + XGPIO_TRI_OFFSET, chip->gpio_dir);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
7  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
8  	spin_unlock_irqrestore(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  19=
9  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
0  	return 0;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
1  }
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
2  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
3  /**
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
4   * xgpio_dir_out - Set the direction of the specified GPIO signal as out=
put.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
5   * @gc:     Pointer to gpio_chip device structure.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
6   * @gpio:   GPIO signal number.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
7   * @val:    Value to be written to specified signal.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  20=
8   *
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  20=
9   * This function sets the direction of specified GPIO signal as output.
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  21=
0   *
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  21=
1   * Return:
8fd1942dec9edd drivers/gpio/gpio-xilinx.c Michal Simek       2013-07-19  21=
2   * If all GPIO signals of GPIO chip is configured as input then it retur=
ns
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
3   * error otherwise it returns 0.
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
4   */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
5  static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int va=
l)
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
6  {
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
7  	unsigned long flags;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12 @21=
8  	struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  21=
9  	struct xgpio_instance *chip =3D
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
0  	    container_of(mm_gc, struct xgpio_instance, mmchip);
e9a98626baf3b3 drivers/gpio/gpio-xilinx.c John Linn          2012-06-29  22=
1  	void __iomem *regs =3D mm_gc->regs;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
2  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
3  	spin_lock_irqsave(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
4  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
5  	/* Write state of GPIO signal */
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
6  	if (val)
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  22=
7  		chip->gpio_state |=3D BIT(gpio);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  22=
8  	else
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  22=
9  		chip->gpio_state &=3D ~BIT(gpio);
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29  23=
0  	xgpio_writereg(regs + chip->offset + XGPIO_DATA_OFFSET,
b23d352f6774a3 drivers/gpio/gpio-xilinx.c Michal Simek       2013-05-29  23=
1  		       chip->gpio_state);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
2  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
3  	/* Clear the GPIO bit in shadow register and set direction as output */
568fae334bb6ea drivers/gpio/gpio-xilinx.c Michal Simek       2013-06-03  23=
4  	chip->gpio_dir &=3D ~BIT(gpio);
fb2379e7035e98 drivers/gpio/gpio-xilinx.c Michal Simek       2012-10-19  23=
5  	xgpio_writereg(regs + chip->offset + XGPIO_TRI_OFFSET, chip->gpio_dir);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
6  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
7  	spin_unlock_irqrestore(&chip->gpio_lock, flags);
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
8  =

0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  23=
9  	return 0;
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  24=
0  }
0bcb6069a6e1af drivers/gpio/xilinx_gpio.c John Linn          2008-11-12  24=
1  =


:::::: The code at line 68 was first introduced by commit
:::::: 0bcb6069a6e1af5c114a2a8873ec43ada8933596 GPIO: add new Xilinx driver=
 for powerpc

:::::: TO: John Linn <john.linn@xilinx.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8049642298664415165==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8049642298664415165==--

