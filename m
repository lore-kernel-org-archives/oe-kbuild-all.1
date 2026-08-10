Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A83AEB29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362897; cv=none; b=twC2gzGVgcVkhXj3U0Dr7vum4ZkdX6LmgINowNc8was88avrefP8bEE40+EXBAnCqxWYwRFFWWI98N79ypO8kuxazAkj3e0dw/Q8siHDikPFVxIWvAcjX2u/dm95bdDRnNQegfRpSKEVZgIQ68VItpIPBM9AEkR72iGyh6iZAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362897; c=relaxed/simple;
	bh=XzgnKunvcoCOTIhbqcgU6lT9EeniYVud/MlqjyFT7/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jbLVtpkL4mU+IKh2kNjrNvRX5UyX0c2WM9TLWfW3nabLevhbLJSZwZ+q07bHIclMoW30752PwdS/y6rxg+E4T7HdjhcWqR3vQu1ZBuDVS6yBUwb20Q8nNeXMDuwI1JoqqSj8PTmav3hVPgI4B280IwgO8f49ZXYqVWRH0jcfSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftLZBZLl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftLZBZLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786362895; x=1817898895;
  h=date:from:to:cc:subject:message-id;
  bh=XzgnKunvcoCOTIhbqcgU6lT9EeniYVud/MlqjyFT7/c=;
  b=ftLZBZLlFIR9IsRmsai8TQta6oQuom4pcsZvPgIA9z1hlLMY6IYH53gG
   0S+YlSA5rwqZZMFLiveASEC9PomEXx8V3jp4aB09fo1uyQOS2vYWf3NTS
   wrHMC5iAqmaOFSiitYl0ekQEHEtxEsUOlP9h2g3B+DTGfTyMynmP4gear
   oDUViI45z1KxUiJXV2XjTYg4PlriMHNBz//hmYoiTG5uUMjoGzjRTrbun
   H3j7qKdadwDl7gm+kT1R+obkM2J3PFCe68cXax1+GFg09arUa25XtaUlF
   Sf2703+sgKu3QosHBQVDS1cKAh3Rhb0oSTRKbMrcuJLp/Dm5iF3nZJ89A
   A==;
X-CSE-ConnectionGUID: PLp94rqzRNCfuFrzSP3j0g==
X-CSE-MsgGUID: y5JBt5PlR7SuoPDVCFiIJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86632940"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86632940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:54:54 -0700
X-CSE-ConnectionGUID: qX7HiQxPRQCQ8ntsW5Ab0A==
X-CSE-MsgGUID: aVHjd+tORmStnBbhvrGCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="262504168"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Aug 2026 04:54:53 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtOag-000000005TS-3T0R;
	Mon, 10 Aug 2026 11:54:50 +0000
Date: Mon, 10 Aug 2026 13:53:58 +0200
From: kernel test robot <lkp@intel.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/kvm/svm/avic.c:984:50: error: implicit declaration
 of function 'kvm_cpu_get_apicid'; did you mean 'kvm_cpu_get_extint'?
Message-ID: <202608101324.p3oCfgNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sairaj-Kodilkar/iommu-amd-kvm-svm-Improve-API-between-SVM-and-AMD-IOMMU/20260806-223438
head:   51c8e1a2e7e7a48f09a27b87014d46f6731728a3
commit: 6cb2b8d8101192002c42cc0fb5b16b5568d583e2 kvm/svm: Update the per-CPU wakeup-list during vCPU load and unload
date:   4 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260810/202608101324.p3oCfgNo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101324.p3oCfgNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101324.p3oCfgNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/avic.c: In function 'avic_pi_update_irte':
>> arch/x86/kvm/svm/avic.c:984:50: error: implicit declaration of function 'kvm_cpu_get_apicid'; did you mean 'kvm_cpu_get_extint'? [-Wimplicit-function-declaration]
     984 |                                 pi_data.apicid = kvm_cpu_get_apicid(svm->gappi_cpu);
         |                                                  ^~~~~~~~~~~~~~~~~~
         |                                                  kvm_cpu_get_extint


vim +984 arch/x86/kvm/svm/avic.c

   931	
   932	int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
   933				unsigned int host_irq, uint32_t guest_irq,
   934				struct kvm_vcpu *vcpu, u32 vector)
   935	{
   936		/*
   937		 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
   938		 * from the *previous* vCPU's list.
   939		 */
   940		svm_ir_list_del(irqfd);
   941	
   942		if (vcpu) {
   943			/*
   944			 * Try to enable guest_mode in IRTE, unless AVIC is inhibited,
   945			 * in which case configure the IRTE for legacy mode, but track
   946			 * the IRTE metadata so that it can be converted to guest mode
   947			 * if AVIC is enabled/uninhibited in the future.
   948			 */
   949			struct amd_iommu_pi_data pi_data = {
   950				.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
   951						     vcpu->vcpu_idx),
   952				.is_guest_mode = kvm_vcpu_apicv_active(vcpu),
   953				.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
   954				.vector = vector,
   955			};
   956			struct vcpu_svm *svm = to_svm(vcpu);
   957			u64 entry;
   958			int ret;
   959			int posted_intr;
   960			bool is_vcpu_waiting = false;
   961	
   962			/*
   963			 * Prevent the vCPU from being scheduled out or migrated until
   964			 * the IRTE is updated and its metadata has been added to the
   965			 * list of IRQs being posted to the vCPU, to ensure the IRTE
   966			 * isn't programmed with stale pCPU/IsRunning information.
   967			 */
   968			guard(raw_spinlock_irqsave)(&svm->ir_list_lock);
   969	
   970			/*
   971			 * Update the target pCPU for IOMMU doorbells if the vCPU is
   972			 * running.  If the vCPU is NOT running, i.e. is blocking or
   973			 * scheduled out, KVM will update the pCPU info when the vCPU
   974			 * is awakened and/or scheduled in.  See also avic_vcpu_load().
   975			 */
   976			entry = svm->avic_physical_id_entry;
   977			if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK) {
   978				pi_data.apicid = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
   979				pi_data.flags = AMD_IOMMU_FLAG_VCPU_RUNNING;
   980			} else {
   981				posted_intr = !!(entry & AVIC_PHYSICAL_ID_ENTRY_GA_LOG_INTR);
   982				pi_data.flags = posted_intr << AMD_IOMMU_FLAG_POSTED_INTR_SHIFT;
   983				if (amd_iommu_gappi) {
 > 984					pi_data.apicid = kvm_cpu_get_apicid(svm->gappi_cpu);
   985					if (list_empty(&svm->ir_list)) {
   986						avic_add_vcpu_to_gappi_wakeup_list(svm, svm->gappi_cpu);
   987						is_vcpu_waiting = true;
   988					}
   989				}
   990			}
   991	
   992			ret = irq_set_vcpu_affinity(host_irq, &pi_data);
   993			if (ret)
   994				goto gappi_err_out;
   995	
   996			/*
   997			 * Revert to legacy mode if the IOMMU didn't provide metadata
   998			 * for the IRTE, which KVM needs to keep the IRTE up-to-date,
   999			 * e.g. if the vCPU is migrated or AVIC is disabled.
  1000			 */
  1001			if (WARN_ON_ONCE(!pi_data.ir_data)) {
  1002				irq_set_vcpu_affinity(host_irq, NULL);
  1003				ret = -EIO;
  1004				goto gappi_err_out;
  1005			}
  1006	
  1007			irqfd->irq_bypass_data = pi_data.ir_data;
  1008			list_add(&irqfd->vcpu_list, &svm->ir_list);
  1009			return 0;
  1010	gappi_err_out:
  1011			if (is_vcpu_waiting)
  1012				avic_remove_vcpu_from_gappi_wakeup_list(svm, svm->gappi_cpu);
  1013			return ret;
  1014		}
  1015		return irq_set_vcpu_affinity(host_irq, NULL);
  1016	}
  1017	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
