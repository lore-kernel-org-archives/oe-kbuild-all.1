Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED6149C7D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745670064; cv=none; b=huNK2URfmPYvgCxeT+mecexyk4GbXtLW9uAiZXVRHYHwXRnLyNd+BA29Y0ueX71JxN3aQKjBAp9WuwVft5LrwmR5eKQ5zeOvXXrchTWhpLw2KTNrUR8K76c8la25a3zWbg/3wv8KpG+Q1yXe5kcAgyn07dJ9Pf+REqjqJdCjdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745670064; c=relaxed/simple;
	bh=hpt8UiJmpj7pDLO5mzMoGEIABC5r/BZl1oHvkW4eyKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA+okpYKEQJfL6HSVCT1XGDX6z7BHosNwjVwj5pF5j4fbeXQXKt0VA1mZBubLjtqXcqWv2mPA8GMcuk5LjdeQHrAZOgJFZqgd6DdwbHbbPJbnL0WeNxwZ7toS1d/nkr7nw9R9BHpBksH5FmELJNi+dG+7RQwoyx6HaOz9cvA2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6Q61wRJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6Q61wRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745670062; x=1777206062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hpt8UiJmpj7pDLO5mzMoGEIABC5r/BZl1oHvkW4eyKU=;
  b=X6Q61wRJYFSexnJqcEOmU0300F7K4LziYSjB6XQvgBMOmJFa66NGJ/g5
   C3Lvn/oLeppG7RF0mZHIwZmrxqCegvOt65gUloZQ6ewdNyLmpozCZbDdp
   9BzMq++4nyM/y+dMFrmaAAgpWFxWIgwdTaqnHfNnRGMGkddRChLnh3czV
   Ip14YeeNBFV4v4OH8JwzszVXY7gY3YHFiup4+KC/ZYH4bWpD3Feri8mrS
   cU/2DF9aqKuoSe3rWnuhoAo9eULfTybyb5XTEyam3jnHdNz2G07vnlhH/
   h1+qlws0qIDon85tEldac4w5p/4LTootfoohWDHLkCN9TeUr1zG7/8P5m
   Q==;
X-CSE-ConnectionGUID: 8KMndp/WRbirTTMIeSKRtQ==
X-CSE-MsgGUID: wFjXqzQiSRytVPQfGMAUPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="57963015"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="57963015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 05:21:02 -0700
X-CSE-ConnectionGUID: IiOZDy3gTk+SRDuoXZdUcA==
X-CSE-MsgGUID: nOTEwpFtTxeOfeX3WFajRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="137170499"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2025 05:21:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8eWg-0005or-0H;
	Sat, 26 Apr 2025 12:20:58 +0000
Date: Sat, 26 Apr 2025 20:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v4 14/16] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
Message-ID: <202504262023.i6ivlVLT-lkp@intel.com>
References: <20250425102034.85133-15-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425102034.85133-15-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on next-20250424]
[cannot apply to linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250425-182308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250425102034.85133-15-tvrtko.ursulin%40igalia.com
patch subject: [RFC v4 14/16] drm/sched: Remove FIFO and RR and simplify to a single run queue
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250426/202504262023.i6ivlVLT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262023.i6ivlVLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262023.i6ivlVLT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_rq.c:97: warning: Excess function parameter 'ts' description in 'drm_sched_rq_add_entity'


vim +97 drivers/gpu/drm/scheduler/sched_rq.c

ad770215b9e61e Tvrtko Ursulin 2025-04-25   84  
492894e6853b94 Tvrtko Ursulin 2025-04-25   85  /**
492894e6853b94 Tvrtko Ursulin 2025-04-25   86   * drm_sched_rq_add_entity - add an entity
492894e6853b94 Tvrtko Ursulin 2025-04-25   87   *
492894e6853b94 Tvrtko Ursulin 2025-04-25   88   * @entity: scheduler entity
492894e6853b94 Tvrtko Ursulin 2025-04-25   89   * @ts: submission timestamp
492894e6853b94 Tvrtko Ursulin 2025-04-25   90   *
492894e6853b94 Tvrtko Ursulin 2025-04-25   91   * Adds a scheduler entity to the run queue.
492894e6853b94 Tvrtko Ursulin 2025-04-25   92   *
492894e6853b94 Tvrtko Ursulin 2025-04-25   93   * Returns a DRM scheduler pre-selected to handle this entity.
492894e6853b94 Tvrtko Ursulin 2025-04-25   94   */
492894e6853b94 Tvrtko Ursulin 2025-04-25   95  struct drm_gpu_scheduler *
a7ce3f10ad3c5d Tvrtko Ursulin 2025-04-25   96  drm_sched_rq_add_entity(struct drm_sched_entity *entity)
492894e6853b94 Tvrtko Ursulin 2025-04-25  @97  {
492894e6853b94 Tvrtko Ursulin 2025-04-25   98  	struct drm_gpu_scheduler *sched;
492894e6853b94 Tvrtko Ursulin 2025-04-25   99  	struct drm_sched_rq *rq;
a7ce3f10ad3c5d Tvrtko Ursulin 2025-04-25  100  	ktime_t ts;
492894e6853b94 Tvrtko Ursulin 2025-04-25  101  
492894e6853b94 Tvrtko Ursulin 2025-04-25  102  	/* Add the entity to the run queue */
492894e6853b94 Tvrtko Ursulin 2025-04-25  103  	spin_lock(&entity->lock);
492894e6853b94 Tvrtko Ursulin 2025-04-25  104  	if (entity->stopped) {
492894e6853b94 Tvrtko Ursulin 2025-04-25  105  		spin_unlock(&entity->lock);
492894e6853b94 Tvrtko Ursulin 2025-04-25  106  
492894e6853b94 Tvrtko Ursulin 2025-04-25  107  		DRM_ERROR("Trying to push to a killed entity\n");
492894e6853b94 Tvrtko Ursulin 2025-04-25  108  		return NULL;
492894e6853b94 Tvrtko Ursulin 2025-04-25  109  	}
492894e6853b94 Tvrtko Ursulin 2025-04-25  110  
492894e6853b94 Tvrtko Ursulin 2025-04-25  111  	rq = entity->rq;
492894e6853b94 Tvrtko Ursulin 2025-04-25  112  	spin_lock(&rq->lock);
492894e6853b94 Tvrtko Ursulin 2025-04-25  113  	sched = rq->sched;
492894e6853b94 Tvrtko Ursulin 2025-04-25  114  
492894e6853b94 Tvrtko Ursulin 2025-04-25  115  	if (list_empty(&entity->list)) {
492894e6853b94 Tvrtko Ursulin 2025-04-25  116  		atomic_inc(sched->score);
492894e6853b94 Tvrtko Ursulin 2025-04-25  117  		list_add_tail(&entity->list, &rq->entities);
492894e6853b94 Tvrtko Ursulin 2025-04-25  118  	}
492894e6853b94 Tvrtko Ursulin 2025-04-25  119  
ad770215b9e61e Tvrtko Ursulin 2025-04-25  120  	ts = drm_sched_rq_get_min_vruntime(rq);
ad770215b9e61e Tvrtko Ursulin 2025-04-25  121  	ts = drm_sched_entity_restore_vruntime(entity, ts);
a7ce3f10ad3c5d Tvrtko Ursulin 2025-04-25  122  	drm_sched_rq_update_tree_locked(entity, rq, ts);
492894e6853b94 Tvrtko Ursulin 2025-04-25  123  
492894e6853b94 Tvrtko Ursulin 2025-04-25  124  	spin_unlock(&rq->lock);
492894e6853b94 Tvrtko Ursulin 2025-04-25  125  	spin_unlock(&entity->lock);
492894e6853b94 Tvrtko Ursulin 2025-04-25  126  
492894e6853b94 Tvrtko Ursulin 2025-04-25  127  	return sched;
492894e6853b94 Tvrtko Ursulin 2025-04-25  128  }
492894e6853b94 Tvrtko Ursulin 2025-04-25  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
