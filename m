Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1DB3FA5C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565306; cv=none; b=YxMZdY87rlSxKDtw+pGofym5zDnWZJ9l0DSW9JDGZRf0780fbCwzbuib4aLAZOsPuUgSO/H4oRU2kcq51HED1yplw1nmfj4iJLJwAY2YEdIl2FIQAsB3xnL4g/Zz4RZ32g4sY45LbyNu1tPWBNzFTnQC5C+jUyQtKI5pKBMT3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565306; c=relaxed/simple;
	bh=nQ6d0snrpe1BH5uQxSgaQi2//PC+zImUm4NiFZupnAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8xKjfd85O3Sf8VXdefYREZFW52yF4VIYMLVdAFJAr1JkDZYoolFIgHPhnfy90JMe1gRl9/0bjZx6dtFVI955RY1g2igrB1Kld96g5+FCnhNMIJgAnOHBDcymuseEODr0X4wZfb6PuSSclVQpaCz4OsrSvAxo5PfVZLSKbnPD2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3u9XRqe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3u9XRqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778565295; x=1810101295;
  h=date:from:to:cc:subject:message-id;
  bh=nQ6d0snrpe1BH5uQxSgaQi2//PC+zImUm4NiFZupnAo=;
  b=Q3u9XRqeAgkqlRd2kOdErXUcNJIC1Zn7by02HImUbASnY1L79rZ+pFJq
   log6MGUiLn9auvq8K7k6Wji/i3k4vXyN8BoOmJvPby105ON4/VjGn0xDW
   oJSZL+oMWPQ13bk0RbXCK5uc30dXHKEtyPTfAoj3PyqkSjZxk9E7vRB5j
   YJRS5UYtgmU7IfXw1D429nYwpAxSIVEZ3HfZwkHDRBx6jiYG6dQ3Uae2Z
   LEvearFxNHV66CVJIeulodn6E4ccePjJ4xDl9qbJoGXcxK10wwgy3HNMQ
   TBlqKKci+hM+FFIU0tk2XlgP25ggKH0SNDnd0EDUOMq5ChprUMXFGGMOJ
   A==;
X-CSE-ConnectionGUID: q/XJfW58Q/q/Y6Np+yN6Rg==
X-CSE-MsgGUID: KqfeSpkdSfuU+e4rFGv0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102130323"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="102130323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 22:54:49 -0700
X-CSE-ConnectionGUID: LTLLjgDwRHGqG6D95NfRMw==
X-CSE-MsgGUID: ZvHq0RHdSuy/a/XM7UMRzg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 May 2026 22:54:48 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMg4r-000000001fT-0imW;
	Tue, 12 May 2026 05:54:45 +0000
Date: Tue, 12 May 2026 13:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock5 27/33] arch/x86/kvm/x86.c:6137:undefined
 reference to `__udivdi3'
Message-ID: <202605121356.yoKOoS3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock5
head:   da1d4eeab5b7f46a172ed30db198073e1aa00bf3
commit: f999007141f30149770e5732866ac43732b0e4da [27/33] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
config: i386-buildonly-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121356.yoKOoS3Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121356.yoKOoS3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121356.yoKOoS3Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_arch_tsc_get_attr':
>> arch/x86/kvm/x86.c:6137:(.text+0x20866): undefined reference to `__udivdi3'


vim +6137 arch/x86/kvm/x86.c

  6095	
  6096	static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
  6097					 struct kvm_device_attr *attr)
  6098	{
  6099		u64 __user *uaddr = u64_to_user_ptr(attr->addr);
  6100		int r;
  6101	
  6102		switch (attr->attr) {
  6103		case KVM_VCPU_TSC_OFFSET:
  6104			r = -EFAULT;
  6105			if (put_user(vcpu->arch.l1_tsc_offset, uaddr))
  6106				break;
  6107			r = 0;
  6108			break;
  6109		case KVM_VCPU_TSC_SCALE: {
  6110			struct kvm_vcpu_tsc_scale scale;
  6111	
  6112			if (!kvm_caps.has_tsc_control) {
  6113				r = -ENXIO;
  6114				break;
  6115			}
  6116	
  6117			scale.tsc_ratio = vcpu->arch.l1_tsc_scaling_ratio;
  6118			scale.tsc_frac_bits = kvm_caps.tsc_scaling_ratio_frac_bits;
  6119			r = -EFAULT;
  6120			if (copy_to_user(uaddr, &scale, sizeof(scale)))
  6121				break;
  6122			r = 0;
  6123			break;
  6124		}
  6125		case KVM_VCPU_TSC_EFFECTIVE_FREQ: {
  6126			struct kvm_vcpu_tsc_effective_freq freq;
  6127	
  6128			if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
  6129				r = -ENXIO;
  6130				break;
  6131			}
  6132	
  6133			if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, vcpu))
  6134				kvm_guest_time_update(vcpu);
  6135	
  6136			freq.tsc_khz = div_u64(vcpu->arch.hw_tsc_hz, 1000);
> 6137			freq.bus_khz = 1000000 / vcpu->kvm->arch.apic_bus_cycle_ns;
  6138			r = -EFAULT;
  6139			if (copy_to_user(uaddr, &freq, sizeof(freq)))
  6140				break;
  6141			r = 0;
  6142			break;
  6143		}
  6144		default:
  6145			r = -ENXIO;
  6146		}
  6147	
  6148		return r;
  6149	}
  6150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
