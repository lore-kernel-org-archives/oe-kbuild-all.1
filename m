Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E13C0A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685564150; x=1717100150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn5HB199oCYVc9ACurKZqDuP0uSn1yG7XPAIkXAOnh8=;
  b=gAyDSHUfi6Pq8GmjZHl/G/0zjtp3v2N8eybiCXmMGMnnm8sQYwcBYfIt
   6YErLe3AyWuCgTmqKwsIfusN8bqMMLNrOLBSaSrqHTqWRFl68DL+bAwWg
   EPSRfFpj4KhjMwwwbRq3vaDdCWbgw7YFv5w0LEyBBGpiVYGnv/IwuG1m0
   kBw/Wea+b7GgUUSUBErcGSYHGVR9oYyySwbCJTliF5daPFOgAWrUVWu2i
   za6VFCOTeqoqjctaoI2hUMdGDk7xh1OjXcNFj9S6NKTgvdxtBBe7ogAL2
   vcOCBV6iwnbmswZiTCFZz/y9qTVLsGunLkHhomV29PW7XoWmaE2lftAcM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344876869"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="344876869"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 13:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710196329"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="710196329"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 13:15:38 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4SEL-0001Zg-2T;
	Wed, 31 May 2023 20:15:37 +0000
Date: Thu, 1 Jun 2023 04:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:perm_alloc/v0 12/13] arch/s390/kernel/module.c:60:9: error:
 implicit declaration of function 'jit_free'
Message-ID: <202306010448.alja5q1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git perm_alloc/v0
head:   a92ef5aa5306aeaadefc1625e1a48c6832aa0a26
commit: 400757f3295e882e8a562583b8b8ee77e696c47c [12/13] arch: make jitalloc setup available regardless of CONFIG_MODULES
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230601/202306010448.alja5q1A-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=400757f3295e882e8a562583b8b8ee77e696c47c
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt perm_alloc/v0
        git checkout 400757f3295e882e8a562583b8b8ee77e696c47c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/ arch/s390/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010448.alja5q1A-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/s390/kernel/module.c: In function 'module_arch_cleanup':
>> arch/s390/kernel/module.c:60:9: error: implicit declaration of function 'jit_free' [-Werror=implicit-function-declaration]
      60 |         jit_free(mod->arch.trampolines_start);
         |         ^~~~~~~~
   arch/s390/kernel/module.c: In function 'module_alloc_ftrace_hotpatch_trampolines':
>> arch/s390/kernel/module.c:493:17: error: implicit declaration of function 'jit_text_alloc' [-Werror=implicit-function-declaration]
     493 |         start = jit_text_alloc(numpages * PAGE_SIZE);
         |                 ^~~~~~~~~~~~~~
>> arch/s390/kernel/module.c:493:15: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     493 |         start = jit_text_alloc(numpages * PAGE_SIZE);
         |               ^
   arch/s390/kernel/module.c: At top level:
   arch/s390/kernel/module.c:39:22: warning: 'get_module_load_offset' defined but not used [-Wunused-function]
      39 | static unsigned long get_module_load_offset(void)
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/s390/mm/init.c: In function 'jit_alloc_arch_params':
>> arch/s390/mm/init.c:325:55: error: implicit declaration of function 'get_module_load_offset' [-Werror=implicit-function-declaration]
     325 |         jit_alloc_params.text.start = MODULES_VADDR + get_module_load_offset();
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/jit_free +60 arch/s390/kernel/module.c

34644cc2e15a7a Heiko Carstens      2023-03-31  56  
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  57  #ifdef CONFIG_FUNCTION_TRACER
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  58  void module_arch_cleanup(struct module *mod)
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  59  {
f5684bcd2a7053 Mike Rapoport (IBM  2023-05-28 @60) 	jit_free(mod->arch.trampolines_start);
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  61  }
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  62  #endif
de5012b41e5c90 Ilya Leoshkevich    2021-07-28  63  

:::::: The code at line 60 was first introduced by commit
:::::: f5684bcd2a7053512001491bb5083900bd98e746 mm: introduce jit_text_alloc() and use it instead of module_alloc()

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
