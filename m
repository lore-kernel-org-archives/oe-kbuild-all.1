Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41DF621
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 00:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683334121; x=1714870121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVMNIDIAOb7Hmvxlyv+y3LM8qCHLsFz98yDDdidPhT0=;
  b=Y1oYoR1cJkio5lsgqOyVUgamQfo8WAggNsVmyVqHeZpcaHjt6Qd8rGi2
   1wC1geJFMYbN67zPBwTSv43D/i+w2wiQbjOADPgtewxgFr+diVz4UaQEJ
   oGABKFBSSL8x7EGIRG0vRgxbh/Gzqka1JRUVBQTOQdB+gFjbA7wX3qJma
   lBnvjp7ZnOqZcq0Hs1UZGfw6bSvrzDqTgxHXCRwIqOHqfYbq/a2rJO6s+
   tJ4L6mAvn68DQBaOBQbbtYoMg+UYTrErwAJKwOTgNVCn0Ce/N/uiNVSx1
   0oufygQui+/DZwS4KgTZgk4Yh4Vr6oLmKaFiXxF+jSxE3KzneCGZPCjSH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="329678657"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="329678657"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 17:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697792609"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="697792609"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2023 17:48:32 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv66C-0000zl-0C;
	Sat, 06 May 2023 00:48:32 +0000
Date: Sat, 6 May 2023 08:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2d 13/14] ia64-linux-ld:
 drivers/gpu/drm/udl/udl_main.o:(__dyndbg_class_refs+0x8): undefined
 reference to `drm_debug_classes'
Message-ID: <202305060852.HRu6FB5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2d
head:   ca30e63ab206f07d3f63c1c065d5b68897681e9b
commit: 78923c0683f829ef82642dae89e1e13b727be87e [13/14] drm-drivers: DRM_CLASSMAP_USE in 2nd batch of drivers, helpers
config: ia64-randconfig-r014-20230430 (https://download.01.org/0day-ci/archive/20230506/202305060852.HRu6FB5Z-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/78923c0683f829ef82642dae89e1e13b727be87e
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-fix-2d
        git checkout 78923c0683f829ef82642dae89e1e13b727be87e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060852.HRu6FB5Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ia64-linux-ld: drivers/gpu/drm/udl/udl_main.o:(__dyndbg_class_refs+0x8): undefined reference to `drm_debug_classes'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
