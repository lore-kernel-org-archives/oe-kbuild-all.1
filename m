Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0BEAFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687649665; x=1719185665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCctGXuXtO3gQKZg5SyPj7FIC4SYYyMwKGV1Igay06w=;
  b=n9P7Ugj/hscmr6CPOp3UcA62+qKKxKWt589xblQ43V5WNf3AO0DtQvQK
   cmKhKuW/+6uwLeUfZN8d0poDZsZrnhs0LNDTegXrN0e+lWrNQRit5d/OW
   Of88/HR+58N+wk7VsdgWI4z8BzXAL7SW8e+1/wv7CmSwsh6uGQqyGa62y
   g4HYQE65ohAJCCraGfqj9K8hE7yzaNejhgKyDo4Uq40m2U5EQPAfBR5KF
   oulEmJgFInRTGlAa0Srh1MGDmRrAdoSVpgMV8oiUrTbBbYZEhVWBm8sE+
   UB0jy+qpSNVGkRs7pG6npYYKxCkawrnrao7uf3Bt0u/2r2At+64bbEwp/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="391122029"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="391122029"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 16:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="839837857"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="839837857"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jun 2023 16:34:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDClp-0009Xp-32;
	Sat, 24 Jun 2023 23:34:21 +0000
Date: Sun, 25 Jun 2023 07:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/arm/include/asm/futex.h:146:17: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202306250757.SGJ4havv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a92b7d26c743b9dc06d520f863d624e94978a1d9
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform support
date:   1 year, 3 months ago
config: arm-randconfig-s042-20230625 (https://download.01.org/0day-ci/archive/20230625/202306250757.SGJ4havv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250757.SGJ4havv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306250757.SGJ4havv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/waitwake.c: note: in included file (through kernel/futex/futex.h):
>> arch/arm/include/asm/futex.h:146:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *ptr @@     got unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:146:17: sparse:     expected void const *ptr
   arch/arm/include/asm/futex.h:146:17: sparse:     got unsigned int [noderef] [usertype] __user *uaddr
   arch/arm/include/asm/futex.h:149:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *ptr @@     got unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:149:17: sparse:     expected void const *ptr
   arch/arm/include/asm/futex.h:149:17: sparse:     got unsigned int [noderef] [usertype] __user *uaddr
   arch/arm/include/asm/futex.h:152:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *ptr @@     got unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:152:17: sparse:     expected void const *ptr
   arch/arm/include/asm/futex.h:152:17: sparse:     got unsigned int [noderef] [usertype] __user *uaddr
   arch/arm/include/asm/futex.h:155:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *ptr @@     got unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:155:17: sparse:     expected void const *ptr
   arch/arm/include/asm/futex.h:155:17: sparse:     got unsigned int [noderef] [usertype] __user *uaddr
   arch/arm/include/asm/futex.h:158:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *ptr @@     got unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:158:17: sparse:     expected void const *ptr
   arch/arm/include/asm/futex.h:158:17: sparse:     got unsigned int [noderef] [usertype] __user *uaddr
   kernel/futex/waitwake.c:262:33: sparse: sparse: context imbalance in 'futex_wake_op' - different lock contexts for basic block
   kernel/futex/waitwake.c:328:6: sparse: sparse: context imbalance in 'futex_wait_queue' - unexpected unlock
   kernel/futex/waitwake.c:449:36: sparse: sparse: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock

vim +146 arch/arm/include/asm/futex.h

e589ed23dd27b8 Mikael Pettersson 2008-08-20  143  
e589ed23dd27b8 Mikael Pettersson 2008-08-20  144  	switch (op) {
e589ed23dd27b8 Mikael Pettersson 2008-08-20  145  	case FUTEX_OP_SET:
df77abcafc8dc8 Will Deacon       2011-09-23 @146  		__futex_atomic_op("mov	%0, %4", ret, oldval, tmp, uaddr, oparg);
e589ed23dd27b8 Mikael Pettersson 2008-08-20  147  		break;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  148  	case FUTEX_OP_ADD:
df77abcafc8dc8 Will Deacon       2011-09-23  149  		__futex_atomic_op("add	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
e589ed23dd27b8 Mikael Pettersson 2008-08-20  150  		break;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  151  	case FUTEX_OP_OR:
df77abcafc8dc8 Will Deacon       2011-09-23  152  		__futex_atomic_op("orr	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
e589ed23dd27b8 Mikael Pettersson 2008-08-20  153  		break;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  154  	case FUTEX_OP_ANDN:
df77abcafc8dc8 Will Deacon       2011-09-23  155  		__futex_atomic_op("and	%0, %1, %4", ret, oldval, tmp, uaddr, ~oparg);
e589ed23dd27b8 Mikael Pettersson 2008-08-20  156  		break;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  157  	case FUTEX_OP_XOR:
df77abcafc8dc8 Will Deacon       2011-09-23  158  		__futex_atomic_op("eor	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
e589ed23dd27b8 Mikael Pettersson 2008-08-20  159  		break;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  160  	default:
e589ed23dd27b8 Mikael Pettersson 2008-08-20  161  		ret = -ENOSYS;
e589ed23dd27b8 Mikael Pettersson 2008-08-20  162  	}
e589ed23dd27b8 Mikael Pettersson 2008-08-20  163  

:::::: The code at line 146 was first introduced by commit
:::::: df77abcafc8dc881b6c9347548651777088e4b27 ARM: 7099/1: futex: preserve oldval in SMP __futex_atomic_op

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
