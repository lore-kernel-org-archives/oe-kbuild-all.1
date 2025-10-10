Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF091E9B3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 05:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760073834; cv=none; b=LuwCbCiebXVbmRxgDww9yrd7yZjNAjQKWuir3aRw7CnGVsud6d8dlMJAYuXdSVm87XmnCsQW1736GE5inPQcUm0LX/Od/bbzYnwAk32UPuYRG73y/+13lQLHIaaJTtemBDr3mLcZp1CmykmO9sQl8kLLVSWOHYHHN6yg2B/+OeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760073834; c=relaxed/simple;
	bh=Fq8XAMEAlw601ziZJFuWf9k2VVJipEpN5q1WFI4Rm0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8boarUHwZboABN5j/2aEDNfdetP3RTQQJoWZEGuhkHfHQGyMsbUmT3ZHRIHTgsDQWNeKtSL7kfCcjuXFuzNhPEBT0o9Z7vUcRevZP4lX3bt9pK03L4Elm4tJ3MK/Nu6FR2AVC6T7vtU/lbNr4Sssw3cDjW8te7Pzn0lji4IuMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iy22KVZ7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy22KVZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760073832; x=1791609832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fq8XAMEAlw601ziZJFuWf9k2VVJipEpN5q1WFI4Rm0s=;
  b=Iy22KVZ7BIULuaTgfnrnWsKT7u055Wu/2ueok5weI+T05jtKKxxfkoGE
   HBXhV8zezOfXogOtFg2eKiumoMrNiTRPYxhHid9JaU6tJjWnT2bW9i2HU
   5JatCLBZx46c57TtYciqGaek10+2PTzKMYP5Jx+RLDk0gEbpT0y4dxxBs
   szoN11WvSzr5gt2XZ8hmY16wPBBtIb89pk0JALW5aGS4GRHbAsnM2OD4Y
   Foy9jp3CdCSj3y2L022r5DgpGCskqG741JrQ5YiISibqOA3HyJgVVltSs
   ffO9aUOCep1ickKVLC9Nlhunj2Du7CjluZ+10ziLv2PtJVnB9h/iazltM
   A==;
X-CSE-ConnectionGUID: LPx9pHsvQwCRP/tSUkkVQw==
X-CSE-MsgGUID: dc2Gn+vzT5aAxSaXrBxM0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79734479"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="79734479"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:23:51 -0700
X-CSE-ConnectionGUID: RsCpaMvkTdaSkID6XuDUYA==
X-CSE-MsgGUID: jIjDAL56SbSpKUmvZ4KV9g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Oct 2025 22:23:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v75bX-0002H5-2x;
	Fri, 10 Oct 2025 05:23:47 +0000
Date: Fri, 10 Oct 2025 13:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/sheaves-for-all 7/13] mm/slub.c:4229:22: warning:
 'count_partial' defined but not used
Message-ID: <202510101333.eondb6zP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/sheaves-for-all
head:   575f4b1ed517f1734ff0d2d8889a16074e297056
commit: 126d8a14a005debd9cc4c5728f3522e9b632ebd1 [7/13] slub: remove CONFIG_SLUB_TINY specific code paths
config: x86_64-randconfig-004-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101333.eondb6zP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101333.eondb6zP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101333.eondb6zP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:4229:22: warning: 'count_partial' defined but not used [-Wunused-function]
    4229 | static unsigned long count_partial(struct kmem_cache_node *n,
         |                      ^~~~~~~~~~~~~
>> mm/slub.c:4159:12: warning: 'count_free' defined but not used [-Wunused-function]
    4159 | static int count_free(struct slab *slab)
         |            ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SLUB_DEBUG
   Depends on [n]: SYSFS [=y] && !SLUB_TINY [=y]
   Selected by [y]:
   - KASAN_GENERIC [=y] && KASAN [=y] && HAVE_ARCH_KASAN [=y] && CC_HAS_KASAN_GENERIC [=y] && CC_HAS_WORKING_NOSANITIZE_ADDRESS [=y]


vim +/count_partial +4229 mm/slub.c

dfb4f096098273 Christoph Lameter   2007-10-16  4157  
9a02d699935c9a David Rientjes      2014-06-04  4158  #ifdef CONFIG_SLUB_DEBUG
bb192ed9aa7191 Vlastimil Babka     2021-11-03 @4159  static int count_free(struct slab *slab)
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4160  {
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4161  	return slab->objects - slab->inuse;
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4162  }
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4163  
9a02d699935c9a David Rientjes      2014-06-04  4164  static inline unsigned long node_nr_objs(struct kmem_cache_node *n)
9a02d699935c9a David Rientjes      2014-06-04  4165  {
9a02d699935c9a David Rientjes      2014-06-04  4166  	return atomic_long_read(&n->total_objects);
9a02d699935c9a David Rientjes      2014-06-04  4167  }
a579b0560cd74e Vlastimil Babka     2022-08-23  4168  
a579b0560cd74e Vlastimil Babka     2022-08-23  4169  /* Supports checking bulk free of a constructed freelist */
fa9b88e459d710 Vlastimil Babka     2022-11-21  4170  static inline bool free_debug_processing(struct kmem_cache *s,
fa9b88e459d710 Vlastimil Babka     2022-11-21  4171  	struct slab *slab, void *head, void *tail, int *bulk_cnt,
fa9b88e459d710 Vlastimil Babka     2022-11-21  4172  	unsigned long addr, depot_stack_handle_t handle)
a579b0560cd74e Vlastimil Babka     2022-08-23  4173  {
fa9b88e459d710 Vlastimil Babka     2022-11-21  4174  	bool checks_ok = false;
a579b0560cd74e Vlastimil Babka     2022-08-23  4175  	void *object = head;
a579b0560cd74e Vlastimil Babka     2022-08-23  4176  	int cnt = 0;
a579b0560cd74e Vlastimil Babka     2022-08-23  4177  
a579b0560cd74e Vlastimil Babka     2022-08-23  4178  	if (s->flags & SLAB_CONSISTENCY_CHECKS) {
a579b0560cd74e Vlastimil Babka     2022-08-23  4179  		if (!check_slab(s, slab))
a579b0560cd74e Vlastimil Babka     2022-08-23  4180  			goto out;
a579b0560cd74e Vlastimil Babka     2022-08-23  4181  	}
a579b0560cd74e Vlastimil Babka     2022-08-23  4182  
fa9b88e459d710 Vlastimil Babka     2022-11-21  4183  	if (slab->inuse < *bulk_cnt) {
c7323a5ad07863 Vlastimil Babka     2022-08-23  4184  		slab_err(s, slab, "Slab has %d allocated objects but %d are to be freed\n",
fa9b88e459d710 Vlastimil Babka     2022-11-21  4185  			 slab->inuse, *bulk_cnt);
c7323a5ad07863 Vlastimil Babka     2022-08-23  4186  		goto out;
c7323a5ad07863 Vlastimil Babka     2022-08-23  4187  	}
c7323a5ad07863 Vlastimil Babka     2022-08-23  4188  
a579b0560cd74e Vlastimil Babka     2022-08-23  4189  next_object:
c7323a5ad07863 Vlastimil Babka     2022-08-23  4190  
fa9b88e459d710 Vlastimil Babka     2022-11-21  4191  	if (++cnt > *bulk_cnt)
c7323a5ad07863 Vlastimil Babka     2022-08-23  4192  		goto out_cnt;
a579b0560cd74e Vlastimil Babka     2022-08-23  4193  
a579b0560cd74e Vlastimil Babka     2022-08-23  4194  	if (s->flags & SLAB_CONSISTENCY_CHECKS) {
a579b0560cd74e Vlastimil Babka     2022-08-23  4195  		if (!free_consistency_checks(s, slab, object, addr))
a579b0560cd74e Vlastimil Babka     2022-08-23  4196  			goto out;
a579b0560cd74e Vlastimil Babka     2022-08-23  4197  	}
a579b0560cd74e Vlastimil Babka     2022-08-23  4198  
a579b0560cd74e Vlastimil Babka     2022-08-23  4199  	if (s->flags & SLAB_STORE_USER)
a579b0560cd74e Vlastimil Babka     2022-08-23  4200  		set_track_update(s, object, TRACK_FREE, addr, handle);
a579b0560cd74e Vlastimil Babka     2022-08-23  4201  	trace(s, slab, object, 0);
a579b0560cd74e Vlastimil Babka     2022-08-23  4202  	/* Freepointer not overwritten by init_object(), SLAB_POISON moved it */
a579b0560cd74e Vlastimil Babka     2022-08-23  4203  	init_object(s, object, SLUB_RED_INACTIVE);
a579b0560cd74e Vlastimil Babka     2022-08-23  4204  
a579b0560cd74e Vlastimil Babka     2022-08-23  4205  	/* Reached end of constructed freelist yet? */
a579b0560cd74e Vlastimil Babka     2022-08-23  4206  	if (object != tail) {
a579b0560cd74e Vlastimil Babka     2022-08-23  4207  		object = get_freepointer(s, object);
a579b0560cd74e Vlastimil Babka     2022-08-23  4208  		goto next_object;
a579b0560cd74e Vlastimil Babka     2022-08-23  4209  	}
c7323a5ad07863 Vlastimil Babka     2022-08-23  4210  	checks_ok = true;
a579b0560cd74e Vlastimil Babka     2022-08-23  4211  
c7323a5ad07863 Vlastimil Babka     2022-08-23  4212  out_cnt:
fa9b88e459d710 Vlastimil Babka     2022-11-21  4213  	if (cnt != *bulk_cnt) {
c7323a5ad07863 Vlastimil Babka     2022-08-23  4214  		slab_err(s, slab, "Bulk free expected %d objects but found %d\n",
fa9b88e459d710 Vlastimil Babka     2022-11-21  4215  			 *bulk_cnt, cnt);
fa9b88e459d710 Vlastimil Babka     2022-11-21  4216  		*bulk_cnt = cnt;
c7323a5ad07863 Vlastimil Babka     2022-08-23  4217  	}
c7323a5ad07863 Vlastimil Babka     2022-08-23  4218  
fa9b88e459d710 Vlastimil Babka     2022-11-21  4219  out:
c7323a5ad07863 Vlastimil Babka     2022-08-23  4220  
c7323a5ad07863 Vlastimil Babka     2022-08-23  4221  	if (!checks_ok)
a579b0560cd74e Vlastimil Babka     2022-08-23  4222  		slab_fix(s, "Object at 0x%p not freed", object);
c7323a5ad07863 Vlastimil Babka     2022-08-23  4223  
fa9b88e459d710 Vlastimil Babka     2022-11-21  4224  	return checks_ok;
a579b0560cd74e Vlastimil Babka     2022-08-23  4225  }
9a02d699935c9a David Rientjes      2014-06-04  4226  #endif /* CONFIG_SLUB_DEBUG */
9a02d699935c9a David Rientjes      2014-06-04  4227  
b1a413a39a1a76 Vlastimil Babka     2022-11-14  4228  #if defined(CONFIG_SLUB_DEBUG) || defined(SLAB_SUPPORTS_SYSFS)
781b2ba6eb5f22 Pekka Enberg        2009-06-10 @4229  static unsigned long count_partial(struct kmem_cache_node *n,
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4230  					int (*get_count)(struct slab *))
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4231  {
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4232  	unsigned long flags;
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4233  	unsigned long x = 0;
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4234  	struct slab *slab;
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4235  
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4236  	spin_lock_irqsave(&n->list_lock, flags);
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4237  	list_for_each_entry(slab, &n->partial, slab_list)
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4238  		x += get_count(slab);
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4239  	spin_unlock_irqrestore(&n->list_lock, flags);
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4240  	return x;
781b2ba6eb5f22 Pekka Enberg        2009-06-10  4241  }
b1a413a39a1a76 Vlastimil Babka     2022-11-14  4242  #endif /* CONFIG_SLUB_DEBUG || SLAB_SUPPORTS_SYSFS */
26c02cf05ddadf Alexander Beregalov 2009-06-11  4243  

:::::: The code at line 4229 was first introduced by commit
:::::: 781b2ba6eb5f22440afac9c79a89ebd6e3674a60 SLUB: Out-of-memory diagnostics

:::::: TO: Pekka Enberg <penberg@cs.helsinki.fi>
:::::: CC: Pekka Enberg <penberg@cs.helsinki.fi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
