Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC627E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 02:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693018704; x=1724554704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+lBY9/qBLpeF74QBZgJXO2M2WCLJYmHleiAT3ceZ3c=;
  b=J3hG5Nv7zhoooSWjIii3TSErZPQpNDAdz88QKkC7wflaSf6vG2karxUD
   39lQL3l998+CbGI3GVDWO9THsHj9whdL+TCsJmGpc5oaseqKkX7wp9Zy9
   kJtP6BqSjHYlY5dbwDd5Sp4fAUK9aX+TYYHqRsBWkxJcCiXwb0AWBO0re
   mRC319Au8b0WEJTq2qU9L/vG6B5kA6Mter4SI4Pi3SYSXzR33axJ1GXlE
   2m5f1+KjQC4u7SGg9Hbx03PrEJi48PGmEPewO/TNjdTQIhyhAUe1SUdX6
   bIRDv+HiUknzZrM2vlgjMmguRKgD3wfmTDw0hXkSa2kltcFpotYOjZLDK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354367861"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354367861"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 19:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881355359"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2023 19:58:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZjVE-0004HD-2U;
	Sat, 26 Aug 2023 02:58:20 +0000
Date: Sat, 26 Aug 2023 10:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol
 '__pcpu_scope_overflow_stack' was not declared. Should it be static?
Message-ID: <202308261007.gkKH77GA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   382d4cd1847517ffcb1800fd462b625db7b2ebea
commit: 548ec3336f323db56260b312c232ab37285f0284 KVM: arm64: On stack overflow switch to hyp overflow_stack
date:   1 year, 1 month ago
config: arm64-randconfig-r131-20230824 (https://download.01.org/0day-ci/archive/20230826/202308261007.gkKH77GA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261007.gkKH77GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261007.gkKH77GA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/stacktrace.c:10:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?

vim +/__pcpu_scope_overflow_stack +10 arch/arm64/kvm/hyp/nvhe/stacktrace.c

  > 10	#include <asm/percpu.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
