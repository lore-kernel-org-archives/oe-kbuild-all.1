Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E6322E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 21:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676843090; x=1708379090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFDDYiKWJpVnKZ4TaY0ZGne5kPd624qgKZU+64yk6mI=;
  b=mEih4/fxOdaVdKDsGRSOg98r89VSxdxlgtPuqB3dWs4WlExu5vO7Cvkx
   70jdH7EPbPev8M+2IbVfKU3hkC0Tqi7WpG3yRUs7VRlyaO0FJACA28vbO
   EztlN8Xh1FDAaPv55Z9iz3vjc+RwVzi05ZxFhgO+gOAfNcgYgFHj6WGQh
   +rqTKGYTiynWJXFzruaYqAtyAJGfNoUawgtvltCib6BkK+ene7pHPeQqj
   MDCm/kubI3Sn/ewERWaJYpfivGvmTw2Gn8oluia/1S3zG1qlowrdeF2Fc
   HZWDQ7ssk7m/MkTL0RfnbVDxhzXWSzAku7y4eUp64bkWqsGIf2VH9lPps
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330954437"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330954437"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 13:44:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="780432404"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="780432404"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2023 13:44:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTrUF-000DSr-2L;
	Sun, 19 Feb 2023 21:44:47 +0000
Date: Mon, 20 Feb 2023 05:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/evdi/evdi_modeset.c:267:44: warning:
 'evdi_cursor_helper_funcs' defined but not used
Message-ID: <202302200557.ERKoUEHD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 3e21cedd503fabd195cf407652bf87fd83e202ac drm/evdi: Add atomic evdi drm module
date:   2 years, 2 months ago
config: x86_64-randconfig-r003-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200557.ERKoUEHD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=3e21cedd503fabd195cf407652bf87fd83e202ac
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 3e21cedd503fabd195cf407652bf87fd83e202ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200557.ERKoUEHD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: include/drm: No such file or directory [-Wmissing-include-dirs]
>> drivers/gpu/drm/evdi/evdi_modeset.c:267:44: warning: 'evdi_cursor_helper_funcs' defined but not used [-Wunused-const-variable=]
     267 | static const struct drm_plane_helper_funcs evdi_cursor_helper_funcs = {
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/evdi_cursor_helper_funcs +267 drivers/gpu/drm/evdi/evdi_modeset.c

   266	
 > 267	static const struct drm_plane_helper_funcs evdi_cursor_helper_funcs = {
   268		.atomic_update = evdi_cursor_atomic_update
   269	};
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
