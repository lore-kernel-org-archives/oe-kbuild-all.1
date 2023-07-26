Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C29456
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690358746; x=1721894746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSCVwk6i4goJSn4y/ORCNVc+mVgdM1eMEqfO6PIsagw=;
  b=k7ujd+5nxupv/i5ZOTpXdosSzx2rD94CB2nzFNhboSZTFFMGnngJLzlu
   eV7W4NDVAha1joMgEighpaY8pro/S5+w/3VZVzACw3pCavVtBrAHiOF0T
   HdAndxCtOXmyPqYzVGcPvkqptOs9KLqfL8eaDjHAYJr+DzoIRPPHU2YkX
   aa5oJuJiZ4faMtuWqv+7idhWMbbo6FebKby3sHLaDFoI1N0ghuILGcOjp
   mZrkHfAN7MArK83QAUIwI0Ixt2+AKhWYuDgBzgCD8okkFA0aIkhU9o9T3
   OVKAL/BZugqvu05Ddk6IhoHZjHHOVXBnUNrbvwaHiONi/Jo18+jrmbJlp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371558434"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371558434"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729749050"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729749050"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 01:05:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOZWi-0000oV-0I;
	Wed, 26 Jul 2023 08:05:44 +0000
Date: Wed, 26 Jul 2023 16:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 200/244]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1936:34: warning:
 variable 'set' set but not used
Message-ID: <202307261657.s3HbE4l2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   d93c12687a7e61eb154b84d965a63d2e1d36f01a
commit: 7bcabb7b2a12683b341f438737af727a763e3d29 [200/244] drm/amd/display: Include surface of unaffected streams
config: microblaze-randconfig-r031-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261657.s3HbE4l2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261657.s3HbE4l2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261657.s3HbE4l2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: In function 'dc_commit_streams':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1936:34: warning: variable 'set' set but not used [-Wunused-but-set-variable]
    1936 |         struct dc_validation_set set[MAX_STREAMS] = {0};
         |                                  ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/set +1936 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  1915	
  1916	/**
  1917	 * dc_commit_streams - Commit current stream state
  1918	 *
  1919	 * @dc: DC object with the commit state to be configured in the hardware
  1920	 * @streams: Array with a list of stream state
  1921	 * @stream_count: Total of streams
  1922	 *
  1923	 * Function responsible for commit streams change to the hardware.
  1924	 *
  1925	 * Return:
  1926	 * Return DC_OK if everything work as expected, otherwise, return a dc_status
  1927	 * code.
  1928	 */
  1929	enum dc_status dc_commit_streams(struct dc *dc,
  1930					 struct dc_stream_state *streams[],
  1931					 uint8_t stream_count)
  1932	{
  1933		int i, j;
  1934		struct dc_state *context;
  1935		enum dc_status res = DC_OK;
> 1936		struct dc_validation_set set[MAX_STREAMS] = {0};
  1937	
  1938		if (!streams_changed(dc, streams, stream_count))
  1939			return res;
  1940	
  1941		DC_LOG_DC("%s: %d streams\n", __func__, stream_count);
  1942	
  1943		for (i = 0; i < stream_count; i++) {
  1944			struct dc_stream_state *stream = streams[i];
  1945			struct dc_stream_status *status = dc_stream_get_status(stream);
  1946	
  1947			dc_stream_log(dc, stream);
  1948	
  1949			set[i].stream = stream;
  1950	
  1951			if (status) {
  1952				set[i].plane_count = status->plane_count;
  1953				for (j = 0; j < status->plane_count; j++)
  1954					set[i].plane_states[j] = status->plane_states[j];
  1955			}
  1956		}
  1957	
  1958		context = dc_create_state(dc);
  1959		if (!context)
  1960			goto context_alloc_fail;
  1961	
  1962		dc_resource_state_copy_construct_current(dc, context);
  1963	
  1964		/*
  1965		 * Previous validation was perfomred with fast_validation = true and
  1966		 * the full DML state required for hardware programming was skipped.
  1967		 *
  1968		 * Re-validate here to calculate these parameters / watermarks.
  1969		 */
  1970		res = dc_validate_global_state(dc, context, false);
  1971		if (res != DC_OK) {
  1972			DC_LOG_ERROR("DC commit global validation failure: %s (%d)",
  1973				     dc_status_to_str(res), res);
  1974			return res;
  1975		}
  1976	
  1977		res = dc_commit_state_no_check(dc, context);
  1978	
  1979	context_alloc_fail:
  1980	
  1981		DC_LOG_DC("%s Finished.\n", __func__);
  1982	
  1983		return (res == DC_OK);
  1984	}
  1985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
