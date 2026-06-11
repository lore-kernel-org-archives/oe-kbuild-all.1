Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EA31326A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 21:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214299; cv=none; b=bSeoumMKsh2GLQHPCM2V31CvEkBrg6WO7R656aUNq20bs8JLCpEugkDRLFmw0Q/EpIxUwqnkpH3FLECJ1GvwkSsLqelltTXmTqr5c/EFCxdqAmwO59HQUW5NG4VWoccDSAZjdxV94b5ucqU5HNVWtqDeT8njbF3QQSG/jFttdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214299; c=relaxed/simple;
	bh=xs0PydvvPOOcDY7WetkN1Zjs8LHkSYLtIwNRGZQ/eOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZiSElbgIZpQSN3Z0tCBDkHwqMZ8HAq71/kmUM3y3LGxZQGYEvewtw/z1+e7Zjg1tjld83292NhIIyzLAozldb0yuRdECw4fphF39AXsST+ew7jOVGs/14ZadVfd+7ht9xihxzWXSiRZHjBvs6L0TMZMoVtaLG6tuOCxsrqsF63c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHHRwkPO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHHRwkPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781214298; x=1812750298;
  h=date:from:to:cc:subject:message-id;
  bh=xs0PydvvPOOcDY7WetkN1Zjs8LHkSYLtIwNRGZQ/eOY=;
  b=nHHRwkPO9ahyK1930PNVd8yfdvyiiqPaoEp86cwa3ckJiHWmy42UFdI2
   uAXQOhidYdOo4dCjMIZ74Avw/6VA8z8lTZtcE5qai4pymQi5sjQ2JN8cF
   WVAeTsz/nEqd2u42k6Om5+aRMgfZG42BqoGXERAVopx3elf+U/8ldEQHr
   ML0hpH0MppVA903sG7sDOXnFOmNVr32HDgVt+D05/YNgRAEhpztP/rD+l
   sSpJUcWiyMZiL3ch+Qq8alxSInAOJVqrtpTdoDQQj8JUvhSe/k0p8RZcJ
   tHJ6J8j6QAQkJfKL0+9hysGF16PLlyi9qQ708/8X0vVd5ytAzFjH1a1a9
   g==;
X-CSE-ConnectionGUID: VcbHqnjySB61GMV50SPkdA==
X-CSE-MsgGUID: 2IRgt6W+Q9uA+vSBCGmCjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84611261"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="84611261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 14:44:57 -0700
X-CSE-ConnectionGUID: s+36o0gqSPu9OiH7HJV9pQ==
X-CSE-MsgGUID: 8BQ4ketkTLatQuwbikgvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270285577"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 14:44:56 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnCo-00000000469-1sWJ;
	Thu, 11 Jun 2026 21:44:54 +0000
Date: Thu, 11 Jun 2026 23:44:25 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Subject: [sean-jc:x86/gmem_inplace 35/59]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1204:24: error: implicit
 declaration of function 'kvm_range_has_vm_memory_attributes'; did you mean
 'kvm_mmu_init_memslot_memory_attributes'?
Message-ID: <202606112317.QXdubdUx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   4f91d40d3e6c3ca162bc7b3e94384b3b8c4c4443
commit: 3b494d9b05174562830962ea9e49aff75fde974f [35/59] KVM: Let userspace disable per-VM mem attributes, enable per-gmem attributes
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260611/202606112317.QXdubdUx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112317.QXdubdUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112317.QXdubdUx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_range_is_private':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1204:24: error: implicit declaration of function 'kvm_range_has_vm_memory_attributes'; did you mean 'kvm_mmu_init_memslot_memory_attributes'? [-Wimplicit-function-declaration]
    1204 |                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        kvm_mmu_init_memslot_memory_attributes


vim +1204 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

1f6c06b177513e Paolo Bonzini       2024-02-14  1196  
36cf63bb5df688 Fuad Tabba          2025-07-29  1197  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
3338335299abe8 Sean Christopherson 2026-06-10  1198  static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
3338335299abe8 Sean Christopherson 2026-06-10  1199  				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
3338335299abe8 Sean Christopherson 2026-06-10  1200  {
3338335299abe8 Sean Christopherson 2026-06-10  1201  	struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
3338335299abe8 Sean Christopherson 2026-06-10  1202  
3338335299abe8 Sean Christopherson 2026-06-10  1203  	if (!gmem_in_place_conversion)
3338335299abe8 Sean Christopherson 2026-06-10 @1204  		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
3338335299abe8 Sean Christopherson 2026-06-10  1205  							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
3338335299abe8 Sean Christopherson 2026-06-10  1206  							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
3338335299abe8 Sean Christopherson 2026-06-10  1207  
e4f7252dca71e1 Ackerley Tng        2026-04-23  1208  	return kvm_gmem_range_has_attributes(mt, index, nr_pages,
e4f7252dca71e1 Ackerley Tng        2026-04-23  1209  					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
3338335299abe8 Sean Christopherson 2026-06-10  1210  }
2a62345b30529e Michael Roth        2026-01-08  1211  

:::::: The code at line 1204 was first introduced by commit
:::::: 3338335299abe867f2a5d5b207df57edba03b5f1 KVM: guest_memfd: Wire up kvm_get_memory_attributes() to per-gmem attributes

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
