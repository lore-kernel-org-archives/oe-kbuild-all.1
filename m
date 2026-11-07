Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794081015;
	b=p9KDpm35HwJdqquugXcL0my4aiFAJjOJ61sfFJgO4aalDSA8FTY2FU4QtyJ1E3gHrUPB
	 adxchfifiiBdxULanK5HHP6KwB3QFH3H4pORFam3BNc+Nk7BYtVY60AWTFpsvxOtO8rFk
	 8xGZhDKS7zL6CfgoL0A3iLVFPJBi+RXCpuzUwG19qjvZCm7NPAXDadqh8V4sdLglXKrDd
	 pZFwFCcdza8VD9pN7lz1WWaiM/PzmVjqEyECmqAhCrZwwQ9CueTgNxzJCLTxX+t9Aldr6
	 koJ0LwsJk4OSYezBe55P3hOBTQcj43EzSz3mM5LUq7OBnsmoCeRlg2/yKPhnRrTupIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794081015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9k+/x7XgJIYjqOsfWQWLtgfj8hijQPhxO+T4ZRxScYM=;
	b=I+h8QMUqfkoGQphEB0TFTLBH2QomLJwFnzeOSPjv+9SoCH+pDDmVM4jw4Wus7PbrmFwt
	 Mc8AJp1c275vsqPyPaLw8GrmJi2qoLPrPWkyOVeqZgssVBLbuP9urh3mduboThQDiP8z5
	 swssi2XrzJ9priIWW67S4QgkzZYIwKscN5ZGK88JXVmd5cFIkkA1KM9w49WfTF+FQECIq
	 /XrE1j9q7HybCwFbNXVsWdB21KGOjWppQMf4/unjg+7+zCvbW+DxDgdOzJtxkYLex9ETX
	 N0b+t7TN4yMJ19kK2ZVRir0y3X9DkQ2ap+H8i65bfXd+jbZ6TkMU0zRiWboMqXvNWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bFLzFaa8;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83E606A333
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 19:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C83E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bFLzFaa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794081013; x=1825617013;
  h=date:from:to:cc:subject:message-id;
  bh=q9nHrEihixxRe5AhmBw6C9gvzLHd9g2ZqGF51Xiyu+0=;
  b=bFLzFaa8+X5miY6Ijw17Xx6KpmlPYPOWmGA8nnQbguvsn93b0DYcitnr
   n978vfvcjpoH3ollt2TXqBTx6u7YGD4LWTaYqwgMpZ8c2Jp7xPCj46FcV
   jJHyGicl3xjn+Rh5Bn3aNWmIC/6eoluFzr5TuswfJlTVnUjSDcF9UfE99
   lEPkgUChsFfzw9k9lRJX1DB8y0lJO5IuSAm/DzaZ7Xd9Rww0ncR0UbojN
   nA2RKivuINGJi+Gw664vNLwdg+VDbFXG7EFcWqdY3GoAWdqlHSCSXSIRJ
   0lakAdk2eucd73AgAkQ4DvAZUsza3tDUav3272IYGduyg30SgOmEYEJ0K
   A==;
X-CSE-ConnectionGUID: HVJeOSOPTKqP6MzhPuznXw==
X-CSE-MsgGUID: dXGsfEWfQL+B1k1KWdMF5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2856778"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2856778"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 11:50:10 -0800
X-CSE-ConnectionGUID: DpE5w5/9QFKWv4DK5OkVGA==
X-CSE-MsgGUID: qeBGYWZmSJm3bl/ik9ufXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7869349"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2026 11:50:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPmQQ-00000000rUT-0tbH;
	Sat, 07 Nov 2026 19:50:06 +0000
Date: Sun, 08 Nov 2026 03:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 77/80]
 include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file
 or directory
Message-ID: <202611080334.MAwbhO6i-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: f30a55d9ffb2d57252016d70c8fcd8672764c2b7 [77/80] gtrace: Add perf driver for tracing using perf tool
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611080334.MAwbhO6i-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080334.MAwbhO6i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080334.MAwbhO6i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:96,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:64,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file or directory
      25 | # include <asm/perf_event.h>
         |           ^~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
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
