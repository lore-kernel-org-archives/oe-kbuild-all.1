Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636447E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679643126; x=1711179126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaGhop8XhAF6DG9lzA7SDhn2l0NPtjI98c+1mT48yhc=;
  b=fYn6OgN3v7KWxJaE09xy4e5Ipd5sxUmAA+Y38GX08px8pB3LdktOApO3
   dOAw+fG+VNK0UJYK8YXvb/vZa8WFtxOURjyY/+iOZ2UKGl89iMr/+1oBD
   OIOX5quE8MM6KpK0RznVJs8ZYRSfqApwovt6dMu0YTxbw5gHN7z1aCzlc
   ISMhK5UPqeqsul5t2oubDpggE12DukXes+fJ7IhfiMpPVgiNXs4GNBf4R
   Zm0KRroStcZY7ZNr1CNUPUtXmFP2foj/aPZDsEb4GGeD3KsQcToQR7mvn
   zYTMEVqHY9NiRU+VdVFrtDNJNif0+x151iAZougpoAEBNs2yX3CFcPgm4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323588199"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="323588199"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 00:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="856778333"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="856778333"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Mar 2023 00:32:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfbu8-000F5U-0n;
	Fri, 24 Mar 2023 07:32:04 +0000
Date: Fri, 24 Mar 2023 15:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:alexghiti_test 72/78] string.c:(.text+0x1194): multiple
 definition of `memset'; mm/kasan/shadow.o:shadow.c:(.text+0x8e): first
 defined here
Message-ID: <202303241547.KUVsh7QP-lkp@intel.com>
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
commit: fa2bd47c3903dd647e86e017cab6f7b3915538ed [72/78] riscv: optimized memset
config: riscv-randconfig-r042-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241547.KUVsh7QP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/fa2bd47c3903dd647e86e017cab6f7b3915538ed
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel alexghiti_test
        git checkout fa2bd47c3903dd647e86e017cab6f7b3915538ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241547.KUVsh7QP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/intrinsics.c:18:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
      18 | void *memcpy(void *dst, const void *src, size_t len)
         |       ^~~~~~
>> drivers/firmware/efi/libstub/intrinsics.c:26:7: warning: no previous prototype for 'memset' [-Wmissing-prototypes]
      26 | void *memset(void *dst, int c, size_t len)
         |       ^~~~~~
--
   riscv64-linux-ld: lib/string.o: in function `memset':
>> string.c:(.text+0x1194): multiple definition of `memset'; mm/kasan/shadow.o:shadow.c:(.text+0x8e): first defined here
   riscv64-linux-ld: lib/string.o: in function `memcpy':
   string.c:(.text+0x1352): multiple definition of `memcpy'; mm/kasan/shadow.o:shadow.c:(.text+0x10e): first defined here
--
>> mm/kasan/shadow.c:51:7: warning: no previous prototype for 'memset' [-Wmissing-prototypes]
      51 | void *memset(void *addr, int c, size_t len)
         |       ^~~~~~
   mm/kasan/shadow.c:72:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
      72 | void *memcpy(void *dest, const void *src, size_t len)
         |       ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
