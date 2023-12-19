Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAE14AA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDEtHpLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702982859; x=1734518859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/Zy+edblWdeSreib3JMNaA4vrgKPikBm2KGVvo+RDw=;
  b=jDEtHpLmEc5+gWTZKI0YX3otZMoxsR7PHyO2VkTo/mGwPouA3AUc5WIf
   HihmTkIMMPBcKaV4EpA7ISS8xkqWccRzPgQplzGBwPFm9Akz94F/gKZ5/
   6t7veUML7mqYxlmKrWnzz85CjC5HwWLAMn5oOzt9yxOUYvM/LyJWovitm
   QDGtAE5EHl/5HjInNF/BaQ1+7K2NgMWULsux3RsP+HX2aWPb41byBiAHJ
   JFESkpF7+E+znzekdUjW5YLvuEIYnwntlv5X8PR2E9SKiK1jTdQKfY3Fn
   I8/z0TWW2i9POe5lC2L1am/UAN05Xghh7nBmLqcBoUjqu3Okz4rh4s5vd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="17199671"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="17199671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 02:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="919589922"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="919589922"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2023 02:47:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFXdP-0005CV-2B;
	Tue, 19 Dec 2023 10:47:35 +0000
Date: Tue, 19 Dec 2023 18:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango_2 8169/8189]
 drivers/nvmem/layouts/adtran.c:120:20: error: incompatible function pointer
 types assigning to 'int (*)(struct device *, struct nvmem_device *)' from
 'int (struct device *, struct nvmem_device *, struct nvmem_layout *)'
Message-ID: <202312191824.BsC1yG88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango_2
head:   670048c586df4fb19346af950101a4e7c8dae47e
commit: e0ebb0ddabd5e21d055decc3d57bd5ebe2e4af18 [8169/8189] nvmem: add layout for Adtran devices
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231219/202312191824.BsC1yG88-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191824.BsC1yG88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191824.BsC1yG88-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/layouts/adtran.c:120:20: error: incompatible function pointer types assigning to 'int (*)(struct device *, struct nvmem_device *)' from 'int (struct device *, struct nvmem_device *, struct nvmem_layout *)' [-Wincompatible-function-pointer-types]
           layout->add_cells = adtran_add_cells;
                             ^ ~~~~~~~~~~~~~~~~
>> drivers/nvmem/layouts/adtran.c:121:14: error: assigning to 'struct device' from incompatible type 'struct device *'; remove &
           layout->dev = &pdev->dev;
                       ^ ~~~~~~~~~~
   2 errors generated.


vim +120 drivers/nvmem/layouts/adtran.c

   111	
   112	static int adtran_probe(struct platform_device *pdev)
   113	{
   114		struct nvmem_layout *layout;
   115	
   116		layout = devm_kzalloc(&pdev->dev, sizeof(*layout), GFP_KERNEL);
   117		if (!layout)
   118			return -ENOMEM;
   119	
 > 120		layout->add_cells = adtran_add_cells;
 > 121		layout->dev = &pdev->dev;
   122	
   123		platform_set_drvdata(pdev, layout);
   124	
   125		return nvmem_layout_register(layout);
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
