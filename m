Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681719915
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686075126; x=1717611126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9CaTnfw0WJOHb9UEwuM6KQevoGtVfxqQSRnQlV03Af8=;
  b=Le44P0CSR5WnCMOeLBM7YWDRalPtDElPc/kxnhTt+G0VlBQVKPWrmpll
   aEorfKrTAvgEhtsXVw7PR8jFk9VZeDza965SNFeG4gI+vSTlo1PEBTtDj
   FJDhwj2mJhwUW5vataqyfB1yR4Z8ooePK8ZficYVifq/c8hJ/ThLTIu20
   D26dcq6RgIGBi7wIJMiI7yWWhYtGbp1hr6/3zvQ9frpwWBYBqDU7LQddN
   8mr0emMFLUz6ukp1n8UldKEcowp3RKxqDKfNhhNlCBYLZgC0+9FTnj3lk
   ablkKOUUAHeICC0tiuP4WvbIiC6Y+SecAUtnsjRXyH6Q+Uj0xPNTnP0DI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420310050"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="420310050"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 11:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883444182"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="883444182"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 11:12:04 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6bA4-0005ak-0y;
	Tue, 06 Jun 2023 18:12:04 +0000
Date: Wed, 7 Jun 2023 02:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2g 19/19] lib/dynamic_debug.c:652:5: warning:
 'DYNAMIC_DEBUG_PARAM_NAMED' is not defined, evaluates to 0
Message-ID: <202306070239.ggnKK817-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2g
head:   b62ec5dc6d7e387a425f8dba4c4cbf91ae0ccf1e
commit: b62ec5dc6d7e387a425f8dba4c4cbf91ae0ccf1e [19/19] dyndbg: quick hack to test removing NAMES
config: x86_64-randconfig-x051-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070239.ggnKK817-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/b62ec5dc6d7e387a425f8dba4c4cbf91ae0ccf1e
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2g
        git checkout b62ec5dc6d7e387a425f8dba4c4cbf91ae0ccf1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070239.ggnKK817-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:652:5: warning: 'DYNAMIC_DEBUG_PARAM_NAMED' is not defined, evaluates to 0 [-Wundef]
   #if DYNAMIC_DEBUG_PARAM_NAMED  /* disable NAMES type params */
       ^
   1 warning generated.


vim +/DYNAMIC_DEBUG_PARAM_NAMED +652 lib/dynamic_debug.c

   651	
 > 652	#if DYNAMIC_DEBUG_PARAM_NAMED  /* disable NAMES type params */
   653	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
