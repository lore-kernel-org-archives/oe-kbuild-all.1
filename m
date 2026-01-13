Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C28835C1BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292441; cv=none; b=pr1Mf9RZXms9vLvHZNqJj0TGx9ZtqCpY5v/MHtqF/iGO493pnyurwmVUK1TypbeGckH5RznpK0pD88caDgl7H71EP5awT4ETWMh833liJ16pCbT83Zh82k2BQtupBadmXJxKjY4pBdiVPXIOzmCsE/XCTk/PAcMv6pgWq/Fy6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292441; c=relaxed/simple;
	bh=IMqGsciWGDovlRMQ+pk+a13KYa/P22P4W2p6i8PHxww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=din/oDUdCkJ2w4kgy+uLj2ou18MpSe1kHkI7zVWN039CdpMYL5QjCrIPkkkkQ1czrRiofQguDamF8EDIm7RaLl34BB96rYVByUJN8/yALWBp14fYnVKuWZXCIFry6NE36QILNP9VrDpuQ40dDDesVfopcHtYcZeH5R6hnUXJ/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQkkmrgP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQkkmrgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292440; x=1799828440;
  h=date:from:to:cc:subject:message-id;
  bh=IMqGsciWGDovlRMQ+pk+a13KYa/P22P4W2p6i8PHxww=;
  b=UQkkmrgPLqtE0Rarke+oXfQy5OAEUhVoD12TJp3oU64rYjGrDwFBvSXy
   BVeoe/OKkZ9d5X4E9fB5nD70nWSSMp3DPkc/5n91zA1oUvyphfsTYkcDV
   2qaMn8r11R3N+tFAFnf/27bSi3Iz6mE/5H1gXS217+Xz28l17x5K61ZUn
   kYm3INbqu5ID7dSCXG/3gNqHDC5OYXeuHRiNGNkM/J97RNr+TMhoNGJ0G
   bgeJLjDERaahG32b2RSlE56w+x4cWau2uWJr56GXSL4YBCYpMW/CH2fKB
   XniQNQOvNNTsXMCioJPTpPt62FRjMR8K8fmXxtNjeU6Wn+DX9Seyv2KVg
   Q==;
X-CSE-ConnectionGUID: Tsjs4+liS8mREtKUCr2LlQ==
X-CSE-MsgGUID: A7q/DTI0RcyRTihXDGq3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80938903"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80938903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:20:39 -0800
X-CSE-ConnectionGUID: 2jRjOOPETt+ljNWp/cQRVQ==
X-CSE-MsgGUID: GvMLpyHGTnO4IFtvkN9GuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203959277"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 00:20:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZdi-00000000ERS-3Qig;
	Tue, 13 Jan 2026 08:20:34 +0000
Date: Tue, 13 Jan 2026 16:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/irqfd_deassign_inactive 2/3]
 arch/loongarch/kvm/../../../virt/kvm/eventfd.c:168:51: error: expected ')'
 before '->' token
Message-ID: <202601131604.pkaJegP3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/irqfd_deassign_inactive
head:   a0dab45842873bdc51c3dd77d9c23fa9ed6eafc9
commit: 4dc2946a56da0ac732287ae07ccdc0fe1edfb06b [2/3] KVM: Don't clobber irqfd routing type when deassigning irqfd
config: loongarch-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131604.pkaJegP3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131604.pkaJegP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131604.pkaJegP3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/loongarch/kvm/../../../virt/kvm/eventfd.c:12:
   arch/loongarch/kvm/../../../virt/kvm/eventfd.c: In function 'irqfd_is_active':
>> arch/loongarch/kvm/../../../virt/kvm/eventfd.c:168:51: error: expected ')' before '->' token
     168 |                        srcu_read_lock_held(&&irqfd->kvm->srcu));
         |                                           ~       ^~
   include/asm-generic/bug.h:205:32: note: in definition of macro 'WARN_ON'
     205 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/eventfd.c:167:9: note: in expansion of macro 'lockdep_assert'
     167 |         lockdep_assert(lockdep_is_held(&irqfd->kvm->irqfds.lock) ||
         |         ^~~~~~~~~~~~~~
>> arch/loongarch/kvm/../../../virt/kvm/eventfd.c:167:9: error: label 'irqfd' used but not defined


vim +168 arch/loongarch/kvm/../../../virt/kvm/eventfd.c

   158	
   159	
   160	static bool irqfd_is_active(struct kvm_kernel_irqfd *irqfd)
   161	{
   162		/*
   163		 * Checking list_empty() is safe under SRCU, as an irqfd is never added
   164		 * back to the list once it's deactivated, i.e. false negatives on the
   165		 * irqfd being active are a non-issue.
   166		 */
 > 167		lockdep_assert(lockdep_is_held(&irqfd->kvm->irqfds.lock) ||
 > 168			       srcu_read_lock_held(&&irqfd->kvm->srcu));
   169	
   170		return list_empty(&irqfd->list) ? false : true;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
