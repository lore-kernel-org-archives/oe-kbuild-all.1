Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D132BF38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484247; cv=none; b=tjftUDkPbRF1LXExMwVg0TuoSDr+nwjvZhTGXBd6Ybl+nbfPlq5cFcKNvG9t/1vpad2M+C4qrhF3dCZ3ljifNG2qecgxnedv6GaE+A2akHYNJnXCov4eZYyb8PPN+u5vRnHlA1pdw/UOvevCS2tgGlTIhHJ/x/3KW0E+0oKidcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484247; c=relaxed/simple;
	bh=qj4QEAihXlsQNlgJauaO3CmNuKYw58EgVmTxBEJ09ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WR23xUDpz9LjP4CvYeVO4KXtgjjSfAg84VQFlCtV9YO4PFIWfhbIL8xk3eM9QsTj1KOl+X09qfvZZLVp2HvpcJ6AnEa+Ox3LiT/nRIDdrnQu5ODImavEXWT+ZK0UCcIr4WhFwJKoZkKrDSh14Xj7mbCn9OTTo+S3LOdR0+ut0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGFBR3E5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGFBR3E5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766484246; x=1798020246;
  h=date:from:to:cc:subject:message-id;
  bh=qj4QEAihXlsQNlgJauaO3CmNuKYw58EgVmTxBEJ09ok=;
  b=kGFBR3E59rL4NIxD3T6BoEo1/4YcHJ8k1oSxB9LFc0MoWHFpa9vdfbbz
   wERffFGbK4Xn7hNvXlrxTnlaYIFKx+VpGKy9BdAHf67lPVC53r0EP7NUS
   kUXlhED2TeWbSU3cdC0RLnqbB6OzrDqQ3TVocgNYv/XXkjFDkdPcDZzV1
   nbwive+riEcnoEHS/zWMCJKfLGRVIofVSDPDLulFhlZv4Vg3qLujNWIYy
   7aZQjBW/MI9/g6AX1wjCgrp8LVu2Kfp2F11G3wppUhkgYfps5BGgWF8bM
   6iVzmxelt4z1nNn42URhnURbEHa8bgYUj2WKnB8C3GDx9h2hE44PUEjNZ
   w==;
X-CSE-ConnectionGUID: dHBuX549QSm+dhxIwhTDrA==
X-CSE-MsgGUID: vyeRcXIxST+MJoQeGuqAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68270542"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68270542"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:04:06 -0800
X-CSE-ConnectionGUID: uDhFuWaXQLq2uW6SejGaag==
X-CSE-MsgGUID: Xx9F9QUdS1WLtVygN3ahvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198986343"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 02:04:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzFJ-000000001ij-1Urm;
	Tue, 23 Dec 2025 10:04:01 +0000
Date: Tue, 23 Dec 2025 18:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 62/82]
 arch/arm64/kvm/vgic/vgic-v5.c:896:2-7: WARNING: NULL check before some
 freeing functions is not needed.
Message-ID: <202512231705.sZJLmMXm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 9c3aa62ac1b11cec38e958d7f7bf033bf308902d [62/82] KVM: arm64: gic-v5: Add IRS init/teardown to vgic_v5 init/teardown
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231705.sZJLmMXm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231705.sZJLmMXm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-v5.c:896:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +896 arch/arm64/kvm/vgic/vgic-v5.c

   858	
   859	void vgic_v5_teardown(struct kvm *kvm)
   860	{
   861		struct kvm_vcpu *vcpu, *vcpu0;
   862		struct vgic_dist *dist = &kvm->arch.vgic;
   863		unsigned long i;
   864		int rc;
   865	
   866		/*
   867		 * There's a chance we don't have CPUs yet, in which case we've also not
   868		 * initialised the tables.
   869		 */
   870		if (!atomic_read(&kvm->online_vcpus))
   871			goto out_no_vcpus;
   872	
   873		/* Make the VM invalid  */
   874		vcpu0 = kvm_get_vcpu(kvm, 0);
   875		rc = vgic_v5_send_command(vcpu0, VMTE_MAKE_INVALID);
   876		if (rc)
   877			kvm_err("could not make VMTE invalid\n");
   878	
   879		kvm_for_each_vcpu(i, vcpu, kvm) {
   880			/* Goodbye doorbell */
   881			vgic_v5_disable_vcpu(vcpu);
   882	
   883			if (vgic_v5_vmte_free_vpe(vcpu))
   884				kvm_err("Failed to free VPE\n");
   885		}
   886	
   887		vgic_v5_teardown_per_vm_domain(&kvm->arch.vgic.gicv5_vm);
   888	
   889		if (vgic_v5_vmte_release(kvm))
   890			kvm_err("Failed to release VM 0x%x\n", dist->gicv5_vm.vm_id);
   891	
   892		vgic_v5_release_vm_id(kvm);
   893	
   894	out_no_vcpus:
   895		if (dist->vgic_v5_irs_data)
 > 896			kfree(dist->vgic_v5_irs_data);
   897		dist->vgic_v5_irs_data = NULL;
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
