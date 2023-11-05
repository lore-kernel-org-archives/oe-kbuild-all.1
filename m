Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D478A8486
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ado1bGCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699184276; x=1730720276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9p3RZ+xspAXiRQaP6EEsFuNw3siqXsA3w4cBYt/4KY=;
  b=ado1bGCsOmN2YmDkWHmYr/sixBprwpH6kn2gWPuQfWD3Tw+eW/GDJjsm
   4zN/aaq3MBoCYlb+ogEJwGWS/IuWNCuS/SBtieGkS9mKSMtkvNVs8f+FU
   aPx9hmYH1Y2cWi2pzg0fnLukHGmtdslJRrNjZkw7uwwme1uXyhn3lcpZt
   o5b8y8gk5eqUpObZEutGYJPhioyLS4wiISlHu+4wGMKPuUbeyP74QpFnv
   x8vNBllSuQU6kx6valOpuFcCufOT8Ew99kBRlbB+DVFL+K2zVAaSSaPCk
   Et+lH9Ukp3IaEpXW8+nnBU6KaKYlWk37/bcfiANkqJ+nUE1ENz9rCetWI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="10679298"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10679298"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 03:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="765698583"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="765698583"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2023 03:37:53 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzbRv-0005Mt-10;
	Sun, 05 Nov 2023 11:37:51 +0000
Date: Sun, 5 Nov 2023 19:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: drivers/firmware/smccc/smccc.c:20:21: sparse: sparse: symbol
 'smccc_soc_id_version' was not declared. Should it be static?
Message-ID: <202311051931.ytw4Vqta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   7 months ago
config: arm64-randconfig-r122-20231102 (https://download.01.org/0day-ci/archive/20231105/202311051931.ytw4Vqta-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311051931.ytw4Vqta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051931.ytw4Vqta-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/smccc/smccc.c:20:21: sparse: sparse: symbol 'smccc_soc_id_version' was not declared. Should it be static?
>> drivers/firmware/smccc/smccc.c:21:21: sparse: sparse: symbol 'smccc_soc_id_revision' was not declared. Should it be static?

vim +/smccc_soc_id_version +20 drivers/firmware/smccc/smccc.c

    17	
    18	bool __ro_after_init smccc_trng_available = false;
    19	u64 __ro_after_init smccc_has_sve_hint = false;
  > 20	s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
  > 21	s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
