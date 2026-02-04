Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C02D191C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188353; cv=none; b=PV6iFzY3j4JZ4zFPZbgS38J16in1ne+uKdMMRCBGCgs030CSIbddeqQrKlDwH0SIHAZmHQ8A89Hl2aUe1JYEPgb8OwKDI+FS2/UXkBqqCjF8pRSsCDF5GzLG9yIiGREe68a++kdR5nlSRHYeMRu4KZ9pt3roIcXxLDZe5Gp+kJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188353; c=relaxed/simple;
	bh=I7H+ZFZMUOq67XOVsPgnvDILLXa/Tj6eKb08vWGOdIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hf05wLogHYg8lMzRZl2wBDebglMAQGTTCR4rpsq7hz3e1O/s5oyKUeNTXOqK7SPAefscpUoSwHWTkUrFfWKSLcfBzaZInOr3PL7ZPLH+nfq8y8fAiYGpNErOMB3gpncgk1TTRo76rG80xLiW/+jJSDAjrzDPHIfdQT8Tjzd+dYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAoxRFa/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAoxRFa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770188353; x=1801724353;
  h=date:from:to:cc:subject:message-id;
  bh=I7H+ZFZMUOq67XOVsPgnvDILLXa/Tj6eKb08vWGOdIE=;
  b=EAoxRFa/9kxHKjX/SWvtykg6eomt8VDD3vTtdm1/vwuuO/WBHA8X2nzo
   33cH7UVb+pgPGgR3z41YhF9tDKsYeccb+MbFRldvVjS2SUkhJMQ1mhkW5
   y+JSuTWb+rIGn+FAhw8msbEjorBaOHb1QTRbzmwAG/b235xb/GCCSnMNe
   eXlxiLVCgSh4TuvDcM5SJO8M/EvyIogCLJXhCthcShB/jGKUY/MytwvnF
   hNG+NiUnWf5wmdpx/0inQQdj0pgdoRWukec5DIfeCXhUbATmNm1Q0T8Zq
   FXrgAJafl+ksWsyxAh8dE2h+6LRcwE4nuaUrbb4vWahLfJSpwjUwZKy3G
   A==;
X-CSE-ConnectionGUID: yKSRemDaSxqHU6CVcrosiw==
X-CSE-MsgGUID: 31ZWp5yNTry51KyTpe9ohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71095096"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71095096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:59:13 -0800
X-CSE-ConnectionGUID: sGiwzgeNRLGYj+1r8EqFNA==
X-CSE-MsgGUID: CvA5TD0UR2yOUKV2lPj/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214620750"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2026 22:59:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWqy-00000000hXW-0I5A;
	Wed, 04 Feb 2026 06:59:08 +0000
Date: Wed, 04 Feb 2026 14:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Carsten Stollmaier <stollmc@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
 Lilit Janpoladyan <lilitj@amazon.de>,
 Sebastian Biemueller <sbiemue@amazon.de>
Subject: [dwmw2:gpc-stealtime 1/1] arch/x86/kvm/x86.c:5242:9: error:
 implicit declaration of function 'kvm_gpc_mark_dirty'; did you mean
 'kvm_register_mark_dirty'?
Message-ID: <202602041415.gcyoENry-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux gpc-stealtime
head:   34c3f2e56cbf5d6b03946d531e66a91566d90db6
commit: 34c3f2e56cbf5d6b03946d531e66a91566d90db6 [1/1] KVM: x86: Use gfn_to_pfn_cache for record_steal_time
config: i386-buildonly-randconfig-002-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041415.gcyoENry-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041415.gcyoENry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041415.gcyoENry-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_steal_time_set_preempted':
>> arch/x86/kvm/x86.c:5242:9: error: implicit declaration of function 'kvm_gpc_mark_dirty'; did you mean 'kvm_register_mark_dirty'? [-Wimplicit-function-declaration]
    5242 |         kvm_gpc_mark_dirty(gpc);
         |         ^~~~~~~~~~~~~~~~~~
         |         kvm_register_mark_dirty


vim +5242 arch/x86/kvm/x86.c

  5201	
  5202	static void kvm_steal_time_set_preempted(struct kvm_vcpu *vcpu)
  5203	{
  5204		struct gfn_to_pfn_cache *gpc = &vcpu->arch.st.cache;
  5205		struct kvm_steal_time *st;
  5206		static const u8 preempted = KVM_VCPU_PREEMPTED;
  5207		unsigned long flags;
  5208	
  5209		/*
  5210		 * The vCPU can be marked preempted if and only if the VM-Exit was on
  5211		 * an instruction boundary and will not trigger guest emulation of any
  5212		 * kind (see vcpu_run).  Vendor specific code controls (conservatively)
  5213		 * when this is true, for example allowing the vCPU to be marked
  5214		 * preempted if and only if the VM-Exit was due to a host interrupt.
  5215		 */
  5216		if (!vcpu->arch.at_instruction_boundary) {
  5217			vcpu->stat.preemption_other++;
  5218			return;
  5219		}
  5220	
  5221		vcpu->stat.preemption_reported++;
  5222		if (!(vcpu->arch.st.msr_val & KVM_MSR_ENABLED))
  5223			return;
  5224	
  5225		if (vcpu->arch.st.preempted)
  5226			return;
  5227	
  5228		/* This happens on process exit */
  5229		if (unlikely(current->mm != vcpu->kvm->mm))
  5230			return;
  5231	
  5232		read_lock_irqsave(&gpc->lock, flags);
  5233		if (!kvm_gpc_check(gpc, sizeof(*st)))
  5234			goto out_unlock_gpc;
  5235	
  5236		st = (struct kvm_steal_time *)gpc->khva;
  5237		BUILD_BUG_ON(sizeof(st->preempted) != sizeof(preempted));
  5238	
  5239		st->preempted = preempted;
  5240		vcpu->arch.st.preempted = KVM_VCPU_PREEMPTED;
  5241	
> 5242		kvm_gpc_mark_dirty(gpc);
  5243	
  5244	out_unlock_gpc:
  5245		read_unlock_irqrestore(&gpc->lock, flags);
  5246	}
  5247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
