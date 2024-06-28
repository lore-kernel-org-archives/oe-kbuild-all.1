Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99491BF307
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584304; cv=none; b=JSJS6kwK6OixFO9ukBfpVV+yvg3JG1fqKBfDULZ4zVqxbfQAop83+zDpkR8+rT21edM6FN4KEksInnVOtewFf86U3tgqpzIKUkvFT1TnMlB9u5DnjNkXFCg7HHQoH9F5COPG7IwR3A76O3ITMTNzfYJCHONe8D60aNMad4IK6E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584304; c=relaxed/simple;
	bh=sZbVuLL5cjk7F+ZbdaaAGtmqZGhPeMp9mCHQuD9k5kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqMgkKYpHkm9C7bI7YGhSPVWcUwxcH8bhUvenvDhR/gZbMTjglGZEzPwqI6zf6Ez3LuJ6pVrrLq89oBan2U5n9TjAia7/6g6dNXVA04u2kTwK8KfIHbVW6/JLGvvhbR8uAcsAVikQJGzDXlho8AODFUyBo9lASX4pvnygqmj+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0rUyPDf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0rUyPDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719584302; x=1751120302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZbVuLL5cjk7F+ZbdaaAGtmqZGhPeMp9mCHQuD9k5kY=;
  b=L0rUyPDfUpP1tRRLD4SUCpahcEYnIbOBES0R2rsEuKpqT8QC5PaK5S7z
   ZLZx6Fng3ZmlPI1SJDmpkKU9h5xiKVDru9FyRg93cUkjpVFsjDUssJFi1
   i9yjRKN4TR8F1Azc+92b/o5yguia0ex9mYIALMYXae54q1InV+8dSfCZ5
   7UXy65w9229yKqL3oct/tXm2f197SFmROIlyIkyUSJFSroYUoFA2CrS2f
   ye+iS6DC80TJXStwu8e8L7NvLbyA8/KA79LE1AIv1LyZSvCUS7WL1iafy
   Fs8cs8e9HfTCnVN464gplkgZPcQqlqsAgQvHJAGGBmLAEMDBRmGqrJriE
   w==;
X-CSE-ConnectionGUID: PjFjtn/STeiF/vrf/KK7Tg==
X-CSE-MsgGUID: vPjRgTe7Q/SNZZEuUtcCjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34212457"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="34212457"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 07:18:22 -0700
X-CSE-ConnectionGUID: kHGYL9XsT12d2cISy8ABsg==
X-CSE-MsgGUID: ojMdz6QjTRG8Sg8apClqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44806971"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 07:18:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNCQb-000HCG-1X;
	Fri, 28 Jun 2024 14:18:17 +0000
Date: Fri, 28 Jun 2024 22:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_follow_pfn 71/92] arch/loongarch/kvm/mmu.c:538:19:
 warning: variable 'pfn' set but not used
Message-ID: <202406282213.DHehgiXG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   ddc17683711a347aaff45e1e0b178742df18ff4d
commit: 1af2c685c0bdb83d647fa1921446b1ce7a5bd420 [71/92] KVM: LoongArch: Mark "struct page" pfns accessed only in "slow" page fault path
config: loongarch-randconfig-002-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282213.DHehgiXG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282213.DHehgiXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282213.DHehgiXG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kvm/mmu.c: In function 'kvm_map_page_fast':
>> arch/loongarch/kvm/mmu.c:538:19: warning: variable 'pfn' set but not used [-Wunused-but-set-variable]
     538 |         kvm_pfn_t pfn = 0;
         |                   ^~~


vim +/pfn +538 arch/loongarch/kvm/mmu.c

752e2cd7b4fb41 Tianrui Zhao        2023-10-02  519  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  520  /*
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  521   * kvm_map_page_fast() - Fast path GPA fault handler.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  522   * @vcpu:		vCPU pointer.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  523   * @gpa:		Guest physical address of fault.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  524   * @write:	Whether the fault was due to a write.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  525   *
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  526   * Perform fast path GPA fault handling, doing all that can be done without
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  527   * calling into KVM. This handles marking old pages young (for idle page
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  528   * tracking), and dirtying of clean pages (for dirty page logging).
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  529   *
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  530   * Returns:	0 on success, in which case we can update derived mappings and
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  531   *		resume guest execution.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  532   *		-EFAULT on failure due to absent GPA mapping or write to
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  533   *		read-only page, in which case KVM must be consulted.
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  534   */
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  535  static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  536  {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  537  	int ret = 0;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02 @538  	kvm_pfn_t pfn = 0;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  539  	kvm_pte_t *ptep, changed, new;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  540  	gfn_t gfn = gpa >> PAGE_SHIFT;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  541  	struct kvm *kvm = vcpu->kvm;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  542  	struct kvm_memory_slot *slot;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  543  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  544  	spin_lock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  545  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  546  	/* Fast path - just check GPA page table for an existing entry */
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  547  	ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  548  	if (!ptep || !kvm_pte_present(NULL, ptep)) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  549  		ret = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  550  		goto out;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  551  	}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  552  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  553  	/* Track access to pages marked old */
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  554  	new = *ptep;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  555  	if (!kvm_pte_young(new))
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  556  		new = kvm_pte_mkyoung(new);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  557  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  558  	if (write && !kvm_pte_dirty(new)) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  559  		if (!kvm_pte_write(new)) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  560  			ret = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  561  			goto out;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  562  		}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  563  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  564  		if (kvm_pte_huge(new)) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  565  			/*
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  566  			 * Do not set write permission when dirty logging is
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  567  			 * enabled for HugePages
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  568  			 */
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  569  			slot = gfn_to_memslot(kvm, gfn);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  570  			if (kvm_slot_dirty_track_enabled(slot)) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  571  				ret = -EFAULT;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  572  				goto out;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  573  			}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  574  		}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  575  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  576  		/* Track dirtying of writeable pages */
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  577  		new = kvm_pte_mkdirty(new);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  578  	}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  579  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  580  	changed = new ^ (*ptep);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  581  	if (changed) {
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  582  		kvm_set_pte(ptep, new);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  583  		pfn = kvm_pte_pfn(new);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  584  	}
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  585  	spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  586  
5e9e03b1cc2310 Sean Christopherson 2024-06-25  587  	if (kvm_pte_dirty(changed))
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  588  		mark_page_dirty(kvm, gfn);
5e9e03b1cc2310 Sean Christopherson 2024-06-25  589  
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  590  	return ret;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  591  out:
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  592  	spin_unlock(&kvm->mmu_lock);
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  593  	return ret;
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  594  }
752e2cd7b4fb41 Tianrui Zhao        2023-10-02  595  

:::::: The code at line 538 was first introduced by commit
:::::: 752e2cd7b4fb412f3e008493e0195e357bab9773 LoongArch: KVM: Implement kvm mmu operations

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
