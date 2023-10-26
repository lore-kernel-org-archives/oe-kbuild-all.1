Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C15883A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnpUHTQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698324327; x=1729860327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tB1UvnL/BBKI4dYp1Pk77jnRcZ06AE1vQP71TSThmoQ=;
  b=YnpUHTQxxjEXlkHGdW1Aswpx5W9JjdpBd5OnwCCwlb1hHjQhCbSnBb8u
   ST/oqNqN+Y8tCkqCyPzSa7M9NwDuP8CqyZiFQe8Su17J2WQmXNALL4ylc
   8LmApY24k55g4mg952GjrL7ce1ZQH2ITJ1G9clsYRmjh+b5A8dc0HuSOP
   ificU6txRxAj0iUKmC2FvhX5pcwAd6WrGsJovR0HWD6mIeTQY3kr47jxo
   KSs3+pTjh7TpJhmdELYY9HuI8b6DMkvcwoXYyotNYb3qnuDHGWw3fMgwe
   NWvPXC+nu8RyjNUJ7IIZev1GMo5q7kznuCyJ3sYXasj82giDg2tqHHiZK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366877658"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="366877658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 05:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="709061069"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="709061069"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2023 05:45:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvzji-0009mt-2O;
	Thu, 26 Oct 2023 12:45:18 +0000
Date: Thu, 26 Oct 2023 20:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Ene <sebastianene@google.com>, will@kernel.org,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	akpm@linux-foundation.org, maz@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	vdonnefort@google.com, qperret@google.com, smostafa@google.com,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 01/11] KVM: arm64: Add snap shooting the host stage-2
 pagetables
Message-ID: <202310262036.TVwm0bsI-lkp@intel.com>
References: <20231019144032.2943044-3-sebastianene@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019144032.2943044-3-sebastianene@google.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on kvmarm/next akpm-mm/mm-everything linus/master v6.6-rc7 next-20231025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Ene/KVM-arm64-Add-snap-shooting-the-host-stage-2-pagetables/20231019-224346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231019144032.2943044-3-sebastianene%40google.com
patch subject: [PATCH v2 01/11] KVM: arm64: Add snap shooting the host stage-2 pagetables
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231026/202310262036.TVwm0bsI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262036.TVwm0bsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262036.TVwm0bsI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function '__pkvm_host_stage2_prepare_copy':
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:335:13: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
     335 |         u64 nr_pages;
         |             ^~~~~~~~


vim +/nr_pages +335 arch/arm64/kvm/hyp/nvhe/mem_protect.c

   326	
   327	int __pkvm_host_stage2_prepare_copy(struct kvm_pgtable_snapshot *snapshot)
   328	{
   329		size_t required_pgd_len;
   330		struct kvm_pgtable_mm_ops mm_ops = {0};
   331		struct kvm_pgtable *to_pgt, *from_pgt = &host_mmu.pgt;
   332		struct kvm_hyp_memcache *memcache = &snapshot->mc;
   333		int ret;
   334		void *pgd;
 > 335		u64 nr_pages;
   336	
   337		required_pgd_len = kvm_pgtable_stage2_pgd_size(host_mmu.arch.vtcr);
   338		if (snapshot->pgd_len < required_pgd_len)
   339			return -ENOMEM;
   340	
   341		to_pgt = &snapshot->pgtable;
   342		nr_pages = snapshot->pgd_len / PAGE_SIZE;
   343		pgd = kern_hyp_va(snapshot->pgd_hva);
   344	
   345		hyp_spin_lock(&snapshot_pool_lock);
   346		hyp_pool_init(&snapshot_pool, hyp_virt_to_pfn(pgd),
   347			      required_pgd_len / PAGE_SIZE, 0);
   348	
   349		mm_ops.zalloc_pages_exact	= snapshot_zalloc_pages_exact;
   350		mm_ops.zalloc_page		= snapshot_zalloc_page;
   351		mm_ops.free_pages_exact		= snapshot_s2_free_pages_exact;
   352		mm_ops.get_page			= snapshot_get_page;
   353		mm_ops.phys_to_virt		= hyp_phys_to_virt;
   354		mm_ops.virt_to_phys		= hyp_virt_to_phys;
   355		mm_ops.page_count		= hyp_page_count;
   356	
   357		to_pgt->ia_bits		= from_pgt->ia_bits;
   358		to_pgt->start_level	= from_pgt->start_level;
   359		to_pgt->flags		= from_pgt->flags;
   360		to_pgt->mm_ops		= &mm_ops;
   361	
   362		host_lock_component();
   363		ret = kvm_pgtable_stage2_copy(to_pgt, from_pgt, memcache);
   364		host_unlock_component();
   365	
   366		hyp_spin_unlock(&snapshot_pool_lock);
   367	
   368		return ret;
   369	}
   370	#endif /* CONFIG_NVHE_EL2_DEBUG */
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
