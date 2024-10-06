Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A9148838
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728215657; cv=none; b=aIaAeZEzpyaCte24I5qD5dkbrPmb8xHJWBWEWgmi2+AzEvutoE7SQa5DrBnjhne0jlvvH1u5/7J3p9aBl29U0kJYsSoBiFpcavrrQVjg6S5Vx1iGkzqB14/WFI1au+KGE03HbJsqKu8fc2v9/dj5diaPt7KzWuhDcv4823DCNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728215657; c=relaxed/simple;
	bh=u9dJ+ZoztAtQlZlA9TMNTWTAreEU6AmH50IWaQqJjos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gnle35ZVUYAACnaSdg2cyjPeTKpB3es+3ikhl+Mnn0bzXD1qnGOXmUgn8HT7xRxWx4VOb41kfLhYc+OoDKjGmTchXi4k6DGG2uYDh1kVvjqVkTEMi8+RMDxwZNWn2fBoxss7og7rjIPAdJ/Iuc4GHbL665DfUFfeGqS/lYoqW/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYwZnVeu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYwZnVeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728215655; x=1759751655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9dJ+ZoztAtQlZlA9TMNTWTAreEU6AmH50IWaQqJjos=;
  b=OYwZnVeuqRbc95XvNKvMsJ9ZnMzdqWIAJSr9dUngPp4pFbzWyKCKiEBu
   YPxxCRoo4vC03208nRrqiOVpv/DGdaBfagyB9pFdCCi7JQNwVldhf2ams
   ADBa2Lu4grJ1oONlW+ldHURbZYeWPcdxKuDxHC81/AgoWknWRyX2Po92+
   3UVBm2H0dpKkDhTtOVj/1lph3Zwezi8Y+hwRcvXxwsYQdAEEQ1oIh4QcO
   yIbX1dgEiTCM8Y5XGBCudkfxbV2S8P7iMPPf8i6Sgos0WtyV/04deixNE
   lEGlvdpxcz/FNixYlElUDKLPIsRXx/9OQO75BwnhDld3X26PlPDBDWg8Q
   w==;
X-CSE-ConnectionGUID: Z8JQ/JZwRHu5rcdnfuLdWQ==
X-CSE-MsgGUID: KJTj5qqAS+Cw8nf1wkW0Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27519573"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="27519573"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 04:54:15 -0700
X-CSE-ConnectionGUID: 0AEd7BZWTveLJQQ6jZ2o6w==
X-CSE-MsgGUID: /arweKPHRq+tXpIPp0GzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79167650"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2024 04:54:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxPpz-0003p0-0K;
	Sun, 06 Oct 2024 11:54:11 +0000
Date: Sun, 6 Oct 2024 19:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/feat-fixes-6.12 23/49]
 arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for
 kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked()
 instead
Message-ID: <202410061913.pDWZMP8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat-fixes-6.12
head:   a93b14eac64358fe16486139d8dcb4cd938129ab
commit: 4cb676196d0573160815eb64c90a24a3812437a3 [23/49] KVM: arm64: nv: Nested GICv3 Support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241006/202410061913.pDWZMP8O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061913.pDWZMP8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061913.pDWZMP8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked() instead


vim +207 arch/arm64/kvm/vgic/vgic-init.c

4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  196  
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  197  /**
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  198   * kvm_vgic_vcpu_init() - Initialize static VGIC VCPU data
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  199   * structures and register VCPU-specific KVM iodevs
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  200   *
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  201   * @vcpu: pointer to the VCPU being created and initialized
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  202   *
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  203   * Only do initialization, but do not actually enable the
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  204   * VGIC CPU interface
4cb676196d0573 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  205   */
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  206  static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08 @207  {
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  208  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  209  	int i;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  210  
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  211  	lockdep_assert_held(&vcpu->kvm->arch.config_lock);
c011f4ea106b94 virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  212  
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  213  	if (vgic_cpu->private_irqs)
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  214  		return 0;
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  215  
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  216  	vgic_cpu->private_irqs = kcalloc(VGIC_NR_PRIVATE_IRQS,
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  217  					 sizeof(struct vgic_irq),
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  218  					 GFP_KERNEL_ACCOUNT);
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  219  
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  220  	if (!vgic_cpu->private_irqs)
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  221  		return -ENOMEM;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  222  
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  223  	/*
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  224  	 * Enable and configure all SGIs to be edge-triggered and
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  225  	 * configure all PPIs as level-triggered.
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  226  	 */
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  227  	for (i = 0; i < VGIC_NR_PRIVATE_IRQS; i++) {
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  228  		struct vgic_irq *irq = &vgic_cpu->private_irqs[i];
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  229  
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  230  		INIT_LIST_HEAD(&irq->ap_list);
8fa3adb8c6beee virt/kvm/arm/vgic/vgic-init.c   Julien Thierry   2019-01-07  231  		raw_spin_lock_init(&irq->irq_lock);
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  232  		irq->intid = i;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  233  		irq->vcpu = NULL;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  234  		irq->target_vcpu = vcpu;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  235  		kref_init(&irq->refcount);
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  236  		if (vgic_irq_is_sgi(i)) {
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  237  			/* SGIs */
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  238  			irq->enabled = 1;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  239  			irq->config = VGIC_CONFIG_EDGE;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  240  		} else {
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  241  			/* PPIs */
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  242  			irq->config = VGIC_CONFIG_LEVEL;
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  243  		}
5ec17fbac6713b virt/kvm/arm/vgic/vgic-init.c   Eric Auger       2018-05-22  244  	}
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-init.c   Christoffer Dall 2017-05-08  245  
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  246  	return 0;
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  247  }
03b3d00a70b558 arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2024-05-02  248  

:::::: The code at line 207 was first introduced by commit
:::::: 1aab6f468c10a1ec3977fb6f7bc12869174d516e KVM: arm/arm64: Register iodevs when setting redist base and creating VCPUs

:::::: TO: Christoffer Dall <cdall@linaro.org>
:::::: CC: Christoffer Dall <cdall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
