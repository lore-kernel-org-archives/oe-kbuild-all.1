Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDD3217
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675541583; x=1707077583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6s290KQi6AfFBSwUaZdI0qIiJaJskv3I/hVmv2wXLs=;
  b=mNlF4kBFFkEWjIwgHmC3RiLLCvxxeKEl6cwhULcPBaTNJUPKCT5WgJzt
   EpwykLcsiOcYlPdWIwx8ilwyHtjALEckKgzSS9esRjVR9i60OdCBM0zFj
   1cJjnijTle12/PmgJPJ6ujLb7ZsABJtP56nhIc63H0xKesNbJKcCcEqAG
   9pfrhlZAp440M/d0iANm84zXFU00e5VYIL97tL/jMFAsJkhRTJzpkoP2o
   7Y2uQbn3hPQXmeO0ZBIZ+HzLQyZv2OFGnn8nUFrR45GpZspoy4X5G0PcX
   1GXpjR2Q5nUNjXo+AwRJP27RYajh50A2JvmdRvrGxivz3RS2coYhJbpjA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393580198"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="393580198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 12:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="696472003"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="696472003"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 12:12:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOOu7-0001W4-0y;
	Sat, 04 Feb 2023 20:12:55 +0000
Date: Sun, 5 Feb 2023 04:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/sh/include/asm/setup.h:5:10: fatal error: uapi/asm/setup.h: No
 such file or directory
Message-ID: <202302050450.UdM5Y90m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230203-160118
head:   25be89d3c286e3bab7eedaa49d83ddab673cfb2b
commit: c6fa6752f4ce7b69ae569eeef3bd6a4d7d7eb9a1 asm-generic: Remove COMMAND_LINE_SIZE from uapi
date:   2 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230205/202302050450.UdM5Y90m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c6fa6752f4ce7b69ae569eeef3bd6a4d7d7eb9a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230203-160118
        git checkout c6fa6752f4ce7b69ae569eeef3bd6a4d7d7eb9a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/of/fdt.c:31:
>> arch/sh/include/asm/setup.h:5:10: fatal error: uapi/asm/setup.h: No such file or directory
       5 | #include <uapi/asm/setup.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +5 arch/sh/include/asm/setup.h

^1da177e4c3f41 include/asm-sh/setup.h      Linus Torvalds 2005-04-16  4  
0a9426df1858f7 arch/sh/include/asm/setup.h David Howells  2012-10-09 @5  #include <uapi/asm/setup.h>
^1da177e4c3f41 include/asm-sh/setup.h      Linus Torvalds 2005-04-16  6  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
