Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85181233D88
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766137570; cv=none; b=Gy6tnkPiKyFRQlLjDbZwX/UAeqHfscWyMZsyQlhuxuF9s4OTT8logReBJw6AjorXCRk5IF/iaJdFOF8lmqvkQFfhzRvoBTco88CrzjmuN4JkmNY4vYkcmuKFTKON3AQQ+3+NqlWQWoU8OZV88rlfCg/JIWvtA8+HNVLgVUnIVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766137570; c=relaxed/simple;
	bh=bKbW+c3COgn6ebtaQJkJdPNDfqwRujqoYDBL35Pflnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKsmu9ZSjL5j+x7bpNze/m+kIvPkZ/n9297usOk+gCk6m8fg5VQX0zDr9mqkCkxMjh5RjrHW8S7hg0Conc52OHNJsjjLUa1ylbnXk6lYtsZb6A2QRSrGkeIQO/SFUQChZQ2qOwLOkRmXKDitLLHP1IueOQ6eu4hrcljSBcOic8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLAUTjpY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLAUTjpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766137569; x=1797673569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bKbW+c3COgn6ebtaQJkJdPNDfqwRujqoYDBL35Pflnw=;
  b=XLAUTjpYbENX45I/u2zXf76PGeJrPFfZV6IfV4olY8/ZYUEHvXbpENgy
   MAlZ+cp/3Lewx2Ol9yaO8K1tBHJoyPyuEs1KjM044dlhjLUx9CyfX8UqH
   vB17OTjPSZzlm1vqbPiNJpqSyM/noa/jk+osF6E5C12BlK69AFA200va0
   gLPxJwO5XSi+7WOall/APfHJ6/Ef+BHIyYCP95TyHjj26UozT5Pqb/sHs
   0fjeBtfP2GbTp50MK2+SK44ltVJEer00JNTIQQ8QxPQqXXVEM/QtHRjEs
   5jf+OsQXEMmS3mQs2dVOE+hBe8qs78y0poupffI/zl4E0Fnl/e3YF5qmm
   g==;
X-CSE-ConnectionGUID: zMemuM8TTluHOVC3JPIUHw==
X-CSE-MsgGUID: uyQ6tCDPRnCay6LGioOfrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79218662"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79218662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:46:08 -0800
X-CSE-ConnectionGUID: 9/E1WZy1Sbe/xXsEUKur+w==
X-CSE-MsgGUID: SHk03YsYRe+kz2cbPanNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198834081"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Dec 2025 01:46:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWX3k-000000003KL-2RZb;
	Fri, 19 Dec 2025 09:46:04 +0000
Date: Fri, 19 Dec 2025 17:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp/pgtable.c:1184:18: sparse: sparse: dubious: x & !y
Message-ID: <202512191739.qZACisbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: b489c53001270b0d70152c82a4d1e0dcc8b4ff21 [43/43] ANDROID: KVM: arm64: Allow setting {P,U}XN in stage-2 PTEs
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251219/202512191739.qZACisbl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191739.qZACisbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191739.qZACisbl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/pgtable.c:1184:18: sparse: sparse: dubious: x & !y
--
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:1184:18: sparse: sparse: dubious: x & !y

vim +1184 arch/arm64/kvm/hyp/pgtable.c

  1176	
  1177	int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
  1178					   enum kvm_pgtable_prot prot)
  1179	{
  1180		int ret;
  1181		u32 level;
  1182		kvm_pte_t set = 0, clr = 0;
  1183	
> 1184		if (prot & !KVM_PGTABLE_PROT_RWX)
  1185			return -EINVAL;
  1186	
  1187		if (prot & KVM_PGTABLE_PROT_R)
  1188			set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R;
  1189	
  1190		if (prot & KVM_PGTABLE_PROT_W)
  1191			set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
  1192	
  1193		if (prot & KVM_PGTABLE_PROT_X)
  1194			clr |= KVM_PTE_LEAF_ATTR_HI_S2_XN;
  1195	
  1196		ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level);
  1197		if (!ret)
  1198			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, pgt->mmu, addr, level);
  1199		return ret;
  1200	}
  1201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
