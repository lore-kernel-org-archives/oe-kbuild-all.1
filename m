Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAE1487D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734270708; cv=none; b=NbW/S6TcOgXsfuTPPFOAx0Nyb+i6WfAcDTZOC+PDXnwpwSsxHe57//Zl0/Z0fvc3UJQO6D3FMWFpjgFoXzuahzXDIQz9ESSOGW4k1i70uAsrJnlqQ3jUo+yMmz6ZVpcSjpftcIfvhUay9X0pnX2L/6PahReym1zQFd8TBurm3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734270708; c=relaxed/simple;
	bh=DU1QupEhcZGcULEx/LbPXPeydAudv4vr6rFm0aKHbdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mkLzcynx1yWgEXC9d/OskOeI9rmvuA3qVcIJo1dAZZdlZr+YTj58VOqTRebNxagLAOeHIhLOY22KPWx4k2zQYdyWavSpJ/l5pV+PP0/eiqHegMNyjdnud+2tL1i1YJdTGm+oO5dHjXFRNXINJcyhlcvKnjduehbnh4VhWhxwqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJEuVK0R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJEuVK0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734270705; x=1765806705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DU1QupEhcZGcULEx/LbPXPeydAudv4vr6rFm0aKHbdQ=;
  b=CJEuVK0RNCxztJ73XHYcG5WF3knn+5NzGAP6wciCzI9FlT+hThlkCNhG
   NCvf/FQXDh1auyJgKrSZKpwLTmttYmD/b9KagHknaxig0CeHQywG2ilku
   yck8bkLY3g6xOOC/UVTW7xs/+QpGJ3Ro/kyMtdomgRa47zP9xToJAZ9pV
   gFnmw7+LsbGxMQtqo+hSvEF9yYrQaiU7Rr5xrBBOLZqVxsZeISGn5fFBS
   i/E/EreD5v4BG/YHpEoQ+iSTrVbTretS94ZA9B/gyWfVFflvEomGgJR1y
   v6T8wZQXO8me6kXDfLnVf4CGASiocrVjGhDyao+dhglmghVsI0fiBNMPr
   w==;
X-CSE-ConnectionGUID: ldHWy3hNQhq8Zz8RNz/IzQ==
X-CSE-MsgGUID: xI5TvwoHRseTamvvTqgCWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46061191"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46061191"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 05:51:43 -0800
X-CSE-ConnectionGUID: XazEFIm/T1+bGE3Yd9VbGw==
X-CSE-MsgGUID: MP+DkrI0R4CDSRiN0jKTDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="101991420"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 05:51:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMp23-000De0-2D;
	Sun, 15 Dec 2024 13:51:39 +0000
Date: Sun, 15 Dec 2024 21:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7228/7241]
 kernel/sched/core.c:7514:45: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202412152133.VWn8pgXm-lkp@intel.com>
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
commit: 6d7a9ac0d5ae138d1457c4c0efd7bc1572289a94 [7228/7241] ANDROID: sched: Add trace events for proxy execution
config: i386-randconfig-061-20241215 (https://download.01.org/0day-ci/archive/20241215/202412152133.VWn8pgXm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152133.VWn8pgXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152133.VWn8pgXm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:6019:25: sparse:     got struct rq *
   kernel/sched/core.c:6032:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6032:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:6032:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6597:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6597:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6597:24: sparse:     got struct rq *
   kernel/sched/core.c:6621:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6621:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6621:24: sparse:     got struct rq *
   kernel/sched/core.c:6667:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6667:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6667:24: sparse:     got struct rq *
   kernel/sched/core.c:6701:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6701:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6701:32: sparse:    struct task_struct *
   kernel/sched/core.c:6720:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6720:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6720:26: sparse:     got struct rq *
   kernel/sched/core.c:6720:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6720:47: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6720:47: sparse:     got struct rq *
   kernel/sched/core.c:6732:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6732:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6732:23: sparse:    struct task_struct *
   kernel/sched/core.c:6740:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6740:46: sparse:    struct task_struct *
   kernel/sched/core.c:6740:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6797:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6797:9: sparse:     got struct rq *
   kernel/sched/core.c:6797:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6797:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6797:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:6831:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6831:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6831:25: sparse:     got struct rq *
   kernel/sched/core.c:6846:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6846:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6846:22: sparse:     got struct rq *
   kernel/sched/core.c:6858:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6858:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6858:22: sparse:     got struct rq *
   kernel/sched/core.c:6870:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6870:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6870:25: sparse:     got struct rq *
   kernel/sched/core.c:6889:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6889:27: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6889:27: sparse:     got struct rq *
   kernel/sched/core.c:6913:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6913:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6913:22: sparse:     got struct rq *
   kernel/sched/core.c:7439:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7439:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7439:14: sparse:     got struct rq *
   kernel/sched/core.c:7440:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7440:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7440:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7501:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7501:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7501:37: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/core.c:7514:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7514:45: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7514:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:8014:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:8014:17: sparse:    struct task_struct *
   kernel/sched/core.c:8014:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8562:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8562:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8562:25: sparse:     got struct rq *
   kernel/sched/core.c:8720:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8720:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8720:9: sparse:     got struct rq *
   kernel/sched/core.c:8733:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8733:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8733:25: sparse:     got struct rq *
   kernel/sched/core.c:8742:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8742:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8742:13: sparse:     got struct rq *
   kernel/sched/core.c:8828:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8828:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8828:25: sparse:     got struct rq *
   kernel/sched/core.c:8849:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8849:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8849:25: sparse:     got struct rq *
   kernel/sched/core.c:8995:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8995:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8995:25: sparse:     got struct rq *
   kernel/sched/core.c:9033:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9033:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9033:25: sparse:     got struct rq *
   kernel/sched/core.c:9096:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9096:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9096:25: sparse:     got struct rq *
   kernel/sched/core.c:9168:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9168:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9168:25: sparse:     got struct rq *
   kernel/sched/core.c:9323:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9323:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9323:22: sparse:     got struct rq *
   kernel/sched/core.c:10920:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:10920:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:10920:25: sparse:     got struct rq *
   kernel/sched/core.c:10920:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10920:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10920:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/core.c:410:9: sparse: sparse: context imbalance in 'sched_core_lock' - different lock contexts for basic block
   kernel/sched/core.c:420:17: sparse: sparse: context imbalance in 'sched_core_unlock' - unexpected unlock
   kernel/sched/core.c:628:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:654:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:678:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1407:30: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1407:30: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:106:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:106:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:106:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:878:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2289:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/core.c:2171:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2171:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2171:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):

vim +7514 kernel/sched/core.c

  7381	
  7382	/*
  7383	 * __schedule() is the main scheduler function.
  7384	 *
  7385	 * The main means of driving the scheduler and thus entering this function are:
  7386	 *
  7387	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  7388	 *
  7389	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  7390	 *      paths. For example, see arch/x86/entry_64.S.
  7391	 *
  7392	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  7393	 *      interrupt handler sched_tick().
  7394	 *
  7395	 *   3. Wakeups don't really cause entry into schedule(). They add a
  7396	 *      task to the run-queue and that's it.
  7397	 *
  7398	 *      Now, if the new task added to the run-queue preempts the current
  7399	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  7400	 *      called on the nearest possible occasion:
  7401	 *
  7402	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  7403	 *
  7404	 *         - in syscall or exception context, at the next outmost
  7405	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  7406	 *           spin_unlock()!)
  7407	 *
  7408	 *         - in IRQ context, return from interrupt-handler to
  7409	 *           preemptible context
  7410	 *
  7411	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  7412	 *         then at the next:
  7413	 *
  7414	 *          - cond_resched() call
  7415	 *          - explicit schedule() call
  7416	 *          - return from syscall or exception to user-space
  7417	 *          - return from interrupt-handler to user-space
  7418	 *
  7419	 * WARNING: must be called with preemption disabled!
  7420	 */
  7421	static void __sched notrace __schedule(int sched_mode)
  7422	{
  7423		struct task_struct *prev, *next;
  7424		/*
  7425		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  7426		 * as a preemption by schedule_debug() and RCU.
  7427		 */
  7428		bool preempt = sched_mode > SM_NONE;
  7429		bool block = false;
  7430		unsigned long *switch_count;
  7431		unsigned long prev_state;
  7432		struct rq_flags rf;
  7433		struct rq *rq;
  7434		bool prev_not_proxied;
  7435		int cpu;
  7436		bool preserve_need_resched = false;
  7437	
  7438		cpu = smp_processor_id();
  7439		rq = cpu_rq(cpu);
  7440		prev = rq->curr;
  7441	
  7442		schedule_debug(prev, preempt);
  7443	
  7444		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  7445			hrtick_clear(rq);
  7446	
  7447		local_irq_disable();
  7448		rcu_note_context_switch(preempt);
  7449	
  7450		/*
  7451		 * Make sure that signal_pending_state()->signal_pending() below
  7452		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  7453		 * done by the caller to avoid the race with signal_wake_up():
  7454		 *
  7455		 * __set_current_state(@state)		signal_wake_up()
  7456		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  7457		 *					  wake_up_state(p, state)
  7458		 *   LOCK rq->lock			    LOCK p->pi_state
  7459		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  7460		 *     if (signal_pending_state())	    if (p->state & @state)
  7461		 *
  7462		 * Also, the membarrier system call requires a full memory barrier
  7463		 * after coming from user-space, before storing to rq->curr; this
  7464		 * barrier matches a full barrier in the proximity of the membarrier
  7465		 * system call exit.
  7466		 */
  7467		rq_lock(rq, &rf);
  7468		smp_mb__after_spinlock();
  7469	
  7470		/* Promote REQ to ACT */
  7471		rq->clock_update_flags <<= 1;
  7472		update_rq_clock(rq);
  7473		rq->clock_update_flags = RQCF_UPDATED;
  7474	
  7475		switch_count = &prev->nivcsw;
  7476	
  7477		/* Task state changes only considers SM_PREEMPT as preemption */
  7478		preempt = sched_mode == SM_PREEMPT;
  7479	
  7480		/*
  7481		 * We must load prev->state once (task_struct::state is volatile), such
  7482		 * that we form a control dependency vs deactivate_task() below.
  7483		 */
  7484		prev_state = READ_ONCE(prev->__state);
  7485		if (sched_mode == SM_IDLE) {
  7486			/* SCX must consult the BPF scheduler to tell if rq is empty */
  7487			if (!rq->nr_running && !scx_enabled()) {
  7488				next = prev;
  7489				goto picked;
  7490			}
  7491		} else if (!preempt && prev_state) {
  7492			block = try_to_block_task(rq, prev, prev_state,
  7493						  !task_is_blocked(prev));
  7494			switch_count = &prev->nvcsw;
  7495		}
  7496	
  7497		prev_not_proxied = !prev->blocked_donor;
  7498	
  7499		trace_sched_start_task_selection(prev, cpu, task_is_blocked(prev));
  7500	pick_again:
  7501		next = pick_next_task(rq, rq->donor, &rf);
  7502		rq_set_donor(rq, next);
  7503		next->blocked_donor = NULL;
  7504		if (unlikely(task_is_blocked(next))) {
  7505			next = find_proxy_task(rq, next, &rf);
  7506			if (!next) {
  7507				/* zap the balance_callbacks before picking again */
  7508				zap_balance_callbacks(rq);
  7509				goto pick_again;
  7510			}
  7511			if (next == rq->idle)
  7512				preserve_need_resched = true;
  7513		}
> 7514		trace_sched_finish_task_selection(rq->donor, next, cpu);
  7515	picked:
  7516		if (!preserve_need_resched)
  7517			clear_tsk_need_resched(prev);
  7518		clear_preempt_need_resched();
  7519	#ifdef CONFIG_SCHED_DEBUG
  7520		rq->last_seen_need_resched_ns = 0;
  7521	#endif
  7522	
  7523		trace_android_rvh_schedule(prev, next, rq);
  7524		if (likely(prev != next)) {
  7525			rq->nr_switches++;
  7526			/*
  7527			 * RCU users of rcu_dereference(rq->curr) may not see
  7528			 * changes to task_struct made by pick_next_task().
  7529			 */
  7530			RCU_INIT_POINTER(rq->curr, next);
  7531	
  7532			if (!task_current_donor(rq, next))
  7533				proxy_tag_curr(rq, next);
  7534	
  7535			/*
  7536			 * The membarrier system call requires each architecture
  7537			 * to have a full memory barrier after updating
  7538			 * rq->curr, before returning to user-space.
  7539			 *
  7540			 * Here are the schemes providing that barrier on the
  7541			 * various architectures:
  7542			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  7543			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  7544			 *   on PowerPC and on RISC-V.
  7545			 * - finish_lock_switch() for weakly-ordered
  7546			 *   architectures where spin_unlock is a full barrier,
  7547			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  7548			 *   is a RELEASE barrier),
  7549			 *
  7550			 * The barrier matches a full barrier in the proximity of
  7551			 * the membarrier system call entry.
  7552			 *
  7553			 * On RISC-V, this barrier pairing is also needed for the
  7554			 * SYNC_CORE command when switching between processes, cf.
  7555			 * the inline comments in membarrier_arch_switch_mm().
  7556			 */
  7557			++*switch_count;
  7558	
  7559			migrate_disable_switch(rq, prev);
  7560			psi_account_irqtime(rq, prev, next);
  7561			psi_sched_switch(prev, next, block);
  7562	
  7563			trace_sched_switch(preempt, prev, next, prev_state);
  7564	
  7565			/* Also unlocks the rq: */
  7566			rq = context_switch(rq, prev, next, &rf);
  7567		} else {
  7568			/* In case next was already curr but just got blocked_donor */
  7569			if (prev_not_proxied && next->blocked_donor)
  7570				proxy_tag_curr(rq, next);
  7571	
  7572			rq_unpin_lock(rq, &rf);
  7573			__balance_callbacks(rq);
  7574			raw_spin_rq_unlock_irq(rq);
  7575		}
  7576	}
  7577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
