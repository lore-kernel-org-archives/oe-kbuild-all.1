Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDF1AAE17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776542562; cv=none; b=mImZeUTbc/ZnhbL5tLOCDGm0cZrAz9kyWAs5hVZZyZxPNlMfp1Xb/OGe5iCOOl/e4zq/Rf0gebHxh1W8jPeITIL67Xg9OvGLDW1qrNcjUBxkFcG8XHl9YCuA714l5+LfCTaXEsM3Itgt4+4gRuQkpUyahXmc5uOwa6BZxmP8YFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776542562; c=relaxed/simple;
	bh=UQKI+a99n8+djpLFVdkUZQi1EUZS/WDbR/bKTgyLMtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rs+nQDs68oQMBEUL0kzyWDf5ChT7TPMH5x2qIxHYd27Ogc2nQWJhRNsCu09eBOzmi/oDBxaE3Z36C+IpESj3uGjVGq+h6o05c8uUYNeMH7NADxkgyb1mF+buJFDivEhplbZptfUTe7yIxQeVyGRXgt5Lc4tjvi5U1EAxCgeKW4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6MFdeza; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6MFdeza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776542559; x=1808078559;
  h=date:from:to:cc:subject:message-id;
  bh=UQKI+a99n8+djpLFVdkUZQi1EUZS/WDbR/bKTgyLMtk=;
  b=m6MFdezav4bjUx3/s57iRyODct/nVoypsa1BLrG+R3cCaKU7LDsb+8ZA
   BU52aIK++p8eIxDGnZZC8CbQFEfJm6G1FxbagwFCiQLc80aaawbzo9ZVk
   MhBph4H0Xf+EyV9hlort3g2ojD7uVtwHaCufeTctN3Bcxu1zP5n4vn2Ud
   pTvOfgH3YDKBkbS+VIbjSuQsw3ehF0rYKW/OGglivzw4NpWiHgVWsSTFa
   uO4XuNDDd+Kpff+Im+jY3otI6GGnGbKGeu9wJW2FXDhD7eW0UhWUIVTHd
   rJkWVK4UxK00zWpljtrGie23KhRj689Zc0icj8RAVt5Ao2/c6d7CeAB1d
   Q==;
X-CSE-ConnectionGUID: plMAvBYRQnCR14HyEKb1sg==
X-CSE-MsgGUID: 5J3OCRlPSeaVGds+kdPhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77432318"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="77432318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 13:02:39 -0700
X-CSE-ConnectionGUID: dfD9EEzdRVCL9YaI04nnKg==
X-CSE-MsgGUID: Ib1cdvrIQuaPXPgZYepVoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="236320330"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Apr 2026 13:02:38 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEBsA-000000001Sa-2HkZ;
	Sat, 18 Apr 2026 20:02:34 +0000
Date: Sun, 19 Apr 2026 04:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8]
 kernel/sched/ext.c:2172:38: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202604190303.5X7asVLq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ebdb82c03e6adc63d7eaf683c5e5555b49d6a3bc
commit: c5c86c524cdc66dfa5514855826d380b85ce7abd [8/8] FROMLIST: sched: Rework pick_next_task() and prev_balance() to avoid stale prev references
config: arm-randconfig-r112-20260418 (https://download.01.org/0day-ci/archive/20260419/202604190303.5X7asVLq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190303.5X7asVLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190303.5X7asVLq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:2448:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2448:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2448:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2448:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2448:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2684:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2684:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2684:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2694:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2694:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2694:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2800:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2800:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2800:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2301:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2301:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2301:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2311:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2311:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2311:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1194:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1194:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1194:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1194:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1292:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1292:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1292:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1590:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1590:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1590:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1590:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1590:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1590:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1703:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1703:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1703:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2520:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2520:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2520:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2181:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2181:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2182:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2182:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2182:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2257:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2257:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2257:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2277:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2277:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2277:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2845:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2845:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2845:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2847:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2847:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2847:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2849:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2849:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2849:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3089:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:2221:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:874:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1012:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1012:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1012:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1220:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1220:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1220:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1338:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1338:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1338:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1389:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1389:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1389:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1438:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1438:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1438:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1486:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1486:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1486:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1487:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1487:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1487:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1497:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1497:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1497:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1498:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1498:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1498:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2052:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2052:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2052:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
>> kernel/sched/ext.c:2172:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2172:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2172:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2235:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2235:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2235:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2291:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2291:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2291:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2338:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2338:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2338:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2387:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2387:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2387:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2501:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2501:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2501:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2562:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2562:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2562:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2586:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2586:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2586:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2708:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2708:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2708:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2787:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2787:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2787:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2840:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2840:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2840:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2868:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2868:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2868:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2881:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2881:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2881:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3011:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3011:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3011:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3027:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3027:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3027:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3927:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:3927:49: sparse:     expected struct scx_kick_pseqs **pseqs
   kernel/sched/ext.c:3927:49: sparse:     got struct scx_kick_pseqs [noderef] __rcu **
   kernel/sched/ext.c:3930:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3930:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3930:27: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:3930:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3930:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3930:27: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4217:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4260:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4371:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4448:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:4451:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4451:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4451:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4460:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4460:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4460:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:5156:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5273:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5538:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6534:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6534:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6534:33: sparse:    struct task_struct const *

vim +2172 kernel/sched/ext.c

  2165	
  2166	static int balance_scx(struct rq *rq, struct rq_flags *rf)
  2167	{
  2168		/*
  2169		 * Note, rq->donor may change during rq lock drops,
  2170		 * so don't re-use prev across lock drops
  2171		 */
> 2172		struct task_struct *prev = rq->donor;
  2173		int ret;
  2174	
  2175		rq_unpin_lock(rq, rf);
  2176	
  2177		ret = balance_one(rq, prev);
  2178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
