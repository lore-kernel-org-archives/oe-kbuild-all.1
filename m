Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569E882A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675284531; x=1706820531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NwUCdEm+MrLvte34IFeX98qAR9ZoLwGjhN4HkK3VoXM=;
  b=QRJUwe8xUMI6sgjzfcek6gY/lNeESd/GyqropS+F3CnSNtmablWkkQqX
   h7kufdZWJWW435qovwL2Dc0x3z2DxKfVOcQA2SBLLqjnJ+iK0V4Fn+bNe
   b1xWGzE42dqIeDs/rDLY4bFo7h/PmwGjV3FBodtcJ9MjN/Bd8KXG1yZ9D
   E5xFBC5prnrMkaBI0BCjEbs0KZIgZus9O7Uwt/xmGAMg4LPzVEcuQ6M/+
   /78SlqOBjFukLSaKr2ZH7aPWC3broAt8yOfUMMhBCjZ5ZiSuNQWXP4REi
   NS74uOMh4N/bY3GYZNptnxNbil+M7s0TpFL2ciQ+9bjYCd874y0NRhQbP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316270989"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="316270989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 12:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="773581055"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="773581055"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2023 12:48:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNK2C-0005nM-2V;
	Wed, 01 Feb 2023 20:48:48 +0000
Date: Thu, 2 Feb 2023 04:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] module: replace module_layout with module_memory
Message-ID: <202302020405.o3ufOxHl-lkp@intel.com>
References: <20230201184422.2932156-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201184422.2932156-1-song@kernel.org>

Hi Song,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on tip/x86/core arm64/for-next/core deller-parisc/for-next powerpc/next powerpc/fixes s390/features linus/master v6.2-rc6]
[cannot apply to hch-configfs/for-next vgupta-arc/for-next vgupta-arc/for-curr]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/module-replace-module_layout-with-module_memory/20230202-024537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230201184422.2932156-1-song%40kernel.org
patch subject: [PATCH v7] module: replace module_layout with module_memory
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020405.o3ufOxHl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/570cd7f4fdd5c3f5a642609730e9b9ca6db669f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Liu/module-replace-module_layout-with-module_memory/20230202-024537
        git checkout 570cd7f4fdd5c3f5a642609730e9b9ca6db669f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/module_32.c: In function 'do_plt_call':
>> arch/powerpc/kernel/module_32.c:166:32: warning: passing argument 1 of 'within_module_init' makes integer from pointer without a cast [-Wint-conversion]
     166 |         if (within_module_init(location, mod))
         |                                ^~~~~~~~
         |                                |
         |                                void *
   In file included from arch/powerpc/kernel/module_32.c:9:
   include/linux/module.h:622:53: note: expected 'long unsigned int' but argument is of type 'void *'
     622 | static inline bool within_module_init(unsigned long addr,
         |                                       ~~~~~~~~~~~~~~^~~~


vim +/within_module_init +166 arch/powerpc/kernel/module_32.c

   155	
   156	/* Set up a trampoline in the PLT to bounce us to the distant function */
   157	static uint32_t do_plt_call(void *location,
   158				    Elf32_Addr val,
   159				    const Elf32_Shdr *sechdrs,
   160				    struct module *mod)
   161	{
   162		struct ppc_plt_entry *entry;
   163	
   164		pr_debug("Doing plt for call to 0x%x at 0x%x\n", val, (unsigned int)location);
   165		/* Init, or core PLT? */
 > 166		if (within_module_init(location, mod))
   167			entry = (void *)sechdrs[mod->arch.core_plt_section].sh_addr;
   168		else
   169			entry = (void *)sechdrs[mod->arch.init_plt_section].sh_addr;
   170	
   171		/* Find this entry, or if that fails, the next avail. entry */
   172		while (entry->jump[0]) {
   173			if (entry_matches(entry, val)) return (uint32_t)entry;
   174			entry++;
   175		}
   176	
   177		if (patch_instruction(&entry->jump[0], ppc_inst(PPC_RAW_LIS(_R12, PPC_HA(val)))))
   178			return 0;
   179		if (patch_instruction(&entry->jump[1], ppc_inst(PPC_RAW_ADDI(_R12, _R12, PPC_LO(val)))))
   180			return 0;
   181		if (patch_instruction(&entry->jump[2], ppc_inst(PPC_RAW_MTCTR(_R12))))
   182			return 0;
   183		if (patch_instruction(&entry->jump[3], ppc_inst(PPC_RAW_BCTR())))
   184			return 0;
   185	
   186		pr_debug("Initialized plt for 0x%x at %p\n", val, entry);
   187		return (uint32_t)entry;
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
