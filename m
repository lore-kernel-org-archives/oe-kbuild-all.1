Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD123D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677938636; x=1709474636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agkR8LKABRzG8q6u92wpZNHNNWhPSyRsb6Xu5KFTTn8=;
  b=IYsbM24vyy/X0txd8/aQRJWXsjUyLs1ns6NUbpz8cujyhTctKozXNQk8
   S/+wgXmqMCsZJMbFU7fdAitnEkojnUQR1NLSTIanOztgi7wpqm0ff5XSZ
   6eBS0MVSS/Fwa4MTSBPHR4CwkFp+bpeNH1ZR4y2xMS6WcHgr/ArkdGb3b
   HcWVVAAdO1eukn5hK2mGmfEFJJs2ibavYc+euwe3aAmg14X8n8wBE/gsS
   0qM8R5eakVGTKx0aGDw8V18ZNBbzFiVba+TE4R+xkhyPZ/hoeZJLk0m88
   8GC0T3m+hFjjHoEBzSW8YOlquvi9yNjWeCZNTFslbbM+PrHkrc5jdC89N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="333981866"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="333981866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 06:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="785630175"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="785630175"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2023 06:03:54 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYSUM-0002CO-19;
	Sat, 04 Mar 2023 14:03:54 +0000
Date: Sat, 4 Mar 2023 22:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 129/143] vmstat.c:undefined reference to
 `__bad_xchg'
Message-ID: <202303042241.YDVOTOi1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   df3ae4347aff9be1e9763ffa3b1015fca348bfbd
commit: 676a3befc9bac1179f6a160ffe059c11e831a32c [129/143] mm/vmstat: use xchg in cpu_vm_stats_fold
config: arm-randconfig-r014-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042241.YDVOTOi1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=676a3befc9bac1179f6a160ffe059c11e831a32c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 676a3befc9bac1179f6a160ffe059c11e831a32c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042241.YDVOTOi1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arm-linux-gnueabi-ld: DWARF error: could not find abbrev number 735699
   mm/vmstat.o: in function `cpu_vm_stats_fold':
>> vmstat.c:(.text+0x1c28): undefined reference to `__bad_xchg'
>> arm-linux-gnueabi-ld: vmstat.c:(.text+0x1ca0): undefined reference to `__bad_xchg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
