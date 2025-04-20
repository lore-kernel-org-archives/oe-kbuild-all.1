Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C59C1362
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 00:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745107658; cv=none; b=UOIlgRPISzqU/vojP1xrNLWTKZoj7t7K/OVYMx1EerjWG23gC56OTRQTgZw1J4aD+iZ8uGdZywikvB1aeNbYMT/rIdPyb80UsDj/9wd0MmLQYETaHB1HT2GaKaNmGnficI8vg+/BSFEMSKcU/2+9tejbMk/5lxSQt/tyNzOSgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745107658; c=relaxed/simple;
	bh=FQMjiemxM+QWmA43Y2dZ+kw9Uu+VNFwUOMGZU+272hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jf4txpcd4LNuSxU9X6fQ6HDOBc/QAmtuEALC3rY3SNAC+ZByu63quEVrj4zwootyMjWJEN8ENz3AyoTmbiXGRQko7lEhf2uzlfwyQMsBgXR053YB2NtrT3BOjX5D4oJRIIkdlrt8NIfovaarA75nVpgBhI9MbZaJ0HbnzOFqUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJR0b5I4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJR0b5I4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745107657; x=1776643657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQMjiemxM+QWmA43Y2dZ+kw9Uu+VNFwUOMGZU+272hs=;
  b=eJR0b5I4W8F8dt5AIdcIlLzfX3wZ6dmqhbnRnifK3c1rTzF0P+MKXBBS
   FW8k7DVM8sh1B1UmElzc6YxanNzhFCOkGLwZWzjsRts89qzZHNswdw46/
   zrVZ5rwce7kiQzIT3K3lo7p5OF3V0TkT+uEFH+ADZwvH/sJncR3jft8Du
   Qjajk07MAk8SD/k8UwWD13j/MxxOWzgzlSk0z1pVifwW6VJW3zvRehfN/
   Ia9TmfgOXVhdojv5T84fazjMDULymULL2FnAugcFkbdXIGX5YW9VgH2Nr
   6CPwoA2OhE2YqZO9d9DLfMi10r6MLzTB5wW1avIKyO5qD4tVHUnRv0XYo
   g==;
X-CSE-ConnectionGUID: YdCFVtDiTIOsEQKcPw7k2A==
X-CSE-MsgGUID: W+9fKXYsT6uV4tDnsyznLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46609726"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46609726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 17:07:36 -0700
X-CSE-ConnectionGUID: iM5utj5hTg2SjWd5uDHSIw==
X-CSE-MsgGUID: 2+kY/A2xQBiv4XAQi+jYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168606226"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 17:07:35 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6IDc-0004Hd-2R;
	Sun, 20 Apr 2025 00:07:32 +0000
Date: Sun, 20 Apr 2025 08:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 21/33]
 arch/x86/include/asm/msr.h:357:28: error: variable 'action' has initializer
 but incomplete type
Message-ID: <202504200852.TowwWqjT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   168ed74cc0471e1a72488e1e6f484a25c5304202
commit: cde95b7425fd6ff3b1e84f45bd07171485b55503 [21/33] x86/msr: Use the alternatives mechanism to write MSR
config: x86_64-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200852.TowwWqjT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200852.TowwWqjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200852.TowwWqjT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/fsgsbase.h:9,
                    from arch/x86/include/asm/elf.h:14,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   arch/x86/include/asm/msr.h: In function '__wrmsr':
>> arch/x86/include/asm/msr.h:357:28: error: variable 'action' has initializer but incomplete type
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^~~~~~~~~~~~~
>> arch/x86/include/asm/msr.h:357:51: error: implicit declaration of function 'get_pv_msr_action' [-Werror=implicit-function-declaration]
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                                   ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/msr.h:357:42: error: storage size of 'action' isn't known
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
>> arch/x86/include/asm/msr.h:359:31: error: 'PV_MSR_IGNORE' undeclared (first use in this function)
     359 |                 if (action == PV_MSR_IGNORE)
         |                               ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:359:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/msr.h:362:32: error: implicit declaration of function '__xenpv_wrmsr' [-Werror=implicit-function-declaration]
     362 |                         return __xenpv_wrmsr(msr, val, type);
         |                                ^~~~~~~~~~~~~
>> arch/x86/include/asm/msr.h:357:42: warning: unused variable 'action' [-Wunused-variable]
     357 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
   arch/x86/include/asm/msr.h: In function 'rdpmcq':
   arch/x86/include/asm/msr.h:406:24: error: implicit declaration of function 'xen_read_pmc' [-Werror=implicit-function-declaration]
     406 |                 return xen_read_pmc(counter);
         |                        ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1089470423
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=1089470423
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1089470423
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1089470423
   make: Target 'prepare' not remade because of errors.


vim +/action +357 arch/x86/include/asm/msr.h

   352	
   353	static __always_inline bool __wrmsr(u32 msr, u64 val, int type)
   354	{
   355		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   356		if (cpu_feature_enabled(X86_FEATURE_XENPV)) {
 > 357			const enum pv_msr_action action = get_pv_msr_action(msr);
   358	
 > 359			if (action == PV_MSR_IGNORE)
   360				return false;
   361			else
 > 362				return __xenpv_wrmsr(msr, val, type);
   363		} else {
   364			/*
   365			 * 1) When built with !CONFIG_XEN_PV.
   366			 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   367			 */
   368			bool ret = __native_wrmsr(msr, val, type);
   369	
   370			if (tracepoint_enabled(write_msr))
   371				do_trace_write_msr(msr, val, ret ? -EIO : 0);
   372	
   373			return ret;
   374		}
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
