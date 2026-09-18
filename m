Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F277E342151
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 22:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771428; cv=none; b=TJzgZSQwfeHQOcJ6Lv4sQS7za6sgd88HKj/BWdlqlP/3uJmKK+DtRT1ctpXLTy5Z1+WbO6yEV/uZjPGOARDL3/z/Z1DAxs50DzJ/cb5I5wobULnxu1SOSfzECgfVSBeR7TD+AXiCedkMKpPWFkIgHbJjgHFOVVOLKQik6Q4/nPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771428; c=relaxed/simple;
	bh=2cSustd2Rp6D55dc++Ut1xARzzyFWfxFaCYewsRBFDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfMdW3pClwPLzMOW55DtyGYMxiIDEh+4lgPnNwIcL09vZGSn9zW5GrJ0AOfP+TudCvuWak0mWElyd6l4PBg6QeqNS6xlmVuzE05AqYLfLYw6XOICS7VztySkMW6gu985JGHXyDNga0ohI7kpKgkO9p7U1YCaKmUdK0kODByezqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaJBoK14; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaJBoK14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789771426; x=1821307426;
  h=date:from:to:cc:subject:message-id;
  bh=2cSustd2Rp6D55dc++Ut1xARzzyFWfxFaCYewsRBFDs=;
  b=AaJBoK14072zl7SrQKEE6FPmqICAj6VK9cwwQ+WINyydQuchxDUwXlAf
   iraShn8kBL42pfxIGjXn6oI9pqZiUGonwvC3mEFPqrgXXBJH43T2c7YaG
   ED4C8gHz5o2wjatgfAbPdy6gez2E/QovfBppiVZ4/HdLgBSxfJgCDWEac
   KoHU1o8e5iNLHQLpye7VeeXzQKZ3jVClL3Pw7BlBZkNTPGCRP5dgwcbpp
   CrAVcLNf9oridmLbiTncaU5mPDfgirrHYYcHmvp8tmSNV3rhBAjn+xrZ7
   NLVS4ksmaBfKm8bMPpQ49JS9YEpDntF8hlSqgjgGmef4hASxNd4J4eJcB
   Q==;
X-CSE-ConnectionGUID: RtkvrlCoQT6Wcy7IoaPB9g==
X-CSE-MsgGUID: ivhV875KRuuJ4jFRT8NOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90321276"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90321276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 15:43:45 -0700
X-CSE-ConnectionGUID: bsfN1H9YSq+6aHRo3EQ8qA==
X-CSE-MsgGUID: RAoWP09BREam85LAP9N+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270325233"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2026 15:43:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7hIy-00000000AQj-3zgG;
	Fri, 18 Sep 2026 22:43:40 +0000
Date: Sat, 19 Sep 2026 06:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 5531/8449]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:456:31: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202609190650.liMAzwjF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: f45438c015291f26e99f7fe355c4c191b5750f8d [5531/8449] KVM: arm64: gic-v5: Create and manage VM and VPE tables
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190650.liMAzwjF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190650.liMAzwjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190650.liMAzwjF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:456:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vmd_base @@     got void *[assigned] vmd @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:456:31: sparse:     expected void [noderef] __iomem *vmd_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:456:31: sparse:     got void *[assigned] vmd
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:497:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base @@     got restricted __le64 [usertype] *[assigned] vpet @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:497:24: sparse:     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:497:24: sparse:     got restricted __le64 [usertype] *[assigned] vpet
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:585:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:585:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:585:18: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:586:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *vmd_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:586:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:586:18: sparse:     got void [noderef] __iomem *vmd_base
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:626:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:626:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:626:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:638:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] tmp @@     got unsigned long long @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:638:13: sparse:     expected restricted __le64 [usertype] tmp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:638:13: sparse:     got unsigned long long
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:641:17: sparse: sparse: cast from restricted __le64
   arch/arm64/kvm/vgic/vgic-v5-tables.c:674:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:674:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:674:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base

vim +456 arch/arm64/kvm/vgic/vgic-v5-tables.c

   385	
   386	/*
   387	 * Initialise an entry in the VMT based on the index of the VM.
   388	 *
   389	 * Note: We don't mark the VMTE as valid as this needs to be done by
   390	 * the hardware.
   391	 */
   392	int vgic_v5_vmte_init(struct kvm *kvm)
   393	{
   394		size_t vmd_alloc_size, vpet_alloc_size, vped_alloc_size;
   395		void *vped_base = NULL, *vmd = NULL;
   396		struct vgic_v5_vm_info *vmi = NULL;
   397		u64 tmp, vmte_val0 = 0, vmte_val1;
   398		u32 vm_id = vgic_v5_vm_id(kvm);
   399		int ret, nr_cpus, nr_vcpus;
   400		bool vmi_inserted = false;
   401		struct vmtl2_entry *vmte;
   402		vpe_entry *vpet = NULL;
   403		struct kvm_vcpu *vcpu;
   404		u16 max_vpe_id = 0;
   405		unsigned long i;
   406	
   407		nr_vcpus = atomic_read(&kvm->online_vcpus);
   408		if (nr_vcpus > vmt_info->max_vpes)
   409			return -E2BIG;
   410	
   411		/*
   412		 * If we're using two-level VMTs, L2 is allocated on demand. For linear
   413		 * VMTs, this is a NOP.
   414		 */
   415		ret = vgic_v5_alloc_l2_vmt(kvm);
   416		if (ret)
   417			return ret;
   418	
   419		vmte = vgic_v5_get_l2_vmte(vm_id);
   420		if (IS_ERR(vmte))
   421			return PTR_ERR(vmte);
   422	
   423		/* If the entry is already valid, something went wrong */
   424		scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
   425			vgic_v5_clean_inval(vmte, sizeof(*vmte));
   426			if (le64_to_cpu(READ_ONCE(vmte->val[0])) & GICV5_VMTEL2E_VALID)
   427				return -EINVAL;
   428		}
   429	
   430		ret = vgic_v5_reset_vmte(kvm);
   431		if (ret)
   432			return ret;
   433	
   434		vmi = kzalloc_obj(*vmi);
   435		if (!vmi) {
   436			ret = -ENOMEM;
   437			goto out_fail;
   438		}
   439	
   440		ret = xa_insert(&vm_info, vm_id, vmi, GFP_KERNEL);
   441		if (ret)
   442			goto out_fail;
   443		vmi_inserted = true;
   444	
   445		/* Allocate and assign the VM Descriptor, if required. */
   446		if (vmt_info->vmd_size != 0) {
   447			vmd_alloc_size = round_up(vmt_info->vmd_size,
   448						  dma_get_cache_alignment());
   449			vmd = kzalloc(vmd_alloc_size, GFP_KERNEL);
   450			if (!vmd) {
   451				ret = -ENOMEM;
   452				goto out_fail;
   453			}
   454	
   455			/* Stash the VA so we can free it later */
 > 456			vmi->vmd_base = vmd;
   457	
   458			tmp = FIELD_PREP(GICV5_VMTEL2E_VMD_ADDR,
   459					 virt_to_phys(vmd) >> GICV5_VMTEL2E_VMD_ADDR_SHIFT);
   460			vmte_val0 = tmp;
   461		}
   462	
   463		/*
   464		 * Allocate and assign the VPE Table.
   465		 *
   466		 * First of all, iterate over all vcpus to find the highest VPE ID we
   467		 * require - we need to ensure that we have enough storage for all
   468		 * vcpu_id values that userspace has picked and not just the total
   469		 * number of vcpus. This gives us the number of VPEs required for the
   470		 * VM.
   471		 *
   472		 * Round up the number of VPEs to a whole power of two as we cannot
   473		 * describe non-powers-of-two in the VMTE field as it conveys the number
   474		 * of ID bits used and not the number of vPEs. IRS_IDR1.IAFFID_BITS is
   475		 * encoded as N - 1, so expose at least one VPE ID bit even for a
   476		 * single-vCPU VM to keep the views consistent.
   477		 */
   478		kvm_for_each_vcpu(i, vcpu, kvm) {
   479			u16 vpe_id = vgic_v5_vpe_id(vcpu);
   480	
   481			if (vpe_id > max_vpe_id)
   482				max_vpe_id = vpe_id;
   483		}
   484	
   485		nr_cpus = max(2UL, roundup_pow_of_two(max_vpe_id + 1));
   486		vmi->vpe_id_bits = fls(nr_cpus) - 1;
   487	
   488		vpet_alloc_size = round_up((size_t)nr_cpus * sizeof(*vpet),
   489					   dma_get_cache_alignment());
   490		vpet = kzalloc(vpet_alloc_size, GFP_KERNEL);
   491		if (!vpet) {
   492			ret = -ENOMEM;
   493			goto out_fail;
   494		}
   495	
   496		/* Stash the VA so we can free it later */
 > 497		vmi->vpet_base = vpet;
   498	
   499		tmp = FIELD_PREP(GICV5_VMTEL2E_VPET_ADDR,
   500				 virt_to_phys(vpet) >> GICV5_VMTEL2E_VPET_ADDR_SHIFT);
   501		tmp |= FIELD_PREP(GICV5_VMTEL2E_VPE_ID_BITS, vmi->vpe_id_bits);
   502		vmte_val1 = tmp;
   503	
   504		/*
   505		 * Allocate a dense VPED array indexed by vcpu_idx. The VPET is indexed
   506		 * by the potentially sparse vcpu_id, but using that ID here would waste
   507		 * memory. Given that this is not userspace visible, we can cheat a bit
   508		 * and use the dense index instead. This is the ONLY place that we do
   509		 * this.
   510		 *
   511		 * Round the requested size up to a whole cacheline. kzalloc() gurantees
   512		 * natural alignment, so we ensure that the cachelines cannot be shared
   513		 * with unrelated slab objects. VPED and cacheline sizes are powers of
   514		 * two, so this also preserves the required VPED alignment when a VPED
   515		 * is larger than a cacheline.
   516		 */
   517		vped_alloc_size = round_up((size_t)nr_vcpus * vmt_info->vped_size,
   518					   dma_get_cache_alignment());
   519		vped_base = kzalloc(vped_alloc_size, GFP_KERNEL);
   520		if (!vped_base) {
   521			ret = -ENOMEM;
   522			goto out_fail;
   523		}
   524		vmi->vped_base = vped_base;
   525	
   526		if (vmd)
   527			vgic_v5_clean_inval(vmd, vmd_alloc_size);
   528		vgic_v5_clean_inval(vpet, vpet_alloc_size);
   529		vgic_v5_clean_inval(vped_base, vped_alloc_size);
   530	
   531		/* Publish the VMTE while serialising access to the shared VMT. */
   532		scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
   533			WRITE_ONCE(vmte->val[0], cpu_to_le64(vmte_val0));
   534			WRITE_ONCE(vmte->val[1], cpu_to_le64(vmte_val1));
   535			vgic_v5_clean_inval(vmte, sizeof(*vmte));
   536		}
   537	
   538		kvm->arch.vgic.gicv5_vm.vmte_allocated = true;
   539	
   540		return 0;
   541	
   542	out_fail:
   543		/* kfree(NULL) is safe so we can just kfree() at leisure */
   544		kfree(vmd);
   545		kfree(vpet);
   546		kfree(vped_base);
   547		if (vmi_inserted)
   548			xa_erase(&vm_info, vm_id);
   549		kfree(vmi);
   550	
   551		vgic_v5_reset_vmte(kvm);
   552	
   553		return ret;
   554	}
   555	
   556	/*
   557	 * Release the VMT Entry, freeing up any allocated data structures before
   558	 * zeroing the VMTE.
   559	 *
   560	 * The VMTE must be marked as invalid before it is released.
   561	 */
   562	int vgic_v5_vmte_release(struct kvm *kvm)
   563	{
   564		u32 vm_id = vgic_v5_vm_id(kvm);
   565		struct vgic_v5_vm_info *vmi;
   566		struct vmtl2_entry *vmte;
   567		int ret;
   568	
   569		vmte = vgic_v5_get_l2_vmte(vm_id);
   570		if (IS_ERR(vmte))
   571			return PTR_ERR(vmte);
   572	
   573		/* Reject if the VMTE has not been marked as invalid! */
   574		scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
   575			vgic_v5_clean_inval(vmte, sizeof(*vmte));
   576			if (le64_to_cpu(READ_ONCE(vmte->val[0])) & GICV5_VMTEL2E_VALID)
   577				return -EINVAL;
   578		}
   579	
   580		vmi = xa_load(&vm_info, vm_id);
   581		if (!vmi)
   582			goto no_vmi;
   583	
   584		kfree(vmi->vped_base);
 > 585		kfree(vmi->vpet_base);
 > 586		kfree(vmi->vmd_base);
   587	
   588		xa_erase(&vm_info, vm_id);
   589		kfree(vmi);
   590	
   591	no_vmi:
   592		/*
   593		 * If we didn't get far enough into allocating a VMTE to create the VM
   594		 * info structure, then we just zero the VMTE and move on. There's
   595		 * nothing else we can realistically do here.
   596		 */
   597		ret = vgic_v5_reset_vmte(kvm);
   598		if (ret)
   599			return ret;
   600	
   601		kvm->arch.vgic.gicv5_vm.vmte_allocated = false;
   602	
   603		return 0;
   604	}
   605	
   606	/* Provide the preallocated VPE descriptor to the hardware via the VPE Table. */
   607	int vgic_v5_vmte_alloc_vpe(struct kvm_vcpu *vcpu)
   608	{
   609		u32 vm_id = vgic_v5_vm_id(vcpu->kvm);
   610		u16 vpe_id = vgic_v5_vpe_id(vcpu);
   611		struct vgic_v5_vm_info *vmi;
   612		vpe_entry tmp, *vpet_base;
   613		void *vped;
   614	
   615		/* Make sure we're not over what the hardware supports */
   616		if (vpe_id >= vmt_info->max_vpes)
   617			return -E2BIG;
   618	
   619		vmi = xa_load(&vm_info, vm_id);
   620		if (!vmi)
   621			return -EINVAL;
   622	
   623		if (vpe_id >= 1 << vmi->vpe_id_bits)
   624			return -E2BIG;
   625	
 > 626		vpet_base = vmi->vpet_base;
   627	
   628		/* If the VPETE for this CPU is already valid we've gone wrong */
   629		scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
   630			vgic_v5_clean_inval(&vpet_base[vpe_id], sizeof(*vpet_base));
   631			if (le64_to_cpu(READ_ONCE(vpet_base[vpe_id])) & GICV5_VPE_VALID)
   632				return -EBUSY;
   633		}
   634	
   635		vped = (u8 *)vmi->vped_base +
   636			(size_t)vcpu->vcpu_idx * vmt_info->vped_size;
   637	
 > 638		tmp = FIELD_PREP(GICV5_VPED_ADDR, virt_to_phys(vped) >> GICV5_VPED_ADDR_SHIFT);
   639	
   640		scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
 > 641			WRITE_ONCE(vpet_base[vpe_id], cpu_to_le64(tmp));
   642			vgic_v5_clean_inval(vpet_base + vpe_id, sizeof(vpe_entry));
   643		}
   644	
   645		return 0;
   646	}
   647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
