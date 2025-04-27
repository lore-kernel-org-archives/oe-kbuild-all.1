Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB00510E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Apr 2025 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734521; cv=none; b=gIuobZm2LAUf+L69qmosGhMzXY4Y9PVA6a/Z1uGihrmYCwu6nKDxnmOgh4r2KDLqzrCgcCI10eeq3J3+0doNWpaQ7Ksvb+firjFqHWi3QVYeFSHVgoTJr8ja0HouSFbKQxc/8gMmMb+kMcuQyVrq2ymkDbMTmodYTBMU9Ll0Z1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734521; c=relaxed/simple;
	bh=rxpNcby6Q++OoV5RweTfvn1DH4Lzi1iHyCXm0T+R9I8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MX3YHaKVrFaofGIVb6yOe9EtnC6x6B3LY4JXOtNMfN+DSf9H2518v6vyyPg5LRQnie2xxf5aZ8zv6aQT7olPDEflJJI84KR1PBucICa/sTR1+ySp+Lwnw+AnknehSgpzphtRHJS0xswnQf4//27j/836vIoG0q9nRgUEGkgOMEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3IDqeZe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3IDqeZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745734519; x=1777270519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rxpNcby6Q++OoV5RweTfvn1DH4Lzi1iHyCXm0T+R9I8=;
  b=d3IDqeZeB/PH3RiqClVJ4d5J7OpI3Jwv33e2X97cfZ+3rr4LB8Yr3XbH
   +g4lwtSyYYQZFn9HLc6i5BvL0hILhuGQ+GofRWYoy82Aa4fn1n9dzHzwR
   dZAwwcC6mFsfFU32BMv6zjIMs1nBcBsozJi03SQi+n17+1VJ8OtV7n6xc
   EWDa4T4VARvwwi1w0vs+uVzNOW7FArevAA7Yj3D0rdeldNH325A5tMRtq
   /3HUcha0UWbFfLy1tzOiHdCJhhhcp1zd1pOV6vOmFDbxVzgJnYqhJmQDo
   85ZadTUFrhptLZy16ZTCySvD9E0CQ2zzOc7PEu8lBateoHMkYsVrXBPmo
   Q==;
X-CSE-ConnectionGUID: Z/PorPnvSs+T583Osa20OA==
X-CSE-MsgGUID: QKtFD51GRrGibeo6ajU3kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46578506"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="46578506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:15:18 -0700
X-CSE-ConnectionGUID: vvPqo2DTRG+vmJSc4g3kcA==
X-CSE-MsgGUID: osdeSxcWSsmSvbH2SRquCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138331909"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Apr 2025 23:15:16 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8vII-00068z-1k;
	Sun, 27 Apr 2025 06:15:14 +0000
Date: Sun, 27 Apr 2025 14:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Farrah Chen <farrah.chen@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:queue 9/13] arch/x86/kvm/svm/avic.c:807: warning: Function
 parameter or struct member 'pi->prev_ga_tag' not described in 'if'
Message-ID: <202504271426.qgsP6QxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   45eb29140e68ffe8e93a5471006858a018480a45
commit: 268cbfe65bb9096f78f98d1e092b1939d3caa382 [9/13] KVM: SVM: WARN if an invalid posted interrupt IRTE entry is added
config: x86_64-randconfig-002-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271426.qgsP6QxR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271426.qgsP6QxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271426.qgsP6QxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/avic.c:807: warning: Function parameter or struct member 'pi->prev_ga_tag' not described in 'if'
   arch/x86/kvm/svm/avic.c:807: warning: expecting prototype for In some cases, the existing irte is updated and re(). Prototype was for if() instead
   arch/x86/kvm/svm/avic.c:823: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Allocating new amd_iommu_pi_data, which will get
   arch/x86/kvm/svm/avic.c:936: warning: Function parameter or struct member 'kvm_vcpu_apicv_active(&svm->vcpu' not described in 'if'
   arch/x86/kvm/svm/avic.c:936: warning: expecting prototype for Here, we setup with legacy mode in the following cases(). Prototype was for if() instead
   arch/x86/kvm/svm/avic.c:951: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                            * Here, we successfully setting up vcpu affinity in
   arch/x86/kvm/svm/avic.c:983: warning: cannot understand function prototype: 'pi.prev_ga_tag = 0; '
   arch/x86/kvm/svm/avic.c:988: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * Check if the posted interrupt was previously
   arch/x86/kvm/svm/avic.c:1128: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * During AVIC temporary deactivation, guest could update


vim +807 arch/x86/kvm/svm/avic.c

   791	
   792	static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
   793	{
   794		int ret = 0;
   795		unsigned long flags;
   796		struct amd_svm_iommu_ir *ir;
   797		u64 entry;
   798	
   799		if (WARN_ON_ONCE(!pi->ir_data))
   800			return -EINVAL;
   801	
   802		/**
   803		 * In some cases, the existing irte is updated and re-set,
   804		 * so we need to check here if it's already been * added
   805		 * to the ir_list.
   806		 */
 > 807		if (pi->prev_ga_tag) {
   808			struct kvm *kvm = svm->vcpu.kvm;
   809			u32 vcpu_id = AVIC_GATAG_TO_VCPUID(pi->prev_ga_tag);
   810			struct kvm_vcpu *prev_vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
   811			struct vcpu_svm *prev_svm;
   812	
   813			if (!prev_vcpu) {
   814				ret = -EINVAL;
   815				goto out;
   816			}
   817	
   818			prev_svm = to_svm(prev_vcpu);
   819			svm_ir_list_del(prev_svm, pi);
   820		}
   821	
   822		/**
   823		 * Allocating new amd_iommu_pi_data, which will get
   824		 * add to the per-vcpu ir_list.
   825		 */
   826		ir = kzalloc(sizeof(struct amd_svm_iommu_ir), GFP_ATOMIC | __GFP_ACCOUNT);
   827		if (!ir) {
   828			ret = -ENOMEM;
   829			goto out;
   830		}
   831		ir->data = pi->ir_data;
   832	
   833		spin_lock_irqsave(&svm->ir_list_lock, flags);
   834	
   835		/*
   836		 * Update the target pCPU for IOMMU doorbells if the vCPU is running.
   837		 * If the vCPU is NOT running, i.e. is blocking or scheduled out, KVM
   838		 * will update the pCPU info when the vCPU awkened and/or scheduled in.
   839		 * See also avic_vcpu_load().
   840		 */
   841		entry = READ_ONCE(*(svm->avic_physical_id_cache));
   842		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
   843			amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
   844					    true, pi->ir_data);
   845	
   846		list_add(&ir->node, &svm->ir_list);
   847		spin_unlock_irqrestore(&svm->ir_list_lock, flags);
   848	out:
   849		return ret;
   850	}
   851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
