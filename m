Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C41DDD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu44Gd9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826428; x=1732362428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcP+9yadMLYqTUKbEZKxpY6iz3gUuLm6/yrLJej/tOE=;
  b=Bu44Gd9s7S92AUDHEG3xv10tV4iDQ7q/RUdY/AiXZAEM9l3kpxeNuCeu
   2eqQ3FcVunAgL2rRgORoJcwvaO17B51rw36+QV/G/mXb2zd94k6oxNs6t
   95H7WLEmF6fWQmhcyCPBrXsNdbwL3DQtyN42o52Gc/LivGwxhQQRNA3eX
   bhVO8zLla1BDqx0biAxVeaxGPUGklRFHDjJ0/VQtouf8CEH5Nt76hbzpD
   zU7WymvL9Wp27G7NdFNmjlDuUfq6m4uiLb2K1nINaSZO51WFE4cYfnHNM
   9Qr67ZGq8n+Jg7lA34WKNsDU9DGp9ghJWHaoZFcMlL4z+J2ekflfirfgb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382812767"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="382812767"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940906068"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="940906068"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Nov 2023 03:47:05 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6UeF-0002ho-0O;
	Fri, 24 Nov 2023 11:47:03 +0000
Date: Fri, 24 Nov 2023 19:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
Message-ID: <202311241311.JEB1zqm1-lkp@intel.com>
References: <20231120135041.15259-14-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-14-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phy-extend-PHY-package-API-to-support-multiple-global-address/20231120-220405
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231120135041.15259-14-ansuelsmth%40gmail.com
patch subject: [net-next RFC PATCH 13/14] net: phy: add Qualcom QCA807x driver
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231124/202311241311.JEB1zqm1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241311.JEB1zqm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241311.JEB1zqm1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/phy/qca807x.c:342:46: warning: 'struct gpio_chip' declared inside parameter list will not be visible outside of this definition or declaration
     342 | static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
         |                                              ^~~~~~~~~
   drivers/net/phy/qca807x.c: In function 'qca807x_gpio_get_direction':
>> drivers/net/phy/qca807x.c:344:16: error: 'GPIO_LINE_DIRECTION_OUT' undeclared (first use in this function)
     344 |         return GPIO_LINE_DIRECTION_OUT;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c:344:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/phy/qca807x.c: At top level:
   drivers/net/phy/qca807x.c:352:36: warning: 'struct gpio_chip' declared inside parameter list will not be visible outside of this definition or declaration
     352 | static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
         |                                    ^~~~~~~~~
   drivers/net/phy/qca807x.c: In function 'qca807x_gpio_get':
>> drivers/net/phy/qca807x.c:354:42: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
     354 |         struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
         |                                          ^~~~~~~~~~~~~~~~~
>> drivers/net/phy/qca807x.c:354:42: warning: initialization of 'struct qca807x_gpio_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/net/phy/qca807x.c: At top level:
   drivers/net/phy/qca807x.c:362:37: warning: 'struct gpio_chip' declared inside parameter list will not be visible outside of this definition or declaration
     362 | static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
         |                                     ^~~~~~~~~
   drivers/net/phy/qca807x.c: In function 'qca807x_gpio_set':
   drivers/net/phy/qca807x.c:364:42: warning: initialization of 'struct qca807x_gpio_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     364 |         struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
         |                                          ^~~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c: At top level:
   drivers/net/phy/qca807x.c:375:40: warning: 'struct gpio_chip' declared inside parameter list will not be visible outside of this definition or declaration
     375 | static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
         |                                        ^~~~~~~~~
   drivers/net/phy/qca807x.c: In function 'qca807x_gpio_dir_out':
>> drivers/net/phy/qca807x.c:377:26: error: passing argument 1 of 'qca807x_gpio_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     377 |         qca807x_gpio_set(gc, offset, value);
         |                          ^~
         |                          |
         |                          struct gpio_chip *
   drivers/net/phy/qca807x.c:362:48: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip *'
     362 | static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
         |                              ~~~~~~~~~~~~~~~~~~^~
   drivers/net/phy/qca807x.c: In function 'qca807x_gpio':
>> drivers/net/phy/qca807x.c:394:38: error: invalid application of 'sizeof' to incomplete type 'struct gpio_chip'
     394 |         gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
         |                                      ^
>> drivers/net/phy/qca807x.c:398:11: error: invalid use of undefined type 'struct gpio_chip'
     398 |         gc->label = dev_name(dev);
         |           ^~
   drivers/net/phy/qca807x.c:399:11: error: invalid use of undefined type 'struct gpio_chip'
     399 |         gc->base = -1;
         |           ^~
   drivers/net/phy/qca807x.c:400:11: error: invalid use of undefined type 'struct gpio_chip'
     400 |         gc->ngpio = 2;
         |           ^~
   drivers/net/phy/qca807x.c:401:11: error: invalid use of undefined type 'struct gpio_chip'
     401 |         gc->parent = dev;
         |           ^~
   drivers/net/phy/qca807x.c:402:11: error: invalid use of undefined type 'struct gpio_chip'
     402 |         gc->owner = THIS_MODULE;
         |           ^~
   drivers/net/phy/qca807x.c:403:11: error: invalid use of undefined type 'struct gpio_chip'
     403 |         gc->can_sleep = true;
         |           ^~
   drivers/net/phy/qca807x.c:404:11: error: invalid use of undefined type 'struct gpio_chip'
     404 |         gc->get_direction = qca807x_gpio_get_direction;
         |           ^~
   drivers/net/phy/qca807x.c:405:11: error: invalid use of undefined type 'struct gpio_chip'
     405 |         gc->direction_output = qca807x_gpio_dir_out;
         |           ^~
   drivers/net/phy/qca807x.c:406:11: error: invalid use of undefined type 'struct gpio_chip'
     406 |         gc->get = qca807x_gpio_get;
         |           ^~
   drivers/net/phy/qca807x.c:407:11: error: invalid use of undefined type 'struct gpio_chip'
     407 |         gc->set = qca807x_gpio_set;
         |           ^~
>> drivers/net/phy/qca807x.c:409:16: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror=implicit-function-declaration]
     409 |         return devm_gpiochip_add_data(dev, gc, priv);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c: In function 'qca807x_probe':
>> drivers/net/phy/qca807x.c:708:21: error: too few arguments to function 'of_find_property'
     708 |                 if (of_find_property(node, "leds") &&
         |                     ^~~~~~~~~~~~~~~~
   In file included from drivers/net/phy/qca807x.c:13:
   include/linux/of.h:309:25: note: declared here
     309 | extern struct property *of_find_property(const struct device_node *np,
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/phy/qca807x.c:709:21: error: too few arguments to function 'of_find_property'
     709 |                     of_find_property(node, "gpio-controller")) {
         |                     ^~~~~~~~~~~~~~~~
   include/linux/of.h:309:25: note: declared here
     309 | extern struct property *of_find_property(const struct device_node *np,
         |                         ^~~~~~~~~~~~~~~~
>> drivers/net/phy/qca807x.c:710:113: error: macro "phydev_err" requires 3 arguments, but only 1 given
     710 |                         phydev_err("Invalid property detected. LEDs and gpio-controller are mutually exclusive.");
         |                                                                                                                 ^
   In file included from drivers/net/phy/qca807x.c:14:
   include/linux/phy.h:1840: note: macro "phydev_err" defined here
    1840 | #define phydev_err(_phydev, format, args...)    \
         | 
>> drivers/net/phy/qca807x.c:710:25: error: 'phydev_err' undeclared (first use in this function); did you mean 'netdev_err'?
     710 |                         phydev_err("Invalid property detected. LEDs and gpio-controller are mutually exclusive.");
         |                         ^~~~~~~~~~
         |                         netdev_err
   cc1: some warnings being treated as errors


vim +/GPIO_LINE_DIRECTION_OUT +344 drivers/net/phy/qca807x.c

   340	
   341	#ifdef CONFIG_GPIOLIB
 > 342	static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
   343	{
 > 344		return GPIO_LINE_DIRECTION_OUT;
   345	}
   346	
   347	static int qca807x_gpio_get_reg(unsigned int offset)
   348	{
   349		return QCA807X_MMD7_LED_100N_2 + (offset % 2) * 2;
   350	}
   351	
   352	static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
   353	{
 > 354		struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
   355		int val;
   356	
   357		val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
   358	
   359		return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
   360	}
   361	
   362	static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
   363	{
   364		struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
   365		int val;
   366	
   367		val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
   368		val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
   369		val |= QCA807X_GPIO_FORCE_EN;
   370		val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
   371	
   372		phy_write_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset), val);
   373	}
   374	
   375	static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
   376	{
 > 377		qca807x_gpio_set(gc, offset, value);
   378	
   379		return 0;
   380	}
   381	
   382	static int qca807x_gpio(struct phy_device *phydev)
   383	{
   384		struct device *dev = &phydev->mdio.dev;
   385		struct qca807x_gpio_priv *priv;
   386		struct gpio_chip *gc;
   387	
   388		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   389		if (!priv)
   390			return -ENOMEM;
   391	
   392		priv->phy = phydev;
   393	
 > 394		gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
   395		if (!gc)
   396			return -ENOMEM;
   397	
 > 398		gc->label = dev_name(dev);
   399		gc->base = -1;
   400		gc->ngpio = 2;
   401		gc->parent = dev;
   402		gc->owner = THIS_MODULE;
   403		gc->can_sleep = true;
   404		gc->get_direction = qca807x_gpio_get_direction;
   405		gc->direction_output = qca807x_gpio_dir_out;
   406		gc->get = qca807x_gpio_get;
   407		gc->set = qca807x_gpio_set;
   408	
 > 409		return devm_gpiochip_add_data(dev, gc, priv);
   410	}
   411	#endif
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
