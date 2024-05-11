Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D12C6AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 03:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715398488; cv=none; b=R4924dl9N9UgX95ZSz7Sy6R9k5HUqfu4gsFvQ34oab39A0f6K+wxyEv2MEVJrV41WcPYNP5VZA5BtqT27/1q0TTh1a0k/g0Ban1Q5MNxgiIm1Qlk/Gf7LTbfsSgJ/BPQYqGqoU19iT71XimWSeOFmg/fddHzL8wiND6SspBhMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715398488; c=relaxed/simple;
	bh=gBGm25tgUCT7VmbsTy31/+KZ5QSCnI0T/xb7i7C21KU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bGQcbn/Wiv2U9oorZdNt1YTu2dUlfUvQL1jRrD5irSzBeiwbUUhUGbQIs6bmesypKGbknnr/Sla+4poeGhvKcS6wVl1N1wFEUGaSpJ0Ihek7OOPYYv8VZ/jz+Flu0NAh4cBBbELifu6bHjBXk4oekekPuWjpoUbFQ+rUFkTI2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VafKBjNq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VafKBjNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715398486; x=1746934486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBGm25tgUCT7VmbsTy31/+KZ5QSCnI0T/xb7i7C21KU=;
  b=VafKBjNqyhqG7thTTuGvBtMqa8upYPsGBE9whXe8TkdVYuk6jgqhv7vI
   V7AnkrwwMa8NREL+ZtwsjpCEYcANWGtNdP4pKKg+7KbfdXNv0PbYNjvp9
   gK9fST18bl5x5gJk6/fB8Zz9l+l4t8F56iJxg7Th9DNZRidcgWSTIAwbG
   DillxBmkC4zn3EEKeZV7mgh6bj9AX7BypPheJnIygkNNGc5k91JaaQYbX
   nj9ldnQAv8spwUfTOkFwLAnGcRgyl+01Jz+CGCgiymaiVEmHk0VXJSpsx
   wp8sobIzDr1P7AXh7i30DGVk97Mp2qHHJiwV/PnwD9SHHJtmvZBLDZyIP
   w==;
X-CSE-ConnectionGUID: Pmccof4FQgWue8thrU3d/A==
X-CSE-MsgGUID: 1+mf6sAuRlWS1tfpwvPXpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11266104"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11266104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 20:34:45 -0700
X-CSE-ConnectionGUID: +pHNdeewRiWVr0idaBGKGQ==
X-CSE-MsgGUID: 7jwZSSzOR/aNon2Z6PGBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29922960"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2024 20:34:44 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5dVR-0006sd-1N;
	Sat, 11 May 2024 03:34:41 +0000
Date: Sat, 11 May 2024 11:34:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 3/7]
 drivers/thermal/mediatek/virtual_temp.c:106:30: warning: variable 'tzdev'
 set but not used
Message-ID: <202405111124.gXgwFCai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   be2316332e1aa5884f17dc26e73b61ca3f960d57
commit: 3b0aa3dc4bf66a721b79c7e5879979db3b120925 [3/7] CHROMIUM: thermal: mediatek: Add virtual temp driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405111124.gXgwFCai-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111124.gXgwFCai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111124.gXgwFCai-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/mediatek/virtual_temp.c:106:30: warning: variable 'tzdev' set but not used [-Wunused-but-set-variable]
     106 |         struct thermal_zone_device *tzdev;
         |                                     ^
   1 warning generated.


vim +/tzdev +106 drivers/thermal/mediatek/virtual_temp.c

   102	
   103	static int vtemp_probe(struct platform_device *pdev)
   104	{
   105		struct device *dev = &pdev->dev;
 > 106		struct thermal_zone_device *tzdev;
   107	
   108		tzd_cpu_little1 = thermal_zone_get_zone_by_name("cpu_little1");
   109		tzd_cpu_little2 = thermal_zone_get_zone_by_name("cpu_little2");
   110		tzd_cpu_little3 = thermal_zone_get_zone_by_name("cpu_little3");
   111		tzd_cpu_little4 = thermal_zone_get_zone_by_name("cpu_little4");
   112		tzd_cpu_big0 = thermal_zone_get_zone_by_name("cpu_big0");
   113		tzd_cpu_big1 = thermal_zone_get_zone_by_name("cpu_big1");
   114		tzd_apu = thermal_zone_get_zone_by_name("apu");
   115		tzd_gpu1 = thermal_zone_get_zone_by_name("gpu1");
   116		tzd_gpu2 = thermal_zone_get_zone_by_name("gpu2");
   117		tzd_soc1 = thermal_zone_get_zone_by_name("soc1");
   118		tzd_soc2 = thermal_zone_get_zone_by_name("soc2");
   119		tzd_soc3 = thermal_zone_get_zone_by_name("soc3");
   120		tzd_cam1 = thermal_zone_get_zone_by_name("cam1");
   121		tzd_cam2 = thermal_zone_get_zone_by_name("cam2");
   122	
   123		tzdev = devm_thermal_of_zone_register(dev, 0,
   124				NULL, &vtemp_ops);
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
