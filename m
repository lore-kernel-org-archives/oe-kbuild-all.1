Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1319258B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734278817; cv=none; b=c/OpQtUN5Wu/QebmlKI6gQ4MHVpOizXcM8Ex0FCS59gFR7z4fjtYYs8EOcXaKuhVzCVfuZJ5xOePeFd8ZEmT/Muib0vmC0OSZl3r6teOPfdeqjbqouepw4z4OLJFuXNEHbXaxTIKEbcK82slfawVd8DzYsrvC3UOtY+XV2S0cUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734278817; c=relaxed/simple;
	bh=xM1hpihYbnpsmZoIpY2iWb1XCV1OMImKapdHUrPgfhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQRdNpgR6J5QxLpzAzYtn2dUPgLuxYYpVelJSmFu8D62u+nFZjEivs4bjL1DZeKtM0Fqgmuha3N7hrlqWMh0FsErjK6+3v2kIYv14a+C2kz4umCtPQw9DRKon4HRduznjsyGb0fURb/BiCTnZmCRlgnZ6kygl3+HGpyE+/rI8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgFDIh8U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgFDIh8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734278816; x=1765814816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xM1hpihYbnpsmZoIpY2iWb1XCV1OMImKapdHUrPgfhI=;
  b=EgFDIh8UPPA++Ic4SEcKS8KMHzQyhDR9VIdhQ2n3EI13ySYDXqz0B2dS
   39rOgxvpJZ1yObgQ5W93cd88iKWZsePUzxPc7s5aaRWU4VhRXMGY9zub8
   BjRXQa88oIX8YPDZF5mvIVKa9RPpm6yHTLIuEYt24TmvLYUvInaL9RLLO
   WKf11HaT0GWzYu5GZrZ19UDrqjxLCQ70gLTKqXdjvtD5XoXfOzZiJm0R1
   v20XJqaasQeEoRjCzGBw6loP+UeFDvqyjNMZ3co322xx6hsD4EjLPWMz2
   5kaNWRn2/yvaXVjrMoBzZF9un0LLZf5O033Nl4zaAB7wtzi1sdPqgVmf/
   g==;
X-CSE-ConnectionGUID: DF29wMfYR4GxfF6WQ7EGBA==
X-CSE-MsgGUID: HArcEv56QCiPMmga7g71SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34709438"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34709438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 08:06:55 -0800
X-CSE-ConnectionGUID: LaWIyriWT9qGY2qm0FPCLA==
X-CSE-MsgGUID: y5jTFXIQROO2jk0fKClLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97412352"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2024 08:06:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMr8t-000DiD-0a;
	Sun, 15 Dec 2024 16:06:51 +0000
Date: Mon, 16 Dec 2024 00:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7229/7241] kernel/sched/rt.c:1709:45:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202412152325.mCic7lOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: eb7630f95f837de97eee0f6e1fb9c2f96fc90742 [7229/7241] ANDROID: sched: Push execution and scheduler context split into deadline and rt
config: i386-randconfig-061-20241215 (https://download.01.org/0day-ci/archive/20241215/202412152325.mCic7lOV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152325.mCic7lOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152325.mCic7lOV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:854:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:854:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:854:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2453:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:534:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:534:55: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:534:55: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1001:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1001:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1001:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1578:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1578:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1578:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1963:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1963:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1963:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1629:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1629:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1629:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1630:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1630:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1630:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/rt.c:1709:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1709:45: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:1709:45: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/rt.c:1709:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1709:56: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:1709:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1756:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1756:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1756:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1776:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1776:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1776:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2132:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2132:40: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:2132:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2132:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2132:51: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:2132:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2155:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2155:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2155:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2504:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2504:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2504:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2506:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2506:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2506:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2506:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2506:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2506:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/pelt.c:498:5: sparse: sparse: symbol 'sched_pelt_multiplier' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2706:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2706:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2706:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2716:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2716:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2716:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2822:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2822:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2822:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2345:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2345:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2345:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2356:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2356:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2356:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2567:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2567:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2567:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2229:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2229:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2229:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2230:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2230:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2230:15: sparse:     got struct task_struct [noderef] __rcu *
>> kernel/sched/deadline.c:2306:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2306:43: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/deadline.c:2306:43: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/deadline.c:2306:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2306:54: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/deadline.c:2306:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2867:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2867:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2867:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2869:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2869:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2869:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2871:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2871:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2871:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3046:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3046:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3046:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3095:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:210:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:210:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:258:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:258:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:258:48: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/sched/topology.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1353:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1801:15: sparse: sparse: dereference of noderef expression

vim +1709 kernel/sched/rt.c

  1700	
  1701	static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
  1702	{
  1703		struct task_struct *exec_ctx = p;
  1704		/*
  1705		 * Current can't be migrated, useless to reschedule,
  1706		 * let's hope p can move out.
  1707		 */
  1708		if (rq->curr->nr_cpus_allowed == 1 ||
> 1709		    !cpupri_find(&rq->rd->cpupri, rq->donor, rq->curr, NULL))
  1710			return;
  1711	
  1712		/*
  1713		 * p is migratable, so let's not schedule it and
  1714		 * see if it is pushed or pulled somewhere else.
  1715		 */
  1716		if (p->nr_cpus_allowed != 1 &&
  1717		    cpupri_find(&rq->rd->cpupri, p, exec_ctx, NULL))
  1718			return;
  1719	
  1720		/*
  1721		 * There appear to be other CPUs that can accept
  1722		 * the current task but none can run 'p', so lets reschedule
  1723		 * to try and push the current task away:
  1724		 */
  1725		requeue_task_rt(rq, p, 1);
  1726		resched_curr(rq);
  1727	}
  1728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
