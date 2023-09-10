Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44779CC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694363888; x=1725899888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=404lYxciKk+UOznw0b1Golj2CDmexxkO10uW5T8vTBw=;
  b=cBF1Yx6HH5Z2YXvL8JGXjMB0mJa55lQi4X/GxlnjT0e4EyyNHaMQr+Gd
   fO5UE8QyO2Tvg4kppoMhCeoJdzVwkyFI2UI1vhQUBD2bu0GCY4NlxwXEy
   umlTjaoBe53oJy6F3JHpsTXyySiiXQw5DfNbG4AA53eEhDWOmFGPIt6bQ
   ajZxl7/+4UjqeeYNRU5+Yu88ZWpqa1Oydl0dg57D/fHiVzSc71mIzDYiq
   dyrjXLJyLEWZ6VPMIJKHyq1lqMvfqIX9U7cndb1ekAnXlOs1maDirFj+f
   tPc+QtioLZ2w8TZ/aLQaxwL4ZaNFzGuekGmqXSntqINdOIQuiRnzwjJIJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368171027"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="368171027"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 09:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772316792"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="772316792"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2023 09:38:06 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfNRk-0005Bc-0c;
	Sun, 10 Sep 2023 16:38:04 +0000
Date: Mon, 11 Sep 2023 00:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 4106/25020]
 drivers/regulator/max17135-regulator.c:699:58: error: passing argument 2 of
 'max17135_pmic_dt_parse_pdata' from incompatible pointer type
Message-ID: <202309110057.7mdOSIDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 83ebb2723d287b1c5b15d0c7601b48b16b8689f4 [4106/25020] MLK-11556-1 pmic: max17135: add hwmon, mfd and regulator drivers for this pmic
config: x86_64-randconfig-r022-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110057.7mdOSIDH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110057.7mdOSIDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110057.7mdOSIDH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/max17135-regulator.c: In function 'max17135_regulator_probe':
>> drivers/regulator/max17135-regulator.c:699:58: error: passing argument 2 of 'max17135_pmic_dt_parse_pdata' from incompatible pointer type [-Werror=incompatible-pointer-types]
     699 |                 ret = max17135_pmic_dt_parse_pdata(pdev, pdata);
         |                                                          ^~~~~
         |                                                          |
         |                                                          struct max17135_platform_data *
   drivers/regulator/max17135-regulator.c:680:58: note: expected 'struct max17135 *' but argument is of type 'struct max17135_platform_data *'
     680 |                                         struct max17135 *max17135)
         |                                         ~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/max17135_pmic_dt_parse_pdata +699 drivers/regulator/max17135-regulator.c

   685	
   686	/*
   687	 * Regulator init/probing/exit functions
   688	 */
   689	static int max17135_regulator_probe(struct platform_device *pdev)
   690	{
   691		struct max17135 *max17135 = dev_get_drvdata(pdev->dev.parent);
   692		struct max17135_platform_data *pdata = max17135->pdata;
   693		struct max17135_data *priv;
   694		struct regulator_dev **rdev;
   695		struct regulator_config config = { };
   696		int size, i, ret = 0;
   697	
   698		if (max17135->dev->of_node) {
 > 699			ret = max17135_pmic_dt_parse_pdata(pdev, pdata);
   700			if (ret)
   701				return ret;
   702		}
   703		priv = devm_kzalloc(&pdev->dev, sizeof(struct max17135_data),
   704				       GFP_KERNEL);
   705		if (!priv)
   706			return -ENOMEM;
   707	
   708		size = sizeof(struct regulator_dev *) * pdata->num_regulators;
   709		priv->rdev = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
   710		if (!priv->rdev)
   711			return -ENOMEM;
   712	
   713		rdev = priv->rdev;
   714		priv->num_regulators = pdata->num_regulators;
   715		platform_set_drvdata(pdev, priv);
   716	
   717		max17135->vcom_setup = false;
   718		max17135->pass_num = max17135_pass_num;
   719		max17135->vcom_uV = max17135_vcom;
   720	
   721		for (i = 0; i < pdata->num_regulators; i++) {
   722			int id = pdata->regulators[i].id;
   723	
   724			config.dev = max17135->dev;
   725			config.init_data = pdata->regulators[i].initdata;
   726			config.driver_data = max17135;
   727			config.of_node = pdata->regulators[i].reg_node;
   728	
   729			rdev[i] = regulator_register(&max17135_reg[id], &config);
   730			if (IS_ERR(rdev[i])) {
   731				ret = PTR_ERR(rdev[i]);
   732				dev_err(&pdev->dev, "regulator init failed for %d\n",
   733						id);
   734				rdev[i] = NULL;
   735				goto err;
   736			}
   737		}
   738	
   739		/*
   740		 * Set up PMIC timing values.
   741		 * Should only be done one time!  Timing values may only be
   742		 * changed a limited number of times according to spec.
   743		 */
   744		max17135_setup_timings(max17135);
   745	
   746		return 0;
   747	err:
   748		while (--i >= 0)
   749			regulator_unregister(rdev[i]);
   750		return ret;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
