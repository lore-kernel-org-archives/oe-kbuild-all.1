Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7054522A4FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337099; cv=none; b=Ct2V6ldcXf8OIMo94ndrC1Rz18GDT8pblioQeUc+pIspoHUEvhndVcTXqiIzouLdBvzVhqIm0pyeeOT1Z4VVvF4KbQamjl8rOefSMBGICk2xHaTVfk9SPDPuwRH6NSxwQoFtDggUOC+5R561tzM31PQhW9fIw4BF0LUbTs9JgaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337099; c=relaxed/simple;
	bh=7wvuUlVMYqepj5WZ0wDCrDfUvd733fG4az1iR37BY+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+j1bl3tBntFqIuLWGH3a+sauP70urWfhsVEFFWqX/ZG3fF+o8J7WLpu3J0t+LYNo9Sd0+9C4J0ZrUDxh3h8JgNV5qqsdKt9y8J1I5GT+Rdj2NEwUgNnRYLuR5PmVxGxKL1e+G5AfVsMjl8cJVQynsmCRJ8jpZxP2BL4fuoIZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVyk/bW+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVyk/bW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750337097; x=1781873097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7wvuUlVMYqepj5WZ0wDCrDfUvd733fG4az1iR37BY+E=;
  b=KVyk/bW+9hkOxzB/e+JxZvjSzEAb8PxBjVGex9MZPnhjAFNilFxV5+uF
   ycAAZFWimqjOJzplzWgxNFNMRrL9ekZJZVvV6Fg1x1qTVIC3amxCSphbr
   +1FEmgCPXFaCtucYkD7zeDFefTftA1gdJufwGT1VsThmJoIioKcUavG07
   73OEuwkGb+fTV5oB3jUzJlc7UyPK3p/NGCHbXcGzKjys2pGukajW0Se7u
   A+Ov39UQXv18mMfqXZj5DvuC/smaFEI55Q8ZTaYj4hC8MRxw1aG1Uu0an
   Bki3P2U5bzeVCsP4W2Su5rbYNG+TbugWnycwmRHd6YaNdPgWTRPPI9W69
   w==;
X-CSE-ConnectionGUID: TcyDbNjbSkiefe4XxqaF+g==
X-CSE-MsgGUID: GOHt5rhuTniZR01Awv/xQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70154390"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="70154390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:44:55 -0700
X-CSE-ConnectionGUID: ZNSVtoSnR7SdMgo7c+0Gcw==
X-CSE-MsgGUID: MjwSGRrrR0SDZyiWxnW7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150868273"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2025 05:44:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSEdP-000Kkw-1h;
	Thu, 19 Jun 2025 12:44:51 +0000
Date: Thu, 19 Jun 2025 20:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peichen Huang <PeiChen.Huang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Cruise Hung <cruise.hung@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [agd5f:drm-fixes-6.16 2/20] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396 function parameter
 'link' not described in 'dc_get_host_router_index'
Message-ID: <202506192034.GFOJJ6PH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-fixes-6.16
head:   fe79ef3530d3c681ef2d5644a9d1d1a67b21426a
commit: 3251b69b7efb82eba24c9e168a6142a3078de72f [2/20] drm/amd/display: Add dc cap for dp tunneling
config: csky-randconfig-001-20250619 (https://download.01.org/0day-ci/archive/20250619/202506192034.GFOJJ6PH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506192034.GFOJJ6PH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506192034.GFOJJ6PH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6383 Cannot find identifier on line:
    ***********************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396 function parameter 'link' not described in 'dc_get_host_router_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396 function parameter 'host_router_index' not described in 'dc_get_host_router_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
