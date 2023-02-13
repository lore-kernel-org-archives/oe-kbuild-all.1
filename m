Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A30BAD39
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676316996; x=1707852996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mF8fIG94tsd4QNVe+c1ryuWoHOqHFSDXUAC9EmbQx2E=;
  b=EEIMxgSawVOptzDQXamOd7qvY5bjOAQU6LR5mUZ0YKEYxv9NzXU7bZMx
   w6jb7ngXEOq55FwMFsUVMkUMDi6J7T7uoi3XCJN9LhgevVQR3ZEL9Bew5
   75POXk+RlE1L9iRABdJCHJBsnrnU7pcJZ4+bcZYKVo80Ix1qcQ3yz7BpC
   73tSTmz3anwQnIDNkhs+ZMyHC/xi80cEfrFb3rVvnb3S26jpeLN24+4GD
   ZyJKyWI9sze29LyZtmDy56xb9hLZ/WRyyayIiLPQ5pBA9M01r8zpWMiha
   j/BEirJP3CBjElMa1ut31zEepBuZvWOByj2mYNknRBfimsCsYZNTMSRYL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417198966"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="417198966"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 11:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618769521"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="618769521"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 11:36:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRecq-0007yn-1a;
	Mon, 13 Feb 2023 19:36:32 +0000
Date: Tue, 14 Feb 2023 03:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 09/20] riscv mmu: riscv shadow stack
 page fault handling
Message-ID: <202302140351.iqujxGOS-lkp@intel.com>
References: <20230213045351.3945824-10-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213045351.3945824-10-debug@rivosinc.com>

Hi Deepak,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linus/master arnd-asm-generic/master v6.2-rc8]
[cannot apply to next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-10-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 09/20] riscv mmu: riscv shadow stack page fault handling
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230214/202302140351.iqujxGOS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5bc0c094c6a280c8b4f16d7db053873e5c4fb5aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
        git checkout 5bc0c094c6a280c8b4f16d7db053873e5c4fb5aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140351.iqujxGOS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/traps.c:101:6: warning: no previous prototype for 'is_ss_load_store_insn' [-Wmissing-prototypes]
     101 | bool is_ss_load_store_insn(unsigned long insn)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/traps.c:115:7: warning: no previous prototype for 'get_instruction' [-Wmissing-prototypes]
     115 | ulong get_instruction(ulong epc)
         |       ^~~~~~~~~~~~~~~


vim +/is_ss_load_store_insn +101 arch/riscv/kernel/traps.c

   100	
 > 101	bool is_ss_load_store_insn(unsigned long insn)
   102	{
   103		if ((insn & SS_PUSH_POP) == SS_PUSH_POP)
   104			return true;
   105		/*
   106		 * SS_AMOSWAP overlaps with LP_S_LL.
   107		 * But LP_S_LL can never raise access fault
   108		 */
   109		if ((insn & SS_AMOSWAP) == SS_AMOSWAP)
   110			return true;
   111	
   112		return false;
   113	}
   114	
 > 115	ulong get_instruction(ulong epc)
   116	{
   117		ulong *epc_ptr = (ulong *) epc;
   118		ulong insn = 0;
   119	
   120		__enable_user_access();
   121		insn = *epc_ptr;
   122		__disable_user_access();
   123		return insn;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
