Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D453A7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745109521; cv=none; b=I9tWf8ek04tgDQagWv41U9TzkoeQXwhGE+MlP3iPVbKTe2sBLo8h3WI6ZqqT5Deo4/L8tBNN0RJsGU42ySyEKo27OTpSPMDPv3ybQgrUl1ieaF/gHwJFk74Z+ugzm0JFlvAVurv0LR5i+hP50PcAhgkcfUqXX4rlBtVMrgr204s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745109521; c=relaxed/simple;
	bh=VfalhmLrrL5ac0wqk8H+pKi7Lhl7ySN740IDlJnvyW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFPbw/j1x/GWI/pziinxht3Eb8iNj/mHKBS06K3KcJWsex3cJCOuxp5VXty5lE895p0hzn6LdqtVBDKnVSwWo4GHYjINH7ocaIebgoWeVuvlMJTgEcVsbACTWZEEOsTqjXPYeeL9nzAqMtrDm83rXLszpcjka/s/Bah7NffivKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/FzEJK6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/FzEJK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745109519; x=1776645519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VfalhmLrrL5ac0wqk8H+pKi7Lhl7ySN740IDlJnvyW4=;
  b=V/FzEJK6ApNC3f1zGXtSgn8Zfua9dNmFQ2viPpxBMAgr09wYwqhyE9cJ
   af7U5I5AegVVl1CplxX5vDyBnVUKZ1HHH8Oa7NEbG/X3iBFgUPZ8uOCml
   pVMmAn/l4PXlVy6w5vBeHwFo2yGRRYfLml/xpshUFytvma7xmbLSODhpn
   jVi271yZQx9sb4ybPq4zkVDLZcNMZYvOUeJTTmRQs4QQ/4bEQFUqmCTYQ
   cpOqa6pNO+ZriWKKje59imH7y5o9kZ6afHQhL0IP/UH4IlEKfs4FkAXj5
   BKMD9RicYrOSKhda3tLx+M0BQcR/xJnBSGX25gtWCWuoT0AR2xFuiS9SN
   w==;
X-CSE-ConnectionGUID: oLJ9gHkqRG26vPJKlV2Iog==
X-CSE-MsgGUID: 26opemIeTEyqKVj6aX2IMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46582093"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46582093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 17:38:39 -0700
X-CSE-ConnectionGUID: oW7TLDgkRviUBLoEdGjKEA==
X-CSE-MsgGUID: 76QTWI0jT+CRN3z8/x9LIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="135503302"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Apr 2025 17:38:37 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Ihe-0004IX-2q;
	Sun, 20 Apr 2025 00:38:34 +0000
Date: Sun, 20 Apr 2025 08:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 22/33]
 arch/x86/include/asm/msr.h:317:32: error: implicit declaration of function
 '__xenpv_rdmsr'
Message-ID: <202504200827.lvVjvF6u-lkp@intel.com>
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
commit: 0a5b87b9b78d624da224d305455e6a155c0da1be [22/33] x86/msr: Use the alternatives mechanism to read MSR
config: x86_64-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200827.lvVjvF6u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200827.lvVjvF6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200827.lvVjvF6u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/fsgsbase.h:9,
                    from arch/x86/include/asm/elf.h:14,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
   arch/x86/include/asm/msr.h: In function '__rdmsr':
   arch/x86/include/asm/msr.h:312:28: error: variable 'action' has initializer but incomplete type
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:312:51: error: implicit declaration of function 'get_pv_msr_action' [-Werror=implicit-function-declaration]
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                                   ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:312:42: error: storage size of 'action' isn't known
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
   arch/x86/include/asm/msr.h:314:31: error: 'PV_MSR_IGNORE' undeclared (first use in this function)
     314 |                 if (action == PV_MSR_IGNORE)
         |                               ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:314:31: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/include/asm/msr.h:317:32: error: implicit declaration of function '__xenpv_rdmsr' [-Werror=implicit-function-declaration]
     317 |                         return __xenpv_rdmsr(msr, val, type);
         |                                ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:312:42: warning: unused variable 'action' [-Wunused-variable]
     312 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
   arch/x86/include/asm/msr.h: In function '__wrmsr':
   arch/x86/include/asm/msr.h:523:28: error: variable 'action' has initializer but incomplete type
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                            ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:523:42: error: storage size of 'action' isn't known
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
   arch/x86/include/asm/msr.h:525:31: error: 'PV_MSR_IGNORE' undeclared (first use in this function)
     525 |                 if (action == PV_MSR_IGNORE)
         |                               ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:528:32: error: implicit declaration of function '__xenpv_wrmsr' [-Werror=implicit-function-declaration]
     528 |                         return __xenpv_wrmsr(msr, val, type);
         |                                ^~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:523:42: warning: unused variable 'action' [-Wunused-variable]
     523 |                 const enum pv_msr_action action = get_pv_msr_action(msr);
         |                                          ^~~~~~
   arch/x86/include/asm/msr.h: In function 'rdpmcq':
   arch/x86/include/asm/msr.h:572:24: error: implicit declaration of function 'xen_read_pmc' [-Werror=implicit-function-declaration]
     572 |                 return xen_read_pmc(counter);
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


vim +/__xenpv_rdmsr +317 arch/x86/include/asm/msr.h

   307	
   308	static __always_inline bool __rdmsr(u32 msr, u64 *val, int type)
   309	{
   310		/* When built with CONFIG_XEN_PV and running on Xen hypervisor. */
   311		if (cpu_feature_enabled(X86_FEATURE_XENPV)) {
   312			const enum pv_msr_action action = get_pv_msr_action(msr);
   313	
   314			if (action == PV_MSR_IGNORE)
   315				return false;
   316			else
 > 317				return __xenpv_rdmsr(msr, val, type);
   318		} else {
   319			/*
   320			 * 1) When built with !CONFIG_XEN_PV.
   321			 * 2) When built with CONFIG_XEN_PV but not running on Xen hypervisor.
   322			 */
   323			bool ret = __native_rdmsr(msr, val, type);
   324	
   325			if (tracepoint_enabled(read_msr))
   326				do_trace_read_msr(msr, *val, ret ? -EIO : 0);
   327	
   328			return ret;
   329		}
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
