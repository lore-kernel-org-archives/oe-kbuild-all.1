Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9F29115
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685130524; x=1716666524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEwULRGiJiYAhELJVUzvwUYnKhh76IPG5E4ukP+Izq4=;
  b=JACu1T/fmCXE30dqJ+ezDkrRk73zgHcH8+lGritDb459XEtTC4r6W5tX
   E0DI8RnC/Um2AhGW4EkQiH+DWaozeXmQwl+qCLO4AmltHhksZGQWOl0Qo
   eokP3Q4W8KMWlhwvuWpsNAmvKFTzZya20W/38HK5iLE2MYSG8J9x8jxBV
   B4cF+6WBkqpWgSnzNJW0M5+fLbJkjMnOvC7j0v5XQj7UZdOHi1z82KqLc
   tMYD+C80oz0xuEL6XHGSQckBlI1bh82iyQFznvmIGfroSgS1sqmTMQEcJ
   BHAaaI108YxrGb6b5A+D5dcnpReEji6r0xRSm4CrnpGhR58XC8o3eFLIh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="417772177"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="417772177"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 12:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="736110723"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="736110723"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 May 2023 12:48:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2dQY-000JZ0-0O;
	Fri, 26 May 2023 19:48:42 +0000
Date: Sat, 27 May 2023 03:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/38]
 drivers/gpu/drm/i915/i915_drm_client.h:63:36: error: declaration of 'struct
 drm_printer' will not be visible outside of this function
Message-ID: <202305270344.yJqVbHX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   402fc24bd722630e2ea3afc14ea503bb16124e8d
commit: 44b5553e4a52067966aacc38b1dfea98320ef4dd [34/38] BACKPORT: FROMLIST: drm/i915: Switch to fdinfo helper
config: x86_64-randconfig-r011-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270344.yJqVbHX2-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 44b5553e4a52067966aacc38b1dfea98320ef4dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270344.yJqVbHX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
>> drivers/gpu/drm/i915/i915_drm_client.h:63:36: error: declaration of 'struct drm_printer' will not be visible outside of this function [-Werror,-Wvisibility]
   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
                                      ^
>> drivers/gpu/drm/i915/i915_drm_client.h:63:59: error: declaration of 'struct drm_file' will not be visible outside of this function [-Werror,-Wvisibility]
   void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
                                                             ^
   2 errors generated.


vim +63 drivers/gpu/drm/i915/i915_drm_client.h

    61	
    62	#ifdef CONFIG_PROC_FS
  > 63	void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
    64	#endif
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
