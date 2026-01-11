Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A522D028A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768167144; cv=none; b=ov0ZmEaUyQn8NH/1JwOLdskf4cxK5+XkhifjOOO8ukOk4a8yJbBj1Imas24xpzQLBtq0PW4Sy/546MCgtvF42scv7I+PtSqDGvJwGeT5soMFZoVnBb659mf0zZ4WrjlJEiERzmM109Ixu8/8vvpc1mWiGO26B6j5jbURd594jdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768167144; c=relaxed/simple;
	bh=1Nk1rOCbYTkMcERaK9hA5ecLevxlzHGu0FanXnLo6Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Th+Ugi/m+o6AIlIza6kKUFFt9YsvAtsu1wYVwb1VTztFm4nThit05WXJzGzRXNR3Zs9bWCwOq6weqLN5EbtKWvwNNoL4K7SVyUzxnKUy9J4ETF46/DeMvOh4/JaQ5308xkmpAqMsWQtAddzm03HF2llv4BE69pMc7vwcePvzxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7/DJbQC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7/DJbQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768167142; x=1799703142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Nk1rOCbYTkMcERaK9hA5ecLevxlzHGu0FanXnLo6Jw=;
  b=j7/DJbQC6a19CBchIatB6gj1DG+uGT22xIz3gUnpwpOet54nQrv52r4p
   k0a/McSc0Ry98bCrioAKKX/kmq5Uane8vWQwZpsNjI615kCw/8RMeuYUr
   rNm6U5r/Ab4vTnovos8vveWiRSCKZ/l12zkIPPNdcg/KQpEYc9WVqC0My
   gFS/AeEwaaXtJukwSEtLxReyDv+O0gVi0oG0ckqsOZZD7TTEQLyT6ETZo
   L6JUi/iQXHgGbE14WgYGWxjae6su6dP9UaWWEoF8kMBKCs7MW8YBTcUB0
   1ZhXg0Ez4d4a7BVZV8WgtPeX/vN8RNgrcuLzT9WJ5oLPFYvnRgN+Y5Rzk
   A==;
X-CSE-ConnectionGUID: m4fFxJwxQO2uxO/N7Rbv+g==
X-CSE-MsgGUID: owwWMrUnQFOLCz/hQDC4qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69435574"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69435574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 13:32:22 -0800
X-CSE-ConnectionGUID: 8cAx/cjoTwGAmwzQCdIpvw==
X-CSE-MsgGUID: 6suiHwoSQlSMXPzUIGBzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204649709"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2026 13:32:19 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf32m-000000000Uf-3gDj;
	Sun, 11 Jan 2026 21:32:16 +0000
Date: Sun, 11 Jan 2026 22:32:12 +0100
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje@dujemihanovic.xyz>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [soc:newsoc/pxa1908 3/5] kismet: WARNING: unmet direct
 dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
Message-ID: <202601112252.ESeFIwHK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git newsoc/pxa1908
head:   f3e7970d0e65d98ce964a997e9e990d802bffdfc
commit: 1eb07e99ef39808612e12edaac6ef10f27485a27 [3/5] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112252.ESeFIwHK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112252.ESeFIwHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112252.ESeFIwHK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
