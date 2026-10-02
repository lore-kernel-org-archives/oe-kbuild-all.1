Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252A4483A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929422; cv=none; b=JXbE+cOOK8i1X+zDrtOsAnqoIfHqcf4MeG8zdibUXa0S1K4SDiPUIMjZAUhKpNdYtIUsLDQkCNtGgcqtc5yReFJVuqi0rOoqOIp/PC2KgviB23ZamjOHG4OXJMccKgAPwyLtgf5+S80X9TJbzmvMXjMs6pWRS2VAC8q9zTFI0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929422; c=relaxed/simple;
	bh=Y6j53ETkYCT3puGQPoxZG796SA5lIOAODtyiDORPEl4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z8rEfP1PcCWmcN4ot5I/CGSbTyjulV0HRfM9ibK8IzYSjbPJKZU2RgrcNA/G+H26QQfk+jfO8W2sBdJmje/gOLtWItlGbyw9/7TnKy9ip6yGQuOvQt9TEZKWtfkeDdYKufRzrO17YBEZwjOEq/q6r1Lxi130nv7XrbafFjV2vXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYmK75M+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYmK75M+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790929420; x=1822465420;
  h=date:from:to:cc:subject:message-id;
  bh=Y6j53ETkYCT3puGQPoxZG796SA5lIOAODtyiDORPEl4=;
  b=PYmK75M+rG4YmSRmxLFDlQtrgZX4QMhwq3Q4v+fdnbs3bOYrADkQBTV2
   hjjXD7O20b7YBw2jW2QkDd8ltBeHU+a+O5yt7vUekjvkKRYsPmknaPTcr
   C9uGdUxorg6nWMbCJeLnczNwV50BXuSNr/dKwxFJU9/VNIj1gOkoclzWW
   6HVGWjqfvoR5/z+ESrj74nHwdxj6cWkworCJPuw1j8ENGtp32QE3yAyf5
   +8aMJsqRryo5D/thv6mSV2H87X7l27xQolnjZGZtsfWs/P8cQUELsFeTB
   FCi/f21rmlM5LPRWweV/01BEUcUe8JBumlAPAQ7SZM1tujjT74ZPDbtHu
   A==;
X-CSE-ConnectionGUID: I7w4Hd8yS9eZNWsRKjl76A==
X-CSE-MsgGUID: hEkQZc1zTrW1OdyuUhoerw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90463929"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90463929"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:23:40 -0700
X-CSE-ConnectionGUID: WRFbB2C+Rp2AVngBOqByKw==
X-CSE-MsgGUID: /LXNDXzAQNqP209QoRrXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="213420"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 01:23:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCYYJ-00000000Smu-26Vk;
	Fri, 02 Oct 2026 08:23:35 +0000
Date: Fri, 02 Oct 2026 16:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 76/79]
 include/linux/perf_event.h:25:11: fatal error: asm/perf_event.h: No such file
 or directory
Message-ID: <202610021638.R2byuB8h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   699de4c95a417e4c81644a91131ceb23bf0519a6
commit: 17ed86e21fb97985103da6dd9f879843e828b643 [76/79] gtrace: Add perf driver for tracing using perf tool
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20261002/202610021638.R2byuB8h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021638.R2byuB8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021638.R2byuB8h-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
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
