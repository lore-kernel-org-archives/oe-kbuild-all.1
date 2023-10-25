Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C197328CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhE+s2Eq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698265477; x=1729801477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50lezsTRWeiGgEyhKRXuHIogiDsiRE3P10D8lqfp2PY=;
  b=nhE+s2Eq4aT5KOCxKsjCksy9I7wNOAlbpYwNqqAQxwRHQLWmZ5LFfwHA
   0RCUn9vJ6Q0X6SDrELmC3v1Xe5/KXQj9CmlyRmGBofh6UQ8OQDckTxLtb
   /2xN64C7EIPEEl+XGWytaiph308T88Kdlw7x/kDtnMnAiJAxO3DPxRIpt
   6Hy29gz47T0rODxDTzxoIQq6JTlESOaXLy5NFgdH3mLjyqVinVHRjAchq
   8AffGSKSq3A3v114A9sUF7nFAH7zO+pN3flGoHIPmr6hCBxvVdE9aci7T
   xaDeeFfWQ0NQmNGFGlo2tQxsuo86buAR5ihYwMm2QgsvVmSd77ldhtUFz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367605639"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="367605639"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882566190"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="882566190"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Oct 2023 13:24:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvkQa-0009Aw-06;
	Wed, 25 Oct 2023 20:24:32 +0000
Date: Thu, 26 Oct 2023 04:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [srini-nvmem:for-next 1/1] drivers/mtd/mtdcore.c:548:29: warning:
 unused variable 'node'
Message-ID: <202310260402.NPx7gZH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   ca7384334d9bf741e2768d60887924671c4d9a7f
commit: ca7384334d9bf741e2768d60887924671c4d9a7f [1/1] Revert "nvmem: add new config option"
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310260402.NPx7gZH3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260402.NPx7gZH3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260402.NPx7gZH3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/mtdcore.c: In function 'mtd_nvmem_add':
>> drivers/mtd/mtdcore.c:548:29: warning: unused variable 'node' [-Wunused-variable]
     548 |         struct device_node *node = mtd_get_of_node(mtd);
         |                             ^~~~


vim +/node +548 drivers/mtd/mtdcore.c

c4dfa25ab307a2 Alban Bedel        2018-11-13  545  
c4dfa25ab307a2 Alban Bedel        2018-11-13  546  static int mtd_nvmem_add(struct mtd_info *mtd)
c4dfa25ab307a2 Alban Bedel        2018-11-13  547  {
658c4448bbbf02 Christian Marangi  2021-03-12 @548  	struct device_node *node = mtd_get_of_node(mtd);
c4dfa25ab307a2 Alban Bedel        2018-11-13  549  	struct nvmem_config config = {};
c4dfa25ab307a2 Alban Bedel        2018-11-13  550  
75f32f4b9d5263 Miquel Raynal      2023-03-07  551  	config.id = NVMEM_DEVID_NONE;
c4dfa25ab307a2 Alban Bedel        2018-11-13  552  	config.dev = &mtd->dev;
7b01b7239d0dc9 Ricardo Ribalda    2020-04-30  553  	config.name = dev_name(&mtd->dev);
c4dfa25ab307a2 Alban Bedel        2018-11-13  554  	config.owner = THIS_MODULE;
c4dfa25ab307a2 Alban Bedel        2018-11-13  555  	config.reg_read = mtd_nvmem_reg_read;
c4dfa25ab307a2 Alban Bedel        2018-11-13  556  	config.size = mtd->size;
c4dfa25ab307a2 Alban Bedel        2018-11-13  557  	config.word_size = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  558  	config.stride = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  559  	config.read_only = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  560  	config.root_only = true;
6c7621890995d0 Christophe Kerello 2022-02-20  561  	config.ignore_wp = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  562  	config.priv = mtd;
c4dfa25ab307a2 Alban Bedel        2018-11-13  563  
c4dfa25ab307a2 Alban Bedel        2018-11-13  564  	mtd->nvmem = nvmem_register(&config);
c4dfa25ab307a2 Alban Bedel        2018-11-13  565  	if (IS_ERR(mtd->nvmem)) {
c4dfa25ab307a2 Alban Bedel        2018-11-13  566  		/* Just ignore if there is no NVMEM support in the kernel */
5cab06156aade1 Miquel Raynal      2023-03-07  567  		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
c4dfa25ab307a2 Alban Bedel        2018-11-13  568  			mtd->nvmem = NULL;
5cab06156aade1 Miquel Raynal      2023-03-07  569  		else
5cab06156aade1 Miquel Raynal      2023-03-07  570  			return dev_err_probe(&mtd->dev, PTR_ERR(mtd->nvmem),
5cab06156aade1 Miquel Raynal      2023-03-07  571  					     "Failed to register NVMEM device\n");
c4dfa25ab307a2 Alban Bedel        2018-11-13  572  	}
c4dfa25ab307a2 Alban Bedel        2018-11-13  573  
c4dfa25ab307a2 Alban Bedel        2018-11-13  574  	return 0;
c4dfa25ab307a2 Alban Bedel        2018-11-13  575  }
c4dfa25ab307a2 Alban Bedel        2018-11-13  576  

:::::: The code at line 548 was first introduced by commit
:::::: 658c4448bbbf02a143abf1b89d09a3337ebd3ba6 mtd: core: add nvmem-cells compatible to parse mtd as nvmem cells

:::::: TO: Ansuel Smith <ansuelsmth@gmail.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
