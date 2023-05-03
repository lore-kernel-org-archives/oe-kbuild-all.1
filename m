Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E329A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 23:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683157420; x=1714693420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuIv6aB4icJkjWPOX2n2JQvoJeJWWbmHmLV1AgHmydE=;
  b=eV83ducinbJhPezVjK1hbyKH8mDESyB9RK8jgKEMdKiEVETsuSzDI86X
   RrK7xMA0oi2KQkbqRBq7V/cFtq7eenRXg2EQHAoW3J1qgjNlaapO/i6GZ
   Z8dCpqPSGY8x/nSDfJpcu/m+brgA5OljiPBJcch6rFJCR0sZILuanZ819
   miWTf0lCjbweHQE732NRn7ERohM7NPq1b/ed3I75Y+uzqhNz1lCJ9Jw/2
   JGW0W2/YC/hmfmNvHm10UTdmkKVQzHTSu7ZzMdtRph6I1sMKkuX6zsIGb
   jQTD+4ij0UKBc/dGw9PofXQE1esLIR+DxkknqA79ZpVZ3LeHU8a6xOaIz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350875761"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="350875761"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="840881960"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="840881960"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2023 16:43:38 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puM8H-0002N6-2d;
	Wed, 03 May 2023 23:43:37 +0000
Date: Thu, 4 May 2023 07:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2c 15/15] csky-linux-ld:
 drivers/gpu/drm/udl/udl_main.o:(__dyndbg_class_refs+0x4): undefined
 reference to `drm_debug_classes'
Message-ID: <202305040744.vyub5nW6-lkp@intel.com>
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
config: csky-randconfig-r034-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040744.vyub5nW6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/9ae65eae7fa1755bde5e601e9771c2bc35a8202d
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2c
        git checkout 9ae65eae7fa1755bde5e601e9771c2bc35a8202d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040744.vyub5nW6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> csky-linux-ld: drivers/gpu/drm/udl/udl_main.o:(__dyndbg_class_refs+0x4): undefined reference to `drm_debug_classes'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
