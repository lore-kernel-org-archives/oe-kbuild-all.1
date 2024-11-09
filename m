Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45808145A03
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731191840; cv=none; b=nUZ5ehyYqf+OKDHaM5qA2vczE29Shee7kG/upNXA8nP3ajX1h+GjcM1PpL/5cWiUWxdWIvZuuf7CPbkWvnU0XFjfb49LdYv21J5wnlgvRZ9xMG2D7Q2ecsj8gd6e96O9Ldf4Ox3mJ/znvGXaw79qXRO0F90zCnmhTBkTHKhi3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731191840; c=relaxed/simple;
	bh=vntP/IK8D9/qIATzCZyBTZUoIR9j7ppHA6DlshbUfLg=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q8esxK2BAMtz//4ZL95Q+44jAdSs4+m673LmujCOCpevd2iuiPVi8Vh/4KzWXAHujC+YkbRM/a73/9Wn7WkGjNfQlRHX7wuc6jReokhnil8IptOzt4FmILi2J8WLwm3vOVeRujL48CZJmI5DhxcK3ecZ6AUFvr20WQwOvkZAJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=J3nePtOK; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="J3nePtOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZjF6Gc58zFgVTwqasv8Gz2rgKyo+4GgR9VWCXTSLr4=;
  b=J3nePtOKuohXpY+S4QaAOynKr42quCi5PBJ8bLOsql556/ueoGZeaRGr
   WddIZ3KWxNiM/Y2wl1dbHZyOe6xiD2Bu1lwXW6Bv3+oV+h/R9hz+tqLjC
   AjE62ss1cMiMB1USI4SCi157zW01vriS/R7SqjD0SxLnY28gHGhuAXwD2
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,142,1728943200"; 
   d="scan'208";a="193071741"
Received: from unknown (HELO hadrien) ([50.226.245.43])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 23:36:04 +0100
Date: Sat, 9 Nov 2024 17:36:03 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5092/10559] drivers/gpio/gpio-grgpio.c:429:36-48:
 opportunity for str_on_off(priv -> domain) (fwd)
Message-ID: <79b4da-b1e4-ac13-ebd6-17c184854c8@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 10 Nov 2024 04:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5092/10559] drivers/gpio/gpio-grgpio.c:429:36-48:
    opportunity for str_on_off(priv -> domain)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: bc40668def384256673bc18296865869c4a4187b [5092/10559] gpio: grgpio: drop Kconfig dependency on OF_GPIO
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r054-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100434.eQN8KQ5v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411100434.eQN8KQ5v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-grgpio.c:429:36-48: opportunity for str_on_off(priv -> domain)

vim +429 drivers/gpio/gpio-grgpio.c

08ffb2229fafc2 Andreas Larsson                  2013-04-17  327
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  328  static int grgpio_probe(struct platform_device *ofdev)
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  329  {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  330  	struct device_node *np = ofdev->dev.of_node;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  331  	void  __iomem *regs;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  332  	struct gpio_chip *gc;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  333  	struct grgpio_priv *priv;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  334  	int err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  335  	u32 prop;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  336  	s32 *irqmap;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  337  	int size;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  338  	int i;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  339
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  340  	priv = devm_kzalloc(&ofdev->dev, sizeof(*priv), GFP_KERNEL);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  341  	if (!priv)
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  342  		return -ENOMEM;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  343
01d078aa9b90c1 Enrico Weigelt, metux IT consult 2019-06-17  344  	regs = devm_platform_ioremap_resource(ofdev, 0);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  345  	if (IS_ERR(regs))
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  346  		return PTR_ERR(regs);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  347
0f4630f3720e7e Linus Walleij                    2015-12-04  348  	gc = &priv->gc;
0f4630f3720e7e Linus Walleij                    2015-12-04  349  	err = bgpio_init(gc, &ofdev->dev, 4, regs + GRGPIO_DATA,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  350  			 regs + GRGPIO_OUTPUT, NULL, regs + GRGPIO_DIR, NULL,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  351  			 BGPIOF_BIG_ENDIAN_BYTE_ORDER);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  352  	if (err) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  353  		dev_err(&ofdev->dev, "bgpio_init() failed\n");
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  354  		return err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  355  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  356
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  357  	priv->regs = regs;
0f4630f3720e7e Linus Walleij                    2015-12-04  358  	priv->imask = gc->read_reg(regs + GRGPIO_IMASK);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  359  	priv->dev = &ofdev->dev;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  360
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  361  	gc->owner = THIS_MODULE;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  362  	gc->to_irq = grgpio_to_irq;
7eb6ce2f272336 Rob Herring                      2017-07-18  363  	gc->label = devm_kasprintf(&ofdev->dev, GFP_KERNEL, "%pOF", np);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  364  	gc->base = -1;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  365
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  366  	err = of_property_read_u32(np, "nbits", &prop);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  367  	if (err || prop <= 0 || prop > GRGPIO_MAX_NGPIO) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  368  		gc->ngpio = GRGPIO_MAX_NGPIO;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  369  		dev_dbg(&ofdev->dev,
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  370  			"No or invalid nbits property: assume %d\n", gc->ngpio);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  371  	} else {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  372  		gc->ngpio = prop;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  373  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  374
08ffb2229fafc2 Andreas Larsson                  2013-04-17  375  	/*
08ffb2229fafc2 Andreas Larsson                  2013-04-17  376  	 * The irqmap contains the index values indicating which underlying irq,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  377  	 * if anyone, is connected to that line
08ffb2229fafc2 Andreas Larsson                  2013-04-17  378  	 */
08ffb2229fafc2 Andreas Larsson                  2013-04-17  379  	irqmap = (s32 *)of_get_property(np, "irqmap", &size);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  380  	if (irqmap) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  381  		if (size < gc->ngpio) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  382  			dev_err(&ofdev->dev,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  383  				"irqmap shorter than ngpio (%d < %d)\n",
08ffb2229fafc2 Andreas Larsson                  2013-04-17  384  				size, gc->ngpio);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  385  			return -EINVAL;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  386  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  387
08ffb2229fafc2 Andreas Larsson                  2013-04-17  388  		priv->domain = irq_domain_add_linear(np, gc->ngpio,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  389  						     &grgpio_irq_domain_ops,
08ffb2229fafc2 Andreas Larsson                  2013-04-17  390  						     priv);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  391  		if (!priv->domain) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  392  			dev_err(&ofdev->dev, "Could not add irq domain\n");
08ffb2229fafc2 Andreas Larsson                  2013-04-17  393  			return -EINVAL;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  394  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  395
08ffb2229fafc2 Andreas Larsson                  2013-04-17  396  		for (i = 0; i < gc->ngpio; i++) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  397  			struct grgpio_lirq *lirq;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  398  			int ret;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  399
08ffb2229fafc2 Andreas Larsson                  2013-04-17  400  			lirq = &priv->lirqs[i];
08ffb2229fafc2 Andreas Larsson                  2013-04-17  401  			lirq->index = irqmap[i];
08ffb2229fafc2 Andreas Larsson                  2013-04-17  402
08ffb2229fafc2 Andreas Larsson                  2013-04-17  403  			if (lirq->index < 0)
08ffb2229fafc2 Andreas Larsson                  2013-04-17  404  				continue;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  405
08ffb2229fafc2 Andreas Larsson                  2013-04-17  406  			ret = platform_get_irq(ofdev, lirq->index);
08ffb2229fafc2 Andreas Larsson                  2013-04-17  407  			if (ret <= 0) {
08ffb2229fafc2 Andreas Larsson                  2013-04-17  408  				/*
08ffb2229fafc2 Andreas Larsson                  2013-04-17  409  				 * Continue without irq functionality for that
08ffb2229fafc2 Andreas Larsson                  2013-04-17  410  				 * gpio line
08ffb2229fafc2 Andreas Larsson                  2013-04-17  411  				 */
08ffb2229fafc2 Andreas Larsson                  2013-04-17  412  				continue;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  413  			}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  414  			priv->uirqs[lirq->index].uirq = ret;
08ffb2229fafc2 Andreas Larsson                  2013-04-17  415  		}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  416  	}
08ffb2229fafc2 Andreas Larsson                  2013-04-17  417
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  418  	platform_set_drvdata(ofdev, priv);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  419
0f4630f3720e7e Linus Walleij                    2015-12-04  420  	err = gpiochip_add_data(gc, priv);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  421  	if (err) {
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  422  		dev_err(&ofdev->dev, "Could not add gpiochip\n");
879828c6ade916 Axel Lin                         2014-12-20  423  		if (priv->domain)
65fdc966c012b6 Pramod Gurav                     2014-10-02  424  			irq_domain_remove(priv->domain);
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  425  		return err;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  426  	}
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  427
08ffb2229fafc2 Andreas Larsson                  2013-04-17  428  	dev_info(&ofdev->dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
08ffb2229fafc2 Andreas Larsson                  2013-04-17 @429  		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  430
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  431  	return 0;
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  432  }
ddb27f3bf771b5 Andreas Larsson                  2013-04-17  433

:::::: The code at line 429 was first introduced by commit
:::::: 08ffb2229fafc2c3a696b325a74bf4198d6b91d7 gpio: grgpio: Add irq support

:::::: TO: Andreas Larsson <andreas@gaisler.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
