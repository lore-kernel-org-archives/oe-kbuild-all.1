Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9551200CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724812773; cv=none; b=EExCtx4VHFiU6suLahavXJyVLMEt7ApYnaVAeQbQq5yhVhpivdOCopMrVEQLApfligJyR+OFLAt425K6j8jlkLIK6DsAMWWbTzi3VwsO8RpVhDcL7BHJNpjYpCx+mopvTeAGH3Xp0g39yEeUE7qnW1LufaU60BN25RVkcCsvmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724812773; c=relaxed/simple;
	bh=DDYIHHFhPo2N3Ikz6uBY4ciVSCTIHkqL1kVCHuBUtvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiPkgxHf/Sa4SBIaFVpP4Sd4e+jw1IhufndKpAsAVxzJj/ze0gT84l+OLih7C+Pus90vbAdmYLSKpKxPMBxlN/4mk191rRzgCSKDId2hT4Yv1AEXbob/POugX+y08+IguYXrZx/DSO+ihYDRZmg21MihkOHX/OsFWnDB1mXhxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LV2+k7Ns; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV2+k7Ns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724812773; x=1756348773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDYIHHFhPo2N3Ikz6uBY4ciVSCTIHkqL1kVCHuBUtvU=;
  b=LV2+k7NsNn0ddW9Ac9PJIDUf15Nwbwf7kVF1L0D8Cb+++3O7Eecwjyfl
   Hre+xEb9qZd47J787S1AuJgzwqH7rjmmif1SvYmSWXexLKfJ31OQLeMGn
   DeI9Kf893tws9I/QDxWOiFcym9p5pgyggp3aj7tk0G6TkTuXvEIV1aOkO
   Y73GC9JN5prZEY6ShEKZu12pzo0TyzaODAi5OC7ikEWTFIQbsJWbgIepv
   4VqA/PN3zhUjym7eC+NaWV+qbZXaHOEAZjF8XwZ09CMgxB3RFlbAfRu3e
   G9ardD+eK43f5b0dUPsY3h40FN4ugcEoXKiFQWVGVnDUaVQqlDOjxf6vn
   A==;
X-CSE-ConnectionGUID: YIMIeYAWSJaqys3WrXY3oQ==
X-CSE-MsgGUID: RkbzVBPpT0S9au73Xfn0qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34696134"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="34696134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 19:39:32 -0700
X-CSE-ConnectionGUID: phM807NRSHqRByQj4VhljA==
X-CSE-MsgGUID: mpTcSaYRSK24zhGxOdcE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="67433428"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 19:39:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj8am-000KMS-0k;
	Wed, 28 Aug 2024 02:39:28 +0000
Date: Wed, 28 Aug 2024 10:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27219/30000] arch/x86/kvm/x86.c:893:6: warning:
 no previous prototype for function 'kvm_post_set_cr0'
Message-ID: <202408281042.WYKCGMvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a3e2493c22a624aefb09b92b040c97ecd2e8e2dd
commit: 1686d271f795f8756b49151978b95b095c0598ad [27219/30000] KVM: x86: Introduce kvm_post_set_cr0 to post handle the CR0 emulation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240828/202408281042.WYKCGMvH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281042.WYKCGMvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281042.WYKCGMvH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:893:6: warning: no previous prototype for function 'kvm_post_set_cr0' [-Wmissing-prototypes]
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^
   arch/x86/kvm/x86.c:893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         | ^
         | static 
   1 warning generated.


vim +/kvm_post_set_cr0 +893 arch/x86/kvm/x86.c

   892	
 > 893	void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
   894	{
   895		unsigned long update_bits = X86_CR0_PG | X86_CR0_WP;
   896	
   897		if ((cr0 ^ old_cr0) & X86_CR0_PG) {
   898			kvm_clear_async_pf_completion_queue(vcpu);
   899			kvm_async_pf_hash_reset(vcpu);
   900		}
   901	
   902		if ((cr0 ^ old_cr0) & update_bits)
   903			kvm_mmu_reset_context(vcpu);
   904	
   905		if (((cr0 ^ old_cr0) & X86_CR0_CD) &&
   906		    kvm_arch_has_noncoherent_dma(vcpu->kvm) &&
   907		    !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_CD_NW_CLEARED))
   908			kvm_zap_gfn_range(vcpu->kvm, 0, ~0ULL);
   909	}
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
