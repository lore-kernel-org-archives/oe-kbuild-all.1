Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50A384CE2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 00:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176203; cv=none; b=JQ1EtVpsszx9SZj93QEoOcy6H8ABcXBYG999I7Y3mXMBpJi1dj3L41qkyrRck0i2S5+/IkXtTdB40bZoKkulpB2am6QmHmpHP5SohFmSMQDPN1cUqcN3PBM9isiCoTz5MTwuGoUj2jlRrGqWeLnqWwV0tGvUel9beGu+AvAzAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176203; c=relaxed/simple;
	bh=tww5s4BYsyxk3xc/dD/x47R9yHuQWsL42/arwC+jJ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l2pP8WZsc/Xl6bNVwtRv6TrYykyDBeY/8/JyuZHFM73llquHTIa1j4hdwFct/BBP4u2RbGoH6QvYjin29WPV7xo0sjil0DuokOXUZWu6EhweYI81y8IHJ0VhdAZHZ98+2hNAa+RfzmVqAryilfzMP0LRzGlWCif/TUk9B+S3Ebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmqOrDUQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmqOrDUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782176202; x=1813712202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tww5s4BYsyxk3xc/dD/x47R9yHuQWsL42/arwC+jJ6w=;
  b=XmqOrDUQ6Ov+iO7xPd5nvvuXUvfdP1rbdZs0Z2SqI2dTxvo2seolz6+A
   5yCMzTTOohVEBpX5J/BsxhTz5EMSzB8p/cbZgNkU7WX7/gRQ5ZiXpr3vl
   hQm84tCzSz0IAXt8Yo7rP1PuVYLy7AHRP8XoPTfTZwkJN7tQeUVFp8oCx
   E/YRXLSFP/wad0Cl5yd/skEu4mnIA03W2Qqb4wh+qWtMTMzbkhvwehGA9
   TMQKS9djQ24KzKeXoZahfqLn5/BD3mo5j8m8wAS3GJ0XNNnqoXBGl5C+e
   jGXiWUa9iZAD6DeOv933SQZD57DjiYloqAbnEB2h0WvYALR58LT4inbim
   Q==;
X-CSE-ConnectionGUID: +ssRtrTtRoSHtHyw1qS6Fg==
X-CSE-MsgGUID: HUqHjD/nTMqlctL1NrOkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86602522"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="86602522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 17:56:41 -0700
X-CSE-ConnectionGUID: ijdZVJT8QpKrVEVkHZLktA==
X-CSE-MsgGUID: zU0FQWsNR2OmOmPcLgZXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="251305852"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2026 17:56:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbpRH-0000000027J-3R96;
	Tue, 23 Jun 2026 00:56:33 +0000
Date: Tue, 23 Jun 2026 08:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 14104/14955]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/a?=
 =?us-ascii?Q?mdgpu=5Fdm=5Fmst=5Ftypes=5Ftest.c:104:1:?= warning: the frame
 size of 1372 bytes is larger than 1280 bytes
Message-ID: <202606230825.9qMV9L0g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: 1c37d1b6c74116f2e6adcb675426eb36e60ae4d1 [14104/14955] drm/amd/display: Add KUnit tests for amdgpu_dm_mst_types
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230825.9qMV9L0g-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230825.9qMV9L0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230825.9qMV9L0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_low_sink_count':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:104:1: warning: the frame size of 1372 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     104 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_wrong_rev':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:86:1: warning: the frame size of 1372 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      86 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:68:1: warning: the frame size of 1372 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      68 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_rev12':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:50:1: warning: the frame size of 1372 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      50 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_match':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:32:1: warning: the frame size of 1372 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      32 | }
         | ^


vim +104 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c

    87	
    88	/**
    89	 * dm_mst_test_needs_dsc_aux_workaround_low_sink_count - Test workaround skipped for single sink
    90	 * @test: KUnit test context
    91	 *
    92	 * Verify that needs_dsc_aux_workaround() returns false when the sink
    93	 * count is less than 2, even if device ID and DPCD rev match.
    94	 */
    95	static void dm_mst_test_needs_dsc_aux_workaround_low_sink_count(struct kunit *test)
    96	{
    97		struct dc_link link = {0};
    98	
    99		link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
   100		link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
   101		link.dpcd_caps.sink_count.bits.SINK_COUNT = 1;
   102	
   103		KUNIT_EXPECT_FALSE(test, needs_dsc_aux_workaround(&link));
 > 104	}
   105	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
