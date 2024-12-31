Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F6F2A1D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 02:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735612769; cv=none; b=lDEA9q8hnmq78UTnMccFLP4nID78+qjqdgwPHnecOCixgeC6iTH0r19Xwn+BixFDcXmP8FVEffG53TM70bIvNAn7NRXz+XH9In/NQPI06LPGC24ZzSk+vU0DnLHdpvrD7qzmocmhdIIUKhIw8vTvL8CzBLLoNZHaFEJj89/SJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735612769; c=relaxed/simple;
	bh=9SppFxp1GjHYuRamwLpySwjYKZRg36iy/9ozWaYXOD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSzk+0jlZhR+tCZV0OKW8wBnrZnRwvZz2jSbHJsegIjr+EJxaSCqvAEeSrSI5SIv62GbKeKa1YnMDNgCBhZdpw5GdXl5qV/hIUDzLStf57VaThCQVS5KGvo/ceJ8jZQ3mKgIzattrJ+3QU3iDVHtaAwDhXjx+jr52DR8aXLpsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+nO5y6/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+nO5y6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735612767; x=1767148767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9SppFxp1GjHYuRamwLpySwjYKZRg36iy/9ozWaYXOD4=;
  b=j+nO5y6/qbCHlvNW/YEosxeVx7cjOs1p3iUWdkxrsRI+hB5naVbvE9fv
   FuigHhdezRoILxiI/8qR/zq70q53QlUrO3zLRzvxTeewLHimZqGXVxoVf
   hEKpmpH7fC7g2CoF74rAFDWZI8wldFogCBSETYU9hpc7bgXrvM4ku4kF+
   9aijfIix7+jRiXtFrzAxwq1zLIj/BXKxZmI1j+2TPcPftSMo1//0AnTSC
   PqNMUjm2tg51WoJsKf/y1DngNp72RyMd2D4HYL0P58cwyV4JzkczdRgSP
   WzwDqqFjC19dthGhqvR1NuD4hYOe0iHVHu8lXjxwYycQ5chUEOCfq2ogi
   g==;
X-CSE-ConnectionGUID: JIfvv+OTSMinud4dAtyuPQ==
X-CSE-MsgGUID: WDmpPdcnQQWVbUIhzjb4Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39824243"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="39824243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 18:39:26 -0800
X-CSE-ConnectionGUID: ad75aRtXSCWfcYdoczI4UA==
X-CSE-MsgGUID: Dn7jEjiTQSy39BrZRIfKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106005341"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 18:39:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSSAE-0006cF-28;
	Tue, 31 Dec 2024 02:39:22 +0000
Date: Tue, 31 Dec 2024 10:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 12/14] drm/sched: Embed run queue singleton into the
 scheduler
Message-ID: <202412311056.o5TzUipo-lkp@intel.com>
References: <20241230165259.95855-13-tursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230165259.95855-13-tursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Delete-unused-update_job_credits/20241231-011327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20241230165259.95855-13-tursulin%40igalia.com
patch subject: [RFC 12/14] drm/sched: Embed run queue singleton into the scheduler
config: s390-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311056.o5TzUipo-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311056.o5TzUipo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311056.o5TzUipo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_rq.c:51: warning: Excess function parameter 'rq' description in 'drm_sched_rq_init'
   drivers/gpu/drm/scheduler/sched_rq.c:73: warning: Function parameter or struct member 'ts' not described in 'drm_sched_rq_add_entity'
>> drivers/gpu/drm/scheduler/sched_rq.c:180: warning: Excess function parameter 'rq' description in 'drm_sched_rq_select_entity'


vim +51 drivers/gpu/drm/scheduler/sched_rq.c

03348b1b12c10a Tvrtko Ursulin 2024-12-30   41  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   42  /**
03348b1b12c10a Tvrtko Ursulin 2024-12-30   43   * drm_sched_rq_init - initialize a given run queue struct
03348b1b12c10a Tvrtko Ursulin 2024-12-30   44   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   45   * @sched: scheduler instance to associate with this run queue
03348b1b12c10a Tvrtko Ursulin 2024-12-30   46   * @rq: scheduler run queue
03348b1b12c10a Tvrtko Ursulin 2024-12-30   47   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   48   * Initializes a scheduler runqueue.
03348b1b12c10a Tvrtko Ursulin 2024-12-30   49   */
681ae19ad5eaac Tvrtko Ursulin 2024-12-30   50  void drm_sched_rq_init(struct drm_gpu_scheduler *sched)
03348b1b12c10a Tvrtko Ursulin 2024-12-30  @51  {
681ae19ad5eaac Tvrtko Ursulin 2024-12-30   52  	struct drm_sched_rq *rq = &sched->rq;
681ae19ad5eaac Tvrtko Ursulin 2024-12-30   53  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   54  	spin_lock_init(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   55  	INIT_LIST_HEAD(&rq->entities);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   56  	rq->rb_tree_root = RB_ROOT_CACHED;
03348b1b12c10a Tvrtko Ursulin 2024-12-30   57  }
03348b1b12c10a Tvrtko Ursulin 2024-12-30   58  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   59  /**
03348b1b12c10a Tvrtko Ursulin 2024-12-30   60   * drm_sched_rq_add_entity - add an entity
03348b1b12c10a Tvrtko Ursulin 2024-12-30   61   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   62   * @rq: scheduler run queue
03348b1b12c10a Tvrtko Ursulin 2024-12-30   63   * @entity: scheduler entity
03348b1b12c10a Tvrtko Ursulin 2024-12-30   64   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   65   * Adds a scheduler entity to the run queue.
03348b1b12c10a Tvrtko Ursulin 2024-12-30   66   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   67   * Returns a DRM scheduler pre-selected to handle this entity.
03348b1b12c10a Tvrtko Ursulin 2024-12-30   68   */
03348b1b12c10a Tvrtko Ursulin 2024-12-30   69  struct drm_gpu_scheduler *
03348b1b12c10a Tvrtko Ursulin 2024-12-30   70  drm_sched_rq_add_entity(struct drm_sched_rq *rq,
03348b1b12c10a Tvrtko Ursulin 2024-12-30   71  			struct drm_sched_entity *entity,
03348b1b12c10a Tvrtko Ursulin 2024-12-30   72  			ktime_t ts)
03348b1b12c10a Tvrtko Ursulin 2024-12-30   73  {
681ae19ad5eaac Tvrtko Ursulin 2024-12-30   74  	struct drm_gpu_scheduler *sched = container_of(rq, typeof(*sched), rq);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   75  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   76  	if (entity->stopped) {
03348b1b12c10a Tvrtko Ursulin 2024-12-30   77  		DRM_ERROR("Trying to push to a killed entity\n");
03348b1b12c10a Tvrtko Ursulin 2024-12-30   78  		return NULL;
03348b1b12c10a Tvrtko Ursulin 2024-12-30   79  	}
03348b1b12c10a Tvrtko Ursulin 2024-12-30   80  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   81  	spin_lock(&entity->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   82  	spin_lock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   83  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   84  	atomic_inc(sched->score);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   85  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   86  	if (!list_empty(&entity->list))
03348b1b12c10a Tvrtko Ursulin 2024-12-30   87  		list_add_tail(&entity->list, &rq->entities);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   88  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   89  	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30   90  		__drm_sched_rq_remove_tree_locked(entity, rq);
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30   91  	__drm_sched_rq_add_tree_locked(entity, rq, ts);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   92  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   93  	spin_unlock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   94  	spin_unlock(&entity->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30   95  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   96  	return sched;
03348b1b12c10a Tvrtko Ursulin 2024-12-30   97  }
03348b1b12c10a Tvrtko Ursulin 2024-12-30   98  
03348b1b12c10a Tvrtko Ursulin 2024-12-30   99  /**
03348b1b12c10a Tvrtko Ursulin 2024-12-30  100   * drm_sched_rq_remove_entity - remove an entity
03348b1b12c10a Tvrtko Ursulin 2024-12-30  101   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30  102   * @rq: scheduler run queue
03348b1b12c10a Tvrtko Ursulin 2024-12-30  103   * @entity: scheduler entity
03348b1b12c10a Tvrtko Ursulin 2024-12-30  104   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30  105   * Removes a scheduler entity from the run queue.
03348b1b12c10a Tvrtko Ursulin 2024-12-30  106   */
03348b1b12c10a Tvrtko Ursulin 2024-12-30  107  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
03348b1b12c10a Tvrtko Ursulin 2024-12-30  108  				struct drm_sched_entity *entity)
03348b1b12c10a Tvrtko Ursulin 2024-12-30  109  {
681ae19ad5eaac Tvrtko Ursulin 2024-12-30  110  	struct drm_gpu_scheduler *sched = container_of(rq, typeof(*sched), rq);
681ae19ad5eaac Tvrtko Ursulin 2024-12-30  111  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  112  	lockdep_assert_held(&entity->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  113  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  114  	if (list_empty(&entity->list))
03348b1b12c10a Tvrtko Ursulin 2024-12-30  115  		return;
03348b1b12c10a Tvrtko Ursulin 2024-12-30  116  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  117  	spin_lock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  118  
681ae19ad5eaac Tvrtko Ursulin 2024-12-30  119  	atomic_dec(sched->score);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  120  	list_del_init(&entity->list);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  121  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  122  	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30  123  		__drm_sched_rq_remove_tree_locked(entity, rq);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  124  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  125  	spin_unlock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  126  }
03348b1b12c10a Tvrtko Ursulin 2024-12-30  127  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  128  void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
03348b1b12c10a Tvrtko Ursulin 2024-12-30  129  			     struct drm_sched_entity *entity)
03348b1b12c10a Tvrtko Ursulin 2024-12-30  130  {
03348b1b12c10a Tvrtko Ursulin 2024-12-30  131  	struct drm_sched_job *next_job;
03348b1b12c10a Tvrtko Ursulin 2024-12-30  132  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  133  	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
03348b1b12c10a Tvrtko Ursulin 2024-12-30  134  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  135  	spin_lock(&entity->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  136  	spin_lock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  137  
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30  138  	__drm_sched_rq_remove_tree_locked(entity, rq);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  139  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  140  	if (next_job) {
03348b1b12c10a Tvrtko Ursulin 2024-12-30  141  		ktime_t ts;
03348b1b12c10a Tvrtko Ursulin 2024-12-30  142  
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30  143  		ts = drm_sched_entity_get_job_deadline(entity, next_job);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  144  
54d8ff2da30f08 Tvrtko Ursulin 2024-12-30  145  		__drm_sched_rq_add_tree_locked(entity, rq, ts);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  146  	}
03348b1b12c10a Tvrtko Ursulin 2024-12-30  147  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  148  	spin_unlock(&rq->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  149  	spin_unlock(&entity->lock);
03348b1b12c10a Tvrtko Ursulin 2024-12-30  150  }
03348b1b12c10a Tvrtko Ursulin 2024-12-30  151  
4adee88d458462 Tvrtko Ursulin 2024-12-30  152  void drm_sched_rq_update_deadline(struct drm_sched_rq *rq,
4adee88d458462 Tvrtko Ursulin 2024-12-30  153  				  struct drm_sched_entity *entity,
4adee88d458462 Tvrtko Ursulin 2024-12-30  154  				  ktime_t deadline)
4adee88d458462 Tvrtko Ursulin 2024-12-30  155  {
4adee88d458462 Tvrtko Ursulin 2024-12-30  156  	lockdep_assert_held(&entity->lock);
4adee88d458462 Tvrtko Ursulin 2024-12-30  157  
4adee88d458462 Tvrtko Ursulin 2024-12-30  158  	if (ktime_before(deadline, entity->oldest_job_waiting)) {
4adee88d458462 Tvrtko Ursulin 2024-12-30  159  		spin_lock(&rq->lock);
4adee88d458462 Tvrtko Ursulin 2024-12-30  160  		if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
4adee88d458462 Tvrtko Ursulin 2024-12-30  161  			__drm_sched_rq_remove_tree_locked(entity, rq);
4adee88d458462 Tvrtko Ursulin 2024-12-30  162  			__drm_sched_rq_add_tree_locked(entity, rq, deadline);
4adee88d458462 Tvrtko Ursulin 2024-12-30  163  		}
4adee88d458462 Tvrtko Ursulin 2024-12-30  164  		spin_unlock(&rq->lock);
4adee88d458462 Tvrtko Ursulin 2024-12-30  165  	}
4adee88d458462 Tvrtko Ursulin 2024-12-30  166  }
4adee88d458462 Tvrtko Ursulin 2024-12-30  167  
03348b1b12c10a Tvrtko Ursulin 2024-12-30  168  /**
03348b1b12c10a Tvrtko Ursulin 2024-12-30  169   * drm_sched_rq_select_entity - Select an entity which provides a job to run
03348b1b12c10a Tvrtko Ursulin 2024-12-30  170   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30  171   * @sched: the gpu scheduler
03348b1b12c10a Tvrtko Ursulin 2024-12-30  172   * @rq: scheduler run queue to check.
03348b1b12c10a Tvrtko Ursulin 2024-12-30  173   *
03348b1b12c10a Tvrtko Ursulin 2024-12-30  174   * Find oldest waiting ready entity.
03348b1b12c10a Tvrtko Ursulin 2024-12-30  175   *
85eeed2590b5c2 Tvrtko Ursulin 2024-12-30  176   * Return an entity if one is found or NULL if no ready entity was found.
03348b1b12c10a Tvrtko Ursulin 2024-12-30  177   */
03348b1b12c10a Tvrtko Ursulin 2024-12-30  178  struct drm_sched_entity *
681ae19ad5eaac Tvrtko Ursulin 2024-12-30  179  drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched)
03348b1b12c10a Tvrtko Ursulin 2024-12-30 @180  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
