Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890933DE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678272225; x=1709808225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x56ayw7Onk5Nuc6LlgkeW3fcHILbQQ5klXtluGFTJqE=;
  b=V95vi4VlOauJejNbVHPqd2yM+CkUM+LL7BQtq0xfeybe8QwwnyvPUdzB
   MT7iy07FS2mFFHgI9Z0jSAnWSRaXI2TchnIW7m+A7/6wqE1xosXxFopmW
   CgxEWpj8fGlGF3CIzKh8nz+X+QR/T7r61pA1nOSQwYImXz8DxljnQYkW2
   HwPGcFkih6nl9GU9xLOr9CHZyL+OIxalyWd4akwSzxcEE1qLEAv/1pp21
   ZpyYh0pL4j8u9KWpCQw7UKYJ3S8C4Q/IE3UY2NcbLEozh1grBjjqDpH66
   +zdbZB+cs8p6F11pn0aqXDentYMC+Frvz1hFvJbPtv8YEcUP4cF5xW0Mm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337640388"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="337640388"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 02:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676930806"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="676930806"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 02:43:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZrGo-00024b-2f;
	Wed, 08 Mar 2023 10:43:42 +0000
Date: Wed, 8 Mar 2023 18:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjing Liu <wenjing.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 1738/1915]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2182:
 warning: expecting prototype for Check if there is a native DP or passive
 DP(). Prototype was for dp_is_sink_present() instead
Message-ID: <202303081807.lBLWKmpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc31900c948610e7b5c2f15fb7795832c8325327
commit: 202a3816f37e49ab490ff4582f1fb34390e5824e [1738/1915] drm/amd/display: move dc_link functions in protocols folder to dc_link_exports
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303081807.lBLWKmpX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=202a3816f37e49ab490ff4582f1fb34390e5824e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 202a3816f37e49ab490ff4582f1fb34390e5824e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081807.lBLWKmpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2182: warning: Function parameter or member 'link' not described in 'dp_is_sink_present'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2182: warning: expecting prototype for Check if there is a native DP or passive DP(). Prototype was for dp_is_sink_present() instead


vim +2182 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c

54618888d1ea7a Wenjing Liu 2023-01-18  2177  
54618888d1ea7a Wenjing Liu 2023-01-18  2178  /**
202a3816f37e49 Wenjing Liu 2023-02-15  2179   * Check if there is a native DP or passive DP-HDMI dongle connected
54618888d1ea7a Wenjing Liu 2023-01-18  2180   */
202a3816f37e49 Wenjing Liu 2023-02-15  2181  bool dp_is_sink_present(struct dc_link *link)
54618888d1ea7a Wenjing Liu 2023-01-18 @2182  {

:::::: The code at line 2182 was first introduced by commit
:::::: 54618888d1ea7a26f8bccfb89e3c2420350c8047 drm/amd/display: break down dc_link.c

:::::: TO: Wenjing Liu <wenjing.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
