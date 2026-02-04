Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34AA37F8AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186605; cv=none; b=ZRTf3cyl05Le67flFVCCZXjwZzgqXzKWT02ZHWz/a/CALRPgpeZ0h8hI+O0sAFvNQ9R5q/Y2zcW0tOJKPDTs0Vvk7SDKWqinntJSn0gp9WnodicPZ7F0hArwQ6CWN9tJQg8icUpjJEWmMBMbvVvuj40S+iqtcXwP058QM9wOpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186605; c=relaxed/simple;
	bh=V6aKlOm7f4ECXbG0WI9xRn6HV/8+JZAcsNB37U4IdRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gLzPRmDGASXsH/sdOhlY5Pg4gNIz2x+ISPQ3KMT36btrt/Sf2pUF768+YSEfEvngrBYd2VSD3vXdlGCq62tBqoTrpf6H9rdk3WHYoshLS39bQhcTTTCVULSNVeSSkmlWYqbRFCLjLPTXxqhFuLW6PkK5TvORj1ecEp3p5lPPudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mamnGX0M; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mamnGX0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770186605; x=1801722605;
  h=date:from:to:cc:subject:message-id;
  bh=V6aKlOm7f4ECXbG0WI9xRn6HV/8+JZAcsNB37U4IdRQ=;
  b=mamnGX0MYzrOqgnU38T1n3U4oaIi0Exkh543PtqjknbnKsCqZeHKBxFF
   NrLhnY8hswBNXi/Vb/XZkfl0ovEazkVXTDUG1z97lOpNCi+QAIzf5N3PM
   dkAyFNOHGjOmBvLYTyAcgKHxuXLRQCjD8BNKH2bwo9gX8uWZamAYcyw3W
   2mmq5udcUeWs0O+j/xbu/oXQix/p60FidBJlfPFp3p9X4WB2CNe7znr+k
   q7AOXxyOBuWu/lhbULfOrPcp4iqispOBZaiPNmNk2AE4x3opuBFtXvIh7
   0W3kQ6X9hxEETRUa3MBbWJjjlX4BGG7inEx1sDyxj1wDuXzbQKxzlFfYV
   g==;
X-CSE-ConnectionGUID: ZyOX2LNwSDqIuTEYyL5kDA==
X-CSE-MsgGUID: neS222OdQuadCxMW+NpuCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71264612"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71264612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:30:04 -0800
X-CSE-ConnectionGUID: 8XeiCO5rTxuLBYJzS0Bs8g==
X-CSE-MsgGUID: s4txN4uYSrC2EjBuAHezNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210173016"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2026 22:30:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWOl-000000003eX-0k9l;
	Wed, 04 Feb 2026 06:29:59 +0000
Date: Wed, 04 Feb 2026 07:29:02 +0100
From: kernel test robot <lkp@intel.com>
To: Carsten Stollmaier <stollmc@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
 Lilit Janpoladyan <lilitj@amazon.de>,
 Sebastian Biemueller <sbiemue@amazon.de>
Subject: [dwmw2:gpc-stealtime 1/1] arch/x86/kvm/x86.c:5242:9: error:
 implicit declaration of function 'kvm_gpc_mark_dirty'; did you mean
 'kvm_register_mark_dirty'?
Message-ID: <202602040731.R9UyUpjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux gpc-stealtime
head:   34c3f2e56cbf5d6b03946d531e66a91566d90db6
commit: 34c3f2e56cbf5d6b03946d531e66a91566d90db6 [1/1] KVM: x86: Use gfn_to_pfn_cache for record_steal_time
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260204/202602040731.R9UyUpjd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040731.R9UyUpjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040731.R9UyUpjd-lkp@intel.com/

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
