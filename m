Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B71361
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708824013; cv=none; b=eVEKd2DClr118ZZ4uofSxwO8pjU7uLsPA/2T/LPn+MefblBoKraaroLC1Envx93Gjoy1gIpnhTyWHHnv2rR2k56lvIH5vqSB/zceP5UPTHn9CjvM2+oN8I5wBEU9kWlpxOFiAWYJPEWdOWJoydcOws9JB/StZchsYbq9susqzTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708824013; c=relaxed/simple;
	bh=OB+FSxcj0rslAH1HmiEpe+5c+qzymutrtE6qFub/khA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8CWb30LjJkAg0xwOn5tZqIismJkMsFQMjV64UdilTKPWOlNLyl41JXVD4ZFZd2izX8BcQclEq2Cfso/ex0Of5P/gxpR/AybOzoLaNHxjaXWyF1zx7zdCI+hwajGFxqoWK4pF9A161bCawezv7b23cMgU1IbEIu74Xch+z5/NEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw9Frbet; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw9Frbet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708824011; x=1740360011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OB+FSxcj0rslAH1HmiEpe+5c+qzymutrtE6qFub/khA=;
  b=Kw9FrbetTTDOZtUxsotgX7NAEWXn0q0NxR4mOm1PV+M+sfEWK/D1IRXk
   lBJo8nPGkC7BZAxAhBHPK4lkcT5FO+0eBMVjuEMQljjop+C9g4FFdteYs
   yLI/c+HVQfmi4gf7a6bOSq87n/sOEbydz8fd2kjnpC7mypT2dRMTWQ4EX
   r4AmcDhm3GgfikrwP1J+ditYPNvnDJvG14O2G7tU7FuFlWzyaEYOawAr2
   uItFl96xvx9/OyrfQk7eQF42MUrr1EChLLKnPXyptndmPIkKqKpUi7/xs
   wVQ//6zGadP+oK9gC9rPJQjWjeVCesjdf/4yaYbG6w6d8KtkLpd66kc82
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3005968"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="3005968"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 17:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6175270"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2024 17:20:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re3BW-00095c-0F;
	Sun, 25 Feb 2024 01:20:06 +0000
Date: Sun, 25 Feb 2024 09:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 11/88] kernel/sched/core.c:90:1: sparse:
 sparse: symbol '__pcpu_scope_pv_sched' was not declared. Should it be
 static?
Message-ID: <202402250925.PD78v2HS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   d7ab448d89bd5d3326425d135ea793c6351ebc05
commit: eeda0d41945da6772305c0cef2d4158c3fab07f7 [11/88] CHROMIUM: sched/core: boost/unboost in guest scheduler
config: x86_64-randconfig-r111-20240225 (https://download.01.org/0day-ci/archive/20240225/202402250925.PD78v2HS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250925.PD78v2HS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250925.PD78v2HS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:90:1: sparse: sparse: symbol '__pcpu_scope_pv_sched' was not declared. Should it be static?
   kernel/sched/core.c:791:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:791:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:791:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1044:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1044:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1044:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1102:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:1102:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:1102:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2212:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2212:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2212:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2212:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2212:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2212:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3642:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3642:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3642:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3850:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3850:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3850:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9099:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9099:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9099:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5407:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5407:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5407:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6408:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6408:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6408:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7040:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7040:17: sparse:    struct task_struct *
   kernel/sched/core.c:7040:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7244:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7244:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7244:22: sparse:    struct task_struct *
   kernel/sched/core.c:11126:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11126:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11126:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1321:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:548:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1321:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:581:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:597:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:635:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:676:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:78:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:78:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:78:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:791:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2203:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2204:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2205:37: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/core.c:2178:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2178:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2178:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2064:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2064:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2229:9: sparse:    struct task_struct *

vim +/__pcpu_scope_pv_sched +90 kernel/sched/core.c

    89	
  > 90	DEFINE_PER_CPU_DECRYPTED(struct pv_sched_data, pv_sched) __aligned(64);
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
