Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022CC17ACA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 20:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692216834; x=1723752834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcLRNEvE8aILCx0urPcR6KLdwDLMs5Xe/sQafgHQMtg=;
  b=C3jbLzVLoozuqyX2wPat26xtDOJ6ylOFjl8gCo7CMUWqb7aXQT4BgzMO
   rMN/RJmOvBK7/0zifM4k1Pru21CanFS44gnpLNvhtOlnY17jKoKp3RzqE
   S2SYfIdlq1F7Uf9yE/adUGlgGYe5N8LXhIN+Q4p1tNQSkLeB5bXpQXt+o
   oCUDY3li0PnB5ae2vm59AXcEVbbYCHablhS95o71MSM6KeFHQNbTSS3zZ
   rHs+Bd/XyrBlx43GCk4Bg90hPgdVv3zaChgDKRsIQjP3cFWdwQXyFX3lx
   +kSk30tOQ601R6B5T8Dbwd+pvIympiuobUhiqV2pT7fu0BxucxSklkYaU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352215122"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352215122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 13:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734355442"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="734355442"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2023 13:13:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWMtq-0000X7-19;
	Wed, 16 Aug 2023 20:13:50 +0000
Date: Thu, 17 Aug 2023 04:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 18/21] arch/x86/include/asm/mshyperv.h:62:13: error:
 implicit declaration of function 'hv_isolation_type_en_snp'
Message-ID: <202308170425.nKviFvVZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   f5c4c5f104612a69401a5343609c6f939716896a
commit: 21ff4de070a797f04aafc8cf608d3b4dbc67aa81 [18/21] x86/hyperv: Use vmmcall to implement Hyper-V hypercall in sev-snp enlightened guest
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230817/202308170425.nKviFvVZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170425.nKviFvVZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170425.nKviFvVZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/hv_init.c:19:
   arch/x86/include/asm/mshyperv.h: In function 'hv_do_hypercall':
>> arch/x86/include/asm/mshyperv.h:62:13: error: implicit declaration of function 'hv_isolation_type_en_snp' [-Werror=implicit-function-declaration]
      62 |         if (hv_isolation_type_en_snp()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h: At top level:
>> arch/x86/include/asm/mshyperv.h:265:13: error: conflicting types for 'hv_isolation_type_en_snp'; have 'bool(void)' {aka '_Bool(void)'}
     265 | extern bool hv_isolation_type_en_snp(void);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mshyperv.h:62:13: note: previous implicit declaration of 'hv_isolation_type_en_snp' with type 'int()'
      62 |         if (hv_isolation_type_en_snp()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hv_isolation_type_en_snp +62 arch/x86/include/asm/mshyperv.h

    54	
    55	static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
    56	{
    57		u64 input_address = input ? virt_to_phys(input) : 0;
    58		u64 output_address = output ? virt_to_phys(output) : 0;
    59		u64 hv_status;
    60	
    61	#ifdef CONFIG_X86_64
  > 62		if (hv_isolation_type_en_snp()) {
    63			__asm__ __volatile__("mov %4, %%r8\n"
    64					     "vmmcall"
    65					     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    66					       "+c" (control), "+d" (input_address)
    67					     :  "r" (output_address)
    68					     : "cc", "memory", "r8", "r9", "r10", "r11");
    69		} else {
    70			if (!hv_hypercall_pg)
    71				return U64_MAX;
    72	
    73			__asm__ __volatile__("mov %4, %%r8\n"
    74					     CALL_NOSPEC
    75					     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    76					       "+c" (control), "+d" (input_address)
    77					     :  "r" (output_address),
    78						THUNK_TARGET(hv_hypercall_pg)
    79					     : "cc", "memory", "r8", "r9", "r10", "r11");
    80		}
    81	#else
    82		u32 input_address_hi = upper_32_bits(input_address);
    83		u32 input_address_lo = lower_32_bits(input_address);
    84		u32 output_address_hi = upper_32_bits(output_address);
    85		u32 output_address_lo = lower_32_bits(output_address);
    86	
    87		if (!hv_hypercall_pg)
    88			return U64_MAX;
    89	
    90		__asm__ __volatile__(CALL_NOSPEC
    91				     : "=A" (hv_status),
    92				       "+c" (input_address_lo), ASM_CALL_CONSTRAINT
    93				     : "A" (control),
    94				       "b" (input_address_hi),
    95				       "D"(output_address_hi), "S"(output_address_lo),
    96				       THUNK_TARGET(hv_hypercall_pg)
    97				     : "cc", "memory");
    98	#endif /* !x86_64 */
    99		return hv_status;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
