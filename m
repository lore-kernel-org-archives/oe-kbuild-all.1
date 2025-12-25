Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD26A33B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632711; cv=none; b=HKffAseTDkz374MQXopyuhhQ3JafFBL0YWJYR3lr6nRksRTngvMBGmV/iEHDvJipw0cXC0AlQzdkrnKOZVJtdxKcK18BB+W7a4vnSgV9aKbo46XUg/HBw1dX2cyBMuE+iNkKCA6zX1ix+ah6nBxAyiAhH8izHAE6ggZSqnvIfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632711; c=relaxed/simple;
	bh=mMrR2AG0VGJCnPkq3QezzVkdcLuNHqEO/1wHZuwsLhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NxqkwP/zf/8wDOE0Ec0TXfLoSwjbFVLPLhGdZ4tpuzZJZfDBBEzT8oIqjLS/0wQ9n4rn3Hm7rqwEbd1Pq0BcivZ3oZOSBdc24B1UOuulyVlfNc0XHE5WuxrEGnpNxTOi5WoLJQ6ztQFTpHGsvvFEs3ARNwNzG2DpxA0VzCLXMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6rrZ+iF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6rrZ+iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766632709; x=1798168709;
  h=date:from:to:cc:subject:message-id;
  bh=mMrR2AG0VGJCnPkq3QezzVkdcLuNHqEO/1wHZuwsLhM=;
  b=i6rrZ+iFIjH+hNaacRQuyhfKopQoGmhiQAyDpx8gXbDcb2bA8b0FtpMt
   TztLdASiPVS6wavoS5iEb0grjiUsZOPTeH/G7Ii2T7aURucwIOtDQsmvr
   RJAt3mbLxO3ih3PfEIMpu11amD4H0cDf08cpeFWU3mhjFsRFJeMxrGh4o
   Oe69hR4UN4ZD9VpyjVnFUCK9xqFtTMRjpAYLEQEr9uWOVtJHa9tlVhD3p
   Of6AkUKSfZrk0tTltraNdyYDS0zZSvVvvyZ6sV8klKyBEn0YpKIWaTKs7
   NGJOEtM5DIIOZfV+2B4V4yqvaAQtWoRhGJ2OA6Wz13Oe+r0x8lLzj5bpO
   A==;
X-CSE-ConnectionGUID: WZSsB2pKTGKBctk9aBGSdQ==
X-CSE-MsgGUID: hNL/hfvIS62QYrxHyPxEdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79813742"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79813742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 19:18:29 -0800
X-CSE-ConnectionGUID: TJZdQ2U2R2exi0kTvKO/Qg==
X-CSE-MsgGUID: /wN3Z4yyRn6gE9r7PA2klg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200111038"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Dec 2025 19:18:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbrs-000000003gx-480w;
	Thu, 25 Dec 2025 03:18:24 +0000
Date: Thu, 25 Dec 2025 11:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 17/55]
 arch/riscv/kvm/aia_imsic.c:837:2: warning: variable 'vcpu' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202512251119.oP4Yv9i2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: ff583e186334a17f272dfcbf2f086ddb336b0fb0 [17/55] RISC-V: KVM: Add guest file irqbypass support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512251119.oP4Yv9i2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251119.oP4Yv9i2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251119.oP4Yv9i2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/aia_imsic.c:837:2: warning: variable 'vcpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     837 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1012:6: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/aia_imsic.c:841:7: note: uninitialized use occurs here
     841 |         if (!vcpu)
         |              ^~~~
   arch/riscv/kvm/aia_imsic.c:837:2: note: remove the 'if' if its condition is always true
     837 |         kvm_for_each_vcpu(tmp, vcpu, kvm) {
         |         ^
   include/linux/kvm_host.h:1012:2: note: expanded from macro 'kvm_for_each_vcpu'
    1012 |         if (atomic_read(&kvm->online_vcpus))                            \
         |         ^
   arch/riscv/kvm/aia_imsic.c:804:23: note: initialize the variable 'vcpu' to silence this warning
     804 |         struct kvm_vcpu *vcpu;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +837 arch/riscv/kvm/aia_imsic.c

   793	
   794	void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
   795					   struct kvm_kernel_irq_routing_entry *old,
   796					   struct kvm_kernel_irq_routing_entry *new)
   797	{
   798		struct riscv_iommu_ir_vcpu_info vcpu_info;
   799		struct kvm *kvm = irqfd->kvm;
   800		struct kvm_aia *aia = &kvm->arch.aia;
   801		int host_irq = irqfd->producer->irq;
   802		struct irq_data *irqdata = irq_get_irq_data(host_irq);
   803		unsigned long tmp, flags;
   804		struct kvm_vcpu *vcpu;
   805		struct imsic *imsic;
   806		struct msi_msg msg;
   807		u64 msi_addr_mask;
   808		gpa_t target;
   809		int ret;
   810	
   811		if (old && old->type == KVM_IRQ_ROUTING_MSI &&
   812		    new && new->type == KVM_IRQ_ROUTING_MSI &&
   813		    !memcmp(&old->msi, &new->msi, sizeof(new->msi)))
   814			return;
   815	
   816		if (!new) {
   817			if (!WARN_ON_ONCE(!old) && old->type == KVM_IRQ_ROUTING_MSI) {
   818				ret = irq_set_vcpu_affinity(host_irq, NULL);
   819				WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   820			}
   821			return;
   822		}
   823	
   824		if (new->type != KVM_IRQ_ROUTING_MSI)
   825			return;
   826	
   827		target = ((gpa_t)new->msi.address_hi << 32) | new->msi.address_lo;
   828		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
   829			return;
   830	
   831		msg = (struct msi_msg){
   832			.address_hi = new->msi.address_hi,
   833			.address_lo = new->msi.address_lo,
   834			.data = new->msi.data,
   835		};
   836	
 > 837		kvm_for_each_vcpu(tmp, vcpu, kvm) {
   838			if (target == vcpu->arch.aia_context.imsic_addr)
   839				break;
   840		}
   841		if (!vcpu)
   842			return;
   843	
   844		msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
   845		vcpu_info = (struct riscv_iommu_ir_vcpu_info){
   846			.gpa = target,
   847			.msi_addr_mask = msi_addr_mask,
   848			.msi_addr_pattern = (target >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
   849			.group_index_bits = aia->nr_group_bits,
   850			.group_index_shift = aia->nr_group_shift,
   851		};
   852	
   853		imsic = vcpu->arch.aia_context.imsic_state;
   854	
   855		read_lock_irqsave(&imsic->vsfile_lock, flags);
   856	
   857		if (WARN_ON_ONCE(imsic->vsfile_cpu < 0))
   858			goto out;
   859	
   860		vcpu_info.hpa = imsic->vsfile_pa;
   861	
   862		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
   863		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
   864		if (ret)
   865			goto out;
   866	
   867		irq_data_get_irq_chip(irqdata)->irq_write_msi_msg(irqdata, &msg);
   868	
   869	out:
   870		read_unlock_irqrestore(&imsic->vsfile_lock, flags);
   871	}
   872	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
