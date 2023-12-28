Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4255F9CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8yrKRHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703789232; x=1735325232;
  h=date:from:cc:subject:message-id:mime-version;
  bh=91NkQ36rii9tB44kGHSnGrp3lTS+ij0X13mVg4k9nfg=;
  b=C8yrKRHJ8KVH4cnNDf6JOFfefbU9kgO4KudaxcCz9lmj0alyGrmxdMZe
   Y4rZf5YIobe2rN5IMSLSCv1S6IEI2Z9xxznnKG2zL6UFLySYGUaiiVOAy
   UGMc2efAzM7stSdz5i8uIV5q2nRv2focQB47wOBQCxTRNMgusKFm9pFd3
   d4lsx9soQDkfrkTG37NeelmpFuTg5vdz2gftXTaz2fuyMAzsx2GszNv5g
   pNm5fPTSs8j8vY9Eb3PkSe4VdFGKRcptnpU1pb+pDOQ5isc0YfzrUBcGA
   AlJzTtxAD4Mypj70i522MeFSc7jHkviiviFJ6dljryemhbgNOqZKdLmdA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3411733"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3411733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 10:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="807501890"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="807501890"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Dec 2023 10:47:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIvPQ-000Gk9-0Y;
	Thu, 28 Dec 2023 18:47:08 +0000
Date: Fri, 29 Dec 2023 02:46:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382] xtensa-linux-ld:
 drivers/media/platform/cadence/cdns-csi2rx.o:undefined reference to
 `phy_mipi_dphy_get_default_config_for_hsclk'
Message-ID: <202312290203.L50npg9d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6fb4edc44604c47af3c3cad1b691773ab5c855a1
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: xtensa-randconfig-002-20231228 (https://download.01.org/0day-ci/archive/20231229/202312290203.L50npg9d-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290203.L50npg9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290203.L50npg9d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/media/platform/cadence/cdns-csi2rx.o:(.text+0x10): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'
   xtensa-linux-ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_external_dphy':
   cdns-csi2rx.c:(.text+0x15e): undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
