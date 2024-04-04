Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925124C634
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212123; cv=none; b=un6oXSTJaN0QWMG0ma7OUZLDzMGcPRdkH/wGBWVqtIIATUFEZfUkn8h9DK57dKXSxuss38OWKKyaXZzX5tzWjaBO4wRLGZHU6riJGksne5Mviid1Lwqjvi5y6BNS0XWTJTf0pBr7sEKOgruayItlbF0oMJEVH+YXvrTbKY0bNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212123; c=relaxed/simple;
	bh=iF5+18mtokd8BQNgolvcnKfGbXPyXbVqZ+IltNFGUUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vi70F9LXPErGmeHi7qfl9zQfOT2rJwLintQjmfD77q4ULuCAHXncluEI+950Nr1Rvm9SYlTHgt2I/FJzQMfj2LWbW699SJy5pGzpbzh12ptlNRLZ5B6Lk9woOIzp0gLBOtMM4k4Jjx8SxrYGj+JsMXhrEvevbhfgZ8FuBb9FmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oACAS4fg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oACAS4fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712212121; x=1743748121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iF5+18mtokd8BQNgolvcnKfGbXPyXbVqZ+IltNFGUUo=;
  b=oACAS4fg/27dsMEdmDrbPNQkXqTmBeo8SYN1cVU/KpCYC6i2ZsxBVLQX
   hL4iHnH06+fnoP5ga2oUGRsCX2EpizMog3J+GFxEaCoFpJ93Sk8QPmQqw
   q4rWKe9Vc/lIYAoBSX10W2R9pRkf0v1FsRI6Nt4wmNa77ditEdWRsEPY8
   oB8n6+c2X/1TfNpZ/SJjh2Q65ozf+Ze2K+m4lcUtqKlNWmb8F+ofABywd
   It+T/Bjk2hUmWeXuCjKjnu3C3m3n0zYerzi0KF/4s7/gCpO8qMKUZqed9
   Ot9IeLIeDXjmjCCAI/L5dgyJufGXQT8X4ny6MjE0aVdvd9MRyecEoh82X
   Q==;
X-CSE-ConnectionGUID: eaOFZSnVTae0pGCGOY6V7Q==
X-CSE-MsgGUID: u2AncEmnSzefbfUXXa0KxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7648200"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7648200"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 23:28:41 -0700
X-CSE-ConnectionGUID: SvsdaAdOSDupv3EcjXkkjQ==
X-CSE-MsgGUID: /4SSUfaOQNOwd2mxquMpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23173302"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Apr 2024 23:28:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsGaL-0000h2-17;
	Thu, 04 Apr 2024 06:28:29 +0000
Date: Thu, 4 Apr 2024 14:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20217/22045]
 kernel/cgroup/cgroup.c:5286:48: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202404041400.pyWx04Vl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e89315eb08769716cbf7e08f49672222cf0eca47
commit: 0bc0d0d57edacd59ebe38d05ad9c4b2bc185aa51 [20217/22045] dhugetlb: backport dynamic hugetlb feature
config: arm64-randconfig-r112-20240401 (https://download.01.org/0day-ci/archive/20240404/202404041400.pyWx04Vl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041400.pyWx04Vl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041400.pyWx04Vl-lkp@intel.com/

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
