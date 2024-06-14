Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8C1474A6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718399368; cv=none; b=D7Udwu/C0mTYEYAZX122nVtSRCSUxPooUkQ29kIIiT1vpLjWUTktRSUHtDR6Y1Xf5mKjvUb9o7M2++UzCFW01jIEZNCe6Lu3aSzynh/X/LSHYXXDWpoqmann60kZXSiBvwoTnsFIwcna4iQ0nTm2X1+iFcFsD1E9ndAfawZpLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718399368; c=relaxed/simple;
	bh=FNq86m2+L/Y8MguLbUnC6HoD3GqL1CauBRcwa9sF4GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8biDapOPlF8N3+h9XzfpOtZNLvWhVLY1chUeabldnoCR7NrE6AsBartlMxMEltlNLfSjimpGuZRHuEvNeMLNGa6T1aS1P7yHUczCBjz5UVrLL7DlzRcKfh4khF0pF4P7fiQaI+1Y9WqW+KCpVXyRGtuZTyC1gL9892vYM4WitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzK/iKnT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzK/iKnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718399367; x=1749935367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNq86m2+L/Y8MguLbUnC6HoD3GqL1CauBRcwa9sF4GA=;
  b=mzK/iKnTdLcUDR5nyj6TfcT87kb2BLeZinSDRCSYdTStZj7MC7KScol/
   6OxzJ9gIdHu6mEcI9e4cCvKTzakowzHqyYD0YiPaJu67nW1f5Yoci6Ftf
   6FrL90J6YRY5NyjB8zKHh3epbsuZrdPfu54UkWpG3DWUSaMH/AicJp/gw
   u0HVM9qtyFwibEt9JHlO0AVpsKT8eKmuooplzk5BDFAKVuEA3ahPBxksM
   2e9FpG6cNimo6pRH5Yzo6opcF2N1sojGnffaMaWg5MJNjFyh/LY0R2ofu
   Vb6rlUBrxUjIUsDL2LEPhlKaZF96FowZl/9iUGF0p/t7wCf96oGEBDmtJ
   g==;
X-CSE-ConnectionGUID: LlJFmXvLQ96HjSvMkjeEPQ==
X-CSE-MsgGUID: LbANjSOwTwCpADxcgORiBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15141716"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="15141716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 14:09:25 -0700
X-CSE-ConnectionGUID: FBxTe8TwQ5OCB8N3E2Vs9g==
X-CSE-MsgGUID: JDLnadtmSGipZJW8EiIzWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="78095555"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 14:09:23 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIEAi-0001nZ-2L;
	Fri, 14 Jun 2024 21:09:20 +0000
Date: Sat, 15 Jun 2024 05:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: mm/slub.c:3905:29: error: variable 'obj_exts' set but not used
Message-ID: <202406150444.F6neSaiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c286c21ff94252f778515b21b6bebe749454a852
commit: 4b8736964640fe160724e7135dc62883bddcdace mm/slab: add allocation accounting into slab allocation and free paths
date:   7 weeks ago
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20240615/202406150444.F6neSaiy-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150444.F6neSaiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150444.F6neSaiy-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_post_alloc_hook':
>> mm/slub.c:3905:29: error: variable 'obj_exts' set but not used [-Werror=unused-but-set-variable]
    3905 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~
   cc1: all warnings being treated as errors


vim +/obj_exts +3905 mm/slub.c

  3898	
  3899	static __fastpath_inline
  3900	void slab_post_alloc_hook(struct kmem_cache *s,	struct obj_cgroup *objcg,
  3901				  gfp_t flags, size_t size, void **p, bool init,
  3902				  unsigned int orig_size)
  3903	{
  3904		unsigned int zero_size = s->object_size;
> 3905		struct slabobj_ext *obj_exts;
  3906		bool kasan_init = init;
  3907		size_t i;
  3908		gfp_t init_flags = flags & gfp_allowed_mask;
  3909	
  3910		/*
  3911		 * For kmalloc object, the allocated memory size(object_size) is likely
  3912		 * larger than the requested size(orig_size). If redzone check is
  3913		 * enabled for the extra space, don't zero it, as it will be redzoned
  3914		 * soon. The redzone operation for this extra space could be seen as a
  3915		 * replacement of current poisoning under certain debug option, and
  3916		 * won't break other sanity checks.
  3917		 */
  3918		if (kmem_cache_debug_flags(s, SLAB_STORE_USER | SLAB_RED_ZONE) &&
  3919		    (s->flags & SLAB_KMALLOC))
  3920			zero_size = orig_size;
  3921	
  3922		/*
  3923		 * When slab_debug is enabled, avoid memory initialization integrated
  3924		 * into KASAN and instead zero out the memory via the memset below with
  3925		 * the proper size. Otherwise, KASAN might overwrite SLUB redzones and
  3926		 * cause false-positive reports. This does not lead to a performance
  3927		 * penalty on production builds, as slab_debug is not intended to be
  3928		 * enabled there.
  3929		 */
  3930		if (__slub_debug_enabled())
  3931			kasan_init = false;
  3932	
  3933		/*
  3934		 * As memory initialization might be integrated into KASAN,
  3935		 * kasan_slab_alloc and initialization memset must be
  3936		 * kept together to avoid discrepancies in behavior.
  3937		 *
  3938		 * As p[i] might get tagged, memset and kmemleak hook come after KASAN.
  3939		 */
  3940		for (i = 0; i < size; i++) {
  3941			p[i] = kasan_slab_alloc(s, p[i], init_flags, kasan_init);
  3942			if (p[i] && init && (!kasan_init ||
  3943					     !kasan_has_integrated_init()))
  3944				memset(p[i], 0, zero_size);
  3945			kmemleak_alloc_recursive(p[i], s->object_size, 1,
  3946						 s->flags, init_flags);
  3947			kmsan_slab_alloc(s, p[i], init_flags);
  3948			if (need_slab_obj_ext()) {
  3949				obj_exts = prepare_slab_obj_exts_hook(s, flags, p[i]);
  3950	#ifdef CONFIG_MEM_ALLOC_PROFILING
  3951				/*
  3952				 * Currently obj_exts is used only for allocation profiling.
  3953				 * If other users appear then mem_alloc_profiling_enabled()
  3954				 * check should be added before alloc_tag_add().
  3955				 */
  3956				if (likely(obj_exts))
  3957					alloc_tag_add(&obj_exts->ref, current->alloc_tag, s->size);
  3958	#endif
  3959			}
  3960		}
  3961	
  3962		memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
  3963	}
  3964	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
