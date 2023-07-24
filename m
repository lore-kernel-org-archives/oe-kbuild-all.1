Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4964EC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690170569; x=1721706569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ukDiPTksr/iZk1Kz+B6eSMtUZ6CwhQWm9Hm7NgPtrv8=;
  b=GI8cMcFw1J7zoVWBeCAo86M9wsWa/DG+XXxhi6ztw5V0/ZIbmBHW++IB
   duzGqRe5dssVMScUacSykmi/1oSapi15WWnBlJUQ594wnAhlCEO1Rxuo/
   5RaYaBwqMWXaga7SlBAdMyZzwOg0abhdAkFzEBI4qgdsXPaTS9g2E/qa2
   BTgB1tmyJ4d3ud+BTtFXZQFy31VXYBHavvM/fuZFFhg6gsMxEwrswz86y
   /ae6wcMcPKKtldI+dyP6ya6Zs98+cT+XT4fgN2lrNmu/+XNz2CgRz7Xb4
   piRWjQbe1oqQBY9VukQT+2BlE3luMxc9cCHhL6QPm8ifBBDmk+vjjIFbH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433581534"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433581534"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 20:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972112933"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972112933"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2023 20:49:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNmZb-0009TD-11;
	Mon, 24 Jul 2023 03:49:27 +0000
Date: Mon, 24 Jul 2023 11:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 33/75] drivers/soc/sifive/sifive_ccache.c:157:18:
 error: initialization of 'void (*)(phys_addr_t,  long unsigned int)' {aka
 'void (*)(unsigned int,  long unsigned int)'} from incompatible pointer type
 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,...
Message-ID: <202307241141.RMDq4x7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   67e2a22c34a5e14f77710f1276401e483e14bfaa
commit: 46ed065244809b3ea0af1101ded654c42d9d2267 [33/75] soc: sifive: ccache: Support cache management operations
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230724/202307241141.RMDq4x7G-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241141.RMDq4x7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241141.RMDq4x7G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/sifive/sifive_ccache.c:157:18: error: initialization of 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     157 |         .wback = &ccache_flush_range,
         |                  ^
   drivers/soc/sifive/sifive_ccache.c:157:18: note: (near initialization for 'ccache_mgmt_ops.wback')
   drivers/soc/sifive/sifive_ccache.c:158:16: error: initialization of 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     158 |         .inv = &ccache_flush_range,
         |                ^
   drivers/soc/sifive/sifive_ccache.c:158:16: note: (near initialization for 'ccache_mgmt_ops.inv')
   drivers/soc/sifive/sifive_ccache.c:159:22: error: initialization of 'void (*)(phys_addr_t,  long unsigned int)' {aka 'void (*)(unsigned int,  long unsigned int)'} from incompatible pointer type 'void (*)(phys_addr_t,  size_t)' {aka 'void (*)(unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
     159 |         .wback_inv = &ccache_flush_range,
         |                      ^
   drivers/soc/sifive/sifive_ccache.c:159:22: note: (near initialization for 'ccache_mgmt_ops.wback_inv')
   cc1: some warnings being treated as errors


vim +157 drivers/soc/sifive/sifive_ccache.c

   155	
   156	static const struct __initdata riscv_cache_ops ccache_mgmt_ops = {
 > 157		.wback = &ccache_flush_range,
   158		.inv = &ccache_flush_range,
   159		.wback_inv = &ccache_flush_range,
   160	};
   161	#endif /* CONFIG_RISCV_NONSTANDARD_CACHE_OPS */
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
