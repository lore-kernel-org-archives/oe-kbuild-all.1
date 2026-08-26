Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2A328B75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761891; cv=none; b=EiYTHgu9u+Kdq5L9ylztmbZqJfGGV+sANOiV/tHyOvQ8ur+XHB10GitoC7d6Zs9Bbxp4AqApC5TGkq1lmTc0L8KJGLB6qXb3g64RnzibBanEChtzZKY7M9b62mxGEulMYKQ6VHgI4IzcnT0X+mfFEamvKKkio73ckrbvprNii/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761891; c=relaxed/simple;
	bh=tHcEFR+Dbz+jzmKN8Wh9p2kF87xxqUHb+rSd4E8lS34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ci0NK9dLBdEroAMa8EkRE99ow00/PyV2m6B0YlIIx8TDcoOwi/ff/69gT5CJRyGOB3gcxW9fzFWgr7DL1QsF0wzu2dJr85A4znYTODlD/360QT90xv+uxmgCO+0gvWbmuD6qc74G5lPH1IDVt46+pz/5IZdPjm2JzQBFots2LAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbipmygB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbipmygB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787761888; x=1819297888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHcEFR+Dbz+jzmKN8Wh9p2kF87xxqUHb+rSd4E8lS34=;
  b=lbipmygBWhlqGXGpTQDhv2d0v8lp1i1AiMvEeivQHR89hPtQ5IQvTeGB
   WT0ZPdpq18Dgg8RyEpP5ecuycktv3au9vgRZIWhqlBVymBUGRZGvFQpZQ
   klDfLxTaPUuTt9XnvF6vo4W3wx9d5us2JSi2nHMX7myGMisnTVL9KxvrL
   9SqaUb70dTVUueNBIk1CQONwyafGlxDuctHFhzAs8QlI3veUiNgMvdVMx
   lGLnxEMEDYhf6x0qFeXXs0Rd9uq/JcM/VQrIdtgXLIVUDtMfA0VBuLiDX
   qO+tTJ4l0/3yWgpbI7tHtdFbdODE46TrpmYo6Fe1y6wW/fNubusCc4TJ4
   w==;
X-CSE-ConnectionGUID: 3S/XdvUJTliGPxdKPwzQTw==
X-CSE-MsgGUID: nrioZwRUQdakeFNe8Z5CFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98584851"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="98584851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:31:28 -0700
X-CSE-ConnectionGUID: plzS9ijQRiu4szpb4e+Gcg==
X-CSE-MsgGUID: 1ZqLLABvSqGHgIql0mXUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="297511762"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2026 09:31:26 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzGX5-000000000Xp-3sTI;
	Wed, 26 Aug 2026 16:31:23 +0000
Date: Wed, 26 Aug 2026 18:31:01 +0200
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 I2C_GPIO when selected by VIDEO_MMP_CAMERA
Message-ID: <202608261841.ctzyeqY5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 1eb07e99ef39808612e12edaac6ef10f27485a27 arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
date:   1 year, 2 months ago
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261841.ctzyeqY5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261841.ctzyeqY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1eb07e99ef39 ("arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261841.ctzyeqY5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
