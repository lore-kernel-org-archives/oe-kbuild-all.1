Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE17E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683163602; x=1714699602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bs73QAIx2Zdjz4zKmQAMl8KAwYTd10pi0oBYpt8h+6A=;
  b=W/F5GT7RiuqOaodlRn+FriyAvkPJ+jGy9YPSfdY5bJpojf+n/m4VY8JR
   PpKTZa/2D72pdOZZ5/MupUAkfaiV7GibP2VPjS1CYC0jvnYt/D7AfbTco
   bTyjsWeLuAENX02HpdlWAjmh4CTgNJxSnOHfMxkc9IT+losClQDuoaF+O
   tltBLDS8ikXtP18sJGqjpXcERwDiHA27L69JiloZJX5hUCsLrtK4idSKW
   l1BBjcI31KmMfvgQ4xGg5fCBBgjSw/uUxFIibqHG6SJB+UaTuau5tb427
   z5l3zHfBsngMau/0eSNuZf4tK/McDsqCvYRDgB/jd1bJvQrRWXv51sxv4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333173472"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="333173472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 18:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729587028"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="729587028"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 May 2023 18:26:40 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puNjz-0002PQ-1r;
	Thu, 04 May 2023 01:26:39 +0000
Date: Thu, 4 May 2023 09:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:riscv,extensions 13/13]
 arch/riscv/kernel/cpufeature.c:340:23: warning: variable 'isa2hwcap' set but
 not used
Message-ID: <202305040951.zqIZyRU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv,extensions
head:   b0ad99d18814e7bebb27baa2465375ae70d00cae
commit: b0ad99d18814e7bebb27baa2465375ae70d00cae [13/13] RISC-V, dt-bindings: deprecate riscv,isa & replace it with per-extension properties
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230504/202305040951.zqIZyRU8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=b0ad99d18814e7bebb27baa2465375ae70d00cae
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor riscv,extensions
        git checkout b0ad99d18814e7bebb27baa2465375ae70d00cae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040951.zqIZyRU8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/cpufeature.c: In function 'riscv_fill_hwcap':
>> arch/riscv/kernel/cpufeature.c:340:23: warning: variable 'isa2hwcap' set but not used [-Wunused-but-set-variable]
     340 |         unsigned long isa2hwcap[26] = {0};
         |                       ^~~~~~~~~
   arch/riscv/kernel/cpufeature.c:339:13: warning: unused variable 'rc' [-Wunused-variable]
     339 |         int rc;
         |             ^~


vim +/isa2hwcap +340 arch/riscv/kernel/cpufeature.c

   333	
   334	void __init riscv_fill_hwcap(void)
   335	{
   336		char print_str[NUM_ALPHA_EXTS + 1];
   337		int i, j;
   338		struct device_node *node;
   339		int rc;
 > 340		unsigned long isa2hwcap[26] = {0};
   341		unsigned int cpu;
   342	
   343		elf_hwcap = 0;
   344	
   345		bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
   346	
   347		riscv_fill_hwcap_isa_string();
   348	
   349		isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
   350		isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
   351		isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
   352		isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
   353		isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
   354		isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
   355	
   356		for_each_possible_cpu(cpu) {
   357			DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
   358	
   359			node = of_cpu_device_node_get(cpu);
   360			if (!node) {
   361				pr_warn("Unable to find cpu node\n");
   362				continue;
   363			}
   364	
   365			for (int k = 0; k < ARRAY_SIZE(riscv_isa_extensions) - 1; k++) {
   366				const char *tmp;
   367	
   368				of_property_read_string(node, riscv_isa_extensions[k].prop_name, &tmp);
   369				if (!tmp)
   370					continue;
   371	
   372				if (!strcmp(riscv_isa_extensions[k].version, tmp))
   373					set_bit(riscv_isa_extensions[k].key, this_isa);
   374			}
   375		}
   376	
   377		/* We don't support systems with F but without D, so mask those out
   378		 * here. */
   379		if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
   380			pr_info("This kernel does not support systems with F but not D\n");
   381			elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
   382		}
   383	
   384		memset(print_str, 0, sizeof(print_str));
   385		for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
   386			if (riscv_isa[0] & BIT_MASK(i))
   387				print_str[j++] = (char)('a' + i);
   388		pr_info("riscv: base ISA extensions %s\n", print_str);
   389	
   390		memset(print_str, 0, sizeof(print_str));
   391		for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
   392			if (elf_hwcap & BIT_MASK(i))
   393				print_str[j++] = (char)('a' + i);
   394		pr_info("riscv: ELF capabilities %s\n", print_str);
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
