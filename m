Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD417C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683593210; x=1715129210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mDmT19Zd5gm8SuzOvwCJKmQH7qi5g4qb6OYt0aV4cQ=;
  b=eiBK+IYXlon9WzlOxgSTvU1u42r0NF51ffQ2tlE3GM1/dMvoTyF7y/og
   Mwiwo8XKmj9nV0fQqQPhj+SVpeLvt3b7kxObIY6tjnKEjy2/JFeG7n53r
   5je1Rgc4xfkmGLkEwWTTcKWaTrhO2b0j5j6YjFPxZcgdz5wSvDIePB+5/
   S/aDQ+8WIxz0KM3ZgCUuHehjsnYSZ+AFGqg3XjPVSLqRxlW2hL2G4+M/L
   E1dN+ZdX8zWufkHVG78gBK8+Xnu+BQcEdB9rC8FBtF6Zh+C11fh3xYgHv
   sNye8YKmlgzDctJdkfXJqGJtO9H5LeuzzCnrt3ZKPOzpwzzj6SSdrHGIx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="339007872"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="339007872"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945066480"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="945066480"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 17:46:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwBV8-0001VF-0h;
	Tue, 09 May 2023 00:46:46 +0000
Date: Tue, 9 May 2023 08:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 6/7]
 include/linux/kvm_types.h:43:25: warning: conversion from 'long long
 unsigned int' to 'long unsigned int' changes value from
 '18446744073709551615' to '4294967295'
Message-ID: <202305090828.ujO6KTt1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 98be44e0e5eedf9af70491d6faf0536e02945d6e [6/7] KVM: RISC-V: Implement SBI PMU Snapshot feature
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230509/202305090828.ujO6KTt1-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/98be44e0e5eedf9af70491d6faf0536e02945d6e
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 98be44e0e5eedf9af70491d6faf0536e02945d6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090828.ujO6KTt1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:43,
                    from arch/riscv/kvm/vcpu_pmu.c:12:
   arch/riscv/kvm/vcpu_pmu.c: In function 'kvm_riscv_vcpu_pmu_enable_snapshot':
>> include/linux/kvm_types.h:43:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                         ^
   arch/riscv/kvm/vcpu_pmu.c:358:40: note: in expansion of macro 'INVALID_GPA'
     358 |                 kvpmu->snapshot_addr = INVALID_GPA;
         |                                        ^~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c: In function 'kvm_riscv_vcpu_pmu_init':
>> include/linux/kvm_types.h:43:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                         ^
   arch/riscv/kvm/vcpu_pmu.c:654:32: note: in expansion of macro 'INVALID_GPA'
     654 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                                ^~~~~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c: In function 'kvm_riscv_vcpu_pmu_deinit':
>> include/linux/kvm_types.h:43:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      43 | #define INVALID_GPA     (~(gpa_t)0)
         |                         ^
   arch/riscv/kvm/vcpu_pmu.c:714:32: note: in expansion of macro 'INVALID_GPA'
     714 |         kvpmu->snapshot_addr = INVALID_GPA;
         |                                ^~~~~~~~~~~


vim +43 include/linux/kvm_types.h

d77a39d982431e drivers/kvm/types.h       Hollis Blanchard 2007-12-03  42  
cecafc0a830f7e include/linux/kvm_types.h Yu Zhang         2023-01-05 @43  #define INVALID_GPA	(~(gpa_t)0)
8564d6372a7d8a include/linux/kvm_types.h Steven Price     2019-10-21  44  

:::::: The code at line 43 was first introduced by commit
:::::: cecafc0a830f7ea89bc11c644e2841f603fcc4e6 KVM: MMU: Make the definition of 'INVALID_GPA' common

:::::: TO: Yu Zhang <yu.c.zhang@linux.intel.com>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
