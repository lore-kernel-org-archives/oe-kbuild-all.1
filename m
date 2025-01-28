Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4C19E971
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 11:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063534; cv=none; b=DViTSEZJfjgZT+MdnJhfMfY9yq35fhODWFYF9VR33nQhLwfANiHfXgganQHXTNT0J5PivUzxuyrdF5zHmJJJ5ZY6RdEw6oLTDPNkk6mTBjxD86SWFq6DOZfvLr9c8UDLR4gx/JNr2O37istotsApeR/v2SGPtfzW7d29hGXvJ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063534; c=relaxed/simple;
	bh=7/QV8XfNKo21hEpcHAXHs5mnifzJL1J5y+aGOZg93kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6XSwBktrmdl3OvaVIm8mq0Zs+95BjFeRvEh4sMpICeR7j25JjtOP6ryYZdSrD5Jrblk0W6DhtV5akJHW3tF2LfASSBz6kWgkkZT/Vu6iV4s6fSeixAWFBu94E+C2KuydXsxYoar5L1Z95eQx7RUTrY3eIVM9wrWiMJDwGyGDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoHI6WRl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoHI6WRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738063532; x=1769599532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7/QV8XfNKo21hEpcHAXHs5mnifzJL1J5y+aGOZg93kY=;
  b=OoHI6WRlcTqKsO64HHOSxcAIQ/KMufOTlJwOy4FgBagh/BJfFJ9Fj0Gc
   +Rqjqz2CQXaGxxe5EmPxvlnBNXR875u2pYJPE8BNo33ayIIvLaa/jfEj1
   xL1k/TIJPEz9WcbdiY3Pm5knbOzwI9GUL0+8npQTayilUyAyVgP+ma9v4
   79H51fldauu7OUpj6Rhv9nEIgyZoZsdsOyXmR1xR8s6KsBjLiX3i2u+8l
   /b3WEo6YmhmRT5VBtn/pfkNQx+3XlOzqDswHjWHagQZzMFkCB3xZVxWUH
   NxQiiTgKkFYsDgsLsUVkPm6FQvas3KMzsSDpEtC9er7R0gUE7BJGr++rD
   A==;
X-CSE-ConnectionGUID: nJJukJ5VSjmMhFsdzck4/g==
X-CSE-MsgGUID: AnkWf50tSkeALGns4dOfFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38247617"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38247617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:25:32 -0800
X-CSE-ConnectionGUID: +a4EkE6MRAaFqDsj6C1QFA==
X-CSE-MsgGUID: 9Z+M5Ec5TVqxoEEdPkz4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132003820"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2025 03:25:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcjii-000hif-2y;
	Tue, 28 Jan 2025 11:25:28 +0000
Date: Tue, 28 Jan 2025 19:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 14/21] RISC-V: perf: Implement supervisor counter
 delegation support
Message-ID: <202501281901.rYfr2C4S-lkp@intel.com>
References: <20250127-counter_delegation-v3-14-64894d7e16d5@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-counter_delegation-v3-14-64894d7e16d5@rivosinc.com>

Hi Atish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d89551994a430b50c4fffcb1e617a057fa76e20]

url:    https://github.com/intel-lab-lkp/linux/commits/Atish-Patra/perf-pmu-events-Add-functions-in-jevent-py-to-parse-counter-and-event-info-for-hardware-aware-grouping/20250128-130931
base:   9d89551994a430b50c4fffcb1e617a057fa76e20
patch link:    https://lore.kernel.org/r/20250127-counter_delegation-v3-14-64894d7e16d5%40rivosinc.com
patch subject: [PATCH v3 14/21] RISC-V: perf: Implement supervisor counter delegation support
config: riscv-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281901.rYfr2C4S-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281901.rYfr2C4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281901.rYfr2C4S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from drivers/perf/riscv_pmu_dev.c:13:
   drivers/perf/riscv_pmu_dev.c: In function 'rvpmu_sbi_check_std_events':
   drivers/perf/riscv_pmu_dev.c:415:40: error: 'pmu_hw_event_map' undeclared (first use in this function); did you mean 'pmu_hw_event_sbi_map'?
     415 |         for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/perf/riscv_pmu_dev.c:415:40: note: each undeclared identifier is reported only once for each function it appears in
     415 |         for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/array_size.h:5:
   include/linux/compiler.h:260:77: error: expression in static assertion is not an integer
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:264:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c:415:29: note: in expansion of macro 'ARRAY_SIZE'
     415 |         for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
         |                             ^~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c:418:40: error: 'pmu_cache_event_map' undeclared (first use in this function); did you mean 'pmu_cache_event_sbi_map'?
     418 |         for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
         |                                        ^~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   include/linux/compiler.h:260:77: error: expression in static assertion is not an integer
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:264:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c:418:29: note: in expansion of macro 'ARRAY_SIZE'
     418 |         for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++)
         |                             ^~~~~~~~~~
   include/linux/compiler.h:260:77: error: expression in static assertion is not an integer
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:264:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c:419:37: note: in expansion of macro 'ARRAY_SIZE'
     419 |                 for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++)
         |                                     ^~~~~~~~~~
   include/linux/compiler.h:260:77: error: expression in static assertion is not an integer
     260 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:264:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     264 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c:420:45: note: in expansion of macro 'ARRAY_SIZE'
     420 |                         for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
         |                                             ^~~~~~~~~~
   drivers/perf/riscv_pmu_dev.c: In function 'rvpmu_event_map':
>> drivers/perf/riscv_pmu_dev.c:1522:13: warning: variable 'config1' set but not used [-Wunused-but-set-variable]
    1522 |         u64 config1;
         |             ^~~~~~~
   drivers/perf/riscv_pmu_dev.c: At top level:
   drivers/perf/riscv_pmu_dev.c:1527:11: error: expected identifier or '(' before 'else'
    1527 |         } else {
         |           ^~~~
   drivers/perf/riscv_pmu_dev.c:1530:1: error: expected identifier or '(' before '}' token
    1530 | }
         | ^
   drivers/perf/riscv_pmu_dev.c: In function 'rvpmu_event_map':
   drivers/perf/riscv_pmu_dev.c:1527:9: warning: control reaches end of non-void function [-Wreturn-type]
    1527 |         } else {
         |         ^
   drivers/perf/riscv_pmu_dev.c: At top level:
   drivers/perf/riscv_pmu_dev.c:636:12: warning: 'rvpmu_sbi_event_map' defined but not used [-Wunused-function]
     636 | static int rvpmu_sbi_event_map(struct perf_event *event, u64 *econfig)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/config1 +1522 drivers/perf/riscv_pmu_dev.c

  1519	
  1520	static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
  1521	{
> 1522		u64 config1;
  1523	
  1524		config1 = event->attr.config1;
  1525		if (riscv_pmu_cdeleg_available() && !pmu_sbi_is_fw_event(event))
  1526			return rvpmu_cdeleg_event_map(event, econfig);
  1527		} else {
  1528			return rvpmu_sbi_event_map(event, econfig);
  1529		}
  1530	}
  1531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
