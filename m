Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67F3C81AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319211; cv=none; b=uxs0fizDl4WnihoD3ARfWkE0TrIAx3FPc1YiVTqPm4ZwmvOjeqenWn9+3//nauIu0MMOV/M7TfRVyke0btsvjM28l8TVwGmejujKI89vLs3okJuUHe31T4Eo9GCraFbJgV0i+IfWv5spOitAD+Umzlo5BB21eUtRi00Lni8lYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319211; c=relaxed/simple;
	bh=CMpuPcQq13HkNHXel/iamzET+7m3wLjeuuuKtLjrAIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CRuGCtoeKEaEtcHG+wQQa3wrzjDVKFTBwBpymV+3Qw5caKvRc3rcWHSNh0sduxMh5qP0/xZa+8hMyR+TLCX5vzVJLleMqQ1bN8EnwH3YgA53zj8xLPWfdOgsiaY3AmHpxPlLuS4Pgkf+F8+8LRSZQ2EOrfrDSJCe7t8VWOjAxhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJD0VPSz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJD0VPSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779319210; x=1810855210;
  h=date:from:to:cc:subject:message-id;
  bh=CMpuPcQq13HkNHXel/iamzET+7m3wLjeuuuKtLjrAIc=;
  b=IJD0VPSzn6cq85O4LkU68Dyb2f86FiQjr0jqdh2Mn9uaLGzG9BStaMk0
   7W8CVpfcVNrlM9C73+6WbyW4DHthna38AwMTQbQYXTgRZUtKsLivxJFIw
   U+uquUC1RHnrcKy5vEOZZNUMz2YqIUi+G9RkHTIR7UkucdrfPJdUTW7p5
   uizAVWXf9g3wIvyCMmJcvhxjB1cksXvE4UuiKv9Yt9r7u1sdIXM5niVGI
   qk1WnK5lv3aoaoUJyjbADo40DJyiyj+ux6MOi5RznMIXPpJYaBCGTmW7n
   U/0qSOPySnbX2uEMyyzU8zqJ8tqWIJMrlgc9cj2hyZTWOhGrD5VgOOd6f
   A==;
X-CSE-ConnectionGUID: zxTXWFlfQlaMLPQ7B3o2xw==
X-CSE-MsgGUID: 1n8YZEOuSp27Ku206W2hCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90926817"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90926817"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:20:10 -0700
X-CSE-ConnectionGUID: dkWeAkULRkyb237sROKSog==
X-CSE-MsgGUID: UvJCZdeLQOKy9zehGLT5sA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 16:20:08 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPqCE-000000003yn-0nhm;
	Wed, 20 May 2026 23:19:37 +0000
Date: Thu, 21 May 2026 07:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.2 202/247]
 arch/x86/kvm/lapic.c:2701:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202605210735.0uivNVX5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.2
head:   5693301a8315aa6051f1bd38a1b689b5f0d2f7aa
commit: 475ea7394cb0481b9799a099e3aa09b4dfd53bb3 [202/247] KVM: x86: replace get_zeroed_page() with kzalloc()
config: i386-randconfig-053-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210735.0uivNVX5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210735.0uivNVX5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/lapic.c:2701:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +2701 arch/x86/kvm/lapic.c

  2682	
  2683	void kvm_free_lapic(struct kvm_vcpu *vcpu)
  2684	{
  2685		struct kvm_lapic *apic = vcpu->arch.apic;
  2686	
  2687		if (!vcpu->arch.apic) {
  2688			static_branch_dec(&kvm_has_noapic_vcpu);
  2689			return;
  2690		}
  2691	
  2692		hrtimer_cancel(&apic->lapic_timer.timer);
  2693	
  2694		if (!(vcpu->arch.apic_base & MSR_IA32_APICBASE_ENABLE))
  2695			static_branch_slow_dec_deferred(&apic_hw_disabled);
  2696	
  2697		if (!apic->sw_enabled)
  2698			static_branch_slow_dec_deferred(&apic_sw_disabled);
  2699	
  2700		if (apic->regs)
> 2701			kfree(apic->regs);
  2702	
  2703		kfree(apic);
  2704	}
  2705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
