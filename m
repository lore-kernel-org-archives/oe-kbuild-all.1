Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD91F17F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692832758; x=1724368758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtCLv0QH0mF7YcBR52RL4lANRGz7nSX9LjHsXigvn50=;
  b=aeXhmuS0iXRaooHrJ2QC04ruNA0AJDb0Q6lg9l9dh+cnw3aIW6d31Qwh
   jopvb+zPIVwLuXJNftvyyLWk+oey+Oz2R9R3/sF6OgBzLWliA5iZItGIX
   1jGyNzaZsoFmb4GtO5Cx7XMuiWWO9ecVMR/p96xYjHWRUL4tT4il7yNmw
   Y8OdPuR+9FkyCihNKt2bV53EXY2hnODgZUU0V/2miIVulfkTxFnPwmFvn
   lEyzaQPGsdqF1R+IY+fDkFJKWeNJIkFKi8XrZG9ARI10UigR6Qpk/O8U0
   M9cDFQ1FRarbGmP8UcFBOkC0J+qhlPKZ6B5VBdIl6ACJWUT04hM/E64Qv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353842480"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353842480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 16:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686645168"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="686645168"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Aug 2023 16:19:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYx7z-0001Zr-0o;
	Wed, 23 Aug 2023 23:19:07 +0000
Date: Thu, 24 Aug 2023 07:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 10528/12208]
 drivers/power/supply/rt5033_charger.c:696: undefined reference to
 `extcon_find_edev_by_node'
Message-ID: <202308240723.O2rW0InU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 12cc585f36b8dffa68b809c2d23a9bd73ee6ffd2 [10528/12208] power: supply: rt5033_charger: Add cable detection and USB OTG supply
config: x86_64-randconfig-r011-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240723.O2rW0InU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240723.O2rW0InU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240723.O2rW0InU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rt5033_charger_probe':
>> drivers/power/supply/rt5033_charger.c:696: undefined reference to `extcon_find_edev_by_node'
>> ld: drivers/power/supply/rt5033_charger.c:710: undefined reference to `devm_extcon_register_notifier_all'
   ld: vmlinux.o: in function `rt5033_charger_extcon_work':
>> drivers/power/supply/rt5033_charger.c:578: undefined reference to `extcon_get_state'


vim +696 drivers/power/supply/rt5033_charger.c

   567	
   568	static void rt5033_charger_extcon_work(struct work_struct *work)
   569	{
   570		struct rt5033_charger *charger =
   571			container_of(work, struct rt5033_charger, extcon_work);
   572		struct extcon_dev *edev = charger->edev;
   573		int connector, state;
   574		int ret;
   575	
   576		for (connector = EXTCON_USB_HOST; connector <= EXTCON_CHG_USB_PD;
   577		     connector++) {
 > 578			state = extcon_get_state(edev, connector);
   579			if (state == 1)
   580				break;
   581		}
   582	
   583		/*
   584		 * Adding a delay between extcon notification and extcon action. This
   585		 * makes extcon action execution more reliable. Without the delay the
   586		 * execution sometimes fails, possibly because the chip is busy or not
   587		 * ready.
   588		 */
   589		msleep(100);
   590	
   591		switch (connector) {
   592		case EXTCON_CHG_USB_SDP:
   593			ret = rt5033_charger_set_mivr(charger);
   594			if (ret) {
   595				dev_err(charger->dev, "failed to set USB mode\n");
   596				break;
   597			}
   598			dev_info(charger->dev, "USB mode. connector type: %d\n",
   599				 connector);
   600			break;
   601		case EXTCON_CHG_USB_DCP:
   602		case EXTCON_CHG_USB_CDP:
   603		case EXTCON_CHG_USB_ACA:
   604		case EXTCON_CHG_USB_FAST:
   605		case EXTCON_CHG_USB_SLOW:
   606		case EXTCON_CHG_WPT:
   607		case EXTCON_CHG_USB_PD:
   608			ret = rt5033_charger_set_charging(charger);
   609			if (ret) {
   610				dev_err(charger->dev, "failed to set charging\n");
   611				break;
   612			}
   613			dev_info(charger->dev, "charging. connector type: %d\n",
   614				 connector);
   615			break;
   616		case EXTCON_USB_HOST:
   617			ret = rt5033_charger_set_otg(charger);
   618			if (ret) {
   619				dev_err(charger->dev, "failed to set OTG\n");
   620				break;
   621			}
   622			dev_info(charger->dev, "OTG enabled\n");
   623			break;
   624		default:
   625			ret = rt5033_charger_set_disconnect(charger);
   626			if (ret) {
   627				dev_err(charger->dev, "failed to set disconnect\n");
   628				break;
   629			}
   630			dev_info(charger->dev, "disconnected\n");
   631			break;
   632		}
   633	
   634		power_supply_changed(charger->psy);
   635	}
   636	
   637	static int rt5033_charger_extcon_notifier(struct notifier_block *nb,
   638						  unsigned long event, void *param)
   639	{
   640		struct rt5033_charger *charger =
   641			container_of(nb, struct rt5033_charger, extcon_nb);
   642	
   643		schedule_work(&charger->extcon_work);
   644	
   645		return NOTIFY_OK;
   646	}
   647	
   648	static const struct power_supply_desc rt5033_charger_desc = {
   649		.name = "rt5033-charger",
   650		.type = POWER_SUPPLY_TYPE_USB,
   651		.properties = rt5033_charger_props,
   652		.num_properties = ARRAY_SIZE(rt5033_charger_props),
   653		.get_property = rt5033_charger_get_property,
   654	};
   655	
   656	static int rt5033_charger_probe(struct platform_device *pdev)
   657	{
   658		struct rt5033_charger *charger;
   659		struct power_supply_config psy_cfg = {};
   660		struct device_node *np_conn, *np_edev;
   661		int ret;
   662	
   663		charger = devm_kzalloc(&pdev->dev, sizeof(*charger), GFP_KERNEL);
   664		if (!charger)
   665			return -ENOMEM;
   666	
   667		platform_set_drvdata(pdev, charger);
   668		charger->dev = &pdev->dev;
   669		charger->regmap = dev_get_regmap(pdev->dev.parent, NULL);
   670		mutex_init(&charger->lock);
   671	
   672		psy_cfg.of_node = pdev->dev.of_node;
   673		psy_cfg.drv_data = charger;
   674	
   675		charger->psy = devm_power_supply_register(&pdev->dev,
   676							  &rt5033_charger_desc,
   677							  &psy_cfg);
   678		if (IS_ERR(charger->psy))
   679			return dev_err_probe(&pdev->dev, PTR_ERR(charger->psy),
   680					     "Failed to register power supply\n");
   681	
   682		charger->chg = rt5033_charger_dt_init(charger);
   683		if (IS_ERR_OR_NULL(charger->chg))
   684			return PTR_ERR(charger->chg);
   685	
   686		ret = rt5033_charger_reg_init(charger);
   687		if (ret)
   688			return ret;
   689	
   690		/*
   691		 * Extcon support is not vital for the charger to work. If no extcon
   692		 * is available, just emit a warning and leave the probe function.
   693		 */
   694		np_conn = of_parse_phandle(pdev->dev.of_node, "richtek,usb-connector", 0);
   695		np_edev = of_get_parent(np_conn);
 > 696		charger->edev = extcon_find_edev_by_node(np_edev);
   697		if (IS_ERR(charger->edev)) {
   698			dev_warn(&pdev->dev, "no extcon device found in device-tree\n");
   699			goto out;
   700		}
   701	
   702		ret = devm_work_autocancel(&pdev->dev, &charger->extcon_work,
   703					   rt5033_charger_extcon_work);
   704		if (ret) {
   705			dev_err(&pdev->dev, "failed to initialize extcon work\n");
   706			return ret;
   707		}
   708	
   709		charger->extcon_nb.notifier_call = rt5033_charger_extcon_notifier;
 > 710		ret = devm_extcon_register_notifier_all(&pdev->dev, charger->edev,
   711							&charger->extcon_nb);
   712		if (ret) {
   713			dev_err(&pdev->dev, "failed to register extcon notifier\n");
   714			return ret;
   715		}
   716	out:
   717		return 0;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
