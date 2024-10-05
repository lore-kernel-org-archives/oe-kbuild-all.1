Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873618EA8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 03:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728098277; cv=none; b=oZpeamBxViDP6quo3l7yWsPUPyt4a6UQbqnJD6jFtMpKp32LvRReqf4uHLpPeoxy64ptLFaGyxoa2+SrzcwllEUVVcSlBKxNN1JXlIWWTZbeqqtu6HSm2O8hAVu//1ujlAoaS/gZKYiz+pZGvZm/qhg8HShjplt1NCuMMNN+7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728098277; c=relaxed/simple;
	bh=Qu/RU/PQjjiarcM7vrEUONhAhlnaZcamWVxthOV9nsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qz+iayhpN90ArZJ6d4Gd8WW6TLaRRNd/ELCC2yOBB/gTyjt3NioEHOZnZZtt9Jiv/V/8OdTrW80GCIb7YEKNBBhG/Ttvtzo5ZSouvhQgpzPvikIewhTbN7D15PsZXBXjdB5djt8gvIOFMVImOBy5HwLfBbKLvkCaHogx8+Cjl2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmGzDKs9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmGzDKs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728098276; x=1759634276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qu/RU/PQjjiarcM7vrEUONhAhlnaZcamWVxthOV9nsQ=;
  b=nmGzDKs9LVxtBBzvMC0HjfpJExfwLeroW5lh8H6zsFoMmirY1n7Jb8F+
   IACzmjZwy4H46dMaR3DJLjrWBp5+3cdjq2f5Wge5XFyR3fbklGb7duS+N
   bi6VmmGj5LHu+jiG/aq+eFgPVfO6d5QiJ5GvObfP6AznG0+EUi94SFvzR
   0AqhpS/YG7+oqiI+qMvyuL5yHgtg5hoG15X1d/PUUxZu8X6ffOE4XOIXC
   2aMtwlPOmKn/XhUcnMgxYGFWim3XQ/lHKnfWsvMSojBXY46FU131jgj5d
   icnDgyu9Uisx2GXTt1NpElx/vkjpvnT6md1/iPB20VKrWYA88KwMtaulq
   g==;
X-CSE-ConnectionGUID: ZDsLq4PKRxO+fTEgyQnnAw==
X-CSE-MsgGUID: HdgsnkYCTqOQMxg/XJ13AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31031154"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31031154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 20:17:54 -0700
X-CSE-ConnectionGUID: 5zmweKqTRWGVNzgZ9EiH6g==
X-CSE-MsgGUID: fT4YBX6RQUiieq0LBHBY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79463530"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 20:17:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swvIk-0002VS-1v;
	Sat, 05 Oct 2024 03:17:50 +0000
Date: Sat, 5 Oct 2024 11:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/ext.c:2758:38: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202410051145.DoLtiKRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27cc6fdf720183dce1dbd293483ec5a9cb6b595e
commit: 753e2836d139b43ab535718c5f17c73c284bb299 sched_ext: Unify regular and core-sched pick task paths
date:   4 weeks ago
config: s390-randconfig-r132-20241004 (https://download.01.org/0day-ci/archive/20241005/202410051145.DoLtiKRC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051145.DoLtiKRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051145.DoLtiKRC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1859:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1859:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1859:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1549:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1549:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1549:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1614:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1614:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1614:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1675:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1675:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1675:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2027:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2027:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2027:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2050:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2050:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2050:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2400:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2400:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2400:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2402:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2402:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2402:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2402:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2402:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2402:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2710:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2710:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2710:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2720:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2720:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2720:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2828:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2828:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2828:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2341:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2341:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2341:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2352:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2352:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2352:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1739:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1739:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2571:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2571:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2571:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2302:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2302:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2302:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2875:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2875:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2875:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2877:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2877:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2877:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2879:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2879:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2879:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3054:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3054:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3054:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:3103:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:774:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:877:22: sparse: sparse: symbol 'scx_dump_data' was not declared. Should it be static?
   kernel/sched/ext.c:1490:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1622:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1622:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1622:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:2072:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2072:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2072:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2082:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2082:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2082:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2632:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2632:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:2632:56: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:2758:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2758:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2758:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:4389:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4389:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:4389:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5119:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5119:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5119:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6332:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6332:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6332:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:253:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:253:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2438:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2438:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2438:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2438:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2438:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2438:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1443:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1700:15: sparse: sparse: dereference of noderef expression

vim +2758 kernel/sched/ext.c

  2755	
  2756	static struct task_struct *pick_task_scx(struct rq *rq)
  2757	{
> 2758		struct task_struct *prev = rq->curr;
  2759		struct task_struct *p;
  2760	
  2761		/*
  2762		 * If balance_scx() is telling us to keep running @prev, replenish slice
  2763		 * if necessary and keep running @prev. Otherwise, pop the first one
  2764		 * from the local DSQ.
  2765		 */
  2766		if ((rq->scx.flags & SCX_RQ_BAL_KEEP) &&
  2767		    !WARN_ON_ONCE(prev->sched_class != &ext_sched_class)) {
  2768			p = prev;
  2769			if (!p->scx.slice)
  2770				p->scx.slice = SCX_SLICE_DFL;
  2771		} else {
  2772			p = first_local_task(rq);
  2773			if (!p)
  2774				return NULL;
  2775	
  2776			if (unlikely(!p->scx.slice)) {
  2777				if (!scx_ops_bypassing() && !scx_warned_zero_slice) {
  2778					printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in pick_next_task_scx()\n",
  2779							p->comm, p->pid);
  2780					scx_warned_zero_slice = true;
  2781				}
  2782				p->scx.slice = SCX_SLICE_DFL;
  2783			}
  2784		}
  2785	
  2786		return p;
  2787	}
  2788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
