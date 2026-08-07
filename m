Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758638B7B4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119947; cv=none; b=Xxd5hNv+CRIEZbsAWUaJlwOiS5//FboIK/2UNMDBOLSNvbhDJYAY4D+A5Oc33eF9VvnbsX8u9+sDZz6ORjvV1VOnwF/koY7Vr2iSKB7rjmsBgde6BDbuLCXoJMrmvozNO7C0dOoURIsa57dHP/OMNjOD3hwbCj5CQPOeSecyT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119947; c=relaxed/simple;
	bh=g/O5BDI223k5deKY9eXjZTYthJwDKYLckf0FhghOlwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYYsgnx9iNZsCVw4d5iH2dXeIXEy+z46qKtuXQZZ21i9C+I6id203AAT6zIHkCPf8FKJ+0WQ7TUHdUwfzZd7uvE8xPQEp65ib4iRGoriV+Ze5t87ZtQYQGf+EyUXpty2j20PxB/a15LOs54MaQCdTpwGQrl4oHUhP7lpVdtby7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPLZneOU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPLZneOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786119946; x=1817655946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/O5BDI223k5deKY9eXjZTYthJwDKYLckf0FhghOlwk=;
  b=ZPLZneOUD4Vtt6bdl2s6Qx3jYOmgJus1S7GkGZ+8B5OMgaxWvlriXgzu
   jPBA9p9fYFtvoHTWyOkMQEKn9YX5+RE2UgE67QgRsKRJC8j0A4x7EOFmO
   M0/gwB3LA1m1Adj6Tbr7cQ/ZCaG4BctgA+Rgh3N7yUpZkRE2eGOmUNxGY
   OxnLfXLChHgOGlrxnqZy1+4IjHtfTLgcOIlTNIZZ2rhRz+fiqen3TbieM
   nHqJ3e3/9onZvjTC4dbrG2FTnO/BrIto181T0L+//SRFPjfH3NH8NlFSQ
   zuIopf9wY4VyeVqOZcDvVL6JDX12Pei0KPs0RCvB5F7Opy6DChdYl8Ztp
   Q==;
X-CSE-ConnectionGUID: agRF6jLZQCelNrY0lzLXzQ==
X-CSE-MsgGUID: uV1DmfqZQ4iVjdi2389t+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86741964"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86741964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:25:45 -0700
X-CSE-ConnectionGUID: uGOWC4ZlTyig0hGSg0YoUg==
X-CSE-MsgGUID: igeu7tPwRaKnq+zyUHNBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="266690004"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2026 09:25:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsNO8-000000004sk-3g6R;
	Fri, 07 Aug 2026 16:25:40 +0000
Date: Fri, 7 Aug 2026 18:25:34 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: visionox-vtdr6130: switch to devm
 panel calls and drop remove
Message-ID: <202608071839.p4QV9Yza-lkp@intel.com>
References: <20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026@linaro.org>

Hi Jun,

kernel test robot noticed the following build errors:

[auto build test ERROR on cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/drm-panel-Enable-DSC-for-Visionox-VTDR6130-panel/20260807-132154
base:   cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7
patch link:    https://lore.kernel.org/r/20260702-topic-sm8x50-vtdr6130-dsc-v3-2-db881a3fc026%40linaro.org
patch subject: [PATCH v3 2/2] drm/panel: visionox-vtdr6130: switch to devm panel calls and drop remove
config: x86_64-rhel-9.4-rust (attached as .config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071839.p4QV9Yza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071839.p4QV9Yza-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/Kconfig:1356: syntax error
   drivers/gpu/drm/panel/Kconfig:1356: unknown statement "selecy"
   drivers/gpu/drm/panel/Kconfig:1357: invalid statement
   drivers/gpu/drm/panel/Kconfig:1358: unknown statement "Say"
   drivers/gpu/drm/panel/Kconfig:1359:warning: ignoring unsupported character '.'
   drivers/gpu/drm/panel/Kconfig:1359: unknown statement "VTDR6130"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:757: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/gpu/drm/panel/Kconfig:1356: syntax error
   drivers/gpu/drm/panel/Kconfig:1356: unknown statement "selecy"
   drivers/gpu/drm/panel/Kconfig:1357: invalid statement
   drivers/gpu/drm/panel/Kconfig:1358: unknown statement "Say"
   drivers/gpu/drm/panel/Kconfig:1359:warning: ignoring unsupported character '.'
   drivers/gpu/drm/panel/Kconfig:1359: unknown statement "VTDR6130"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:757: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +1356 drivers/gpu/drm/panel/Kconfig

> 1356		selecy DRM_DISPLAY_HELPER
  1357		help
  1358		  Say Y here if you want to enable support for Visionox
  1359		  VTDR6130 1080x2400 AMOLED DSI panel.
  1360	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
