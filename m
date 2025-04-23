Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFF8BEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372733; cv=none; b=Q/leiDGZh8k2HREtsZ+wTvaKffzT8x6E8Ahxo+uDPF1kz1YXB65sGBa8kAd7Ah63VrnAAyCk8AE2eO/E+ZhRvW/yXiozgVr95BIL7MFT74aP+ACXwl3iLBzNgBXjhWPkeM6C2n/oldbqcgGL8wTLi8f+Yyo+RKG7GGpFd74p95I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372733; c=relaxed/simple;
	bh=TA3/pGOYdXW5RoY7eWhJTqCM2KqCoGEJgM6HwRclH7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJ3WRCl2g2jPabKlKMAvxnZTH/aAXCqpI4M6Pq+/niA0+cTwJ+fXk1d0wBRYxNdSylQAnvd5N6mQEWiLfuYN3FXPyyzXYIu8g5fufFyMKUBAy6YMxPyyeDIq4pqx7RWq0h26TWX0j9zu4eRAIYwX/NAcUfrUHsGpsUPCU3Jr9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCj4srIF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCj4srIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745372731; x=1776908731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TA3/pGOYdXW5RoY7eWhJTqCM2KqCoGEJgM6HwRclH7o=;
  b=VCj4srIF6DUCucT2XToPQs7jeXwTkYjZkrYhdo/UZQpZ0sV9N7ChFwEu
   v8InuzgsBfHe1Yc8o1Axky8fARG64Pcl6dy5+C0GKy0WLP7GP6sKFF5fV
   3ZkPbqvnP35IqAn6eIA5B5xhFZUKPbOlIn7+Nenz9qGFnQSKx4jLyq/Cc
   XDn5WhZij8e6R73riUp9lPqTkLRXuPGknooC/PIxbtPo51WZqYzJxoHQO
   u3RCko+EPfPsZ2ju+G9iYEeq2Z+PSCkIp0DVciVafV08sIxHGKPxQWL44
   vhRoJyVPkpu7fLThr3hd+z0Q09U6dsikoadBJYOu8JFSrKn/VIGzCK1Ez
   Q==;
X-CSE-ConnectionGUID: QZTFt897QIuqrE8uAGN7jQ==
X-CSE-MsgGUID: pEjBNcfrTeapF+jlkKp+Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46830232"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="46830232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 18:45:31 -0700
X-CSE-ConnectionGUID: MMSvH7YURsyxCVkRGZpYRg==
X-CSE-MsgGUID: 3ZfLjCl4SHGIP03B/YxAGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="163226011"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Apr 2025 18:45:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7PB1-0001W3-27;
	Wed, 23 Apr 2025 01:45:27 +0000
Date: Wed, 23 Apr 2025 09:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hejingxian <hejingxian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2153/2153] arch/arm64/kvm/arm.c:1037:11: error:
 no member named 'irq_level' in 'struct kvm_pmu'
Message-ID: <202504230942.5dFQC7IQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dabd2f7c9c1d6b9dad214ea61407781e0439d85d
commit: 1182be89002c268a781bd90b25f18da76cfea732 [2153/2153] pmu: enable pmu phys irq inject for cvm
config: arm64-randconfig-r062-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230942.5dFQC7IQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230942.5dFQC7IQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230942.5dFQC7IQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/arm.c:9:
   In file included from include/linux/entry-kvm.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/kvm/arm.c:139:7: warning: variable 'r' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     139 |                 if (static_branch_unlikely(&virtcca_cvm_is_available))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jump_label.h:504:40: note: expanded from macro 'static_branch_unlikely'
     504 | #define static_branch_unlikely(x)                                               \
         |                                                                                 ^
     505 | ({                                                                              \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     506 |         bool branch;                                                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     507 |         if (__builtin_types_compatible_p(typeof(*x), struct static_key_true))   \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     508 |                 branch = arch_static_branch_jump(&(x)->key, false);             \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     509 |         else if (__builtin_types_compatible_p(typeof(*x), struct static_key_false)) \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     510 |                 branch = arch_static_branch(&(x)->key, false);                  \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         else                                                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |                 branch = ____wrong_branch_error();                              \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     513 |         unlikely_notrace(branch);                                                       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     514 | })
         | ~~
   arch/arm64/kvm/arm.c:148:9: note: uninitialized use occurs here
     148 |         return r;
         |                ^
   arch/arm64/kvm/arm.c:139:3: note: remove the 'if' if its condition is always true
     139 |                 if (static_branch_unlikely(&virtcca_cvm_is_available))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                         r = kvm_cvm_enable_cap(kvm, cap);
   arch/arm64/kvm/arm.c:93:7: note: initialize the variable 'r' to silence this warning
      93 |         int r;
         |              ^
         |               = 0
>> arch/arm64/kvm/arm.c:1037:11: error: no member named 'irq_level' in 'struct kvm_pmu'
    1037 |         if (pmu->irq_level) {
         |             ~~~  ^
   arch/arm64/kvm/arm.c:1039:3: error: call to undeclared function 'arm_pmu_set_phys_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1039 |                 arm_pmu_set_phys_irq(false);
         |                 ^
   arch/arm64/kvm/arm.c:1242:4: error: call to undeclared function 'arm_pmu_set_phys_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1242 |                         arm_pmu_set_phys_irq(true);
         |                         ^
   2 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +1037 arch/arm64/kvm/arm.c

  1031	
  1032	#ifdef CONFIG_HISI_VIRTCCA_HOST
  1033	static inline void update_pmu_phys_irq(struct kvm_vcpu *vcpu, bool *pmu_stopped)
  1034	{
  1035		struct kvm_pmu *pmu = &vcpu->arch.pmu;
  1036	
> 1037		if (pmu->irq_level) {
  1038			*pmu_stopped = true;
  1039			arm_pmu_set_phys_irq(false);
  1040		}
  1041	}
  1042	#endif
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
