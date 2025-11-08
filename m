Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F28218EB1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 06:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762583242; cv=none; b=I6uoaS4n1IPQ2oMyUE1WEXGnofy2vLX1aA3fK/K/5RGRJRWw/oTH/yLHWIpi+52vD6Rt4pgQxldqGH520VRoxZWE0T38NdIZlrOpQUdYgAL4CeHszHWPJTjUhA3glHvrdN0ibeDqML6qOhCUTyC/+DH2/iolvqvqzc+/VbDvU2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762583242; c=relaxed/simple;
	bh=FlfLRfXX5NdIu0grEpuFokqkMKO72Aubip7D5joIzwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldciC5iA5pxLEkfwV+pnmX+G74tTgoVo71ElbCP2StxrJwkymONHdAN5+Qy5u0+ajULZfFwXZn4aie2y4I9wdu3ljr86hFyz0GBPRezaaA9iio4AZSEieeLZtK9/qVh52bzUkE91446aryzLHkj7zI/aAXfDb7E28KCuyL9WkIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4fbnHKa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4fbnHKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762583241; x=1794119241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlfLRfXX5NdIu0grEpuFokqkMKO72Aubip7D5joIzwY=;
  b=O4fbnHKavGbtE2HFgybLAgrGpcEYFpXLlgQm3CR85/Ho3q94kGdWU1oB
   wVCDEAO5u9DxWonCh1PZfTz51qgzzUAJdGg9k/NSvXQrxD3QFQ2A1fG7w
   bAgkGyRIA5DvYy9FiuKxzIpPWKTwHfxa7+k28humeWe3la6SaZIGXeuhO
   0BOimwMbBMMvLUvM3k6/BL/EbmddK3nDnZBgoNWcfCTh2crJfIiXmg9q6
   Ip1vriSSHNOyuvb1W8EcJIQJq8RO5cZlt2VSUfvoLYDo+fpvyjAOZkcH9
   24J1+GqMw2E76dxC83hEk84Pc/LqD/YnON4CscPt5zEK4CgLUqn94WNFh
   Q==;
X-CSE-ConnectionGUID: h14sDseGTa2y7bvKqO4TSA==
X-CSE-MsgGUID: Sf+Mym1SR3yGINYOkx8G1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64607070"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64607070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 22:27:21 -0800
X-CSE-ConnectionGUID: bT+XQVDvQ9i01nACiulbgw==
X-CSE-MsgGUID: 2va1rWUAReyMSOBpPQxL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="187482691"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2025 22:27:19 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHcPs-0000nj-2i;
	Sat, 08 Nov 2025 06:27:16 +0000
Date: Sat, 8 Nov 2025 14:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 3985/7207]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202511081437.F40ZP6w4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Timur,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: deb072d241c906ae378bc88ff91dfcdc34ebe71a [3985/7207] drm/amd/display: Implement DCE analog stream encoders
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511081437.F40ZP6w4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081437.F40ZP6w4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081437.F40ZP6w4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1571 | static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {0};
         |                                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c:1571:69: note: (near initialization for 'dce110_an_str_enc_funcs')
   cc1: some warnings being treated as errors


vim +1571 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_stream_encoder.c

  1570	
> 1571	static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {0};
  1572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
