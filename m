Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206063F4A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRzLjD9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698183337; x=1729719337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UsLkofQpr0is9FkmEdIno2YOLRQ0sGvh2EeoPyFSwjs=;
  b=TRzLjD9oGuFhLdUDM7OddrmIWdn1PX43cHSCXxBO7MAK9fz2mGtrLzqB
   HKfHOXD/TvYE8TlnHwzDSjD62Isek85khwTWDS8XKhXWmPi+40P/3Z0mB
   V/wPVqT+mz+mkRlYB8H2JV4bhjUoI3hqlChy28HFjlQTq9BKs2ynTP+U6
   0Ers08Xgp8NWxgUUCDZ4P2kT41oyLEH7kVqxr3G+o9guoa5yzCDNMeDTv
   zf3/giOeeh62NHnUbis4mGiMZ9aWDA67Pqu2oQQDDqxjiSlLx233RClus
   Y4ZG6P3PJ8DZR0QNhcCJzeNfcz1qz1ISp6esA67/Yzji/sgnfMW5Wrr/S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8732914"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="8732914"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 14:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="849281051"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="849281051"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2023 14:35:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvP3e-0008JX-0G;
	Tue, 24 Oct 2023 21:35:26 +0000
Date: Wed, 25 Oct 2023 05:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org
Subject: Re: [PATCH v2 07/39] mm: introduce slabobj_ext to support slab
 object extensions
Message-ID: <202310250525.bOmTMth1-lkp@intel.com>
References: <20231024134637.3120277-8-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024134637.3120277-8-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on kees/for-next/hardening linus/master v6.6-rc7]
[cannot apply to akpm-mm/mm-everything next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20231024-215116
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231024134637.3120277-8-surenb%40google.com
patch subject: [PATCH v2 07/39] mm: introduce slabobj_ext to support slab object extensions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250525.bOmTMth1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250525.bOmTMth1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250525.bOmTMth1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
   mm/slab.h: In function 'slab_post_alloc_hook':
>> mm/slab.h:778:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
     778 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~


vim +/obj_exts +778 mm/slab.h

   771	
   772	static inline void slab_post_alloc_hook(struct kmem_cache *s,
   773						struct obj_cgroup *objcg, gfp_t flags,
   774						size_t size, void **p, bool init,
   775						unsigned int orig_size)
   776	{
   777		unsigned int zero_size = s->object_size;
 > 778		struct slabobj_ext *obj_exts;
   779		bool kasan_init = init;
   780		size_t i;
   781	
   782		flags &= gfp_allowed_mask;
   783	
   784		/*
   785		 * For kmalloc object, the allocated memory size(object_size) is likely
   786		 * larger than the requested size(orig_size). If redzone check is
   787		 * enabled for the extra space, don't zero it, as it will be redzoned
   788		 * soon. The redzone operation for this extra space could be seen as a
   789		 * replacement of current poisoning under certain debug option, and
   790		 * won't break other sanity checks.
   791		 */
   792		if (kmem_cache_debug_flags(s, SLAB_STORE_USER | SLAB_RED_ZONE) &&
   793		    (s->flags & SLAB_KMALLOC))
   794			zero_size = orig_size;
   795	
   796		/*
   797		 * When slub_debug is enabled, avoid memory initialization integrated
   798		 * into KASAN and instead zero out the memory via the memset below with
   799		 * the proper size. Otherwise, KASAN might overwrite SLUB redzones and
   800		 * cause false-positive reports. This does not lead to a performance
   801		 * penalty on production builds, as slub_debug is not intended to be
   802		 * enabled there.
   803		 */
   804		if (__slub_debug_enabled())
   805			kasan_init = false;
   806	
   807		/*
   808		 * As memory initialization might be integrated into KASAN,
   809		 * kasan_slab_alloc and initialization memset must be
   810		 * kept together to avoid discrepancies in behavior.
   811		 *
   812		 * As p[i] might get tagged, memset and kmemleak hook come after KASAN.
   813		 */
   814		for (i = 0; i < size; i++) {
   815			p[i] = kasan_slab_alloc(s, p[i], flags, kasan_init);
   816			if (p[i] && init && (!kasan_init || !kasan_has_integrated_init()))
   817				memset(p[i], 0, zero_size);
   818			kmemleak_alloc_recursive(p[i], s->object_size, 1,
   819						 s->flags, flags);
   820			kmsan_slab_alloc(s, p[i], flags);
   821			obj_exts = prepare_slab_obj_exts_hook(s, flags, p[i]);
   822		}
   823	
   824		memcg_slab_post_alloc_hook(s, objcg, flags, size, p);
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
