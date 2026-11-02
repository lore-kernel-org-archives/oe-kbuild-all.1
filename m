Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609133;
	b=R4xSEmBhNb+wsAE82Hvd+F5K2lqZLjQF0+CrfqOinDwoy80o2SHAafO0sVfShJ8IdHBD
	 E2rHDClqy3u3H1QG7pnPipR/vQSzTYCoa2KMo1CREirItD5A6jZFDgnpf/JO1nvKnrl0x
	 KzuXKoEQY4Qx5A22JJg5EMwrJ9ez4bob+VeqHKz8ONx4CUnW7ntp5Z3hqxK5uKBdFk8BP
	 ZOiiRc9CaZITheBgWCCXgwn7AQyWzcYfTDLJsACWqFCSrQhFYG63stwrcxPZRm7V8r2kx
	 KIAuLiXiw6EgOQgaKzZIbdvkluNvCW3DgpjJwgOKI+C9YMtO4HKTI4PwBU9t+LSsFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609133;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=edYRRv5EVm8oLgFLEjVYX/ecBE460U5g27TDGV9XG7g=;
	b=HUz9hutQ3WQaHNojfsRmMqLJe/sAu3WTszOF/ByEDvj4Fr064qNuRAIZYtxBS1FGHVk5
	 IGQTBDNk4etuwSVO24qSyHGDeRgKwcpmIN7Lo1qvfSlQTJlOaGwjfxdlFISjXJuZfvZaN
	 XVkkdZ4xNfRFqcmilYaWxVB6Ux/Cy0deFQjHH2bwe26LltcFZTdfeAoHMVVNmgEO5/0xl
	 6zHXVq1ubqaQTRlgXjdb6osO7UkDxrh9D8lsEgTrflmKInZp9XJkoIxI/Nun7H8sl/Aq3
	 ldwwcRIIcIPXnDJp/vkH1MMFyjUTu7kXRb31lnOsgg05N5QjYcur/ldev/pU3KZ6Myw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c4UosZah;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FE606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 08:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c4UosZah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793609131; x=1825145131;
  h=date:from:to:cc:subject:message-id;
  bh=4oz7bVvyV/Jiek6f3zJZ3V4L9VWyn/R3na5Wa19auv4=;
  b=c4UosZahV1uE++bN7BJrmfhcPu/TZ+/ucLrZ9J2AC3xE7tfZIlMta2TV
   rsmnDEernn4mgh8NcSHQ7YuBP6mbH7QUIXGbzLdrioF7BwglX2e7eO5HL
   1NezKN0jwPEgNTlXoWKtYgdyE2Gi7yDQ6jASoF8UnnqNQaFhW7QlS7bM1
   MNeL2Qy3gSq5L3OVPTQz90vryrh7f15aeyuIO1QiqL2bSP99KZV3iI2Kv
   wZ6x5L4U1fmdMg919w1w2eIc3n/EMv/L7xHiAgb1KnmIxvnQFECNd7S0J
   PzASvaq7/TZgEn8cPMiTX9vJnqpVb++4RmRSWv8hxK6IUwOmNVe43aPab
   w==;
X-CSE-ConnectionGUID: jUT92inOR92MdhfYB5oPNw==
X-CSE-MsgGUID: 5kvkAuFlS0K0ruhFnL/S9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2318566"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2318566"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 00:45:30 -0800
X-CSE-ConnectionGUID: mXSLSOaHTx+59gEe8qiqKg==
X-CSE-MsgGUID: DhhYJMoLT4K5X89NsFFA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5904253"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 02 Nov 2026 00:45:29 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNnfT-000000008Qd-1umm;
	Mon, 02 Nov 2026 08:45:27 +0000
Date: Mon, 02 Nov 2026 09:44:51 +0100
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/backlight-property-v10 15/16] ERROR:
 modpost: drivers/gpu/drm/bridge/parade-ps8622.ko: symbol
 'backlight_device_unregister' undefined!
Message-ID: <202611020901.fXj30xHH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property-v10
head:   1c0ba049e8d6177bdc78a5c0f53656d747c0eb6a
commit: 1273c1f204b6b345a5a7057279ca03ec17a82b1e [15/16] drm/bridge: add PS8622 connector luminance support
config: csky-randconfig-r2108-20261102 (https://download.01.org/0day-ci/archive/20261102/202611020901.fXj30xHH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020901.fXj30xHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020901.fXj30xHH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/bridge/parade-ps8622.ko: symbol 'backlight_device_unregister' undefined!
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'backlight_device_unregister' undefined!
>> ERROR: modpost: drivers/gpu/drm/amd/amdgpu/amdgpu.ko: symbol 'backlight_device_register' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
