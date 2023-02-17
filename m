Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3953361
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676598778; x=1708134778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RA3zPGa+TYi7FHfRW9D7LNWETtEK0MbCEQxRsDkdvp8=;
  b=aa/4wiQeh8UgF8yB48P681eVCDwDwAig3L6OuPw2XdSDlreiw1WrTwuU
   tsQr1YKgoI+BaCT+12bLRoyEugpMWX90CWhrok1XfmJE+xfUznY5lmFBV
   vFxccVNv1WoQ14PITCB0aYBIs5QIcA07G15ZP1rB3PuDZ0drBqvB73xkj
   ZR/Yjp1fsUm23DOQ0B9G3MLNtkTG3u4qzbgsffmdG4Yqy3hwLSEsto8oV
   ldFt4iNkEnFbt3qpZxLUm2sIfbXq5qyJ+IbiGzCqC5UKOUn2ywFWbI7Wc
   S+OoHhIqX527Siie6asUQgy2LP2T4aBql3UG1d7vgOdo7UOvGwqPE5xZ9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331889078"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331889078"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 17:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844404641"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="844404641"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2023 17:52:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSpvj-000B1x-0X;
	Fri, 17 Feb 2023 01:52:55 +0000
Date: Fri, 17 Feb 2023 09:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/radeon: Use the drm suballocation manager
 implementation.
Message-ID: <202302170904.Qtjoklnc-lkp@intel.com>
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
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc8 next-20230216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-suballoc-Introduce-a-generic-suballocation-manager/20230216-225152
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230216144847.216259-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/radeon: Use the drm suballocation manager implementation.
config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230217/202302170904.Qtjoklnc-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ccbca3b1e02d931c5540d8f3dbb2985fd4663075
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-suballoc-Introduce-a-generic-suballocation-manager/20230216-225152
        git checkout ccbca3b1e02d931c5540d8f3dbb2985fd4663075
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170904.Qtjoklnc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_suballoc_new" [drivers/gpu/drm/radeon/radeon.ko] undefined!
>> ERROR: modpost: "drm_suballoc_free" [drivers/gpu/drm/radeon/radeon.ko] undefined!
>> ERROR: modpost: "drm_suballoc_manager_init" [drivers/gpu/drm/radeon/radeon.ko] undefined!
>> ERROR: modpost: "drm_suballoc_manager_fini" [drivers/gpu/drm/radeon/radeon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
