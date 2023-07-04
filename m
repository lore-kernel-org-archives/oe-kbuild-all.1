Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88F6128
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688499847; x=1720035847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dmWRngBsO1ul5j1MK78MaFl+QphJWY7ZkPGBAP0bnuE=;
  b=SUpyef8AlGlmam4Nm/8SlqwzGeYknfiogNglknKgxqEW1vkEx4UkSuQX
   CjVPCCL+0NT22oXZ0m9ZoxxZp1wU4f/cDO/OXfo27AX//Vwu+Gcvw+3Fg
   6wOs+j6lCis1w/Rd+au3RaqeuWNos/+3y+WZtrU9GW2L9L5F3v8yh0kVs
   liSkiH8isZ8Ili8/xCTMZAHkMttyCh7txpe0XDTRp8rjmBSITVT/iSbN7
   dzjqKZYuz80KkVLmiyg3goQ7qN7ad53mTh1sTuwCXvLX2gWWD+HyK6hyb
   x2Zb2b0hBg3gNA7UCws7qUfB9QUeCttQVlNzW7oUd1iAWgMbOSaauKnIb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365749394"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="365749394"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 12:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="712951816"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="712951816"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jul 2023 12:44:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGlwT-000IUx-1X;
	Tue, 04 Jul 2023 19:44:05 +0000
Date: Wed, 5 Jul 2023 03:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V2 PATCH 7/9] riscv: report misaligned accesses emulation
 to hwprobe
Message-ID: <202307050347.en4x3iOT-lkp@intel.com>
References: <20230704140924.315594-8-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230704140924.315594-8-cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on openrisc/for-next]
[also build test ERROR on v6.4]
[cannot apply to linus/master next-20230704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-remove-unused-functions-in-traps_misaligned-c/20230704-221341
base:   https://github.com/openrisc/linux.git for-next
patch link:    https://lore.kernel.org/r/20230704140924.315594-8-cleger%40rivosinc.com
patch subject: [RFC V2 PATCH 7/9] riscv: report misaligned accesses emulation to hwprobe
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230705/202307050347.en4x3iOT-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050347.en4x3iOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050347.en4x3iOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c: Assembler messages:
>> arch/riscv/kernel/traps_misaligned.c:458: Error: unrecognized opcode `ld a4,1(a4)'


vim +458 arch/riscv/kernel/traps_misaligned.c

   446	
   447	void __init misaligned_emulation_init(void)
   448	{
   449		int cpu;
   450		unsigned long emulated = 1, tmp_var;
   451	
   452		/* Temporarily disable unaligned accesses support so that we fixup the
   453		 * exception for code below.
   454		 */
   455		unaligned_enabled = 0;
   456	
   457		__asm__ __volatile__ (
 > 458			"1:\n"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
