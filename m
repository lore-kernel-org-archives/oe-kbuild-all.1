Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA7B62F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 03:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693107284; x=1724643284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWkk2EausJcu1Ln6aC+YgpTA4GLVoD5i5+hbZs0X/Ps=;
  b=GQdSsiWrcy0DgmNmCcwjbrbFRaj5yuOhu5QNi6GPEI0bT5qNiqLS8DcQ
   R+4UefUo23fwEJsT15QacCPJK71lwJTusdnFsVOGGj5XAL38v0q/wyPY7
   moD/8/cCq3K+MQC5ZEcz8gtRjFsr/Zgw7rhUq5WGaqNP3kisiqr2Qd5Ux
   qPFpeQMLzAo1g9ZlPjxEOM3Fb++5Nyj0yvaghrxHqFVLsUj209wiLY3/A
   FTm+gilx+KgobuqMEPCrTeTyZQYvL39Iqg742gajn4PYTrbiF4ekY7GxR
   vBTYn280EXh/4aDD9DS1V27/KEpwoVDo1KFjVkwquX6NMvDF07gmxN0nH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="441261205"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="441261205"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 20:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="861454000"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="861454000"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2023 20:34:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa6Xx-0005Kz-2w;
	Sun, 27 Aug 2023 03:34:41 +0000
Date: Sun, 27 Aug 2023 11:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_dpll.o: warning: objtool:
 chv_enable_pll()+0x2c9: unreachable instruction
Message-ID: <202308271152.G3jyXZS2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: 9f4df9473071d665325ceb0aff613c0a47d3a378 UPSTREAM: drm/i915: migrate pll enable/disable code to intel_dpll.[ch]
date:   2 years, 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230827/202308271152.G3jyXZS2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271152.G3jyXZS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271152.G3jyXZS2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dpll.o: warning: objtool: chv_enable_pll()+0x2c9: unreachable instruction


objdump-func vmlinux.o chv_enable_pll:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
