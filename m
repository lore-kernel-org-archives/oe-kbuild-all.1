Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C018D658
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765000424; cv=none; b=ZO7z9YvHioUzU1+3S+mSi4WX/SfBpUTolj+cBjZkUtFpDXhxE0WhaFznHiGWKuk/KcZIoLutcrkmruN2Ls9SIrt09q8O8mVwTvWs4kcmVab0oiVM0wOhfN5/yzRBwcMFaMYDdNn7OhUF+GiihRxCblMkybCs5UPh1mnFChuXIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765000424; c=relaxed/simple;
	bh=KX0O2OmD7y7jeJx3tuf+rrdlb025PuovZyv8uyukNvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1nGuGmyU97yO5bfo9ukIN8RxnH89RfxCTyCQYhvcJxHoMWNkJPTipjwGQMi4+rWQw+I5bB5XNeLoVexGnv7Xjg0h9r4rNENEukeJ7JMENXMwFKHR0P1PwRKirz4MbfFg0k83DoVqaTHF2i3B3N0SoD0KIu4bYHbHw5E7Bmla/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnJ2MpMe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnJ2MpMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765000423; x=1796536423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KX0O2OmD7y7jeJx3tuf+rrdlb025PuovZyv8uyukNvU=;
  b=VnJ2MpMegIR+edEcjZCYnEeKw0zjLZn9bLQEZ1BvgWswCU6m4DM5iHSe
   YCggUsydAH9byy3hiwNVs7zhgl3jg77Z74jT2Y6gpaA7V7tLFpvUSbjbK
   TAWN58K6M2MEWcwwA/VnZSfgPk9kY7tnvboeMOVzxnOq61K1+Q+wEU4cc
   p2n6iriyGUuRqB6p9YY4XVABIJpMUjZNkoKCo4QKkoPalkkVXN/qjHQzw
   2io0+GWuBsKy6xlWa3wW97fdBj1jdA8UhfAAIXqeXQv7NfSPrXSB+EFVc
   8k12B04z/ridA3PmVcW8QY5AW7WmMJPTrhp474qFM25EWhdT4JdZzdf8e
   g==;
X-CSE-ConnectionGUID: UxW5EHTFRvKpKN1XBqTKmQ==
X-CSE-MsgGUID: brThSRwcSnqjoP9TKVIecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70649794"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="70649794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:53:43 -0800
X-CSE-ConnectionGUID: xt5x+wCLQHGq4lY+aISY3w==
X-CSE-MsgGUID: VdNAwuGcQya2uOhTn0MNlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199949434"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 21:53:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRlEg-00000000FuB-39XC;
	Sat, 06 Dec 2025 05:53:38 +0000
Date: Sat, 6 Dec 2025 13:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] mm/memcontrol.c:3147:6: sparse:
 sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
Message-ID: <202512061350.XW1D64dE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [3482/3482] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061350.XW1D64dE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061350.XW1D64dE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061350.XW1D64dE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:3147:6: sparse: sparse: symbol 'hisi_oom_recover' was not declared. Should it be static?
   mm/memcontrol.c:4228:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4228:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4230:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4230:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4386:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4386:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4480:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4480:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6198:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6198:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6198:23: sparse:    struct task_struct *
   mm/memcontrol.c:6415:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6415:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6415:52: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:751:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2111:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2158:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c:6048:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6243:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
