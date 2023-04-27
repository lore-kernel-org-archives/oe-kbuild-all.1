Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C52573
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682594902; x=1714130902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LxebVL/YoupIHE5ahkh1saPj1If9mb4YNuiku2WE4ts=;
  b=b1Ne51ItWenXp4N5QpjtbErNa7vN+sXK5FTr7zAv5PC7ZRGC51lDeAb4
   fUlLSyOSbPAfCRwt3292mcQ2Qa1GxpL7ncmpfAHwBM9pcg/R5Mtmtg1O6
   qNGjMQG/qDffEyQ7QGTD3dxDMyoZQA03MTPzRTP5Wx5QAFa1S805dp5Pt
   N9tHTPDtgugcsdF+b9Ek6Dpji9rVVmNmdwjHsAJDSIlIl9HdND38xkpWM
   72+nE8TAP0mNM4PJ6vf4igiUId0ttNVt5AdUZdZV2cmwwTtDMosDzKglA
   4Z0tIiU3WzsX6vaKC+fd5HLE2JEJeuM5qgk91AJD1q5SizwrG5l/vYfVJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336359762"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="336359762"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="818495944"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="818495944"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Apr 2023 04:28:20 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prznP-0000CF-38;
	Thu, 27 Apr 2023 11:28:19 +0000
Date: Thu, 27 Apr 2023 19:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 56/56]
 drivers/power/supply/tps65090-charger.c:342:34: warning:
 'of_tps65090_charger_match' defined but not used
Message-ID: <202304271948.nIX7ZDpA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 4cc2262d09430892703b2d82d4a48f65679a8b53 [56/56] of: header cleanups
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230427/202304271948.nIX7ZDpA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=4cc2262d09430892703b2d82d4a48f65679a8b53
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 4cc2262d09430892703b2d82d4a48f65679a8b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271948.nIX7ZDpA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/tps65090-charger.c: In function 'tps65090_parse_dt_charger_data':
   drivers/power/supply/tps65090-charger.c:200:16: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]
     200 |         prop = of_property_read_bool(np, "ti,enable-low-current-chrg");
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/tps65090-charger.c: At top level:
   drivers/power/supply/tps65090-charger.c:342:34: error: array type has incomplete element type 'struct of_device_id'
     342 | static const struct of_device_id of_tps65090_charger_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/tps65090-charger.c:342:34: warning: 'of_tps65090_charger_match' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +/of_tps65090_charger_match +342 drivers/power/supply/tps65090-charger.c

6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  186  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  187  static struct tps65090_platform_data *
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  188  		tps65090_parse_dt_charger_data(struct platform_device *pdev)
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  189  {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  190  	struct tps65090_platform_data *pdata;
594f8f888d3255 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-21  191  	struct device_node *np = pdev->dev.of_node;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  192  	unsigned int prop;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  193  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  194  	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  195  	if (!pdata) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  196  		dev_err(&pdev->dev, "Memory alloc for tps65090_pdata failed\n");
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  197  		return NULL;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  198  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  199  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12 @200  	prop = of_property_read_bool(np, "ti,enable-low-current-chrg");
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  201  	pdata->enable_low_current_chrg = prop;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  202  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  203  	pdata->irq_base = -1;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  204  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  205  	return pdata;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  206  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  207  }
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  208  
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  209  static int tps65090_charger_poll_task(void *data)
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  210  {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  211  	set_freezable();
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  212  
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  213  	while (!kthread_should_stop()) {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  214  		schedule_timeout_interruptible(POLL_INTERVAL);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  215  		try_to_freeze();
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  216  		tps65090_charger_isr(-1, data);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  217  	}
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  218  	return 0;
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  219  }
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  220  
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  221  static const struct power_supply_desc tps65090_charger_desc = {
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  222  	.name			= "tps65090-ac",
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  223  	.type			= POWER_SUPPLY_TYPE_MAINS,
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  224  	.get_property		= tps65090_ac_get_property,
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  225  	.properties		= tps65090_ac_props,
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  226  	.num_properties		= ARRAY_SIZE(tps65090_ac_props),
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  227  };
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  228  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  229  static int tps65090_charger_probe(struct platform_device *pdev)
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  230  {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  231  	struct tps65090_charger *cdata;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  232  	struct tps65090_platform_data *pdata;
2dc9215d7c94f7 drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  233  	struct power_supply_config psy_cfg = {};
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  234  	uint8_t status1 = 0;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  235  	int ret;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  236  	int irq;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  237  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  238  	pdata = dev_get_platdata(pdev->dev.parent);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  239  
e47bcba4a189ab drivers/power/tps65090-charger.c        Manish Badarkhe     2013-09-28  240  	if (IS_ENABLED(CONFIG_OF) && !pdata && pdev->dev.of_node)
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  241  		pdata = tps65090_parse_dt_charger_data(pdev);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  242  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  243  	if (!pdata) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  244  		dev_err(&pdev->dev, "%s():no platform data available\n",
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  245  				__func__);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  246  		return -ENODEV;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  247  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  248  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  249  	cdata = devm_kzalloc(&pdev->dev, sizeof(*cdata), GFP_KERNEL);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  250  	if (!cdata) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  251  		dev_err(&pdev->dev, "failed to allocate memory status\n");
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  252  		return -ENOMEM;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  253  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  254  
e08358792422ef drivers/power/tps65090-charger.c        Jingoo Han          2013-05-23  255  	platform_set_drvdata(pdev, cdata);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  256  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  257  	cdata->dev			= &pdev->dev;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  258  	cdata->pdata			= pdata;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  259  
2dc9215d7c94f7 drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  260  	psy_cfg.supplied_to		= pdata->supplied_to;
2dc9215d7c94f7 drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  261  	psy_cfg.num_supplicants		= pdata->num_supplicants;
2dc9215d7c94f7 drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  262  	psy_cfg.of_node			= pdev->dev.of_node;
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  263  	psy_cfg.drv_data		= cdata;
2dc9215d7c94f7 drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  264  
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  265  	cdata->ac = power_supply_register(&pdev->dev, &tps65090_charger_desc,
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  266  			&psy_cfg);
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  267  	if (IS_ERR(cdata->ac)) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  268  		dev_err(&pdev->dev, "failed: power supply register\n");
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  269  		return PTR_ERR(cdata->ac);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  270  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  271  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  272  	irq = platform_get_irq(pdev, 0);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  273  	if (irq < 0)
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  274  		irq = -ENXIO;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  275  	cdata->irq = irq;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  276  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  277  	ret = tps65090_config_charger(cdata);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  278  	if (ret < 0) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  279  		dev_err(&pdev->dev, "charger config failed, err %d\n", ret);
0ed81393235fbf drivers/power/tps65090-charger.c        Wei Yongjun         2013-09-23  280  		goto fail_unregister_supply;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  281  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  282  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  283  	/* Check for charger presence */
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  284  	ret = tps65090_read(cdata->dev->parent, TPS65090_REG_CG_STATUS1,
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  285  			&status1);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  286  	if (ret < 0) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  287  		dev_err(cdata->dev, "%s(): Error in reading reg 0x%x", __func__,
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  288  			TPS65090_REG_CG_STATUS1);
0ed81393235fbf drivers/power/tps65090-charger.c        Wei Yongjun         2013-09-23  289  		goto fail_unregister_supply;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  290  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  291  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  292  	if (status1 != 0) {
e24142178fc2f6 drivers/power/tps65090-charger.c        Andrew Chew         2013-06-06  293  		ret = tps65090_enable_charging(cdata);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  294  		if (ret < 0) {
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  295  			dev_err(cdata->dev, "error enabling charger\n");
0ed81393235fbf drivers/power/tps65090-charger.c        Wei Yongjun         2013-09-23  296  			goto fail_unregister_supply;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  297  		}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  298  		cdata->ac_online = 1;
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  299  		power_supply_changed(cdata->ac);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  300  	}
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  301  
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  302  	if (irq != -ENXIO) {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  303  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
2469b836fa835c drivers/power/supply/tps65090-charger.c dongjian            2021-03-22  304  			tps65090_charger_isr, IRQF_ONESHOT, "tps65090-charger", cdata);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  305  		if (ret) {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  306  			dev_err(cdata->dev,
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  307  				"Unable to register irq %d err %d\n", irq,
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  308  				ret);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  309  			goto fail_unregister_supply;
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  310  		}
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  311  	} else {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  312  		cdata->poll_task = kthread_run(tps65090_charger_poll_task,
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  313  					      cdata, "ktps65090charger");
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  314  		cdata->passive_mode = true;
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  315  		if (IS_ERR(cdata->poll_task)) {
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  316  			ret = PTR_ERR(cdata->poll_task);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  317  			dev_err(cdata->dev,
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  318  				"Unable to run kthread err %d\n", ret);
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  319  			goto fail_unregister_supply;
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  320  		}
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  321  	}
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  322  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  323  	return 0;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  324  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  325  fail_unregister_supply:
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  326  	power_supply_unregister(cdata->ac);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  327  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  328  	return ret;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  329  }
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  330  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  331  static int tps65090_charger_remove(struct platform_device *pdev)
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  332  {
e08358792422ef drivers/power/tps65090-charger.c        Jingoo Han          2013-05-23  333  	struct tps65090_charger *cdata = platform_get_drvdata(pdev);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  334  
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  335  	if (cdata->irq == -ENXIO)
193dcced049cea drivers/power/tps65090-charger.c        Doug Anderson       2014-06-20  336  		kthread_stop(cdata->poll_task);
297d716f6260cc drivers/power/tps65090-charger.c        Krzysztof Kozlowski 2015-03-12  337  	power_supply_unregister(cdata->ac);
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  338  
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  339  	return 0;
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  340  }
6f8da5df8c4511 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-12  341  
8fb0885504cc02 drivers/power/tps65090-charger.c        Fabian Frederick    2015-03-16 @342  static const struct of_device_id of_tps65090_charger_match[] = {
594f8f888d3255 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-21  343  	{ .compatible = "ti,tps65090-charger", },
594f8f888d3255 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-21  344  	{ /* end */ }
594f8f888d3255 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-21  345  };
c72b7bf82cc681 drivers/power/tps65090-charger.c        Luis de Bethencourt 2015-09-18  346  MODULE_DEVICE_TABLE(of, of_tps65090_charger_match);
594f8f888d3255 drivers/power/tps65090-charger.c        Rhyland Klein       2013-03-21  347  

:::::: The code at line 342 was first introduced by commit
:::::: 8fb0885504cc029bd48877fa89ba91c33c0110b5 power: constify of_device_id array

:::::: TO: Fabian Frederick <fabf@skynet.be>
:::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
