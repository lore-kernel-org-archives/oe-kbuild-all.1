Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7A1FC2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681039172; x=1712575172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nvj+HDe1U6AMS2PZfKnRppTO+UeANe2kf1MBzfotoUU=;
  b=JFpu5XVuZiLf8AeyRMWrf99ppDP76ZnGnKcs2+Zrz5/flQqNdJaM/mFF
   JtWqeqoPP6myciRp4vMZ6uxU3JAQ0n7/IKCK21WdMlwV9iA1gANGMw3Ce
   7d93b2zk+daovU+gFJBvlBQuwqiAZHqu6RyYWV+aG/HxEGAISnJfDHsnf
   1KT78nxcaDdYf2AGQ4kgNcXQTP0z0nrH/UwIs+92CNOPbOSVdjjQDdmGw
   xE1PSYsKqG3Md5JK09NGhhrqiV62p5Psh1qhsGG1+yfdPR7K+oo0oWAUG
   dBABKq8HfbrxSvsURCiW+ZH5R4kfkvGJul0aD6SjLI0degs3YKAEDWKWb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="327303634"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="327303634"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 04:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681468227"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="681468227"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Apr 2023 04:19:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plT4y-000UUN-1Y;
	Sun, 09 Apr 2023 11:19:28 +0000
Date: Sun, 9 Apr 2023 19:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 13/15] loongarch64-linux-ld:
 region.c:undefined reference to `unregister_dax_mapping'
Message-ID: <202304091902.giibV6MQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 3113a430f1ccbad8340234cf38b00f271ccee103 [13/15] cxl/mem: Add support to handle DCD add and release capacity events.
config: loongarch-randconfig-r032-20230409 (https://download.01.org/0day-ci/archive/20230409/202304091902.giibV6MQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3113a430f1ccbad8340234cf38b00f271ccee103
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout 3113a430f1ccbad8340234cf38b00f271ccee103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304091902.giibV6MQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: loongarch64-linux-ld: DWARF error: could not find abbrev number 35
   drivers/cxl/core/region.o: in function `.LVL1562':
   region.c:(.text+0x43e8): undefined reference to `unregister_dax_mapping'
>> loongarch64-linux-ld: region.c:(.text+0x43ec): undefined reference to `unregister_dax_mapping'
>> loongarch64-linux-ld: region.c:(.text+0x43ec): undefined reference to `unregister_dax_mapping'
   loongarch64-linux-ld: drivers/cxl/core/region.o: in function `.LVL1563':
>> region.c:(.text+0x43f8): undefined reference to `unregister_dev_dax'
>> loongarch64-linux-ld: region.c:(.text+0x43fc): undefined reference to `unregister_dev_dax'
>> loongarch64-linux-ld: region.c:(.text+0x43fc): undefined reference to `unregister_dev_dax'
   loongarch64-linux-ld: drivers/cxl/core/region.o: in function `.LVL1581':
   region.c:(.text+0x44f0): undefined reference to `devm_create_dev_dax'
   loongarch64-linux-ld: drivers/cxl/core/region.o: in function `.LVL1590':
>> region.c:(.text+0x4574): undefined reference to `alloc_dev_dax_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
