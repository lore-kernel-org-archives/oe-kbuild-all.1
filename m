Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24C31E82F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185103; cv=none; b=ETLj/lalG/qDFxq1Cb8+aLDq9ib44twwQpEeGcDA34szoH+TJkx8WemdarQABv+lzjekh3biI+SEx3JQO8OQjHFn4xkcCiEyIftkU4DPP2deeSCZq3vJl3dzW9BWe3g79t69FySoNH/8KugBAkAddfp58yLPuLK6pie3e6gC8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185103; c=relaxed/simple;
	bh=3pcwuv9NPNWxThzihBIwRK6tQTWkiIV+R0eM573Mc/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ClY3Uq18l5Oa5+4qkSiHZ9Ouc1my/4E0ztgq2roReKgQcT0aET7ecNIXMFt6+KC9To5dkZ89nxSdvcjQUbzU9hx8Aj9bLgAkMR6tHNrhPnNCzSLtafQcz4VQLV0hQtzK6GLeuIVw6eCRU3qMJH7XutQViJnI0R0Dqetdnrbtx7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGv9bx6G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGv9bx6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776185101; x=1807721101;
  h=date:from:to:cc:subject:message-id;
  bh=3pcwuv9NPNWxThzihBIwRK6tQTWkiIV+R0eM573Mc/g=;
  b=NGv9bx6GelqDG+SlkKQDpc8sI1nVUd5qOfm7Wb1RHUNIVuHbP1LgivOr
   igmg9fU5sFiXWd7PyR+rJ5HIb/QyoRSndVlmwSSy/y0zUjFUYUTP8oETj
   2xPXF0TD4fg3q8zVag/UJa7355yoXzxuOTOHNeE8glDBwxfOvfieDj9xo
   cDQ7itxHDNdTkvg9vk939m6Be0StqVmKyQ5Vkws9k4crmrumCUx1e/oyH
   hsq8YVXUoRHsQkXoeNKGeDlyI+wGojCtHxg7PNJGN3NKJ0ZwE07YqNxZo
   bbWVeSUnwLViqD/gCOl7vP8DIZipXNK0W3jS7jncgyUaAUAt0ArwvCUKf
   g==;
X-CSE-ConnectionGUID: VYXtP+wVTnWJAZmgTRwk/A==
X-CSE-MsgGUID: vJzbqUWFQZSrb1oulsKUUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99793457"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99793457"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:44:59 -0700
X-CSE-ConnectionGUID: NP6uWMadR9yto4OwbP4cbw==
X-CSE-MsgGUID: TbFVHQafSWObPj0nWjmrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="223639854"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2026 09:44:58 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgsi-000000001fL-0fOZ;
	Tue, 14 Apr 2026 16:44:56 +0000
Date: Wed, 15 Apr 2026 00:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 18/25]
 include/linux/thermal.h:324:1: warning: no previous prototype for
 'devm_thermal_cooling_device_register'
Message-ID: <202604150051.NCeIXFbW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 10ad4e2ee1d7bd68d2c7c0d50cb052920305f455 [18/25] thermal/core: Register cooling device non-OF drivers
config: arm64-randconfig-002-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150051.NCeIXFbW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150051.NCeIXFbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150051.NCeIXFbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/acpi/processor.h:11,
                    from drivers/hwtracing/coresight/coresight-platform.c:346:
>> include/linux/thermal.h:324:1: warning: no previous prototype for 'devm_thermal_cooling_device_register' [-Wmissing-prototypes]
     324 | devm_thermal_cooling_device_register(struct device *dev, const char *type,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/devm_thermal_cooling_device_register +324 include/linux/thermal.h

   322	
   323	struct thermal_cooling_device *
 > 324	devm_thermal_cooling_device_register(struct device *dev, const char *type,
   325					     void *devdata, const struct thermal_cooling_device_ops *ops)
   326	{
   327		return ERR_PTR(-ENODEV);
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
