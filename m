Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF1524E96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685129864; x=1716665864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WX0VBHk9X7s2ExGd9JhpFPzhS7Gk/4jPaxd3Xp/plGc=;
  b=n0BNPbaqv2rmDZJQTB2g7FV28/9lC70gRP3nUeJ3+Y2rF09tRalRiqW9
   yUF4QCN6moU0Jo5ZghRz4hIhDj8D1HrwiZXf+A8rKGML3oZf57itunfhO
   Be/9x76yF+WPSvnudXiV4D5QVJpMDMvfwYWfMaHbFHCtvMhP7QxEFBhrV
   9lfwdpwZP0OY06WJJN316huuiEGkooMmHGsga6H6ghaGdUThNxVjn7gW5
   g1X1cfZRGMcujQ83qZXPw47+u/X43FQjS1DVmonSLh/Xg7EKkVr97ttYP
   5VRp6miEXgFOp9bCGMiEAQ8r4kfdEaDwKPzC1K0UIM4YAluxlNZBMvCdh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333913921"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="333913921"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 12:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="655754356"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="655754356"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 12:37:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2dFu-000JYo-04;
	Fri, 26 May 2023 19:37:42 +0000
Date: Sat, 27 May 2023 03:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/38]
 drivers/gpu/drm/i915/i915_drm_client.h:63:36: error: declaration of 'struct
 drm_printer' will not be visible outside of this function
Message-ID: <202305270324.6CI28kle-lkp@intel.com>
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
config: x86_64-randconfig-x056-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270324.6CI28kle-lkp@intel.com/config)
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
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270324.6CI28kle-lkp@intel.com/

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
