Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0964315F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728725523; cv=none; b=Wfme5g7u/x5ygSsVyQqMAaKy0C6WS/GemYQPQJkrHqttKWQU/BW6rzCSyGsaRaGnH0vNg6Jfp3U2JJTKj0rWhU5gkUaVefk3oNjal3x4hB5gIkbNO4OBGS4VNKAdw54Y+ZKcLliXm/RquvirvETraOuxHqyDaGIihXjP5beUnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728725523; c=relaxed/simple;
	bh=lswvD62fFSQwdbTvievWJ9y7kXh3GNrj12P9BhPo4/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asVEfIOsKdlJQHJdTQHayv28iDMb2knVR1F5xIhxwxIBJJOhaHdPANuUsrv2voGrQng9t6tzwwl++q+lCBYn+8s0FU7hDUAUrVzrO33wVbhgwxMTC9R9e/3qODFXsLmiNssyG8mZUpPyTwTHLJHP6Gz9dFjqQ0e6wl1W6syJmPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sit1espO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sit1espO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728725521; x=1760261521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lswvD62fFSQwdbTvievWJ9y7kXh3GNrj12P9BhPo4/I=;
  b=Sit1espOWJSSJyKx8ov02YBwgBeYgTIjqO5hfTD/BxR6p+9NTR6ice88
   QHeVCTFaVY71rluNizR9RMfheTlqBh4+ZE42JjvfgcIU5/ALlqiWTG1K4
   /Q9C2L3dSEe5D6ri1t0Yk2IiX5Vmxr4k1CFAwafXzqI4vNo9MDdJAdV36
   /W8McwvWdrAaxRM8GXgXyr/vxVlc0prGvqP+M9mdSFAZfewFip/ZhHKnJ
   24V5VE4tZYET7uhqA8cyZgfrsyFqV0jZXvp1/X9MeMPWjEp9uIX3MGGDm
   lN9Xdi0ASVycG5UWcUlxYGGyoZN7hKmUj+l2INynqounxKWUJtmmwIrAc
   g==;
X-CSE-ConnectionGUID: TpKcuKJoQ2OulziNso95Vw==
X-CSE-MsgGUID: +1Ptp+fyRXWLwk46buwpog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="15757204"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="15757204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 02:32:00 -0700
X-CSE-ConnectionGUID: OHxqrvnZTdSWrqPKpw2AlA==
X-CSE-MsgGUID: i6D6yB3qTqu7zpZIdI32gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77599524"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 02:32:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szYTd-000DFH-0A;
	Sat, 12 Oct 2024 09:31:57 +0000
Date: Sat, 12 Oct 2024 17:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5/10]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:4388:29: error: use of undeclared
 identifier 'kvm'
Message-ID: <202410121711.PxwNUxjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a008d597f5ebedde0d000d27364ddb38be189ae4
commit: e83c4175c7c5f93b48df71be2926e360865c0120 [5/10] CHROMIUM: kvm: x86: enable/disable global/per-guest vcpu boost feature
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241012/202410121711.PxwNUxjf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121711.PxwNUxjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121711.PxwNUxjf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4388:29: error: use of undeclared identifier 'kvm'
    4388 |                         kvm_set_pv_sched_enabled(kvm, arg);
         |                                                  ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:4393:7: error: use of undeclared identifier 'kvm'
    4393 |                 r = kvm->pv_sched_enabled;
         |                     ^
   2 errors generated.


vim +/kvm +4388 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  4350	
  4351	static long kvm_dev_ioctl(struct file *filp,
  4352				  unsigned int ioctl, unsigned long arg)
  4353	{
  4354		long r = -EINVAL;
  4355	
  4356		switch (ioctl) {
  4357		case KVM_GET_API_VERSION:
  4358			if (arg)
  4359				goto out;
  4360			r = KVM_API_VERSION;
  4361			break;
  4362		case KVM_CREATE_VM:
  4363			r = kvm_dev_ioctl_create_vm(arg);
  4364			break;
  4365		case KVM_CHECK_EXTENSION:
  4366			r = kvm_vm_ioctl_check_extension_generic(NULL, arg);
  4367			break;
  4368		case KVM_GET_VCPU_MMAP_SIZE:
  4369			if (arg)
  4370				goto out;
  4371			r = PAGE_SIZE;     /* struct kvm_run */
  4372	#ifdef CONFIG_X86
  4373			r += PAGE_SIZE;    /* pio data page */
  4374	#endif
  4375	#ifdef CONFIG_KVM_MMIO
  4376			r += PAGE_SIZE;    /* coalesced mmio ring page */
  4377	#endif
  4378			break;
  4379		case KVM_TRACE_ENABLE:
  4380		case KVM_TRACE_PAUSE:
  4381		case KVM_TRACE_DISABLE:
  4382			r = -EOPNOTSUPP;
  4383			break;
  4384	#ifdef CONFIG_PARAVIRT_SCHED_KVM
  4385		case KVM_SET_PV_SCHED_ENABLED:
  4386			r = -EINVAL;
  4387			if (arg == 0 || arg == 1) {
> 4388				kvm_set_pv_sched_enabled(kvm, arg);
  4389				r = 0;
  4390			}
  4391			break;
  4392		case KVM_GET_PV_SCHED_ENABLED:
  4393			r = kvm->pv_sched_enabled;
  4394			break;
  4395	#endif
  4396		default:
  4397			return kvm_arch_dev_ioctl(filp, ioctl, arg);
  4398		}
  4399	out:
  4400		return r;
  4401	}
  4402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
