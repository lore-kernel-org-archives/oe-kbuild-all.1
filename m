Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F65FBFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683154906; x=1714690906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJNBagGM/4TXrzCte9vhfzYdhkyv6g52E9ZUfnarbX0=;
  b=Pw0beP6bJHjxyNTRJ/Itn5/tozke+fCmmbpp7Zm5tFuPPEdsXqdmj8ov
   rxvkqHwR5Vzksxyxu0bu3iZO7P9CipLYFB1IsZn+uulAS+vCVI0LTaX2T
   bhYm/w9Qf4KfG3Mdk0nnkD24E1EMsBvk0y8Nqqa87fD6ECLyh2JYmfhgb
   GLEb6H95yXFpvuPLdyYrEf94vudeN5ezM346ctAhffK0DeFPcmkGkdNvw
   rqkfjQBByXiyi9MIVYhGZXJ+pfcUy3I0D+2ZbSWCswAshDaPlHm8G6HEO
   gTyK+r+CJmra2tp6dscR3P5NgX+mSQAoRNX2wedTYjIKMhLKOehthv75p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350868631"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="350868631"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674287046"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="674287046"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2023 16:01:37 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLTc-0002L2-1I;
	Wed, 03 May 2023 23:01:36 +0000
Date: Thu, 4 May 2023 07:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2c 15/15] ld.lld: error: undefined symbol:
 drm_debug_classes
Message-ID: <202305040608.R4hQJgVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2c
head:   9ae65eae7fa1755bde5e601e9771c2bc35a8202d
commit: 9ae65eae7fa1755bde5e601e9771c2bc35a8202d [15/15] drm-drivers: add DRM_CLASSMAP_USE decls to 2nd round of drivers, helpers
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040608.R4hQJgVT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/9ae65eae7fa1755bde5e601e9771c2bc35a8202d
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2c
        git checkout 9ae65eae7fa1755bde5e601e9771c2bc35a8202d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040608.R4hQJgVT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_debug_classes
   >>> referenced by udl_main.c
   >>>               drivers/gpu/drm/udl/udl_main.o:(__UNIQUE_ID_ddebug_class_user262) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
