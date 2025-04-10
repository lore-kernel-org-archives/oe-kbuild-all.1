Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00241E3DFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301868; cv=none; b=rYumkmYkhM4dwQt+dUFnJdRnc/kndx29ryOdCXNrwJV++G4f4+6nlHPIVrnkFJ8l1dK/3F0Mtm2O7iIKlVZkFNLnJJeB4AvW7tYqRDdPqC42fK+6JHG9vS4Tis0UxCOmGrAjHvoOAsR5HxAzQ0eVTlwWZ6k+Im+n9sO30J3r/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301868; c=relaxed/simple;
	bh=zzCsAGjR7P6LuXaUtTj6W4cZrTTsc89Xr5F0snDOs98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qO3Vok332DhN1fBsYDgYos6P2hG0++Z2yRi/fNbChzp0R3sZPjriLR7lM8zaPDEt1sTexJ3dh5DqkJ8mMtZAugLTRVEsWDZdHYzcNeqRyhOU9eed1RX9YZIOV3g7kgg+DklN3HFM7HCILRPO7mNT68qHbU4L7iqdnlkkO4fpmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViSQ/LGP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViSQ/LGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744301866; x=1775837866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzCsAGjR7P6LuXaUtTj6W4cZrTTsc89Xr5F0snDOs98=;
  b=ViSQ/LGPA6FWulmbzBqHSW4SNsxLEuxZ1z8W6KIOQAgGH2ql7YrsY1NR
   uAd7SPWp6yNK0pS76cKK/UUv0WT0hfKDXTCPbCWUCSaM/EWYGLCOI073h
   yfy6TCHj+V+pH5dYlH6tMMFSA502+ezWv6SOVDr4b/H4CsVBvkZYMgyrj
   mmohgdpJr7DTIkrrdJzQrgR4MM56ucc6GXWeRdojVnnxVEEvTTMef5OEp
   yQH5JQ+Vf3KouHtJcZpsX21/wRaZEhoOOA7en2tBPSuhZKIMZRotW7R0d
   TpXJmtXt6nqsB9IHcuvDJmX+zvClaDHxK37NiVCNAMzQUDB3lRDd1EFcG
   w==;
X-CSE-ConnectionGUID: L3mZb9WySS6nQxEWHqnz6w==
X-CSE-MsgGUID: GiKqC/i4SHCNmqBURg3JWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45926629"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45926629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 09:17:46 -0700
X-CSE-ConnectionGUID: KlM3HspNTQS2oB8zxRBk8Q==
X-CSE-MsgGUID: FvpFCyWAQxKAyoNQ1Mjy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="159929253"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2025 09:17:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ub0-000AIQ-2Z;
	Thu, 10 Apr 2025 16:17:42 +0000
Date: Fri, 11 Apr 2025 00:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/4]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for
 '__pkvm_register_guest_smc_handler'
Message-ID: <202504102358.uYMYaYyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   138801b055e1c3afb7575805ea51e6c27155da5c
commit: 340ef6cb4081cb305235a059f1c142345ac1a71d [0/4] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250410/202504102358.uYMYaYyd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504102358.uYMYaYyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504102358.uYMYaYyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for '__pkvm_register_guest_smc_handler' [-Wmissing-prototypes]
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_guest_smc_handler +1725 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1724	
> 1725	int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
  1726							 struct arm_smccc_res *res,
  1727							 pkvm_handle_t handle),
  1728					      pkvm_handle_t handle)
  1729	{
  1730		int ret = -EINVAL;
  1731		struct pkvm_hyp_vm *vm;
  1732	
  1733		if (!cb)
  1734			return ret;
  1735	
  1736		hyp_read_lock(&vm_table_lock);
  1737		vm = get_vm_by_handle(handle);
  1738		if (vm)
  1739			ret = cmpxchg_release(&vm->smc_handler, NULL, cb) ? -EBUSY : 0;
  1740		hyp_read_unlock(&vm_table_lock);
  1741	
  1742		return ret;
  1743	}
  1744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
