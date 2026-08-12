Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86017B50F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519787; cv=none; b=FskqHqyiOnu3YhF/MWuHiUT2aAIUePjpJGdAULmq4BRzg616iYjO+tQ3YYoAJ5Ozr3AtMwLELfuHLUamAZliHn3S/ilh8u96CAH0glRkF0xWkFs53qtWcwEo83eaFX7afK05IYUMr6P6z2NWP7NGBzOvTGifP+PMBdm0YeAjI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519787; c=relaxed/simple;
	bh=EWhlQAYeOihgmjaC2cS0jdfYGwhrmePx49wdRSJrOHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZQ35N7TikKXPC1/q1sTDxZs9G3GjtLvlzcoFxCUn7eJkJXR5U+Q4/q5gWtB/jZp+vXO0EgeUwWxEd2LPXIpLA5bzU6mptGXsHNrs4bqv1fvnBbtOfrpjVtyBtvZnqxElTEqo/b9OE3ZcdDWPF5HpCRhYkT9sMWeOeZ8TteoDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIKI0QCv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIKI0QCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786519784; x=1818055784;
  h=date:from:to:cc:subject:message-id;
  bh=EWhlQAYeOihgmjaC2cS0jdfYGwhrmePx49wdRSJrOHk=;
  b=AIKI0QCvCgNDAIXMNZKiltRMiA/lXb3EVWZZksiGwAphWL8KMowmi8lB
   PtqOlDVEeRVIafjB7HHtxgnvZ9uwfiDSQ0VQv8XWZpRXuDVf4Yn20e6Cd
   YtYcOf3JdGeJWhVCuQ7XG4wdFOBp0t0y0BijhN+Up+gK2iCRnmA+1wNz9
   RAvr/9+GzqQ2LRInhaGFjTdUhMV6ciNV2GPFnAvqkOh+3DAy6o7brN6Pw
   Ez1VCKazWULqw2vUWptSWKbGo0P1S8AClkKDcOAYhnCTy9OVLLnQ3pbao
   TmuvWxkPk4OGzikynxlOrVNag/UIwzQQ7MPRDoW7RNtf+XyWclPS3kmsE
   w==;
X-CSE-ConnectionGUID: 4wp1pw6iSG++sRKT6N2dXA==
X-CSE-MsgGUID: S1mnWmU4Tmug5w86sUODLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90876246"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90876246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:29:44 -0700
X-CSE-ConnectionGUID: RwY8lISoRp+ZwW2xUpaYig==
X-CSE-MsgGUID: 49twi+XDQAyVDSlkOsbG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="264152442"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 00:29:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu3PA-00000000Q0o-0UwQ;
	Wed, 12 Aug 2026 07:29:40 +0000
Date: Wed, 12 Aug 2026 15:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 101/104]
 include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file
 or directory
Message-ID: <202608121532.kUUYFBKB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: c233229a39d9c174acce7057ff5248560ccba131 [101/104] gtrace: Add perf driver for tracing using perf tool
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608121532.kUUYFBKB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121532.kUUYFBKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121532.kUUYFBKB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file or directory
      25 | # include <asm/perf_event.h>
         |           ^~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1410: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [m]:
   - GTRACE [=m] && OF [=y]


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
