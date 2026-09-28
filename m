Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FB138F62F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636702; cv=none; b=QYSI9Zh7N0dn4j7LfxNiPq3MdhUNW6Vit7bDjXoHpiydyYvWQfN3ubEDX2cd4A4V3xiDQc7AuC0vwM4rnKc9XGy1GNMx8C2c0jIyvwI/RfK6b/o6mBqieyPW/5o8VznvY4u3aV7MpRr4w/PWe38tJOA1zu9bCpG0dmEQ63N6BJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636702; c=relaxed/simple;
	bh=Nx6O632F+8tTDZM3VGIAHG1Vun+LHAEPY6PAz0JdkXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MiKdfCHOTORARuSy7Q1FIW3BNLesngWY1XXqL1Ecz8xNjxQXmuHMtiMk+YZH3Je6RAFJKYcU6uaBxCCbKw3htc2y9kWHTmYXPToZJqU/rLxW5Ca6w5CU6X9UedqP2Qs0C2ITGDgXqiZ4Jrpna72DGcwrBCaJSAuphrLanzvFFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeVKEmiT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeVKEmiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790636701; x=1822172701;
  h=date:from:to:cc:subject:message-id;
  bh=Nx6O632F+8tTDZM3VGIAHG1Vun+LHAEPY6PAz0JdkXI=;
  b=MeVKEmiTC0M4bGMKiuAkpNJV3Hjcoka2miNYfmk0G/8rhJrygddriG/+
   mNF+HfGpE9ZZyi25t6+VJoXNip9FFEcJNjkMOh9EipnIUa4okoabY+wCW
   S/x+6lDGTqm663xqHZLCqk1sa4gcmVVg0vqiAy2U1DElH5PhcxR6XOHMV
   o3Z6jV3QN9EXg4CujfB+4UkRW2wSl/80iRbCqHSVGig8ySNz9O/9QCUBa
   wuPmWs+NhYUizHFBV5QVFky0Os64IzAB2TNmSDirK/DWqsv3zncUrWh5N
   CVutE/X6vRaiLCX4Gl34LLpMWqFI9NRlL5zr+nkCAlfmHRURLVN17z2CU
   Q==;
X-CSE-ConnectionGUID: BXUQYxotSTyK/RhA5VS63w==
X-CSE-MsgGUID: 9/EQyq2sR5m3Cx6ZnDBwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101871924"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101871924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 16:05:00 -0700
X-CSE-ConnectionGUID: nowmDqe2TeuaEGGtcqMCdw==
X-CSE-MsgGUID: N+jbncowSpOn/7qWQQEAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278548750"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2026 16:04:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBKP2-00000000OdM-0mrL;
	Mon, 28 Sep 2026 23:04:56 +0000
Date: Tue, 29 Sep 2026 07:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-unified-interface 3441/3470] Warning:
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:323 function parameter
 'compute_mqd' not described in 'amdgpu_userq_set_compute_mqd'
Message-ID: <202609290636.LczcWMOX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-unified-interface
head:   a0fe30c73b88075faca1735b8a65e045521d4651
commit: 877c47acb7142c37a5d9656bfac52263b9230e8e [3441/3470] drm/amdgpu: add MQD update support for user mode compute queues
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609290636.LczcWMOX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290636.LczcWMOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290636.LczcWMOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:323 function parameter 'compute_mqd' not described in 'amdgpu_userq_set_compute_mqd'
>> Warning: drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:323 function parameter 'compute_mqd' not described in 'amdgpu_userq_set_compute_mqd'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
