Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFD46AED5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061531; cv=none; b=jW0uAbV3WrVINJC1ZOgkZfSPHCoUmnucbkOJkmW84dKxL1g8X77cOdX3h06ttQp1+epUA1VdtGiqwDzMsrKlttpQLBB9ppWcLag+hjrDxpAnjx7VClXOqBw0+11CAJWPN2dNz/n44R5ybI+aRxSp3fIRJaNOiuKJTmAjJcQobos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061531; c=relaxed/simple;
	bh=O9vUf3xC3OTF8We8u0AIHsNaDMKlv8PBmNZJRj9LdhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QbV0igmW8qaPcBBf/Y9Obzik8cFLSCSJbGep/j8ug1P4XvJjQ1zyL0nlGHEKxjehiuCEXsGoBKsImmUQIXjjBOfLQ+jNv6P2w7oqzA8oxtCRQMp3x8I5TSXM1inWqWftSyup2kC4kIn9ogAPIgKP6cF+wp5fA5hhqGP2Fpgcz4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oi+Y0FI4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oi+Y0FI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769061526; x=1800597526;
  h=date:from:to:cc:subject:message-id;
  bh=O9vUf3xC3OTF8We8u0AIHsNaDMKlv8PBmNZJRj9LdhA=;
  b=Oi+Y0FI48JEs9VXmvPJcdFr9GtGzTaxMmdODl4r+TiRReVv181VPZI2o
   pv3x1FCZgQ0xWJrAMSakwKzHVwyicV4PGMFu8BuB/GW8cso8FmT2DyNaD
   UISA9FXlmlkYB79XaX/dcba+kiDucX8V/VyIrvTnRDBdTfIyNOIUUdXtk
   4bwy99IeaIcA+0Vz35rJLK7yIHBAgiJSyQ0ID0DNWKID0ZljskZ/7bsO2
   jQxMpRcbRqmQa9sF7JBbUdlAtzE8o85MW+lJBCBiLfoPsjh7/yf2oz3bL
   15zSJyz/yuYrwjJIF6nm5z4TISULR05B8SG4p8/TD6EOSuC0o+SK6Pzv8
   A==;
X-CSE-ConnectionGUID: k1ooeYlhSraQPdy9BIDR5w==
X-CSE-MsgGUID: JpsWmHuUSMKwLP8EnP72TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69494613"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="69494613"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:58:41 -0800
X-CSE-ConnectionGUID: rc7/L9XDQrmNI/KDxOaBUw==
X-CSE-MsgGUID: GCzvJDRSThC8yhtVB1pjBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="205895533"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 21:58:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viniG-00000000SVV-2GVf;
	Thu, 22 Jan 2026 05:58:36 +0000
Date: Thu, 22 Jan 2026 13:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1]
 kernel/sched/rt.c:1676:35: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202601221307.HcnzU0cv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   64641b4e0c92a704649a2f820260cef0cd96465f
commit: c5c86c524cdc66dfa5514855826d380b85ce7abd [0/1] FROMLIST: sched: Rework pick_next_task() and prev_balance() to avoid stale prev references
config: x86_64-randconfig-121-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221307.HcnzU0cv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221307.HcnzU0cv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221307.HcnzU0cv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2395:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2395:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2395:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:985:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:985:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:985:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1525:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1525:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1525:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1907:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1907:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1907:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1575:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1575:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1575:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1576:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1576:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1576:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1650:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1650:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1650:45: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/rt.c:1676:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1676:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1676:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1702:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1702:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1702:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1721:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1721:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1721:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2074:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2074:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2074:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2097:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2097:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2097:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2446:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2446:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2446:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2448:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
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
>> kernel/sched/deadline.c:2277:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
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
   kernel/sched/syscalls.c:210:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:256:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:256:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:256:48: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1463:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1463:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1463:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1316:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/syscalls.c:1386:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1745:15: sparse: sparse: dereference of noderef expression
--
   kernel/sched/fair.c:1213:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1213:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1213:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1247:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1247:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1247:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1305:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1305:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1305:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13025:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13025:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13025:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6883:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6883:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6883:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7092:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7092:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7092:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8494:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8494:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8494:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8707:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8707:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8707:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8849:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8849:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8849:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8883:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8883:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8883:37: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:8997:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8997:14: sparse:     expected struct task_struct *prev
   kernel/sched/fair.c:8997:14: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9117:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9117:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9117:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10176:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10176:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10176:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10804:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10804:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10804:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12257:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12257:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12257:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11906:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11906:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11906:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12371:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12371:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12371:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6796:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2532:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *

vim +1676 kernel/sched/rt.c

  1669	
  1670	static int balance_rt(struct rq *rq, struct rq_flags *rf)
  1671	{
  1672		/*
  1673		 * Note, rq->donor may change during rq lock drops,
  1674		 * so don't re-use p across lock drops
  1675		 */
> 1676		struct task_struct *p = rq->donor;
  1677	
  1678		if (!on_rt_rq(&p->rt) && need_pull_rt_task(rq, p)) {
  1679			int done = 0;
  1680	
  1681			/*
  1682			 * This is OK, because current is on_cpu, which avoids it being
  1683			 * picked for load-balance and preemption/IRQs are still
  1684			 * disabled avoiding further scheduler activity on it and we've
  1685			 * not yet started the picking loop.
  1686			 */
  1687			rq_unpin_lock(rq, rf);
  1688			trace_android_rvh_sched_balance_rt(rq, p, &done);
  1689			if (!done)
  1690				pull_rt_task(rq);
  1691			rq_repin_lock(rq, rf);
  1692		}
  1693	
  1694		return sched_stop_runnable(rq) || sched_dl_runnable(rq) || sched_rt_runnable(rq);
  1695	}
  1696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
