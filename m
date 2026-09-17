Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC0939657A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656640; cv=none; b=HSyJxyZjGZ3G6Mz3zFLbrxs6eKWTCkMSoS2IP69U4Gsfuizvk4o5RC8cU33+pxvdZIdbR92CAd8QtRVpwX6hx1omE4Fq4azw8zd0mdWrnDnvmgyiu+/DyltuT1c3eebIcS6Xddh8K9wO5S4qy7jEEXCF2xOqV+dcqF7WC7diKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656640; c=relaxed/simple;
	bh=JMtlck4CGbddCrIkDvWqPpDAKtepQJnHC1he5O0BAI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cmMINtz0QFiJE839M5FMNACZXx+ybBMHplbxO7l+qaS+0A4BCdQdBbqCvPktnvZRveoyN6cIUk6sXv8Z73g+eSbE40bvRvVnl2Z7tRl3iNZUdo84mCKPVzBN2iV5KCmCfGbPtlorkGi9OLaXjZ7206HPvI9XuUVJYToEm8Agl0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5k85F0e; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5k85F0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789656623; x=1821192623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMtlck4CGbddCrIkDvWqPpDAKtepQJnHC1he5O0BAI4=;
  b=M5k85F0eVdYVo+MBflw6pY4Ozas4r1LyijxJfNmZ+FNusklzqDMsRQfB
   hLxDEPG8xO0mg6tBXMih8ENgA7wX12a5+aLLNlyCY9FAPiZZBXcX8o/V+
   azxNTdnstBWgC/T8Uhz/KYen+YoUg+TQh8Ig8ACCHXgT3+aerB60RTlpA
   NmOSsq6JwYSh8K++1+y8aieEhGUszDbAL1IrbLOsxWWEcxILUC6ZHTuUf
   t95uW4uVtBa4kfsib5A/tHiYe+doYJ9KtPi3yliqdf9tq7skdLrQ4yP41
   G0R1kffUqzu0Xi6MLad481OASOqylnnV0eSqzwhOXdD9B4w2mHJpGht2S
   w==;
X-CSE-ConnectionGUID: Trlc57DvT9qQsQiUNTDZZg==
X-CSE-MsgGUID: B5zSCy9bQoae50r62UN2Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="590667"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="590667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:50:20 -0700
X-CSE-ConnectionGUID: INV44FPhTtOZyh/qUQqABw==
X-CSE-MsgGUID: G4qU81EmSkqDd7osZ3t7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271192274"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 07:50:18 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7DRI-000000000dQ-3NLa;
	Thu, 17 Sep 2026 14:50:16 +0000
Date: Thu, 17 Sep 2026 16:49:57 +0200
From: kernel test robot <lkp@intel.com>
To: "Timur =?utf-8?Q?Krist=C3=B3f"?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 532/7047] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not
 described in 'amdgpu_ttm_map_buffer'
Message-ID: <202609171628.owHko7Uz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0d9d0dbf2fddcff5859d623e90ca73c4054276e1
commit: 48c4aaeef6219f13804b6778b30ac8766cae57b7 [532/7047] drm/amdgpu/ttm: Make buffer copy source readonly
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260917/202609171628.owHko7Uz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171628.owHko7Uz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171628.owHko7Uz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:204 function parameter 'readonly' not described in 'amdgpu_ttm_map_buffer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
