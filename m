Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A21435A92
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110094; cv=none; b=h61a+8QKXuPmrGlQ+2RDKym3jOGPDeDV88TYE1Qfww1uhID0StGJ9ROvoYDiyeorJaMV1pN2yAQc3Q/5wYXAsnzhEgsgjPAmpCXjWapRGPcRZ9ZgM3Shq8zMfPwGJ0eDYfhMwbamsjV7/RjAAQ+awEI0OeAmYU7dBieuHZ+LqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110094; c=relaxed/simple;
	bh=jLlCvOmO8v3Zwp8/ZyCOyiVipObabzDfjqvPIrVI2JQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gn7S6+gSJpDQO+4f/NZWyDGywxrdUM4sWu30wPgouz3gowK5PeaVI5NrIh1NB3PBIA9kukRS3DGPO+ZO+WOnW+z2mfEhl/iDcorlVB5byGG6BM6Xc0VhFMM5lwxhSrxGERjIt8irzKdB9yxveYjj75qnOj47i9vRlBUvuVN2nKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQKHSuKB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQKHSuKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784110092; x=1815646092;
  h=date:from:to:cc:subject:message-id;
  bh=jLlCvOmO8v3Zwp8/ZyCOyiVipObabzDfjqvPIrVI2JQ=;
  b=DQKHSuKBCUjm4CjapuPvdYqR1smqfnwgdwHO/E3Vas+plSRw9pNfJnpK
   +FxhHlMaU6mjIqwUzybEVCopYslIZLn0tDskKwhV/w5J3tIF0j7pk/d+E
   cuSz+6eDDmjzdFYfj7ubmo/4MnVXvD0SQckL4NHI4WwUU7NfI0LYUZE+e
   ELtWbPIoDh+hpJsUFOikQCraCaeg5PV4uEH0jjx5KY+n2p8z0X4JLF5Ug
   ZaYGdHDHggeE12LxDtNNeWLuokX1R6d5+TFn7mNMu6PZGRWBDOHFBKbxR
   BU8vha2YwRGTJA6XBItUXnNw5gqJAkdabQzkmnRrp3N46zKz0lD7E8Kjn
   w==;
X-CSE-ConnectionGUID: 5H3CfOgLTaSwZw7P4Y2fcA==
X-CSE-MsgGUID: o0FOBPi+R16OjTLI8FgoHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84595252"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84595252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 03:08:12 -0700
X-CSE-ConnectionGUID: 3mxK8w/XTsGKlBV7xxZagQ==
X-CSE-MsgGUID: Oy8+P9pTR760n41gmx147A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="261042474"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2026 03:08:10 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjwX9-000000004E9-3blj;
	Wed, 15 Jul 2026 10:08:07 +0000
Date: Wed, 15 Jul 2026 12:07:19 +0200
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [agd5f:drm-next 101/155] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not
 described in 'amdgpu_mes_rs64mem_fini'
Message-ID: <202607151254.xzQOxAAw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   7ca36e897bceeedf917bf98f024f5d2c8e87324d
commit: 2b5d2205b66e9a7c7a556959ebc8bb50399d3e2f [101/155] drm/amdgpu: add RS64 local memory context array init/fini
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607151254.xzQOxAAw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151254.xzQOxAAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151254.xzQOxAAw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
