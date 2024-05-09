Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3680034
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715289328; cv=none; b=B63dw0g0/MljcH1Rp3zpuFG31Mx0nbzmDddvHjUH23bKolFL5ww4+5v5eVZrTO/93qkllZiHmYEK3mta74/8Y5tZD06pfbtyMlM1rwkpWFlqHGKIloprFcn3Dk5QPWOZ6LdAjgjDNlyTLb5XtI9CknAeRMeirYx//5KzvXGEX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715289328; c=relaxed/simple;
	bh=e+t6dd+TKSI8pEOw8/KQZoIUjPrk7Tepy+t5r97F0Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0BLHOiLUMa8z/AWE0b9XYISLuXB3hQWj6XprWGctweV4o2ZrjQiB/QsdMBkSZTAHJeaQl2kNRWYOkm3EETkEIUeu8QqsK2K9EQUu682id8blqgnuyTITIqOl9JGsLwXMf2G/CJgicXQt+4v3/61l1NOtQwgT8ffLnMiJmo5POE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mklmqBVa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mklmqBVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715289327; x=1746825327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+t6dd+TKSI8pEOw8/KQZoIUjPrk7Tepy+t5r97F0Dc=;
  b=mklmqBVa5YFkBz1EYXqvoocYR5q2rOSnasyLKCoLiUVHJbeKdmPatWie
   AoRhj8d8/TufUsTSKD9VAv0tMcoYR3EDoYjQIWvXnmqeCsM5B8EBPLyCY
   hQK3qU3VGr4PEg/Rz5csfbbuC+E+TanSdgFBCE93XeJdzz32WRBH2e9Wd
   TijwSoenkhusLq4uDlwA9/W2ggK6COyAXXBkfrQHEqCieEsFsEw1mTdPE
   p+GmFfvOXWCkU9JKwo7pFoQSYAxPx8KNHebFS2ypTNPnW3Aec7J06viOy
   e/52Ny3fbfp3Aw952G1aCHZ9/TPnZNvlYDbUPSFOdi4wjnK0kjksH79ft
   w==;
X-CSE-ConnectionGUID: 4xZeJKhaT0GoKWrulbG+kg==
X-CSE-MsgGUID: NnySNkm2RhGWC0bdOS0T4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21913157"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21913157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 14:15:26 -0700
X-CSE-ConnectionGUID: xhxBdbBlQpefBteTRZ4n0Q==
X-CSE-MsgGUID: pKtv26+QQwu8AKw6vwysVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="66823831"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2024 14:15:24 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5B6o-0005Ns-1y;
	Thu, 09 May 2024 21:15:22 +0000
Date: Fri, 10 May 2024 05:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.rfc 4/10] mm/memcontrol-v1.c:1109:23:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202405100515.D644UVCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.rfc
head:   0011ac60f32b91542b15b122087bd97f41634b51
commit: bb7dddcd85b885a163916d548d1907c89771fd67 [4/10] mm: memcg: move charge migration code to memcontrol-v1.c
config: i386-randconfig-061-20240510 (https://download.01.org/0day-ci/archive/20240510/202405100515.D644UVCg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100515.D644UVCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100515.D644UVCg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol-v1.c:1109:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1109:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol-v1.c:1109:23: sparse:    struct task_struct *
   mm/memcontrol-v1.c:417:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol-v1.c:464:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol-v1.c: note: in included file (through include/linux/rculist.h, include/linux/cgroup.h, include/linux/memcontrol.h):
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +1109 mm/memcontrol-v1.c

  1062	
  1063	int mem_cgroup_can_attach(struct cgroup_taskset *tset)
  1064	{
  1065		struct cgroup_subsys_state *css;
  1066		struct mem_cgroup *memcg = NULL; /* unneeded init to make gcc happy */
  1067		struct mem_cgroup *from;
  1068		struct task_struct *leader, *p;
  1069		struct mm_struct *mm;
  1070		unsigned long move_flags;
  1071		int ret = 0;
  1072	
  1073		/* charge immigration isn't supported on the default hierarchy */
  1074		if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
  1075			return 0;
  1076	
  1077		/*
  1078		 * Multi-process migrations only happen on the default hierarchy
  1079		 * where charge immigration is not used.  Perform charge
  1080		 * immigration if @tset contains a leader and whine if there are
  1081		 * multiple.
  1082		 */
  1083		p = NULL;
  1084		cgroup_taskset_for_each_leader(leader, css, tset) {
  1085			WARN_ON_ONCE(p);
  1086			p = leader;
  1087			memcg = mem_cgroup_from_css(css);
  1088		}
  1089		if (!p)
  1090			return 0;
  1091	
  1092		/*
  1093		 * We are now committed to this value whatever it is. Changes in this
  1094		 * tunable will only affect upcoming migrations, not the current one.
  1095		 * So we need to save it, and keep it going.
  1096		 */
  1097		move_flags = READ_ONCE(memcg->move_charge_at_immigrate);
  1098		if (!move_flags)
  1099			return 0;
  1100	
  1101		from = mem_cgroup_from_task(p);
  1102	
  1103		VM_BUG_ON(from == memcg);
  1104	
  1105		mm = get_task_mm(p);
  1106		if (!mm)
  1107			return 0;
  1108		/* We move charges only when we move a owner of the mm */
> 1109		if (mm->owner == p) {
  1110			VM_BUG_ON(mc.from);
  1111			VM_BUG_ON(mc.to);
  1112			VM_BUG_ON(mc.precharge);
  1113			VM_BUG_ON(mc.moved_charge);
  1114			VM_BUG_ON(mc.moved_swap);
  1115	
  1116			spin_lock(&mc.lock);
  1117			mc.mm = mm;
  1118			mc.from = from;
  1119			mc.to = memcg;
  1120			mc.flags = move_flags;
  1121			spin_unlock(&mc.lock);
  1122			/* We set mc.moving_task later */
  1123	
  1124			ret = mem_cgroup_precharge_mc(mm);
  1125			if (ret)
  1126				mem_cgroup_clear_mc();
  1127		} else {
  1128			mmput(mm);
  1129		}
  1130		return ret;
  1131	}
  1132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
