Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55291991B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516037; cv=none; b=ruStYTtX6DS/4PN4lmKroTKVL6ZvGOZeqQow8V67dn7VZr1m4DXO8p29h9vu0Kcp1N+2389R84qLo6lsgNt+1r51J7RjJ82nIRumHcLpztQzj0503UBt0syKltI67DAqheQvogHQZ3u+25qUbh98ww8/Pd7MqMeDycOhJPUcOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516037; c=relaxed/simple;
	bh=MpjkodXdjH0m2eFAy6RoEaJSjnejPp8HBAXSwOUjmd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUYZZpGkorbSb6PD0s6HytTtmW+KGmTIbeVFzUQT05nyyD+ihARvUK1fKNy3QFiDqjdUOzTTCEnyB7fuToFJ7LKCIta9F8pRMgFK8tpYT8nmYbF/hyjXW0zK+swyjnsjhfDeDcm5RZ+4LE0G2cNlOTsUJKfEIOlDSbBwhCEAXhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb+cs0j5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb+cs0j5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734516036; x=1766052036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpjkodXdjH0m2eFAy6RoEaJSjnejPp8HBAXSwOUjmd8=;
  b=Lb+cs0j5dcSIJhEcgXkKOnwgbR8tg7QLcNK5OvaslwKJR6Zk8/gXT6FT
   FJJ8rifxFLXGRY2umNJQsVICEjhLAWkWX4EvFQ5rZiMJaxm/2pFcHpQOf
   EiT9ab4TaVHBrsJsiZqGiMjeN7I8T9S0KE15RWAeSPi/ppX92F9iuRuOD
   iAMIEdKdS49JP0ms+MV/NUsPxJ2Yx4i1c5fhxzXv8wmBYhUmefTijIhuT
   KWLAWuJ/cdFtDx2W3/1liaIdN0jGpZFZzu4WSIHNl5X+gk5GjWCwYAEP+
   R1BlEiJ/EvMk/CdT/FsDGyVXcYRnfCL7cAMN3hRZ3wVcCIDb9ER17+scu
   g==;
X-CSE-ConnectionGUID: O7LI9iABShu62YgF8YGdwg==
X-CSE-MsgGUID: ZF3qcs4uTfi2RwzhvQbA9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52392742"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="52392742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 02:00:34 -0800
X-CSE-ConnectionGUID: raX8lQnJSA6NjB1fN5vaVQ==
X-CSE-MsgGUID: wCX8OO2SSl6UQ4yd3jHfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="128612878"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2024 02:00:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNqr0-000GGs-1U;
	Wed, 18 Dec 2024 10:00:30 +0000
Date: Wed, 18 Dec 2024 17:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-next 14/20]
 arch/arm64/include/asm/kvm_nested.h:341:16: error: 'FIX_VNCR' undeclared
Message-ID: <202412181757.mImympcW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next
head:   1e2a09d0a43f9c19dae9d321b4a5c840d45fc88b
commit: 0cb2c18e124cd31e01221ed6c60fddc478e3286b [14/20] KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
config: arm64-randconfig-003-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181757.mImympcW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181757.mImympcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181757.mImympcW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_emulate.h:21,
                    from arch/arm64/include/asm/kvm_mmu.h:99,
                    from arch/arm64/kernel/smp.c:46:
   arch/arm64/include/asm/kvm_nested.h: In function 'vncr_fixmap':
>> arch/arm64/include/asm/kvm_nested.h:341:16: error: 'FIX_VNCR' undeclared (first use in this function)
     341 |         return FIX_VNCR - cpu;
         |                ^~~~~~~~
   arch/arm64/include/asm/kvm_nested.h:341:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/FIX_VNCR +341 arch/arm64/include/asm/kvm_nested.h

   337	
   338	static inline unsigned int vncr_fixmap(unsigned int cpu)
   339	{
   340		BUG_ON(cpu > NR_CPUS);
 > 341		return FIX_VNCR - cpu;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
