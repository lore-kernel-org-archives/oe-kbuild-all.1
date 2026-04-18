Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87100282F30
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776536378; cv=none; b=SQIENZDAJ7sGBraAK3XsgjR5PayC6N6w1PWRwLurf6ImrCQlWPlw5PPhv4S5D46FrUbLAZWbMAiieq6bYw+rGpMTWFdgDz+5fPX7nw+fNwwP/zwExB/tTEQ1nJDxGVPrFFaGgcj6edfbNfBdxImN8epghGARtLBMtPZxz3MxH3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776536378; c=relaxed/simple;
	bh=k6CkE7nL00F61mLXm6Jnpn43n+ynO8LUL0r9tfwSrjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=USdEDESE4hWZwDKJf/rnsH8CcN/ckav4VEvSA+WEXYvOzzHQwoHoiz1pOfhpKXLGsWC7St7K7YmniarDRrR7mhG8zQRmA4bMUemLSvwQZPYI/Xau82N4yKt1ePIKWU1r1bt35yb+zgt9zmilJU+KYKBsZaGCYAwwaYtw9LOP0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KACHUN89; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KACHUN89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776536375; x=1808072375;
  h=date:from:to:cc:subject:message-id;
  bh=k6CkE7nL00F61mLXm6Jnpn43n+ynO8LUL0r9tfwSrjU=;
  b=KACHUN89LJq0yrxmaHmVDCo5YpNyuJ9fmuBEf+o6I3VROglQ1XuJRhAw
   CPFaZFCLVZFUrBi6pTnGsb7ffySQiB3kb2WxepPI0MzxtY3rAlsRBpdp0
   nU84lr/N+gm1RK0f9yoFD9QTBA0NWp8u/OMcS0PZyhB0kRv3tzCJofrsH
   d63YPvZH8K6RuTiRN3z8uypftJ8nkN/amY/1huM9cVdot0Vpgtg8KL1UZ
   wJ+OvycmmZQCnRju62+Ge6gzHbj2090JhB3GrIVIhY/GXaDC0CbcAFSdd
   Vg9GyXohfnDGL44Bi2fQpGdkkqaqLJoFhDwjIwZEfbxtCIg3ESic9GTR6
   A==;
X-CSE-ConnectionGUID: YGuBiOYNTqaoFgQWUVRgvg==
X-CSE-MsgGUID: CKAkFGMKSUuamdbe0/1M+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77589497"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="77589497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 11:19:34 -0700
X-CSE-ConnectionGUID: hbgJgTHRQ2S1n3BfFnNhvA==
X-CSE-MsgGUID: gvPr13T+QZasTGvePQWe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="226667510"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2026 11:19:33 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEAGQ-000000001Q0-0Md3;
	Sat, 18 Apr 2026 18:19:30 +0000
Date: Sun, 19 Apr 2026 02:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8]
 kernel/sched/ext.c:3903:49: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202604190214.kUM7qFEU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ebdb82c03e6adc63d7eaf683c5e5555b49d6a3bc
commit: 14c1da3895a116f4e32c20487046655f26d3999b [8/8] sched_ext: Allocate scx_kick_cpus_pnt_seqs lazily using kvzalloc()
config: arm-randconfig-r112-20260418 (https://download.01.org/0day-ci/archive/20260419/202604190214.kUM7qFEU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190214.kUM7qFEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 14c1da3895a1 ("sched_ext: Allocate scx_kick_cpus_pnt_seqs lazily using kvzalloc()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190214.kUM7qFEU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/deadline.c:2510:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2510:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2510:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2178:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2178:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2178:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2179:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2179:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2179:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2254:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2254:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2254:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2835:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2835:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2835:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2837:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2837:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2837:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2839:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2839:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2839:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3033:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3033:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3033:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3079:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:2207:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:872:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1010:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1010:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1010:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1218:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1218:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1218:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1336:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1336:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1336:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1383:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1383:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1383:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1432:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1432:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1432:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1476:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1476:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1476:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1477:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1477:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1477:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:1487:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1487:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1487:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1488:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1488:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1488:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2042:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2042:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2042:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2221:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2221:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2221:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2277:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2277:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2277:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2324:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2324:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2324:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2373:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2373:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2373:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2485:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2485:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2485:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2546:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2546:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2546:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2565:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2565:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2565:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2687:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2687:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2687:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2766:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2766:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2766:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2819:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2819:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2819:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2847:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2847:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2847:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2860:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2860:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2860:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2990:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2990:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2990:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3006:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3006:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3006:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
>> kernel/sched/ext.c:3903:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:3903:49: sparse:     expected struct scx_kick_pseqs **pseqs
   kernel/sched/ext.c:3903:49: sparse:     got struct scx_kick_pseqs [noderef] __rcu **
   kernel/sched/ext.c:3906:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3906:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3906:27: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:3906:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3906:27: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:3906:27: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4189:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4232:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4343:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4420:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_pseqs **pseqs @@     got struct scx_kick_pseqs [noderef] __rcu ** @@
   kernel/sched/ext.c:4423:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4423:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4423:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:4432:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4432:17: sparse:    struct scx_kick_pseqs [noderef] __rcu *
   kernel/sched/ext.c:4432:17: sparse:    struct scx_kick_pseqs *
   kernel/sched/ext.c:5121:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5238:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5503:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6404:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6404:15: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext.c:6404:15: sparse:    struct scx_sched *
   kernel/sched/ext.c:6499:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6499:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6499:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):

vim +3903 kernel/sched/ext.c

  3897	
  3898	static void free_kick_pseqs(void)
  3899	{
  3900		int cpu;
  3901	
  3902		for_each_possible_cpu(cpu) {
> 3903			struct scx_kick_pseqs **pseqs = per_cpu_ptr(&scx_kick_pseqs, cpu);
  3904			struct scx_kick_pseqs *to_free;
  3905	
  3906			to_free = rcu_replace_pointer(*pseqs, NULL, true);
  3907			if (to_free)
  3908				call_rcu(&to_free->rcu, free_kick_pseqs_rcu);
  3909		}
  3910	}
  3911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
