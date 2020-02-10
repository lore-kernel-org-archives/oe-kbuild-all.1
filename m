Content-Type: multipart/mixed; boundary="===============1214862376061890168=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [gpio:gpio-descriptors-extcon-cleanup 3/4] drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
Date: Tue, 11 Feb 2020 04:28:15 +0800
Message-ID: <202002110451.OyQqNeGg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1214862376061890168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.g=
it gpio-descriptors-extcon-cleanup
head:   9409cd9bbfba06ffdeea264f2376f7bd0baee63a
commit: ab984ecf4e32c42e497dc38bb06d68b005c7e4d0 [3/4] extcon: gpio: Get co=
nnector type from device property
config: parisc-randconfig-a001-20200210 (attached as .config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout ab984ecf4e32c42e497dc38bb06d68b005c7e4d0
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dparisc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14:0,
                    from include/linux/device.h:15,
                    from include/linux/extcon.h:21,
                    from include/linux/extcon-provider.h:13,
                    from drivers/extcon/extcon-gpio.c:12:
   drivers/extcon/extcon-gpio.c: In function 'gpio_extcon_probe':
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has=
 no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if=
_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __t=
race_if_value(cond))
                                                       ^~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has=
 no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if=
_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __t=
race_if_value(cond))
                                                                ^~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has=
 no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_=
value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~

vim +/if +85 drivers/extcon/extcon-gpio.c

176aa36012135d drivers/extcon/extcon-gpio.c Chanwoo Choi   2017-09-21  @12 =
 #include <linux/extcon-provider.h>
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30   13 =
 #include <linux/gpio/consumer.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   14 =
 #include <linux/init.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   15 =
 #include <linux/interrupt.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   16 =
 #include <linux/kernel.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   17 =
 #include <linux/module.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   18 =
 #include <linux/platform_device.h>
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   19 =
 #include <linux/property.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   20 =
 #include <linux/slab.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   21 =
 #include <linux/workqueue.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   22  =

66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   23 =
 /**
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   24 =
  * struct gpio_extcon_data - A simple GPIO-controlled extcon device state =
container.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   25 =
  * @edev:		Extcon device.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   26 =
  * @work:		Work fired by the interrupt.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   27 =
  * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize,=
 from the debounce
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   28 =
  *			value.
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   29 =
  * @gpiod:		GPIO descriptor for this external connector.
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   30 =
  * @connector_type:	The connector type we're detecting on this extcon, ter=
minated with EXTCON_NONE
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   31 =
  *			One GPIO is one cable, so one type only.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   32 =
  * @check_on_resume:	Boolean describing whether to check the state of gpio
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   33 =
  *			while resuming from sleep.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   34 =
  */
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   35 =
 struct gpio_extcon_data {
60cd62d4f7d681 drivers/extcon/extcon-gpio.c Chanwoo Choi   2014-04-21   36 =
 	struct extcon_dev *edev;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   37 =
 	struct delayed_work work;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   38 =
 	unsigned long debounce_jiffies;
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   39 =
 	struct gpio_desc *gpiod;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   40 =
 	unsigned int connector_type[2];
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   41 =
 	bool check_on_resume;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   42 =
 };
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   43  =

be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   44 =
 static void gpio_extcon_work(struct work_struct *work)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   45 =
 {
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   46 =
 	int state;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   47 =
 	struct gpio_extcon_data	*data =3D
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   48 =
 		container_of(to_delayed_work(work), struct gpio_extcon_data,
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   49 =
 			     work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   50  =

d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   51 =
 	state =3D gpiod_get_value_cansleep(data->gpiod);
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   52 =
 	extcon_set_state_sync(data->edev, data->connector_type[0], state);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   53 =
 }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   54  =

be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   55 =
 static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   56 =
 {
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   57 =
 	struct gpio_extcon_data *data =3D dev_id;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   58  =

60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   59 =
 	queue_delayed_work(system_power_efficient_wq, &data->work,
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   60 =
 			      data->debounce_jiffies);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   61 =
 	return IRQ_HANDLED;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   62 =
 }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   63  =

44f34fd4a7f804 drivers/extcon/extcon-gpio.c Bill Pemberton 2012-11-19   64 =
 static int gpio_extcon_probe(struct platform_device *pdev)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   65 =
 {
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   66 =
 	struct gpio_extcon_data *data;
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   67 =
 	struct device *dev =3D &pdev->dev;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   68 =
 	unsigned long irq_flags;
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   69 =
 	u32 debounce_usecs;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   70 =
 	u32 connector_type;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   71 =
 	int irq;
1073514b11c221 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-08-29   72 =
 	int ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   73  =

d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   74 =
 	data =3D devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   75 =
 	if (!data)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   76 =
 		return -ENOMEM;
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   77  =

a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   78 =
 	/*
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   79 =
 	 * FIXME: extcon_id represents the unique identifier of external
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   80 =
 	 * connectors such as EXTCON_USB, EXTCON_DISP_HDMI and so on. extcon_id
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   81 =
 	 * is necessary to register the extcon device. But, it's not yet
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   82 =
 	 * developed to get the extcon id from device-tree or others.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   83 =
 	 * On later, it have to be solved.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   84 =
 	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  @85 =
 	if (data->extcon_id > EXTCON_NONE)
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   86 =
 		return -EINVAL;
60cd62d4f7d681 drivers/extcon/extcon-gpio.c Chanwoo Choi   2014-04-21   87  =

d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   88 =
 	data->gpiod =3D devm_gpiod_get(dev, "extcon", GPIOD_IN);
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   89 =
 	if (IS_ERR(data->gpiod))
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   90 =
 		return PTR_ERR(data->gpiod);
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   91 =
 	irq =3D gpiod_to_irq(data->gpiod);
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   92 =
 	if (irq <=3D 0)
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   93 =
 		return irq;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   94  =

8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   95 =
 	/*
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   96 =
 	 * It is unlikely that this is an acknowledged interrupt that goes
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   97 =
 	 * away after handling, what we are looking for are falling edges
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   98 =
 	 * if the signal is active low, and rising edges if the signal is
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   99 =
 	 * active high.
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  100 =
 	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  101 =
 	if (gpiod_is_active_low(data->gpiod))
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  102 =
 		irq_flags =3D IRQF_TRIGGER_FALLING;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  103 =
 	else
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  104 =
 		irq_flags =3D IRQF_TRIGGER_RISING;
4288d9b8edcec7 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-11-22  105  =

ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  106 =
 	ret =3D device_property_read_u32(dev, "extcon-connector-types", &connecto=
r_type);
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  107 =
 	if (ret || !connector_type) {
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  108 =
 		dev_err(dev, "illegal cable type or undefined cable type\n");
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  109 =
 		return -EINVAL;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  110 =
 	}
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  111 =
 	data->connector_type[0] =3D connector_type;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  112 =
 	data->connector_type[1] =3D EXTCON_NONE;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  113  =

de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  114 =
 	/* Allocate the memory of extcon devie and register extcon device */
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  115 =
 	data->edev =3D devm_extcon_dev_allocate(dev, data->connector_type);
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  116 =
 	if (IS_ERR(data->edev)) {
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12  117 =
 		dev_err(dev, "failed to allocate extcon device\n");
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  118 =
 		return -ENOMEM;
338de0ca682ca9 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-09-10  119 =
 	}
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  120  =

17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  121 =
 	ret =3D device_property_read_u32(dev, "input-debounce", &debounce_usecs);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  122 =
 	if (ret || !debounce_usecs) {
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  123 =
 		dev_err(dev, "illegal debounce value, set to 20 ms\n");
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  124 =
 		debounce_usecs =3D 20000;
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  125 =
 	}
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  126 =
 	ret =3D gpiod_set_debounce(data->gpiod, debounce_usecs);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  127 =
 	if (ret)
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  128 =
 		data->debounce_jiffies =3D msecs_to_jiffies(debounce_usecs * 1000);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  129  =

d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12  130 =
 	ret =3D devm_extcon_dev_register(dev, data->edev);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  131 =
 	if (ret < 0)
01eaf2458773b2 drivers/extcon/extcon_gpio.c Axel Lin       2012-06-16  132 =
 		return ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  133  =

60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  134 =
 	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  135  =

de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  136 =
 	/*
b51b387020ee1c drivers/extcon/extcon-gpio.c Moritz Fischer 2015-12-23  137 =
 	 * Request the interrupt of gpio to detect whether external connector
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  138 =
 	 * is attached or detached.
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  139 =
 	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  140 =
 	ret =3D devm_request_any_context_irq(dev, irq,
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  141 =
 					gpio_irq_handler, irq_flags,
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  142 =
 					pdev->name, data);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  143 =
 	if (ret < 0)
d92c2f12f8a940 drivers/extcon/extcon-gpio.c Sangjung Woo   2014-04-21  144 =
 		return ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  145  =

60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  146 =
 	platform_set_drvdata(pdev, data);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  147 =
 	/* Perform initial detection */
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  148 =
 	gpio_extcon_work(&data->work.work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  149  =

be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  150 =
 	return 0;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  151 =
 }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  152  =


:::::: The code at line 85 was first introduced by commit
:::::: 8bc4810b435a3338346efd70e94c4d6fd0863635 extcon: gpio: Request reaso=
nable interrupts

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1214862376061890168==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1214862376061890168==--

