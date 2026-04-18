Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CA3A1685
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776555894; cv=none; b=nNlIe8RBezmIwIH+uI13i217QgGPe4c+OQ3nbKMTj2iV69AkvCEvXqX2vKOtFCDMC4rWI4Kyp38bnw4iuQCiIncfj99NBAF1F44ttmIltB6p47arL49xMdPmylm2tRsbS6vABL3ZUC1lB+lS15IXeYlZH6ccP6f8tcxtMvXUWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776555894; c=relaxed/simple;
	bh=TLbz5HWP8dBkUYzJGeM8uu8puQ4TJ4E1v4cSbhL6F0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TAAIw5IkpKQpqyqQbEtl2T7lFXS56tg3C/c9rZimqcpGxvdyWwnNFN2VF3XbX0f5Ld6H2uBRPTWlC5R8X25X1Ss4upa533Hzu3FLn7ZkD1xPh5nJT56YM3hUY5AsBXj95vOpuSB/C/cgfinIPMaXw5GmdSAMsNz5eqmXkCa6hfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLuCf32Y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLuCf32Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776555890; x=1808091890;
  h=date:from:to:cc:subject:message-id;
  bh=TLbz5HWP8dBkUYzJGeM8uu8puQ4TJ4E1v4cSbhL6F0I=;
  b=GLuCf32YAtL+OlcdbrzC2C/V/R1GYrZki5TPq5wcY44xbPlC/CdWbiv7
   1DPYy2qsfYaVA5tAXO4gvlKYroCGtwdb29cnc1w8Bvxnk9larJFxTzouC
   gzFRGYJGmf5oaRE9km2zOntpZ+6YNCTevhedKcmPHLtqgwhHZxrrwDZiz
   DzNbQOaXFjDPKSyAQmY399AOiEJJNudViNmYFkdq5yzHM+yS7iPL4Y5AL
   bK8cL1Fhr8EfFG2qxYNAAgwUugCL4TvQF1noJXJzGmpBRde8o2+XoD+ez
   7zM+EzygtBWcKsQa8wG3I5EgsF5Fvq31nRO7wDtXyjjAIvHchaoC4Ru+/
   w==;
X-CSE-ConnectionGUID: IF+cvRtMTI6hwzrUNDwBTA==
X-CSE-MsgGUID: yQuZoR/kQO2mLgIKJ68Rng==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87821817"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="87821817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 16:44:50 -0700
X-CSE-ConnectionGUID: w/3u/srZS6KWt77JbvwBWg==
X-CSE-MsgGUID: VJlUoXmQR2+WabDGAgHSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="224864639"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Apr 2026 16:44:48 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEFLB-000000001Ya-3iPQ;
	Sat, 18 Apr 2026 23:44:45 +0000
Date: Sun, 19 Apr 2026 07:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8]
 kernel/sched/ext.c:2265:41: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202604190719.fbBYHKA0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ebdb82c03e6adc63d7eaf683c5e5555b49d6a3bc
commit: e7517b2fdc758cfc87b3ea2a17c3284772b65e76 [8/8] ANDROID: Export find_user_dsq() for BPF scheduler extensions
config: arm-randconfig-r112-20260418 (https://download.01.org/0day-ci/archive/20260419/202604190719.fbBYHKA0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190719.fbBYHKA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190719.fbBYHKA0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1576:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1655:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1655:45: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:1655:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1655:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1655:56: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:1655:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1686:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1686:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1686:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1712:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1712:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1712:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1731:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1731:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1731:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2167:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2167:40: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:2167:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2167:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2167:51: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:2167:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2190:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2190:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2190:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2539:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2539:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2539:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2541:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2541:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2541:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2541:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2541:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2541:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2750:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2750:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2750:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2760:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2760:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2760:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2866:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2866:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2866:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2306:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2306:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2306:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2316:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2316:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2316:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1192:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1192:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1192:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1192:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1192:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1192:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1290:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1290:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1290:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1588:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1588:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1588:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1588:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1588:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1588:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1702:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1702:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1702:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2525:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2525:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2525:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2180:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2180:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2180:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2181:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2181:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2181:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2258:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2258:43: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/deadline.c:2258:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2258:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2258:54: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/deadline.c:2258:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2282:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2282:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2282:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2911:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2911:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2911:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2913:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2913:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2913:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2915:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2915:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2915:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3109:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3109:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3109:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3155:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext.c:2265:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:892:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:943:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:943:48: sparse:    struct task_struct *
   kernel/sched/ext.c:943:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1250:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1250:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1250:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1368:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1368:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1368:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1419:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1419:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1419:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1468:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1468:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1468:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1516:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1516:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1516:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1517:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1517:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1517:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1527:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1527:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1527:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:1528:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1528:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1528:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2096:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2096:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2096:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2216:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2216:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2216:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2279:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2279:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2279:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2335:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2335:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2335:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2382:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2382:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2382:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2431:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2431:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2431:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2545:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2545:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2545:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2606:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2606:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2606:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2630:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2630:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2630:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2752:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2752:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2752:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2831:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2831:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2831:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2884:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2884:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2884:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2912:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2912:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2912:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2925:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2925:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2925:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3055:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3055:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3055:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3071:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3071:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3071:33: sparse:     got struct scx_sched [noderef] __rcu *extern [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3971:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:3971:49: sparse:     expected struct scx_kick_pseqs **pseqs
   kernel/sched/ext.c:3971:49: sparse:     got struct scx_kick_pseqs [noderef] __rcu **
   kernel/sched/ext.c:3974:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3974:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3974:27: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:3974:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3974:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3974:27: sparse:    struct scx_kick_pseqs *
>> kernel/sched/ext.c:4266:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4309:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4423:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4501:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:4504:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4504:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4504:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4513:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4513:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4513:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:5213:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5330:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5595:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6591:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6591:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6591:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *extern [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:210:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1466:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1466:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1466:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2317:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2317:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2516:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2516:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2516:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2516:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2516:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2516:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1318:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/syscalls.c:1388:15: sparse: sparse: dereference of noderef expression
   kernel/sched/syscalls.c:1389:19: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1755:15: sparse: sparse: dereference of noderef expression

vim +2265 kernel/sched/ext.c

7b0888b7cc1924 Tejun Heo 2024-06-18  2249  
65aaf90569ffa2 Tejun Heo 2024-09-03  2250  static void process_ddsp_deferred_locals(struct rq *rq)
65aaf90569ffa2 Tejun Heo 2024-09-03  2251  {
65aaf90569ffa2 Tejun Heo 2024-09-03  2252  	struct task_struct *p;
65aaf90569ffa2 Tejun Heo 2024-09-03  2253  
65aaf90569ffa2 Tejun Heo 2024-09-03  2254  	lockdep_assert_rq_held(rq);
65aaf90569ffa2 Tejun Heo 2024-09-03  2255  
65aaf90569ffa2 Tejun Heo 2024-09-03  2256  	/*
65aaf90569ffa2 Tejun Heo 2024-09-03  2257  	 * Now that @rq can be unlocked, execute the deferred enqueueing of
65aaf90569ffa2 Tejun Heo 2024-09-03  2258  	 * tasks directly dispatched to the local DSQs of other CPUs. See
65aaf90569ffa2 Tejun Heo 2024-09-03  2259  	 * direct_dispatch(). Keep popping from the head instead of using
65aaf90569ffa2 Tejun Heo 2024-09-03  2260  	 * list_for_each_entry_safe() as dispatch_local_dsq() may unlock @rq
65aaf90569ffa2 Tejun Heo 2024-09-03  2261  	 * temporarily.
65aaf90569ffa2 Tejun Heo 2024-09-03  2262  	 */
65aaf90569ffa2 Tejun Heo 2024-09-03  2263  	while ((p = list_first_entry_or_null(&rq->scx.ddsp_deferred_locals,
65aaf90569ffa2 Tejun Heo 2024-09-03  2264  				struct task_struct, scx.dsq_list.node))) {
cdf5a6faa8cf0e Tejun Heo 2025-04-29 @2265  		struct scx_sched *sch = scx_root;
e683949a4b8c95 Tejun Heo 2024-09-09  2266  		struct scx_dispatch_q *dsq;
65aaf90569ffa2 Tejun Heo 2024-09-03  2267  
65aaf90569ffa2 Tejun Heo 2024-09-03  2268  		list_del_init(&p->scx.dsq_list.node);
65aaf90569ffa2 Tejun Heo 2024-09-03  2269  
cdf5a6faa8cf0e Tejun Heo 2025-04-29  2270  		dsq = find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
e683949a4b8c95 Tejun Heo 2024-09-09  2271  		if (!WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
a8433f7a267f9f Tejun Heo 2025-05-14  2272  			dispatch_to_local_dsq(sch, rq, dsq, p,
a8433f7a267f9f Tejun Heo 2025-05-14  2273  					      p->scx.ddsp_enq_flags);
65aaf90569ffa2 Tejun Heo 2024-09-03  2274  	}
65aaf90569ffa2 Tejun Heo 2024-09-03  2275  }
65aaf90569ffa2 Tejun Heo 2024-09-03  2276  

:::::: The code at line 2265 was first introduced by commit
:::::: cdf5a6faa8cf0ef62ec238a18b898ca9827bc472 sched_ext: Move dsq_hash into scx_sched

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
