Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305DF19EEC2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769967661; cv=none; b=pPXa3xe8kJLeQ5wa0Mjfsj9adFyk+7jJhEDvBlK18Nm4sx5902QKTKCM9pApddHepLlMIPGUJqMpVRzwLmNfTwweVVCDnAkChHyYiyEQ+jtesegwLMvnlgj6xs5yJjCMo6zJoH8smzu5vEtv3eFelwOdASanQX6ooRJOZhbMvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769967661; c=relaxed/simple;
	bh=EZXa9NG50UPa1dmj0/iT6ra3HaYakXaFRG/DjFlSS18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALBhO7v/n+ii9KbGDf/oGybs2U6bj+YNkYAK/MP1QK/oV9nInG0sDiqBxaSX+Mc6rP0dOOLa0nXkN04xJi1UFzPd2qzV6VGHZWRVK5GxTNUnUemI3slHhJD49a+316dwPVsfW/B6lRbSE7hISThBBJUlbVaMEC2fl7kY9HBeK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZaWfFPb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZaWfFPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769967659; x=1801503659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EZXa9NG50UPa1dmj0/iT6ra3HaYakXaFRG/DjFlSS18=;
  b=WZaWfFPbQ9wcuA7smG8t67dPoPHYuIWCb3vwr/0jWiaz3Rxq5jZKLKd6
   pY43GSk9kYRmQfLhKR8H4M+pp0wOyP3hFeymhycbC52UdpDDxp0wva+Uk
   fv2rvJZk3ANI/TPcYjzxqxpxZ/ZgUpLar1F6n7GNVqmmArJ4D1k0v5m03
   F42M8WU8u+WwMhi+wG8sqU3wv0rUt3gw3sh5ul73VuysxqflmmTlOzkay
   l6LOxoEysZw9eiI6zMk/BDgcj2Vwn7pHOZADWkHjgPvqq68TiVYxAim/z
   t7UUxCnlVRwkqRYMvoOkLAbOIb3bnjQw8s2x7LVk7DICo+Kd+HjIS/Svu
   g==;
X-CSE-ConnectionGUID: KmI1lDYaTMm0IeCNGSqopQ==
X-CSE-MsgGUID: v3JZDmF3SSiA0088N7E3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="96602068"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="96602068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 09:40:59 -0800
X-CSE-ConnectionGUID: rtJM3tOhQ9S2TqXzX6d5Xw==
X-CSE-MsgGUID: /yf2hXIWRQenL4lygBDCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="213785197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Feb 2026 09:40:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmbRP-00000000eu4-2pry;
	Sun, 01 Feb 2026 17:40:55 +0000
Date: Mon, 2 Feb 2026 01:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier
 selection
Message-ID: <202602020102.pPxWRjpO-lkp@intel.com>
References: <20260131125454.3187546-4-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131125454.3187546-4-youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-4-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier selection
config: s390-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020102.pPxWRjpO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020102.pPxWRjpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020102.pPxWRjpO-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/memcontrol.o: in function `mem_cgroup_free':
>> mm/memcontrol.c:3695:(.text+0x662a): undefined reference to `swap_tiers_memcg_sync_mask'
   s390-linux-ld: mm/memcontrol.o: in function `mem_cgroup_css_alloc':
>> mm/memcontrol.c:3798:(.ref.text+0x372): undefined reference to `swap_tiers_memcg_inherit_mask'


vim +3695 mm/memcontrol.c

  3690	
  3691	static void mem_cgroup_free(struct mem_cgroup *memcg)
  3692	{
  3693		lru_gen_exit_memcg(memcg);
  3694		memcg_wb_domain_exit(memcg);
> 3695		swap_tiers_memcg_sync_mask(memcg);
  3696		__mem_cgroup_free(memcg);
  3697	}
  3698	
  3699	static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
  3700	{
  3701		struct memcg_vmstats_percpu *statc;
  3702		struct memcg_vmstats_percpu __percpu *pstatc_pcpu;
  3703		struct mem_cgroup *memcg;
  3704		int node, cpu;
  3705		int __maybe_unused i;
  3706		long error;
  3707	
  3708		memcg = kmem_cache_zalloc(memcg_cachep, GFP_KERNEL);
  3709		if (!memcg)
  3710			return ERR_PTR(-ENOMEM);
  3711	
  3712		error = xa_alloc(&mem_cgroup_private_ids, &memcg->id.id, NULL,
  3713				 XA_LIMIT(1, MEM_CGROUP_ID_MAX), GFP_KERNEL);
  3714		if (error)
  3715			goto fail;
  3716		error = -ENOMEM;
  3717	
  3718		memcg->vmstats = kzalloc(sizeof(struct memcg_vmstats),
  3719					 GFP_KERNEL_ACCOUNT);
  3720		if (!memcg->vmstats)
  3721			goto fail;
  3722	
  3723		memcg->vmstats_percpu = alloc_percpu_gfp(struct memcg_vmstats_percpu,
  3724							 GFP_KERNEL_ACCOUNT);
  3725		if (!memcg->vmstats_percpu)
  3726			goto fail;
  3727	
  3728		if (!memcg1_alloc_events(memcg))
  3729			goto fail;
  3730	
  3731		for_each_possible_cpu(cpu) {
  3732			if (parent)
  3733				pstatc_pcpu = parent->vmstats_percpu;
  3734			statc = per_cpu_ptr(memcg->vmstats_percpu, cpu);
  3735			statc->parent_pcpu = parent ? pstatc_pcpu : NULL;
  3736			statc->vmstats = memcg->vmstats;
  3737		}
  3738	
  3739		for_each_node(node)
  3740			if (!alloc_mem_cgroup_per_node_info(memcg, node))
  3741				goto fail;
  3742	
  3743		if (memcg_wb_domain_init(memcg, GFP_KERNEL))
  3744			goto fail;
  3745	
  3746		INIT_WORK(&memcg->high_work, high_work_func);
  3747		vmpressure_init(&memcg->vmpressure);
  3748		INIT_LIST_HEAD(&memcg->memory_peaks);
  3749		INIT_LIST_HEAD(&memcg->swap_peaks);
  3750		spin_lock_init(&memcg->peaks_lock);
  3751		memcg->socket_pressure = get_jiffies_64();
  3752	#if BITS_PER_LONG < 64
  3753		seqlock_init(&memcg->socket_pressure_seqlock);
  3754	#endif
  3755		memcg1_memcg_init(memcg);
  3756		memcg->kmemcg_id = -1;
  3757		INIT_LIST_HEAD(&memcg->objcg_list);
  3758	#ifdef CONFIG_CGROUP_WRITEBACK
  3759		INIT_LIST_HEAD(&memcg->cgwb_list);
  3760		for (i = 0; i < MEMCG_CGWB_FRN_CNT; i++)
  3761			memcg->cgwb_frn[i].done =
  3762				__WB_COMPLETION_INIT(&memcg_cgwb_frn_waitq);
  3763	#endif
  3764	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  3765		spin_lock_init(&memcg->deferred_split_queue.split_queue_lock);
  3766		INIT_LIST_HEAD(&memcg->deferred_split_queue.split_queue);
  3767		memcg->deferred_split_queue.split_queue_len = 0;
  3768	#endif
  3769		lru_gen_init_memcg(memcg);
  3770		return memcg;
  3771	fail:
  3772		mem_cgroup_private_id_remove(memcg);
  3773		__mem_cgroup_free(memcg);
  3774		return ERR_PTR(error);
  3775	}
  3776	
  3777	static struct cgroup_subsys_state * __ref
  3778	mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
  3779	{
  3780		struct mem_cgroup *parent = mem_cgroup_from_css(parent_css);
  3781		struct mem_cgroup *memcg, *old_memcg;
  3782		bool memcg_on_dfl = cgroup_subsys_on_dfl(memory_cgrp_subsys);
  3783	
  3784		old_memcg = set_active_memcg(parent);
  3785		memcg = mem_cgroup_alloc(parent);
  3786		set_active_memcg(old_memcg);
  3787		if (IS_ERR(memcg))
  3788			return ERR_CAST(memcg);
  3789	
  3790		page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
  3791		memcg1_soft_limit_reset(memcg);
  3792	#ifdef CONFIG_ZSWAP
  3793		memcg->zswap_max = PAGE_COUNTER_MAX;
  3794		WRITE_ONCE(memcg->zswap_writeback, true);
  3795	#endif
  3796		page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
  3797		memcg->tier_mask = TIER_ALL_MASK;
> 3798		swap_tiers_memcg_inherit_mask(memcg, parent);
  3799	
  3800		if (parent) {
  3801			WRITE_ONCE(memcg->swappiness, mem_cgroup_swappiness(parent));
  3802	
  3803			page_counter_init(&memcg->memory, &parent->memory, memcg_on_dfl);
  3804			page_counter_init(&memcg->swap, &parent->swap, false);
  3805	#ifdef CONFIG_MEMCG_V1
  3806			memcg->memory.track_failcnt = !memcg_on_dfl;
  3807			WRITE_ONCE(memcg->oom_kill_disable, READ_ONCE(parent->oom_kill_disable));
  3808			page_counter_init(&memcg->kmem, &parent->kmem, false);
  3809			page_counter_init(&memcg->tcpmem, &parent->tcpmem, false);
  3810	#endif
  3811		} else {
  3812			init_memcg_stats();
  3813			init_memcg_events();
  3814			page_counter_init(&memcg->memory, NULL, true);
  3815			page_counter_init(&memcg->swap, NULL, false);
  3816	#ifdef CONFIG_MEMCG_V1
  3817			page_counter_init(&memcg->kmem, NULL, false);
  3818			page_counter_init(&memcg->tcpmem, NULL, false);
  3819	#endif
  3820			root_mem_cgroup = memcg;
  3821			return &memcg->css;
  3822		}
  3823	
  3824		if (memcg_on_dfl && !cgroup_memory_nosocket)
  3825			static_branch_inc(&memcg_sockets_enabled_key);
  3826	
  3827		if (!cgroup_memory_nobpf)
  3828			static_branch_inc(&memcg_bpf_enabled_key);
  3829	
  3830		return &memcg->css;
  3831	}
  3832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
