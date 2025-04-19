Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE85014A62B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745106400; cv=none; b=GWu+rutHoUMtBqATUFj34bBCTaa+ToZzbI20Q3Ff0hJFfLm/CGL1cft/LcGNJ3ZBh1t7HFrBAZFS4HQnbuE32MdjunWqky+4ng4Jb8bTh3boaOnXLKT4gZImXXm/0aqaFMtmUOhm3pd7PdcHz4i3Ur75wLm8JruFWXupPtIA5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745106400; c=relaxed/simple;
	bh=zCA/GxRNP4NlPlHLU4zoI701qcUBKSmeoKsmL8J03DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGaJwY7ecjrb5TtT3v09/MkM4icVj4PNJqvYnkPha7TZR/Qe/gCB8Yk4uOGQE9Qc/CNVSaJim6rI/UBKfnRkQVzUFn7wJAO5R/77LKiz1XCobL12TMO1JFw+hx5mkrAVlAXOfvzNIv1DciXrpFe0g0CuU5TZS02fp1zr+Wnh+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjI5DCqS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjI5DCqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745106397; x=1776642397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCA/GxRNP4NlPlHLU4zoI701qcUBKSmeoKsmL8J03DA=;
  b=SjI5DCqS681BeMFtuKSSfD285znLNGEXP4GtWkd4yCAC5UafBUbM6fp6
   c2/+dacRmK6ZKV9671mQ0UNfxErbnHwYKW86uT6aXwerwImN6zkihX39o
   4ksEnvLsMUPf76GY0sSsor0btfzhtJBoem6vFCKo+Mg2w9dIvQzD0MgvT
   SnpKQhn2HKbfJ3WgzLEj0VTTzftIAhvecFB4aFk7ZHo54vYV43P2IKsZB
   dtrWRMNoJL+MJcIP7A1ufXXCtAXD7Iimd/XHW8i7my6d5NOmeUQaJyyeZ
   ZGpmNSAhk+iw7B64qaXVO73m56i4vGkPba1wFstdIHxq/IE0sd/fvngUz
   g==;
X-CSE-ConnectionGUID: Y1gF5BTWR1as3USCKA3qKA==
X-CSE-MsgGUID: NlCS4AVsThCIdTDn7gZtag==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="56866318"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="56866318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 16:46:34 -0700
X-CSE-ConnectionGUID: cS8FZElSQE2ZiacJ8NZoWQ==
X-CSE-MsgGUID: eoDjudjlS1u/GkVtJKIL9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="168603850"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Apr 2025 16:46:34 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6HtH-0004GN-0f;
	Sat, 19 Apr 2025 23:46:31 +0000
Date: Sun, 20 Apr 2025 07:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 6/6]
 arch/x86/include/asm/msr.h:183:24: error: implicit declaration of function
 'xen_read_pmc'
Message-ID: <202504200729.ubg9uI9c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   3eeb4c90020080bbe299d3b6d9a86ea5485fabee
commit: 3eeb4c90020080bbe299d3b6d9a86ea5485fabee [6/6] x86/msr: Use the alternatives mechanism to read PMC
config: x86_64-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200729.ubg9uI9c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200729.ubg9uI9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200729.ubg9uI9c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/fsgsbase.h:9,
                    from arch/x86/include/asm/elf.h:14,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   arch/x86/include/asm/msr.h: In function 'rdpmcq':
>> arch/x86/include/asm/msr.h:183:24: error: implicit declaration of function 'xen_read_pmc' [-Werror=implicit-function-declaration]
     183 |                 return xen_read_pmc(counter);
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


vim +/xen_read_pmc +183 arch/x86/include/asm/msr.h

   176	
   177	static __always_inline u64 rdpmcq(int counter)
   178	{
   179		DECLARE_ARGS(val, low, high);
   180	
   181		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   182		if (cpu_feature_enabled(X86_FEATURE_XENPV))
 > 183			return xen_read_pmc(counter);
   184	
   185		/*
   186		 * 1) When built with !CONFIG_XEN_PV.
   187		 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   188		 */
   189		asm_inline volatile("rdpmc" : EAX_EDX_RET(val, low, high) : "c" (counter));
   190	
   191		if (tracepoint_enabled(rdpmc))
   192			do_trace_rdpmc(counter, EAX_EDX_VAL(val, low, high), 0);
   193	
   194		return EAX_EDX_VAL(val, low, high);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
