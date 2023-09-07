Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5EB1116
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694072206; x=1725608206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pDtULivygmuz21qFzpXs9W9IExF112gmZhDj5Kr7DaU=;
  b=L5scR8kQX+odC986WjlOIXDRk40mS5I7RLEhwJiX5LGsqYqWcYHK4ovT
   C03Y/g9HZ1hZvWqsPq4KxcveantUkXe7YrAcT/LlcJsIsqOpuwoG1rXqk
   dKqFd8xDX6SPrIKEpGzIxZR8cq1xmitU2U+cNv5J+BhR4halt8km5Go+Y
   EDhBnQY6Ng+UEZKu5CQuYA04LyjdrlDCSdDBoznM794KROm+vrLwf+NYR
   Xu0VhlclqizPcAzCvjuSqjqflpF9SvvwFOvIuYz5ICEYM58Np9SSFQmkV
   Ee4NlRnhF3kHp/ngl2aK9v5jm9MygEAHFNTbQhvqCA8x7xPhLKGOAYdtP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367506540"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="367506540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 00:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776963647"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="776963647"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 00:36:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe9ZB-000102-0w;
	Thu, 07 Sep 2023 07:36:41 +0000
Date: Thu, 7 Sep 2023 15:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: advantech.susiteam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, wenkai.chung@advantech.com.tw,
	Susi.Driver@advantech.com, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mfd: eiois200: Add EIO-IS200 Series EC Core Driver
Message-ID: <202309071531.rvllWPZ0-lkp@intel.com>
References: <20230907031320.6814-5-advantech.susiteam@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907031320.6814-5-advantech.susiteam@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on linus/master next-20230907]
[cannot apply to lee-mfd/for-mfd-fixes v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/advantech-susiteam-gmail-com/mfd-eiois200-Insert-EIO-IS200-core-driver-to-Kconfig/20230907-111628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230907031320.6814-5-advantech.susiteam%40gmail.com
patch subject: [PATCH 4/4] mfd: eiois200: Add EIO-IS200 Series EC Core Driver
config: i386-randconfig-014-20230907 (https://download.01.org/0day-ci/archive/20230907/202309071531.rvllWPZ0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071531.rvllWPZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071531.rvllWPZ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/eiois200_core.c:438:5: warning: no previous prototype for 'eiois200_probe' [-Wmissing-prototypes]
     438 | int eiois200_probe(struct device *dev, unsigned int id)
         |     ^~~~~~~~~~~~~~


vim +/eiois200_probe +438 drivers/mfd/eiois200_core.c

   437	
 > 438	int eiois200_probe(struct device *dev, unsigned int id)
   439	{
   440		int  ret = 0;
   441		void __iomem *iomem;
   442	
   443		iomem = devm_ioport_map(dev, 0, EIOIS200_SUB_PNP_DATA + 1);
   444		if (!iomem)
   445			return -ENOMEM;
   446	
   447		regmap_is200 = devm_regmap_init_mmio(dev, iomem, &pnp_regmap_config);
   448		if (!regmap_is200)
   449			return -ENOMEM;
   450	
   451		eiois200_dev = devm_kzalloc(dev,
   452					    sizeof(struct eiois200_dev),
   453					    GFP_KERNEL);
   454		if (!eiois200_dev)
   455			return -ENOMEM;
   456	
   457		mutex_init(&eiois200_dev->mutex);
   458	
   459		if (eiois200_exist(dev))
   460			return -ENODEV;
   461	
   462		if (firmware_code_base(dev)) {
   463			dev_err(dev, "Chip code base check fail\n");
   464			return -EIO;
   465		}
   466	
   467		dev_set_drvdata(dev, eiois200_dev);
   468	
   469		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, susi_mfd_devs,
   470					   ARRAY_SIZE(susi_mfd_devs),
   471					   NULL, 0, NULL);
   472		if (ret)
   473			dev_err(dev, "Cannot register child devices (error = %d)\n", ret);
   474	
   475		pr_info("%s started", KBUILD_MODNAME);
   476	
   477		return 0;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
