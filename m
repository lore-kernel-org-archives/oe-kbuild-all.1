Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9F4C64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676993720; x=1708529720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGOip5+euv5aPqUNq4/0jTFp9kllVMiZYQ8etW2gZ00=;
  b=HGx4vzTNtsI4gJ5UmK1DI2GT8Z4+NqCoWvzqLF0vOpSB0rZS3DIt9nJ5
   bs7avsFQ9KiLTVd1L0o/86b4mP1fCgTrY+NnPngLciMjdZyioag79MUHe
   gpSxsMzRQktWJA2adzO8vJvPHPyyPut5gFzOqR5Vnwv8lMS9Q1u+bRJMu
   FPo5KctHaisWZU7qcFdBE8fVpiGi+/sGaqGypq4YB3/h45qMt3e3dAS/m
   V41li5BbxlvsoIMdqPQBGX1vsjW/vOTe4vtTVdP7i+JItNCVTjqZwclnq
   C/laJsdRNR8greDe8qmzYu0jgBto3EY+18HWT/FbndR6e9Zlu0npUxJQf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316383879"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316383879"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704071691"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="704071691"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 07:27:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUUXz-000Et7-2U;
	Tue, 21 Feb 2023 15:27:15 +0000
Date: Tue, 21 Feb 2023 23:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 4/16]
 arch/loongarch/kernel/hw_breakpoint.c:483:12: warning: no previous prototype
 for 'arch_hw_breakpoint_init'
Message-ID: <202302212345.KeDXResr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   360d80e15dc47f8892dd09e6bff3a7f1e9aa8fb4
commit: cf9b56699e6fcf664a510afc951cf82f1211b5a2 [4/16] LoongArch: Add hardware breakpoints/watchpoints support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302212345.KeDXResr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?id=cf9b56699e6fcf664a510afc951cf82f1211b5a2
        git remote add chenhuacai-loongson https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
        git fetch --no-tags chenhuacai-loongson loongarch-next
        git checkout cf9b56699e6fcf664a510afc951cf82f1211b5a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302212345.KeDXResr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/hw_breakpoint.c:483:12: warning: no previous prototype for 'arch_hw_breakpoint_init' [-Wmissing-prototypes]
     483 | int __init arch_hw_breakpoint_init(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_hw_breakpoint_init +483 arch/loongarch/kernel/hw_breakpoint.c

   482	
 > 483	int __init arch_hw_breakpoint_init(void)
   484	{
   485		int cpu;
   486	
   487		boot_cpu_data.watch_ireg_count = get_num_brps();
   488		boot_cpu_data.watch_dreg_count = get_num_wrps();
   489	
   490		pr_info("Found %d breakpoint and %d watchpoint registers.\n",
   491			boot_cpu_data.watch_ireg_count, boot_cpu_data.watch_dreg_count);
   492	
   493		for (cpu = 1; cpu < NR_CPUS; cpu++) {
   494			cpu_data[cpu].watch_ireg_count = boot_cpu_data.watch_ireg_count;
   495			cpu_data[cpu].watch_dreg_count = boot_cpu_data.watch_dreg_count;
   496		}
   497	
   498		return 0;
   499	}
   500	arch_initcall(arch_hw_breakpoint_init);
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
