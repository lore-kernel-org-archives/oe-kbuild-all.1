Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90E12B8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWN39N6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704705598; x=1736241598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75vA+zbGat/AIFO8v9lmOiUn3QaRw+tJgNHp+s9iD2g=;
  b=OWN39N6CHFmIitOu8ZiPyvGkDsMzyjisUczTaUxy0QsxEKyPKw5OdYs8
   oTjdvTfWFad01eUbqbulFR7oJIA2DMS8Nkxx0yNtgkre+M3Oae2CiwHik
   UojMrZMFVTI58meHCDTI+J/vUzcTvSwmATHkbyLSxaU+jdZNIGhK67Yof
   Atu0qTr1kWKqgPD8c4gaV0foZYuvCrp/9eZQ1h1l8zPKkeAm+/p5fmYUB
   RwfDK7J97mjHt+Q/Ca8TIu+IpZ5H4QzSUlZXgQIfn6xEC+Y2C8no/rfAp
   ToCDUvjsboSGPQQ9WXJR4ZzRuWYZ15RixEoto8sCn47ekWrcCfkszEBZO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11178504"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11178504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:19:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="29730374"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2024 01:19:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMlnV-0004Zk-2j;
	Mon, 08 Jan 2024 09:19:53 +0000
Date: Mon, 8 Jan 2024 17:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v0 13/14] arch/powerpc/kernel/kprobes.c:133:16: error:
 implicit declaration of function 'execmem_alloc'; did you mean 'mm_alloc'?
Message-ID: <202401081719.hZ4JGrD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v0
head:   7b112b930be7b0627fa65c6f8a2b64cd325c0ea9
commit: 6776e4ba438ac7c0d0f8317056f0098e73cc72eb [13/14] kprobes: remove dependency on CONFIG_MODULES
config: powerpc-randconfig-r111-20240108 (https://download.01.org/0day-ci/archive/20240108/202401081719.hZ4JGrD9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240108/202401081719.hZ4JGrD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081719.hZ4JGrD9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/kernel/kprobes.c: In function 'kprobes_alloc_insn_page':
>> arch/powerpc/kernel/kprobes.c:133:16: error: implicit declaration of function 'execmem_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
     133 |         page = execmem_alloc(PAGE_SIZE);
         |                ^~~~~~~~~~~~~
         |                mm_alloc
>> arch/powerpc/kernel/kprobes.c:133:14: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     133 |         page = execmem_alloc(PAGE_SIZE);
         |              ^
   cc1: some warnings being treated as errors
--
   arch/powerpc/mm/execmem.c: In function 'execmem_alloc':
>> arch/powerpc/mm/execmem.c:26:46: error: '_etext' undeclared (first use in this function)
      26 |         unsigned long limit = (unsigned long)_etext - SZ_32M;
         |                                              ^~~~~~
   arch/powerpc/mm/execmem.c:26:46: note: each undeclared identifier is reported only once for each function it appears in


vim +133 arch/powerpc/kernel/kprobes.c

cc66bb91457827 Peter Zijlstra      2022-03-08  128  
7483c8c81c9785 Mike Rapoport (IBM  2024-01-06  129) void *kprobes_alloc_insn_page(void)
6a3a58e6230dc5 Russell Currey      2021-06-09  130  {
6a3a58e6230dc5 Russell Currey      2021-06-09  131  	void *page;
6a3a58e6230dc5 Russell Currey      2021-06-09  132  
ccea3084f3f31f Mike Rapoport (IBM  2024-01-06 @133) 	page = execmem_alloc(PAGE_SIZE);
6a3a58e6230dc5 Russell Currey      2021-06-09  134  	if (!page)
6a3a58e6230dc5 Russell Currey      2021-06-09  135  		return NULL;
6a3a58e6230dc5 Russell Currey      2021-06-09  136  
d48567c9a0d1e6 Peter Zijlstra      2022-10-26  137  	if (strict_module_rwx_enabled())
d48567c9a0d1e6 Peter Zijlstra      2022-10-26  138  		set_memory_rox((unsigned long)page, 1);
d48567c9a0d1e6 Peter Zijlstra      2022-10-26  139  
6a3a58e6230dc5 Russell Currey      2021-06-09  140  	return page;
6a3a58e6230dc5 Russell Currey      2021-06-09  141  }
6a3a58e6230dc5 Russell Currey      2021-06-09  142  

:::::: The code at line 133 was first introduced by commit
:::::: ccea3084f3f31f35c92c28ad9000871c94e194d5 dev: powerpc: s/module_alloc/execmem_text_alloc/

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
