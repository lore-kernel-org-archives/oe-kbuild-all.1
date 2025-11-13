Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78E345CC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763034130; cv=none; b=uXPdAv5CgTNQ8/SkCX/3epHcmG8wCpKRHsFtMZt/L18vri6urv3D+ZetJDKMmEzSmRJYnaSZDH0hjSp8p44NRrao6VNfI2VpHOdodHRVme9UFIruRuCo+hW+TdkU/t8XPYiR41Q1B2qd4pMgrs4s+MuszihKHiUF4+RZ1sEgafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763034130; c=relaxed/simple;
	bh=HYPJ0pi3NjM5JOcs8GqV2iXKayp/kvSoqXAmdV86JPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmPNSnXb4vQKuxwa+ANCxwScbK+RwQx39KqAWAvqBqRT1RWOqubhDy0KedCtaxcFqZ32tdYFwMkXDRQFaU0ptKjEhOEQxILd7Y6wJxaL29jBxOYopO8mHCvU1OMDpV8/JOdVe8fbOFkXEJU7SPQp16UBhogp5i7gXh5LLPFbJiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+BxzXSh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+BxzXSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763034130; x=1794570130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYPJ0pi3NjM5JOcs8GqV2iXKayp/kvSoqXAmdV86JPk=;
  b=T+BxzXShHn/R/SvY91CREzPxrbwo5QLEKbrEsw9gQI5oG1psB7INFrM4
   Q1hTr5aREDREkRS/nNtHL25SupBJPZDV6cKGvnn+4WUyzn9tIaRvTbIiq
   xeyNxxl06Y2qzhdYdEXFgY1MRH37t48vme4OWWPpawh2Ai0PVZGLulBXx
   /daY55CHhW33fbvkaUv+hVfoZXyJJQAA94hwFMGEBgB8u6qahA6Nd+Lz/
   vsPxki6zk25Sh/cT9o948Ty1zqX5mDlk+mqDuSjFcBecH3R/AEdgasMYQ
   2Y5hoyMxjrPzxcsIRyww44FOMltAFpEb2KY5EeIG3t+Ee1LtBthI+mXud
   Q==;
X-CSE-ConnectionGUID: 9Yk2yvnqTFuVYb0af8ZQww==
X-CSE-MsgGUID: Az+OZYzWQvyHnHSgbh5q+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76215043"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="76215043"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 03:42:08 -0800
X-CSE-ConnectionGUID: 14c3NnXBQPuSYXpI5QDs1A==
X-CSE-MsgGUID: T+XgDwOPQP291TfuQrJzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189912076"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 03:42:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJViF-0005Gp-2x;
	Thu, 13 Nov 2025 11:42:03 +0000
Date: Thu, 13 Nov 2025 19:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Subject: [trace:latency/for-next 3/5]
 kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of
 'rv_sleep' follows non-static declaration
Message-ID: <202511131948.vxi5mdjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace latency/for-next
head:   69d8895cb9a9f6450374577af8584c2e21cb5a9f
commit: 4f739ed19d222de33b19ca639a34523fbbec20d0 [3/5] rv: Pass va_list to reactors
config: arc-randconfig-r071-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131948.vxi5mdjU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131948.vxi5mdjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131948.vxi5mdjU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of 'rv_sleep' follows non-static declaration
    static struct rv_monitor rv_sleep = {
                             ^~~~~~~~
   In file included from include/linux/cleanup.h:7,
                    from include/linux/interrupt.h:8,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from kernel/trace/rv/monitors/sleep/sleep.c:2:
   include/rv/ltl_monitor.h:19:37: note: previous declaration of 'rv_sleep' was here
    #define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
                                        ^~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
    #define __CONCAT(a, b) a ## b
                           ^
   include/rv/ltl_monitor.h:19:25: note: in expansion of macro 'CONCATENATE'
    #define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
                            ^~~~~~~~~~~
   include/rv/ltl_monitor.h:24:26: note: in expansion of macro 'RV_MONITOR_NAME'
    extern struct rv_monitor RV_MONITOR_NAME;
                             ^~~~~~~~~~~~~~~


vim +/rv_sleep +219 kernel/trace/rv/monitors/sleep/sleep.c

f74f8bb246cf22 Nam Cao 2025-07-09  218  
f74f8bb246cf22 Nam Cao 2025-07-09 @219  static struct rv_monitor rv_sleep = {
f74f8bb246cf22 Nam Cao 2025-07-09  220  	.name = "sleep",
f74f8bb246cf22 Nam Cao 2025-07-09  221  	.description = "Monitor that RT tasks do not undesirably sleep",
f74f8bb246cf22 Nam Cao 2025-07-09  222  	.enable = enable_sleep,
f74f8bb246cf22 Nam Cao 2025-07-09  223  	.disable = disable_sleep,
f74f8bb246cf22 Nam Cao 2025-07-09  224  };
f74f8bb246cf22 Nam Cao 2025-07-09  225  

:::::: The code at line 219 was first introduced by commit
:::::: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep monitor

:::::: TO: Nam Cao <namcao@linutronix.de>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
