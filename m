Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748D1632E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861991; cv=none; b=FCSfRf2EwC8zSzghxh4lGB1ve6pmTCwpzwnSSER/Cg7T4X8oM0Okt/QnitMehrUu895+hfhkKVQJCwr9JsvzFH933Ohl6zMK87Rq7Kx6Vbxka2bPYaHyABNYut0jEccTBMlIGdxLcu0K4Uo6zs+E6o+mFY1YLqUSxzKmi6JSuNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861991; c=relaxed/simple;
	bh=yQAk/wpUmRrW7Mp06J2PW0VykFEHTzigl9+EkXsWMeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+9e2N9GZeDhTuVjKLJyZAkVow72SX7o8IlRZj6sUciFOjPGGYdZbtx6Ci0muo+YWLCq3INFPGn7BnPfvuqaWxZG5Q+ubiUcWVyJMU78c2K+hDzzq4ScBiOv4g8LcMMwBp8RAXirgK374pgvLX6xxJD/oxoSm1wcBda4wNnYu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnBZ6MGI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnBZ6MGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729861989; x=1761397989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQAk/wpUmRrW7Mp06J2PW0VykFEHTzigl9+EkXsWMeg=;
  b=QnBZ6MGIp8FvUukeqgPDSMMLGaw/T3omjZaa0c412zQCcntDyjdf00EB
   7h0DXAWtFFgQQExk+fCziAo6exsNERSJV8hO17e1Qb5DuILBN2wuQ/EOM
   sQGCQmMH8HRzUZT3fC0vdkalL23nYtUGTUR0HS699JFiu3yYlpYKFPG+N
   1MkO/x2R8XxooSHnJYDGjo731JGxXAYjogImyekszabvS5vy3CsRVGnMX
   V5asNuFMFr6nrfLjHYvou8iu3hxKe3VK5XF5tNENbXC11LKFAdJgnfNWF
   7dJMzl2YnVJRILjE7Wt0YYkkn0bj/XfmoQBrFjfmsaNgjo3mZeIeR52TV
   w==;
X-CSE-ConnectionGUID: DaWdfMk0TBectM0ony18hA==
X-CSE-MsgGUID: 6Zhl3wq9RmOesAZRQ59HDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="17160049"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="17160049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:13:07 -0700
X-CSE-ConnectionGUID: QamcFYyxRhWs4C8YkAJMXg==
X-CSE-MsgGUID: JcCIRCwrRDitcLtnoDhunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81222535"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2024 06:13:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4K7j-000YHY-1V;
	Fri, 25 Oct 2024 13:13:03 +0000
Date: Fri, 25 Oct 2024 21:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhao <yuzhao@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	James Houghton <jthoughton@google.com>
Subject: [linux-next:pending-fixes 301/373] mm/vmscan.c:3498: undefined
 reference to `pmdp_test_and_clear_young'
Message-ID: <202410252141.djLwbAYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   a06df994e3b96f0f6b97e5d2679c41f60d182bbe
commit: 1ee09e54a76f75dcf5d59737d81bec1624bf4764 [301/373] mm: multi-gen LRU: use {ptep,pmdp}_clear_young_notify()
config: i386-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252141.djLwbAYF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252141.djLwbAYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252141.djLwbAYF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/vmscan.o: in function `walk_pmd_range_locked':
>> mm/vmscan.c:3498: undefined reference to `pmdp_test_and_clear_young'


vim +3498 mm/vmscan.c

  3440	
  3441	static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
  3442					  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
  3443	{
  3444		int i;
  3445		pmd_t *pmd;
  3446		spinlock_t *ptl;
  3447		struct lru_gen_mm_walk *walk = args->private;
  3448		struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
  3449		struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
  3450		DEFINE_MAX_SEQ(walk->lruvec);
  3451		int old_gen, new_gen = lru_gen_from_seq(max_seq);
  3452	
  3453		VM_WARN_ON_ONCE(pud_leaf(*pud));
  3454	
  3455		/* try to batch at most 1+MIN_LRU_BATCH+1 entries */
  3456		if (*first == -1) {
  3457			*first = addr;
  3458			bitmap_zero(bitmap, MIN_LRU_BATCH);
  3459			return;
  3460		}
  3461	
  3462		i = addr == -1 ? 0 : pmd_index(addr) - pmd_index(*first);
  3463		if (i && i <= MIN_LRU_BATCH) {
  3464			__set_bit(i - 1, bitmap);
  3465			return;
  3466		}
  3467	
  3468		pmd = pmd_offset(pud, *first);
  3469	
  3470		ptl = pmd_lockptr(args->mm, pmd);
  3471		if (!spin_trylock(ptl))
  3472			goto done;
  3473	
  3474		arch_enter_lazy_mmu_mode();
  3475	
  3476		do {
  3477			unsigned long pfn;
  3478			struct folio *folio;
  3479	
  3480			/* don't round down the first address */
  3481			addr = i ? (*first & PMD_MASK) + i * PMD_SIZE : *first;
  3482	
  3483			if (pmd_present(pmd[i]) && !pmd_trans_huge(pmd[i])) {
  3484				if (!walk->force_scan && should_clear_pmd_young() &&
  3485				    !mm_has_notifiers(args->mm))
  3486					pmdp_test_and_clear_young(vma, addr, pmd + i);
  3487				goto next;
  3488			}
  3489	
  3490			pfn = get_pmd_pfn(pmd[i], vma, addr, pgdat);
  3491			if (pfn == -1)
  3492				goto next;
  3493	
  3494			folio = get_pfn_folio(pfn, memcg, pgdat, walk->can_swap);
  3495			if (!folio)
  3496				goto next;
  3497	
> 3498			if (!pmdp_clear_young_notify(vma, addr, pmd + i))
  3499				goto next;
  3500	
  3501			walk->mm_stats[MM_LEAF_YOUNG]++;
  3502	
  3503			if (pmd_dirty(pmd[i]) && !folio_test_dirty(folio) &&
  3504			    !(folio_test_anon(folio) && folio_test_swapbacked(folio) &&
  3505			      !folio_test_swapcache(folio)))
  3506				folio_mark_dirty(folio);
  3507	
  3508			old_gen = folio_update_gen(folio, new_gen);
  3509			if (old_gen >= 0 && old_gen != new_gen)
  3510				update_batch_size(walk, folio, old_gen, new_gen);
  3511	next:
  3512			i = i > MIN_LRU_BATCH ? 0 : find_next_bit(bitmap, MIN_LRU_BATCH, i) + 1;
  3513		} while (i <= MIN_LRU_BATCH);
  3514	
  3515		arch_leave_lazy_mmu_mode();
  3516		spin_unlock(ptl);
  3517	done:
  3518		*first = -1;
  3519	}
  3520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
