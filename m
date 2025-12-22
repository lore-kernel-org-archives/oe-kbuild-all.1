Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC7309EF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 19:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433325; cv=none; b=oitJ9E7JdmOuOax33X2jrsLNA0UbZ1oafXsmR0Sxjy7D5jsMs7JIE/bufVcDY8M0vmGr34suI8IDCGKipS2QyTkxxxIUD77Pvun34qsr89Wb5Qe7EzZxBKnQq5Fd9+2bhnzc73HkvFUMyYlatE+xtgVzEQiz1TtxYCw5v1Z3sgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433325; c=relaxed/simple;
	bh=2F/VJzaUifzPWgFf8CsuOUNTjqEWrPAZZcR4Vb4Lif4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eI4h1s+Purlsi2jdL+MuQqnyECBxviwt90X1CGppXYc5q4czNT5cnVY98JQbqGh/rdqoF+XFPdYBMEiMBYcHIm7p5Jbu6w3MkDOdx1qPjxkW7vwLirHxa0yR4raXQGNh3rKrFv2Z2Av0+tRAuNF9YkT0++DYkzSRE0dOi53yaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc/zZ5ib; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc/zZ5ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766433323; x=1797969323;
  h=date:from:to:cc:subject:message-id;
  bh=2F/VJzaUifzPWgFf8CsuOUNTjqEWrPAZZcR4Vb4Lif4=;
  b=Kc/zZ5ibUekr/seAW9Hgh/HdLPi7zWATY1Ybqq46pEjpfZPcLLBKiBtb
   1P+oU2Gh2fR///viLjw/5/b5gZgXkDu163BQBrDxUapKF5ddkKRi1ZP0O
   FegJf02Jn9LbaJhEDi9gwUMGdnLYuvj7hFed1FVPvxQvrn5OvK1d88fda
   rMnKbeBfYBz1GlLFoUjowh3wBvZ3aob2uBWGKxavGaY4bQs3/Yjt0Yxo/
   EFtDQGKivJb/77KDbZKCwy2vefSQ+hVxuhNjV58fIMre1m1Biwp9Y6CGF
   0k5grd8doZhT19j7jdbZ0DxyfsIHJqsioqem/t27A7UQejk+p4oEaswQI
   A==;
X-CSE-ConnectionGUID: sJx2vlVRRBKD+uAR3b3pSw==
X-CSE-MsgGUID: JQoz2LkQQBa8eiyQdwFSQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71920597"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="71920597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:55:22 -0800
X-CSE-ConnectionGUID: oyFPog87T1u+LRlFLojpFg==
X-CSE-MsgGUID: 0urkKI1qRBqkY3Qw4KxrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199589774"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 11:55:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlzy-0000000013l-3XVe;
	Mon, 22 Dec 2025 19:55:18 +0000
Date: Tue, 23 Dec 2025 03:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 79/82]
 arch/arm64/kvm/vgic/vgic-kvm-device.c:814:15: warning: variable 'addr' set
 but not used
Message-ID: <202512230356.D7sdAEag-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 68c9d49d6ae8b462ac80a902806969a43ac20de0 [79/82] KVM: arm64: gic-v5: Plumb in has/set/get for sysregs & IRS
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230356.D7sdAEag-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230356.D7sdAEag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230356.D7sdAEag-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-kvm-device.c: In function 'vgic_v5_attr_regs_access':
>> arch/arm64/kvm/vgic/vgic-kvm-device.c:814:15: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     814 |         gpa_t addr;
         |               ^~~~
--
   arch/arm64/kvm/vgic/vgic-irs-v5.c: In function 'vgic_v5_has_attr_regs':
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:988:15: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     988 |         gpa_t addr, offset;
         |               ^~~~


vim +/addr +814 arch/arm64/kvm/vgic/vgic-kvm-device.c

   801	
   802	/*
   803	 * vgic_v5_attr_regs_access - allows user space to access VGIC v5 state
   804	 *
   805	 * @dev:      kvm device handle
   806	 * @attr:     kvm device attribute
   807	 * @is_write: true if userspace is writing a register
   808	 */
   809	static int vgic_v5_attr_regs_access(struct kvm_device *dev,
   810					    struct kvm_device_attr *attr,
   811					    bool is_write)
   812	{
   813		struct vgic_reg_attr reg_attr;
 > 814		gpa_t addr;
   815		struct kvm_vcpu *vcpu;
   816		bool uaccess;
   817		u64 val;
   818		int ret;
   819	
   820		ret = vgic_v5_parse_attr(dev, attr, &reg_attr);
   821		if (ret)
   822			return ret;
   823	
   824		vcpu = reg_attr.vcpu;
   825		addr = reg_attr.addr;
   826	
   827		switch (attr->group) {
   828		case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
   829			/* Sysregs uaccess is performed by the sysreg handling code */
   830			uaccess = false;
   831			break;
   832		case KVM_DEV_ARM_VGIC_GRP_IRS_REGS: fallthrough;
   833		default:
   834			uaccess = true;
   835		}
   836	
   837		if (uaccess && is_write) {
   838			u64 __user *uaddr = (u64 __user *)(unsigned long)attr->addr;
   839			if (get_user(val, uaddr))
   840				return -EFAULT;
   841		}
   842	
   843		mutex_lock(&dev->kvm->lock);
   844	
   845		if (kvm_trylock_all_vcpus(dev->kvm)) {
   846			mutex_unlock(&dev->kvm->lock);
   847			return -EBUSY;
   848		}
   849	
   850		mutex_lock(&dev->kvm->arch.config_lock);
   851	
   852		if (!(vgic_initialized(dev->kvm) || v5_reg_allowed_pre_init(attr))) {
   853			ret = -EBUSY;
   854			goto out;
   855		}
   856	
   857		switch (attr->group) {
   858		case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
   859			ret = vgic_v5_cpu_sysregs_uaccess(vcpu, attr, is_write);
   860			break;
   861		case KVM_DEV_ARM_VGIC_GRP_IRS_REGS:
   862			ret = vgic_v5_irs_attr_regs_access(dev, attr, &val, is_write);
   863			break;
   864		default:
   865			ret = -EINVAL;
   866			break;
   867		}
   868	
   869	out:
   870		mutex_unlock(&dev->kvm->arch.config_lock);
   871		kvm_unlock_all_vcpus(dev->kvm);
   872		mutex_unlock(&dev->kvm->lock);
   873	
   874		if (!ret && uaccess && !is_write) {
   875			u64 __user *uaddr = (u64 __user *)(unsigned long)attr->addr;
   876			ret = put_user(val, uaddr);
   877		}
   878	
   879		return ret;
   880	}
   881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
