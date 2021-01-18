Content-Type: multipart/mixed; boundary="===============3385235491057606434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 1543/4500] drivers/gpio/gpio-tegra.c:364:7: error: 'struct irq_data' has no member named 'parent_data'
Date: Mon, 18 Jan 2021 19:24:02 +0800
Message-ID: <202101181956.BRa7xLy1-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3385235491057606434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   93bf8b946e5f9a0b0c68155597b53fd8ccce2827
commit: efcdca286eefb248d15a49a32a802ed11146e65e [1543/4500] gpio: tegra: C=
onvert to gpio_irq_chip
config: h8300-randconfig-r012-20210118 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Defcdca286eefb248d15a49a32a802ed11146e65e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout efcdca286eefb248d15a49a32a802ed11146e65e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_irq_set_type':
>> drivers/gpio/gpio-tegra.c:364:7: error: 'struct irq_data' has no member =
named 'parent_data'
     364 |  if (d->parent_data)
         |       ^~
>> drivers/gpio/gpio-tegra.c:365:9: error: implicit declaration of function=
 'irq_chip_set_type_parent' [-Werror=3Dimplicit-function-declaration]
     365 |   ret =3D irq_chip_set_type_parent(d, type);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_child_to_parent_hwirq=
':
>> drivers/gpio/gpio-tegra.c:439:27: error: 'struct gpio_irq_chip' has no m=
ember named 'child_offset_to_irq'
     439 |  *parent_hwirq =3D chip->irq.child_offset_to_irq(chip, hwirq);
         |                           ^
   drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_populate_parent_fwspe=
c':
>> drivers/gpio/gpio-tegra.c:454:28: error: 'struct gpio_irq_chip' has no m=
ember named 'parent_domain'
     454 |  fwspec->fwnode =3D chip->irq.parent_domain->fwnode;
         |                            ^
   drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_irq_set_affinity':
   drivers/gpio/gpio-tegra.c:566:10: error: 'struct irq_data' has no member=
 named 'parent_data'
     566 |  if (data->parent_data)
         |          ^~
>> drivers/gpio/gpio-tegra.c:567:10: error: implicit declaration of functio=
n 'irq_chip_set_affinity_parent'; did you mean 'irq_set_affinity_hint'? [-W=
error=3Dimplicit-function-declaration]
     567 |   return irq_chip_set_affinity_parent(data, dest, force);
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          irq_set_affinity_hint
   drivers/gpio/gpio-tegra.c: In function 'tegra_gpio_probe':
>> drivers/gpio/gpio-tegra.c:730:5: error: 'struct gpio_irq_chip' has no me=
mber named 'fwnode'
     730 |  irq->fwnode =3D of_node_to_fwnode(pdev->dev.of_node);
         |     ^~
>> drivers/gpio/gpio-tegra.c:731:5: error: 'struct gpio_irq_chip' has no me=
mber named 'child_to_parent_hwirq'
     731 |  irq->child_to_parent_hwirq =3D tegra_gpio_child_to_parent_hwirq;
         |     ^~
>> drivers/gpio/gpio-tegra.c:732:5: error: 'struct gpio_irq_chip' has no me=
mber named 'populate_parent_alloc_arg'
     732 |  irq->populate_parent_alloc_arg =3D tegra_gpio_populate_parent_f=
wspec;
         |     ^~
   drivers/gpio/gpio-tegra.c:742:6: error: 'struct gpio_irq_chip' has no me=
mber named 'parent_domain'
     742 |   irq->parent_domain =3D irq_find_host(np);
         |      ^~
   drivers/gpio/gpio-tegra.c:745:11: error: 'struct gpio_irq_chip' has no m=
ember named 'parent_domain'
     745 |   if (!irq->parent_domain)
         |           ^~
   cc1: some warnings being treated as errors


vim +364 drivers/gpio/gpio-tegra.c

   301	=

   302	static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int =
type)
   303	{
   304		unsigned int gpio =3D d->hwirq, port =3D GPIO_PORT(gpio), lvl_type;
   305		struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
   306		struct tegra_gpio_info *tgi =3D gpiochip_get_data(chip);
   307		struct tegra_gpio_bank *bank;
   308		unsigned long flags;
   309		int ret;
   310		u32 val;
   311	=

   312		bank =3D &tgi->bank_info[GPIO_BANK(d->hwirq)];
   313	=

   314		switch (type & IRQ_TYPE_SENSE_MASK) {
   315		case IRQ_TYPE_EDGE_RISING:
   316			lvl_type =3D GPIO_INT_LVL_EDGE_RISING;
   317			break;
   318	=

   319		case IRQ_TYPE_EDGE_FALLING:
   320			lvl_type =3D GPIO_INT_LVL_EDGE_FALLING;
   321			break;
   322	=

   323		case IRQ_TYPE_EDGE_BOTH:
   324			lvl_type =3D GPIO_INT_LVL_EDGE_BOTH;
   325			break;
   326	=

   327		case IRQ_TYPE_LEVEL_HIGH:
   328			lvl_type =3D GPIO_INT_LVL_LEVEL_HIGH;
   329			break;
   330	=

   331		case IRQ_TYPE_LEVEL_LOW:
   332			lvl_type =3D GPIO_INT_LVL_LEVEL_LOW;
   333			break;
   334	=

   335		default:
   336			return -EINVAL;
   337		}
   338	=

   339		raw_spin_lock_irqsave(&bank->lvl_lock[port], flags);
   340	=

   341		val =3D tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
   342		val &=3D ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
   343		val |=3D lvl_type << GPIO_BIT(gpio);
   344		tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
   345	=

   346		raw_spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
   347	=

   348		tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
   349		tegra_gpio_enable(tgi, gpio);
   350	=

   351		ret =3D gpiochip_lock_as_irq(&tgi->gc, gpio);
   352		if (ret) {
   353			dev_err(tgi->dev,
   354				"unable to lock Tegra GPIO %u as IRQ\n", gpio);
   355			tegra_gpio_disable(tgi, gpio);
   356			return ret;
   357		}
   358	=

   359		if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
   360			irq_set_handler_locked(d, handle_level_irq);
   361		else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
   362			irq_set_handler_locked(d, handle_edge_irq);
   363	=

 > 364		if (d->parent_data)
 > 365			ret =3D irq_chip_set_type_parent(d, type);
   366	=

   367		return ret;
   368	}
   369	=

   370	static void tegra_gpio_irq_shutdown(struct irq_data *d)
   371	{
   372		struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
   373		struct tegra_gpio_info *tgi =3D gpiochip_get_data(chip);
   374		unsigned int gpio =3D d->hwirq;
   375	=

   376		tegra_gpio_irq_mask(d);
   377		gpiochip_unlock_as_irq(&tgi->gc, gpio);
   378	}
   379	=

   380	static void tegra_gpio_irq_handler(struct irq_desc *desc)
   381	{
   382		struct tegra_gpio_info *tgi =3D irq_desc_get_handler_data(desc);
   383		struct irq_chip *chip =3D irq_desc_get_chip(desc);
   384		struct irq_domain *domain =3D tgi->gc.irq.domain;
   385		unsigned int irq =3D irq_desc_get_irq(desc);
   386		struct tegra_gpio_bank *bank =3D NULL;
   387		unsigned int port, pin, gpio, i;
   388		bool unmasked =3D false;
   389		unsigned long sta;
   390		u32 lvl;
   391	=

   392		for (i =3D 0; i < tgi->bank_count; i++) {
   393			if (tgi->irqs[i] =3D=3D irq) {
   394				bank =3D &tgi->bank_info[i];
   395				break;
   396			}
   397		}
   398	=

   399		if (WARN_ON(bank =3D=3D NULL))
   400			return;
   401	=

   402		chained_irq_enter(chip, desc);
   403	=

   404		for (port =3D 0; port < 4; port++) {
   405			gpio =3D tegra_gpio_compose(bank->bank, port, 0);
   406			sta =3D tegra_gpio_readl(tgi, GPIO_INT_STA(tgi, gpio)) &
   407				tegra_gpio_readl(tgi, GPIO_INT_ENB(tgi, gpio));
   408			lvl =3D tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
   409	=

   410			for_each_set_bit(pin, &sta, 8) {
   411				tegra_gpio_writel(tgi, 1 << pin,
   412						  GPIO_INT_CLR(tgi, gpio));
   413	=

   414				/* if gpio is edge triggered, clear condition
   415				 * before executing the handler so that we don't
   416				 * miss edges
   417				 */
   418				if (!unmasked && lvl & (0x100 << pin)) {
   419					unmasked =3D true;
   420					chained_irq_exit(chip, desc);
   421				}
   422	=

   423				irq =3D irq_find_mapping(domain, gpio + pin);
   424				if (WARN_ON(irq =3D=3D 0))
   425					continue;
   426	=

   427				generic_handle_irq(irq);
   428			}
   429		}
   430	=

   431		if (!unmasked)
   432			chained_irq_exit(chip, desc);
   433	}
   434	=

   435	static int tegra_gpio_child_to_parent_hwirq(struct gpio_chip *chip, =
unsigned int hwirq,
   436						    unsigned int type, unsigned int *parent_hwirq,
   437						    unsigned int *parent_type)
   438	{
 > 439		*parent_hwirq =3D chip->irq.child_offset_to_irq(chip, hwirq);
   440		*parent_type =3D type;
   441	=

   442		return 0;
   443	}
   444	=

   445	static void *tegra_gpio_populate_parent_fwspec(struct gpio_chip *chi=
p, unsigned int parent_hwirq,
   446						       unsigned int parent_type)
   447	{
   448		struct irq_fwspec *fwspec;
   449	=

   450		fwspec =3D kmalloc(sizeof(*fwspec), GFP_KERNEL);
   451		if (!fwspec)
   452			return NULL;
   453	=

 > 454		fwspec->fwnode =3D chip->irq.parent_domain->fwnode;
   455		fwspec->param_count =3D 3;
   456		fwspec->param[0] =3D 0;
   457		fwspec->param[1] =3D parent_hwirq;
   458		fwspec->param[2] =3D parent_type;
   459	=

   460		return fwspec;
   461	}
   462	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3385235491057606434==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3385235491057606434==--

