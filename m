Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA02DEA93
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763967833; cv=none; b=HWUr7Fw3XX72st8S0YbhXfe1z3LYAx4HoT3XMvU+jtq61NsbrEwwtt67eRxVz9zLN8vc+QEoGCn8uacfu4wq6ATI0q7LqGXtUTt4djZdeDxmeBJX5rwOVcbn+7mEHwgF9xLfy3jXCYdmr2DM+l9QDUaGkh69DwJvFyoDzpHjp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763967833; c=relaxed/simple;
	bh=5gTCqjjN0/RXauQACa4zHIlA4zVBI8EYFfO0WVCG7sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQGFHiVC/+DmBR8pSjK+RxNbDQ0ZpSAX1eJECRXEHjJTgcWN37RcKxnFi67YYzZrlZDQolDhqyhpIFXu6i2f2d9tCz3/cfEoeo+fXmcfbPjds7pA071wS/WuuORIb8coSaYYl/y7efV7gjZGRCm1kPjdDkTfxZLSFOHyj4rNOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZzrwCrP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZzrwCrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763967831; x=1795503831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gTCqjjN0/RXauQACa4zHIlA4zVBI8EYFfO0WVCG7sI=;
  b=IZzrwCrPgBBzrK32MLz7kImAWGxnVYiyZj9XwK79I3147sIDJeQARfqe
   cB4Wka2sahqO2yuNF11yXIgn6xBwMy+teXq/KQ7Jwp8aga5f3jnUEYIJA
   jLYZEuXZo1fNWPDbF9ws15aEqNRP9dkA2gqJsmhmHIiDlmUMlMMMCoSJW
   ZiZQf3IET3XebcQppMRqbkaxKYzAS/i7DXHzdRFqqMAl8S2onCmYrbyTq
   nussjT7LYLZdlGb1CbKFVRV2sy3PcorFw9owJ6zf5rj4yt5pFWHXZfpB3
   kYaZxTD0+7sF9n8jKqxeHZhAL1zpO4SEriOaccQ5U18ifHHBVSVS1Dfn3
   A==;
X-CSE-ConnectionGUID: mfK2qh2IRSaenhayJLMV9Q==
X-CSE-MsgGUID: B5TRUYzgRguJ5LY4e7HkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76287238"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76287238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:03:50 -0800
X-CSE-ConnectionGUID: 1S1QmF8YTQ2/OIlFIoZLOw==
X-CSE-MsgGUID: be8GCDJmTfC7ynVMI+OOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192273562"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Nov 2025 23:03:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQbz-000000000Sj-1OP6;
	Mon, 24 Nov 2025 07:03:47 +0000
Date: Mon, 24 Nov 2025 15:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [agd5f:ring_reset_fixes 2077/2375] amdgpu_drv.c:undefined reference
 to `pm_hibernation_mode_is_suspend'
Message-ID: <202511241459.j9usL9t1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ring_reset_fixes
head:   9501906f35e3d0c0c0cd01d497519f77ddb54fd2
commit: 36646c96fac1f138384238f4348fecd2ed702540 [2077/2375] drm/amd: Fix hybrid sleep
config: x86_64-buildonly-randconfig-003-20251123 (https://download.01.org/0day-ci/archive/20251124/202511241459.j9usL9t1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241459.j9usL9t1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241459.j9usL9t1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
>> amdgpu_drv.c:(.text+0x4c3): undefined reference to `pm_hibernation_mode_is_suspend'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
