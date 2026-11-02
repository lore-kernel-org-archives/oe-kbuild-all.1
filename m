Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611595;
	b=k9bc2t3iN1lUnzExZ/69oYOUzgjllp2yi9z8tHLD1baAg/CeTAMDw+BHp7HPMYJ6gvm3
	 ARQhMzUTLtVGHkgAkbAg8D0vPPlvX1LPYiRf/P1ekNCq7qvrieWg8oYDIZo5/0S+sf0p5
	 rEQVJi7F2X0+dGvVC3kmegWw2o6mKWgGQGgQnvuxseH14V28Tc3G1RcQakbZUKahL/g4z
	 UscvVIIkOiDcccbWJRo0hl+U2HS/BrmHM2UFeylCpYGMG+FRCn4etT5FrDp6Zeyx4MZiN
	 G67NSZpP7iVuMxQR6t7RG1JML3eiSdlfj1GXEFDtg0P6C14v89p/LM7A3aA1tV6YmkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611595;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bm/WSKtShP+ocxLjAR1Nj5n9a04rdyUEaxBW9KgKWpw=;
	b=dZ9gp6+i3cqA/Wm1Oq60ybYWeasZ60b5LD7z4L2sYY2oo51C6zh6AMe25QBrOoustvuV
	 itjlBl3dzIu7OPhoMBUNaoBxxdvAU7S8k8uxCIdkh5QqpfPOsQWyemj6r/kd4ODC7yddE
	 KkQkYZU/G1Q/5cRrxGO/wH6nKTBLGU1OPbdlKIVpMVK4GkwsXv7WGZp3GVKqWNNM8/Dvl
	 NSOoYf/ESrfdEruFe8dS6ttYSgsQt2Gq5fETImqfYWI1HNxRF+0+shM5KE9QhH1Lnr4Px
	 KO1OtwSyJdhhbg0GKPR6mH0H/ZdPF4lvd9/ymZCSYoJ5YlSZZj+aWm4qixRNm28h9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aekUzZEr;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE24606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 09:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE24606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aekUzZEr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793611594; x=1825147594;
  h=date:from:to:cc:subject:message-id;
  bh=5ikLfu42tH2RjBwpIy6IB6jFJ6XFXcG+gTMlfvSQlWk=;
  b=aekUzZEr4v1VHL54IttYFVDHxpBQIWWDfwurySt6FxUS0aEFA9GA/Oum
   yMASN+m4261IRyghCQPIx5xZilxvPueF76eU72IaknksTaI2PlqrWb/+B
   rdWsyVMb0O0NIwgDN6VtQy5Ev4S3B5Hkopiwgv0bgjQSm8UUb5+MfSkBn
   RFz5N8dDmwibM2XKH2YVPwWPiwzV4R2d9UJEJ0yqucRBO3orZgjvGTYXe
   OjSGgdx6/TghTHY6fMatVMlpmY+1wGGd+jGayOoLULrjRY3A5sLus2PzL
   FxiQlpzD1j5kf+1fbHZlrYmE6DJ4HdkbQbBK9xS4UUSpRdnkXCu6c/NUh
   g==;
X-CSE-ConnectionGUID: fUCS9Dj6QZ6Vq8oHWDBtFA==
X-CSE-MsgGUID: OeY8eDD9R8yRgFvF57Z1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2311547"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2311547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 01:26:33 -0800
X-CSE-ConnectionGUID: JWaoWkKZQVOiCbH1WaV1xw==
X-CSE-MsgGUID: nkRgCv0aQmmagY7M2iOLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6202925"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2026 01:26:30 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNoJA-000000008RX-3hfO;
	Mon, 02 Nov 2026 09:26:28 +0000
Date: Mon, 02 Nov 2026 10:25:37 +0100
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [superm1:superm1/backlight-property-v10 16/16] ld.lld:
 error: undefined symbol: devm_backlight_device_register
Message-ID: <202611021030.sdgrqZco-lkp@intel.com>
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
commit: badf7e43956b19ce60ad755613daf91db658270d [16/16] drm/solomon: add SSD130x connector luminance support
config: hexagon-randconfig-r2303-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021030.sdgrqZco-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611021030.sdgrqZco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021030.sdgrqZco-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_backlight_device_register
   >>> referenced by ssd130x.c:2315 (drivers/gpu/drm/solomon/ssd130x.c:2315)
   >>>               drivers/gpu/drm/solomon/ssd130x.o:(ssd130x_probe) in archive vmlinux.a
   >>> referenced by ssd130x.c:2315 (drivers/gpu/drm/solomon/ssd130x.c:2315)
   >>>               drivers/gpu/drm/solomon/ssd130x.o:(ssd130x_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
