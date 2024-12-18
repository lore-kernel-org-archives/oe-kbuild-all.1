Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE41ACEBB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525529; cv=none; b=gZ7JI8eMIii8zkfmWMem5rqlSzPZoH1hmlDGt+1er9It8yMpEXk+UTH+Wv0vgAbJQg1fXkF1hyJA1/It6H2O1pIKUeg/IBV6wv52Sey7aAGXwtB41DqoUObhGuw8Fv9AfzALVrztEDbQ7LIbdT2ooWu07ueFCcsrAja5j0bvfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525529; c=relaxed/simple;
	bh=L/Ng4rLiJeFJivBsxi9Q5RInaVaOVyMlPJHXjd+wEFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrAT0IMIo7M+ulMiF4KbWOQoOqJQzkBGTihFh1e84nUgFRgE6MaC6PMXFR9O8J8KGZ656WiAhlHmS6U3uzpIGraC8kWOi0533by8161hH+iPwNeJxou3i/lIC3MfP++JOV99/9nh7zqbzJR2SA8USNReUGpX0r1YIJF9eFbzhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZGr8V1e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZGr8V1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734525526; x=1766061526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/Ng4rLiJeFJivBsxi9Q5RInaVaOVyMlPJHXjd+wEFM=;
  b=fZGr8V1ehKlqR8ADOOtWAvWWml21SFzxjKkrbd2KjZ9qAOMDWROreeWn
   TAgCvoVLDEPv7NspYYLe2eLjwOclMTaIc5p1wWXtyrXkaVp7pzlr4ANcf
   /xRJhe6L7nY/B73v/w8dhiJLWyW2L/TD2F/K/U0E06hW1K6C6B7T92uDe
   PNjCdx6N8ptSc8pPCkYVLjLFGZuKdkXoxeUu3hYTU4yzNhLe41RApZ5Qt
   Pl/TH90IwQvbZZ7LVaB+Fm2/BiTuJaqn7Ou9ddVvMHdVjTTMKmUk7eG0Q
   FUdT/BvaSQe3BFHTcbEJVaftRUHZ3wyoCNdchSxQX1iXWqX7hmNT26nGU
   w==;
X-CSE-ConnectionGUID: wp7m0t6cT1Gza7PTZS49UA==
X-CSE-MsgGUID: yDMRmj0WR16RhtNjwIsXzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60384454"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="60384454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 04:38:46 -0800
X-CSE-ConnectionGUID: XC8GUvJdTf62HLaR5+E04A==
X-CSE-MsgGUID: wn8yHZY4QZa6JCTEWYlTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102695555"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2024 04:38:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNtK7-000GL0-0N;
	Wed, 18 Dec 2024 12:38:43 +0000
Date: Wed, 18 Dec 2024 20:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:p4d_pgd_cdtor 7/10]
 arch/s390/include/asm/pgalloc.h:67:43: error: 'table' undeclared; did you
 mean 'sg_table'?
Message-ID: <202412182009.sPgCkNSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git p4d_pgd_cdtor
head:   5453d8f69ac04a3a31ea973f98de9e0c58248a42
commit: cc7446a95acd752405250c553362cd032f591822 [7/10] mm: Introduce ctor/dtor at P4D level
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241218/202412182009.sPgCkNSL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182009.sPgCkNSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182009.sPgCkNSL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/mmu_context.h:11,
                    from arch/s390/include/asm/elf.h:181,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from arch/s390/include/asm/hw_irq.h:6,
                    from include/linux/irq.h:591,
                    from include/linux/msi.h:24,
                    from include/linux/kvm_host.h:19,
                    from arch/s390/kernel/asm-offsets.c:11:
   arch/s390/include/asm/pgalloc.h: In function 'p4d_free':
>> arch/s390/include/asm/pgalloc.h:67:43: error: 'table' undeclared (first use in this function); did you mean 'sg_table'?
      67 |         pagetable_p4d_dtor(virt_to_ptdesc(table));
         |                                           ^~~~~
         |                                           sg_table
   arch/s390/include/asm/pgalloc.h:67:43: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:102: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +67 arch/s390/include/asm/pgalloc.h

    62	
    63	static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
    64	{
    65		if (mm_p4d_folded(mm))
    66			return;
  > 67		pagetable_p4d_dtor(virt_to_ptdesc(table));
    68		crst_table_free(mm, (unsigned long *) p4d);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
