Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85664A3B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688637084; x=1720173084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtlwbI8ivO7VLfpzH/zYE+6d66QkX+D0HKN+9Tr9R/U=;
  b=edZ9stytSNHmFbS2Fsno1KeYepYMoBEEHgA2d7k4UszsoEioF9oMMZMc
   jJZcwwitEOaQr0NHUHCMHHPq6SXzoYQ3QIO9Jax952Rr96VVQGwqTiiij
   SN/5fjwxdMZJfRl4wYatrB/z6D8AbUhi35rood89jVQblh+KbpGoNxFFO
   rahk7dYEJhyfd6fmlFWisbP/R5dOgPlg1eqB6T8mbqZxGS6mZN9nCHi84
   qmeoBTwUtHq7jZE/qOIHARkUb+X0U/tFvmKyMnbFMFhcV6AaqABki+km6
   nzKdQM4exk6cAwIIQRxgHtblMRYq+UyfjLqL8/IfrOH8ybZtt9i2F4OPO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366136034"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="366136034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843617483"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="843617483"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Jul 2023 02:51:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHLdx-0001EU-1i;
	Thu, 06 Jul 2023 09:51:21 +0000
Date: Thu, 6 Jul 2023 17:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 3/6]
 drivers/thermal/mediatek/soc_temp_lvts.c:713:21: warning: assignment to
 'struct resource *' from 'int' makes pointer from integer without a cast
Message-ID: <202307061704.j6XOC5ZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   428c2dcaea5cf88909af34f9ba173afccc8a87b9
commit: b8ca3ab4ca7475e8fe566d34f5a37896b22ac572 [3/6] CHROMIUM: thermal: mediatek: soc_temp_lvts: Switch to platform_get_irq
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230706/202307061704.j6XOC5ZH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061704.j6XOC5ZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061704.j6XOC5ZH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/mediatek/soc_temp_lvts.c: In function 'of_update_lvts_data':
>> drivers/thermal/mediatek/soc_temp_lvts.c:713:21: warning: assignment to 'struct resource *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     713 |                 res = platform_get_irq(pdev, i);
         |                     ^
>> drivers/thermal/mediatek/soc_temp_lvts.c:714:25: warning: ordered comparison of pointer with integer zero [-Wextra]
     714 |                 if (res < 0)
         |                         ^
>> drivers/thermal/mediatek/soc_temp_lvts.c:715:32: warning: returning 'struct resource *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     715 |                         return res;
         |                                ^~~
>> drivers/thermal/mediatek/soc_temp_lvts.c:716:35: warning: assignment to 'unsigned int' from 'struct resource *' makes integer from pointer without a cast [-Wint-conversion]
     716 |                 domain[i].irq_num = res;
         |                                   ^


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
 > 714			if (res < 0)
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
