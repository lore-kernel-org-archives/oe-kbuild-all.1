Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348183093D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 21:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771191730; cv=none; b=Otg2/ngnRZ6tordHKdhpERkjlb8qlwRFUkgN+5OM45294aOGzes+UAl2reII91I4fFPQMsxorPxP+cqHNHn3qq6Vu2Ib4UMTIHu9mbp4jEflVu+KJvjp06tqdKcMmbq5Z1EF17jIpu8Z1YlaXuKJ+YbjAg3+vEcHAIUuxLyTrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771191730; c=relaxed/simple;
	bh=JcIJcr44sMuZqTSrMNM2GYm2IkfkqC3J5LwAUKZwwh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MSla67MPc2h6mfVPOwMFuEpBVpF5ENN41AH1q687ODhDlM7sn4sitNuAYzTG/IgPLbtZ3M5ZbscqpcfZRVfwgKcXKrHx7PbOMSN1DRd8rsT55GL593p56+Vy5wWu3q9fOzU4bI5Rt3FEF5+W7N+Cl7oMl4vgdzR7jBgWb6Kz9aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0EVV5UG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0EVV5UG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771191727; x=1802727727;
  h=date:from:to:cc:subject:message-id;
  bh=JcIJcr44sMuZqTSrMNM2GYm2IkfkqC3J5LwAUKZwwh4=;
  b=m0EVV5UG0KohKP+H36ogOLSGs8O4Cc4krKGYeZ81rvbE5S9S/EKaQGrD
   f61wSuPejxtbr89yWwzJZyFcOYVjWVlqW0m+Wf2gEj51+QanJGXCj5pI6
   FV+iGiAta52TYXLBArpEbT4XOZzGJm7WNjac/FHHbQjtm2hQG6vdj8kLk
   XfHndY1FiRDzSniUG7vADkkm2gVjVjQzOcO2Ss6jXbOzKbVocMBlsV11q
   uqzpw2hFmRV9hGkVVuEMuwhijHIKs+EaJy/OBlO8+sxTfDnFnxob4wZez
   jfSab4/iOCZu8d/3wf9D28QFIZR4WsEnHMLNvHx+6y/HWgfZT6qR/aFut
   Q==;
X-CSE-ConnectionGUID: M0EWq63ATO6/dz0UtHha8A==
X-CSE-MsgGUID: mjvTR3hqTWCK3lTu/l6gRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71997898"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71997898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 13:42:06 -0800
X-CSE-ConnectionGUID: UUpVfgo1SViStfW9cYAHXw==
X-CSE-MsgGUID: BJjE5iDcSiOl++zj762/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="236444825"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Feb 2026 13:42:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrjsQ-00000000zBm-0KNJ;
	Sun, 15 Feb 2026 21:42:02 +0000
Date: Mon, 16 Feb 2026 05:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/fair.c:11657:44: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202602160507.wgsZm8no-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   8 months ago
config: i386-randconfig-062-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160507.wgsZm8no-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160507.wgsZm8no-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160507.wgsZm8no-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1196:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1196:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1196:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12755:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12755:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12755:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6936:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6936:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6936:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8322:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8322:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8322:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8526:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8526:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8668:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8668:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8668:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8699:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8699:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8699:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8917:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8917:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8917:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10562:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12007:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12007:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12007:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:11657:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11657:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11657:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12116:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12116:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12116:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6653:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1008:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1008:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1008:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1541:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1541:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1541:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1666:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1666:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1666:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2634:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2634:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2634:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2644:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2644:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2644:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2750:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2750:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2750:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2278:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2278:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2278:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2288:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2288:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2288:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1197:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1197:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1197:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1197:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1197:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1197:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1295:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1295:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1295:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1604:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1604:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1604:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1604:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1604:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1604:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1693:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1693:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1693:39: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/deadline.c:2495:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2495:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2495:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2164:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2164:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2164:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2165:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2165:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2165:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2240:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2240:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2240:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2795:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2795:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2795:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2797:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2797:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2797:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2799:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2799:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2799:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2986:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2986:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2986:23: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2437:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2437:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2437:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1293:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *

vim +11657 kernel/sched/fair.c

3b2a793ea70fd1 kernel/sched/fair.c Swapnil Sapkal            2024-12-20  11647  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11648  /*
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11649   * Check this_cpu to ensure it is balanced within domain. Attempt to move
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11650   * tasks if there is an imbalance.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11651   */
4c3e509ea9f249 kernel/sched/fair.c Ingo Molnar               2024-03-08  11652  static int sched_balance_rq(int this_cpu, struct rq *this_rq,
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11653  			struct sched_domain *sd, enum cpu_idle_type idle,
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  11654  			int *continue_balancing)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11655  {
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11656  	int ld_moved, cur_ld_moved, active_balance = 0;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19 @11657  	struct sched_domain *sd_parent = sd->parent;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11658  	struct sched_group *group;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11659  	struct rq *busiest;
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11660  	struct rq_flags rf;
4ba2968420fa9d kernel/sched/fair.c Christoph Lameter         2014-08-26  11661  	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11662  	struct lb_env env = {
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11663  		.sd		= sd,
ddcdf6e7d9919d kernel/sched/fair.c Peter Zijlstra            2012-02-22  11664  		.dst_cpu	= this_cpu,
ddcdf6e7d9919d kernel/sched/fair.c Peter Zijlstra            2012-02-22  11665  		.dst_rq		= this_rq,
0dd37d6dd33a9c kernel/sched/fair.c Yicong Yang               2023-05-30  11666  		.dst_grpmask    = group_balance_mask(sd->groups),
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11667  		.idle		= idle,
c59862f8265f80 kernel/sched/fair.c Vincent Guittot           2022-08-25  11668  		.loop_break	= SCHED_NR_MIGRATE_BREAK,
b9403130a5350f kernel/sched/fair.c Michael Wang              2012-07-12  11669  		.cpus		= cpus,
0ec8aa00f2b4dc kernel/sched/fair.c Peter Zijlstra            2013-10-07  11670  		.fbq_type	= all,
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11671  		.tasks		= LIST_HEAD_INIT(env.tasks),
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11672  	};
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11673  
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11674  	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11675  
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  11676  	schedstat_inc(sd->lb_count[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11677  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11678  redo:
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  11679  	if (!should_we_balance(&env)) {
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  11680  		*continue_balancing = 0;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11681  		goto out_balanced;
23f0d2093c789e kernel/sched/fair.c Joonsoo Kim               2013-08-06  11682  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11683  
82cf921432fc18 kernel/sched/fair.c Ingo Molnar               2024-03-08  11684  	group = sched_balance_find_src_group(&env);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11685  	if (!group) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  11686  		schedstat_inc(sd->lb_nobusyg[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11687  		goto out_balanced;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11688  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11689  
f1cd2e2e79d283 kernel/sched/fair.c Ingo Molnar               2023-10-23  11690  	busiest = sched_balance_find_src_rq(&env, group);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11691  	if (!busiest) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  11692  		schedstat_inc(sd->lb_nobusyq[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11693  		goto out_balanced;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11694  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11695  
09348d75a6ce60 kernel/sched/fair.c Ingo Molnar               2022-08-11  11696  	WARN_ON_ONCE(busiest == env.dst_rq);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11697  
3b2a793ea70fd1 kernel/sched/fair.c Swapnil Sapkal            2024-12-20  11698  	update_lb_imbalance_stat(&env, sd, idle);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11699  
1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  11700  	env.src_cpu = busiest->cpu;
1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  11701  	env.src_rq = busiest;
1aaf90a4b88aae kernel/sched/fair.c Vincent Guittot           2015-02-27  11702  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11703  	ld_moved = 0;
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  11704  	/* Clear this flag as soon as we find a pullable task */
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  11705  	env.flags |= LBF_ALL_PINNED;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11706  	if (busiest->nr_running > 1) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11707  		/*
82cf921432fc18 kernel/sched/fair.c Ingo Molnar               2024-03-08  11708  		 * Attempt to move tasks. If sched_balance_find_src_group has found
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11709  		 * an imbalance but busiest->nr_running <= 1, the group is
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11710  		 * still unbalanced. ld_moved simply stays zero, so it is
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11711  		 * correctly treated as an imbalance.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11712  		 */
c82513e513556a kernel/sched/fair.c Peter Zijlstra            2012-04-26  11713  		env.loop_max  = min(sysctl_sched_nr_migrate, busiest->nr_running);
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11714  
5d6523ebd2f67d kernel/sched/fair.c Peter Zijlstra            2012-03-10  11715  more_balance:
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11716  		rq_lock_irqsave(busiest, &rf);
3bed5e2166a5e4 kernel/sched/fair.c Peter Zijlstra            2016-10-03  11717  		update_rq_clock(busiest);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11718  
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11719  		/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11720  		 * cur_ld_moved - load moved in current iteration
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11721  		 * ld_moved     - cumulative load moved across iterations
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11722  		 */
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11723  		cur_ld_moved = detach_tasks(&env);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11724  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11725  		/*
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11726  		 * We've detached some tasks from busiest_rq. Every
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11727  		 * task is masked "TASK_ON_RQ_MIGRATING", so we can safely
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11728  		 * unlock busiest->lock, and we are able to be sure
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11729  		 * that nobody can manipulate the tasks in parallel.
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11730  		 * See task_rq_lock() family for the details.
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11731  		 */
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11732  
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11733  		rq_unlock(busiest, &rf);
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11734  
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11735  		if (cur_ld_moved) {
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11736  			attach_tasks(&env);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11737  			ld_moved += cur_ld_moved;
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11738  		}
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai              2014-08-20  11739  
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11740  		local_irq_restore(rf.flags);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11741  
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11742  		if (env.flags & LBF_NEED_BREAK) {
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11743  			env.flags &= ~LBF_NEED_BREAK;
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11744  			goto more_balance;
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11745  		}
f1cd0858100c67 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11746  
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11747  		/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11748  		 * Revisit (affine) tasks on src_cpu that couldn't be moved to
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11749  		 * us and move them to an alternate dst_cpu in our sched_group
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11750  		 * where they can run. The upper limit on how many times we
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11751  		 * iterate on same src_cpu is dependent on number of CPUs in our
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11752  		 * sched_group.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11753  		 *
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11754  		 * This changes load balance semantics a bit on who can move
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11755  		 * load to a given_cpu. In addition to the given_cpu itself
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11756  		 * (or a ilb_cpu acting on its behalf where given_cpu is
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11757  		 * nohz-idle), we now have balance_cpu in a position to move
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11758  		 * load to given_cpu. In rare situations, this may cause
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11759  		 * conflicts (balance_cpu and given_cpu/ilb_cpu deciding
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11760  		 * _independently_ and at _same_ time to move some load to
3b03706fa621ce kernel/sched/fair.c Ingo Molnar               2021-03-18  11761  		 * given_cpu) causing excess load to be moved to given_cpu.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11762  		 * This however should not happen so much in practice and
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11763  		 * moreover subsequent load balance cycles should correct the
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11764  		 * excess load moved.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11765  		 */
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11766  		if ((env.flags & LBF_DST_PINNED) && env.imbalance > 0) {
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11767  
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11768  			/* Prevent to re-select dst_cpu via env's CPUs */
c89d92eddfad11 kernel/sched/fair.c Viresh Kumar              2019-02-12  11769  			__cpumask_clear_cpu(env.dst_cpu, env.cpus);
7aff2e3a56b724 kernel/sched/fair.c Vladimir Davydov          2013-09-15  11770  
78feefc512a091 kernel/sched/fair.c Michael Wang              2012-08-06  11771  			env.dst_rq	 = cpu_rq(env.new_dst_cpu);
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11772  			env.dst_cpu	 = env.new_dst_cpu;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11773  			env.flags	&= ~LBF_DST_PINNED;
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11774  			env.loop	 = 0;
c59862f8265f80 kernel/sched/fair.c Vincent Guittot           2022-08-25  11775  			env.loop_break	 = SCHED_NR_MIGRATE_BREAK;
e02e60c109ca70 kernel/sched/fair.c Joonsoo Kim               2013-04-23  11776  
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11777  			/*
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11778  			 * Go back to "more_balance" rather than "redo" since we
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11779  			 * need to continue with same src_cpu.
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11780  			 */
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11781  			goto more_balance;
88b8dac0a14c51 kernel/sched/fair.c Srivatsa Vaddagiri        2012-06-19  11782  		}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11783  
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11784  		/*
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11785  		 * We failed to reach balance because of affinity.
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11786  		 */
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11787  		if (sd_parent) {
63b2ca30bdb3db kernel/sched/fair.c Nicolas Pitre             2014-05-26  11788  			int *group_imbalance = &sd_parent->groups->sgc->imbalance;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11789  
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11790  			if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11791  				*group_imbalance = 1;
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11792  		}
6263322c5e8ffd kernel/sched/fair.c Peter Zijlstra            2013-08-19  11793  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11794  		/* All tasks on this runqueue were pinned by CPU affinity */
8e45cb545d98bc kernel/sched/fair.c Peter Zijlstra            2012-02-22  11795  		if (unlikely(env.flags & LBF_ALL_PINNED)) {
c89d92eddfad11 kernel/sched/fair.c Viresh Kumar              2019-02-12  11796  			__cpumask_clear_cpu(cpu_of(busiest), cpus);
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11797  			/*
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11798  			 * Attempting to continue load balancing at the current
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11799  			 * sched_domain level only makes sense if there are
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11800  			 * active CPUs remaining as possible busiest CPUs to
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11801  			 * pull load from which are not contained within the
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11802  			 * destination group that is receiving any migrated
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11803  			 * load.
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11804  			 */
65a4433aebe36c kernel/sched/fair.c Jeff Hugo                 2017-06-07  11805  			if (!cpumask_subset(cpus, env.dst_grpmask)) {
bbf18b19495942 kernel/sched/fair.c Prashanth Nageshappa      2012-06-19  11806  				env.loop = 0;
c59862f8265f80 kernel/sched/fair.c Vincent Guittot           2022-08-25  11807  				env.loop_break = SCHED_NR_MIGRATE_BREAK;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11808  				goto redo;
bbf18b19495942 kernel/sched/fair.c Prashanth Nageshappa      2012-06-19  11809  			}
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11810  			goto out_all_pinned;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11811  		}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11812  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11813  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11814  	if (!ld_moved) {
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  11815  		schedstat_inc(sd->lb_failed[idle]);
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11816  		/*
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11817  		 * Increment the failure counter only on periodic balance.
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11818  		 * We do not want newidle balance, which can be very
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11819  		 * frequent, pollute the failure counter causing
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11820  		 * excessive cache_hot migrations and active balances.
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11821  		 *
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11822  		 * Similarly for migration_misfit which is not related to
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11823  		 * load/util migration, don't pollute nr_balance_failed.
58b26c4c025778 kernel/sched_fair.c Venkatesh Pallipadi       2010-09-10  11824  		 */
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11825  		if (idle != CPU_NEWLY_IDLE &&
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11826  		    env.migration_type != migrate_misfit)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11827  			sd->nr_balance_failed++;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11828  
bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  11829  		if (need_active_balance(&env)) {
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11830  			unsigned long flags;
8a8c69c3277886 kernel/sched/fair.c Peter Zijlstra            2016-10-04  11831  
5cb9eaa3d274f7 kernel/sched/fair.c Peter Zijlstra            2020-11-17  11832  			raw_spin_rq_lock_irqsave(busiest, flags);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11833  
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11834  			/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11835  			 * Don't kick the active_load_balance_cpu_stop,
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11836  			 * if the curr task on busiest CPU can't be
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar               2018-03-03  11837  			 * moved to this_cpu:
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11838  			 */
3bd3706251ee8a kernel/sched/fair.c Sebastian Andrzej Siewior 2019-04-23  11839  			if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr)) {
5cb9eaa3d274f7 kernel/sched/fair.c Peter Zijlstra            2020-11-17  11840  				raw_spin_rq_unlock_irqrestore(busiest, flags);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11841  				goto out_one_pinned;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11842  			}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11843  
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  11844  			/* Record that we found at least one task that could run on this_cpu */
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  11845  			env.flags &= ~LBF_ALL_PINNED;
8a41dfcda7a32e kernel/sched/fair.c Vincent Guittot           2021-01-07  11846  
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11847  			/*
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11848  			 * ->active_balance synchronizes accesses to
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11849  			 * ->active_balance_work.  Once set, it's cleared
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11850  			 * only after active load balance is finished.
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11851  			 */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11852  			if (!busiest->active_balance) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11853  				busiest->active_balance = 1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11854  				busiest->push_cpu = this_cpu;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11855  				active_balance = 1;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11856  			}
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11857  
f0498d2a54e796 kernel/sched/fair.c Peter Zijlstra            2023-10-10  11858  			preempt_disable();
f0498d2a54e796 kernel/sched/fair.c Peter Zijlstra            2023-10-10  11859  			raw_spin_rq_unlock_irqrestore(busiest, flags);
bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  11860  			if (active_balance) {
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11861  				stop_one_cpu_nowait(cpu_of(busiest),
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11862  					active_load_balance_cpu_stop, busiest,
969c79215a35b0 kernel/sched_fair.c Tejun Heo                 2010-05-06  11863  					&busiest->active_balance_work);
bd939f45da24e2 kernel/sched/fair.c Peter Zijlstra            2012-05-02  11864  			}
f0498d2a54e796 kernel/sched/fair.c Peter Zijlstra            2023-10-10  11865  			preempt_enable();
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11866  		}
e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  11867  	} else {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11868  		sd->nr_balance_failed = 0;
e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  11869  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11870  
e9b9734b74656a kernel/sched/fair.c Vincent Guittot           2021-01-07  11871  	if (likely(!active_balance) || need_active_balance(&env)) {
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11872  		/* We were unbalanced, so reset the balancing interval */
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11873  		sd->balance_interval = sd->min_interval;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11874  	}
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11875  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11876  	goto out;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11877  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11878  out_balanced:
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11879  	/*
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11880  	 * We reach balance although we may have faced some affinity
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  11881  	 * constraints. Clear the imbalance flag only if other tasks got
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  11882  	 * a chance to move and fix the imbalance.
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11883  	 */
f6cad8df6b30a5 kernel/sched/fair.c Vincent Guittot           2019-07-01  11884  	if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11885  		int *group_imbalance = &sd_parent->groups->sgc->imbalance;
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11886  
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11887  		if (*group_imbalance)
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11888  			*group_imbalance = 0;
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11889  	}
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11890  
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11891  out_all_pinned:
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11892  	/*
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11893  	 * We reach balance because all tasks are pinned at this level so
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11894  	 * we can't migrate them. Let the imbalance flag set so parent level
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11895  	 * can try to migrate them.
afdeee0510db91 kernel/sched/fair.c Vincent Guittot           2014-08-26  11896  	 */
ae92882e5646d8 kernel/sched/fair.c Josh Poimboeuf            2016-06-17  11897  	schedstat_inc(sd->lb_balanced[idle]);
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11898  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11899  	sd->nr_balance_failed = 0;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11900  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11901  out_one_pinned:
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11902  	ld_moved = 0;
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11903  
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11904  	/*
7d058285cd77cc kernel/sched/fair.c Ingo Molnar               2024-03-08  11905  	 * sched_balance_newidle() disregards balance intervals, so we could
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  11906  	 * repeatedly reach this code, which would lead to balance_interval
3b03706fa621ce kernel/sched/fair.c Ingo Molnar               2021-03-18  11907  	 * skyrocketing in a short amount of time. Skip the balance_interval
5ba553eff0c3a7 kernel/sched/fair.c Peter Zijlstra            2019-05-29  11908  	 * increase logic to avoid that.
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11909  	 *
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11910  	 * Similarly misfit migration which is not necessarily an indication of
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11911  	 * the system being busy and requires lb to backoff to let it settle
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11912  	 * down.
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11913  	 */
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11914  	if (env.idle == CPU_NEWLY_IDLE ||
58eeb2d79b542c kernel/sched/fair.c Qais Yousef               2024-03-24  11915  	    env.migration_type == migrate_misfit)
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11916  		goto out;
3f130a37c442d5 kernel/sched/fair.c Valentin Schneider        2018-09-26  11917  
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11918  	/* tune up the balancing interval */
47b7aee14fd7e4 kernel/sched/fair.c Valentin Schneider        2018-09-26  11919  	if ((env.flags & LBF_ALL_PINNED &&
5b54b56be5b540 kernel/sched/fair.c Peter Zijlstra            2011-09-22  11920  	     sd->balance_interval < MAX_PINNED_INTERVAL) ||
47b7aee14fd7e4 kernel/sched/fair.c Valentin Schneider        2018-09-26  11921  	    sd->balance_interval < sd->max_interval)
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11922  		sd->balance_interval *= 2;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11923  out:
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11924  	return ld_moved;
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11925  }
1e3c88bdeb1260 kernel/sched_fair.c Peter Zijlstra            2009-12-17  11926  

:::::: The code at line 11657 was first introduced by commit
:::::: 6263322c5e8ffdaf5eaaa29e9d02d84a786aa970 sched/fair: Rewrite group_imb trigger

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
