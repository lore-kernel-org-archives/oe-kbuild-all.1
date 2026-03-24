Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871EE345CD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340786; cv=none; b=S2/AJBdZgucJAOOyY/Hw7n629RP/VXbfw0ki5q9BbY8xbGnIFEit6/PDqFSqXm5pZsqSF/bNAX1nwXsw2y/ZI+micDw/+COZzruBDgOGnYLBrzO3kOTyLUcAYC72tzNwKmWuyivS48R7lzpE8wr+sgAeNeR9OMQu9BASeaNLY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340786; c=relaxed/simple;
	bh=w7LRHiBn54qj/fp49W+ZxGSbTrNJr6ocujmhbb7REno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJ7//aPHxJIu/2SPCiZ7U1Nz88Gnsv5d+T2X27LYNAlA+Ox60j46iLYYGkpJkcRu/tZ+JiEBBo6ZtkfVjEowhO2sqMbLMSrVLPDDaouW0nikjY2QONIUIwgThOhQv4zwW3lZxeCyw2OGimXB37UhCkYmKBeUH2NIxTG79ZUJ5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afheaX/v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afheaX/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774340781; x=1805876781;
  h=date:from:to:cc:subject:message-id;
  bh=w7LRHiBn54qj/fp49W+ZxGSbTrNJr6ocujmhbb7REno=;
  b=afheaX/v3xd4S7EocSxh9Cb5OxB0SxFwZqV/S3uVzb4YOTTqt6SHVXGT
   z2PnpfCq1ZAvo2XlL/Xi+X1ocOAZAGrYP1p02seo9HaRzisG4cn3ow1T7
   X988Orz5I2mDS0yWCQ1ueX+jme0hveiTLlhgCmgoijU2iYdzetHZOzX05
   kF5ArrIv/qAmwFYsgiP7Kc2QU1/hKUwn2YVz8m/spFF8g3H/LLBx9Gscw
   2L5HYGVgtH7EA+a7n98pWJTNISc7r8vG1qtnbnbocUVuBBNUA1r3C63iS
   oPoNzZgbSEfrfnzDsOHYwQRsBZK6JHCqeLbJLxg2wkEa0ioCh2wjGN94g
   g==;
X-CSE-ConnectionGUID: G85A+PEwRXeg/U8bco3Qmw==
X-CSE-MsgGUID: WLJAzv4KRQePSMulS3OZoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86046727"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86046727"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:26:19 -0700
X-CSE-ConnectionGUID: JtF/nZ6ISiaZIls5jQVaew==
X-CSE-MsgGUID: QfgNw9hnRx+gixCTn0bNxw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2026 01:26:17 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4x5b-000000006rF-2zx3;
	Tue, 24 Mar 2026 08:26:15 +0000
Date: Tue, 24 Mar 2026 09:26:00 +0100
From: kernel test robot <lkp@intel.com>
To: Dillon Varone <Dillon.Varone@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Chuanyu Tseng <chuanyu.tseng@amd.com>
Subject: [agd5f:drm-next 33/80] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter
 'update_descriptor' not described in 'update_planes_and_stream_state'
Message-ID: <202603240926.bNXq0peG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   470891606c5a97b1d0d937e0aa67a3bed9fcb056
commit: c24bb00cc6cfef4afe71de8b9bb5c809a49888f2 [33/80] drm/amd/display: Refactor DC update checks
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260324/202603240926.bNXq0peG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240926.bNXq0peG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240926.bNXq0peG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter 'update_descriptor' not described in 'update_planes_and_stream_state'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3645 function parameter 'update_descriptor' not described in 'update_planes_and_stream_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
