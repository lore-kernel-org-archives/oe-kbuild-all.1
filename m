Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499042BE02C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 05:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951036; cv=none; b=QC1DezBISqoR1bWTEK/arpEOOGnzQdmHzHeAyit7hebyW3zQMLEVOajEBr5yO//FcWFAl/lY6E3IyJV1aTFxHiqacjU+Wc4W8IxZXdUayu+X2jBcE9AdpDavPHXjC+kN88vHSLoutF6Qf7HFRVMeJAdaHP3T/BJcK0pP1p+yuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951036; c=relaxed/simple;
	bh=fsgwR1xFlYFcRnM69F/8ybodaV2tpxjMl2gm9/0hcP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awnk7hsxmhHxHYms5j4f8cfqLslcsl0Tz7LokxrhmK0jOaOcZb1WaYFZdXEQYjKOWG0Y1Pk95nxxgH/lgp5uaSkfq08xkZ5HnlH6wxqHev276T+ZlR6Le6K4L1mbTgGiWyfhLQUur51AUGccoHJm30sYpTpCqaQM7EFVWsx6sKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEnNSXZ9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEnNSXZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765951034; x=1797487034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fsgwR1xFlYFcRnM69F/8ybodaV2tpxjMl2gm9/0hcP8=;
  b=NEnNSXZ95hw6g6rzaCxe9y2ugAyqhcyMoZNvnwic7IWQxz0SOdPFvmOT
   cwHDV/+tFlJXXU5L/JkWJs7MTLo8oYWuhbZ+DO2pQ5rHv6tMWniOqW2wC
   bBzgQNEa/xHoP51QvRjg8hWqdtCn1ti339Ke7zK35qD8DSlEwOjv6EBOU
   iuAXJsOSaaHGEReDKyDu06456i+e5X4zCOTUkEP3gzkoo8A0RCHaXhrEu
   MejVcBdRIGOhsd5ibHya3IXZ/hnuZwQaQegQR44X47pXJ5OdD4s1TSy+T
   vcWMG1GlAAcj+ULnN9K8Ubd8Wg4XtSgrd8bAknag0Ecclx/FKw99s7PFS
   A==;
X-CSE-ConnectionGUID: tJdq5LtLR06vTO3wBGcX3g==
X-CSE-MsgGUID: T0nmNwnmQcqIpyB5JiUQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70457714"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="70457714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:57:13 -0800
X-CSE-ConnectionGUID: Vv1Yxs7wQJCOu+RkUvjubA==
X-CSE-MsgGUID: rIjlJWR5QT2JG4OtMVV3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="235610584"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 21:57:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVkX8-0000000004R-08bB;
	Wed, 17 Dec 2025 05:57:10 +0000
Date: Wed, 17 Dec 2025 13:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/9]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:1888:56: warning: suggest parentheses
 around '-' in operand of '&'
Message-ID: <202512171301.mZbxlhjj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c1b795b01b38942c4db4e3b8946b693e85dc785c
commit: d826ecccde3cb95a2a83b2918d0bb8b187a20cbf [0/9] ANDROID: KVM: arm64: Generalize guest PA query
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251217/202512171301.mZbxlhjj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171301.mZbxlhjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171301.mZbxlhjj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function 'pkvm_get_guest_pa_request':
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1888:56: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
    1888 |         *out_pa |= (ipa & kvm_granule_size(*out_level) - 1) & PAGE_MASK;
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +1888 arch/arm64/kvm/hyp/nvhe/mem_protect.c

  1855	
  1856	/* Return PA for an owned guest IPA or request it, and repeat the guest HVC */
  1857	int pkvm_get_guest_pa_request(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
  1858				      size_t ipa_size_request, u64 *out_pa, s8 *out_level,
  1859				      u64 *exit_code)
  1860	{
  1861		struct kvm_hyp_req *req;
  1862		kvm_pte_t pte;
  1863		enum pkvm_page_state state;
  1864		struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
  1865	
  1866		guest_lock_component(vm);
  1867		WARN_ON(kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, out_level));
  1868		guest_unlock_component(vm);
  1869		if (!kvm_pte_valid(pte)) {
  1870			/* Page not mapped, create a request*/
  1871			req = pkvm_hyp_req_reserve(hyp_vcpu, KVM_HYP_REQ_TYPE_MAP);
  1872			if (!req)
  1873				return -ENOMEM;
  1874	
  1875			req->map.guest_ipa = ipa;
  1876			req->map.size = ipa_size_request;
  1877			*exit_code = ARM_EXCEPTION_HYP_REQ;
  1878			/* Repeat next time. */
  1879			write_sysreg_el2(read_sysreg_el2(SYS_ELR) - 4, SYS_ELR);
  1880			return -ENOENT;
  1881		}
  1882	
  1883		state = pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
  1884		if (state != PKVM_PAGE_OWNED)
  1885			return -EPERM;
  1886	
  1887		*out_pa = kvm_pte_to_phys(pte);
> 1888		*out_pa |= (ipa & kvm_granule_size(*out_level) - 1) & PAGE_MASK;
  1889		return 0;
  1890	}
  1891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
