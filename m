Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA12C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 11:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681386675; x=1712922675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0Gi3S3oEODF1ScjcFmp7DQ2tMugqjY+3dCqqwYbv4o=;
  b=VhUO8D7lwokwDUWO2HXur1ConjgLjdru8zEHsGo0Vm512SVGo3rASnsV
   mROQXV/8/VTQ4vfOXEog/u5Luf32H+jnwqilwP3VXyF8xRQeIOoPZy3He
   2XyAm79l5iYIRU5IDbGWRC/l4GpyeUTnx4+pZn0GpdDleBWHeOUqDPU3p
   XzGmzaysLNFvqpY6kjAdom41wrFEUneZFwztwUjryIMhKTEl4K0qR8Rpp
   2tZndlGohRfiebt6puMHmGeEbReL/QKt4m/MPn3bpRZpZqEawHPaCkAQ4
   Ofw20jUePfiGmVpjBWRJ8htjWGNNp5pUl7b5z4zAL+GSf3bN4bBWGnj4e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324518287"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="324518287"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 04:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813430246"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="813430246"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 04:50:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmvTT-000YeN-0r;
	Thu, 13 Apr 2023 11:50:47 +0000
Date: Thu, 13 Apr 2023 19:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-fixes-6.3 4/4]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: warning:
 'pmfw_decoded_link_width' defined but not used
Message-ID: <202304131907.nyvbGTB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-fixes-6.3
head:   b9a24d8bd51e2db425602fa82d7f4c06aa3db852
commit: b9a24d8bd51e2db425602fa82d7f4c06aa3db852 [4/4] drm/amd/pm: correct the pcie link state check for SMU13
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304131907.nyvbGTB0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-fixes-6.3
        git checkout b9a24d8bd51e2db425602fa82d7f4c06aa3db852
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131907.nyvbGTB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:36:
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: warning: 'pmfw_decoded_link_width' defined but not used [-Wunused-const-variable=]
      65 | static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:64:18: warning: 'pmfw_decoded_link_speed' defined but not used [-Wunused-const-variable=]
      64 | static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0.c:31:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pmfw_decoded_link_width +65 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h

    63	
  > 64	static const int pmfw_decoded_link_speed[5] = {1, 2, 3, 4, 5};
  > 65	static const int pmfw_decoded_link_width[7] = {0, 1, 2, 4, 8, 12, 16};
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
