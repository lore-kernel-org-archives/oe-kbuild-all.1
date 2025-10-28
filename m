Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED86A146593
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 04:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627441; cv=none; b=osmInqPNBmVFpvP+0f3TbE76KqNEaKtQU2UC9NudHt84HJqVdkUGVSaFRbAKqmun7nWAg439sXcwfwqpx5MQ9UiAzc9TPU3PkZQ0SmwjCWgveipwSTJB51VoUsvIykBPlEId69hHrmlrePWE6hGmlwH8kMDEZ0bfU79RVwTdZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627441; c=relaxed/simple;
	bh=WmV7F0Z4PUtVstUedQYSgjCjdxenfyom/QaXXUzAVCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=raFI5aCVt0HdJoVJlHphHXbLDIxhLEhqAfGwHVbqj69+sJ7i+f2vrsc3EJHjaKrsOeRrgC8Z+8ZWnhyP8MJFPS3E0p2cC6Px7GEC2Rgd+ySJOLA8M60dMEuvGLdQx7yzzZJZzbIIDZoj6twUvc2Md+jnF2Mza1hJIqIA7BXKXcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNFoU26/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNFoU26/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761627439; x=1793163439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmV7F0Z4PUtVstUedQYSgjCjdxenfyom/QaXXUzAVCY=;
  b=UNFoU26/sgo2LGcIOONobrrcm7QkQPSwrs1vWyNFThTbHtYpv3XXG2+x
   fpongwbrgVxY2BGIEBoLPrKUvucBGs70rgCEGjZYwtsfrbQtkeSqpo1Sa
   Lm9O9Jy5pX20szbZeZF/Nzz+TncUEBInAn8QqI88yNAqUeG3BAkU8yL6v
   31VsoVm8ov8F4ojmc8lPDjUC/I+N4WCYffc8PqAaSo2QPNbWIU1ekKkAy
   WRpOR8Bh+OTr3PHg+CUl5E+v3bgeaSn4ySL9yq805a7iMU0+GCDNszrEI
   NasWr2aLMVo4F6tXyt+W4p2JoR1My1LjiHgNGoYNUtkPW2XlMfdkzlpR5
   g==;
X-CSE-ConnectionGUID: grNdsIxPSwWTwERRW2UFpA==
X-CSE-MsgGUID: iFdT/0RTR/+aGEtrkjRijA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86344901"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="86344901"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 21:57:18 -0700
X-CSE-ConnectionGUID: e48U8u1ITZa68nEnldsm/g==
X-CSE-MsgGUID: vsefOLQWQO6goOjn6dFaPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="189298763"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 21:57:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDblj-000Ilc-0w;
	Tue, 28 Oct 2025 04:57:15 +0000
Date: Tue, 28 Oct 2025 12:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3256/3256] arch/x86/kvm/x86.c:8661:5: sparse:
 sparse: symbol '__kvm_vcpu_halt' was not declared. Should it be static?
Message-ID: <202510281231.vqq8hCtx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e5b3f6c2a77fa1ef4962e1a3875f03706af77ccd
commit: c499a3120204c834ff963c43d90a5ff33194b34c [3256/3256] KVM: SVM: Add support for booting APs in an SEV-ES guest
config: x86_64-randconfig-122-20251028 (https://download.01.org/0day-ci/archive/20251028/202510281231.vqq8hCtx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281231.vqq8hCtx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281231.vqq8hCtx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/x86.c:3138:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got unsigned char [usertype] * @@
   arch/x86/kvm/x86.c:3138:38: sparse:     expected void const [noderef] __user *
   arch/x86/kvm/x86.c:3138:38: sparse:     got unsigned char [usertype] *
>> arch/x86/kvm/x86.c:8661:5: sparse: sparse: symbol '__kvm_vcpu_halt' was not declared. Should it be static?
   arch/x86/kvm/x86.c:8772:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:8772:15: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:8772:15: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11225:32: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/kvm/x86.c:11278:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11278:16: sparse:    struct kvm_apic_map [noderef] __rcu *
   arch/x86/kvm/x86.c:11278:16: sparse:    struct kvm_apic_map *
   arch/x86/kvm/x86.c:11279:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/x86/kvm/x86.c:11279:15: sparse:    struct kvm_pmu_event_filter [noderef] __rcu *
   arch/x86/kvm/x86.c:11279:15: sparse:    struct kvm_pmu_event_filter *
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:182:9: sparse: sparse: context imbalance in 'vcpu_enter_guest' - unexpected unlock

vim +/__kvm_vcpu_halt +8661 arch/x86/kvm/x86.c

  8660	
> 8661	int __kvm_vcpu_halt(struct kvm_vcpu *vcpu, int state, int reason)
  8662	{
  8663		++vcpu->stat.halt_exits;
  8664		if (lapic_in_kernel(vcpu)) {
  8665			vcpu->arch.mp_state = state;
  8666			return 1;
  8667		} else {
  8668			vcpu->run->exit_reason = reason;
  8669			return 0;
  8670		}
  8671	}
  8672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
