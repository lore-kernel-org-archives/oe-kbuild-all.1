Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981C3BB693
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211020; cv=none; b=WQEpW3QT7Mzc2h7eMhq5mYOcCG1EWZawT1d0Qjw4CgfHWvOFg/va+UoDl5dUr7j9VQ3HHBvwYDN/XqmU/90hmJEUj8oXgsIWQaTcWPywOWxOC8nJxm4uyVtnTTS2fHjHcjGB1UHgiP1Qqgh1jhyPlTtIQDuuqiKdyQfkgb+z/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211020; c=relaxed/simple;
	bh=ItiyVsXthgRv8vOv95xMPy30J6l3MUuc3hdmEX4KR/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l8CgJzgPFs0BVSjxu52OeJl5cScr8fKCspQztTTb/fpGCe3PNDXMDT4UKmISBCPOH8TmJLoZbGtWz9gq68zsYaGSd+MYzDghlxGsD7GGEmLhp1ws20S+4RpSltUPjSesDGUGkDrAmhFusSVhaSdZ1bKyCvaHNtTUXm3hDx21IWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZA283+b; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZA283+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787211017; x=1818747017;
  h=date:from:to:cc:subject:message-id;
  bh=ItiyVsXthgRv8vOv95xMPy30J6l3MUuc3hdmEX4KR/M=;
  b=RZA283+bxFxQ8uXJmui7lgU3z2VTdOXRQlIMgXf6cIHh8gE+Ke7rFSlM
   /LYdbT/L+oufY3CZUFu4OmqJ6mawZxEGJxm40MrVlbXLeBoWmNgHZca7m
   yhS6oPxE5YtnED/PdEeCWVBgVyg6cIjx43u6QWDw3tr9vEeDJI65tYOAF
   Jhe393lS+NCgpF+R+z6wGE8pd+X8mlmJKOgcFhlxo3jHpGvOLjcSHh5A9
   Fr1FXDzsrDTlDMleT6tOk1yKKkrCQgJnnO5/m6JJFsBisoruWecnwAfD3
   n1xkwqm7bWay/NExRhuHu8wrqqbIW8+tDidjON01WqAdlKe1EsOtsaOAP
   g==;
X-CSE-ConnectionGUID: wCE/Ue5DQAaN0skVjdN90w==
X-CSE-MsgGUID: T8fLjJr6TmOIybR3xkAOAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87759998"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87759998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 00:30:15 -0700
X-CSE-ConnectionGUID: Wfw82Eo0SGGZ0dlInF9vgA==
X-CSE-MsgGUID: KFmk21dcRPK7yNBvZDCr2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="304081277"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Aug 2026 00:30:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwxE3-00000000iEt-3Abg;
	Thu, 20 Aug 2026 07:30:11 +0000
Date: Thu, 20 Aug 2026 15:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v5 62/108]
 arch/riscv/kvm/aia_imsic.c:919:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202608201527.Z1qup2jT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   e58ea3f194d326370813c549a76ecdfa211a4768
commit: ccdd3c493dc8ce3acb64600af8437ebb28775ceb [62/108] RISC-V: KVM: Add guest file irqbypass support
config: riscv-randconfig-r061-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201527.Z1qup2jT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201527.Z1qup2jT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201527.Z1qup2jT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:919:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     919 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1012:6: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:923:7: note: uninitialized use occurs here
     923 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:919:2: note: remove the 'if' if its condition is always true
     919 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1012:2: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:883:23: note: initialize the variable 'vcpu' to silence this warning
     883 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +919 arch/riscv/kvm/aia_imsic.c

   872	
   873	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   874					   struct kvm_kernel_irq_routing_entry *old,
   875					   struct kvm_kernel_irq_routing_entry *new)
   876	{
   877		struct riscv_iommu_ir_vcpu_info vcpu_info;
   878		struct kvm *kvm = irqfd->kvm;
   879		struct kvm_aia *aia = &kvm->arch.aia;
   880		int host_irq;
   881		struct irq_data *irqdata;
   882		unsigned long tmp, flags;
   883		struct kvm_vcpu *vcpu;
   884		struct imsic *imsic;
   885		struct msi_msg msg;
   886		u64 msi_addr_mask;
   887		gpa_t target;
   888		int ret;
   889	
   890		host_irq = irqfd->producer->irq;
   891		irqdata = irq_get_irq_data(host_irq);
   892	
   893		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   894		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   895		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   896			return;
   897	
   898		if (!new) {
   899			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   900				ret = irq_set_vcpu_affinity(host_irq, NULL);
   901				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   902			}
   903			return;
   904		}
   905	
   906		if (new->type != KVM_IRQ_ROUTING_MSI)
   907			return;
   908	
   909		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   910		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   911			return;
   912	
   913		msg = (struct msi_msg){
   914			.address_hi = new->msi.address_hi,
   915			.address_lo = new->msi.address_lo,
   916			.data = new->msi.data,
   917		};
   918	
 > 919		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   920			if (target == vcpu->arch.aia_context.imsic_addr)
   921				break;
   922		}
   923		if (!vcpu)
   924			return;
   925	
   926		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   927		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   928			.gpa = target,
   929			.msi_addr_mask = msi_addr_mask,
   930			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   931			.group_index_bits = aia->nr_group_bits,
   932			.group_index_shift = aia->nr_group_shift,
   933		};
   934	
   935		imsic = vcpu->arch.aia_context.imsic_state;
   936	
   937		read_lock_irqsave(&imsic->vsfile_lock, flags);
   938	
   939		if (imsic->vsfile_cpu < 0)
   940			goto out;
   941	
   942		vcpu_info.hpa = imsic->vsfile_pa;
   943	
   944		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   945		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   946		if (ret)
   947			goto out;
   948	
   949		/*
   950		 * Unlike x86 (which updates the IRTE) and arm64 (which updates
   951		 * the ITS ITTE), RISC-V reprograms the device MSI target address
   952		 * to the guest IMSIC GPA. The device writes to the guest GPA;
   953		 * the IOMMU MSI table maps guest GPA -> host VS-file HPA.
   954		 */
   955		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   956	
   957	out:
   958		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   959	}
   960	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
