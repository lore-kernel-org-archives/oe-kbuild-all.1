Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6B1474B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831424; cv=none; b=Ikein336l7RUCkubpNKWoDhi8gM0nFdiyOcRoIMNIPFXapStT4wtVd7j1luRcPJS48aAH+oFw5vdSBegZjzINuVZ+vmuossoTOx8ALbQFCkbhKQoqK+2yeqKcxeBcFjKdykCOz89QX/j1SGxXk5w9hyfp7qNgXy7b9Gp4jtZciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831424; c=relaxed/simple;
	bh=nlz+iY+N3S0OqIVHA4lu8uTt9Vva94day/C0beghGNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YurQir4lPpMQrFFietbW6DXi8f2ASidL4rTqvU7/W/n+akKZOzrCXhR2J0kpFAym6/9iHrhXeA+rZIvPDfy6CD1YYB8Xz90G0et+HSgS0hHOkAyTzW4P9JoX98QeGBgs/oJ8xWVZzMzgv4e9e+aX0iM/vi9ivUMa+3woFEbl1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5u7DOU5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5u7DOU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712831423; x=1744367423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlz+iY+N3S0OqIVHA4lu8uTt9Vva94day/C0beghGNA=;
  b=K5u7DOU508IfCl8x03UrSqQWbK8mptOwntk+PTjeiO4e2aB1VuZjM+C+
   Y9AVkOVoL7XPioapPgjpCDjf7GzRdAD5cf6Rtmjs3jvKUDnBUDiUrkWcx
   0FSpPvWhTpNto5QJayoblPf0PtblQjXVEf8qDaCyG/wUArB7mbBnUnXWS
   Gfwq9iKqylaqPHvolBy+CmKGth9LbW0Ai56YaKXUcjWpoiy8r6hhIwBYD
   h0hLVee0nyYTGCTZPSCbgCV2Y3pPJwLOcjGJedAu8wcvOusv+d4O6kA0u
   vY5wYkkTsDrdtSVWYAMExWMc2B0HfgyF8RWrxaTJbaIeNGxBSdUNfbnoV
   g==;
X-CSE-ConnectionGUID: a6BS2DdPQTeMCvFMDhJBQw==
X-CSE-MsgGUID: hGsbnKsHTHy/nidUe2vjkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25687924"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25687924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:30:22 -0700
X-CSE-ConnectionGUID: kKrzFTTtTLS4ZmMIVKWlTQ==
X-CSE-MsgGUID: 3oyi/tc6SJ2TPRGP6qBBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="44147800"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2024 03:30:19 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurhB-0008W5-1b;
	Thu, 11 Apr 2024 10:30:17 +0000
Date: Thu, 11 Apr 2024 18:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <v-songbaohua@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 364/372] mm/memory.c:4169:17: error: implicit
 declaration of function 'count_mthp_stat'
Message-ID: <202404111857.DIwPS1vz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
commit: 37a4ecbf36cbc84bb1aff0f9c81e58261f8826d9 [364/372] mm: add per-order mTHP swpin_refault counter
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111857.DIwPS1vz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111857.DIwPS1vz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111857.DIwPS1vz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_inline.h:8,
                    from mm/memory.c:45:
   include/linux/swap.h:565:6: warning: no previous prototype for 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^~~~~~~~~~~~
   mm/memory.c: In function 'do_swap_page':
>> mm/memory.c:4169:17: error: implicit declaration of function 'count_mthp_stat' [-Werror=implicit-function-declaration]
    4169 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_ANON_SWPIN_REFAULT);
         |                 ^~~~~~~~~~~~~~~
>> mm/memory.c:4169:53: error: 'MTHP_STAT_ANON_SWPIN_REFAULT' undeclared (first use in this function)
    4169 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_ANON_SWPIN_REFAULT);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4169:53: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/count_mthp_stat +4169 mm/memory.c

  3927	
  3928	/*
  3929	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  3930	 * but allow concurrent faults), and pte mapped but not yet locked.
  3931	 * We return with pte unmapped and unlocked.
  3932	 *
  3933	 * We return with the mmap_lock locked or unlocked in the same cases
  3934	 * as does filemap_fault().
  3935	 */
  3936	vm_fault_t do_swap_page(struct vm_fault *vmf)
  3937	{
  3938		struct vm_area_struct *vma = vmf->vma;
  3939		struct folio *swapcache, *folio = NULL;
  3940		struct page *page;
  3941		struct swap_info_struct *si = NULL;
  3942		rmap_t rmap_flags = RMAP_NONE;
  3943		bool need_clear_cache = false;
  3944		bool exclusive = false;
  3945		swp_entry_t entry;
  3946		pte_t pte;
  3947		vm_fault_t ret = 0;
  3948		void *shadow = NULL;
  3949		int nr_pages = 1;
  3950		unsigned long start_address = vmf->address;
  3951		pte_t *start_pte = vmf->pte;
  3952		bool any_swap_shared = false;
  3953	
  3954		if (!pte_unmap_same(vmf))
  3955			goto out;
  3956	
  3957		entry = pte_to_swp_entry(vmf->orig_pte);
  3958		if (unlikely(non_swap_entry(entry))) {
  3959			if (is_migration_entry(entry)) {
  3960				migration_entry_wait(vma->vm_mm, vmf->pmd,
  3961						     vmf->address);
  3962			} else if (is_device_exclusive_entry(entry)) {
  3963				vmf->page = pfn_swap_entry_to_page(entry);
  3964				ret = remove_device_exclusive_entry(vmf);
  3965			} else if (is_device_private_entry(entry)) {
  3966				if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
  3967					/*
  3968					 * migrate_to_ram is not yet ready to operate
  3969					 * under VMA lock.
  3970					 */
  3971					vma_end_read(vma);
  3972					ret = VM_FAULT_RETRY;
  3973					goto out;
  3974				}
  3975	
  3976				vmf->page = pfn_swap_entry_to_page(entry);
  3977				vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  3978						vmf->address, &vmf->ptl);
  3979				if (unlikely(!vmf->pte ||
  3980					     !pte_same(ptep_get(vmf->pte),
  3981								vmf->orig_pte)))
  3982					goto unlock;
  3983	
  3984				/*
  3985				 * Get a page reference while we know the page can't be
  3986				 * freed.
  3987				 */
  3988				get_page(vmf->page);
  3989				pte_unmap_unlock(vmf->pte, vmf->ptl);
  3990				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
  3991				put_page(vmf->page);
  3992			} else if (is_hwpoison_entry(entry)) {
  3993				ret = VM_FAULT_HWPOISON;
  3994			} else if (is_pte_marker_entry(entry)) {
  3995				ret = handle_pte_marker(vmf);
  3996			} else {
  3997				print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
  3998				ret = VM_FAULT_SIGBUS;
  3999			}
  4000			goto out;
  4001		}
  4002	
  4003		/* Prevent swapoff from happening to us. */
  4004		si = get_swap_device(entry);
  4005		if (unlikely(!si))
  4006			goto out;
  4007	
  4008		folio = swap_cache_get_folio(entry, vma, vmf->address);
  4009		if (folio)
  4010			page = folio_file_page(folio, swp_offset(entry));
  4011		swapcache = folio;
  4012	
  4013		if (!folio) {
  4014			if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
  4015			    __swap_count(entry) == 1) {
  4016				/*
  4017				 * Prevent parallel swapin from proceeding with
  4018				 * the cache flag. Otherwise, another thread may
  4019				 * finish swapin first, free the entry, and swapout
  4020				 * reusing the same entry. It's undetectable as
  4021				 * pte_same() returns true due to entry reuse.
  4022				 */
  4023				if (swapcache_prepare(entry)) {
  4024					/* Relax a bit to prevent rapid repeated page faults */
  4025					schedule_timeout_uninterruptible(1);
  4026					goto out;
  4027				}
  4028				need_clear_cache = true;
  4029	
  4030				/* skip swapcache */
  4031				folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0,
  4032							vma, vmf->address, false);
  4033				page = &folio->page;
  4034				if (folio) {
  4035					__folio_set_locked(folio);
  4036					__folio_set_swapbacked(folio);
  4037	
  4038					if (mem_cgroup_swapin_charge_folio(folio,
  4039								vma->vm_mm, GFP_KERNEL,
  4040								entry)) {
  4041						ret = VM_FAULT_OOM;
  4042						goto out_page;
  4043					}
  4044					mem_cgroup_swapin_uncharge_swap(entry);
  4045	
  4046					shadow = get_shadow_from_swap_cache(entry);
  4047					if (shadow)
  4048						workingset_refault(folio, shadow);
  4049	
  4050					folio_add_lru(folio);
  4051	
  4052					/* To provide entry to swap_read_folio() */
  4053					folio->swap = entry;
  4054					swap_read_folio(folio, true, NULL);
  4055					folio->private = NULL;
  4056				}
  4057			} else {
  4058				page = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
  4059							vmf);
  4060				if (page)
  4061					folio = page_folio(page);
  4062				swapcache = folio;
  4063			}
  4064	
  4065			if (!folio) {
  4066				/*
  4067				 * Back out if somebody else faulted in this pte
  4068				 * while we released the pte lock.
  4069				 */
  4070				vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  4071						vmf->address, &vmf->ptl);
  4072				if (likely(vmf->pte &&
  4073					   pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
  4074					ret = VM_FAULT_OOM;
  4075				goto unlock;
  4076			}
  4077	
  4078			/* Had to read the page from swap area: Major fault */
  4079			ret = VM_FAULT_MAJOR;
  4080			count_vm_event(PGMAJFAULT);
  4081			count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
  4082		} else if (PageHWPoison(page)) {
  4083			/*
  4084			 * hwpoisoned dirty swapcache pages are kept for killing
  4085			 * owner processes (which may be unknown at hwpoison time)
  4086			 */
  4087			ret = VM_FAULT_HWPOISON;
  4088			goto out_release;
  4089		}
  4090	
  4091		ret |= folio_lock_or_retry(folio, vmf);
  4092		if (ret & VM_FAULT_RETRY)
  4093			goto out_release;
  4094	
  4095		if (swapcache) {
  4096			/*
  4097			 * Make sure folio_free_swap() or swapoff did not release the
  4098			 * swapcache from under us.  The page pin, and pte_same test
  4099			 * below, are not enough to exclude that.  Even if it is still
  4100			 * swapcache, we need to check that the page's swap has not
  4101			 * changed.
  4102			 */
  4103			if (unlikely(!folio_test_swapcache(folio) ||
  4104				     page_swap_entry(page).val != entry.val))
  4105				goto out_page;
  4106	
  4107			/*
  4108			 * KSM sometimes has to copy on read faults, for example, if
  4109			 * page->index of !PageKSM() pages would be nonlinear inside the
  4110			 * anon VMA -- PageKSM() is lost on actual swapout.
  4111			 */
  4112			folio = ksm_might_need_to_copy(folio, vma, vmf->address);
  4113			if (unlikely(!folio)) {
  4114				ret = VM_FAULT_OOM;
  4115				folio = swapcache;
  4116				goto out_page;
  4117			} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
  4118				ret = VM_FAULT_HWPOISON;
  4119				folio = swapcache;
  4120				goto out_page;
  4121			}
  4122			if (folio != swapcache)
  4123				page = folio_page(folio, 0);
  4124	
  4125			/*
  4126			 * If we want to map a page that's in the swapcache writable, we
  4127			 * have to detect via the refcount if we're really the exclusive
  4128			 * owner. Try removing the extra reference from the local LRU
  4129			 * caches if required.
  4130			 */
  4131			if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
  4132			    !folio_test_ksm(folio) && !folio_test_lru(folio))
  4133				lru_add_drain();
  4134		}
  4135	
  4136		folio_throttle_swaprate(folio, GFP_KERNEL);
  4137	
  4138		/*
  4139		 * Back out if somebody else already faulted in this pte.
  4140		 */
  4141		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
  4142				&vmf->ptl);
  4143	
  4144		/* We hit large folios in swapcache */
  4145		if (start_pte && folio_test_large(folio) && folio_test_swapcache(folio)) {
  4146			int nr = folio_nr_pages(folio);
  4147			int idx = folio_page_idx(folio, page);
  4148			unsigned long folio_start = vmf->address - idx * PAGE_SIZE;
  4149			unsigned long folio_end = folio_start + nr * PAGE_SIZE;
  4150			pte_t *folio_ptep;
  4151			pte_t folio_pte;
  4152	
  4153			if (unlikely(folio_start < max(vmf->address & PMD_MASK, vma->vm_start)))
  4154				goto check_pte;
  4155			if (unlikely(folio_end > pmd_addr_end(vmf->address, vma->vm_end)))
  4156				goto check_pte;
  4157	
  4158			folio_ptep = vmf->pte - idx;
  4159			folio_pte = ptep_get(folio_ptep);
  4160			if (!is_swap_pte(folio_pte) || non_swap_entry(pte_to_swp_entry(folio_pte)) ||
  4161			    swap_pte_batch(folio_ptep, nr, folio_pte, &any_swap_shared) != nr)
  4162				goto check_pte;
  4163	
  4164			start_address = folio_start;
  4165			start_pte = folio_ptep;
  4166			nr_pages = nr;
  4167			entry = folio->swap;
  4168			page = &folio->page;
> 4169			count_mthp_stat(folio_order(folio), MTHP_STAT_ANON_SWPIN_REFAULT);
  4170		}
  4171	
  4172	check_pte:
  4173		if (unlikely(!vmf->pte || !pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
  4174			goto out_nomap;
  4175	
  4176		if (unlikely(!folio_test_uptodate(folio))) {
  4177			ret = VM_FAULT_SIGBUS;
  4178			goto out_nomap;
  4179		}
  4180	
  4181		/*
  4182		 * PG_anon_exclusive reuses PG_mappedtodisk for anon pages. A swap pte
  4183		 * must never point at an anonymous page in the swapcache that is
  4184		 * PG_anon_exclusive. Sanity check that this holds and especially, that
  4185		 * no filesystem set PG_mappedtodisk on a page in the swapcache. Sanity
  4186		 * check after taking the PT lock and making sure that nobody
  4187		 * concurrently faulted in this page and set PG_anon_exclusive.
  4188		 */
  4189		BUG_ON(!folio_test_anon(folio) && folio_test_mappedtodisk(folio));
  4190		BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page));
  4191	
  4192		/*
  4193		 * Check under PT lock (to protect against concurrent fork() sharing
  4194		 * the swap entry concurrently) for certainly exclusive pages.
  4195		 */
  4196		if (!folio_test_ksm(folio)) {
  4197			exclusive = pte_swp_exclusive(vmf->orig_pte);
  4198			if (folio != swapcache) {
  4199				/*
  4200				 * We have a fresh page that is not exposed to the
  4201				 * swapcache -> certainly exclusive.
  4202				 */
  4203				exclusive = true;
  4204			} else if (exclusive && folio_test_writeback(folio) &&
  4205				  data_race(si->flags & SWP_STABLE_WRITES)) {
  4206				/*
  4207				 * This is tricky: not all swap backends support
  4208				 * concurrent page modifications while under writeback.
  4209				 *
  4210				 * So if we stumble over such a page in the swapcache
  4211				 * we must not set the page exclusive, otherwise we can
  4212				 * map it writable without further checks and modify it
  4213				 * while still under writeback.
  4214				 *
  4215				 * For these problematic swap backends, simply drop the
  4216				 * exclusive marker: this is perfectly fine as we start
  4217				 * writeback only if we fully unmapped the page and
  4218				 * there are no unexpected references on the page after
  4219				 * unmapping succeeded. After fully unmapped, no
  4220				 * further GUP references (FOLL_GET and FOLL_PIN) can
  4221				 * appear, so dropping the exclusive marker and mapping
  4222				 * it only R/O is fine.
  4223				 */
  4224				exclusive = false;
  4225			}
  4226	
  4227			/* Reuse the whole large folio iff all entries are exclusive */
  4228			if (nr_pages > 1 && any_swap_shared)
  4229				exclusive = false;
  4230		}
  4231	
  4232		/*
  4233		 * Some architectures may have to restore extra metadata to the page
  4234		 * when reading from swap. This metadata may be indexed by swap entry
  4235		 * so this must be called before swap_free().
  4236		 */
  4237		arch_swap_restore(folio_swap(entry, folio), folio);
  4238	
  4239		/*
  4240		 * Remove the swap entry and conditionally try to free up the swapcache.
  4241		 * We're already holding a reference on the page but haven't mapped it
  4242		 * yet.
  4243		 */
  4244		swap_free_nr(entry, nr_pages);
  4245		if (should_try_to_free_swap(folio, vma, vmf->flags))
  4246			folio_free_swap(folio);
  4247	
  4248		folio_ref_add(folio, nr_pages - 1);
  4249		add_mm_counter(vma->vm_mm, MM_ANONPAGES, nr_pages);
  4250		add_mm_counter(vma->vm_mm, MM_SWAPENTS, -nr_pages);
  4251	
  4252		pte = mk_pte(page, vma->vm_page_prot);
  4253	
  4254		/*
  4255		 * Same logic as in do_wp_page(); however, optimize for pages that are
  4256		 * certainly not shared either because we just allocated them without
  4257		 * exposing them to the swapcache or because the swap entry indicates
  4258		 * exclusivity.
  4259		 */
  4260		if (!folio_test_ksm(folio) &&
  4261		    (exclusive || (folio_ref_count(folio) == nr_pages &&
  4262				   folio_nr_pages(folio) == nr_pages))) {
  4263			if (vmf->flags & FAULT_FLAG_WRITE) {
  4264				pte = maybe_mkwrite(pte_mkdirty(pte), vma);
  4265				vmf->flags &= ~FAULT_FLAG_WRITE;
  4266			}
  4267			rmap_flags |= RMAP_EXCLUSIVE;
  4268		}
  4269		flush_icache_pages(vma, page, nr_pages);
  4270		if (pte_swp_soft_dirty(vmf->orig_pte))
  4271			pte = pte_mksoft_dirty(pte);
  4272		if (pte_swp_uffd_wp(vmf->orig_pte))
  4273			pte = pte_mkuffd_wp(pte);
  4274	
  4275		/* ksm created a completely new copy */
  4276		if (unlikely(folio != swapcache && swapcache)) {
  4277			folio_add_new_anon_rmap(folio, vma, start_address);
  4278			folio_add_lru_vma(folio, vma);
  4279		} else {
  4280			folio_add_anon_rmap_ptes(folio, page, nr_pages, vma, start_address,
  4281						 rmap_flags);
  4282		}
  4283	
  4284		VM_BUG_ON(!folio_test_anon(folio) ||
  4285				(pte_write(pte) && !PageAnonExclusive(page)));
  4286		set_ptes(vma->vm_mm, start_address, start_pte, pte, nr_pages);
  4287		vmf->orig_pte = ptep_get(vmf->pte);
  4288		arch_do_swap_page(vma->vm_mm, vma, start_address, pte, pte);
  4289	
  4290		folio_unlock(folio);
  4291		if (folio != swapcache && swapcache) {
  4292			/*
  4293			 * Hold the lock to avoid the swap entry to be reused
  4294			 * until we take the PT lock for the pte_same() check
  4295			 * (to avoid false positives from pte_same). For
  4296			 * further safety release the lock after the swap_free
  4297			 * so that the swap count won't change under a
  4298			 * parallel locked swapcache.
  4299			 */
  4300			folio_unlock(swapcache);
  4301			folio_put(swapcache);
  4302		}
  4303	
  4304		if (vmf->flags & FAULT_FLAG_WRITE) {
  4305			ret |= do_wp_page(vmf);
  4306			if (ret & VM_FAULT_ERROR)
  4307				ret &= VM_FAULT_ERROR;
  4308			goto out;
  4309		}
  4310	
  4311		/* No need to invalidate - it was non-present before */
  4312		update_mmu_cache_range(vmf, vma, start_address, start_pte, nr_pages);
  4313	unlock:
  4314		if (vmf->pte)
  4315			pte_unmap_unlock(vmf->pte, vmf->ptl);
  4316	out:
  4317		/* Clear the swap cache pin for direct swapin after PTL unlock */
  4318		if (need_clear_cache)
  4319			swapcache_clear(si, entry);
  4320		if (si)
  4321			put_swap_device(si);
  4322		return ret;
  4323	out_nomap:
  4324		if (vmf->pte)
  4325			pte_unmap_unlock(vmf->pte, vmf->ptl);
  4326	out_page:
  4327		folio_unlock(folio);
  4328	out_release:
  4329		folio_put(folio);
  4330		if (folio != swapcache && swapcache) {
  4331			folio_unlock(swapcache);
  4332			folio_put(swapcache);
  4333		}
  4334		if (need_clear_cache)
  4335			swapcache_clear(si, entry);
  4336		if (si)
  4337			put_swap_device(si);
  4338		return ret;
  4339	}
  4340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
