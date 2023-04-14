Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F35630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 03:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681441935; x=1712977935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VHziY9JoMofGSCuIrbyjfxHU2HpwMdGJcSMc2X26wA4=;
  b=GMz91ZFIyOmXeGHzKI1hgLSbqkspaDzuNOv2cAn2Pg/4wW4jnOpiELlE
   1dM5lsQBQirmBsSGOMhtkbUMVaEaQ5yQpuq2Xw0OyKMxQwrZmBklj2/e2
   gG/TOOp8R6zbKz8FI0YwxGiG1GtTUfqkZSERg+NCehy/lJDkt/MTwMHEn
   3Z/v//C34PK0t01hmp+FtzcOIk03HJNB0zOj/wqkFO7gR170J8K47SEbs
   eC1ssyKXvRVnge+lB/t9jghNzHy2vO6TIlk3XZVkB+btQVM64d6UMhkG6
   F0W6+Evi37+CBs6pb5MC/Or+q+7UJCTwTDjU1Pl2FJxox5coqwib5PkGC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341870392"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="341870392"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 20:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="801027685"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="801027685"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 20:12:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn9rA-000ZB7-1A;
	Fri, 14 Apr 2023 03:12:12 +0000
Date: Fri, 14 Apr 2023 11:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 42/50]
 arch/riscv/cove/cove_guest_sbi.c:14:5: warning: no previous prototype for
 'sbi_covg_add_mmio_region'
Message-ID: <202304141143.kKVBgMBQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: e6cad0195855738a28de936260971465f4c4d95e [42/50] RISC-V: Implement COVG SBI extension
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304141143.kKVBgMBQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/e6cad0195855738a28de936260971465f4c4d95e
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout e6cad0195855738a28de936260971465f4c4d95e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/cove/ arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141143.kKVBgMBQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/cove/cove_guest_sbi.c:14:5: warning: no previous prototype for 'sbi_covg_add_mmio_region' [-Wmissing-prototypes]
      14 | int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:26:5: warning: no previous prototype for 'sbi_covg_remove_mmio_region' [-Wmissing-prototypes]
      26 | int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:38:5: warning: no previous prototype for 'sbi_covg_share_memory' [-Wmissing-prototypes]
      38 | int sbi_covg_share_memory(unsigned long addr, unsigned long len)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:50:5: warning: no previous prototype for 'sbi_covg_unshare_memory' [-Wmissing-prototypes]
      50 | int sbi_covg_unshare_memory(unsigned long addr, unsigned long len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:62:5: warning: no previous prototype for 'sbi_covg_allow_external_interrupt' [-Wmissing-prototypes]
      62 | int sbi_covg_allow_external_interrupt(unsigned long id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:74:5: warning: no previous prototype for 'sbi_covg_allow_all_external_interrupt' [-Wmissing-prototypes]
      74 | int sbi_covg_allow_all_external_interrupt(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:86:5: warning: no previous prototype for 'sbi_covg_deny_external_interrupt' [-Wmissing-prototypes]
      86 | int sbi_covg_deny_external_interrupt(unsigned long id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/cove/cove_guest_sbi.c:98:5: warning: no previous prototype for 'sbi_covg_deny_all_external_interrupt' [-Wmissing-prototypes]
      98 | int sbi_covg_deny_all_external_interrupt(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sbi_covg_add_mmio_region +14 arch/riscv/cove/cove_guest_sbi.c

    13	
  > 14	int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len)
    15	{
    16		struct sbiret ret;
    17	
    18		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ADD_MMIO_REGION, addr, len,
    19				0, 0, 0, 0);
    20		if (ret.error)
    21			return sbi_err_map_linux_errno(ret.error);
    22	
    23		return 0;
    24	}
    25	
  > 26	int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len)
    27	{
    28		struct sbiret ret;
    29	
    30		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_REMOVE_MMIO_REGION, addr,
    31				len, 0, 0, 0, 0);
    32		if (ret.error)
    33			return sbi_err_map_linux_errno(ret.error);
    34	
    35		return 0;
    36	}
    37	
  > 38	int sbi_covg_share_memory(unsigned long addr, unsigned long len)
    39	{
    40		struct sbiret ret;
    41	
    42		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_SHARE_MEMORY, addr, len, 0,
    43				0, 0, 0);
    44		if (ret.error)
    45			return sbi_err_map_linux_errno(ret.error);
    46	
    47		return 0;
    48	}
    49	
  > 50	int sbi_covg_unshare_memory(unsigned long addr, unsigned long len)
    51	{
    52		struct sbiret ret;
    53	
    54		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_UNSHARE_MEMORY, addr, len, 0,
    55				0, 0, 0);
    56		if (ret.error)
    57			return sbi_err_map_linux_errno(ret.error);
    58	
    59		return 0;
    60	}
    61	
  > 62	int sbi_covg_allow_external_interrupt(unsigned long id)
    63	{
    64		struct sbiret ret;
    65	
    66		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, id, 0,
    67				0, 0, 0, 0);
    68		if (ret.error)
    69			return sbi_err_map_linux_errno(ret.error);
    70	
    71		return 0;
    72	}
    73	
  > 74	int sbi_covg_allow_all_external_interrupt(void)
    75	{
    76		struct sbiret ret;
    77	
    78		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, -1, 0,
    79				0, 0, 0, 0);
    80		if (ret.error)
    81			return sbi_err_map_linux_errno(ret.error);
    82	
    83		return 0;
    84	}
    85	
  > 86	int sbi_covg_deny_external_interrupt(unsigned long id)
    87	{
    88		struct sbiret ret;
    89	
    90		ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_DENY_EXT_INTERRUPT, id, 0, 0,
    91				0, 0, 0);
    92		if (ret.error)
    93			return sbi_err_map_linux_errno(ret.error);
    94	
    95		return 0;
    96	}
    97	
  > 98	int sbi_covg_deny_all_external_interrupt(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
