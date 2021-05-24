Content-Type: multipart/mixed; boundary="===============1475464956718486948=="
MIME-Version: 1.0
From: Huan Feng <huan.feng@starfivetech.com>
To: kbuild-all@lists.01.org
Subject: Re: [stffrdhrn:starfive-bad-dcache-flush 2/39] drivers/gpio/gpio-starfive-vic.c:522:8: error: implicit declaration of function 'devm_request_irq'
Date: Mon, 24 May 2021 01:39:14 +0000
Message-ID: <BCEC1050-F930-4BEF-8201-75C09359BE71@starfivetech.com>
In-Reply-To: <202105222357.YzsLZZiy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1475464956718486948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi:
	I can not get the source code from github. =

	Starfive vic gpio and rng hardware is on Starfive vic7100 Soc, which is RI=
SCV ARCH. So maybe they are not used on other Soc or ARCH.
	=

	May be the attach patch file is usefull.

-- =


Best Regards,
 =

Huan Feng
E-mail: huan.feng(a)starfivetch.com
Mobile.: 18111603721
Address: ChengDu China

=EF=BB=BFOn 2021/5/22, 11:14 PM, "kernel test robot" <lkp@intel.com> wrot=
e:

    tree:   https://github.com/stffrdhrn/linux.git starfive-bad-dcache-flush
    head:   a5c948a9cc2b8944f00056c067fb7bde19b34843
    commit: 4482cc40078eac952205e48d9937419f5808d6a2 [2/39] gpio: starfive-=
vic: Add StarFive VIC GPIO driver
    config: powerpc64-randconfig-r012-20210522 (attached as .config)
    compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e8=
4a9b9bb3051c35dea993cdad7b3d2575638f85)
    reproduce (this is a W=3D1 build):
            wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
            chmod +x ~/bin/make.cross
            # install powerpc64 cross compiling tool for clang build
            # apt-get install binutils-powerpc64-linux-gnu
            # https://github.com/stffrdhrn/linux/commit/4482cc40078eac95220=
5e48d9937419f5808d6a2
            git remote add stffrdhrn https://github.com/stffrdhrn/linux.git
            git fetch --no-tags stffrdhrn starfive-bad-dcache-flush
            git checkout 4482cc40078eac952205e48d9937419f5808d6a2
            # save the attached .config to linux build tree
            COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dpowerpc64 =


    If you fix the issue, kindly add following tag as appropriate
    Reported-by: kernel test robot <lkp@intel.com>

    All error/warnings (new ones prefixed by >>):

       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:202:1: note: expanded from here
       __do_insb
       ^
       arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__d=
o_insb'
       #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b=
), (n))
                                              ~~~~~~~~~~~~~~~~~~~~~^
       In file included from drivers/gpio/gpio-starfive-vic.c:22:
       In file included from include/linux/gpio/driver.h:7:
       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:204:1: note: expanded from here
       __do_insw
       ^
       arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__d=
o_insw'
       #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b=
), (n))
                                              ~~~~~~~~~~~~~~~~~~~~~^
       In file included from drivers/gpio/gpio-starfive-vic.c:22:
       In file included from include/linux/gpio/driver.h:7:
       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:206:1: note: expanded from here
       __do_insl
       ^
       arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__d=
o_insl'
       #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b=
), (n))
                                              ~~~~~~~~~~~~~~~~~~~~~^
       In file included from drivers/gpio/gpio-starfive-vic.c:22:
       In file included from include/linux/gpio/driver.h:7:
       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned lo=
ng c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:208:1: note: expanded from here
       __do_outsb
       ^
       arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__d=
o_outsb'
       #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b=
),(n))
                                               ~~~~~~~~~~~~~~~~~~~~~^
       In file included from drivers/gpio/gpio-starfive-vic.c:22:
       In file included from include/linux/gpio/driver.h:7:
       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned lo=
ng c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:210:1: note: expanded from here
       __do_outsw
       ^
       arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__d=
o_outsw'
       #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b=
),(n))
                                               ~~~~~~~~~~~~~~~~~~~~~^
       In file included from drivers/gpio/gpio-starfive-vic.c:22:
       In file included from include/linux/gpio/driver.h:7:
       In file included from include/linux/irq.h:20:
       In file included from include/linux/io.h:13:
       In file included from arch/powerpc/include/asm/io.h:619:
       arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
       DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned lo=
ng c),
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_=
PCI_AC_NORET'
                       __do_##name al;                                 \
                       ^~~~~~~~~~~~~~
       <scratch space>:212:1: note: expanded from here
       __do_outsl
       ^
       arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__d=
o_outsl'
       #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b=
),(n))
                                               ~~~~~~~~~~~~~~~~~~~~~^
    >> drivers/gpio/gpio-starfive-vic.c:348:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_dout_reverse' [-Wmissing-prototypes]
       void sf_vic_gpio_dout_reverse(int gpio, int en)
            ^
       drivers/gpio/gpio-starfive-vic.c:348:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_dout_reverse(int gpio, int en)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:367:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_dout_value' [-Wmissing-prototypes]
       void sf_vic_gpio_dout_value(int gpio, int v)
            ^
       drivers/gpio/gpio-starfive-vic.c:367:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_dout_value(int gpio, int v)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:385:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_dout_low' [-Wmissing-prototypes]
       void sf_vic_gpio_dout_low(int gpio)
            ^
       drivers/gpio/gpio-starfive-vic.c:385:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_dout_low(int gpio)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:391:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_dout_high' [-Wmissing-prototypes]
       void sf_vic_gpio_dout_high(int gpio)
            ^
       drivers/gpio/gpio-starfive-vic.c:391:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_dout_high(int gpio)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:397:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_doen_reverse' [-Wmissing-prototypes]
       void sf_vic_gpio_doen_reverse(int gpio, int en)
            ^
       drivers/gpio/gpio-starfive-vic.c:397:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_doen_reverse(int gpio, int en)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:416:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_doen_value' [-Wmissing-prototypes]
       void sf_vic_gpio_doen_value(int gpio, int v)
            ^
       drivers/gpio/gpio-starfive-vic.c:416:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_doen_value(int gpio, int v)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:435:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_doen_low' [-Wmissing-prototypes]
       void sf_vic_gpio_doen_low(int gpio)
            ^
       drivers/gpio/gpio-starfive-vic.c:435:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_doen_low(int gpio)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:441:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_doen_high' [-Wmissing-prototypes]
       void sf_vic_gpio_doen_high(int gpio)
            ^
       drivers/gpio/gpio-starfive-vic.c:441:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_doen_high(int gpio)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:447:6: warning: no previous prototy=
pe for function 'sf_vic_gpio_manual' [-Wmissing-prototypes]
       void sf_vic_gpio_manual(int offset, int v)
            ^
       drivers/gpio/gpio-starfive-vic.c:447:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
       void sf_vic_gpio_manual(int offset, int v)
       ^
       static =

    >> drivers/gpio/gpio-starfive-vic.c:522:8: error: implicit declaration =
of function 'devm_request_irq' [-Werror,-Wimplicit-function-declaration]
               ret =3D devm_request_irq(dev, irq, starfive_irq_handler, IRQ=
F_SHARED,
                     ^
       drivers/gpio/gpio-starfive-vic.c:522:8: note: did you mean 'can_requ=
est_irq'?
       include/linux/irq.h:701:12: note: 'can_request_irq' declared here
       extern int can_request_irq(unsigned int irq, unsigned long irqflags);
                  ^
    >> drivers/gpio/gpio-starfive-vic.c:522:57: error: use of undeclared id=
entifier 'IRQF_SHARED'
               ret =3D devm_request_irq(dev, irq, starfive_irq_handler, IRQ=
F_SHARED,
                                                                      ^
       21 warnings and 2 errors generated.


    vim +/devm_request_irq +522 drivers/gpio/gpio-starfive-vic.c

       347	=

     > 348	void sf_vic_gpio_dout_reverse(int gpio, int en)
       349	{
       350		unsigned int value;
       351		int offset;
       352	=

       353		if (!gpio_base)
       354			return;
       355	=

       356		offset =3D gpio * 8 + GPIO_DOUT_X_REG;
       357	=

       358		spin_lock(&sfg_lock);
       359		value =3D ioread32(gpio_base + offset);
       360		value &=3D ~(0x1 << 31);
       361		value |=3D (en & 0x1) << 31;
       362		iowrite32(value, gpio_base + offset);
       363		spin_unlock(&sfg_lock);
       364	}
       365	EXPORT_SYMBOL_GPL(sf_vic_gpio_dout_reverse);
       366	=

     > 367	void sf_vic_gpio_dout_value(int gpio, int v)
       368	{
       369		unsigned int value;
       370		int offset;
       371	=

       372		if (!gpio_base)
       373			return;
       374	=

       375		offset =3D gpio * 8 + GPIO_DOUT_X_REG;
       376		spin_lock(&sfg_lock);
       377		value =3D ioread32(gpio_base + offset);
       378		value &=3D ~(0xFF);
       379		value |=3D (v&0xFF);
       380		iowrite32(value, gpio_base + offset);
       381		spin_unlock(&sfg_lock);
       382	}
       383	EXPORT_SYMBOL_GPL(sf_vic_gpio_dout_value);
       384	=

     > 385	void sf_vic_gpio_dout_low(int gpio)
       386	{
       387		sf_vic_gpio_dout_value(gpio, 0);
       388	}
       389	EXPORT_SYMBOL_GPL(sf_vic_gpio_dout_low);
       390	=

     > 391	void sf_vic_gpio_dout_high(int gpio)
       392	{
       393		sf_vic_gpio_dout_value(gpio, 1);
       394	}
       395	EXPORT_SYMBOL_GPL(sf_vic_gpio_dout_high);
       396	=

     > 397	void sf_vic_gpio_doen_reverse(int gpio, int en)
       398	{
       399		unsigned int value;
       400		int offset;
       401	=

       402		if (!gpio_base)
       403			return;
       404	=

       405		offset =3D gpio * 8 + GPIO_DOEN_X_REG;
       406	=

       407		spin_lock(&sfg_lock);
       408		value =3D ioread32(gpio_base + offset);
       409		value &=3D ~(0x1 << 31);
       410		value |=3D (en & 0x1) << 31;
       411		iowrite32(value, gpio_base + offset);
       412		spin_unlock(&sfg_lock);
       413	}
       414	EXPORT_SYMBOL_GPL(sf_vic_gpio_doen_reverse);
       415	=

     > 416	void sf_vic_gpio_doen_value(int gpio, int v)
       417	{
       418		unsigned int value;
       419		int offset;
       420	=

       421		if (!gpio_base)
       422			return;
       423	=

       424		offset =3D gpio * 8 + GPIO_DOEN_X_REG;
       425	=

       426		spin_lock(&sfg_lock);
       427		value =3D ioread32(gpio_base + offset);
       428		value &=3D ~(0xFF);
       429		value |=3D (v&0xFF);
       430		iowrite32(value, gpio_base + offset);
       431		spin_unlock(&sfg_lock);
       432	}
       433	EXPORT_SYMBOL_GPL(sf_vic_gpio_doen_value);
       434	=

     > 435	void sf_vic_gpio_doen_low(int gpio)
       436	{
       437		sf_vic_gpio_doen_value(gpio, 0);
       438	}
       439	EXPORT_SYMBOL_GPL(sf_vic_gpio_doen_low);
       440	=

     > 441	void sf_vic_gpio_doen_high(int gpio)
       442	{
       443		sf_vic_gpio_doen_value(gpio, 1);
       444	}
       445	EXPORT_SYMBOL_GPL(sf_vic_gpio_doen_high);
       446	=

     > 447	void sf_vic_gpio_manual(int offset, int v)
       448	{
       449		unsigned int value;
       450	=

       451		if (!gpio_base)
       452			return ;
       453	=

       454		spin_lock(&sfg_lock);
       455		value =3D ioread32(gpio_base + offset);
       456		value &=3D ~(0xFF);
       457		value |=3D (v&0xFF);
       458		iowrite32(value, gpio_base + offset);
       459		spin_unlock(&sfg_lock);
       460	}
       461	EXPORT_SYMBOL_GPL(sf_vic_gpio_manual);
       462	=

       463	static int starfive_gpio_probe(struct platform_device *pdev)
       464	{
       465		struct device *dev =3D &pdev->dev;
       466		struct starfive_gpio *chip;
       467		struct gpio_irq_chip *girq;
       468		struct resource *res;
       469		int irq, ret, ngpio;
       470	=

       471		chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
       472		if (!chip) {
       473			dev_err(dev, "out of memory\n");
       474			return -ENOMEM;
       475		}
       476	=

       477		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
       478		chip->base =3D devm_ioremap_resource(dev, res);
       479		if (IS_ERR(chip->base)) {
       480			dev_err(dev, "failed to allocate device memory\n");
       481			return PTR_ERR(chip->base);
       482		}
       483		gpio_base =3D chip->base ;
       484	=

       485		irq =3D platform_get_irq(pdev, 0);
       486		if (irq < 0) {
       487			dev_err(dev, "Cannot get IRQ resource\n");
       488			return irq;
       489		}
       490	=

       491		raw_spin_lock_init(&chip->lock);
       492		chip->gc.direction_input =3D starfive_direction_input;
       493		chip->gc.direction_output =3D starfive_direction_output;
       494		chip->gc.get_direction =3D starfive_get_direction;
       495		chip->gc.get =3D starfive_get_value;
       496		chip->gc.set =3D starfive_set_value;
       497		chip->gc.base =3D 0;
       498		chip->gc.ngpio =3D 64;
       499		chip->gc.label =3D dev_name(dev);
       500		chip->gc.parent =3D dev;
       501		chip->gc.owner =3D THIS_MODULE;
       502	=

       503		girq =3D &chip->gc.irq;
       504		girq->chip =3D &starfive_irqchip;
       505		girq->parent_handler =3D NULL;
       506		girq->num_parents =3D 0;
       507		girq->parents =3D NULL;
       508		girq->default_type =3D IRQ_TYPE_NONE;
       509		girq->handler =3D handle_simple_irq;
       510	=

       511		ret =3D gpiochip_add_data(&chip->gc, chip);
       512		if (ret) {
       513			dev_err(dev, "gpiochip_add_data ret=3D%d!\n", ret);
       514			return ret;
       515		}
       516	=

       517		/* Disable all GPIO interrupts before enabling parent interrupt=
s */
       518		iowrite32(0, chip->base + GPIO_IE_HIGH);
       519		iowrite32(0, chip->base + GPIO_IE_LOW);
       520		chip->enabled =3D 0;
       521	=

     > 522		ret =3D devm_request_irq(dev, irq, starfive_irq_handler, IRQF_S=
HARED,
       523				dev_name(dev), chip);
       524		if (ret) {
       525			dev_err(dev, "IRQ handler registering failed (%d)\n", ret);
       526			return ret;
       527		}
       528	=

       529		writel_relaxed(1, chip->base + GPIO_EN);
       530	=

       531		dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", ngpio=
);
       532	=

       533		return 0;
       534	}
       535	=


    ---
    0-DAY CI Kernel Test Service, Intel Corporation
    https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1475464956718486948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="github_starfive.patch"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vS2NvbmZpZyBiL2RyaXZlcnMvY2hh
ci9od19yYW5kb20vS2NvbmZpZwppbmRleCBlNTE3YTJmLi4wMzAzNmY2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL0tjb25maWcKKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRv
bS9LY29uZmlnCkBAIC0zMzcsOCArMzM3LDggQEAgY29uZmlnIEhXX1JBTkRPTV9QT1dFUk5WCgog
Y29uZmlnIEhXX1JBTkRPTV9TVEFSRklWRV9WSUMKIAl0cmlzdGF0ZSAiU3RhcmZpdmUgVklDIFJh
bmRvbSBOdW1iZXIgR2VuZXJhdG9yIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBTT0NfU1RBUkZJVkVf
VklDNzEwMAogCWRlcGVuZHMgb24gSFdfUkFORE9NCi0JZGVmYXVsdCB5IGlmIFNPQ19TVEFSRklW
RV9WSUM3MTAwCiAJaGVscAogCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMga2VybmVsLXNpZGUgc3Vw
cG9ydCBmb3IgdGhlIFJhbmRvbSBOdW1iZXIKIAkgIEdlbmVyYXRvciBoYXJkd2FyZSBmb3VuZCBv
biBTdGFyZml2ZSBWSUMgU29DLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9k
cml2ZXJzL2dwaW8vS2NvbmZpZwppbmRleCAyMWM2MTFhLi5kZGFmMTU0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwaW8vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZwpAQCAtNTE3LDkg
KzUxNyw5IEBAIGNvbmZpZyBHUElPX1NJRklWRQoKIGNvbmZpZyBHUElPX1NUQVJGSVZFX1ZJQwog
CWJvb2wgIlN0YXJmaXZlIFZJQyBHUElPIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBTT0NfU1RBUkZJ
VkVfVklDNzEwMAogCWRlcGVuZHMgb24gT0ZfR1BJTwogCXNlbGVjdCBHUElPTElCX0lSUUNISVAK
LQlkZWZhdWx0IHkgaWYgU09DX1NUQVJGSVZFX1ZJQzcxMDAKIAloZWxwCiAJICBTYXkgeWVzIGhl
cmUgdG8gc3VwcG9ydCB0aGUgR1BJTyBkZXZpY2Ugb24gU3RhcmZpdmUgVklDIFNvQ3MuCgo=

--===============1475464956718486948==--

