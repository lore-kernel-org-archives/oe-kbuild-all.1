Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13F3BED7F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166588; cv=none; b=hdlhs4rxhKLJYJvjTsneDLBshvKGOkYuTr/y4IyrSwxUszUdXbOlwGAMPIZ4rFGoedBRm/9kYGlnL67EMBP/bHA1RcIiRe1IJdlZf27Ghnc0E7rJbGVOK23lJ+eLcLVsId4Qs2+OBDau8GynUQLnVh9xX50yUxuKliZL9bsw/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166588; c=relaxed/simple;
	bh=sebHdVb/yZUdBTEM6gYJHLlIUzeSL21sM04k6B2OMTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMhlav4EeaClvR0vDax98KiudLbCtwRhUxqB5X2YMY1w4wLX3UO6yRJ4K7RvGI5kE9UnHTa+HTmLJfhmmQ5rZZmR+TyLhKdY9pV5UWMFeCGzb39U3TOeAYar1Eupb2IrH+EAXNPdZypkbWsiZGADiKgpmIvK/0/lbnd8a4Y9zBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLvbjhu0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLvbjhu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788166585; x=1819702585;
  h=date:from:to:cc:subject:message-id;
  bh=sebHdVb/yZUdBTEM6gYJHLlIUzeSL21sM04k6B2OMTY=;
  b=LLvbjhu0/CkOV3P76WmEjnx8A6saEaewO7owRwWq/AEPu7tYkH//x8WX
   prgaIl3aV0dtHRGKIva7xcSHa5wLQr+/YgSNYchug+Jlv7VBbol8dyRru
   Xjccw7yHI2mGmFMQW4U0GuZhaseziCznQ1qqskwiQpSxP5H4BvQ3LPkBY
   /J5AZAsFJdfY2njmvkQV5lOp5eFHrdjiuwN9FqtRwR4SzaBbqIxRQhR2p
   l1eXp0BduqJ0BmeyUTE7E/3bv1wc+xEmxPlgqBqG7XYp9Xb2R5d9Kumyr
   km4zG+YUz0Dolo927k/mEeD5Emb2Cw0Q+Iefas78mul6DRqzA4tpUoED3
   g==;
X-CSE-ConnectionGUID: ZonTpAixQk6nvYxd85frJw==
X-CSE-MsgGUID: z8uWE8QwSqC2HmSXYtHOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87515912"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="87515912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:56:24 -0700
X-CSE-ConnectionGUID: +N2j92DsQ1uRlcysIS+WgQ==
X-CSE-MsgGUID: co0IPyPPRHKUQe0ekUjjhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272537002"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Aug 2026 01:56:23 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0xoT-000000000Et-1gzW;
	Mon, 31 Aug 2026 08:56:21 +0000
Date: Mon, 31 Aug 2026 16:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 27/29] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2391 function parameter 'soft_evicted'
 not described in 'amdgpu_vm_bo_move'
Message-ID: <202608311642.kTDAWdR2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 0f297bfeedae01c8a0d95ee89de766ad875c3920 [27/29] drm/amdgpu: Add a GEM op to set eviction priority
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260831/202608311642.kTDAWdR2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311642.kTDAWdR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311642.kTDAWdR2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:249 function parameter 'vm_bo' not described in 'amdgpu_vm_bo_needs_eviction'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:249 Excess function parameter 'base' description in 'amdgpu_vm_bo_needs_eviction'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2391 function parameter 'soft_evicted' not described in 'amdgpu_vm_bo_move'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:249 function parameter 'vm_bo' not described in 'amdgpu_vm_bo_needs_eviction'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:249 Excess function parameter 'base' description in 'amdgpu_vm_bo_needs_eviction'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2391 function parameter 'soft_evicted' not described in 'amdgpu_vm_bo_move'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
