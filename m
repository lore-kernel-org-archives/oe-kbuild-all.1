Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01556BA4F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678215748; x=1709751748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4URSEjXWW8fG3dqhcaKIVFig5cjWeE481dqIQ/0RNM=;
  b=fRx2qgzPSAZgn3v9g01unjQSFEjHvZP5XP768SB0Y3qrf7/WtQoWyeey
   zl27zkDEsbtwCgvzq8vYvSL/ejwL6lCxB6kusAQuOTv0ulG5HYKg+JDD7
   5hxDDhteE2gGKfDsr2RReLY0ZhTkvoeMSaFp2CU5Bu6ceBAnJrt46fTvB
   lL0QlFYOS9dJGUYSxSYERlSKaDYTKk5hzohYPDMU4hNZ3L0+I/blXtxVf
   po+rPgP31GEhZH4BozQXGPeD/gYYkVoFmX0ZO2yinN9MRf3pu0WiGsJZQ
   sa5oNU1JqBgq3OgA7pD+W5Emdij9ZiVqQuWZjdZjb6pC541CzB82VQtJF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400767728"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="400767728"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 11:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676663266"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="676663266"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 11:02:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZcZj-0001XN-37;
	Tue, 07 Mar 2023 19:02:15 +0000
Date: Wed, 8 Mar 2023 03:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 13/57]
 drivers/of/module.c:62:15: error: implicit declaration of function
 'kmalloc'; did you mean 'mm_alloc'?
Message-ID: <202303080205.hTq66slg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   4dbec5e07ef322a0458183244c9a11e92eebd61d
commit: 71414eadef0bb9ab9e3688498d0dc11f2739b5f2 [13/57] of: Move the request module helper logic to module.c
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230308/202303080205.hTq66slg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/of/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080205.hTq66slg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/of/module.c: In function 'of_request_module':
>> drivers/of/module.c:62:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      62 |         str = kmalloc(size, GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/of/module.c:62:13: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      62 |         str = kmalloc(size, GFP_KERNEL);
         |             ^
>> drivers/of/module.c:69:9: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      69 |         kfree(str);
         |         ^~~~~
         |         kvfree
   cc1: some warnings being treated as errors


vim +62 drivers/of/module.c

    45	
    46	int of_request_module(struct device_node *np)
    47	{
    48		char *str;
    49		ssize_t size;
    50		int ret;
    51	
    52		if (!np)
    53			return -ENODEV;
    54	
    55		size = of_modalias(np, NULL, 0);
    56		if (size < 0)
    57			return size;
    58	
    59		/* Reserve an additional byte for the trailing '\0' */
    60		size++;
    61	
  > 62		str = kmalloc(size, GFP_KERNEL);
    63		if (!str)
    64			return -ENOMEM;
    65	
    66		of_modalias(np, str, size);
    67		str[size - 1] = '\0';
    68		ret = request_module(str);
  > 69		kfree(str);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
