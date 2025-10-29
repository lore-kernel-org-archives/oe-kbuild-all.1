Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080B20010A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 22:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761776709; cv=none; b=uvDPoDEdFPAzm2Qg0osgmkghN3SYg/4nSPvbnQ2tDDQVhGl6QWp8e6NRaKdtuorNQc4mqGPQK6X9LTcbXtP2ey5FEnZDinhHsohFR8sYrpB9B8R1f2nUQ8LXOElS4RxjOO22saS2rV2rPLCQcONR9Bm9fjK8CRyfOzb+SPNBO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761776709; c=relaxed/simple;
	bh=biawttelrMcv//1U/MfrhlGRTyfAvr+zyeJKKAsibWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snMmAjqHqV5V67LSfqr2Wbju8u4imdmET+CXbs9gh2j9C/gTVEDQKm6/Zr9ScVhhU5cPzw2Bm2FCx6iGnPYXN52VIK1Amdh7okMXYwED07UOFSrE5en+R9Ng4jRIPnax9xohcvOiapgBI74wdUPlSLWXWOdqImsA25Y9FvHwBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9HtrEWP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9HtrEWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761776707; x=1793312707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=biawttelrMcv//1U/MfrhlGRTyfAvr+zyeJKKAsibWI=;
  b=h9HtrEWPpAJVng4NYyWmxRUYtMdMA+JDxQPfIsWI7XRSZccwfSNg1UsB
   5uNoZHH5XKZBvIQami5DTOXZ1pilyTAR6677lf0RSkVnaMtvr/1YPBvCK
   qQAU2HSEdBSIX8MomF84p1cxjbbUnMKLLKGIRiQPzpKTho7DZTHCjI0r0
   JQfZa8wEJrqIF6vJ+raI7EKhFGOFJZ1wYG3T/FoBtxIMwAgWFkLXg6mHu
   8Y+tLbYgUA/lhqPbnHe4mSK3Pon/WEB1Oby5NppxqTo8OVQ1A3i8mK+Ya
   aAB6Wr80tTeNLlDq4Nv6JUPPeYTybdFd920FgWxHG81Q8OSycOGUZNHRj
   Q==;
X-CSE-ConnectionGUID: 8ZuoWv7TQnKnZaRco2EctQ==
X-CSE-MsgGUID: oOdBYX2lQuy3f16mFArSsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89379591"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="89379591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 15:25:06 -0700
X-CSE-ConnectionGUID: aC2NgSQZSIKpRATCmV5ChA==
X-CSE-MsgGUID: UAa/cdyZQDm0j4yRphlNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="223001606"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2025 15:25:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEEbG-000LEO-0A;
	Wed, 29 Oct 2025 22:25:02 +0000
Date: Thu, 30 Oct 2025 06:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinqian Yang <yangjinqian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064] arch/arm64/kvm/arm.c:253:7: warning:
 variable 'r' is used uninitialized whenever 'if' condition is false
Message-ID: <202510300607.beN0C3BL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6a2b7160d59b59ef2bd08614200d0a2219b54e
commit: 958959657133b04448125ddf9c89c669f7eee066 [3064/3064] KVM: arm64: Allow userspace to change the implementation ID registers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251030/202510300607.beN0C3BL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300607.beN0C3BL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300607.beN0C3BL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:253:7: warning: variable 'r' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     253 |                 if (!kvm->created_vcpus) {
         |                     ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/arm.c:297:9: note: uninitialized use occurs here
     297 |         return r;
         |                ^
   arch/arm64/kvm/arm.c:253:3: note: remove the 'if' if its condition is always true
     253 |                 if (!kvm->created_vcpus) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/arm.c:225:7: note: initialize the variable 'r' to silence this warning
     225 |         int r;
         |              ^
         |               = 0
   arch/arm64/kvm/arm.c:596:5: warning: no previous prototype for function 'kvm_arch_rec_init' [-Wmissing-prototypes]
     596 | int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
         |     ^
   arch/arm64/kvm/arm.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     596 | int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
         | ^
         | static 
   2 warnings generated.


vim +253 arch/arm64/kvm/arm.c

   221	
   222	int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
   223				    struct kvm_enable_cap *cap)
   224	{
   225		int r;
   226		u64 new_cap;
   227	
   228		if (cap->flags)
   229			return -EINVAL;
   230	
   231		switch (cap->cap) {
   232		case KVM_CAP_ARM_NISV_TO_USER:
   233			r = 0;
   234			set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
   235				&kvm->arch.flags);
   236			break;
   237		case KVM_CAP_ARM_MTE:
   238			mutex_lock(&kvm->lock);
   239			if (!system_supports_mte() || kvm->created_vcpus) {
   240				r = -EINVAL;
   241			} else {
   242				r = 0;
   243				set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
   244			}
   245			mutex_unlock(&kvm->lock);
   246			break;
   247		case KVM_CAP_ARM_SYSTEM_SUSPEND:
   248			r = 0;
   249			set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
   250			break;
   251		case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
   252			mutex_lock(&kvm->lock);
 > 253			if (!kvm->created_vcpus) {
   254				r = 0;
   255				set_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags);
   256			}
   257			mutex_unlock(&kvm->lock);
   258			break;
   259		case KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE:
   260			new_cap = cap->args[0];
   261	
   262			mutex_lock(&kvm->slots_lock);
   263			/*
   264			 * To keep things simple, allow changing the chunk
   265			 * size only when no memory slots have been created.
   266			 */
   267			if (!kvm_are_all_memslots_empty(kvm)) {
   268				r = -EINVAL;
   269			} else if (new_cap && !kvm_is_block_size_supported(new_cap)) {
   270				r = -EINVAL;
   271			} else {
   272				r = 0;
   273				kvm->arch.mmu.split_page_chunk_size = new_cap;
   274			}
   275			mutex_unlock(&kvm->slots_lock);
   276			break;
   277	#ifdef CONFIG_ARM64_HDBSS
   278		case KVM_CAP_ARM_HW_DIRTY_STATE_TRACK:
   279			r = kvm_cap_arm_enable_hdbss(kvm, cap);
   280			break;
   281	#endif
   282	#ifdef CONFIG_ARM64_HISI_IPIV
   283		case KVM_CAP_ARM_HISI_IPIV:
   284			r = kvm_hisi_ipiv_enable_cap(kvm, cap);
   285			break;
   286	#endif
   287		case KVM_CAP_ARM_RME:
   288			mutex_lock(&kvm->lock);
   289			r = kvm_realm_enable_cap(kvm, cap);
   290			mutex_unlock(&kvm->lock);
   291			break;
   292		default:
   293			r = -EINVAL;
   294			break;
   295		}
   296	
   297		return r;
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
