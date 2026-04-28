Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE25326D51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390868; cv=none; b=mk2yK+Dc1JYFmvDTafp+1myaAjE51zZwJRKSwePSZZOslSG0NqBDuKCBwsNn43N5OTuN8xqvrBRl+eQAhxWm+GovUmHUM8vNRobfzUt3JspR9I2xPiVHbJGpeByoyTjPjeFuqqPcM9RA9L3w/eGZJipqJOMd4f9MFJLCthY/xLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390868; c=relaxed/simple;
	bh=SwFktZyQnHaWOcGqiO3VSqadri33vwcKjGtfvdeWQSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sxCPXgfdwHsIYpjyqiz8IGaTR7GvKvMevdzM40OIGt5WBMs+4zLHdqDkAUyOFXPWRm2RSSMJpVJMzBaCMe11+e/xFIydMT5X/XYLD9Cjog78jLOfo+RT8MnOIuQegE/AcatDEw8erzn8T5GBlerR+jZwwLWhrEumI35jpLNPXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0g8Ecu+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0g8Ecu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777390867; x=1808926867;
  h=date:from:to:cc:subject:message-id;
  bh=SwFktZyQnHaWOcGqiO3VSqadri33vwcKjGtfvdeWQSY=;
  b=N0g8Ecu+aSPSredbb6roZCJpgxtDuWEa/Irfj+hmPp6YS+pzTppCtYA1
   Nj/Bl1Vv4OatMIYpWsrRQ978rYYCKCP7Ebz4g9mI5+20ValaJMDx2Slbd
   j1oz8oRzaWvfr/ZTd7Z4WIyMzt9HnfdpIuuL4uP4i/G0j/7IMHOgqL508
   +xy1RVTOny178MI/EVjggnub/HlQEZeWtekgUmXTsYQHga9eiYe2WdCtq
   6DMP+FAlQM8WClifp2DWohNcns5Duc5It1ZPP5kDHNTTjZQULt8xFkLDM
   QnBlzbAt6HunhgABVeOqgpuW7Bpat1Fi4QtLDnvFQ3J1AYT1eUzIJw1u6
   w==;
X-CSE-ConnectionGUID: KEo/owSaT26Z2URPdRo09A==
X-CSE-MsgGUID: /8Urodh7QRWycOTNsBwZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="88612995"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="88612995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:41:07 -0700
X-CSE-ConnectionGUID: Sq1ANrTfRJS5rJYA/fTpmA==
X-CSE-MsgGUID: UddEichmRIi9oYAy/OqSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="272128778"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Apr 2026 08:41:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHkYY-000000009vA-1s8y;
	Tue, 28 Apr 2026 15:41:02 +0000
Date: Tue, 28 Apr 2026 23:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/no-lazy-vgic-init 22/26]
 include/kvm/arm_pmu.h:134:46: warning: no return statement in function
 returning non-void
Message-ID: <202604282305.uZdSNvk7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/no-lazy-vgic-init
head:   3bba2d1179c5198c5788cd387feeeba2070e7cd9
commit: 4c12b5742e18dbd00b0b59f3882478219d73b463 [22/26] KVM: arm64: Simplify userspace notification of interrupt state
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282305.uZdSNvk7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282305.uZdSNvk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282305.uZdSNvk7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~
--
   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~


vim +134 include/kvm/arm_pmu.h

   106	
   107	#define kvm_arm_pmu_irq_initialized(v)	(false)
   108	static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
   109						    u64 select_idx)
   110	{
   111		return 0;
   112	}
   113	static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
   114						     u64 select_idx, u64 val) {}
   115	static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
   116							  u64 select_idx, u64 val) {}
   117	static inline u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
   118	{
   119		return 0;
   120	}
   121	static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
   122	{
   123		return 0;
   124	}
   125	static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
   126	static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
   127	static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
   128	static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}
   129	static inline void kvm_pmu_sync_hwstate(struct kvm_vcpu *vcpu) {}
   130	static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
   131	{
   132		return false;
   133	}
 > 134	static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
   135	static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
   136	static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
   137	static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
   138							  u64 data, u64 select_idx) {}
   139	static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
   140						  struct kvm_device_attr *attr)
   141	{
   142		return -ENXIO;
   143	}
   144	static inline int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu,
   145						  struct kvm_device_attr *attr)
   146	{
   147		return -ENXIO;
   148	}
   149	static inline int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
   150						  struct kvm_device_attr *attr)
   151	{
   152		return -ENXIO;
   153	}
   154	static inline int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
   155	{
   156		return 0;
   157	}
   158	static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
   159	{
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
