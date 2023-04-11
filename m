Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFFB4436
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681203007; x=1712739007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1yWyOHxnUAXGCwb4Bku3Lt58Hj6LxIXDahJOqauZuA=;
  b=XA6eB241L6Wq8Y6sQUltLhSJlWG59ZJCY4N2h0QebEhJubs6kJd9a0Mt
   D5HAfd59Iwo4NT56h5LQGBu04PWUqTuiXNGgkp/pxXXBtCHyUHn7hOKEn
   e2Flz/s64jF/jfkYvZpTu0m8Nst2kxYQ/XZdlsQ9C6kGzlYfvOoJMyktp
   82Jun6AldfprluPlztK9uGRpeKRdr+TSyhA3Odv/wL+AIjVrSI5w5a2sI
   oapFzA302ygWDPWnLJCXMidLxJM0HmfAmUse9fBJkvNSWSuYHcDndrKn2
   vohl+Iehufk7UJ1bkXrD019b3b8msr35+hCWPoHxWElCDmlf8tGxPZCdC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327660315"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327660315"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 01:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="665902928"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="665902928"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 01:50:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm9hS-000W9X-1X;
	Tue, 11 Apr 2023 08:50:02 +0000
Date: Tue, 11 Apr 2023 16:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207 10/19]
 arch/x86/include/asm/mshyperv.h:57: undefined reference to
 `hv_tdx_hypercall'
Message-ID: <202304111623.vF2cytxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207
head:   c0a631602939506ef2bceba6697a80b7a366779b
commit: 805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30 [10/19] x86/hyperv: Support hypercalls for TDX guests
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111623.vF2cytxx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/hyperv-next/v6.1-rc7/for-intel-pov-hv/1207
        git checkout 805bc04f26f1ed4477b5ed68f1284b7bd5d0bf30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111623.vF2cytxx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/hv_init.o: in function `hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:57: undefined reference to `hv_tdx_hypercall'
   ld: arch/x86/hyperv/mmu.o: in function `hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:57: undefined reference to `hv_tdx_hypercall'
   ld: arch/x86/hyperv/nested.o: in function `hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:57: undefined reference to `hv_tdx_hypercall'
   ld: arch/x86/hyperv/irqdomain.o: in function `hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:57: undefined reference to `hv_tdx_hypercall'
   ld: arch/x86/hyperv/ivm.o: in function `hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:57: undefined reference to `hv_tdx_hypercall'
   ld: arch/x86/hyperv/hv_apic.o:arch/x86/include/asm/mshyperv.h:57: more undefined references to `hv_tdx_hypercall' follow


vim +57 arch/x86/include/asm/mshyperv.h

    44	
    45	/*
    46	 * If the hypercall involves no input or output parameters, the hypervisor
    47	 * ignores the corresponding GPA pointer.
    48	 */
    49	static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
    50	{
    51		u64 input_address = input ? virt_to_phys(input) : 0;
    52		u64 output_address = output ? virt_to_phys(output) : 0;
    53		u64 hv_status;
    54	
    55	#ifdef CONFIG_X86_64
    56		if (hv_isolation_type_tdx())
  > 57			return hv_tdx_hypercall(control,
    58						cc_mkdec(input_address),
    59						cc_mkdec(output_address));
    60		if (!hv_hypercall_pg)
    61			return U64_MAX;
    62	
    63		__asm__ __volatile__("mov %4, %%r8\n"
    64				     CALL_NOSPEC
    65				     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    66				       "+c" (control), "+d" (input_address)
    67				     :  "r" (output_address),
    68					THUNK_TARGET(hv_hypercall_pg)
    69				     : "cc", "memory", "r8", "r9", "r10", "r11");
    70	#else
    71		u32 input_address_hi = upper_32_bits(input_address);
    72		u32 input_address_lo = lower_32_bits(input_address);
    73		u32 output_address_hi = upper_32_bits(output_address);
    74		u32 output_address_lo = lower_32_bits(output_address);
    75	
    76		if (!hv_hypercall_pg)
    77			return U64_MAX;
    78	
    79		__asm__ __volatile__(CALL_NOSPEC
    80				     : "=A" (hv_status),
    81				       "+c" (input_address_lo), ASM_CALL_CONSTRAINT
    82				     : "A" (control),
    83				       "b" (input_address_hi),
    84				       "D"(output_address_hi), "S"(output_address_lo),
    85				       THUNK_TARGET(hv_hypercall_pg)
    86				     : "cc", "memory");
    87	#endif /* !x86_64 */
    88		return hv_status;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
