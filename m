Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C300D516
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679426152; x=1710962152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CRR063/HFOsYvkrxA6k0mydB/jKTp3qk1rgZzC7i5xU=;
  b=jDcZ6Jp3D2Jagw3TpcFYf/uzmYoUL2Uc7kJ2ts1bMvmiv/7e5VTNRX5o
   l5twoQCH3pqV5VHbF8CJ+hiYySmneolGk+uumJ/e+Nu8SfDbraSKNtJ0L
   f/EENMWrv45FPQMPe09RBuGLpCQPYWBLjVY37h6uN6xXg3PBE7j7dtU5N
   yQ6rZR2rDkznxOWROCRQWF9UONrYHww6BUP154LY2omPUZNF1PWZ4j0so
   BMV8BysYLosVk00l2k7qqC/WLVbWgGgN3AgNFMm+pfn3nKVfjnWGUcea0
   LzZAsQkxTCqUass832C5fjC0wkjUc3SKMsz4RgFV4xheQ8iCla1+3U9Ah
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340577031"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="340577031"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 12:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631716440"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="631716440"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2023 12:15:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pehSY-000CKs-1h;
	Tue, 21 Mar 2023 19:15:50 +0000
Date: Wed, 22 Mar 2023 03:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yu-chen-surf:mpwr 2/3] drivers/acpi/pfmpwr.c:16:10: fatal error:
 asm/realmode.h: No such file or directory
Message-ID: <202303220320.F1ePMHHK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yu-chen-surf/linux.git mpwr
head:   80aa49b502f08ecb466234e78efef54cedd7d5f3
commit: 7059eafc78bc7a62f8242255e88ff7026cc96560 [2/3] ACPI: Introduce Platform Firmware Memory Preserve Warm Reset driver
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230322/202303220320.F1ePMHHK-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yu-chen-surf/linux/commit/7059eafc78bc7a62f8242255e88ff7026cc96560
        git remote add yu-chen-surf https://github.com/yu-chen-surf/linux.git
        git fetch --no-tags yu-chen-surf mpwr
        git checkout 7059eafc78bc7a62f8242255e88ff7026cc96560
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220320.F1ePMHHK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/pfmpwr.c:16:10: fatal error: asm/realmode.h: No such file or directory
      16 | #include <asm/realmode.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +16 drivers/acpi/pfmpwr.c

  > 16	#include <asm/realmode.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
