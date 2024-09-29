Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4782F2F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629423; cv=none; b=cCtZ5Jfra//KyESw9XI3fRLXbsxJX3sOKq9i4wZed+I2/0xNXbGnXMYxHM4xXzZW3w7WbW9nL9z66yZ0OiKAL88FUnQO12rG/GwNZEsTNjvnYbIQiaaG1JXcwYKOnJXJNKhG6E0g9lCZhlecDgXfTsF7SX1K/ZA8plLMUjv0xAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629423; c=relaxed/simple;
	bh=1mWnzhgiy4FNoCtYsMIET/7V8n3mnM8OfodSFrUDlrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKe9i2LpsfBsQzdoS/QIsy9eGM21JPSTMk8+r//Pdkhq6NRXMr0/RBmQ70NuPb7vuRguzEakrl8OW9afJPJw9BYi7TE9OmoWXIDHXJNaSYINxUtZ0wgRDybz1D5/Di/mwIHzHMzhwyFc0kLCVShQHxDlq0g4yZiRHmzdfe0fEqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UswNCvFW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UswNCvFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727629421; x=1759165421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1mWnzhgiy4FNoCtYsMIET/7V8n3mnM8OfodSFrUDlrQ=;
  b=UswNCvFWBtCU4uQsE89ED2ZxQuUve2oMVAdUkTjcCZev4k3fnqC0zg6m
   1leUPhriA4OU6qFGqCIbpv95yKo5ev09hqn61HH/vk8D8ZAN15w6PCh0T
   88jFxdiOknzL7TjSe6n+1s0m8F/hrxOeNBAB4JYkAGwDu7XNNcjA4RMNF
   XCC+0H/SpeueO668GAEBFw3p5xYl8OwJ/LDu54tH/BsdQCnIzoNfFdQzP
   DKzYmkvVukKqfLKQMVV7QfWTEjXgE4ytPYqLiI/WnkORJ+LWCi6iPIufJ
   6LXLMaBClj/oE5or8UW75v4L7YES1Al/8nQWdep3/5TIiHi+/1kZhcVG4
   g==;
X-CSE-ConnectionGUID: 03x+LWH2S5uhhU7rM7iyjg==
X-CSE-MsgGUID: 4UORrxALQ5a4G21k60rZ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44178706"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44178706"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:03:41 -0700
X-CSE-ConnectionGUID: YvsfX64NQbCAVGSpX/593w==
X-CSE-MsgGUID: nzGvV667T4iXIRPanv/x/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="110545329"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 10:03:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxKb-000OTr-1X;
	Sun, 29 Sep 2024 17:03:37 +0000
Date: Mon, 30 Sep 2024 01:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2639/16788]
 drivers/i2c/busses/i2c-imx.c:156:34: warning: unused variable
 'pinmux_of_match'
Message-ID: <202409300128.T6KsH8mY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f97b8a6eae07fc456fd0b870cdf2974ce94f3729 [2639/16788] i2c: imx: implement bus recovery with gpio for Layerscape
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300128.T6KsH8mY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300128.T6KsH8mY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300128.T6KsH8mY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx.c:1342:7: warning: unused variable 'enable_runtime_pm' [-Wunused-variable]
    1342 |         bool enable_runtime_pm = false;
         |              ^~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx.c:156:34: warning: unused variable 'pinmux_of_match' [-Wunused-const-variable]
     156 | static const struct of_device_id pinmux_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
   2 warnings generated.


vim +/pinmux_of_match +156 drivers/i2c/busses/i2c-imx.c

   155	
 > 156	static const struct of_device_id pinmux_of_match[] = {
   157		{ .compatible = "fsl,ls1012a-i2c", .data = &ls1012a_pinmux_cfg},
   158		{ .compatible = "fsl,ls1043a-i2c", .data = &ls1043a_pinmux_cfg},
   159		{ .compatible = "fsl,ls1046a-i2c", .data = &ls1046a_pinmux_cfg},
   160		{},
   161	};
   162	MODULE_DEVICE_TABLE(of, pinmux_of_match);
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
