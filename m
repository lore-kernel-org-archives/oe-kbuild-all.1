Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB17522B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686663900; x=1718199900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oOtSUf1t4RVgmuPvgwOMt8FbVGd4845ItF96b7pFsws=;
  b=BcfPZ/xNrpfa+FEsRgeIFzGroYYt4fVrQKIUz33+QA2TmxZWv7Vebahi
   xUFIrgwfWAC0bchai+EWa08kKemCDiYZ4HoAyWUT0Cev3pKG/K0UAgxZN
   /s6aqN8cuAYCFQky/p3bc7LeXowEQN9k4NY3kknWWoeBJkCfkLhFTA63M
   BWXwqkKRPw5i4vOsmjeMhZlKIZssNAC2XrkO/Pixu+V1LUcutfNnr89LB
   upNcQAA0u2l4hQFN3GRVcvnxcWf1PNhI20GnQT9iJgJxoK7uT0ee7OLvC
   +zdbOrKtxuUE/R88GbkbcnVa9CtciKn7+GhbFbEfZmD7XpS9XdTq/+VzY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360813718"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="360813718"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711648960"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="711648960"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 06:44:58 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q94KP-0001OO-18;
	Tue, 13 Jun 2023 13:44:57 +0000
Date: Tue, 13 Jun 2023 21:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.2 10/12] arch/powerpc/mm/mem.c:450:2: error:
 invalid preprocessing directive #esle; did you mean #else?
Message-ID: <202306132115.pw2jFyVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v1.2
head:   84c44775df115634608120edf7c1bdf7406681e1
commit: f57d1ee970cebb86e816c1e14a0badde22a64160 [10/12] arch: make execmem setup available regardless of CONFIG_MODULES
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306132115.pw2jFyVF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=f57d1ee970cebb86e816c1e14a0badde22a64160
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt jitalloc/v1.2
        git checkout f57d1ee970cebb86e816c1e14a0badde22a64160
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132115.pw2jFyVF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/mem.c: In function 'execmem_arch_params':
>> arch/powerpc/mm/mem.c:450:2: error: invalid preprocessing directive #esle; did you mean #else?
     450 | #esle
         |  ^~~~
         |  else


vim +450 arch/powerpc/mm/mem.c

   424	
   425	struct execmem_params *execmem_arch_params(void)
   426	{
   427		pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
   428	
   429		/*
   430		 * BOOK3S_32 and 8xx define MODULES_VADDR for text allocations and
   431		 * allow allocating data in the entire vmalloc space
   432		 */
   433	#ifdef MODULES_VADDR
   434		unsigned long limit = (unsigned long)_etext - SZ_32M;
   435	
   436		/* First try within 32M limit from _etext to avoid branch trampolines */
   437		if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit) {
   438			execmem_params.modules.text.start = limit;
   439			execmem_params.modules.text.end = MODULES_END;
   440			execmem_params.modules.text.fallback_start = MODULES_VADDR;
   441			execmem_params.modules.text.fallback_end = MODULES_END;
   442		} else {
   443			execmem_params.modules.text.start = MODULES_VADDR;
   444			execmem_params.modules.text.end = MODULES_END;
   445		}
   446		execmem_params.modules.data.start = VMALLOC_START;
   447		execmem_params.modules.data.end = VMALLOC_END;
   448		execmem_params.modules.data.pgprot = PAGE_KERNEL;
   449		execmem_params.modules.data.alignment = 1;
 > 450	#esle

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
