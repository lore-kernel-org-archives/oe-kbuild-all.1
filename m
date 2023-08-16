Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987807F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692150992; x=1723686992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=My4sZKzzuuLuGeXNqIZ4eZ9PLtl2Zj9ZDH1a6mk6g/U=;
  b=JUo5EexBFYoG4n50+Q7HT8UTpt5eZ/3T1jgE53VCKvARnflkZ421GUW3
   j1Latn+O/xH8fyEBDo1Qtyka6w90nDINxV2gTRQR3DMVLw0hDlj1foK2r
   FQOmxsp0iZ8IHMPh5q93hW3mMFQm24gwCb5+yhJkVSRDoqasizEavR47x
   f4ueSNDcJrcNKMy7x5RDJ8WuNxd2p7JBWKAcZfRNHE0x9cxulTEt8qTPP
   5ER3zrBbLXfQRZgoST/ezNq5+Eowk2kEPaKXYyVOD7O98N+rDxNMR90D2
   uWnYrFsttelB9ire6c9B2NxwP8cxU3i0BG0wvgWXoXIY0zUGsLKOaYwny
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458770998"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="458770998"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 18:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734030201"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="734030201"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2023 18:56:30 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW5lt-0001Op-1T;
	Wed, 16 Aug 2023 01:56:29 +0000
Date: Wed, 16 Aug 2023 09:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.14a 49/51] kernel/rcu/rcutorture.c:24:10:
 fatal error: linux/rcu_notifier.h: No such file or directory
Message-ID: <202308160930.YEekR3Wf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.14a
head:   a90c4cbc91475bd5df35f712a954972fbfff40a1
commit: 37730a9ba11627b63d8108dd8b3061ea2ee04df9 [49/51] rcutorture: Add test of RCU CPU stall notifiers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230816/202308160930.YEekR3Wf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160930.YEekR3Wf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160930.YEekR3Wf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:24:10: fatal error: linux/rcu_notifier.h: No such file or directory
      24 | #include <linux/rcu_notifier.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +24 kernel/rcu/rcutorture.c

    14	
    15	#include <linux/types.h>
    16	#include <linux/kernel.h>
    17	#include <linux/init.h>
    18	#include <linux/module.h>
    19	#include <linux/kthread.h>
    20	#include <linux/err.h>
    21	#include <linux/spinlock.h>
    22	#include <linux/smp.h>
    23	#include <linux/rcupdate_wait.h>
  > 24	#include <linux/rcu_notifier.h>
    25	#include <linux/interrupt.h>
    26	#include <linux/sched/signal.h>
    27	#include <uapi/linux/sched/types.h>
    28	#include <linux/atomic.h>
    29	#include <linux/bitops.h>
    30	#include <linux/completion.h>
    31	#include <linux/moduleparam.h>
    32	#include <linux/percpu.h>
    33	#include <linux/notifier.h>
    34	#include <linux/reboot.h>
    35	#include <linux/freezer.h>
    36	#include <linux/cpu.h>
    37	#include <linux/delay.h>
    38	#include <linux/stat.h>
    39	#include <linux/srcu.h>
    40	#include <linux/slab.h>
    41	#include <linux/trace_clock.h>
    42	#include <asm/byteorder.h>
    43	#include <linux/torture.h>
    44	#include <linux/vmalloc.h>
    45	#include <linux/sched/debug.h>
    46	#include <linux/sched/sysctl.h>
    47	#include <linux/oom.h>
    48	#include <linux/tick.h>
    49	#include <linux/rcupdate_trace.h>
    50	#include <linux/nmi.h>
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
