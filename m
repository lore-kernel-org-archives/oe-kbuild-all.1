Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F8420881
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453611; cv=none; b=MyDx8kt6yfnsOSMiDrTkB5atjiGF1CJRy3jcR8W9YXhpXwuW4wZkmulvnAAxGvIH1X9n93F+NcIpvMFoI+sK71iXrAaxsJqfIdn85PhuUH9BNcidXsIl4/FSG6mpmUdw672eF8jQ55tJ4qmscy0FaTzZF1N/iTejEFg8y6wlcLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453611; c=relaxed/simple;
	bh=9dqTnIVGwYlr/WmmhTO8iq1xKCaRNnBqO9+2uU1H9N0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oUGJFGc9C7OSYtyL3UAJy3aKgD2Naltl9zl3peY4Ukn8Ayed+UIHwE3PCwTf6fzoD4YvTYyGiRqtRoGbYQ9/AGv8VkmJCiN4fJQ5gvWocooAi2/ywK1jRKloz5bX29riM5k9ZGKyB3kq3M8dUu639XHTh5yogNPSKfg1xq0JFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRUTX+OI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRUTX+OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783453609; x=1814989609;
  h=date:from:to:cc:subject:message-id;
  bh=9dqTnIVGwYlr/WmmhTO8iq1xKCaRNnBqO9+2uU1H9N0=;
  b=FRUTX+OIcBmDeBOfNaKdO7g0FgzxgIZVT+Yg4bXV8wC1AjkyOqBu+h/u
   toxu4KJfOxhA+i6pZ44WrGdfZnaQZA0blxev8nH6vL3TWcMDIRoTv1j0L
   1JJhhkcBpmxGNy9zNl06RzuQKycmFWE+5neDzeN0fslUhrVGvnpOKRQ54
   7VmDejfPDAumulV/yIBgfHhfHk3p2jJSe/AaI7QYcq+wHoWzQVQwh/mr+
   LKsmUkTwM5ciftmBSqHEOWCHB3Aa3+7rjx6S7RBpK2K946j6yU5tNYM6g
   CtVyfwawBrlwUZ9X20i+OZ58v9s5rHD8pK9Rq0DloniASNTB4m8H2iASx
   A==;
X-CSE-ConnectionGUID: HI1ROwyWQBai8hbK/oZ0lA==
X-CSE-MsgGUID: Zzjz2Y61QA+y6/8EVpBqeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94754768"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94754768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 12:46:48 -0700
X-CSE-ConnectionGUID: 8s+5q96WQlK+VGWfh82YGA==
X-CSE-MsgGUID: 02tk9WpvStyiI5Mf6NUP7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257668490"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2026 12:46:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whBkh-00000000Fcp-2XV7;
	Tue, 07 Jul 2026 19:46:43 +0000
Date: Wed, 08 Jul 2026 03:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 26/30]
 arch/arm64/include/asm/fpsimd.h:790:59: error: 'SME_VQ_INVALID' undeclared
Message-ID: <202607080358.n3CIJrGN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   489202b3db0a02f59477f8ec63009dc3d998341f
commit: e698ce954a7916331bb640d94f345a0a23f99d18 [26/30] KVM: arm64: Provide interface for configuring and enabling SME for guests
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607080358.n3CIJrGN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080358.n3CIJrGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080358.n3CIJrGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:419,
                    from include/asm-generic/qrwlock.h:18,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:9,
                    from include/linux/spinlock.h:95,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   arch/arm64/include/asm/fpsimd.h: In function 'sme_max_virtualisable_vl':
>> arch/arm64/include/asm/fpsimd.h:790:59: error: 'SME_VQ_INVALID' undeclared (first use in this function)
     790 | static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
         |                                                           ^~~~~~~~~~~~~~
   arch/arm64/include/asm/fpsimd.h:790:59: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:184: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/SME_VQ_INVALID +790 arch/arm64/include/asm/fpsimd.h

   785	
   786	static inline void sme_alloc(struct task_struct *task, bool flush) { }
   787	static inline void sme_setup(void) { }
   788	static inline unsigned int sme_get_vl(void) { return 0; }
   789	static inline int sme_max_vl(void) { return 0; }
 > 790	static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
   791	static inline int sme_set_current_vl(unsigned long arg) { return -EINVAL; }
   792	static inline int sme_get_current_vl(void) { return -EINVAL; }
   793	static inline void sme_suspend_exit(void) { }
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
