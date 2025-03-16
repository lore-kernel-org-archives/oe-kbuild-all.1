Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A71DFF8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742130098; cv=none; b=XS2gZmIYi/aS95kuMOt8QCIA5zUaxjClRb4MrXO/Ece2z8D7n/GzX+foP8929NgjE1nXlSl9jJMHrZFYEZjm4+MpA5SxvSapOgIXGdx5sTCjjSIZb/K7Z4u4E+/qoFtX4hPfxnfx8lthneLGmPqP7tarru2FJoZCK5UbG95niyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742130098; c=relaxed/simple;
	bh=nuuGl+7Lr/BX2ZqcKiF1ZTkIWUSpecORD403KiNN/tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glNmG6uffOANx6IC3WGWjjY/7hdYbqac6H5lWdr77ATXJsfSc+sWLhnrinskSreP0obCYC2EqW6ZYC7MX24ly56cOOJv+flltVzyR5ZKI9dK2tdZaTuxaY1dMVYmJ5oKu6pw1lTEOtKIVbnkb62otwHf22/mXJi44mtU1Myshl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kClhEf+k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kClhEf+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742130096; x=1773666096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuuGl+7Lr/BX2ZqcKiF1ZTkIWUSpecORD403KiNN/tU=;
  b=kClhEf+k6D2XjjfgIL64ga87DS+PBEA6cB7NBgVIYApQKeu9aph8TrVg
   HJnGYUgiK3pCzIGomG2AuI2LIbyaDmEeLzoBcP7o/0abjaBKFOln7joJa
   pxDVeLpL5rB8ZdSFKQizMJYX4Oc9AA37LsICxWUeE8oGG2w8+xz6H7eIU
   t/+t5j8bwCVHev1nihVyRujXuAaHhaRVojE4LC2ziGdxbWrsod8kaI5DC
   Gu1jE/r2sTkv2vNCdbWBL1Q3Crhgw26cgItp4yQEnRaZztIsdWB/WU10o
   20AP63dKixhMP7ZZUy1pVEo/+n0LQJUMS/Y9/+Y50ptCkbSWZTSwImbhA
   g==;
X-CSE-ConnectionGUID: xpbyLTUzQ/mx3A7k3g6vuw==
X-CSE-MsgGUID: ZjiofNhHRTWnms5HqHAKLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43140384"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="43140384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 06:01:30 -0700
X-CSE-ConnectionGUID: PUQ7V1HNRSK/rFYViAy4mA==
X-CSE-MsgGUID: ixDuUT4dTcGmMaU7EReSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="125890728"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Mar 2025 06:01:28 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttncM-000C0V-1f;
	Sun, 16 Mar 2025 13:01:26 +0000
Date: Sun, 16 Mar 2025 21:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 12/15]
 arch/x86/include/asm/msr.h:339:24: error: 'pv_msr_pv' undeclared; did you
 mean 'pv_msr_native'?
Message-ID: <202503162016.kiRjuDkc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   2a93967cbc089183a3ee08556bcdab2711c1c6de
commit: 483ec528ba6f92a2d0aa8d8dd829e2f91c56dd89 [12/15] x86/msr: Use the alternatives mechanism to write MSR
config: i386-buildonly-randconfig-003-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162016.kiRjuDkc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162016.kiRjuDkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162016.kiRjuDkc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/msr.h: In function '__wrmsr_variable_all':
>> arch/x86/include/asm/msr.h:339:24: error: 'pv_msr_pv' undeclared (first use in this function); did you mean 'pv_msr_native'?
     339 |         if (pv_what == pv_msr_pv) {
         |                        ^~~~~~~~~
         |                        pv_msr_native
   arch/x86/include/asm/msr.h:339:24: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/msr.h:341:31: error: 'pv_msr_ignore' undeclared (first use in this function)
     341 |         } else if (pv_what == pv_msr_ignore) {
         |                               ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h: At top level:
   arch/x86/include/asm/msr.h:515:20: error: redefinition of 'wrmsrl'
     515 | static inline void wrmsrl(u32 msr, u64 val)
         |                    ^~~~~~
   arch/x86/include/asm/msr.h:413:29: note: previous definition of 'wrmsrl' with type 'void(const u32,  const u64)' {aka 'void(const unsigned int,  const long long unsigned int)'}
     413 | static __always_inline void wrmsrl(const u32 msr, const u64 val)
         |                             ^~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1913058473
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1272: prepare0] Error 2 shuffle=1913058473
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1913058473
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1913058473
   make: Target 'prepare' not remade because of errors.


vim +339 arch/x86/include/asm/msr.h

   334	
   335	static __always_inline bool __wrmsr_variable_all(const u32 msr, const u64 val, const int type)
   336	{
   337		const pv_msr_action_t pv_what = pv_msr_action(msr);
   338	
 > 339		if (pv_what == pv_msr_pv) {
   340			return __wrmsr_variable(msr, val, type);
 > 341		} else if (pv_what == pv_msr_ignore) {
   342			if (cpu_feature_enabled(X86_FEATURE_XENPV))
   343				return false;
   344		}
   345	
   346		return __native_wrmsr_variable(msr, val, type);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
