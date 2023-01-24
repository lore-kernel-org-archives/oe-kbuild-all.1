Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DE10F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674561416; x=1706097416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItDgKsmt1v44xmuw6hS70pLKusuDh3owstq/z0cKAh0=;
  b=OR9P6Mti/F/t0kg9ASHORD25peQ01L4+afA+L1pXJygJrZYZswXF0WIa
   1wweUYVtEC/MU5qTTi4jhsn4ifgvwIwuDTX4jd6g+xkP0NRQXRj5h6Uec
   wkIbnAUABpQkSGFOWbR5zYYFkyLsE56NgbQZTqxdcMRU6xxMs0mTEqP7E
   WTfjbG8yAeExzv10FYOcpGuL/55H9vUEW7JU/9qH7kxpbHHmroLWzNYrR
   fMlFKhzQSjGA651RTqToIbAIIdbJacKdiKdbxZJA8nzCwx9Dv1HUyjBrM
   ryPELcRpohHKbUGFscBd5qIZENJLuZNr773M9nmfvWgxQWf3gBg8gajH/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323972796"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="323972796"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:56:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="612022551"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="612022551"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 03:56:54 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKHv3-0006Q2-2v;
	Tue, 24 Jan 2023 11:56:53 +0000
Date: Tue, 24 Jan 2023 19:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:hf-5k-rc4 18/19] lib/test_dynamic_debug.c:13:11: warning:
 'pr_fmt' macro redefined
Message-ID: <202301241922.MO57B3GN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git hf-5k-rc4
head:   0b3fc8ac339994de91403db75a445b884c8e63dd
commit: 12389eb0d15904d817da779d102c72f2c3944579 [18/19] test-dyndbg: tune sub-module behavior
config: hexagon-randconfig-r021-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241922.MO57B3GN-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/12389eb0d15904d817da779d102c72f2c3944579
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 12389eb0d15904d817da779d102c72f2c3944579
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/test_dynamic_debug.c:13:11: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
     #define pr_fmt(fmt) "test_dd: " fmt
             ^
   include/linux/printk.h:347:9: note: previous definition is here
   #define pr_fmt(fmt) fmt
           ^
   1 warning generated.


vim +/pr_fmt +13 lib/test_dynamic_debug.c

    10	
    11	/* NB: pr_fmt is often redundant with dyndbg's f-flag. this is shorter */
    12	#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
  > 13	  #define pr_fmt(fmt) "test_dd: " fmt
    14	  #define DEBUG	/* enable all prdbgs (plain & class'd) at compiletime */
    15	#else
    16	  #define pr_fmt(fmt) "test_dd_submod: " fmt
    17	#endif
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
