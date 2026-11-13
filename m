Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589885;
	b=VMZSHjV2eTdClQYhNxm37r7/0EEzZpCUkM1AC+ItgWtIMhpaSyV/9EkyaC8e2DeS4i5f
	 n0I9LYt6+SquCRsIzQYwsR4KorQe2TdJUDwst1aU5h1QPpJYo7cgPf5WnzneChR/bqexb
	 jwuaK6nMmPdEdKSIUl8RzDrJwnqFr2PesCp5EmSMSZedJGt2RFwqyuxK9pJDSdODlfDhl
	 OIBmkmjuTUWXP/XhLBkggXsSOewEGBHT0LxKTPfD/kTBaJTRTLrDQjadl/Hk2Ku8Xo9id
	 SZFXmFa2IeuCG9+y5hOGYGkHaY6E7REIvvywJWjoBzqp6Y5AvdJkIFYbiCKOZkIfx+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589885;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eeySqJ6NUrXSgAYigTDXkgs9x3xogv1758TcVbxxaWs=;
	b=VZFC8r/DotjFxRB1uz+y0OTKJfl1lpPKFP4B45eXshtjfVK89i4vkF/ayywynPHLaIgW
	 SeqIRFNQ3SQ6atT6aMy2xGqzMFvY13b9X1AkRbDef2/GeyApvDVX+AGH46AFNUTj7s1t8
	 M7/O2CtpOkmyjLqwkTgW5IBvKOEv7kdjmbLfg+nZZL1H4v54dLIUPS8mKzmQVElGMDafX
	 qsJnnqfX0+6ESkD8ss4QhnlvcFAbkr1i/UpWHFChMqvm2biUH8G0RXOJqzJtdalOa08zp
	 5iBVrgRf2MCx7Z6k7HOP+syQ6VhW1rYg8UH1vLBjobC+8mXabPOgE4fbpxCASMelyFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QcM6XTBb;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D02606A32E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 17:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D02606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QcM6XTBb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794589884; x=1826125884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CgpZyVAyt+Qd7pZ3YLkFhQMR5yXckSnAKIR8/gt9wgA=;
  b=QcM6XTBbGgeQd5qUjrrYXZUmiFMAikZwwkEnC/h5jNH+vuSTXCh2YOr5
   LGSa+9h97dFt1UcSDCuGHqXKKWdEL0zjukm2EyXL7BnNdH+UXn9KSoVzB
   7dxe4gV/f12Mkw9mvhhvcGrew1fVqTC05yu17VsWyFCBUKZOwNpePE1w6
   aXFjGytvXZA81tIEBe9tyeoW3Xa3aVi9JDesDFigavPqY5oSmPziiPQBK
   aN9enMSiBc2/baMxxoiwRZtX5LwSrADyVG7soaM+kchJcveidTiIP/9GX
   ZU776gHxgdMD0WBejG2pylCOD7Hq95TWYto+kB8kylMicqntcWfYxaiMi
   A==;
X-CSE-ConnectionGUID: hfN41JqmTgGAX3LwBh+Y9Q==
X-CSE-MsgGUID: U4JjFz2CTve7+iTGW3I6uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3500239"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3500239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:11:23 -0800
X-CSE-ConnectionGUID: R/Etu5amTUaDe9kfeyWTEw==
X-CSE-MsgGUID: lFSp4hyoQT2vw8iR/tj7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8782953"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2026 09:11:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRuo1-000000013PL-1kla;
	Fri, 13 Nov 2026 17:11:17 +0000
Date: Sat, 14 Nov 2026 01:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
	david@kernel.org, hannes@cmpxchg.org, kasong@tencent.com
Cc: oe-kbuild-all@lists.linux.dev, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	baoquan.he@linux.dev, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	mhocko@kernel.org, baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: mglru: use pte_table_clamped_end() helper to
 calculate the end
Message-ID: <202611140137.58xBD8xH-lkp@intel.com>
References: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-mglru-use-pte_table_clamped_end-helper-to-calculate-the-end/20261112-191239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b2386c5da61f9a15e60daa421b033bc1e0bcdd41.1794481498.git.baolin.wang%40linux.alibaba.com
patch subject: [PATCH] mm: mglru: use pte_table_clamped_end() helper to calculate the end
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261114/202611140137.58xBD8xH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140137.58xBD8xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140137.58xBD8xH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'lru_gen_look_around':
>> mm/vmscan.c:4343:15: error: implicit declaration of function 'pte_table_clamped_end' [-Wimplicit-function-declaration]
    4343 |         end = pte_table_clamped_end(addr, vma->vm_end);
         |               ^~~~~~~~~~~~~~~~~~~~~


vim +/pte_table_clamped_end +4343 mm/vmscan.c

  4296	
  4297	/******************************************************************************
  4298	 *                          rmap/PT walk feedback
  4299	 ******************************************************************************/
  4300	
  4301	/*
  4302	 * This function exploits spatial locality when shrink_folio_list() walks the
  4303	 * rmap. It scans the adjacent PTEs of a young PTE and promotes hot pages. If
  4304	 * the scan was done cacheline efficiently, it adds the PMD entry pointing to
  4305	 * the PTE table to the Bloom filter. This forms a feedback loop between the
  4306	 * eviction and the aging.
  4307	 */
  4308	bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
  4309	{
  4310		int i;
  4311		bool dirty;
  4312		unsigned long start;
  4313		unsigned long end;
  4314		struct lru_gen_mm_walk *walk;
  4315		struct folio *last = NULL;
  4316		int young = nr;
  4317		pte_t *pte = pvmw->pte;
  4318		unsigned long addr = pvmw->address;
  4319		struct vm_area_struct *vma = pvmw->vma;
  4320		struct folio *folio = pfn_folio(pvmw->pfn);
  4321		struct mem_cgroup *memcg;
  4322		struct pglist_data *pgdat = folio_pgdat(folio);
  4323		struct lruvec *lruvec;
  4324		struct lru_gen_mm_state *mm_state;
  4325	
  4326		lockdep_assert_held(pvmw->ptl);
  4327		VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
  4328	
  4329		if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
  4330			return false;
  4331	
  4332		if (spin_is_contended(pvmw->ptl))
  4333			return true;
  4334	
  4335		/* exclude non-mm-backed VMAs containing anon pages from COW */
  4336		if (!vma_is_mm_backed(vma))
  4337			return true;
  4338	
  4339		/* avoid taking the LRU lock under the PTL when possible */
  4340		walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
  4341	
  4342		start = max(addr & PMD_MASK, vma->vm_start);
> 4343		end = pte_table_clamped_end(addr, vma->vm_end);
  4344	
  4345		if (end - start == PAGE_SIZE)
  4346			return true;
  4347	
  4348		if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
  4349			if (addr - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
  4350				end = start + MIN_LRU_BATCH * PAGE_SIZE;
  4351			else if (end - addr < MIN_LRU_BATCH * PAGE_SIZE / 2)
  4352				start = end - MIN_LRU_BATCH * PAGE_SIZE;
  4353			else {
  4354				start = addr - MIN_LRU_BATCH * PAGE_SIZE / 2;
  4355				end = addr + MIN_LRU_BATCH * PAGE_SIZE / 2;
  4356			}
  4357		}
  4358	
  4359		memcg = get_mem_cgroup_from_folio(folio);
  4360		lruvec = mem_cgroup_lruvec(memcg, pgdat);
  4361		mm_state = get_mm_state(lruvec);
  4362	
  4363		lazy_mmu_mode_enable();
  4364	
  4365		pte -= (addr - start) / PAGE_SIZE;
  4366	
  4367		for (i = 0, addr = start; addr != end;
  4368		     i += nr, pte += nr, addr += nr * PAGE_SIZE) {
  4369			unsigned long pfn;
  4370			pte_t ptent = ptep_get(pte);
  4371	
  4372			nr = 1;
  4373			pfn = get_pte_pfn(ptent, vma, addr, pgdat);
  4374			if (pfn == -1)
  4375				continue;
  4376	
  4377			folio = get_pfn_folio(pfn, memcg, pgdat);
  4378			if (!folio)
  4379				continue;
  4380	
  4381			if (folio_test_large(folio)) {
  4382				const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
  4383	
  4384				nr = folio_pte_batch_flags(folio, NULL, pte, &ptent,
  4385							   max_nr, FPB_MERGE_YOUNG_DIRTY);
  4386			}
  4387	
  4388			if (!test_and_clear_young_ptes_notify(vma, addr, pte, nr))
  4389				continue;
  4390	
  4391			if (last != folio) {
  4392				walk_update_folio(walk, vma, lruvec, last, dirty);
  4393	
  4394				last = folio;
  4395				dirty = false;
  4396			}
  4397	
  4398			if (pte_dirty(ptent))
  4399				dirty = true;
  4400	
  4401			young += nr;
  4402		}
  4403	
  4404		walk_update_folio(walk, vma, lruvec, last, dirty);
  4405	
  4406		lazy_mmu_mode_disable();
  4407	
  4408		/* feedback from rmap walkers to page table walkers */
  4409		if (mm_state && suitable_to_scan(i, young))
  4410			update_bloom_filter(mm_state, READ_ONCE(lruvec->lrugen.max_seq),
  4411					    pvmw->pmd);
  4412	
  4413		mem_cgroup_put(memcg);
  4414	
  4415		return true;
  4416	}
  4417	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
