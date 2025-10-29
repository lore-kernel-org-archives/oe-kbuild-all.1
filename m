Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AC031A062
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774274; cv=none; b=j8KglTkaNc2vHWLjO4xY1TQp1wWaxT+2/veGYI1LLHALWHpH2uvSLKxOLaIAWTGqXs5CJ5AVosihoIdhLJw6iEeEjSbh9zZGKgDsKJaIZuLfHiwFSetoW2wSh4Yy89/GELE/ZJLOK92V3wgt7jUcp6JpB9zcHu4RZVdkmHNR9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774274; c=relaxed/simple;
	bh=gHBy9dgCCPeS0viLnFmL4b/3gW1EDxruRpvpd0MTpn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBbXvt/QUXMtIWXHVBUDdN964+th/yYo5ZxTYsPKlnp6JI6QskysVUfctgm5VJd/64/8lj4U9XluqcTgpT+r1HXgOYRVWnWma5HjSx9kL9euY5DFUTdO5WdRQU4iTqS6DVQMDFfKaknSWP5mGycATo5Yyw6X6BThYclDaiaYkN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afMmFgmV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afMmFgmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761774272; x=1793310272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHBy9dgCCPeS0viLnFmL4b/3gW1EDxruRpvpd0MTpn0=;
  b=afMmFgmVi34XCWU5Sd9G1P4VtUnho1y1BiT0PREPF79UxtcdD0QQttqf
   9JLtH9X91hyoUwpk0ly7ydStaYylwc8tLb2vUjlz/FaL53svuvgyTS/GN
   97o5NWat6OVDYlJLzzDgLOewXoRYotZjxu0DCV/4Mu7hUOasb9US41Gql
   6vwEqNOgaueOFfpXXLzJQXzBnTKbHlhFFVW8H4qT/laldxfXYzgLzpNdC
   M1mTvNXOnmviCcit0mydCfNnm6hnVcwWq31D1dm+gRw2Tq4GfoEED4BTh
   1BrIR1rSFzV/phIy9GjhdCIf6ZURPBhJ2rVHt07M+DMh2ZZIzqsgjyG7D
   Q==;
X-CSE-ConnectionGUID: nJ5Ey8t4RBmpX+JV3z8Aog==
X-CSE-MsgGUID: Zj4RoxUsRjegMwd6U0suWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67559988"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="67559988"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:44:31 -0700
X-CSE-ConnectionGUID: UthyZ4rzQKqKFWa/iOCIHQ==
X-CSE-MsgGUID: LZppSF1wS3uyWUCcuGJH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="185711941"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2025 14:44:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDxz-000LCm-2X;
	Wed, 29 Oct 2025 21:44:27 +0000
Date: Thu, 30 Oct 2025 05:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Wayne Lin <wayne.lin@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:drm-next-6.19 224/235] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function
 parameter 'aconnector' not described in 'amdgpu_dm_connector_poll'
Message-ID: <202510300524.AlbmwY43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.19
head:   1bc9d39275e08853ff15410b4d530b46b546affb
commit: c4f3f114e73c331f02c7188af650901ee3bad2c1 [224/235] drm/amd/display: Poll analog connectors (v3)
config: parisc-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300524.AlbmwY43-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300524.AlbmwY43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300524.AlbmwY43-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'aconnector' not described in 'amdgpu_dm_connector_poll'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7242 function parameter 'force' not described in 'amdgpu_dm_connector_poll'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7299 function parameter 'connector' not described in 'amdgpu_dm_connector_detect'
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7299 function parameter 'force' not described in 'amdgpu_dm_connector_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
