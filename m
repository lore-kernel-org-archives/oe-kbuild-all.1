Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350CD3D86
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690523627; x=1722059627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22hGMbl0VOickEd5otq3w+4Kjk+VT/e93Qr3/fOJGAw=;
  b=EuNh/RSf+a5TupkghJDF1T856D9HcS3UzMBcbg1i3hJ66Ioh16Qjp7Ev
   HLNgdt22RNFOPIO9Pn4QxTp2h0rJD4Qlugu/Kq2R/cx+IIhmuc5zMz4Jz
   XPNpl6MlUj6bZKh5y7XjQuqOTKrcB6QqW/UVY4FOkcNLWaVYeXOPEPxKs
   ft66tfekWxCgeBBCaptKH2oKfcyyXGGLz74iqKNQVfv9MnIO2e/Plyhpa
   0nLP9Gx0gwhCPHdGH4i8LYPazJkIIbRbEIBIymBf71CbX1mVXJQn1uo6u
   8pZCdRa3YKg3puz3yBZ+nsrO2hXSPb5ZVHyb5JlitcC5QGC5pGzoGyL+D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353421541"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="353421541"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 22:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973908884"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="973908884"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2023 22:53:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPGQ4-0002vX-1K;
	Fri, 28 Jul 2023 05:53:44 +0000
Date: Fri, 28 Jul 2023 13:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 215/252]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1936:34: warning:
 variable 'set' set but not used
Message-ID: <202307281331.Slo4ZzKG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   bb81ed2bf5b98264eed9af41e2d7ce77f95b4c62
commit: 6adb5f1cc1c1f8f1ff91955c1e4f27cdab43f6eb [215/252] drm/amd/display: Include surface of unaffected streams
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230728/202307281331.Slo4ZzKG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281331.Slo4ZzKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281331.Slo4ZzKG-lkp@intel.com/

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
