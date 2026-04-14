Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDF2253EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185703; cv=none; b=Me7hQFCAY6SsiUCK6pvNhNJ++uoFa9B9H9pnOa9r4bByI58wN5wI5f8Dr0PQIgfYKuWlhnTV8UQSwtWDas3XZ9RvM5d0/OaI/GoSKEuQkrlh/VdTOUM/dNoEYZnq5+FVv2ASY8L31bXjItVi0g3kLKjbcA7aALjBDGVAsjF4Kck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185703; c=relaxed/simple;
	bh=NhYBA2TWleqFYRRHPB0OQAi20xM7ZEGOFWPInuetqUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtbh0snAWfNxiBPvaRgUKkE+OERB+rSra9pTiVQG9Np9L5P8emKr/mAhXCYc9g2uzlEqWbvlq9cANYhVkdL/wRnOkOCY6SbhAZL2k+y7+/+gB81C7O1N5aqyaj6msYyqFZCrsNkf1Hl2csx3YvYo5Jq0P7gjhMwWk7jnNGXUZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcGmhh9B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcGmhh9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776185701; x=1807721701;
  h=date:from:to:cc:subject:message-id;
  bh=NhYBA2TWleqFYRRHPB0OQAi20xM7ZEGOFWPInuetqUc=;
  b=XcGmhh9BzcBCy/1N/xSdX7GGRColcrlBlpaBOiAWOtpj4ncTCxmZ5Nkb
   ERm46ZBIvw1kjZ4EfbjyGgqfSx6cVxPJB5m1zeiSgHwSveXrrtcFgde2K
   TY/GzyIkxu5wHwtfiJOAeuecndhOhupR3LPTqPDmgqnuWgcxpY53n1XSI
   PE7aD9TokX1Flcaw7ai6yiYEMT/0EhZ8GaxuOWLRdX8JWNVIZDvC2qAxb
   yijplRRNZlpev7M3umKW6JADbQXevahpjsJWIm4fcc8bLpljuMMv1RsCq
   QfTySIzT+LAymgFwu4bjiWQTbPvR+/9+wobGqoBqXtOaRxf3HKBC5BD8R
   Q==;
X-CSE-ConnectionGUID: CFWSI479QvCBQVS5LU9S+A==
X-CSE-MsgGUID: 1f/ulLOQSLyZIVQ7WaCbUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87455584"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87455584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:55:00 -0700
X-CSE-ConnectionGUID: LrxISpPrQvyqSPf1KN9sdg==
X-CSE-MsgGUID: 6mIUwoUMQB++mKpt3W+U3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="226965162"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Apr 2026 09:55:00 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCh2P-000000001g5-136x;
	Tue, 14 Apr 2026 16:54:57 +0000
Date: Wed, 15 Apr 2026 00:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 18/25]
 devfreq.c:(.text+0x2840): multiple definition of
 `devm_thermal_cooling_device_register';
 drivers/hwmon/hwmon.o:hwmon.c:(.text+0xf00): first defined here
Message-ID: <202604150023.ABgeqQ2r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 10ad4e2ee1d7bd68d2c7c0d50cb052920305f455 [18/25] thermal/core: Register cooling device non-OF drivers
config: csky-defconfig (https://download.01.org/0day-ci/archive/20260415/202604150023.ABgeqQ2r-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150023.ABgeqQ2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150023.ABgeqQ2r-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/devfreq/devfreq.o: in function `devm_thermal_cooling_device_register':
>> devfreq.c:(.text+0x2840): multiple definition of `devm_thermal_cooling_device_register'; drivers/hwmon/hwmon.o:hwmon.c:(.text+0xf00): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
