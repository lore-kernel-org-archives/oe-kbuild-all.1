Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF13D8BEA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716026337; cv=none; b=aJHTJX3pnmRTTp9U7AcUg/A1tRD2Zct+y37wmqO9qyYnJmXmhttBvw0IjcOspEZ5Es+Ta9e1skCJXueAvcY9L+YkKqrAKQJ0nTdYrOOdYRejoi2qmm1OKB2JqoCMHXOkcyOUuicMTONF0iJTu2lQ1Pz6nbDU3jQr1Nrilc7FS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716026337; c=relaxed/simple;
	bh=ZL8YchsoioxhWf/3DK/P4p+u3WoYI4F2VX41bd656yM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQt3nVld1gHd4qupUQ275M+xLJRM9cYFxx4XlzEoRQM3zWEIdTOy8idJ7GdC2PYYeKrD6o1/VJt/fMgtlEm0UY5A2UBwjtJmtdW5tlXoXkMbbmOJ9bLMmCkGkRhee2RIai/bUXKP/7tQdqwvUpJG0sQNCcUwMwiSMLTRmFCLB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epVrZsus; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epVrZsus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716026336; x=1747562336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZL8YchsoioxhWf/3DK/P4p+u3WoYI4F2VX41bd656yM=;
  b=epVrZsusKRXc+N9USXVTzLOBOtFBEN436WkjkhKVwjpDb4dWgfJ5Y8EM
   9eQBnM+htvdW58yMDml5mgEXYfxxUlyAbko8fCCo0PwGjm3YQytspXPtO
   sBGvGyKntgHgxMeMnmMlhgmdDVKJ1IS7Dis7LPJbm9UfKn6rwEge9K1Fs
   YQ4qF37yQBSj5dNiESubRiCuLhzeNZX/chAI+qyCUSPF1qra/qD0kmoRh
   4dZ6qxoMMjQNKZykgJ2a59nOvqzYDA0CeXv9CVSzr4lp6q+EPVYsUL1eC
   V+i+3VXuOkH4OIf+HOWvPsx8C45zczUwFUbfuIZYETmvAofIKvgdBRghI
   Q==;
X-CSE-ConnectionGUID: DyevO8nbSLqQ7NMnKOK3HQ==
X-CSE-MsgGUID: n/QzdFSVSLaO+Z5Iq2V3UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12010356"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12010356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 02:58:55 -0700
X-CSE-ConnectionGUID: sQevgtt9TDaov9gjJ61/xw==
X-CSE-MsgGUID: iz3sIORoQdq0ZL+RCpEbmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36852322"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2024 02:58:53 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Gq2-00020m-36;
	Sat, 18 May 2024 09:58:50 +0000
Date: Sat, 18 May 2024 17:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 13/27]
 arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for
 kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked()
 instead
Message-ID: <202405181734.xxdMfE3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: 9c31912c50fbc81af0ff137d8d102d611b21a422 [13/27] KVM: arm64: nv: Nested GICv3 Support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181734.xxdMfE3p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181734.xxdMfE3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181734.xxdMfE3p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked() instead


vim +207 arch/arm64/kvm/vgic/vgic-init.c

9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  196  
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  197  /**
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  198   * kvm_vgic_vcpu_init() - Initialize static VGIC VCPU data
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  199   * structures and register VCPU-specific KVM iodevs
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  200   *
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  201   * @vcpu: pointer to the VCPU being created and initialized
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  202   *
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  203   * Only do initialization, but do not actually enable the
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  204   * VGIC CPU interface
9c31912c50fbc81 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  205   */
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  206  static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
1aab6f468c10a1e virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08 @207  {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  208  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  209  	int i;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  210  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  211  	lockdep_assert_held(&vcpu->kvm->arch.config_lock);
c011f4ea106b94e virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  212  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  213  	if (vgic_cpu->private_irqs)
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  214  		return 0;
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  215  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  216  	vgic_cpu->private_irqs = kcalloc(VGIC_NR_PRIVATE_IRQS,
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  217  					 sizeof(struct vgic_irq),
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  218  					 GFP_KERNEL_ACCOUNT);
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  219  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  220  	if (!vgic_cpu->private_irqs)
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  221  		return -ENOMEM;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  222  
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  223  	/*
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  224  	 * Enable and configure all SGIs to be edge-triggered and
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  225  	 * configure all PPIs as level-triggered.
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  226  	 */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  227  	for (i = 0; i < VGIC_NR_PRIVATE_IRQS; i++) {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  228  		struct vgic_irq *irq = &vgic_cpu->private_irqs[i];
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  229  
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  230  		INIT_LIST_HEAD(&irq->ap_list);
8fa3adb8c6beee4 virt/kvm/arm/vgic/vgic-init.c   Julien Thierry   2019-01-07  231  		raw_spin_lock_init(&irq->irq_lock);
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  232  		irq->intid = i;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  233  		irq->vcpu = NULL;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  234  		irq->target_vcpu = vcpu;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  235  		kref_init(&irq->refcount);
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  236  		if (vgic_irq_is_sgi(i)) {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  237  			/* SGIs */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  238  			irq->enabled = 1;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  239  			irq->config = VGIC_CONFIG_EDGE;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  240  		} else {
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  241  			/* PPIs */
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  242  			irq->config = VGIC_CONFIG_LEVEL;
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  243  		}
5ec17fbac6713be virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  244  	}
1aab6f468c10a1e virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08  245  
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  246  	return 0;
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  247  }
03b3d00a70b5585 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  248  

:::::: The code at line 207 was first introduced by commit
:::::: 1aab6f468c10a1ec3977fb6f7bc12869174d516e KVM: arm/arm64: Register iodevs when setting redist base and creating VCPUs

:::::: TO: Christoffer Dall <cdall@linaro.org>
:::::: CC: Christoffer Dall <cdall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
