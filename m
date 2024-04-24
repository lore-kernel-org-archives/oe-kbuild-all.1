Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD8C8E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 01:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922795; cv=none; b=LQ35UPvRPqcNWwMPpZX1X5Af3u+s37MutKTk+vNRlKI1HCqO15BYRCTDsg9mb2PGhcZUxR8JaycLM23nul0c1a9NWuz22YJsYJwZFEA6aQ67FA7lKFexuwqOIoXWe00ODNpOu616yqjYaGtbmCx5uStaoE76buzanw5zrjrBK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922795; c=relaxed/simple;
	bh=IJ98gcNLBturvGOvx5oZ4Jae0ukr9wuK2fB8TziuVJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMWn3Nxvch36iQzj0uytwTqyY9vagAHwmVr/DFpNI2WKQ/Kxof5v74CKEJrAE/pc1PbkUdDKYXBpghkpcauDGdz6mvrt7vh+vyVbY1lSqCJWY0wlrqhSnIHb7XvjK+uFSYSVCYOEsldOCCT0jPDAkT6wbFrpmvbBp5BRKhGDzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbPpR2fI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbPpR2fI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713922793; x=1745458793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJ98gcNLBturvGOvx5oZ4Jae0ukr9wuK2fB8TziuVJc=;
  b=NbPpR2fIU/EqgxEFmZnZxLdTmxE6ZuWhKYvC4JLCaW/56mWpcr1Q0rSJ
   P1U8c0KpRiqBsrRO7vhuVrvxMRwql5Yj9kXz1ORti1uRDhbQa/BYO0MdE
   i3CTZ0DiEF8DGhKrA7Y9ceqgcTcT0ZzEEfstuOhYIJoaqUDxtOwbVOJ8i
   UrdcT4ZTO5u9Hv29f8JEVAL/mO3L8A7bTamDMpdpk/1+l81T7EbTWYPA2
   UNwnbC9S2SvH6bvRj3PlLVZeV7wbjs5QL8Hat9h99eIw/VqhGiooSUiMR
   7rZTeuSKFl3M6P2Cb5287DrynWdlzmYG9o4KCb75Lk2ye/60M/2pyiXiq
   w==;
X-CSE-ConnectionGUID: w7sMNb5IT/SopRkbNZjkgQ==
X-CSE-MsgGUID: WY8qYLsdRkeq+C8MaYP+Zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20149376"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20149376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 18:39:53 -0700
X-CSE-ConnectionGUID: OC01Ju6MTAST+vx5d/ttbg==
X-CSE-MsgGUID: mh7vKHdeSI+ISi0nmb3yWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29349157"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Apr 2024 18:39:51 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzRbx-0000iu-1E;
	Wed, 24 Apr 2024 01:39:49 +0000
Date: Wed, 24 Apr 2024 09:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1867/7513] mm/memcontrol.c:4061:5: sparse:
 sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be
 static?
Message-ID: <202404240956.afcEm3Dn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1bab7be76541fb1208df75a4e4e00beb09be471f
commit: 44391f3171b05060096ff496f3507033f2460161 [1867/7513] memcg: Add sysctl memcg_qos_enable
config: arm64-randconfig-r131-20240424 (https://download.01.org/0day-ci/archive/20240424/202404240956.afcEm3Dn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240956.afcEm3Dn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240956.afcEm3Dn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:4061:5: sparse: sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be static?
   mm/memcontrol.c:4223:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/memcontrol.c:4223:50: sparse:     expected void *
   mm/memcontrol.c:4223:50: sparse:     got void [noderef] __user *buffer
   mm/memcontrol.c:4245:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/memcontrol.c:4245:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/memcontrol.c:4245:35: sparse:     got int ( * )( ... )
   mm/memcontrol.c:4504:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4506:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4662:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4756:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6799:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6799:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6799:23: sparse:    struct task_struct *
   mm/memcontrol.c:7016:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:7016:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:7016:52: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2134:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2181:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/memcontrol.c:6649:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6844:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/sysctl_memcg_oom_prio +4061 mm/memcontrol.c

  4057	
  4058	#ifdef CONFIG_MEMCG_OOM_PRIORITY
  4059	#define ENABLE_MEMCG_OOM_PROIRITY	1
  4060	#define DISABLE_MEMCG_OOM_PROIRITY	0
> 4061	int sysctl_memcg_oom_prio = DISABLE_MEMCG_OOM_PROIRITY;
  4062	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
