Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97227184
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 00:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259751; cv=none; b=UitVTcs2UgbH/5O/hEefMzQcKhK/kXILJK5ccBdWL35xVni5kj53Ir6pBxSZsGA+wRScmH9fZBS88edijayPcMClx4RlgsimYfz1gTtXRtpp06DwqYUxiVIk0j0N3m61347TYoIwZT9wmco0aEL1j8yECUJBsuXV4c3cRWqgShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259751; c=relaxed/simple;
	bh=4aPUGprv82hLnUAjH6wDX3YdT1Naz3phG1S8A7vZoXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rlK1mYAUnheQpa3ejkzEWcY3sGA4u2PVnPs/NRwz7tdy610klGsmeBdIMiwbvTIkgVb7HSmdiS1nebawf1YIwvzNXDvWapw+aAJ6L8f77qMXBmniUphCqQemzknTmBW49cVR5cQmkweQY8Cj5gGcEkc/Ez7KJzd5PvQfCJKBvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHCgYClQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHCgYClQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782259751; x=1813795751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aPUGprv82hLnUAjH6wDX3YdT1Naz3phG1S8A7vZoXU=;
  b=hHCgYClQ9C6nC7KrchEF8Tk61QF2BhsuYL/+CChN1Ibh7fVAvRCIRfBO
   nEuWhvFjIDhUH/LbStUcMhLQ6iERK7LgJj7W5MYzemPbjDl4LJ1OKb6Qy
   g/9LWjHcD3TEKTdXpV7OZN5mGc2hA7VICO4EaNlrE1AgVFA2zhC5rccSG
   QQPa3x9/AtcsmQ0WGjR5g1ids+VDkbXk7UDkmKeSjVCDTCF2XdyLbl8II
   vDIpeTCq2ZcpXcuMdtlP+RMxqdOy3UBN2NIRtgciCTqYaYm24NCiy8tmf
   tXNZow8az2I6gKUx2N4hMVUcH94SfEtvegfYJtL06MRarb+irT25wbymg
   Q==;
X-CSE-ConnectionGUID: 3O0J98e3T8eYa7fBYq6vtA==
X-CSE-MsgGUID: P23QIlb1QqmlD5Vr7UeJtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82121867"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82121867"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 17:09:08 -0700
X-CSE-ConnectionGUID: Dzb0PkmgSGCRLiE7mBhW0Q==
X-CSE-MsgGUID: 5xN0E9t1SkexfXiv10JANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249506288"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 17:09:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcBAt-0000000030Z-1M2A;
	Wed, 24 Jun 2026 00:09:03 +0000
Date: Wed, 24 Jun 2026 08:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>
Subject: [linux-next:master 14092/15099]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/a?=
 =?us-ascii?Q?mdgpu=5Fdm=5Fconnector=5Ftest.c:120:1:?= warning: the frame
 size of 1384 bytes is larger than 1280 bytes
Message-ID: <202606240749.ZFFiISB2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: a895eb57a55f7a8ad42d5bf14165549fb844394d [14092/15099] drm/amd/display: Add KUnit tests for amdgpu_dm_connector
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606240749.ZFFiISB2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240749.ZFFiISB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240749.ZFFiISB2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_default_unknown':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:120:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     120 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_mismatched':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:108:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     108 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_hdmi_dongle':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:96:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      96 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_hdmi_converter':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:84:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      84 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_dvi_dongle':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:72:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      72 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_dvi_converter':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:60:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      60 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_vga':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:48:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      48 | }
         | ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_none':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:36:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
      36 | }
         | ^


vim +120 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c

   109	
   110	/**
   111	 * dm_test_subconnector_type_default_unknown - Test Subconnector type default unknown
   112	 * @test: The KUnit test context
   113	 */
   114	static void dm_test_subconnector_type_default_unknown(struct kunit *test)
   115	{
   116		struct dc_link link = {};
   117	
   118		link.dpcd_caps.dongle_type = (typeof(link.dpcd_caps.dongle_type))0x7f;
   119		KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_Unknown);
 > 120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
