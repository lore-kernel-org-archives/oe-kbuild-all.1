Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13FD3C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686657295; x=1718193295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSYyffHVtgZGwMhKzIs+9bUHUCo/CvvHJbrBpuByLUY=;
  b=Q+jv1p6EkPNrWn6zbEc0IHUUxt6f/Rah3SYTDmQqLJcTnJoUbgU7iaji
   6KfZMg1CSsrg0jCL5tAsm5TUxsn9DgQTIeBg5CN9oUnwJQSWuzX9j8+vk
   DA6gHCtAucYBYfAYmdKZxntNxO6ng2RXVjLmoyQPB/TajSVgJerN7k+Ve
   IQ8h/ncO/d/sqOPZytbx2Iq0eYEXnJ1FE9zEJMomfaGHHPPmoBu5i69pb
   d3BO45tu4dFwMMAc/I7l+BqmuGeT99qMfpadHvjmVkEcMvrpIL/O16qoE
   mLQzkUzjpEk0HlzJy/dwxQAGfSmmJeFWnj6td9RsmYnWH8FZnA1Q0okLI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342997501"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="342997501"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="781639728"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="781639728"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2023 04:54:54 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q92bt-0001K8-1C;
	Tue, 13 Jun 2023 11:54:53 +0000
Date: Tue, 13 Jun 2023 19:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v1.2 10/12] arch/s390/mm/init.c:329:47: error:
 implicit declaration of function 'get_module_load_offset'
Message-ID: <202306131935.b1Ueypsv-lkp@intel.com>
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
config: s390-randconfig-r021-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131935.b1Ueypsv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/mm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131935.b1Ueypsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/mm/init.c: In function 'execmem_arch_params':
>> arch/s390/mm/init.c:329:47: error: implicit declaration of function 'get_module_load_offset' [-Werror=implicit-function-declaration]
     329 |         unsigned long start = MODULES_VADDR + get_module_load_offset();
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_module_load_offset +329 arch/s390/mm/init.c

   326	
   327	struct execmem_params *execmem_arch_params(void)
   328	{
 > 329		unsigned long start = MODULES_VADDR + get_module_load_offset();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
