Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048F41C307;
	Fri, 22 May 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460168; cv=none; b=twiRRhGyvwzJfv2EWzy3L7ow8ImTY2Nj+RKn185tFt1oXWk6aqdKvnWb7z19Uc1j5Epuj/GgLJU/RhOq2Ksr+A/BD+EgEKm277oOkC8yQXBKZbandBuE/oHPwHJUQab6cN+jpZzyMa9ezYmdb/iZKg9h3AVOJ8egeMImRdkLsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460168; c=relaxed/simple;
	bh=DlxbDb4SZlefabOJU2jtXr4/OddRb2k3jj6wjNgWpvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0BIxDPUbbPSqczJcYceTgXjLkFLeDQqhjUPJC7Yd5n7UesbumHnzePmufQUeekaQc8LQHTSb+YywypFdr9TXIrwO5Ry/I3YsnJL1ZCkB3IcojuFw18scp9rScYYQYBdHqtPO3BGO+rueLjvrBg2O6yx7da5pXwdZrquvYBk7i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHrHvjki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHrHvjki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640F91F000E9;
	Fri, 22 May 2026 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779460165;
	bh=DWn7bS7xQYbcdkvCx3KblzCl0rPLM9h158TSPP8Tg54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GHrHvjkiOmkRZM9ixd9uwv8EEG1pY16+fep9NZw9mKUJtjMy/tJTqexCiVmlyqVpJ
	 hKUiXINzAjfxl3vmuWJb0IJBtAREvJBZMMXWWE5kdkFN2Qf1rNCXKHBrXMr100Z4jF
	 WcXHxSJ0n/HBPwl81gvcqZEvs2oE8WX7utBEuaoS7WC4frd94zrZS/fx/32cdrgxrv
	 GuWhtBdBtWA/iO5lXji/YY/QHWjfG+8IzUFxTXGTA4VQtCB26+4ioRue6iCg6NINNu
	 PgKehxzIO5MSYAESXCTinNAkVyU1+BMerH7EaDc7+/MjTQQJ6pWziQOb8Nl6Q9pmn+
	 TcmtcRTs6QTlQ==
Date: Fri, 22 May 2026 15:29:21 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
Message-ID: <ahBoIhjy7tCbwjIA@lucifer>
References: <202605161217.1mPJ49Gv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605161217.1mPJ49Gv-lkp@intel.com>

On Sat, May 16, 2026 at 12:25:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d458a240344c4369bf6f3da203f2779515177738
> commit: 3a6455d56bd7c4cfb1ea35ddae052943065e338e mm: convert do_brk_flags() to use vma_flags_t
> date:   6 weeks ago
> config: alpha-randconfig-r121-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161217.1mPJ49Gv-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161217.1mPJ49Gv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 3a6455d56bd7 ("mm: convert do_brk_flags() to use vma_flags_t")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605161217.1mPJ49Gv-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
> >> mm/mprotect.c:700:43: sparse: sparse: cast from non-scalar
>    mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:475:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:475:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:468:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:468:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>
> vim +700 mm/mprotect.c
>
>    693
>    694	int
>    695	mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>    696		       struct vm_area_struct *vma, struct vm_area_struct **pprev,
>    697		       unsigned long start, unsigned long end, vm_flags_t newflags)
>    698	{
>    699		struct mm_struct *mm = vma->vm_mm;
>  > 700		const vma_flags_t old_vma_flags = READ_ONCE(vma->flags);

I think we can tolerate this, presumably because we're READ_ONCE()'ing, I don't
think it's helpful necessarily to cast away the sparse stuff here.

Cheers, Lorenzo

>    701		vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
>    702		long nrpages = (end - start) >> PAGE_SHIFT;
>    703		unsigned int mm_cp_flags = 0;
>    704		unsigned long charged = 0;
>    705		int error;
>    706
>    707		if (vma_is_sealed(vma))
>    708			return -EPERM;
>    709
>    710		if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags)) {
>    711			*pprev = vma;
>    712			return 0;
>    713		}
>    714
>    715		/*
>    716		 * Do PROT_NONE PFN permission checks here when we can still
>    717		 * bail out without undoing a lot of state. This is a rather
>    718		 * uncommon case, so doesn't need to be very optimized.
>    719		 */
>    720		if (arch_has_pfn_modify_check() &&
>    721		    vma_flags_test_any(&old_vma_flags, VMA_PFNMAP_BIT,
>    722				       VMA_MIXEDMAP_BIT) &&
>    723		    !vma_flags_test_any_mask(&new_vma_flags, VMA_ACCESS_FLAGS)) {
>    724			pgprot_t new_pgprot = vm_get_page_prot(newflags);
>    725
>    726			error = walk_page_range(current->mm, start, end,
>    727					&prot_none_walk_ops, &new_pgprot);
>    728			if (error)
>    729				return error;
>    730		}
>    731
>    732		/*
>    733		 * If we make a private mapping writable we increase our commit;
>    734		 * but (without finer accounting) cannot reduce our commit if we
>    735		 * make it unwritable again except in the anonymous case where no
>    736		 * anon_vma has yet to be assigned.
>    737		 *
>    738		 * hugetlb mapping were accounted for even if read-only so there is
>    739		 * no need to account for them here.
>    740		 */
>    741		if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
>    742			/* Check space limits when area turns into data. */
>    743			if (!may_expand_vm(mm, &new_vma_flags, nrpages) &&
>    744			    may_expand_vm(mm, &old_vma_flags, nrpages))
>    745				return -ENOMEM;
>    746			if (!vma_flags_test_any(&old_vma_flags,
>    747					VMA_ACCOUNT_BIT, VMA_WRITE_BIT, VMA_HUGETLB_BIT,
>    748					VMA_SHARED_BIT, VMA_NORESERVE_BIT)) {
>    749				charged = nrpages;
>    750				if (security_vm_enough_memory_mm(mm, charged))
>    751					return -ENOMEM;
>    752				vma_flags_set(&new_vma_flags, VMA_ACCOUNT_BIT);
>    753			}
>    754		} else if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
>    755			   vma_is_anonymous(vma) && !vma->anon_vma) {
>    756			vma_flags_clear(&new_vma_flags, VMA_ACCOUNT_BIT);
>    757		}
>    758
>    759		newflags = vma_flags_to_legacy(new_vma_flags);
>    760		vma = vma_modify_flags(vmi, *pprev, vma, start, end, &newflags);
>    761		if (IS_ERR(vma)) {
>    762			error = PTR_ERR(vma);
>    763			goto fail;
>    764		}
>    765		new_vma_flags = legacy_to_vma_flags(newflags);
>    766
>    767		*pprev = vma;
>    768
>    769		/*
>    770		 * vm_flags and vm_page_prot are protected by the mmap_lock
>    771		 * held in write mode.
>    772		 */
>    773		vma_start_write(vma);
>    774		vm_flags_reset_once(vma, newflags);
>    775		if (vma_wants_manual_pte_write_upgrade(vma))
>    776			mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
>    777		vma_set_page_prot(vma);
>    778
>    779		change_protection(tlb, vma, start, end, mm_cp_flags);
>    780
>    781		if (vma_flags_test(&old_vma_flags, VMA_ACCOUNT_BIT) &&
>    782		    !vma_flags_test(&new_vma_flags, VMA_ACCOUNT_BIT))
>    783			vm_unacct_memory(nrpages);
>    784
>    785		/*
>    786		 * Private VM_LOCKED VMA becoming writable: trigger COW to avoid major
>    787		 * fault on access.
>    788		 */
>    789		if (vma_flags_test(&new_vma_flags, VMA_WRITE_BIT)) {
>    790			const vma_flags_t mask =
>    791				vma_flags_and(&old_vma_flags, VMA_WRITE_BIT,
>    792					      VMA_SHARED_BIT, VMA_LOCKED_BIT);
>    793
>    794			if (vma_flags_same(&mask, VMA_LOCKED_BIT))
>    795				populate_vma_page_range(vma, start, end, NULL);
>    796		}
>    797
>    798		vm_stat_account(mm, vma_flags_to_legacy(old_vma_flags), -nrpages);
>    799		vm_stat_account(mm, newflags, nrpages);
>    800		perf_event_mmap(vma);
>    801		return 0;
>    802
>    803	fail:
>    804		vm_unacct_memory(charged);
>    805		return error;
>    806	}
>    807
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
