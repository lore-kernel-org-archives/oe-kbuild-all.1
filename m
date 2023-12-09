Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F42F5B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRY5KkRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702108762; x=1733644762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oC6HlibPjeskpkbHxnfVDfp6xup0aWzM8du2O9vWEQs=;
  b=SRY5KkRGADEIJHhTsB3wmv8y70coqxXmAfihu/F+t2kF4rjKmapJtXBO
   FMUu5mKZRLbTlTUHRE9zxZtFQRZ2C/J3FRLsFD7lYWtYYjSyX2j0ZX4a8
   LOtR2kb2ksbjwb+DiVZrwt5rp1cCYTENO5pLHdIPM3kYM730qp58kkjZ3
   Et9uE268a2kgxm3fDp5CiPvqfOQvtzmzUsshoQsCb1TvyZpnAYvd2By2h
   CqdQ6WkYuLXjb+MtEaOHV0Sj9b2jy1zyE/vB1J57yL5QqZEcQTxG7sKTc
   Rk95/M43/g5wMwfwC6K1bkQvr/wub9pGeUWjvpKf6hCBXzpuHHzPaSCBH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="397292604"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="397292604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 23:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="863142710"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="863142710"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2023 23:59:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBsF4-000F18-1R;
	Sat, 09 Dec 2023 07:59:18 +0000
Date: Sat, 9 Dec 2023 15:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/cfi 7/7] arch/x86/include/asm/cfi.h:142:55: error:
 expected string literal before ')' token
Message-ID: <202312091548.9bwYOYia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/cfi
head:   1b448648ec2efe567e99d4181c46349cc003bd8d
commit: 1b448648ec2efe567e99d4181c46349cc003bd8d [7/7] bpf: Fix dtor CFI
config: i386-buildonly-randconfig-003-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091548.9bwYOYia-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091548.9bwYOYia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091548.9bwYOYia-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cfi.h:12,
                    from include/linux/bpf.h:32,
                    from kernel/bpf/helpers.c:4:
>> arch/x86/include/asm/cfi.h:142:55: error: expected string literal before ')' token
     142 | #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
         |                                                       ^
   kernel/bpf/helpers.c:2157:1: note: in expansion of macro 'CFI_NOSEAL'
    2157 | CFI_NOSEAL(bpf_task_release_dtor);
         | ^~~~~~~~~~
>> arch/x86/include/asm/cfi.h:142:55: error: expected string literal before ')' token
     142 | #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
         |                                                       ^
   kernel/bpf/helpers.c:2187:1: note: in expansion of macro 'CFI_NOSEAL'
    2187 | CFI_NOSEAL(bpf_cgroup_release_dtor);
         | ^~~~~~~~~~


vim +142 arch/x86/include/asm/cfi.h

3c516f89e17e56 Sami Tolvanen  2022-09-08  141  
0c149ca8856307 Peter Zijlstra 2023-12-08 @142  #define CFI_NOSEAL(x)	asm(IBT_NOSEAL(__stringify(x)))
0c149ca8856307 Peter Zijlstra 2023-12-08  143  

:::::: The code at line 142 was first introduced by commit
:::::: 0c149ca88563072a0d248d71de98bdc6b91b7514 cfi: Add CFI_NOSEAL()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
