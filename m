Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883C748F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882722; cv=none; b=FyrJkbldhaTcbxVgCPFVMSRmu0W4cIYZxWvtbUxcxWvHKjivhI+akItz3xyPzLqI5Q2fkWONNZE4N9AABA/MMDA6Tyjd2xFnE71LqCImFvqTc5cLBvPD4g3Z+/gWEfUiMTMQoY0ep3Hyn4He8lj9yWXtEqUx0JqDTb74KYhvwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882722; c=relaxed/simple;
	bh=nKXy3BjN6jvun82a80/TldjRaCzfyvSUgyEYwDa4xYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzBsnBhLUdkJtnaQgvqIe8qFiA1RCPaQQuoxCPriUm2gKjhEUYPA0LdCmeDyI0vrOWmPGljzAPz/dJbUbgVCJatfQ1g+UA/NZiodiC/N7gSwbaZ2Esk2kvgTQ5xr7wKMIMldBmFGfU8m4ybohzqHDmQSNpJZxL5hqXCyYgSs+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BObUiN7n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BObUiN7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727882720; x=1759418720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKXy3BjN6jvun82a80/TldjRaCzfyvSUgyEYwDa4xYI=;
  b=BObUiN7nyPoJ4Q8kCsOI1XWF8mD5y1a2WzS+UGNmBJlwrEAwW/mTh1dR
   hCFxlRrkfm7Beset/v0APih+SSZOecKUmKkI2EpQmxLQa8O4nIbH6PFuT
   yRQBsDAWRN3EsJClJ9JNPuQKeBRuXstZF6M/PJ2Um9/hwaf8NZGjOk4Gw
   NbiZf3fZI6B30/NrrlV48TnSrEM3F1GjeAOqkXJKRUf2FvGYIQ2dBX51i
   plKv3f8WjHHvR3slQSTKMD5wHxCDYqmGmanTqK4xMp6Z+DQLlxUDis7qk
   PBlalAhQq31sK2fZf7+JQBR0ScPw5/2m1DVb5hT973nwD1jOMoyqPlnX3
   g==;
X-CSE-ConnectionGUID: cZAZTXkjR3a3Vc7PRTA4Yw==
X-CSE-MsgGUID: 4S95UA86SZqXJKkp4EbTxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26925734"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26925734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:25:20 -0700
X-CSE-ConnectionGUID: oDYTwI5iQXOspALo6Ah9ZA==
X-CSE-MsgGUID: 4IGf9ld1TIuuYaJ4NZfKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74154361"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Oct 2024 08:25:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw1E4-000U9T-1P;
	Wed, 02 Oct 2024 15:25:16 +0000
Date: Wed, 2 Oct 2024 23:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 2/3] drivers/perf/arm_pmuv3.c:721:3: error: call
 to undeclared function 'write_pmovsset'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202410022323.rJw45ct5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   ea54acc0526c6ee4bbd111f57203bc23790ecfe5
commit: a04cfff6860a56b2b23b9731d83d2196d3414918 [2/3] arm_pmu: rework overflow handling
config: arm-randconfig-r051-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022323.rJw45ct5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022323.rJw45ct5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022323.rJw45ct5-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:146:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     146 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:147:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     147 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:148:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     148 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:149:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     149 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:151:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     151 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:152:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     152 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:139:2: note: previous initialization is here
     139 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
>> drivers/perf/arm_pmuv3.c:721:3: error: call to undeclared function 'write_pmovsset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     721 |                 write_pmovsset(BIT(event->hw.idx));
         |                 ^
   drivers/perf/arm_pmuv3.c:721:3: note: did you mean 'write_pmovsclr'?
   arch/arm/include/asm/arm_pmuv3.h:200:20: note: 'write_pmovsclr' declared here
     200 | static inline void write_pmovsclr(u32 val)
         |                    ^
   56 warnings and 1 error generated.


vim +/write_pmovsset +721 drivers/perf/arm_pmuv3.c

   713	
   714	static void armv8pmu_enable_event_irq(struct perf_event *event)
   715	{
   716		armv8pmu_enable_intens(BIT(event->hw.idx));
   717	
   718		// TODO: explain why
   719		// TODO: explain no ISB
   720		if (local64_read(&event->hw.period_left) <= 0)
 > 721			write_pmovsset(BIT(event->hw.idx));
   722	}
   723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
