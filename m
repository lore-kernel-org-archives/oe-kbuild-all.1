Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE93621
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 00:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683246425; x=1714782425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULrwKyFArtE5xJUhT+eahRDWhSWfxOkPAzh1K+FcBlo=;
  b=hmtT7hbPBEw8vj0x38H2C/sWKBj/YmIOJUtkzLgMtJtSKgtjI17IttIf
   dfG06t35qkrJh7yyBkeNi9Ki0t/noNCcD1qvPdwBbkdIqmedC2gs3Djdw
   ZmADRZnnrMIYfJCbjYVsfL5yHY97PJ3nWAsSg37wRbV1y2RsTBZYayH59
   DkOKh3Rwalzew9KX2SMzAcZ8OJkZ6v3BI781Kgapc1LuO1Gu+HCbvCFcG
   rvAGFZltpq+LVJIYZmqwmTWM3jAHM9VoKi5Da4NJEuX13sIVZfjYxCArh
   mZz7LUQYacHP13fM/l2zOa4ubrkTiS1v6sO/sSyckdLgPIqhhEII5jMpD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435409717"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="435409717"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 17:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="766807724"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="766807724"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 May 2023 17:26:56 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pujHj-0000EC-2a;
	Fri, 05 May 2023 00:26:55 +0000
Date: Fri, 5 May 2023 08:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:riscv,extensions 11/13] arch/riscv/include/asm/hwcap.h:86:41:
 error: 'riscv_isa_extensions' defined but not used
Message-ID: <202305050824.9aKTc8AT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv,extensions
head:   af1f2c56611700302ee6527aaf4e7ac6e5b69e7b
commit: 91110a11ef4160459ff2e9567df86005c6529207 [11/13] RISC-V, dt-bindings: deprecate riscv,isa & replace it with per-extension properties
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230505/202305050824.9aKTc8AT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=91110a11ef4160459ff2e9567df86005c6529207
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor riscv,extensions
        git checkout 91110a11ef4160459ff2e9567df86005c6529207
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050824.9aKTc8AT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/alternative.h:19,
                    from arch/riscv/include/asm/errata_list.h:8,
                    from arch/riscv/include/asm/tlbflush.h:12,
                    from arch/riscv/include/asm/pgtable.h:112,
                    from arch/riscv/include/asm/uaccess.h:12,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from lib/test_bitops.c:9:
>> arch/riscv/include/asm/hwcap.h:86:41: error: 'riscv_isa_extensions' defined but not used [-Werror=unused-const-variable=]
      86 | static const struct riscv_isa_extension riscv_isa_extensions[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/riscv_isa_extensions +86 arch/riscv/include/asm/hwcap.h

    84	
    85	/* sorted in a way */
  > 86	static const struct riscv_isa_extension riscv_isa_extensions[] = {
    87		RISCV_ISA_EXT_CFG("i", RISCV_ISA_EXT_i, "v1.0.0", false),
    88		RISCV_ISA_EXT_CFG("m", RISCV_ISA_EXT_m, "v1.0.0", false),
    89		RISCV_ISA_EXT_CFG("a", RISCV_ISA_EXT_a, "v1.0.0", false),
    90		RISCV_ISA_EXT_CFG("f", RISCV_ISA_EXT_f, "v1.0.0", false),
    91		RISCV_ISA_EXT_CFG("d", RISCV_ISA_EXT_d, "v1.0.0", false),
    92		RISCV_ISA_EXT_CFG("q", RISCV_ISA_EXT_q, "v1.0.0", false),
    93		RISCV_ISA_EXT_CFG("c", RISCV_ISA_EXT_c, "v1.0.0", false),
    94		RISCV_ISA_EXT_CFG("b", RISCV_ISA_EXT_b, "v1.0.0", false),
    95		RISCV_ISA_EXT_CFG("k", RISCV_ISA_EXT_k, "v1.0.0", false),
    96		RISCV_ISA_EXT_CFG("j", RISCV_ISA_EXT_j, "v1.0.0", false),
    97		RISCV_ISA_EXT_CFG("p", RISCV_ISA_EXT_p, "v1.0.0", false),
    98		RISCV_ISA_EXT_CFG("v", RISCV_ISA_EXT_v, "v1.0.0", false),
    99		RISCV_ISA_EXT_CFG("h", RISCV_ISA_EXT_h, "v1.0.0", false),
   100		RISCV_ISA_EXT_CFG("zicbom", RISCV_ISA_EXT_ZICBOM, "v1.0.0", true),
   101		RISCV_ISA_EXT_CFG("zicboz", RISCV_ISA_EXT_ZICBOZ, "v1.0.0", true),
   102		RISCV_ISA_EXT_CFG("zicsr", RISCV_ISA_EXT_ZICSR, "v1.0.0", true),
   103		RISCV_ISA_EXT_CFG("zifencei", RISCV_ISA_EXT_ZIFENCEI, "v1.0.0", true),
   104		RISCV_ISA_EXT_CFG("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE, "v1.0.0", true),
   105		RISCV_ISA_EXT_CFG("zbb", RISCV_ISA_EXT_ZBB, "v1.0.0", true),
   106		RISCV_ISA_EXT_CFG("sscofpmf", RISCV_ISA_EXT_SSCOFPMF, "v1.0.0", true),
   107		RISCV_ISA_EXT_CFG("sstc", RISCV_ISA_EXT_SSTC, "v1.0.0", true),
   108		RISCV_ISA_EXT_CFG("svinval", RISCV_ISA_EXT_SVINVAL, "v1.0.0", true),
   109		RISCV_ISA_EXT_CFG("svnapot", RISCV_ISA_EXT_SVNAPOT, "v1.0.0", true),
   110		RISCV_ISA_EXT_CFG("svpbmt", RISCV_ISA_EXT_SVPBMT, "v1.0.0", true),
   111		RISCV_ISA_EXT_CFG("", RISCV_ISA_EXT_MAX, "", false),
   112	};
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
