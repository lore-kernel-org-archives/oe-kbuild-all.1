Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE12FD69E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776549407; cv=none; b=AYgVomN9wIwTgBgRcIBNd/b63Gcq+59NfvU06ZIgVy1fUEph8ZiJKE/PkXJLze2HH7gXvQZpyPej0HQghF+EL8R6Rsusbr83qY9+Zmx76AqihPPwVJjM+UjtpokTxM6p/HUXROJ2lWKhhBav9sU7MJ9ZoohKxkmG1IEO2ZBwxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776549407; c=relaxed/simple;
	bh=Y3ehphvs3aLFr31ehy3CrBCIlRjrRlBwlPw7US3xUUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ROmksxpwcbLSr17wGhVeRTRqrkRstzgqERByQiQSx/oKpduOlZ3OBxThnHtjCng9LOBUWp2s/R+T5aHzT2OeeLOwcE69Tm8wICcuig6Yin5kzMCIctal6ZYTxZOU5MJnOdVnCWFTfZLP/k0CckhFOWzbGz7o5nb+gidxNBrSxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gy7qaDXr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gy7qaDXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776549405; x=1808085405;
  h=date:from:to:cc:subject:message-id;
  bh=Y3ehphvs3aLFr31ehy3CrBCIlRjrRlBwlPw7US3xUUg=;
  b=gy7qaDXrHxxMzsMQXuBVfLlXx5pgIbn2kjpqCAGrmSMRJcWvDGy4gJub
   JKQgGuXpFuQmuRHqgj2tPafb0NOyrdy/YniYy6md4I8WjtLmzFWv1n2kQ
   bgfcbZ1f7rXQduTX7eeIE74b6kgBREQHFpjoCtZsmiZj1jsfVNcFO701P
   +WdsFkDvbddt5qDLTGXwJJoVWWeE3+UOYc/3NtuoxdfLYtYIdqHHWQBz2
   PGxB45Wcs+NCYc01xBOJqyKg2Pbf84zUX7ys0QoyDpRhwAnMGIkCQ/3cM
   TJEqChcuLlSFLdDEiJkHHdiCN3ZEkE5OM2n9zkbFgtMRQB1xTAkXQreRG
   g==;
X-CSE-ConnectionGUID: vqwccggqSr66MWulEpJrIQ==
X-CSE-MsgGUID: bam7e3pVTKemVJCpuNp2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77594162"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77594162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 14:56:45 -0700
X-CSE-ConnectionGUID: 0ASqcHBxSE2cyByBUPWn9Q==
X-CSE-MsgGUID: DyUfsPJqSuqe61pvhnYJvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="236335541"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Apr 2026 14:56:43 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEDea-000000001VK-0kUC;
	Sat, 18 Apr 2026 21:56:40 +0000
Date: Sun, 19 Apr 2026 05:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8]
 kernel/sched/ext.c:874:39: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202604190559.VDcQAQNg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ebdb82c03e6adc63d7eaf683c5e5555b49d6a3bc
commit: 854eaabf6daaa61452607ca54b0d48af1e25c4fd [8/8] FROMLIST: sched/ext: Split curr|donor references properly
config: arm-randconfig-r112-20260418 (https://download.01.org/0day-ci/archive/20260419/202604190559.VDcQAQNg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190559.VDcQAQNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190559.VDcQAQNg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/deadline.c:2751:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2751:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2751:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2761:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2761:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2761:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2867:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2867:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2867:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2307:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2307:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2307:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2317:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2317:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2317:38: sparse:     got struct task_struct [noderef] __rcu *curr
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
   kernel/sched/deadline.c:2526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2526:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2526:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2181:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2181:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2182:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2182:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2182:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2259:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2259:43: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/deadline.c:2259:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2259:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2259:54: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/deadline.c:2259:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2283:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2283:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2283:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2912:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2912:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2912:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2914:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2914:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2914:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2916:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2916:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2916:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3110:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3110:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3110:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3156:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:2221:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
>> kernel/sched/ext.c:874:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
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
   kernel/sched/ext.c:2172:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
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
   kernel/sched/ext.c:2387:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2387:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2387:38: sparse:     got struct task_struct [noderef] __rcu *donor
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
   kernel/sched/ext.c:4374:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4451:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:4454:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4454:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4454:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4463:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4463:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4463:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:5159:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5276:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5541:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@

vim +874 kernel/sched/ext.c

   871	
   872	static void update_curr_scx(struct rq *rq)
   873	{
 > 874		struct task_struct *donor = rq->donor;
   875		s64 delta_exec;
   876	
   877		delta_exec = update_curr_common(rq);
   878		if (unlikely(delta_exec <= 0))
   879			return;
   880	
   881		if (donor->scx.slice != SCX_SLICE_INF) {
   882			donor->scx.slice -= min_t(u64, donor->scx.slice, delta_exec);
   883			if (!donor->scx.slice)
   884				touch_core_sched(rq, donor);
   885		}
   886	}
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
