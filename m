Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89964134BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeRIcuVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195540; x=1728731540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvYTkq1hZxQ0VUVP2yVGUGbfaF11eiqykjx0r+lsxok=;
  b=LeRIcuVU10fpp/EpZt308R55KOuZZ06bFfg4ZLO6VmvlunbdFB6qFqFf
   zbW5eAVZfwGoDfigNGbDy9bZ3yHo39vP3ylTYmfn31MHAQBgKPf1IF96n
   QFrIW1Zy6EZYZTxDZQv/1D9HGemwPZEU0VbHwl4QBIJEC6zUbM+un1djO
   O6sEffaFxaGGqlfMckdNnCnJfKE8BblmaDM4I3jhxisBahAwBoOBqDVuc
   yveqB8fOB9xjKbpwJ+rhGcj+zMUf9CZO9qb0oZ9gK6INLLchXdGes5jxf
   hdynaoZZYi96/+2X3rdDdCeTE76/DH8tbsDqeuStPoDF1hGEsrWYCgPXL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382385856"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382385856"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="784118123"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="784118123"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 04:12:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrG5T-0004fb-38;
	Fri, 13 Oct 2023 11:12:11 +0000
Date: Fri, 13 Oct 2023 19:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 6049/30000] drivers/edac/synopsys_edac.c:295:
 warning: Function parameter or member 'data_low' not described in
 'ecc_error_info'
Message-ID: <202310131818.68vYvKwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 97b100a74e4609900ba1039d72f700eb962448f2 [6049/30000] MLK-23333-2 EDAC: synopsys: Add more useful output information for CE/UE
config: arm64-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131818.68vYvKwP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131818.68vYvKwP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131818.68vYvKwP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'data_low' not described in 'ecc_error_info'
>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'data_high' not described in 'ecc_error_info'
>> drivers/edac/synopsys_edac.c:295: warning: Function parameter or member 'syndrome' not described in 'ecc_error_info'


vim +295 drivers/edac/synopsys_edac.c

6e16bd7f7c9655 Sherry Sun                2020-02-12  274  
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  275  /**
225af74d6312b2 Manish Narani             2018-10-04  276   * struct ecc_error_info - ECC error log information.
225af74d6312b2 Manish Narani             2018-10-04  277   * @row:	Row number.
225af74d6312b2 Manish Narani             2018-10-04  278   * @col:	Column number.
225af74d6312b2 Manish Narani             2018-10-04  279   * @bank:	Bank number.
225af74d6312b2 Manish Narani             2018-10-04  280   * @bitpos:	Bit position.
225af74d6312b2 Manish Narani             2018-10-04  281   * @data:	Data causing the error.
b500b4a029d577 Manish Narani             2018-10-25  282   * @bankgrpnr:	Bank group number.
b500b4a029d577 Manish Narani             2018-10-25  283   * @blknr:	Block number.
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  284   */
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  285  struct ecc_error_info {
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  286  	u32 row;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  287  	u32 col;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  288  	u32 bank;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  289  	u32 bitpos;
97b100a74e4609 Sherry Sun                2020-02-17  290  	u32 data_low;
97b100a74e4609 Sherry Sun                2020-02-17  291  	u32 data_high;
b500b4a029d577 Manish Narani             2018-10-25  292  	u32 bankgrpnr;
b500b4a029d577 Manish Narani             2018-10-25  293  	u32 blknr;
97b100a74e4609 Sherry Sun                2020-02-17  294  	u32 syndrome;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06 @295  };
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  296  

:::::: The code at line 295 was first introduced by commit
:::::: ae9b56e3996dadbb59c727018f45486c06844261 EDAC, synps: Add EDAC support for zynq ddr ecc controller

:::::: TO: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
