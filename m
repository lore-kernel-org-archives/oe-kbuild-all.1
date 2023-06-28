Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD26C2D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687964207; x=1719500207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kynr3sNVsCG9YG2KtCv6ASQoJZRffuuT4j/Jm+zEiYA=;
  b=fPxyar3n01xsnANIwxGz0f+PMQLNYlSHD2HfWAqB+lazWD/mdLF3Cpsv
   xe83RRpPFqJfNMXFrM8Rh2OL6SwI7v3FeQwPFva9V4EAhzfaHOuFKgwp1
   z7ls9iHOJ79NLYVIX+06Tl6C0/QBMG36TGqz64cgpo6csP6JbnqU7aDeV
   ia/RfS4np/wkZttrZaTmK/E0LAXn4TYeVe92r6X5tu1Y6kZCN5pv4kxVG
   o+g+pegisYuuO5PnTZhuZFIG6e2I3//cep027469imm/sHSEZhef54IqV
   TYqS5DRbDPYk5AWaNj7RRifUwQg9jgh0+qlqO4s2cf1YqddwIpC6piHKX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="361908626"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="361908626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 07:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861570625"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="861570625"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 07:56:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEWb6-000DJh-0z;
	Wed, 28 Jun 2023 14:56:44 +0000
Date: Wed, 28 Jun 2023 22:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 290/385] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202306282214.Xcq9yCEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   d6148915d97f4535395579f728454c4f68f0774b
commit: b93fdc02497d5dcf7405a2290c0acf7f7af011d9 [290/385] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: x86_64-randconfig-x014-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282214.Xcq9yCEn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282214.Xcq9yCEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282214.Xcq9yCEn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   kernel/sched/alt_sched.h:296:20: note: previous definition is here
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   1 error generated.


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
