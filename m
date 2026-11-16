Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862979;
	b=XbMMwm5a8nvoWm+gQFBr5U3k+KyurPioMGspBW9NpKuuz8chOiT2lXXAisS6vuWu/r5X
	 OtJ5W7tk9Y9+CwkrygoTxxfoiY2KnTwzS148bQzKziWeMmDXaMzF87O5S3eUmQawl2/5Y
	 BkcEbbdhfduLPtaWqpZ2iGxbnyIHiafKlv3+qgAbLVYFljicpTrNMtwaklQ/HguHXbkKZ
	 YtVkUL+hA12G0sINlPlwAdGeQWY9rR1FxReDUkQMb+KAbtG+tXkpzmCPkHFcoj7rGR37S
	 RESLw6NNenJg8WuSGN2aZ5DwsWYNqhsWy0NfizIVSfx9W2SSgtKYD1QO4yvNOSbCldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862979;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9jJMM8GSEhfkHW8nmp8Qv0tjzyMnlEF7uF17vWvNRA8=;
	b=w1wO84y+AHQZH5K/J2uPife6zq23MG4VBq45/q6hJGqyqPALqYl0ZfUyNNXPqNbuP1Qz
	 cjYA3qqPSs4too6O1aw/SZwu4UoGMb7BTaVheAFe2mHmgogOf3SApzTBZIA4lcZNBpsb8
	 JS1KuRwsG0t+Kgfe5v+/gFYi84Sz28qBmob0JKkwpMJXWOyHFzo7fqe1HLb37ax093maH
	 ToA18o724PxzMt/Yg6OZ6zAptrtp7bIfZK5cPM8UufWYpUZ0FbLdefID3lSr4kzjsrv8d
	 nz8s3G9fXdrfGI+4M8U2lYW6IWUQO5zidk1w02gjV9yaD8aeHzEeNMayEwPnzCvMhRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oG08D4SJ;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AB606A329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 21:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oG08D4SJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794862979; x=1826398979;
  h=date:from:to:cc:subject:message-id;
  bh=PJijgU00oTtyGRt8Od0Hb/+pSNbJw5pN/709s0gfze4=;
  b=oG08D4SJa8Qxp5/6gkugXXGxa+cMvWAFfFKEkSqBhd93zUEiCjeTRWoz
   wyxZZ7ekzYQqvzSpf9Bx5flo6BHdHr54BcRJcnYU9cbdHRHlcG5nOEjpf
   6U2HgmfkP5OXI3AnvslYuOE9zFeTfahl1KUYpcRYitR6vPFXgqmI+BAtS
   QDtBEsg39XCZd/Di+6oSa+5QpwDZJtQidImK+S0/gTRnkRn97S90BHxYz
   ieNFiOEdHL0eriiS0fIQT6qvKEYb/x+LTttZToyWVKK6HwZoLUc6Z92Uf
   YAWo1rI4tvoCioyvUmwN44yMTlPrSmh04lAipOhsy0T++dgmHycBhOeNu
   w==;
X-CSE-ConnectionGUID: U09Ehm5vTDWhydcqkPApcA==
X-CSE-MsgGUID: KQRxenCMTWaSjuH6rWYN2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3610420"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3610420"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:02:59 -0800
X-CSE-ConnectionGUID: tjXgCkyMS0qLP0qVuHQyrQ==
X-CSE-MsgGUID: 4E9Ytl5YTGKLsTbMrq4Jpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11435144"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Nov 2026 13:02:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3qo-000000019QE-1sE8;
	Mon, 16 Nov 2026 21:02:54 +0000
Date: Tue, 17 Nov 2026 05:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 86/89]
 include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file
 or directory
Message-ID: <202611170403.XQI4kJjx-lkp@intel.com>
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
head:   1dab2361933785691d1874856d9e368c5be79b2c
commit: 01854c876ca0d49dfcd108228108a58f12281f55 [86/89] gtrace: Add perf driver for tracing using perf tool
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261117/202611170403.XQI4kJjx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170403.XQI4kJjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170403.XQI4kJjx-lkp@intel.com/

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

0793a61d4df8dae include/linux/perf_counter.h Thomas Gleixner 2008-12-04  19  
9f66a3810fe0d41 include/linux/perf_counter.h Ingo Molnar     2008-12-10  20  /*
f3dfd2656deb81a include/linux/perf_counter.h Paul Mackerras  2009-02-26  21   * Kernel-internal data types and definitions:
9f66a3810fe0d41 include/linux/perf_counter.h Ingo Molnar     2008-12-10  22   */
9f66a3810fe0d41 include/linux/perf_counter.h Ingo Molnar     2008-12-10  23  
cdd6c482c9ff9c5 include/linux/perf_event.h   Ingo Molnar     2009-09-21  24  #ifdef CONFIG_PERF_EVENTS
cdd6c482c9ff9c5 include/linux/perf_event.h   Ingo Molnar     2009-09-21 @25  # include <asm/perf_event.h>
7be7923633a1424 include/linux/perf_event.h   Peter Zijlstra  2010-06-09  26  # include <asm/local64.h>
f3dfd2656deb81a include/linux/perf_counter.h Paul Mackerras  2009-02-26  27  #endif
f3dfd2656deb81a include/linux/perf_counter.h Paul Mackerras  2009-02-26  28  

:::::: The code at line 25 was first introduced by commit
:::::: cdd6c482c9ff9c55475ee7392ec8f672eddb7be6 perf: Do the big rename: Performance Counters -> Performance Events

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
