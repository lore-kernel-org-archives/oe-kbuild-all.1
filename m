Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A554160
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683591348; x=1715127348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GX8hTa5gZuslR7kjJjxywnETsmHznLWfy+c4N61XwPs=;
  b=ACulwwQ9RuiP4bs/nyhbQ3RbcjPsfK2IgXS6HPT7dTB8oQfhBlbCtOUJ
   70/I+HGAFiTGhE+H74swj6wJKeNp+SUUd84xjt9JiNSX07D/wnMMbZBHl
   Y4Cl0lvs+yLDVmgUpxoxOajYJHT9LUrMmqigA6Za9LBTR9FtiExh7Q+3m
   H8I7mqYKA+wgoxKjPIFObbeHacdZj057QvgNC7QvsBoG8AH+7tJqj+Lua
   l0wrvPgluinAzcL7ZUHSKVWtPn+sev1IUZS22nrvOemkk0nE6HrfvG8Mp
   plpX0n6I1AAwjtTZ0lW1fxLxhph7VTFT2lWBeXZc4W6zZFBNmhWzpGWph
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330139231"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330139231"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698693627"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698693627"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 17:15:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwB17-0001TR-1n;
	Tue, 09 May 2023 00:15:45 +0000
Date: Tue, 9 May 2023 08:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/process.c:536:5:
 warning: no previous prototype for 'arch_prctl_mem_model_get'
Message-ID: <202305090854.xr719qab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: 4ab692b22440dd1d9203e939a10fb9d5919b54d8 [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305090854.xr719qab-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/4ab692b22440dd1d9203e939a10fb9d5919b54d8
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout 4ab692b22440dd1d9203e939a10fb9d5919b54d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090854.xr719qab-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/process.c: In function 'copy_thread':
   arch/arm64/kernel/process.c:378:34: error: 'struct thread_struct' has no member named 'actlr'
     378 |                         p->thread.actlr = read_sysreg(actlr_el1);
         |                                  ^
   arch/arm64/kernel/process.c: In function 'actlr_thread_switch':
   arch/arm64/kernel/process.c:531:24: error: 'struct thread_struct' has no member named 'actlr'
     531 |         current->thread.actlr = read_sysreg(actlr_el1);
         |                        ^
   In file included from arch/arm64/include/asm/cputype.h:193,
                    from arch/arm64/include/asm/cache.h:42,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/compat.h:10,
                    from arch/arm64/kernel/process.c:9:
   arch/arm64/kernel/process.c:532:34: error: 'struct thread_struct' has no member named 'actlr'
     532 |         write_sysreg(next->thread.actlr, actlr_el1);
         |                                  ^
   arch/arm64/include/asm/sysreg.h:832:27: note: in definition of macro 'write_sysreg'
     832 |         u64 __val = (u64)(v);                                   \
         |                           ^
   arch/arm64/kernel/process.c: At top level:
>> arch/arm64/kernel/process.c:536:5: warning: no previous prototype for 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
     536 | int arch_prctl_mem_model_get(struct task_struct *t)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/process.c:541:5: warning: no previous prototype for 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
     541 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/cpufeature.c:952:1: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_from_array' [-Wmissing-prototypes]
     952 | init_cpu_hwcaps_indirect_list_from_array(const struct arm64_cpu_capabilities *caps)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:1421:1: warning: no previous prototype for 'feature_matches' [-Wmissing-prototypes]
    1421 | feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
         | ^~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/cpufeature_impdef.c:11:6: warning: no previous prototype for 'has_tso_fixed' [-Wmissing-prototypes]
      11 | bool has_tso_fixed(const struct arm64_cpu_capabilities *entry, int scope)
         |      ^~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature_impdef.c:36:13: warning: no previous prototype for 'init_cpu_hwcaps_indirect_list_impdef' [-Wmissing-prototypes]
      36 | void __init init_cpu_hwcaps_indirect_list_impdef(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_prctl_mem_model_get +536 arch/arm64/kernel/process.c

   534	
   535	#ifdef CONFIG_ARM64_MEMORY_MODEL_CONTROL
 > 536	int arch_prctl_mem_model_get(struct task_struct *t)
   537	{
   538		return PR_SET_MEM_MODEL_DEFAULT;
   539	}
   540	
 > 541	int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
   542	{
   543		if (cpus_have_const_cap(ARM64_HAS_TSO_FIXED) &&
   544		    val == PR_SET_MEM_MODEL_TSO)
   545			return 0;
   546	
   547		if (val == PR_SET_MEM_MODEL_DEFAULT)
   548			return 0;
   549	
   550		return -EINVAL;
   551	}
   552	#endif
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
