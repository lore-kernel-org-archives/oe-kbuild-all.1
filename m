Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213AB23AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679477133; x=1711013133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsjLxafMq8RbvAXkh5Bo1hfZxQZl/Bx/n7Lv+F9o8gs=;
  b=M42U8qN8mOCP47u6PvW92kU91pBCCiIevjos0Q+OTj0ohExjmCsMCCzL
   nNFocIzV0hZyszf8LGhdo44Kx6ordjjhXu1WxX566Nm0VXW5FXYh9GKO4
   T8LTa0iXnEsoSD5hA/wH/Jm8aWzi9UAYzpJIWxmS5gTydvp12fKWvQlXq
   rDHtt6ni3eguoxouwd79QUoT+2Uc+36u/O9fIxUocjA441fPg98TJFH8m
   IkTbspUCLOaNSR36yi9GV1pcUcEVHJGVNDi19jS+o91lkjJV9t5lzrCXn
   c265vwWC6Xrq3WJM7UYJydvbPvg5h/EAX+xxif8723pFE+aQ9t1oxAkYl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366905667"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="366905667"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 02:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825318744"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="825318744"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2023 02:25:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peuio-000D80-1y;
	Wed, 22 Mar 2023 09:25:30 +0000
Date: Wed, 22 Mar 2023 17:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mustapha Ghaddar <mghaddar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Kshitij Bhardwaj <kshitij.bhardwaj1@amd.com>
Subject: [agd5f:drm-next 44/55]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13:
 warning: variable 'bw_needed' set but not used
Message-ID: <202303221749.kriRAgK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   5ee33d905f89c18d4b33da6e5eefdae6060502df
commit: a8b537605e22bfe277e666727fa0e9e01f2c729b [44/55] drm/amd/display: Add function pointer for validate bw usb4
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221749.kriRAgK6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout a8b537605e22bfe277e666727fa0e9e01f2c729b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221749.kriRAgK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c: In function 'link_validate_dpia_bandwidth':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:352:25: warning: variable 'link' set but not used [-Wunused-but-set-variable]
     352 |         struct dc_link *link[MAX_DPIA_NUM];
         |                         ^~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13: warning: variable 'bw_needed' set but not used [-Wunused-but-set-variable]
     351 |         int bw_needed[MAX_DPIA_NUM];
         |             ^~~~~~~~~


vim +/bw_needed +351 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c

   347	
   348	bool link_validate_dpia_bandwidth(const struct dc_stream_state *stream, const unsigned int num_streams)
   349	{
   350		bool ret = true;
 > 351		int bw_needed[MAX_DPIA_NUM];
 > 352		struct dc_link *link[MAX_DPIA_NUM];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
