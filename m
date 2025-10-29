Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0535A955
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774274; cv=none; b=AppwfobJM1kqTMu3lWnseZjUHMUznYt00uN46Px5JuHNFWT+V30lPFwN90h7tIxqr8FKeZyXwuduOUq1wJOIviM2WrG5pnwoYyupTrVhJb+RTJY5oXBxPDMbZR1xR+x25QcYQXl4Z5Xf85/fjtcA7wGEFJ+zYrUC1nE+9KtrnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774274; c=relaxed/simple;
	bh=U8hvR450X+L2Lc8rVA6i6j/Ju8oqz/n0nz9CBUCxWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPI0ZSz/G7RvkuOIcWv1b8sJ9n6OAbAtc+MePoSnuHv5KKRxsHXVNtZx3vDK6GrGBJHZWrcXhh1LChV+/10EB6Ryab9U8WquRzUD0UGm/ZcdxsbDB+SYt2ODywodyHHakUxwNvb0i6OL2Tf2xQUrHDhVLJR1PZ+hE6FGhVfz/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKJ8VhU4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKJ8VhU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761774272; x=1793310272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8hvR450X+L2Lc8rVA6i6j/Ju8oqz/n0nz9CBUCxWcQ=;
  b=YKJ8VhU4tHcytTTyUyeNtYCGovSRuWi0r5xB1WkWIvdNvg/2yleDktow
   Pwi/rRGKpkuQ2pdx3AMYiRJ3IvlWP6t6sTLvCoA/O1L0ELQJfwVvzWX1d
   5mHxk4wXVTruHFWM3uk3zhAHnCNNqX2/DZyYpuDg13RjFzcgMkkYQSRwr
   qQ911vrs5PqJsnxfl1O0vJk/4RlyvFrckGYyHBtoT5M68Kw4XOWQGYlCV
   /9p//v0OmoXgMc/HfTJH2qnSaKO3MadJ/Bi4xR7FDD35MTcOEHkVwpuaq
   01l0nooMKFmtWHZS+pMfFVSp/vGs5p3vcUEtkWZ5mUgAbITOD1Bb8DNqR
   w==;
X-CSE-ConnectionGUID: 9MYVBzt4Q5O0Co4FLjKqWA==
X-CSE-MsgGUID: QF/blNv5SjajfcTrEtWDWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75027495"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="75027495"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:44:31 -0700
X-CSE-ConnectionGUID: wJZ82oAVRtuul4rzS8nYFg==
X-CSE-MsgGUID: nJPHihZsRIqz6FiqcGyqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189849808"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 14:44:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDxz-000LCq-2g;
	Wed, 29 Oct 2025 21:44:27 +0000
Date: Thu, 30 Oct 2025 05:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1739/1739]
 kernel/cgroup/cgroup.c:5286:48: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202510300549.PPuMkgHB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1afc352b4572c02bd3b5c9195481f393af060e44
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [1739/1739] dhugetlb: backport dynamic hugetlb feature
config: arm64-randconfig-r121-20250728 (https://download.01.org/0day-ci/archive/20251030/202510300549.PPuMkgHB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300549.PPuMkgHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300549.PPuMkgHB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/cgroup.c:5286:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cgroup_subsys_state *css @@     got struct cgroup_subsys_state [noderef] <asn:4> * @@
   kernel/cgroup/cgroup.c:5286:48: sparse:     expected struct cgroup_subsys_state *css
   kernel/cgroup/cgroup.c:5286:48: sparse:     got struct cgroup_subsys_state [noderef] <asn:4> *
   kernel/cgroup/cgroup.c:2685:20: sparse: sparse: context imbalance in 'cgroup_procs_write_start' - wrong count at exit
   kernel/cgroup/cgroup.c:2741:9: sparse: sparse: context imbalance in 'cgroup_procs_write_finish' - wrong count at exit
   kernel/cgroup/cgroup.c:2874:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit
   kernel/cgroup/cgroup.c:4528:16: sparse: sparse: context imbalance in 'cgroup_procs_write' - wrong count at exit
   kernel/cgroup/cgroup.c:4580:16: sparse: sparse: context imbalance in 'cgroup_threads_write' - wrong count at exit

vim +5286 kernel/cgroup/cgroup.c

  5234	
  5235	/**
  5236	 * cgroup_destroy_locked - the first stage of cgroup destruction
  5237	 * @cgrp: cgroup to be destroyed
  5238	 *
  5239	 * css's make use of percpu refcnts whose killing latency shouldn't be
  5240	 * exposed to userland and are RCU protected.  Also, cgroup core needs to
  5241	 * guarantee that css_tryget_online() won't succeed by the time
  5242	 * ->css_offline() is invoked.  To satisfy all the requirements,
  5243	 * destruction is implemented in the following two steps.
  5244	 *
  5245	 * s1. Verify @cgrp can be destroyed and mark it dying.  Remove all
  5246	 *     userland visible parts and start killing the percpu refcnts of
  5247	 *     css's.  Set up so that the next stage will be kicked off once all
  5248	 *     the percpu refcnts are confirmed to be killed.
  5249	 *
  5250	 * s2. Invoke ->css_offline(), mark the cgroup dead and proceed with the
  5251	 *     rest of destruction.  Once all cgroup references are gone, the
  5252	 *     cgroup is RCU-freed.
  5253	 *
  5254	 * This function implements s1.  After this step, @cgrp is gone as far as
  5255	 * the userland is concerned and a new cgroup with the same name may be
  5256	 * created.  As cgroup doesn't care about the names internally, this
  5257	 * doesn't cause any problem.
  5258	 */
  5259	static int cgroup_destroy_locked(struct cgroup *cgrp)
  5260		__releases(&cgroup_mutex) __acquires(&cgroup_mutex)
  5261	{
  5262		struct cgroup *tcgrp, *parent = cgroup_parent(cgrp);
  5263		struct cgroup_subsys_state *css;
  5264		struct cgrp_cset_link *link;
  5265		int ssid;
  5266	
  5267		lockdep_assert_held(&cgroup_mutex);
  5268	
  5269		/*
  5270		 * Only migration can raise populated from zero and we're already
  5271		 * holding cgroup_mutex.
  5272		 */
  5273		if (cgroup_is_populated(cgrp))
  5274			return -EBUSY;
  5275	
  5276		/*
  5277		 * Make sure there's no live children.  We can't test emptiness of
  5278		 * ->self.children as dead children linger on it while being
  5279		 * drained; otherwise, "rmdir parent/child parent" may fail.
  5280		 */
  5281		if (css_has_online_children(&cgrp->self))
  5282			return -EBUSY;
  5283	
  5284	#ifdef CONFIG_MEMCG
  5285		/* If we use dynamic hugetlb, make sure dhugtlb_pool is free */
> 5286		if (!dhugetlb_pool_is_free(cgrp->subsys[memory_cgrp_id]))
  5287			return -EBUSY;
  5288	#endif
  5289		/*
  5290		 * Mark @cgrp and the associated csets dead.  The former prevents
  5291		 * further task migration and child creation by disabling
  5292		 * cgroup_lock_live_group().  The latter makes the csets ignored by
  5293		 * the migration path.
  5294		 */
  5295		cgrp->self.flags &= ~CSS_ONLINE;
  5296	
  5297		spin_lock_irq(&css_set_lock);
  5298		list_for_each_entry(link, &cgrp->cset_links, cset_link)
  5299			link->cset->dead = true;
  5300		spin_unlock_irq(&css_set_lock);
  5301	
  5302		/* initiate massacre of all css's */
  5303		for_each_css(css, ssid, cgrp)
  5304			kill_css(css);
  5305	
  5306		/* clear and remove @cgrp dir, @cgrp has an extra ref on its kn */
  5307		css_clear_dir(&cgrp->self);
  5308		kernfs_remove(cgrp->kn);
  5309	
  5310		if (parent && cgroup_is_threaded(cgrp))
  5311			parent->nr_threaded_children--;
  5312	
  5313		spin_lock_irq(&css_set_lock);
  5314		for (tcgrp = cgroup_parent(cgrp); tcgrp; tcgrp = cgroup_parent(tcgrp)) {
  5315			tcgrp->nr_descendants--;
  5316			tcgrp->nr_dying_descendants++;
  5317		}
  5318		spin_unlock_irq(&css_set_lock);
  5319	
  5320		cgroup1_check_for_release(parent);
  5321	
  5322		/* put the base reference */
  5323		percpu_ref_kill(&cgrp->self.refcnt);
  5324	
  5325		return 0;
  5326	};
  5327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
