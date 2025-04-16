Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5EF24887F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847106; cv=none; b=O/WuXWPoz8vzQTMh7HEcOajC+9st7bqrlFjN9T/9i0BXCSNSUJbkAYnnG4y0GgIBtCGj0bdd3IH0VpHhnnIhWpZ5X7/ncP37QfaqjsdaojyYK3K9EuDLbEaQFtHPBb2HTF1wm+CLuPAcSXHuSEUJWw9zpP+t3vcxgsXC/J/qyIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847106; c=relaxed/simple;
	bh=TU+Go+PB9S4sz/insfOGOl2eXOz7jAj5ducpImk608k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/jdvt5LI1e6zmVDL3cerTGKyPzstJFc7WHQub2Apss5blS1eWzlDZ+TQiBps2U/KWO5UNRIkXGfsgEALbVZ9XCas3hDf1i6xPWCbUUm/2y7lKb1GI/RXRtHWVL1G7V9sUBfkgT5m6r85gU64v9nF0dvHhSzjMjM70h89OT+MQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRutPCeM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRutPCeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744847104; x=1776383104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TU+Go+PB9S4sz/insfOGOl2eXOz7jAj5ducpImk608k=;
  b=KRutPCeMgw55tmm74BooezuzWoCr94Xwqafy5utHHkOowvOS/HWKsIWG
   69jx804xhQcQzWpyN+5R/s9g9g3B/floL2mqRj20DuedzD6P31x8FtsYX
   cgZC3ZgPRpu5PmQGyVjqZzIBurgshM8IDkaEqC9770bpwq3CEO2EHbNVR
   QRZEk/imUr99Wo2ZVZH18tU0mJMeMXwA9KLCQtEIOdlSxNtThJNAvTj/R
   D1mjmlb154Kn5qvK4cv9a0eaaT2QOzwhloM9P0NYOJD1+kLKWd9YRKnko
   Aza0bGuCequnqsrNk6QTqLEU9OogCRQiZS2MJB62ddwwnf5PUz04L8Jen
   A==;
X-CSE-ConnectionGUID: 8FmIyQi5S46nWHjLn0LFtg==
X-CSE-MsgGUID: 709hvVVlTPmUeA+vS4/PFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57789978"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="57789978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 16:45:03 -0700
X-CSE-ConnectionGUID: ZeyO3YSMR0W24wPsD2rwYw==
X-CSE-MsgGUID: l8UvbQbuTMqYH5dq8hItUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="161671225"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 16:45:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5CR9-000KSa-2z;
	Wed, 16 Apr 2025 23:44:59 +0000
Date: Thu, 17 Apr 2025 07:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:2766:49: warning: suggest parentheses
 around '-' in operand of '&'
Message-ID: <202504170716.InDP9qKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   179c4d3da80ef129e67fba69fa022fe3f91c60be
commit: bd55bd84082e4882aaeff13ebfdcb78b329f5302 [1/1] ANDROID: KVM: arm64: Generalize guest PA query
config: arm64-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170716.InDP9qKb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170716.InDP9qKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170716.InDP9qKb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/mem_protect.c: In function 'pkvm_get_guest_pa_request':
>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:2766:49: warning: suggest parentheses around '-' in operand of '&' [-Wparentheses]
     *out_pa |= (ipa & kvm_granule_size(*out_level) - 1) & PAGE_MASK;
                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +2766 arch/arm64/kvm/hyp/nvhe/mem_protect.c

  2733	
  2734	/* Return PA for an owned guest IPA or request it, and repeat the guest HVC */
  2735	int pkvm_get_guest_pa_request(struct pkvm_hyp_vcpu *hyp_vcpu, u64 ipa,
  2736				      size_t ipa_size_request, u64 *out_pa, s8 *out_level,
  2737				      u64 *exit_code)
  2738	{
  2739		struct kvm_hyp_req *req;
  2740		kvm_pte_t pte;
  2741		enum pkvm_page_state state;
  2742		struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
  2743	
  2744		guest_lock_component(vm);
  2745		WARN_ON(kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, out_level));
  2746		guest_unlock_component(vm);
  2747		if (!kvm_pte_valid(pte)) {
  2748			/* Page not mapped, create a request*/
  2749			req = pkvm_hyp_req_reserve(hyp_vcpu, KVM_HYP_REQ_TYPE_MAP);
  2750			if (!req)
  2751				return -ENOMEM;
  2752	
  2753			req->map.guest_ipa = ipa;
  2754			req->map.size = ipa_size_request;
  2755			*exit_code = ARM_EXCEPTION_HYP_REQ;
  2756			/* Repeat next time. */
  2757			write_sysreg_el2(read_sysreg_el2(SYS_ELR) - 4, SYS_ELR);
  2758			return -ENOENT;
  2759		}
  2760	
  2761		state = pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
  2762		if (state != PKVM_PAGE_OWNED)
  2763			return -EPERM;
  2764	
  2765		*out_pa = kvm_pte_to_phys(pte);
> 2766		*out_pa |= (ipa & kvm_granule_size(*out_level) - 1) & PAGE_MASK;
  2767		return 0;
  2768	}
  2769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
