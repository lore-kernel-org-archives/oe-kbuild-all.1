Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F273199
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714331084; cv=none; b=kp9n/Mcu/EchEvs+E9PGnxyaAU7bhUNbNXJBgSc6/u1S7b9zlGkxISA6MCOgYo89zRoRbzjE7ViHqdnB7uu25fzeWy2E7flxa+JT7bPHkPfQcrkWHNqekzUSkeWw1iiazEjs//RDae773HPkFW0hvzgis1KBOu2ML1BgQxm5r5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714331084; c=relaxed/simple;
	bh=XN5LCvReyKBsJAYigKLJvyg+LJmmpMG7UCvwfP/4Wd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQRphTEo1njQWS37nE1p14+0jyawNbiNoVQsI9hnSf16YzObB1EoIApakuetk5x/BKiLkOCmb5PoQiDxqyue5sRQcBVhhVh6f7gXXqqxZlkSDQV4wc154CWxstI+bRTJ17lGS0hudEprA8mOL7OYP530QlnUi6MqCS8/3ww78DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1SdS5mz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1SdS5mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714331083; x=1745867083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XN5LCvReyKBsJAYigKLJvyg+LJmmpMG7UCvwfP/4Wd4=;
  b=R1SdS5mzLr81hB6Ppue1KwYQlt3DGC/zSuFSaOv+dLinGIjwMTS7zHrB
   Pf5hrijjHpAz08BflsTud/sKEmWlUPaK8je6cCMoPcKe33F9Kncz3yb9L
   oFAfidNPyZkARkQnGRf6K8tbtAtwfrhgSrbnS0OsXOaN9ICFJnOFvge/1
   Rl9VbeM0NP9PSiuZ7aOFFxPZT99JBVjycs+wOysXN6Lgb9DEsdcj//MqA
   5BaSa5kci0F4rVVfJP//Y6lq+owu73m3viwp0YLKHfc4si2Z4djaeAFC9
   B93rkv5yKRRubfABL/BCttbGTSZizKBs7fzr5AqH2QhL3w+cjmIrhGhxZ
   w==;
X-CSE-ConnectionGUID: uLz2+9f4SjOrwc3PwEUj9g==
X-CSE-MsgGUID: 95gQNR3SSrKn/thxrM5z7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20606351"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="20606351"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 12:04:42 -0700
X-CSE-ConnectionGUID: E4uR8aViRymHzb4Obt0CbQ==
X-CSE-MsgGUID: z+dl9tVWQlSel6tIZCRk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30727496"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Apr 2024 12:04:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s19pG-0006Zg-1H;
	Sun, 28 Apr 2024 19:04:38 +0000
Date: Mon, 29 Apr 2024 03:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5880/11728]
 drivers/clk/imx/imx95-blk-ctrl.c:328:25: error: 'imx95_blk_ctrl_match'
 undeclared here (not in a function); did you mean 'imx95_bc_of_match'?
Message-ID: <202404290328.odfGyZsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: b2ce3f7fa3779b1409e6083db48f7cc95a273654 [5880/11728] Merge branch 'dts/next' into next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404290328.odfGyZsx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290328.odfGyZsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290328.odfGyZsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/clk/imx/imx95-blk-ctrl.c:10:
>> drivers/clk/imx/imx95-blk-ctrl.c:328:25: error: 'imx95_blk_ctrl_match' undeclared here (not in a function); did you mean 'imx95_bc_of_match'?
     328 | MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
         |                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__imx95_blk_ctrl_match_device_table' aliased to undefined symbol 'imx95_blk_ctrl_match'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/clk/imx/imx95-blk-ctrl.c:328:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     328 | MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +328 drivers/clk/imx/imx95-blk-ctrl.c

387c5cea9cf94e Peng Fan 2023-09-18  318  
387c5cea9cf94e Peng Fan 2023-09-18  319  static const struct of_device_id imx95_bc_of_match[] = {
387c5cea9cf94e Peng Fan 2023-09-18  320  	{ .compatible = "fsl,imx95-vpumix-blk-ctrl", .data = &vpublk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  321  	{ .compatible = "fsl,imx95-cameramix-csr", .data = &camblk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  322  	{ .compatible = "fsl,imx95-display-master-csr", },
387c5cea9cf94e Peng Fan 2023-09-18  323  	{ .compatible = "fsl,imx95-dispmix-lvds-csr", .data = &lvds_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  324  	{ .compatible = "fsl,imx95-dispmix-csr", .data = &dispmix_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  325  	{ .compatible = "fsl,imx95-netcmix-blk-ctrl", },
387c5cea9cf94e Peng Fan 2023-09-18  326  	{ /* Sentinel */ },
387c5cea9cf94e Peng Fan 2023-09-18  327  };
387c5cea9cf94e Peng Fan 2023-09-18 @328  MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
387c5cea9cf94e Peng Fan 2023-09-18  329  

:::::: The code at line 328 was first introduced by commit
:::::: 387c5cea9cf94eb645f2e433404f023b24dfd509 LF-10523-12 clk: imx: add i.MX95 blk ctrl clk driver

:::::: TO: Peng Fan <peng.fan@nxp.com>
:::::: CC: Peng Fan <peng.fan@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
