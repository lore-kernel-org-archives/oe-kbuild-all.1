Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6A322E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687192842; x=1718728842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DEhmbYAcUoFDub/mJve78IHxt+MenRBdmSsPw0Yg6tg=;
  b=IMEQJOwG0YeR73/udIj8ga2NOKU84/fLiO5v0AJRsYnM4rcNOZje3nDv
   tCL6MvQlUUIvkeHogSGK/d9CALmKUTE5tF4vUf1mZG/n8SdnllvtCgOLd
   iFgZCPyulfgDX0fiTcFbg/pyymRw4o1OFegyx5cQ8mvQDrr63MKTc7jGP
   Gphua3AoQwaVxBDTddAQhxJNHV1m0VHglW6F9S/a5/6yLfz4zt3cTjZi6
   lWmpran+5euG8P/HQA4JZIO4jNsR3hP2JriY3mCYosjB3DVqt1Lqj5w0t
   rmPT1Ushnh5BqahrRyff9HOMqbtxD5qnFqB9owuVVANbTI/pObkDQkXau
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339284230"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="339284230"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 09:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="716948403"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="716948403"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2023 09:40:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBHvj-0004uq-1k;
	Mon, 19 Jun 2023 16:40:39 +0000
Date: Tue, 20 Jun 2023 00:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <neeraju@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 1430/9999]
 include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306200033.ajPckwOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 3bd9ad7eb4a7cdd14a08859a1d1edee72883dd7d [1430/9999] ANDROID: gic-v3: Change GIC v3 vendor hook to restricted
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230620/202306200033.ajPckwOq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200033.ajPckwOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200033.ajPckwOq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:165:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:165:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:165:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:169:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:169:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:169:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:173:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:173:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:173:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:177:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:177:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:177:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:182:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:182:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:182:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:186:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:186:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:186:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:190:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:190:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:190:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:194:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:194:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:194:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:199:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:199:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:199:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:203:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:203:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:203:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:208:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:208:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:208:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:212:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:212:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:212:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:216:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:216:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:216:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:220:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:220:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:220:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:224:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:224:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:224:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:242:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:242:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:242:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:246:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:246:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:246:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:251:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:251:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:251:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:256:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:256:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:256:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:273:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:273:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:273:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:281:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:281:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:281:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:286:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:286:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:286:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:289:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:289:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:289:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:294:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:294:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:294:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:306:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:306:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:306:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:310:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:310:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:310:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:322:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:322:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:322:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:326:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:326:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:326:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:333:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:333:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:333:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:337:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:337:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:337:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:341:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:341:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:341:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:345:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:345:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:345:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:349:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:349:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:349:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
>> include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/typec.h):
   include/trace/hooks/typec.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/typec.h:43:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:43:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:43:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +18 include/trace/hooks/gic_v3.h

  > 18	DECLARE_RESTRICTED_HOOK(android_rvh_gic_v3_set_affinity,
    19		TP_PROTO(struct irq_data *d, const struct cpumask *mask_val,
    20			 u64 *affinity, bool force, void __iomem *base),
    21		TP_ARGS(d, mask_val, affinity, force, base),
    22		1);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
