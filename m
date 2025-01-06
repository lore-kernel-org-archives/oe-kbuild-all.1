Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3111DA63C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158152; cv=none; b=kw4LfVn+VdcUFvu+B8aDqdYEnvTEaA09LtYYR/cyRzAp8IscGGhKy0k/8OfPuM/WsnuTNWJuTiZWEW0rskJRQ5sZiHkLU0NFnwf8NUB+iUudemtVSs1YNvpYu3Da/JwYRwM49N70pdq9DRbpIXcwCoWi4fN6iM5IlVc4ROGgDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158152; c=relaxed/simple;
	bh=sEL7NksqZgZXuAEm9a2vntcgzwajolbt9hhD8Ehbcv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ8PpkjFROqLFNR0giOrz3R3JuAcn2flGowvtl5cod+Q32i9Ab1J6cuSe61c6pnqWYTqDq8yGPdz1BGr8zDWXqCyv5Cjgrx8QLqgbCi39wqWEcgcDwRSCgXTND9HKYQV7dfYuTloceK0GPKJyy4fEip8F6GwlS7PmI4nqo5WoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGt0bk7p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGt0bk7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736158151; x=1767694151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEL7NksqZgZXuAEm9a2vntcgzwajolbt9hhD8Ehbcv8=;
  b=XGt0bk7pwXGyBoyUcaqL72EsMnuJuhfJPgeL4fLy6i+EcS3wStxT7/Ke
   YAmX8vm8xBqQV6zoXfM0y8erNNWICnCEDciG0gnHEkeZFSxuPZhbIchGp
   Uk9tptPoIjkN6eQO26PosiZrab6L3TWFl2FeTzJNG2TYMeRj+9/+iSRnZ
   RGGTHvTllAf7iOr2rg1+moebuimJtTNlemIBcVjI3artvK6/m89UBq9Y9
   CEd9N70XqAVSbJHbUXRlqFdeEbJn0xlN5FkRIop70PWNFEIufUAw4t2Z+
   HAjyV5oHQiLGpEMx2i4XxO6JiZrQ+rjBQwVJTo8qZFfbdheZK0pEk31aT
   w==;
X-CSE-ConnectionGUID: MLCNciC/TXuBXpcUmLEyZw==
X-CSE-MsgGUID: o5CyFKV3TtuLgeD2UO4mgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36178051"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36178051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 02:08:00 -0800
X-CSE-ConnectionGUID: r8cLw7L4SKCzwa2GNg8UxA==
X-CSE-MsgGUID: IFzx8dRQSGCblnOYPgMMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102893843"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 02:07:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUk1X-000CTb-0m;
	Mon, 06 Jan 2025 10:07:51 +0000
Date: Mon, 6 Jan 2025 18:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-kernel@vger.kernel.org, ioworker0@gmail.com,
	david@redhat.com, ryan.roberts@arm.com, zhengtangquan@oppo.com,
	ying.huang@intel.com, kasong@tencent.com, chrisl@kernel.org,
	baolin.wang@linux.alibaba.com, Barry Song <v-songbaohua@oppo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <202501061736.FoHcInHJ-lkp@intel.com>
References: <20250106031711.82855-3-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106031711.82855-3-21cnbao@gmail.com>

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
config: riscv-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061736.FoHcInHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'set_tlb_ubc_flush_pending':
>> mm/rmap.c:685:9: error: too many arguments to function 'arch_tlbbatch_add_pending'
     685 |         arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/pgtable.h:113,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/rmap.c:55:
   arch/riscv/include/asm/tlbflush.h:62:6: note: declared here
      62 | void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_tlbbatch_add_pending +685 mm/rmap.c

   663	
   664	/*
   665	 * Bits 0-14 of mm->tlb_flush_batched record pending generations.
   666	 * Bits 16-30 of mm->tlb_flush_batched bit record flushed generations.
   667	 */
   668	#define TLB_FLUSH_BATCH_FLUSHED_SHIFT	16
   669	#define TLB_FLUSH_BATCH_PENDING_MASK			\
   670		((1 << (TLB_FLUSH_BATCH_FLUSHED_SHIFT - 1)) - 1)
   671	#define TLB_FLUSH_BATCH_PENDING_LARGE			\
   672		(TLB_FLUSH_BATCH_PENDING_MASK / 2)
   673	
   674	static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
   675					      unsigned long uaddr,
   676					      unsigned long size)
   677	{
   678		struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
   679		int batch;
   680		bool writable = pte_dirty(pteval);
   681	
   682		if (!pte_accessible(mm, pteval))
   683			return;
   684	
 > 685		arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
   686		tlb_ubc->flush_required = true;
   687	
   688		/*
   689		 * Ensure compiler does not re-order the setting of tlb_flush_batched
   690		 * before the PTE is cleared.
   691		 */
   692		barrier();
   693		batch = atomic_read(&mm->tlb_flush_batched);
   694	retry:
   695		if ((batch & TLB_FLUSH_BATCH_PENDING_MASK) > TLB_FLUSH_BATCH_PENDING_LARGE) {
   696			/*
   697			 * Prevent `pending' from catching up with `flushed' because of
   698			 * overflow.  Reset `pending' and `flushed' to be 1 and 0 if
   699			 * `pending' becomes large.
   700			 */
   701			if (!atomic_try_cmpxchg(&mm->tlb_flush_batched, &batch, 1))
   702				goto retry;
   703		} else {
   704			atomic_inc(&mm->tlb_flush_batched);
   705		}
   706	
   707		/*
   708		 * If the PTE was dirty then it's best to assume it's writable. The
   709		 * caller must use try_to_unmap_flush_dirty() or try_to_unmap_flush()
   710		 * before the page is queued for IO.
   711		 */
   712		if (writable)
   713			tlb_ubc->writable = true;
   714	}
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
