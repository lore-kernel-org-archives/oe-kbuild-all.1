Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B619344DAA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790911391; cv=none; b=iXEFvj5X+FQIbqXiWrSY3+mW6GtZBCiGItAzQBJc0HrEBy0nTDq+Nxb+vZoHK6TMasVrtQgUrSZLnL7yaEzLAmH7U5n3pjDX5q+ICNyk4oNuZXIgVgIx1C/kkaIeK197/OnIVzvY8AMM0u0rLZk10XSHwIdIu+lZeB3ik3haNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790911391; c=relaxed/simple;
	bh=Iz2BJmLMpricfW4y8rHN2NkG4XvbpXwj9Kl0tIgr+6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SwH+YuRjlazDdtMbUiiKYRwlGMyo+pB+vGTIfINiZyzXrwb+nyYrjn8YUOQSosr/jdTBQbzj+/OzuF0FdqH+F0hQ6Pf9H1xfE7hVr6YMR2Nqn9C0J9QWV/6ZRjst6hw2m6lI0PDvKnYiBp92FAhs4I7FYa8D0OsOD3J8eoxYRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7lJ0kr7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7lJ0kr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790911390; x=1822447390;
  h=date:from:to:cc:subject:message-id;
  bh=Iz2BJmLMpricfW4y8rHN2NkG4XvbpXwj9Kl0tIgr+6I=;
  b=E7lJ0kr7M4jPPKMwYNdUlDYTD3pLbmu2Q5b40TohAY47Vt5KYnQsIblJ
   dJWZW58lczx9E//PPbnurekNhtYXoi7urekLsV6IKo71WNFwuE6xLrdcF
   fjOJgGs4TdQQtYa1HmnOhdNYcxEJq7PZ9D/6ldL68dRXaVfCSvOL2gtl0
   Sx4DaneZWHOrIM21I3+JReuLPDt77mPGPQTr0IIf+Qqn3WM9cKgc/PT3u
   fzR/8Zln5BrHLtPgEwPqxPxfEFUom19I/wK3aaKL30jDt489XKyWZIT5B
   7d4fnkRBuXzBXMGmjqRgu7UcEf/TdxKAEv9M+qwcsVsLIxPj/m5h6din6
   w==;
X-CSE-ConnectionGUID: mbQoFuhATUigF6XrrsWwng==
X-CSE-MsgGUID: mWqmW+8NT0efWQo/5DN2dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108059925"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108059925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:23:07 -0700
X-CSE-ConnectionGUID: 0ZwobQuYRtSJSmqWCSYT9Q==
X-CSE-MsgGUID: yGgGMoLDRmCUgat0otVFug==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Oct 2026 20:23:05 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCTrT-000000000ND-2Jtg;
	Fri, 02 Oct 2026 03:23:03 +0000
Date: Fri, 02 Oct 2026 05:22:31 +0200
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 76/87]
 include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file
 or directory
Message-ID: <202610020545.Xod8auVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 17ed86e21fb97985103da6dd9f879843e828b643 [76/87] gtrace: Add perf driver for tracing using perf tool
config: microblaze-randconfig-r2202-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020545.Xod8auVl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020545.Xod8auVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020545.Xod8auVl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file or directory
    # include <asm/perf_event.h>
              ^~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=1052497777
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1052497777
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1052497777
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1052497777
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [y]:
   - GTRACE [=y] && OF [=y]


vim +25 include/linux/perf_event.h

0793a61d4df8da include/linux/perf_counter.h Thomas Gleixner 2008-12-04  19  
9f66a3810fe0d4 include/linux/perf_counter.h Ingo Molnar     2008-12-10  20  /*
f3dfd2656deb81 include/linux/perf_counter.h Paul Mackerras  2009-02-26  21   * Kernel-internal data types and definitions:
9f66a3810fe0d4 include/linux/perf_counter.h Ingo Molnar     2008-12-10  22   */
9f66a3810fe0d4 include/linux/perf_counter.h Ingo Molnar     2008-12-10  23  
cdd6c482c9ff9c include/linux/perf_event.h   Ingo Molnar     2009-09-21  24  #ifdef CONFIG_PERF_EVENTS
cdd6c482c9ff9c include/linux/perf_event.h   Ingo Molnar     2009-09-21 @25  # include <asm/perf_event.h>
7be7923633a142 include/linux/perf_event.h   Peter Zijlstra  2010-06-09  26  # include <asm/local64.h>
f3dfd2656deb81 include/linux/perf_counter.h Paul Mackerras  2009-02-26  27  #endif
f3dfd2656deb81 include/linux/perf_counter.h Paul Mackerras  2009-02-26  28  

:::::: The code at line 25 was first introduced by commit
:::::: cdd6c482c9ff9c55475ee7392ec8f672eddb7be6 perf: Do the big rename: Performance Counters -> Performance Events

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
