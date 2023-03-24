Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831651FD3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 04:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679632080; x=1711168080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qd2cuBVpx9SVSMnIM3lGfsMVXUDSyYXNwZ7cJ2wn9Tc=;
  b=bQpoAA/1SvW2C/+fYFTyQFX3BTT2puvxkV84UJwSlesJW010WNVNeNz1
   P7irjei6j1PsD4JeLMaKnMSRTUkr+7ajNJLaExo9p4lTGoYX5PO11NSJa
   diO/CBanxZ+nuKhHKXuZfjpqqdN91hTaQ0qH0zeteuyjakM13unx9kLiI
   nSH0DMXi4GmnJAtlQ/ZzVWu/5uLTyX8m1wgtqME0s2Y6Ua9YlDR7tCeHJ
   WtQkmIUiZbHtU2AI3/vAU6iktaSXlEii+7jjZ0T5pqR2qXgDkrl2nabdp
   uOdW62v1rGNzCU0AF73PPZAAard3YCqEAEFOHsMva3BFYmiYWqTc1I0dp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342078266"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="342078266"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 21:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682543300"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="682543300"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 21:27:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfZ1y-000Eye-1Y;
	Fri, 24 Mar 2023 04:27:58 +0000
Date: Fri, 24 Mar 2023 12:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:alexghiti_test 70/78] string.c:(.text+0x12dc): multiple
 definition of `memcpy'; mm/kasan/shadow.o:shadow.c:(.text+0x18e): first
 defined here
Message-ID: <202303241211.mkSRftmo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: 2502ee1fcf82360af802cc79074238ebd4b7b5a7 [70/78] riscv: optimized memcpy
config: riscv-randconfig-r042-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241211.mkSRftmo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/2502ee1fcf82360af802cc79074238ebd4b7b5a7
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout 2502ee1fcf82360af802cc79074238ebd4b7b5a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241211.mkSRftmo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   riscv64-linux-ld: lib/string.o: in function `memcpy':
>> string.c:(.text+0x12dc): multiple definition of `memcpy'; mm/kasan/shadow.o:shadow.c:(.text+0x18e): first defined here
--
>> drivers/firmware/efi/libstub/intrinsics.c:18:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
      18 | void *memcpy(void *dst, const void *src, size_t len)
         |       ^~~~~~
--
>> mm/kasan/shadow.c:72:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
      72 | void *memcpy(void *dest, const void *src, size_t len)
         |       ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
