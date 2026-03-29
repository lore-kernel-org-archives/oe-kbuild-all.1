Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B0F31E822
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782649; cv=none; b=hxVARMog26QS83ONZJ9NtTQelgwNEtBREO8OZSmjrZn8gOjJ6qFgCeh61mIXlIziXocIITtJPh0g5C/21FzC3IxFEK9wSnl/vVMkhT+/10kThu7eq8WTdhSevxCIhko7ogk0QVyeSBYZBxhgu7tooOlCaYHjWFg3AiydMm6pN78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782649; c=relaxed/simple;
	bh=MUWehC6zCYW4cAnKQsgp35esVCOepJrsC3TRNFKUwZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKPJMTIvlsr8GVSTwm135P4qb7uwyLdGWRm48v9lBqHxawlAC8IIVnV1jI5xGj5EJpqqnjXCXtLr9B+I0r0tJS50Togtys/ZS5WQzybRFXjUle6YzQKAUud90KCQFQH0mugq5+QyaYpspKKgN1n+Y3unl9KRFukpokdH7NHbDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8Q/A5pX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8Q/A5pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774782648; x=1806318648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUWehC6zCYW4cAnKQsgp35esVCOepJrsC3TRNFKUwZE=;
  b=F8Q/A5pXMGdi/BeElDfxqE6JLCgwBo+D5IFfpqgl6elMVy8mFTUUhiiO
   tnWhrE46QdVguCroFlG2EwfkfDZtOR9lo63l2ebwDOPL8VTYjkEc3cjw9
   qGC3kocSOUXAfJ7lkUbLHmjDVQSx/dNPo0IqkIzZBZP2x9+Kr+0fQJSZZ
   jYnEW80CTB1AiWfz6IXSJQPFqctZwng7aPIsAEShQOEuJuIsmNfJ3j49A
   lCdG8YOwKKPpcFJhI8Cz3S8QzMfKScq3TfS1DCIoN4HBkaQ8grPMw/TTm
   m900bthxLwiYymHRETEeqa7/X5PFkURZrnCj/VZwDlxdV5a1ljxtnuQrJ
   g==;
X-CSE-ConnectionGUID: Lwp/UDJtRoCabM9DyQ/DXw==
X-CSE-MsgGUID: bygVgtpiQiKvtY5d9Myrcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93179804"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="93179804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:10:47 -0700
X-CSE-ConnectionGUID: xg+7iKEOS1u5jqySaqKt+g==
X-CSE-MsgGUID: Twpja17GSbSivtk87UES1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="229848129"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2026 04:10:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6o2T-00000000CJ5-1PLT;
	Sun, 29 Mar 2026 11:10:41 +0000
Date: Sun, 29 Mar 2026 19:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, bhe@redhat.com, baohua@kernel.org,
	chrisl@kernel.org, kasong@tencent.com, nphamcs@gmail.com,
	shikemeng@huaweicloud.com, youngjun.park@lge.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's
 methods
Message-ID: <202603291919.Y8MwFsok-lkp@intel.com>
References: <20260328075812.11060-3-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328075812.11060-3-21cnbao@gmail.com>

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-rename-mm-page_io-c-to-mm-swap_io-c/20260328-170852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260328075812.11060-3-21cnbao%40gmail.com
patch subject: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
config: um-randconfig-r072-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291919.Y8MwFsok-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291919.Y8MwFsok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291919.Y8MwFsok-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:7,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/um/asm/barrier.h:6,
                    from include/linux/list.h:11,
                    from include/linux/module.h:12,
                    from mm/zswap.c:16:
   mm/zswap.c: In function 'zswap_writeback_entry':
>> mm/zswap.c:1057:26: error: 'sis' undeclared (first use in this function); did you mean 'si'?
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |                          ^~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/mmdebug.h:123:37: note: in expansion of macro 'WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                     ^~~~~~~~~~~~
   mm/zswap.c:1057:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |         ^~~~~~~~~~~~~~~
   mm/zswap.c:1057:26: note: each undeclared identifier is reported only once for each function it appears in
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |                          ^~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/mmdebug.h:123:37: note: in expansion of macro 'WARN_ON_ONCE'
     123 | #define VM_WARN_ON_ONCE(cond) (void)WARN_ON_ONCE(cond)
         |                                     ^~~~~~~~~~~~
   mm/zswap.c:1057:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |         ^~~~~~~~~~~~~~~


vim +1057 mm/zswap.c

   971	
   972	/*********************************
   973	* writeback code
   974	**********************************/
   975	/*
   976	 * Attempts to free an entry by adding a folio to the swap cache,
   977	 * decompressing the entry data into the folio, and issuing a
   978	 * bio write to write the folio back to the swap device.
   979	 *
   980	 * This can be thought of as a "resumed writeback" of the folio
   981	 * to the swap device.  We are basically resuming the same swap
   982	 * writeback path that was intercepted with the zswap_store()
   983	 * in the first place.  After the folio has been decompressed into
   984	 * the swap cache, the compressed version stored by zswap can be
   985	 * freed.
   986	 */
   987	static int zswap_writeback_entry(struct zswap_entry *entry,
   988					 swp_entry_t swpentry)
   989	{
   990		struct xarray *tree;
   991		pgoff_t offset = swp_offset(swpentry);
   992		struct folio *folio;
   993		struct mempolicy *mpol;
   994		bool folio_was_allocated;
   995		struct swap_info_struct *si;
   996		int ret = 0;
   997	
   998		/* try to allocate swap cache folio */
   999		si = get_swap_device(swpentry);
  1000		if (!si)
  1001			return -EEXIST;
  1002	
  1003		mpol = get_task_policy(current);
  1004		folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, mpol,
  1005					       NO_INTERLEAVE_INDEX, &folio_was_allocated);
  1006		put_swap_device(si);
  1007		if (!folio)
  1008			return -ENOMEM;
  1009	
  1010		/*
  1011		 * Found an existing folio, we raced with swapin or concurrent
  1012		 * shrinker. We generally writeback cold folios from zswap, and
  1013		 * swapin means the folio just became hot, so skip this folio.
  1014		 * For unlikely concurrent shrinker case, it will be unlinked
  1015		 * and freed when invalidated by the concurrent shrinker anyway.
  1016		 */
  1017		if (!folio_was_allocated) {
  1018			ret = -EEXIST;
  1019			goto out;
  1020		}
  1021	
  1022		/*
  1023		 * folio is locked, and the swapcache is now secured against
  1024		 * concurrent swapping to and from the slot, and concurrent
  1025		 * swapoff so we can safely dereference the zswap tree here.
  1026		 * Verify that the swap entry hasn't been invalidated and recycled
  1027		 * behind our backs, to avoid overwriting a new swap folio with
  1028		 * old compressed data. Only when this is successful can the entry
  1029		 * be dereferenced.
  1030		 */
  1031		tree = swap_zswap_tree(swpentry);
  1032		if (entry != xa_load(tree, offset)) {
  1033			ret = -ENOMEM;
  1034			goto out;
  1035		}
  1036	
  1037		if (!zswap_decompress(entry, folio)) {
  1038			ret = -EIO;
  1039			goto out;
  1040		}
  1041	
  1042		xa_erase(tree, offset);
  1043	
  1044		count_vm_event(ZSWPWB);
  1045		if (entry->objcg)
  1046			count_objcg_events(entry->objcg, ZSWPWB, 1);
  1047	
  1048		zswap_entry_free(entry);
  1049	
  1050		/* folio is up to date */
  1051		folio_mark_uptodate(folio);
  1052	
  1053		/* move it to the tail of the inactive list after end_writeback */
  1054		folio_set_reclaim(folio);
  1055	
  1056		/* start writeback */
> 1057		VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
  1058		si->ops->write_folio(si, folio, NULL);
  1059	
  1060	out:
  1061		if (ret && ret != -EEXIST) {
  1062			swap_cache_del_folio(folio);
  1063			folio_unlock(folio);
  1064		}
  1065		folio_put(folio);
  1066		return ret;
  1067	}
  1068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
