Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBBF10A2F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 21:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694726814; x=1726262814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahmnOA4adhSQlNOvLI0ggTGEGsqcCTVLGkBWNWIgwU0=;
  b=nmcIYWGls8gKdmXcfvM/OSh8aInHoaGl2x+f4lSMS2ItDQsWE72qHoHZ
   r9egBS9nSFUiQSlHBUJLbXJInX0/h9+oU3zIRajMms9fmsZtoxfNuwzBP
   dcu2oEDD+qh0PWrvFR52Qj08pgS0e9hSqkFnSFVgjbY/i2anhkOa67Bj7
   9VbnpPZRG/1k6a0poCIioGwnZu1j8vuoAiSVx3N5Fb41lN2tF1/xv5l0H
   dAnUS/ZzAsvwL5CXB5ZbvopO370gCFdEBo6H4TTqX0zbN/O846JT1Q+aa
   se8k2eNppYMcdKT/cX3YzNfEaoaXsQ/AJ0k2n8y5HaCpnGw8LMeNUkTWb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369380919"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="369380919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 14:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859865750"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="859865750"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2023 14:26:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgtrL-00025F-3C;
	Thu, 14 Sep 2023 21:26:47 +0000
Date: Fri, 15 Sep 2023 05:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 35/36]
 kernel/events/core.c:6583:15: sparse: sparse: symbol
 'perf_get_unmapped_area' was not declared. Should it be static?
Message-ID: <202309150529.PC71XR2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   6497b8ba138880f5f4a44ec7315b57ccaca7200c
commit: fed5ff883d40df4789e87c3b8b9476cb70f595e6 [35/36] WIP: perf: support mmapping event on noMMU
config: x86_64-randconfig-121-20230914 (https://download.01.org/0day-ci/archive/20230915/202309150529.PC71XR2t-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150529.PC71XR2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150529.PC71XR2t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1375:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1388:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3460:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3464:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3465:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3514:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3515:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3914:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4306:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4785:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6165:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5637:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5881:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6005:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6038:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6095:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6186:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6202:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer *
>> kernel/events/core.c:6583:15: sparse: sparse: symbol 'perf_get_unmapped_area' was not declared. Should it be static?
   kernel/events/core.c:8010:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8010:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8010:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8097:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8097:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8097:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8201:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8201:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8201:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8203:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8203:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8203:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8902:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8902:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8902:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9942:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9942:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9942:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9981:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9981:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9981:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10255:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10255:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10255:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11368:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13109:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13109:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13109:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13203:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13203:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13203:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13215:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13215:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13215:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13636:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13636:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13636:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1422:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2775:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4759:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c:9791:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9791:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9791:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9811:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9811:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9811:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9931:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9931:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9931:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9931:16: sparse:    struct swevent_hlist *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
