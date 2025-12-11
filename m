Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA1286D7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430382; cv=none; b=BjhnaVIrN8KJXCTm+uE6tZPyS9zsXPP2lJXZkXkXhIhnNWtFnEmQso07c7upbAa2WoOtg72PIMapLbs4jPQ92ltxOde8LQIWCA0RmKxbJTHpV+414chCG+x/qpYl8DZaxwd0egT4ymMx8G6g69B1NsA1l2xy47ShKyxv5f5L7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430382; c=relaxed/simple;
	bh=eiqICVoJIvt/IzcZ7gxL+Nz6QVK6fdFMKknXbJEyZN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAQ+H7sLb5FAmM82Plc76QYcwJw5TEp40jJ08+i2ITCwIUtyytyIn49U613m8/Eq0rcxbKaYOKNyGFAmsHEi1JaXL/QzNSjm03S+rmNqJ9GsSauCSZT15gs8tgyuX+cKcQ2ADlsUycoVNcCigMgh2LxE26Ng46EOWBHvstU8OqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6TKaCKi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6TKaCKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765430380; x=1796966380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eiqICVoJIvt/IzcZ7gxL+Nz6QVK6fdFMKknXbJEyZN0=;
  b=i6TKaCKiicLZKC3NrVHtVO8jsQFUQVwz3o0YH+d9C124Cx/+h8lyiAXe
   8xrvTkQGz3fKJAypygfPQwi593k8MeKJ0epEc+yKQifnQEaBMZHrrqkrS
   HeWgnbZWoSZ9Mnq1i2yUFzwVejJsSsADbglUo9obv5rUIuDanECc82hoy
   mSnRdRavmu6l5gfRcAppRNbYBCSaMRY5vT81YskEb+ieo2WkpC62LS6tM
   8ifd+Uz2F95y5cD0wOzTPVpNk/Fe4p8mNNInOkfw1EfcA4pAV4vUJezOO
   Me17Wz89FllG9tNIXZHz/dlsiApZBiqLgcvGy+unnVxFMEJ/l9e5+d3tL
   A==;
X-CSE-ConnectionGUID: Dv4xP+ZMRT2B78oGsZAqBQ==
X-CSE-MsgGUID: fnPvmpulRE+a98BEKwWJAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67344543"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67344543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:19:39 -0800
X-CSE-ConnectionGUID: Yeo19jGPQSKTFlYSVEHDNg==
X-CSE-MsgGUID: OIJIkdCeTpGZeXS3yOLkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196307861"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 21:19:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZ5T-000000004Cn-0PZ1;
	Thu, 11 Dec 2025 05:19:35 +0000
Date: Thu, 11 Dec 2025 13:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/core.c:1191:9: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512111313.abMq47zW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   6 months ago
config: arm-randconfig-r111-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111313.abMq47zW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111313.abMq47zW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111313.abMq47zW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:848:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:848:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:848:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1091:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1091:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1091:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:1191:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1191:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1191:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2190:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2190:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2190:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2201:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2201:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2201:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3677:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3677:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3677:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3882:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3882:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3882:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5612:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5612:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5612:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6626:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6626:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6626:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7175:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7175:17: sparse:    struct task_struct *
   kernel/sched/core.c:7175:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10092:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10092:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10092:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:599:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:632:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:648:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:684:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:725:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:848:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
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
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/core.c:2154:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2154:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2154:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
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
--
   kernel/sched/fair.c:1196:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1196:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1196:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12755:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12755:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12755:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6731:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6731:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6731:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:6936:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6936:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6936:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8322:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8322:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8322:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:8526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
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
>> kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/fair.c:10562:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
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
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
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
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/debug.c:632:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:632:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:632:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:964:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:964:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:964:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:964:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:964:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/topology.c:115:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:115:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:115:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:134:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:134:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:134:60: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:157:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:157:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:157:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:468:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:468:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:468:19: sparse:     got struct perf_domain [noderef] __rcu *pd
>> kernel/sched/topology.c:638:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:638:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:638:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:723:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:723:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:723:50: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:731:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:731:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:744:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:749:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:749:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:749:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/topology.c:770:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:770:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:770:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:932:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:932:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:932:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:961:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:961:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:961:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1007:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1007:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1007:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1009:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1009:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1009:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1017:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1017:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1017:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1019:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1019:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1019:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1089:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1089:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1089:62: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/topology.c:1193:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1193:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1193:40: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/topology.c:1677:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1677:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1677:43: sparse:     got struct sched_domain *child
>> kernel/sched/topology.c:2372:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2372:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2372:31: sparse:     got struct sched_domain *sd
>> kernel/sched/topology.c:2491:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2491:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2491:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2512:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2512:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2512:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2511:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2511:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2511:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2566:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2566:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2566:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:868:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:868:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:868:70: sparse:    struct task_struct *
   kernel/sched/rt.c:548:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:548:55: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:548:55: sparse:     got struct task_struct [noderef] __rcu *donor
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
>> kernel/sched/deadline.c:2288:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
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
>> kernel/sched/deadline.c:2164:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
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

vim +1191 kernel/sched/core.c

06d8308c61e543 kernel/sched.c      Thomas Gleixner     2008-03-22  1165  
3451d0243c3cdf kernel/sched/core.c Frederic Weisbecker 2011-08-10  1166  #ifdef CONFIG_NO_HZ_COMMON
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1167  /*
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  1168   * In the semi idle case, use the nearest busy CPU for migrating timers
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  1169   * from an idle CPU.  This is good for power-savings.
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1170   *
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1171   * We don't do similar optimization for completely idle system, as
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  1172   * selecting an idle CPU will add more delays to the timers than intended
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  1173   * (as that CPU's timer base may not be up to date wrt jiffies etc).
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1174   */
bc7a34b8b9ebfb kernel/sched/core.c Thomas Gleixner     2015-05-26  1175  int get_nohz_timer_target(void)
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1176  {
e938b9c94164e4 kernel/sched/core.c Wanpeng Li          2020-01-13  1177  	int i, cpu = smp_processor_id(), default_cpu = -1;
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1178  	struct sched_domain *sd;
031e3bd8986fff kernel/sched/core.c Yuan ZhaoXiong      2021-06-06  1179  	const struct cpumask *hk_mask;
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1180  
c907cd44a108ef kernel/sched/core.c Waiman Long         2024-10-30  1181  	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE)) {
e938b9c94164e4 kernel/sched/core.c Wanpeng Li          2020-01-13  1182  		if (!idle_cpu(cpu))
6201b4d61fbf19 kernel/sched/core.c Viresh Kumar        2014-03-18  1183  			return cpu;
e938b9c94164e4 kernel/sched/core.c Wanpeng Li          2020-01-13  1184  		default_cpu = cpu;
e938b9c94164e4 kernel/sched/core.c Wanpeng Li          2020-01-13  1185  	}
6201b4d61fbf19 kernel/sched/core.c Viresh Kumar        2014-03-18  1186  
c907cd44a108ef kernel/sched/core.c Waiman Long         2024-10-30  1187  	hk_mask = housekeeping_cpumask(HK_TYPE_KERNEL_NOISE);
031e3bd8986fff kernel/sched/core.c Yuan ZhaoXiong      2021-06-06  1188  
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1189  	guard(rcu)();
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1190  
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21 @1191  	for_each_domain(cpu, sd) {
031e3bd8986fff kernel/sched/core.c Yuan ZhaoXiong      2021-06-06  1192  		for_each_cpu_and(i, sched_domain_span(sd), hk_mask) {
444969223c81c7 kernel/sched/core.c Wanpeng Li          2016-05-04  1193  			if (cpu == i)
444969223c81c7 kernel/sched/core.c Wanpeng Li          2016-05-04  1194  				continue;
444969223c81c7 kernel/sched/core.c Wanpeng Li          2016-05-04  1195  
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1196  			if (!idle_cpu(i))
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1197  				return i;
057f3fadb347e9 kernel/sched.c      Peter Zijlstra      2011-04-18  1198  		}
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1199  	}
9642d18eee2cd1 kernel/sched/core.c Vatika Harlalka     2015-09-01  1200  
e938b9c94164e4 kernel/sched/core.c Wanpeng Li          2020-01-13  1201  	if (default_cpu == -1)
c907cd44a108ef kernel/sched/core.c Waiman Long         2024-10-30  1202  		default_cpu = housekeeping_any_cpu(HK_TYPE_KERNEL_NOISE);
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1203  
7537b90c003675 kernel/sched/core.c Peter Zijlstra      2023-08-01  1204  	return default_cpu;
83cd4fe27ad844 kernel/sched.c      Venkatesh Pallipadi 2010-05-21  1205  }
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar         2017-02-01  1206  

:::::: The code at line 1191 was first introduced by commit
:::::: 83cd4fe27ad8446619b2e030b171b858501de87d sched: Change nohz idle load balancing logic to push model

:::::: TO: Venkatesh Pallipadi <venki@google.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
