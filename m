Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E610E5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688801007; x=1720337007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLRQDd22RcXvO+Y4TXhQzlsfK/PznAb04gqLMYq0oLs=;
  b=dRHPKiws1zw8xXbcHQWHrA8hT1yTU/CZ1T1iXwlfn1lKcsVHU4Z5FgWl
   geVd6i963RgzJvrx0QDfx1h1ywsm/tPWNbT/JcMZQFIrMukzBaeL3of2t
   F40mCw8M1RzvKh22dizoMMDMqQw7kP2iNXDWHvCcjf7/vQ7FYdfPO5h1d
   w8sZ6ebN3FzCV0o8UeELtgyd99ZVfhjpF94kltBM/eyuwjkWVpfnKNwWK
   PtCudbdr4TDQh0H2DHZ1QOz4ngQOL76TE8M6FcbopSrem/thHrgbdz99m
   7ARlNYjxHcsH7sgkgCiyi2FhFnIfxqlMQ/7cxtb6SH7ppICI48g8dB7Nq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="364081510"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="364081510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 00:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="720158563"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="720158563"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jul 2023 00:23:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI2Hp-0002bw-2D;
	Sat, 08 Jul 2023 07:23:21 +0000
Date: Sat, 8 Jul 2023 15:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 3/33]
 drivers/thermal/mediatek/soc_temp_lvts.c:713:7: error: incompatible integer
 to pointer conversion assigning to 'struct resource *' from 'int'
Message-ID: <202307081516.XE1iL5eT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4ebde755b7d9f877a252acb7c357b305ee5893da
commit: b8ca3ab4ca7475e8fe566d34f5a37896b22ac572 [3/33] CHROMIUM: thermal: mediatek: soc_temp_lvts: Switch to platform_get_irq
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230708/202307081516.XE1iL5eT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081516.XE1iL5eT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081516.XE1iL5eT-lkp@intel.com/

Note: the chrome-os/chromeos-6.1 HEAD 4ebde755b7d9f877a252acb7c357b305ee5893da builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/thermal/mediatek/soc_temp_lvts.c:713:7: error: incompatible integer to pointer conversion assigning to 'struct resource *' from 'int' [-Wint-conversion]
     713 |                 res = platform_get_irq(pdev, i);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thermal/mediatek/soc_temp_lvts.c:715:11: error: incompatible pointer to integer conversion returning 'struct resource *' from a function with result type 'int' [-Wint-conversion]
     715 |                         return res;
         |                                ^~~
>> drivers/thermal/mediatek/soc_temp_lvts.c:716:21: error: incompatible pointer to integer conversion assigning to 'unsigned int' from 'struct resource *' [-Wint-conversion]
     716 |                 domain[i].irq_num = res;
         |                                   ^ ~~~
   3 errors generated.


vim +713 drivers/thermal/mediatek/soc_temp_lvts.c

   680	
   681	static int of_update_lvts_data(struct lvts_data *lvts_data,
   682				       struct platform_device *pdev)
   683	{
   684		struct device *dev = lvts_data->dev;
   685		struct power_domain *domain;
   686		struct resource *res;
   687		unsigned int i;
   688		int ret;
   689	
   690		lvts_data->clk = devm_clk_get(dev, "lvts_clk");
   691		if (IS_ERR(lvts_data->clk))
   692			return PTR_ERR(lvts_data->clk);
   693	
   694		domain = devm_kcalloc(dev, lvts_data->num_domain, sizeof(*domain), GFP_KERNEL);
   695		if (!domain)
   696			return -ENOMEM;
   697	
   698		for (i = 0; i < lvts_data->num_domain; i++) {
   699			/* Get base address */
   700			res = platform_get_resource(pdev, IORESOURCE_MEM, i);
   701			if (!res) {
   702				dev_err(dev, "No IO resource, index %d\n", i);
   703				return -ENXIO;
   704			}
   705	
   706			domain[i].base = devm_ioremap_resource(dev, res);
   707			if (IS_ERR(domain[i].base)) {
   708				dev_err(dev, "Failed to remap io, index %d\n", i);
   709				return PTR_ERR(domain[i].base);
   710			}
   711	
   712			/* Get interrupt number */
 > 713			res = platform_get_irq(pdev, i);
   714			if (res < 0)
 > 715				return res;
 > 716			domain[i].irq_num = res;
   717	
   718			/* Get reset control */
   719			domain[i].reset = devm_reset_control_get_by_index(dev, i);
   720			if (IS_ERR(domain[i].reset)) {
   721				dev_err(dev, "Failed to get, index %d\n", i);
   722				return PTR_ERR(domain[i].reset);
   723			}
   724		}
   725	
   726		lvts_data->domain = domain;
   727	
   728		lvts_data->sen_data = devm_kcalloc(dev, lvts_data->num_sensor,
   729						   sizeof(*lvts_data->sen_data), GFP_KERNEL);
   730		if (!lvts_data->sen_data)
   731			return -ENOMEM;
   732	
   733		ret = get_calibration_data(lvts_data);
   734		if (ret)
   735			lvts_data->cal_data.use_fake_efuse = 1;
   736		ret = prepare_calibration_data(lvts_data);
   737		if (ret)
   738			return ret;
   739	
   740		return 0;
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
