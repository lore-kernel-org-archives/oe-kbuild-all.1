Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0215A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681866063; x=1713402063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qT+lR+oLG28CC+pdEFGdL30qXzGk4N0j5yzlBtxvJDc=;
  b=d0Zkx4P+o07rHmgqydIK0nnTwq56mOgLJ+b1zbmHIIf6YlLkGg+LmxX6
   pmmI3CHxdImymkEVaFXVPDcYTBBM3uXREBcQlM0JLUV5T/VRY9ywKqnQz
   Mo+lQYW79OeTc733r7hogXx3R0RSJSoxKT+e+xm2BMVVGJ1VAiHN9OmJ3
   dT0ID/Q/kOgBctBunUiByRT/6i47UxqKkg7vTiGBo2nosdzKIBzFYFpkn
   rrExWNBai/NTeyVVPjz67x1qHcScgtbYdiEWviasgxHGbpIymLBMLx4hO
   uLBBtedo/7e5sr7cafi28XQuRCFMXH92jqz0rxBKjKlnKOYXgNdhKbGZ+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="373199712"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="373199712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 18:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723873716"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="723873716"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Apr 2023 18:00:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1powBI-000eJL-0k;
	Wed, 19 Apr 2023 01:00:20 +0000
Date: Wed, 19 Apr 2023 09:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Yang <Eric.Yang2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:drm-next 43/67]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26: warning:
 variable 'dmub' set but not used
Message-ID: <202304190833.kEkepQra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   86b20703e4c5a3c39891def0a68e7438aeca9db9
commit: 499e4b1c722e0e2ca40c56342b766e95f6c31f4a [43/67] drm/amd/display: add mechanism to skip DCN init
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304190833.kEkepQra-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 499e4b1c722e0e2ca40c56342b766e95f6c31f4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/amd/display/dc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190833.kEkepQra-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c: In function 'dc_dmub_srv_optimized_init_done':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26: warning: variable 'dmub' set but not used [-Wunused-but-set-variable]
     184 |         struct dmub_srv *dmub;
         |                          ^~~~


vim +/dmub +184 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c

   181	
   182	bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
   183	{
 > 184		struct dmub_srv *dmub;
   185		union dmub_fw_boot_status status;
   186	
   187		if (!dc_dmub_srv || !dc_dmub_srv->dmub)
   188			return false;
   189	
   190		dmub = dc_dmub_srv->dmub;
   191	
   192		return status.bits.optimized_init_done;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
