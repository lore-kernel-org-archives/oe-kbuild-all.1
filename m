Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC216FCF9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 22:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mfu8LbdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701814078; x=1733350078;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xfjubcAk9SdUG6nGOiID2LAEnJ9bBsVuBZiBykzBbV8=;
  b=Mfu8LbdELYioG7f8TCT7Q7Mk0z5hAKePor0UM+xtFuBIw1CurdpdL8Rh
   tnuseTIgl+huJmiEzFEfNxo8dOI5YMQa6+DRcMwYi2+AsjtNxamhqais3
   +CaTg5BjZ32JO1DVFhXRRxsQAPSl2D07itKAFalQg2wW4co8V4SAWcakB
   Caa410GMvixY++7tJUp9Sh9b1LHi90huNY5dVgWMKSmbwy+yIzDglWwYi
   tj/qYQ6vUexgsaazZ+fKRdUEy3kI8GugsdBGQaafmJPla0BN/xEfbVey5
   cLBqNxvSRhuFlTN5J5EgV+wvs0it3iQjI0RDO9GQSJ+TqRa3X+TXhf411
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="806424"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="806424"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12475849"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 14:07:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAda4-0009nM-23;
	Tue, 05 Dec 2023 22:07:52 +0000
Date: Wed, 6 Dec 2023 06:07:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382] ld.lld: error: undefined symbol:
 phy_mipi_dphy_get_default_config_for_hsclk
Message-ID: <202312060659.RZXKmWys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   1cb8996ccfb7d8e394f629a7d6432d03e18bfd4a
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-002-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060659.RZXKmWys-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060659.RZXKmWys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060659.RZXKmWys-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
   >>> referenced by cdns-csi2rx.c:224 (drivers/media/platform/cadence/cdns-csi2rx.c:224)
   >>>               drivers/media/platform/cadence/cdns-csi2rx.o:(csi2rx_resume) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
