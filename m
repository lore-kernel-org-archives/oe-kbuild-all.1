Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46323D7DF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786177102; cv=none; b=hSSsAVUGC24t0DiCQtal6w+7RAh5BeVK2QZ4RdpVx2Ypv0sEo9EPlM2qBtdjLscQUy8OEJg+9/iBpo8Nz5yiGsAQvWzKc5UEEK3PGZdkI7HkaEDWi2Oe4PtiBoYIPnmUwVHEZyic5WQbjKMYFtw+GKdCSVLm+LZYY6p2pv0DHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786177102; c=relaxed/simple;
	bh=aOLMl7FrqCLgN7TR5XJBsXtLaXtMWMz6OtclMtJxsd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=naKtjHitcFNBpvXUYLhp2tkG+tXIIKoAO1PmSMCE+7276JVbiU9vsGafrXVuuebsSYzKrpA3N9t1PUQwHrzcdR/OYhGV+HDKFath/kzSYcb7FYCvbQEWhAUjWhgn1J1LETEHy3KPosYXANFgxR258zmnQAuj3j8T3TTxf36b9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbkeozbN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbkeozbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786177100; x=1817713100;
  h=date:from:to:cc:subject:message-id;
  bh=aOLMl7FrqCLgN7TR5XJBsXtLaXtMWMz6OtclMtJxsd8=;
  b=KbkeozbNKmSmu/dfZAJocreQRtk5aG5NeDQuhrCS0X2JTSPBesVSUrzg
   PMoFyEFx7ezhKxQxVXhfhQ3hZv/cr92J72uAyw7l45zs4747jm50B2asg
   /thAGIu6Ffn49WU+Gf5x/BOy5fPAvIIzMn/DdZ966Wkt7C1LF8ERbcVRt
   1qLkULWg70K3ZqL7lBvcGAylbnAeIL+OWrT0DTxV5fOmJccMDiiTDfUS7
   Q9UyxiMmr5TaJhu/pzOgavxLYYKA8pMWFOmx+QxP0gy/Fsp6zZVWvdtPu
   kAwjp0ARbwN22pQunYOzEzztglS1gTeJmh6YhYZq6eafknCIFRr7hghxe
   Q==;
X-CSE-ConnectionGUID: /hA4bHQSQQ25fnZ6JFt3qA==
X-CSE-MsgGUID: LEjyGf7+Tdiov/9ufnE6tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97126785"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="97126785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 01:18:19 -0700
X-CSE-ConnectionGUID: wUiraSCIRRu5kQKpZbQjWA==
X-CSE-MsgGUID: IwOiM6yNTNicielMAC7Wxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="263215580"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2026 01:18:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wscFz-00000000K05-2xwe;
	Sat, 08 Aug 2026 08:18:15 +0000
Date: Sat, 08 Aug 2026 16:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/4]
 kernel/sched/core.c:9042:32: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202608081609.sRrwUdLJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   60949a88a3e36b3c09bd5959c248f25295ab9989
commit: a8a8087e465a4a6370c96cec61c4da0e868abb64 [0/4] Merge 2cbf335f8ccc ("Merge tag 'sched-core-2026-06-14' of gitolite.kernel.org:pub/scm/linux/kernel/git/tip/tip") into android-mainline
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20260808/202608081609.sRrwUdLJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081609.sRrwUdLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081609.sRrwUdLJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:6569:23: sparse:    struct task_struct *
   kernel/sched/core.c:6577:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6577:46: sparse:    struct task_struct *
   kernel/sched/core.c:6577:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6635:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6635:9: sparse:     got struct rq *
   kernel/sched/core.c:6635:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6635:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6635:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:6669:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6669:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6669:25: sparse:     got struct rq *
   kernel/sched/core.c:6684:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6684:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6684:22: sparse:     got struct rq *
   kernel/sched/core.c:6696:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6696:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6696:22: sparse:     got struct rq *
   kernel/sched/core.c:6708:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6708:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6708:25: sparse:     got struct rq *
   kernel/sched/core.c:6727:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6727:27: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6727:27: sparse:     got struct rq *
   kernel/sched/core.c:6751:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6751:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6751:22: sparse:     got struct rq *
   kernel/sched/core.c:7180:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7180:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7180:14: sparse:     got struct rq *
   kernel/sched/core.c:7181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7181:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7181:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7252:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7252:52: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:7252:52: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7267:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7267:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7267:31: sparse:    struct task_struct *
   kernel/sched/core.c:7781:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7781:17: sparse:    struct task_struct *
   kernel/sched/core.c:7781:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8361:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8361:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8361:25: sparse:     got struct rq *
   kernel/sched/core.c:8525:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8525:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8525:21: sparse:     got struct rq *
   kernel/sched/core.c:8609:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8609:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8609:25: sparse:     got struct rq *
   kernel/sched/core.c:8767:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8767:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8767:25: sparse:     got struct rq *
   kernel/sched/core.c:8805:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8805:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8805:25: sparse:     got struct rq *
   kernel/sched/core.c:8866:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8866:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8866:25: sparse:     got struct rq *
   kernel/sched/core.c:8939:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8939:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8939:25: sparse:     got struct rq *
>> kernel/sched/core.c:9042:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cfs_rq [noderef] __percpu *extern [addressable] [toplevel] cfs_rq @@     got struct cfs_rq * @@
   kernel/sched/core.c:9042:32: sparse:     expected struct cfs_rq [noderef] __percpu *extern [addressable] [toplevel] cfs_rq
   kernel/sched/core.c:9042:32: sparse:     got struct cfs_rq *
   kernel/sched/core.c:9080:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9080:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9080:22: sparse:     got struct rq *
   kernel/sched/core.c:10738:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:10738:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:10738:25: sparse:     got struct rq *
   kernel/sched/core.c:10738:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10738:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10738:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:11331:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11331:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11331:25: sparse:     got struct rq *
   kernel/sched/core.c:11378:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11378:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11378:25: sparse:     got struct rq *
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:109:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:109:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:109:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:927:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2468:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2468:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2468:25: sparse:    struct task_struct *
   kernel/sched/core.c:2316:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2316:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2316:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:1432:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1432:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1432:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2781:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1432:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1432:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1432:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2479:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2479:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2758:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2758:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2758:9: sparse:    struct task_struct *

vim +9042 kernel/sched/core.c

c3a340f7e7eada kernel/sched/core.c Steven Rostedt (VMware  2019-12-19  9038) 
5822a454d6d222 kernel/sched/core.c Ingo Molnar             2017-03-05  9039  	wait_bit_init();
9dcb8b685fc308 kernel/sched/core.c Linus Torvalds          2016-10-26  9040  
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9041  #ifdef CONFIG_FAIR_GROUP_SCHED
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22 @9042  	root_task_group.cfs_rq = &runqueues.cfs;
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9043  
b1d1779e5ef7a6 kernel/sched/core.c Wei Yang                2020-04-23  9044  	root_task_group.shares = ROOT_TASK_GROUP_LOAD;
c98c18270be115 kernel/sched/core.c Phil Auld               2023-07-14  9045  	init_cfs_bandwidth(&root_task_group.cfs_bandwidth, NULL);
6d6bc0ad867c46 kernel/sched.c      Dhaval Giani            2008-05-30  9046  #endif /* CONFIG_FAIR_GROUP_SCHED */
8195136669661f kernel/sched/core.c Tejun Heo               2024-09-04  9047  #ifdef CONFIG_EXT_GROUP_SCHED
33796b91871ad4 kernel/sched/core.c Tejun Heo               2025-06-16  9048  	scx_tg_init(&root_task_group);
8195136669661f kernel/sched/core.c Tejun Heo               2024-09-04  9049  #endif /* CONFIG_EXT_GROUP_SCHED */
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9050  #ifdef CONFIG_RT_GROUP_SCHED
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22  9051  	ptr += 2 * nr_cpu_ids * sizeof(void **);
b8fea7af0e40fe kernel/sched/core.c Zecheng Li              2026-05-22  9052  	ptr = (unsigned long)kzalloc(ptr, GFP_NOWAIT);
07e06b011db2b3 kernel/sched.c      Yong Zhang              2011-01-07  9053  	root_task_group.rt_se = (struct sched_rt_entity **)ptr;
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9054  	ptr += nr_cpu_ids * sizeof(void **);
434d53b00d6bb7 kernel/sched.c      Mike Travis             2008-04-04  9055  
07e06b011db2b3 kernel/sched.c      Yong Zhang              2011-01-07  9056  	root_task_group.rt_rq = (struct rt_rq **)ptr;
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9057  	ptr += nr_cpu_ids * sizeof(void **);
eff766a65c6023 kernel/sched.c      Peter Zijlstra          2008-04-19  9058  

:::::: The code at line 9042 was first introduced by commit
:::::: b8fea7af0e40feb6d9cbbd60b66ff0ec265e868f sched/fair: Allocate cfs_tg_state with percpu allocator

:::::: TO: Zecheng Li <zecheng@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
