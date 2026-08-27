Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0148421A15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822932; cv=none; b=BwVt3ZyRHfUuYmQAidBJamxj1dpwAKuDZDJSnh80aRQeeWQLCNRks7NzbX91/pAmwbMbMimVTSf2P37wzO5BK+zEQ/JixaK8A8yXoYnN9TLfzkqzR6SOMLjgTTwKiURdQjP9B/31FJEsn6c+B1vd5RyXe2wS55wdoBdK9URE5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822932; c=relaxed/simple;
	bh=dr9res7xIQEHrx1OZJTLq1q39rShxrKme+w3g8lgKz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DRjYXbMYdCMikfoD5jm1NHKMxHWkMIsnKZHJ8/5RfLajGBrM+orr7xmvfLhbHtP1NRfTSQoRbkUCosDRIc6A6mGgZPoaLiYOu7n8ApKdIIzAekqy/i/YNG/ZvOPT0AfX58VtYbxqW+Qps12m8k0PRT93EBa3aZwBBL/lCUhLh1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNVabs5k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNVabs5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787822931; x=1819358931;
  h=date:from:to:cc:subject:message-id;
  bh=dr9res7xIQEHrx1OZJTLq1q39rShxrKme+w3g8lgKz4=;
  b=PNVabs5k0fJkWTCP0ygg3ctGC3B2ZsrjyzYnAmIuBXMlusEPTvKzZjHy
   oy2aLQecHCdCMALg3+zLKqI+semYsCZeGT5BpmmjGZmKquQUjPgEuiCrQ
   Dhmydiy+Qa6fxOXz67hTaZgc5ASJ82O3CAXUk/ULI5Xm+mrs7xmDnGx2Z
   /NR9dgfpCbLlU7nwv/16dw3dAEGNxvUeb7gwJz84zQl2m4F4Ux6dkByFY
   Y4fNOSRsAWiX3B7mu+bxN+FNGOQ7TqDgrNU0regyLF6Wxxbl2EKFPkJQA
   iH056T/qfi5DqyKdcikBnJ1SQyBhwRBmid7/fvJA36A1ZvTKgrp3/0IHf
   Q==;
X-CSE-ConnectionGUID: iinuVAYbSoq6CQXWi+v/Uw==
X-CSE-MsgGUID: k2R2Hm60QUiif//OLEROBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88177983"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88177983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:28:50 -0700
X-CSE-ConnectionGUID: q0445bEOTYq7iOVhUs5Otg==
X-CSE-MsgGUID: PVW1j2oNQy+mviBwz4o5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="272063793"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2026 02:28:49 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzWPf-000000009FN-0OAd;
	Thu, 27 Aug 2026 09:28:47 +0000
Date: Thu, 27 Aug 2026 17:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_auto_prefault 5/5]
 arch/x86/kvm/mmu/mmu.c:121:28: sparse: sparse: symbol
 'auto_prefault_nr_pages' was not declared. Should it be static?
Message-ID: <202608271720.qBeU723u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/mmu_auto_prefault
head:   6fc4c84e91337cf4a01d62d08d10b0b5f774cd5b
commit: 6fc4c84e91337cf4a01d62d08d10b0b5f774cd5b [5/5] tmp
config: x86_64-randconfig-r113-20260827 (https://download.01.org/0day-ci/archive/20260827/202608271720.qBeU723u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271720.qBeU723u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271720.qBeU723u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/mmu.c:121:28: sparse: sparse: symbol 'auto_prefault_nr_pages' was not declared. Should it be static?
   arch/x86/kvm/mmu/mmu.c: note: in included file:
   arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:451:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/mmu.c:5676:82: sparse: sparse: cast truncates bits from constant value (ffff5555 becomes 5555)
   arch/x86/kvm/mmu/mmu.c:5678:59: sparse: sparse: cast truncates bits from constant value (ffff3333 becomes 3333)
   arch/x86/kvm/mmu/mmu.c:5693:76: sparse: sparse: cast truncates bits from constant value (ffff0f0f becomes f0f)
   arch/x86/kvm/mmu/mmu.c:5693:87: sparse: sparse: cast truncates bits from constant value (ffff00ff becomes ff)
   arch/x86/kvm/mmu/mmu.c:5695:51: sparse: sparse: cast truncates bits from constant value (ffff00ff becomes ff)
   arch/x86/kvm/mmu/mmu.c:5709:70: sparse: sparse: cast truncates bits from constant value (ffff0f0f becomes f0f)
   arch/x86/kvm/mmu/mmu.c:5712:72: sparse: sparse: cast truncates bits from constant value (ffff00ff becomes ff)

vim +/auto_prefault_nr_pages +121 arch/x86/kvm/mmu/mmu.c

   120	
 > 121	unsigned int __read_mostly auto_prefault_nr_pages = KVM_PAGES_PER_HPAGE(PG_LEVEL_2M);
   122	module_param(auto_prefault_nr_pages, uint, 0644);
   123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
