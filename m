Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0D1DDF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691664729; x=1723200729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sypun7dyC6UrRkKmgnYt6ejAH3C034mdiLGvkoFnyQ=;
  b=LhZQe9BRplSSBUvyzhmvIZYkayV9wBsvihUn0JFwFH4UeYsjhOLfUv17
   BP2TOGK4xfPwaruN+AlLavXWV8w/tRN7hXw0PUjefOBpZ9Hpw5Bs6UwsX
   FrczPZ1gmSZfkXHT/qu/6xNElPkCYqY9m2SBaXmgoSSB0kZwasIvZYJut
   FGlqZXUzNvUWlseJPtDdQRT6VXLg1+3g62ae4+KFPWl07N8HNMCckJ1ou
   S4kQirL4E4hwymRotnHkQnsHzakLgVtBEWaaETolgqohBcn3ySSR0jG2k
   D5ZwooRjqb7CF3XfGzJ7p2iCOQvYxLKbP+0GADkOXd3fTlvFycNH1Cc3m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437718419"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="437718419"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 03:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846338112"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="846338112"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2023 03:52:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU3Gx-0006wq-2M;
	Thu, 10 Aug 2023 10:52:07 +0000
Date: Thu, 10 Aug 2023 18:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 6/29] vmlinux.o: warning: objtool:
 pv_native_safe_halt+0xe: call to check_hv_pending_irq_enable() leaves
 .noinstr.text section
Message-ID: <202308101827.W7zorQGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: f5472e8cb0ed366790513e9fa58b20a2bd73a0a1 [6/29] x86/sev: Add Check of #HV event in path
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308101827.W7zorQGq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101827.W7zorQGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101827.W7zorQGq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: hv_switch_off_ist+0x15b: call to panic() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pv_native_safe_halt+0xe: call to check_hv_pending_irq_enable() leaves .noinstr.text section


objdump-func vmlinux.o pv_native_safe_halt:
0000 000000000000b0c0 <pv_native_safe_halt>:
0000     b0c0:	f3 0f 1e fa          	endbr64
0004     b0c4:	eb 07                	jmp    b0cd <pv_native_safe_halt+0xd>
0006     b0c6:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # b0cd <pv_native_safe_halt+0xd>	b0c9: R_X86_64_PC32	.rodata+0x4cbbc
000d     b0cd:	fb                   	sti
000e     b0ce:	e8 00 00 00 00       	call   b0d3 <pv_native_safe_halt+0x13>	b0cf: R_X86_64_PLT32	check_hv_pending_irq_enable-0x4
0013     b0d3:	f4                   	hlt
0014     b0d4:	e9 00 00 00 00       	jmp    b0d9 <pv_native_safe_halt+0x19>	b0d5: R_X86_64_PLT32	__x86_return_thunk-0x4
0019     b0d9:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0023     b0e3:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
002d     b0ed:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0037     b0f7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
