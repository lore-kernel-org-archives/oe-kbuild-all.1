Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A8191F98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256591; cv=none; b=DXHltzfjuuZ3/shvkxrzZuyuVRvG5WaQga2OrzqvAYh5n2mnqfO7qWWfQjITCOOv4XcXIruVXRiTGrEvuG3eSdfVgMqSS6zmnaguQRRLT70cTnAjjFrysldc0XTNtt6xCRbIM1Q7/CTBF4jr+g88YrlXg8brgGzl4WCICSAQO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256591; c=relaxed/simple;
	bh=CYN1if0GaP1kNHFEnXbAW/uFlxJgowbTJ5/1yScUfro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6vnSWNZ4icvJ1SC5tArL4WJBm6FKZ4mUFqim7DI90fsqPP1XR9yFVKQeJK23gk5M7RNU+AKgZCVQshFiqNIoQBgDrTiY9RZaDp19kEEecPSyDOEf3/y/ZRz/2OOBLHIY43lrtIljMufX1NUwlpFuvFR7tUjDC90LbRhtgunLQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axV3KlUA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axV3KlUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766256590; x=1797792590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CYN1if0GaP1kNHFEnXbAW/uFlxJgowbTJ5/1yScUfro=;
  b=axV3KlUALu98y09Fpov7ZwMr2CMwWHmVrOX4rqTEHtRTE8Aw7hYhuvHF
   ShMtHlN2rj1qvcJfH4A3M1NAKRdYNqLRCRbq1feg1Uq0Ds7u4Qv1k1vNC
   bKD3K/5RSrsFItRmQteIovR8HPW6qYXHnnbJRGPWLL2r+VkFXAD+JlAXf
   ZOFoXprOgGpLAyN7mAR7/bZkJIDk7H2Q9YNBHHAfbcjS6SqaJfkbQ4v3W
   nD8+a9OWlL5V8wRJwQuEUuxdIlhA5J8c/0vSEnmO/xI4e8NWPCwuh8Cax
   bG/8FOALgFvD2p7gyx8gbHrWy965HhlVmbmd5ENydgh0r0vQU75sB0p7+
   A==;
X-CSE-ConnectionGUID: xqlyP2vUSl6Rce4K695gLA==
X-CSE-MsgGUID: 99qNn85qSlaSiMd2xKNBmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68118885"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68118885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:49:47 -0800
X-CSE-ConnectionGUID: 3WXwlvbHQBaYYrBZnHZrbg==
X-CSE-MsgGUID: WTw2SW4zRGiUIRDWyWTzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204209104"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 10:49:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX21P-000000004kK-2KDF;
	Sat, 20 Dec 2025 18:49:43 +0000
Date: Sat, 20 Dec 2025 19:49:22 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for HALTPOLL_CPUIDLE when selected by ARM64
Message-ID: <202512201952.4oTfj5wS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 6df2e969a6de3481167ace4fe42f69812a6c7fc8 [1/1] arm64: add config for cpuidle-haltpoll
config: arm64-kismet-CONFIG_HALTPOLL_CPUIDLE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201952.4oTfj5wS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201952.4oTfj5wS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201952.4oTfj5wS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
