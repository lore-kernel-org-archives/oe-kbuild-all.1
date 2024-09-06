Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5F953370
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725599290; cv=none; b=XqCwQVz62hTFm2w20MJhtNEzPoXfRSc9aHCOj58bZCsL47QUfNvCCEDrZObS2cKkei5RTGqscp3Cn33LPqCvTVjMpJ8xaSJiDcMmXe8N7yz2RHHvkvyN6LO3rXfqUqAKHKh7grOJtHptxbQyUJvP74+hOShq/yyryTAoXyOACjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725599290; c=relaxed/simple;
	bh=3oewD/OiHFheRKMZF4IINhAmDl7Z2paYVC79WnydlkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l9ITrvWisDGnydG1k217Dn0GawzwtQJNbAVdJW7VZtUONxg1L9y25m0vP9FvUdeJrT0WGTRopl8dL6651JkbG27l3DvwNUuAd283qYY4rDGpxBhmQfLSKC5NFl3LaO5y6C3gCsikLGiyy+b6a5MgMC2LuqHAw40HuKQlyWA7iLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWgEBHvE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWgEBHvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725599288; x=1757135288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oewD/OiHFheRKMZF4IINhAmDl7Z2paYVC79WnydlkY=;
  b=hWgEBHvEx/t2nq830c+d+uIII9hNqXM7iHewo/dD0wfBE5WkuAYwtfqR
   QwCM/e2Uw7de+t1U4fc0Av9uzPpRNNYEE6oAyg4fvwe8LE19FSYB0h2iQ
   DOrjzAg/dCK7uzyeqtLNZ0Tq/oFigwJLHWDLL7dKywXuStWH4Eg2eZeRB
   esv4tx2QdzhcMyEcdCRvRecg8bfN/C2/HyulfafYW0Wticlg4qLm75rpz
   +fJ/qFqqaFfkPa8S59Vgqwb07HU+KZVltwB3NPp5hFub4ITppp23vVQK7
   Of9etlaGSUXqTw7ul/SFOqdIhcRgHTOaeur4It/NHYYcGUfyHJ89FCXNh
   A==;
X-CSE-ConnectionGUID: Y/27/xs0RT20MmcMmt3KQw==
X-CSE-MsgGUID: p2M30FNbR0CxEC16veg/Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35700924"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35700924"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 22:08:08 -0700
X-CSE-ConnectionGUID: uVsrDO+9SfeaVKyc12z+Hw==
X-CSE-MsgGUID: stG5QCcURziA27iPVm4Cfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="96624865"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Sep 2024 22:08:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smRCW-000Aff-11;
	Fri, 06 Sep 2024 05:08:04 +0000
Date: Fri, 6 Sep 2024 13:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/nv-next-fruit 28/41]
 arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for
 kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked()
 instead
Message-ID: <202409061219.GYpMLM90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next-fruit
head:   2effaa4531a1db05fd6e9b1ac8ba6f2f6be03c2a
commit: c34444227845ba6ce5c03a780f38cd92ac5b6605 [28/41] KVM: arm64: nv: Nested GICv3 Support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240906/202409061219.GYpMLM90-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061219.GYpMLM90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061219.GYpMLM90-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-init.c:207: warning: expecting prototype for kvm_vgic_vcpu_init(). Prototype was for vgic_allocate_private_irqs_locked() instead


vim +207 arch/arm64/kvm/vgic/vgic-init.c

c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  196  
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  197  /**
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  198   * kvm_vgic_vcpu_init() - Initialize static VGIC VCPU data
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  199   * structures and register VCPU-specific KVM iodevs
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  200   *
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  201   * @vcpu: pointer to the VCPU being created and initialized
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  202   *
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  203   * Only do initialization, but do not actually enable the
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  204   * VGIC CPU interface
c34444227845ba arch/arm64/kvm/vgic/vgic-init.c Marc Zyngier     2016-12-02  205   */
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
