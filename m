Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F620BE66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686609921; x=1718145921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K03diEb+yWT+bGLJNGONRHLvUfziK9mXPR46UkF4qmo=;
  b=UsbAtjNHHwz9E5+aE4Q/CvE0Zjg40sDMcCF4X/NYQaI8JXNI5A3cj22g
   3mdIMBYiP+FfHSioW9AR/syU+2oSUZbKagwU32h1cHvra8JntUqsEgdqI
   QVZvwqWTytjqzzq7FQF9dna2mYycwUbhxgDnMWmvwRAmWiGm6dQAArscs
   /9nQ++4Y+jjsup0Uc/2562LzNKsEMFGtGibtJmC9H3yi3XIv9c0NIJ0e+
   8Y0dq7c3LUUFM4aqVw6QyWEjIICBWtQpJLk7a2Ub4QF1GlgzTrg7MvVqC
   eYEwnTKamFOk1V9ActZlZnJoDWX1asD08H+F4r3bUedEqXHggh+54jb2h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337813400"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="337813400"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="781400418"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="781400418"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2023 15:45:19 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8qHn-0000oG-0Q;
	Mon, 12 Jun 2023 22:45:19 +0000
Date: Tue, 13 Jun 2023 06:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] drm/ttm: Introduce KUnit tests
Message-ID: <202306130639.SThg4StX-lkp@intel.com>
References: <8f9cfbbd05dda1a3e9914285d76c793442b1065e.1686563485.git.karolina.stolarek@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f9cfbbd05dda1a3e9914285d76c793442b1065e.1686563485.git.karolina.stolarek@intel.com>

Hi Karolina,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc6 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_device/20230612-210534
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/8f9cfbbd05dda1a3e9914285d76c793442b1065e.1686563485.git.karolina.stolarek%40intel.com
patch subject: [RFC PATCH 1/3] drm/ttm: Introduce KUnit tests
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230613/202306130639.SThg4StX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch drm-misc drm-misc-next
        git checkout drm-misc/drm-misc-next
        b4 shazam https://lore.kernel.org/r/8f9cfbbd05dda1a3e9914285d76c793442b1065e.1686563485.git.karolina.stolarek@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130639.SThg4StX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.o
>> ERROR: modpost: "ttm_kunit_helper_alloc_device" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
>> ERROR: modpost: "ttm_dev_funcs" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
>> ERROR: modpost: "ttm_test_devices_init" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!
>> ERROR: modpost: "ttm_test_devices_fini" [drivers/gpu/drm/ttm/tests/ttm_device_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
