Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02B28C5AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429133; cv=none; b=SqIE8yoLKf2IC1PX9MWT14qHlN1lVF7UXdKn5zVff2Mg11Y+BjfPjj7kz8cZpW42tP7A8FoXsQSpf+FfZxegaM2UTQWJOWb5MFKxULFMa3N4V6PZkM90qsla3p9VdRLVCY9kNN003Xh3+R39Fwd6IaC/DN1Eou/wkYaHbYlbzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429133; c=relaxed/simple;
	bh=VjLw9m2YXYKLZQ7ugLwfIfFJ17qRdQU68JwUWR/hlVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3h2C3N7WUa0vgILtxl1zWyLM3rigO2ImL/ODkPP5KMJ28sRo3UbRGUQi1kDHD0dQbJJDgNdEwKvmS2V2BEjoq3I0fIrrZN3Ut7xiBnT6uiMoOeBfWCwA6sfNrViYYbEOEuXoNNMU9lOe9CDUAwfrd5WSedkXy9KYWyfJognZ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IErlEwnT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IErlEwnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745429132; x=1776965132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjLw9m2YXYKLZQ7ugLwfIfFJ17qRdQU68JwUWR/hlVY=;
  b=IErlEwnTuwNxeCqXWG/ZoWi09yrykzePAN89V/Vjc+RGYMBzFtWMChnn
   vlcO0PR5bz+l56L1zDa8uiaOsXt+QofBFT6Wcrv78R6G3VAsg4OKNFUeS
   3PeJiW0z1KHlTZwQgQUZfYRjFxbcvy8pwzEovROOvn3qx5tfMIGUxC3LP
   sbBfZYQRUcvmeBSjFCF9CnL2RIclykJxGAy4aPio0cijZ+91brAJ41Fct
   NQPEH6VU/AB3EfuEAYX/XXv6nCMMNOAU/oFjLzAgTbdmz16UkWJ32UMnl
   tFcGybAq8oKdjoyCXNdpE1GVaNX3orEOdwT0KOV+Nqlf1LkCHTHP9YI51
   A==;
X-CSE-ConnectionGUID: fl3N7GdCTzyjCQLcYTkxTw==
X-CSE-MsgGUID: WFAb9iUnT0CuJi92e8YT0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50863717"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50863717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:25:31 -0700
X-CSE-ConnectionGUID: 8IwNYy8LR3+04KteKlgP5g==
X-CSE-MsgGUID: InUznyOtQNCSJrNT79KgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132908759"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 10:25:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dqh-0003Ur-2q;
	Wed, 23 Apr 2025 17:25:27 +0000
Date: Thu, 24 Apr 2025 01:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:perf/core 1/4] kernel/events/core.c:14187:17:
 error: implicit declaration of function 'free_event'; did you mean
 '_free_event'?
Message-ID: <202504240145.0KaLYtzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git perf/core
head:   4d7c0aa8fa131761c657a4c4ddf79da7c07243d2
commit: 36d8aa5345a03c45fe2ba25794310dff461c9889 [1/4] perf: Fix failing inherit_event() doing extra refcount decrement on parent
config: parisc-randconfig-002-20250423 (https://download.01.org/0day-ci/archive/20250424/202504240145.0KaLYtzT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240145.0KaLYtzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240145.0KaLYtzT-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/core.c: In function 'inherit_event':
>> kernel/events/core.c:14187:17: error: implicit declaration of function 'free_event'; did you mean '_free_event'? [-Werror=implicit-function-declaration]
   14187 |                 free_event(child_event);
         |                 ^~~~~~~~~~
         |                 _free_event
   cc1: some warnings being treated as errors


vim +14187 kernel/events/core.c

 14135	
 14136	/*
 14137	 * Inherit an event from parent task to child task.
 14138	 *
 14139	 * Returns:
 14140	 *  - valid pointer on success
 14141	 *  - NULL for orphaned events
 14142	 *  - IS_ERR() on error
 14143	 */
 14144	static struct perf_event *
 14145	inherit_event(struct perf_event *parent_event,
 14146		      struct task_struct *parent,
 14147		      struct perf_event_context *parent_ctx,
 14148		      struct task_struct *child,
 14149		      struct perf_event *group_leader,
 14150		      struct perf_event_context *child_ctx)
 14151	{
 14152		enum perf_event_state parent_state = parent_event->state;
 14153		struct perf_event_pmu_context *pmu_ctx;
 14154		struct perf_event *child_event;
 14155		unsigned long flags;
 14156	
 14157		/*
 14158		 * Instead of creating recursive hierarchies of events,
 14159		 * we link inherited events back to the original parent,
 14160		 * which has a filp for sure, which we use as the reference
 14161		 * count:
 14162		 */
 14163		if (parent_event->parent)
 14164			parent_event = parent_event->parent;
 14165	
 14166		if (parent_event->state <= PERF_EVENT_STATE_REVOKED)
 14167			return NULL;
 14168	
 14169		/*
 14170		 * Event creation should be under SRCU, see perf_pmu_unregister().
 14171		 */
 14172		guard(srcu)(&pmus_srcu);
 14173	
 14174		child_event = perf_event_alloc(&parent_event->attr,
 14175						   parent_event->cpu,
 14176						   child,
 14177						   group_leader, parent_event,
 14178						   NULL, NULL, -1);
 14179		if (IS_ERR(child_event))
 14180			return child_event;
 14181	
 14182		get_ctx(child_ctx);
 14183		child_event->ctx = child_ctx;
 14184	
 14185		pmu_ctx = find_get_pmu_context(child_event->pmu, child_ctx, child_event);
 14186		if (IS_ERR(pmu_ctx)) {
 14187			free_event(child_event);
 14188			return ERR_CAST(pmu_ctx);
 14189		}
 14190		child_event->pmu_ctx = pmu_ctx;
 14191	
 14192		/*
 14193		 * is_orphaned_event() and list_add_tail(&parent_event->child_list)
 14194		 * must be under the same lock in order to serialize against
 14195		 * perf_event_release_kernel(), such that either we must observe
 14196		 * is_orphaned_event() or they will observe us on the child_list.
 14197		 */
 14198		mutex_lock(&parent_event->child_mutex);
 14199		if (is_orphaned_event(parent_event) ||
 14200		    !atomic_long_inc_not_zero(&parent_event->refcount)) {
 14201			mutex_unlock(&parent_event->child_mutex);
 14202			free_event(child_event);
 14203			return NULL;
 14204		}
 14205	
 14206		/*
 14207		 * Make the child state follow the state of the parent event,
 14208		 * not its attr.disabled bit.  We hold the parent's mutex,
 14209		 * so we won't race with perf_event_{en, dis}able_family.
 14210		 */
 14211		if (parent_state >= PERF_EVENT_STATE_INACTIVE)
 14212			child_event->state = PERF_EVENT_STATE_INACTIVE;
 14213		else
 14214			child_event->state = PERF_EVENT_STATE_OFF;
 14215	
 14216		if (parent_event->attr.freq) {
 14217			u64 sample_period = parent_event->hw.sample_period;
 14218			struct hw_perf_event *hwc = &child_event->hw;
 14219	
 14220			hwc->sample_period = sample_period;
 14221			hwc->last_period   = sample_period;
 14222	
 14223			local64_set(&hwc->period_left, sample_period);
 14224		}
 14225	
 14226		child_event->overflow_handler = parent_event->overflow_handler;
 14227		child_event->overflow_handler_context
 14228			= parent_event->overflow_handler_context;
 14229	
 14230		/*
 14231		 * Precalculate sample_data sizes
 14232		 */
 14233		perf_event__header_size(child_event);
 14234		perf_event__id_header_size(child_event);
 14235	
 14236		/*
 14237		 * Link it up in the child's context:
 14238		 */
 14239		raw_spin_lock_irqsave(&child_ctx->lock, flags);
 14240		add_event_to_ctx(child_event, child_ctx);
 14241		child_event->attach_state |= PERF_ATTACH_CHILD;
 14242		raw_spin_unlock_irqrestore(&child_ctx->lock, flags);
 14243	
 14244		/*
 14245		 * Link this into the parent event's child list
 14246		 */
 14247		list_add_tail(&child_event->child_list, &parent_event->child_list);
 14248		mutex_unlock(&parent_event->child_mutex);
 14249	
 14250		return child_event;
 14251	}
 14252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
