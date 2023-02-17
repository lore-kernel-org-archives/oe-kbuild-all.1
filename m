Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B93D65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676637241; x=1708173241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H0b2P+g2p7eQcUWat7FKDB5fdJZCOAHNxLkMvE3IYYo=;
  b=e8cE7Vu7e90QjjVqWUetwNwfeJkMGjNchcRTI5VwRAewnw9blm0KugS7
   I01BJPfuqeD4Af819xe1mmX/5MqxnBRmPqJ/4/OIDYc00+rXzOdu1joK3
   syHUjR1ZmLgYysCaoKzwsEX6zO9vZ73ABbjwH+/bOYkXn8E+2Ko2BiuTG
   VZLjHGnrwAnmTrGExxaSWpGHG+0tfLtOF4/ccUPKK3nl4L02ohsRPSXH3
   4gKSa8keveDR/4l7VFkZms7mhBMdUFwJHU6MqZkKGJYj1WdVKH5Re4fJR
   i54mZ/avh1oax02FLD78oD0yvDGfnQirJST4PBT63XGFoZiqFNfspwBx+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="312342579"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="312342579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 04:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844563675"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="844563675"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Feb 2023 04:33:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSzvL-000BRx-1F;
	Fri, 17 Feb 2023 12:33:11 +0000
Date: Fri, 17 Feb 2023 20:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/radeon: Use the drm suballocation manager
 implementation.
Message-ID: <202302172029.mDYHJIqD-lkp@intel.com>
References: <20230216144847.216259-4-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216144847.216259-4-thomas.hellstrom@linux.intel.com>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc8 next-20230217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Introduce-a-generic-suballocation-manager/20230216-225152
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230216144847.216259-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/radeon: Use the drm suballocation manager implementation.
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230217/202302172029.mDYHJIqD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ccbca3b1e02d931c5540d8f3dbb2985fd4663075
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Introduce-a-generic-suballocation-manager/20230216-225152
        git checkout ccbca3b1e02d931c5540d8f3dbb2985fd4663075
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172029.mDYHJIqD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "drm_suballoc_new" [drivers/gpu/drm/radeon/radeon.ko] undefined!
>> ERROR: modpost: "drm_suballoc_dump_debug_info" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: modpost: "drm_suballoc_free" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: modpost: "drm_suballoc_manager_init" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: modpost: "drm_suballoc_manager_fini" [drivers/gpu/drm/radeon/radeon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
