Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D464214A91
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727622517; cv=none; b=e8A7Rqz0Ovsi+ps6rZYXmOIdA0cTkNDvZDo8mF1HPYlSKzWPqNbp4DSeiMdGEBD6wqp8KgATI+NaxAvjq/8H8QMkvk5RuL2AXTV8NDEp098zQfvYH7y3bIw4dqqpxLPQ/wuApgFRsun8AWyZv7qYYy+BdOrhzRJKoxxcd+pMWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727622517; c=relaxed/simple;
	bh=uHZO0nJ/vc8ycghXKS2zYM/hkgHxatodB1/hW5hNrXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0cDJwJkfzK5cXNXk83FjBJZMiXq0ZemuOzywWvLrzysn+caQjO/egdNq02RPFpfApGyhzKywlOatntx/dlRzhsVD9qww0rl6n5axKG/yz1LtzAidFGLGKRv8ajFdjjhsOOIpwiwleFz5i/L/ZIfPBY21JEfqwxXtJ8jiknUNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0bh/WXm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0bh/WXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727622515; x=1759158515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHZO0nJ/vc8ycghXKS2zYM/hkgHxatodB1/hW5hNrXY=;
  b=F0bh/WXmHmVFfUpbI2ZM+kgDsTYVdhCTn9xo4ZAnmwt8jJMftZdwHxSg
   y7jvZlJr98LIwajk/txrB+wG8st/Pm3U9No4KO7hDbzbH3/ebEfJhfcGx
   p8VJY8H+4+Kzfmu43YE9F7pNz9grCEKMFiWFdysX6TLeuHZDdtGWj2C91
   Xx8Xjwpu4uRvEollEi8FaUlbIgYpn8d+ohQsUJOGpE57c+CD4GsgdP6xQ
   s9e0NV/uRjSKIewQaOrgxkZnQcT1I+KMB4uivmfEURA7tJdzicfvB0wr2
   Wtjx9v6FAzyf2DKcWY9RCGTPRpS/fmvDEiSTYkxF/StpeV3PnKoKsn/Zf
   Q==;
X-CSE-ConnectionGUID: cKS4LYECTXOMkHsmeK1K6Q==
X-CSE-MsgGUID: Ea1molVbRS+dPN7X9bNmkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44175520"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44175520"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:08:34 -0700
X-CSE-ConnectionGUID: E6ak07UgT9SyFKg/EaUvYA==
X-CSE-MsgGUID: 2Ru0Fkk4Sr6zX0aCbN/0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73191341"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 08:08:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suvXD-000ONt-05;
	Sun, 29 Sep 2024 15:08:31 +0000
Date: Sun, 29 Sep 2024 23:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5880/16788]
 drivers/clk/imx/imx95-blk-ctrl.c:319:34: warning: unused variable
 'imx95_bc_of_match'
Message-ID: <202409292231.880WVULl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b2ce3f7fa3779b1409e6083db48f7cc95a273654 [5880/16788] Merge branch 'dts/next' into next
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292231.880WVULl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292231.880WVULl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292231.880WVULl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/imx95-blk-ctrl.c:319:34: warning: unused variable 'imx95_bc_of_match' [-Wunused-const-variable]
     319 | static const struct of_device_id imx95_bc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/imx95_bc_of_match +319 drivers/clk/imx/imx95-blk-ctrl.c

387c5cea9cf94e Peng Fan 2023-09-18  318  
387c5cea9cf94e Peng Fan 2023-09-18 @319  static const struct of_device_id imx95_bc_of_match[] = {
387c5cea9cf94e Peng Fan 2023-09-18  320  	{ .compatible = "fsl,imx95-vpumix-blk-ctrl", .data = &vpublk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  321  	{ .compatible = "fsl,imx95-cameramix-csr", .data = &camblk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  322  	{ .compatible = "fsl,imx95-display-master-csr", },
387c5cea9cf94e Peng Fan 2023-09-18  323  	{ .compatible = "fsl,imx95-dispmix-lvds-csr", .data = &lvds_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  324  	{ .compatible = "fsl,imx95-dispmix-csr", .data = &dispmix_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  325  	{ .compatible = "fsl,imx95-netcmix-blk-ctrl", },
387c5cea9cf94e Peng Fan 2023-09-18  326  	{ /* Sentinel */ },
387c5cea9cf94e Peng Fan 2023-09-18  327  };
387c5cea9cf94e Peng Fan 2023-09-18  328  MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
387c5cea9cf94e Peng Fan 2023-09-18  329  

:::::: The code at line 319 was first introduced by commit
:::::: 387c5cea9cf94eb645f2e433404f023b24dfd509 LF-10523-12 clk: imx: add i.MX95 blk ctrl clk driver

:::::: TO: Peng Fan <peng.fan@nxp.com>
:::::: CC: Peng Fan <peng.fan@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
