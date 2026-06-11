Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581336CDE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208581; cv=none; b=V4FLpK9TKMgHx1iKV2ud8UIEkwFtq0hU9fBgGf7P5gMzmXSDaNbzsj9zg7/+pU8Wj0daS/gyrRSnIBLFwV7SbMgdEhspN4BPygp9DPjbiFEnhQRnyG7B4cY8fXY32Q8SDaEIF39Vz1vrPNE26f7OKh7fKrpx/4EEhaodWarmR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208581; c=relaxed/simple;
	bh=j+O3pwkynm5+JCHNuwyrFeLubgA0tkP/19Tz2BY31bg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C/BgesVK510g27rPgbLaOY8KQ5udTDtHpOK9w3pE+mHdZ1EfKU8kC/J1u1BUWxALCRp1BOu3b5keswKP9NXEeqaM0EVZNNuWGtT47Ak0mGSnUBhU8BIzan5mdQYlga33LOTa0iezpBao2SXKwhXD/lN4uEDWXIfswJCn1LN1NHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqYwNHHh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqYwNHHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781208580; x=1812744580;
  h=date:from:to:cc:subject:message-id;
  bh=j+O3pwkynm5+JCHNuwyrFeLubgA0tkP/19Tz2BY31bg=;
  b=JqYwNHHh7BQKuoMQJjoKPrz4CSYTix3RPX+NtAeIiyXqGccC7RCATdGJ
   mW7jCfO66Cxp2ITZuHwnERugkTl7nbrVV/DAuEVFxmI1xJcdP5EYck+IL
   UgZAk/YvPSPRP9soYr+Bfi+iLN4OH6wNk/m7mbA+rpE/A0d3c0S2/BT5T
   nx3qR5TiLUn+j+Ko9AUZ6oLeHMqliT47sIkVTbzPLsPR2KCWNZixQmft9
   6A4FE145s4Y9BDtUaCN0XHH2Z72DOSZtiSEjbztGPV/pjROeAN9bVVj5j
   C1qi3eJYNAEdrOmO9OyxxuoRmsa5PtHxiKWRMB6MvNJ6du17ZeJ5uHpmy
   A==;
X-CSE-ConnectionGUID: 4m5Oxq+BSZmlYZzR44yXlg==
X-CSE-MsgGUID: H/HYCob+R461E7h3pBOFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99612860"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99612860"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:09:39 -0700
X-CSE-ConnectionGUID: 3FFb4aaMQuW20nYz1n2M3Q==
X-CSE-MsgGUID: 0UJc5oCOQhazZ4IjGCdYpA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 13:09:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXliZ-00000000NoT-3N3i;
	Thu, 11 Jun 2026 20:09:35 +0000
Date: Fri, 12 Jun 2026 04:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Subject: [sean-jc:x86/gmem_inplace 35/59]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1204:24: error: implicit
 declaration of function 'kvm_range_has_vm_memory_attributes'; did you mean
 'kvm_mmu_init_memslot_memory_attributes'?
Message-ID: <202606120453.WtQJbXSH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   6e882d8de05edd03686f68396c4ab861b7814c4b
commit: 3b494d9b05174562830962ea9e49aff75fde974f [35/59] KVM: Let userspace disable per-VM mem attributes, enable per-gmem attributes
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260612/202606120453.WtQJbXSH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120453.WtQJbXSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120453.WtQJbXSH-lkp@intel.com/

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
