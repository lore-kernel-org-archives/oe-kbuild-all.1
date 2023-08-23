Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ABD1FB35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 23:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692831850; x=1724367850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HjhjHEqh+HmnLzLYb5X3h61wfCOgLoNMR0eFaa+9X4Q=;
  b=M7aE9AgOtISzzXJVwauU3xpnMj61pM+DvnDCFGZw9MvGXgqCveZDXSWE
   S4SBdSMMD+oEbi1xgPNtXiSM/QBYjbZp/2rWlX1JuEPSzztikT/VC17Ku
   J5mZQR/hSZsc0AcFp19IO6kzzefu8ys0j/+lwPGFQh+EK6G4I9YSXgUEC
   VopPifWAZoTSU1KcA//uuFwDrP3zL9dx/aWhOmW+Fjsxf0V0Hue/+D6ox
   LVXXmKS5ENqefd58wQwQqepnalNqDjzgifHZkF1Fp7sUgbwKXlRkt7/8t
   uJLf7h9QXq+w5Tuv2n9Xj6lW5jEcUqhXUzQSFoqrI2OmecrEtacFvbDtt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="359279261"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359279261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 16:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739946358"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739946358"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 16:04:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYwtP-0001ZQ-2b;
	Wed, 23 Aug 2023 23:04:03 +0000
Date: Thu, 24 Aug 2023 07:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 11798/12208] powerpc-linux-ld: warning: orphan
 section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in
 section `.init.plt'
Message-ID: <202308240641.qsfwbMAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 66aac8ea0a6c79729f99087b1c5a596938e5d838 [11798/12208] dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL in fsl-edma-common.c
config: powerpc-randconfig-r061-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240641.qsfwbMAZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240641.qsfwbMAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240641.qsfwbMAZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/dma/fsl-edma-common.o' being placed in section `.init.plt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
