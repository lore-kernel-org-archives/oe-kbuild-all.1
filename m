Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD81F4289
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730152652; cv=none; b=gJYzNHtdlFnNpMiM86rvLwiOhF8mWyRZJ2cP4hl+UUl84kmoKg0TtCf31x9x1/XCbTenbgJrt4Rko4KkEeqj4L39XH4Pg4SeRUhkx4YNz/UEWuLq1iN8Ak/+iQm8KJxjaGQe8qK8Ii1oGJ2UE5sMg2rydDJ9BWVIMzIerptQGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730152652; c=relaxed/simple;
	bh=OLxHCpDCMDZjyFYyaixlKrSnPnxCAHoGhH3TOznezUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pK0k5ops9Udf3TihGhAL+bUR+H+2x0aBLo/NqKFXLbVv3TNW8CLKF6abR8jFXMKtCVqEg+vztIcv1DpP7oVws2vzlqbDf3U2JDhZIkVFTq+l3N3v0PvezD1dh+8iVNT1HsQyx2sbxxEgEaryu4rsMf3MGUmtlrP47E0UYXBVJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6rFoDoK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6rFoDoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730152650; x=1761688650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OLxHCpDCMDZjyFYyaixlKrSnPnxCAHoGhH3TOznezUA=;
  b=H6rFoDoKN5/TYFL4NHCSr2fbiTPuPLARfNkjz5y5uUf4yVsQy41sA+2a
   1AXOwzl4QAB76gFZQeRY719cPD/O71dYVy/3ELLvun9G4eux/hmi8U3MD
   fP0rzgOL3U4pd3dM4BNo6PQC4dPkfHg06ktIwtQ2F4NnDCBx9BtKWsfYR
   hJkSSvbBi96ZV47e2IlN1YxVeFR1ElX3aV3HWXB3bKhV43GbZCw9y4LP0
   d3Zp5bXZwqpw81clRbG7eIKrxuv/HnTUYpNEpN727FZhRzrd0934PwwSd
   ljD4R8YHrgcOo/BdZfZEtoUqYGtuo0Kk4OxIJj78Tb8utaSZtRkIIEKvN
   w==;
X-CSE-ConnectionGUID: qjyTbGHURhmAuGOMrrbU+Q==
X-CSE-MsgGUID: HSfGqVXfQ2++8GqO1R/1HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29955443"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29955443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 14:57:30 -0700
X-CSE-ConnectionGUID: LToZ9L4qRT6biO2wBWqOrg==
X-CSE-MsgGUID: NyO0MeJMRxmC39XE+tLJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86885716"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2024 14:57:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Xjn-000cvQ-21;
	Mon, 28 Oct 2024 21:57:23 +0000
Date: Tue, 29 Oct 2024 05:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5480/13046] kernel/sched/ext.c:89:25: sparse:
 sparse: symbol 'scx_has_op' was not declared. Should it be static?
Message-ID: <202410290513.gEbODxkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: f753802055302b65e113345663c62fa6809df669 [5480/13046] rue/scx/sched_ext: Implement BPF extensible scheduler class
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290513.gEbODxkg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290513.gEbODxkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290513.gEbODxkg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:965:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:965:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:965:70: sparse:    struct task_struct *
   kernel/sched/rt.c:581:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:581:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:581:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1051:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1051:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1051:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1596:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1596:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1596:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:1945:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1945:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1945:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1177:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1177:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1177:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1300:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1300:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1300:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2651:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2651:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2651:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext.c:89:25: sparse: sparse: symbol 'scx_has_op' was not declared. Should it be static?
   kernel/sched/ext.c:456:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:805:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:815:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:1399:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext.c:2489:31: sparse: sparse: symbol 'bpf_scx_verifier_ops' was not declared. Should it be static?
   kernel/sched/ext.c:3083:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:3083:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:3083:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2215:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2215:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2215:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2215:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2215:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2215:25: sparse:    struct task_struct *

vim +/scx_has_op +89 kernel/sched/ext.c

    88	
  > 89	struct static_key_false scx_has_op[SCX_NR_ONLINE_OPS] =
    90		{ [0 ... SCX_NR_ONLINE_OPS-1] = STATIC_KEY_FALSE_INIT };
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
