Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8892B165
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 20:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689798551; x=1721334551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D41TrIqyxXUoqoPbXI9rKfzJFi6YLUOvOC+K/4sLe58=;
  b=DTEKw35/dQmqEe1T4pVYU4RfHP2qUY/q22aX2lZiM1QWQ2X/GQZcDBvW
   IdOjYkVClbMUB7tVkuptlyizHitGws9jxcgPbElyogP5npi4TqyAC80pq
   kW1oriZU2G1LVdA2EOOHT+61dW1vFRewM9WV/ErCcxsPeQn9WVP+jfzNO
   PVMffgPnS0NCgQsxkgxZXHOByLBBo641PTGfvCxKg5NgdRmV1j7PA1xJk
   82+C6Al1yKM/M6/rSiZe6VkL41It5eaQh/Krbzac19B243EaVZV/j9YFq
   cbti8dWMcECXzBJiSUnN3kiDspx4nVeH3CTHdTMtNUrdRvgHRZeYRuyaS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370128930"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="370128930"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 13:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674436379"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674436379"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 13:28:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMDmZ-0005Rt-1s;
	Wed, 19 Jul 2023 20:28:28 +0000
Date: Thu, 20 Jul 2023 04:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 3616/12469]
 drivers/power/supply/sabresd_battery.c:697:25: error: implicit declaration
 of function 'max8903_of_populate_pdata'
Message-ID: <202307200444.oqtBJ9Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: 255fd991d26ed43fa76a05572b6a9a0bf6e18e2e [3616/12469] MLK-11703-2: power: sabresd_battery: add sabresd_battery driver
config: m68k-randconfig-r035-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200444.oqtBJ9Oq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200444.oqtBJ9Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200444.oqtBJ9Oq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/power/supply/sabresd_battery.c:158:5: warning: no previous prototype for 'calibrate_battery_capability_percent' [-Wmissing-prototypes]
     158 | u32 calibrate_battery_capability_percent(struct max8903_data *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sabresd_battery.c:227:5: warning: no previous prototype for 'calibration_voltage' [-Wmissing-prototypes]
     227 | u32 calibration_voltage(struct max8903_data *data)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sabresd_battery.c: In function 'max8903_voltage_offset_discharger_store':
   drivers/power/supply/sabresd_battery.c:503:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     503 |         int ret;
         |             ^~~
   drivers/power/supply/sabresd_battery.c: In function 'max8903_voltage_offset_charger_store':
   drivers/power/supply/sabresd_battery.c:524:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     524 |         int ret;
         |             ^~~
   drivers/power/supply/sabresd_battery.c: In function 'max8903_voltage_offset_usb_charger_store':
   drivers/power/supply/sabresd_battery.c:544:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     544 |         int ret;
         |             ^~~
   drivers/power/supply/sabresd_battery.c: In function 'max8903_probe':
>> drivers/power/supply/sabresd_battery.c:697:25: error: implicit declaration of function 'max8903_of_populate_pdata' [-Werror=implicit-function-declaration]
     697 |                 pdata = max8903_of_populate_pdata(&pdev->dev);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/sabresd_battery.c:697:23: warning: assignment to 'struct max8903_pdata *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     697 |                 pdata = max8903_of_populate_pdata(&pdev->dev);
         |                       ^
   drivers/power/supply/sabresd_battery.c: At top level:
>> drivers/power/supply/sabresd_battery.c:1006:35: error: 'max8903_dt_ids' undeclared here (not in a function); did you mean 'max8903_dcin'?
    1006 |                 .of_match_table = max8903_dt_ids,
         |                                   ^~~~~~~~~~~~~~
         |                                   max8903_dcin
   cc1: some warnings being treated as errors


vim +/max8903_of_populate_pdata +697 drivers/power/supply/sabresd_battery.c

   679	
   680	static int max8903_probe(struct platform_device *pdev)
   681	{
   682		struct max8903_data *data;
   683		struct device *dev = &pdev->dev;
   684		struct max8903_pdata *pdata = pdev->dev.platform_data;
   685		int ret = 0;
   686		int gpio = 0;
   687		int ta_in = 0;
   688		int usb_in = 0;
   689		struct power_supply_config psy_cfg = {};
   690	
   691		data = devm_kzalloc(dev, sizeof(struct max8903_data), GFP_KERNEL);
   692		if (!data)
   693			return -ENOMEM;
   694	
   695		pdata = pdev->dev.platform_data;
   696		if (!pdata) {
 > 697			pdata = max8903_of_populate_pdata(&pdev->dev);
   698			if (!pdata)
   699				return -EINVAL;
   700		}
   701	
   702		data->first_delay_count = 0;
   703		data->pdata = pdata;
   704		data->dev = dev;
   705		data->usb_in = 0;
   706		data->ta_in = 0;
   707		platform_set_drvdata(pdev, data);
   708	
   709		if (pdata->dc_valid == false && pdata->usb_valid == false) {
   710			dev_err(dev, "No valid power sources.\n");
   711			ret = -EINVAL;
   712			goto err;
   713		}
   714		if (pdata->dc_valid) {
   715			if (pdata->dok && pdata->dcm_always_high) {
   716				gpio = pdata->dok;
   717				ret = gpio_request_one(gpio, GPIOF_IN, "max8903-DOK");
   718				if (ret) {
   719					dev_err(dev, "request max8903-DOK error!!\n");
   720					goto err;
   721				}
   722				ta_in = gpio_get_value(gpio) ? 0 : 1;
   723			} else {
   724				dev_err(dev, "When DC is wired, DOK and DCM should be"
   725					" wired as well or set dcm always high!\n");
   726				ret = -EINVAL;
   727				goto err;
   728			}
   729		}
   730	
   731		if (pdata->usb_valid) {
   732			if (pdata->uok) {
   733				gpio = pdata->uok;
   734				ret = gpio_request_one(gpio, GPIOF_IN, "max8903-UOK");
   735				if (ret) {
   736					dev_err(dev, "request max8903-UOK error!!\n");
   737					goto err;
   738				}
   739				usb_in = gpio_get_value(gpio) ? 0 : 1;
   740			} else {
   741				dev_err(dev, "When USB is wired, UOK should be wired"
   742					" as well.\n");
   743				ret = -EINVAL;
   744				goto err;
   745			}
   746		}
   747	
   748		if (pdata->chg) {
   749			ret = gpio_request_one(pdata->chg, GPIOF_IN, "max8903-CHG");
   750			if (ret) {
   751				dev_err(dev, "request max8903-CHG error!!\n");
   752				goto err;
   753			}
   754		}
   755	
   756		if (pdata->flt) {
   757			ret = gpio_request_one(pdata->flt, GPIOF_IN, "max8903-FLT");
   758			if (ret) {
   759				dev_err(dev, "request max8903-FLT error!!\n");
   760				goto err;
   761			}
   762		}
   763	
   764		data->fault = false;
   765		data->ta_in = ta_in;
   766		data->usb_in = usb_in;
   767	
   768		psy_cfg.of_node = dev->of_node;
   769		psy_cfg.drv_data = data;
   770	
   771		data->psy = power_supply_register(dev, &max8903_ac_desc, &psy_cfg);
   772		if (IS_ERR(data->psy)) {
   773			dev_err(dev, "failed: power supply register.\n");
   774			goto err;
   775		}
   776	
   777		data->usb = power_supply_register(dev, &max8903_usb_desc, &psy_cfg);
   778		if (IS_ERR(data->usb)) {
   779			dev_err(dev, "failed: power supply register.\n");
   780			goto err_psy;
   781		}
   782	
   783		data->bat = power_supply_register(dev, &max8903_bat_desc, &psy_cfg);
   784		if (IS_ERR(data->bat)) {
   785			dev_err(data->dev, "failed to register battery\n");
   786			goto err_usb;
   787		}
   788	
   789		INIT_DELAYED_WORK(&data->work, max8903_battery_work);
   790		schedule_delayed_work(&data->work, data->interval);
   791	
   792		if (pdata->dc_valid) {
   793			ret = request_threaded_irq(gpio_to_irq(pdata->dok), NULL,
   794				max8903_dcin, IRQF_TRIGGER_FALLING |
   795				IRQF_TRIGGER_RISING | IRQF_ONESHOT, "MAX8903 DC IN",
   796				data);
   797			if (ret) {
   798				dev_err(dev, "Cannot request irq %d for DC (%d)\n",
   799						gpio_to_irq(pdata->dok), ret);
   800				goto err_dc_irq;
   801			}
   802		}
   803	
   804		if (pdata->usb_valid) {
   805			ret = request_threaded_irq(gpio_to_irq(pdata->uok), NULL,
   806				max8903_usbin, IRQF_TRIGGER_FALLING |
   807				IRQF_TRIGGER_RISING | IRQF_ONESHOT, "MAX8903 USB IN",
   808				data);
   809			if (ret) {
   810				dev_err(dev, "Cannot request irq %d for USB (%d)\n",
   811						gpio_to_irq(pdata->uok), ret);
   812				goto err_usb_irq;
   813			}
   814		}
   815	
   816		if (pdata->flt) {
   817			ret = request_threaded_irq(gpio_to_irq(pdata->flt), NULL,
   818				max8903_fault, IRQF_TRIGGER_FALLING |
   819				IRQF_TRIGGER_RISING | IRQF_ONESHOT, "MAX8903 Fault",
   820				data);
   821			if (ret) {
   822				dev_err(dev, "Cannot request irq %d for Fault (%d)\n",
   823						gpio_to_irq(pdata->flt), ret);
   824				goto err_flt_irq;
   825			}
   826		}
   827	
   828		if (pdata->chg) {
   829			ret = request_threaded_irq(gpio_to_irq(pdata->chg), NULL,
   830				max8903_chg, IRQF_TRIGGER_FALLING |
   831				IRQF_TRIGGER_RISING | IRQF_ONESHOT, "MAX8903 Status",
   832				data);
   833			if (ret) {
   834				dev_err(dev, "Cannot request irq %d for Status (%d)\n",
   835						gpio_to_irq(pdata->flt), ret);
   836				goto err_chg_irq;
   837			}
   838		}
   839	
   840		ret = device_create_file(&pdev->dev, &max8903_discharger_dev_attr);
   841		if (ret)
   842			dev_err(&pdev->dev, "create device file failed!\n");
   843		ret = device_create_file(&pdev->dev, &max8903_charger_dev_attr);
   844		if (ret)
   845			dev_err(&pdev->dev, "create device file failed!\n");
   846		ret = device_create_file(&pdev->dev, &max8903_usb_charger_dev_attr);
   847		if (ret)
   848			dev_err(&pdev->dev, "create device file failed!\n");
   849	
   850		device_set_wakeup_capable(&pdev->dev, true);
   851	
   852		max8903_charger_update_status(data);
   853		max8903_battery_update_status(data);
   854	
   855		return 0;
   856	err_chg_irq:
   857		if (pdata->chg)
   858			free_irq(gpio_to_irq(pdata->chg), data);
   859	err_flt_irq:
   860		if (pdata->flt)
   861			free_irq(gpio_to_irq(pdata->flt), data);
   862	err_usb_irq:
   863		if (pdata->usb_valid)
   864			free_irq(gpio_to_irq(pdata->uok), data);
   865	err_dc_irq:
   866		if (pdata->dc_valid)
   867			free_irq(gpio_to_irq(pdata->dok), data);
   868		cancel_delayed_work(&data->work);
   869		power_supply_unregister(data->bat);
   870	err_usb:
   871		power_supply_unregister(data->usb);
   872	err_psy:
   873		power_supply_unregister(data->psy);
   874	err:
   875		if (pdata->uok)
   876			gpio_free(pdata->uok);
   877		if (pdata->dok)
   878			gpio_free(pdata->dok);
   879		if (pdata->flt)
   880			gpio_free(pdata->flt);
   881		if (pdata->chg)
   882			gpio_free(pdata->chg);
   883		return ret;
   884	}
   885	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
