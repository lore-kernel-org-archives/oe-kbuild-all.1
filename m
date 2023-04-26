Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8EC15A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 03:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682480069; x=1714016069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HZQeyxn6Aj3faKRAwzwRfA+hrkNi21lkiC1kh2qI8LA=;
  b=aE0B0710h1TWzhhMEDi7EBTAbK+ZaMa3NlLAS+q3SV2t5CHP4tJ6Rz6y
   JAi1VnqTho3nxBZwzL3V1+IoErgxJ/reEqWETmnTECrEPcBROf1JOhtWx
   mMV86viHXuegNbpHnDGEBSI5/1hvLO3q73u7ZbetNF6BlRYFxkfJ5Nbkw
   KzqhwcHKpWaXyXvdThPvelu+X3hPVemnAjD8F2WOJM2nuSaGoNwlX0/fQ
   Xw1oBpPtF6LliweBSkkYdIJC8fRtNcusus8lLb72Lla+RGZErwzkccdj9
   n4eWZLLZfxvHwU/KP9Mm7Pzn+it7jPJaaFfyIGkrQhAyjFCNUkp/grkeQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="374929135"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="374929135"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 20:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="940029961"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="940029961"
Received: from lkp-server01.sh.intel.com (HELO 98ee5a99fc83) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2023 20:34:28 -0700
Received: from kbuild by 98ee5a99fc83 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prVvH-00003W-1I;
	Wed, 26 Apr 2023 03:34:27 +0000
Date: Wed, 26 Apr 2023 11:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 7/7] ld.lld: error: call to __compiletime_assert_175
 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_memcmp(caten,
 "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
Message-ID: <202304261122.cXCVZ13i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   2814303c36499a05ada68ee784300e3bec5b6cb0
commit: 2814303c36499a05ada68ee784300e3bec5b6cb0 [7/7] drop-DD-CORE-dep
config: i386-randconfig-a004-20230424 (https://download.01.org/0day-ci/archive/20230426/202304261122.cXCVZ13i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/2814303c36499a05ada68ee784300e3bec5b6cb0
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout 2814303c36499a05ada68ee784300e3bec5b6cb0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304261122.cXCVZ13i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_175 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
>> ld.lld: error: call to __compiletime_assert_176 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
>> ld.lld: error: call to __compiletime_assert_177 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
>> ld.lld: error: call to __compiletime_assert_178 marked "dontcall-error": BUILD_BUG_ON failed: __builtin_memcmp(debug_cats_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
