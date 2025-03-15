Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC9202F9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053485; cv=none; b=EWV89KA1ekDpEVfsyLdT1Oj0XbHbo0om+cKdyCDtEWiUgsjOpbSIKUIpPprdHUBQ9T62Q4o72wRiUHFY3rBOpWObzgYRTkeAk5xep7AixLaaZqpttWTn8qwEzc4GeqDgMD2EL3+p7yl0TQ3qHl5UhbrMmVhRyAOf2ZXZGr27Kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053485; c=relaxed/simple;
	bh=zFTMi7lqcT0zjvSB3hdP1mrdBKF9yxDWtm48anrby6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FGzQWcb5gjm1O3JH5nEiKTuj32UmJBaW9rAy+pmF9v2WVvybdYWG6Gn8kZxoIIqsAJmXCHKaod7K507MzqnmNwdihxFazYuWEGR/Mhz7L1vzNZORTcTLMs5W7As4VDM9X/7o11nKLk7uVqk210oDv71OpjntlYJsHKdzhDGbtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5yF9Ufd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5yF9Ufd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742053484; x=1773589484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFTMi7lqcT0zjvSB3hdP1mrdBKF9yxDWtm48anrby6o=;
  b=P5yF9UfdHTK6RnwBwLeU7PGtONHwPp6RNlnHj9jEMD0G/XJi0Y7alyZX
   hQuuf3ZH0RAE5LYD7uLOcduk8R8ntnoieLNydqhh9wiXYmUWgvBbrGun6
   OwFlVbm/bipr3foCpIjCHsJony4YRT/QSsIasKRODnHmlJ+hnJAhGfop3
   N1jdugrUdJ5TSG5czXIRTNuzS9YNhpmEILOE5EgujD9k0HeaQzVHtyCce
   r5YLnJlWXrGLnYFFsix/y+FfrS40Twntnd7cfjV5iDqrdIa2glthL3I9N
   j7KPF6Jy0tKmoY4TyT3wLiaWtVCXyQAm9SRoBpi5m4o3IwP902QGSPPsd
   A==;
X-CSE-ConnectionGUID: TYuuSnDbT1Cy2zSXBb1bGg==
X-CSE-MsgGUID: W+V9TzMQR62aM4cIcj5URA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42927236"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="42927236"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 08:44:43 -0700
X-CSE-ConnectionGUID: WJzixRqDRQ+Fl2j/lLy8zA==
X-CSE-MsgGUID: Iryse+cBSZiWts3eRKHhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121489140"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2025 08:44:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttTgm-000BQR-0w;
	Sat, 15 Mar 2025 15:44:40 +0000
Date: Sat, 15 Mar 2025 23:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] arch/arm64/kvm/mmu.c:2012:5:
 warning: no previous prototype for 'pkvm_mem_abort_prefault'
Message-ID: <202503152350.Jg5GBiBx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d27ba0428437fa30d39b114f95d0d183a569b294
commit: 3fc1e219027721249a621d54449e0f3db624b655 [1/1] ANDROID: KVM: arm64: Introduce kvm-arm.protected_prefault parameter
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250315/202503152350.Jg5GBiBx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503152350.Jg5GBiBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503152350.Jg5GBiBx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/mmu.c:11:
   arch/arm64/kvm/mmu.c:315:22: warning: no previous prototype for 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     315 |                      kvm_pinned_pages);
         |                      ^~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:38:15: note: in definition of macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^~~~~~~~
>> arch/arm64/kvm/mmu.c:2012:5: warning: no previous prototype for 'pkvm_mem_abort_prefault' [-Wmissing-prototypes]
    2012 | int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/pkvm_mem_abort_prefault +2012 arch/arm64/kvm/mmu.c

  2011	
> 2012	int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  2013				    struct kvm_memory_slot *memslot)
  2014	{
  2015		phys_addr_t memslot_start = memslot->base_gfn << PAGE_SHIFT;
  2016		size_t size = (1 << pkvm_prefault) << PAGE_SHIFT;
  2017	
  2018		fault_ipa = ALIGN_DOWN(fault_ipa, size);
  2019		if (fault_ipa < memslot_start) {
  2020			size -= memslot_start - fault_ipa;
  2021			fault_ipa = memslot_start;
  2022		}
  2023	
  2024		return pkvm_mem_abort(vcpu, fault_ipa, size, memslot);
  2025	}
  2026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
