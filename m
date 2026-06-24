Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9139184B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 20:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333915; cv=none; b=nSu2GH8TBczHfwwuT4y0Uu8eNWsLZWcGLyN4XE1Py2+Xt6Ykr9b6e89yCeCUTENnl21fmBWlHY9drsRtYgBJS5rZT/j5BLorVXisY3skSn0xBQdCCb4Hh6da08YF3m8spXuulrCtFLmbIw+nF49pKCpkhdM5hb40nE8R6IfjqqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333915; c=relaxed/simple;
	bh=uSIyWIaUXWAoVFv2qb2H3rTUsTRY4ICxUGAWWf48Y8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aYzIzG89H84bbFEh3qB0X4ytpZcY/qViYpaPDRoWNwvZyoqZQy/CwLR9KIACRoL4sAc5LykdJUIS8eTZtQUG9M8r2EHCW4x/AheN5myEudRZLJu/bV7gyzU7l8+P+MlSyyj9CrRbSXSG87t3DB86wp0+HVShqLeI4LcTRCHV800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kocM8Jli; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kocM8Jli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782333913; x=1813869913;
  h=date:from:to:cc:subject:message-id;
  bh=uSIyWIaUXWAoVFv2qb2H3rTUsTRY4ICxUGAWWf48Y8o=;
  b=kocM8Jli5gSktWjjcozq97kWdT9FsrBJ0UVzwoO0Bf6URXghQpszQJgn
   ljr5NwLa5Q2gOhUqp1uST4ThZcsJfB0kj2FcD2P8zEqHu3Xgq/AQaIAu6
   z/W0kmQc7OyPNjg8EBkS25YzQpwTjHEgcT4oNoSdSue149BlM+SCHZQ5e
   s8gZJbzT/WO/61uNKaxXorc5ozBtivj4y+ZcQHW4Z2pKJJreZZYuOr/BQ
   nYCYbfCiXquG9CA8orNJQSuARERwYSZDNtnXVnEIoBiVErHWChvtN24VD
   l8ObrN6sjpHW5gWNfyu1aAf27TFE8oO071m0ELOb9Vq/lTh6S3n6C0C9t
   A==;
X-CSE-ConnectionGUID: TE6iuon0QuSh7ZIVRtXx6w==
X-CSE-MsgGUID: 3wjhyBGDTfa4jltw/tx6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="105900258"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="105900258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 13:45:13 -0700
X-CSE-ConnectionGUID: niKw2SbITkat7g6TKzltgA==
X-CSE-MsgGUID: uV7eskq2SP68wp6tCIDLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="250104500"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2026 13:45:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcUT6-000000003f7-3Zv3;
	Wed, 24 Jun 2026 20:45:08 +0000
Date: Thu, 25 Jun 2026 04:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 13/34]
 arch/arm64/include/asm/compat.h:41:25: error: conflicting types for
 'compat_dev_t'
Message-ID: <202606250452.tB423KOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 22a837585b767b81a7f0604a815a07fd9cc627f0 [13/34] arm64: fix compat_dev_t definition
config: arm64-randconfig-003-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250452.tB423KOJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250452.tB423KOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250452.tB423KOJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/sysfs.h:22,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:15,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> arch/arm64/include/asm/compat.h:41:25: error: conflicting types for 'compat_dev_t'
    #define compat_dev_t    compat_dev_t
                            ^~~~~~~~~~~~
   arch/arm64/include/asm/compat.h:42:25: note: in expansion of macro 'compat_dev_t'
    typedef u16             compat_dev_t;
                            ^~~~~~~~~~~~
   In file included from arch/arm64/include/asm/compat.h:20,
                    from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/sysfs.h:22,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:15,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/asm-generic/compat.h:80:13: note: previous declaration of 'compat_dev_t' was here
    typedef u32 compat_dev_t;
                ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=4190757951
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2 shuffle=4190757951
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4190757951
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4190757951
   make: Target 'prepare' not remade because of errors.


vim +/compat_dev_t +41 arch/arm64/include/asm/compat.h

    40	
  > 41	#define compat_dev_t    compat_dev_t
    42	typedef u16             compat_dev_t;
    43	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
