Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D13168EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138294; cv=none; b=eAwCDXVNyyAHEy+7tPvwINKf7G8C18phKU+761FH9/caYAPBt0TgRreVWqRhsLZW+yZpPRpZpYfb28Y7TSou3gmYq1/vq0t/Ikq9NLaOv0apCw0oTb1/w8HA1ZrM9Fdd/wgPMcESavCMSRUH1ZKgN1Rmn6EwVBPPCIL2xHzOosU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138294; c=relaxed/simple;
	bh=kNKlVWt0ITs0XqNiVkBXtz5BNZYNxn7AM0oFtkv1gug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pObXkK5b6hUiUPpDE6+nd1F9lprv6T+UqVNpZrJ3kMW3sbXeeRNw/iA3aQQ8gsW56sQk8Ieqx11cb9HCi8x/ZrE5rhEdF/BFLJbR2/5cOioYFLPev6LufXHcCqNXnP11rSVllkt2fOWBoXu8Gk4/6EMz0tg2g0ckWwUCcM3wafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcSYJk9w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcSYJk9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770138294; x=1801674294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kNKlVWt0ITs0XqNiVkBXtz5BNZYNxn7AM0oFtkv1gug=;
  b=FcSYJk9wyOKGasIgsH4lZpBwOxpIpD19F9t7RpI0L3k+E17WFPb4+QQp
   tU6oPmjdHM8D4mwfRqOlMSuLPL6dydgaCg7GAWRpLiPgDqifLB9Jri2Xy
   ToeAlKXaaupEFHeSBb4s/DRIfm0F2G9OgNF57IS0Ex28ACLMWOuoRYcF4
   nVN7Y0AVzNfiEYKW6ow7qWhngOGPSM5DKVzzqWaiYicIznNiDCCfdlfFc
   G9DhRP7VK5DuNfe/KDk/YmwLRsWlrbXBGM78YUVinhCk3cw1AvwXbBEEs
   zaj98QFhBVQXBHMhPgBJRn/ik6yQWRQR8SVNNYubn/3ydqb2F+SsjtDcm
   Q==;
X-CSE-ConnectionGUID: x8jN6J3fR96EKDsRK6NU0Q==
X-CSE-MsgGUID: 4TdqdcKdTTKg05wI3KGdkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71213381"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71213381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:04:53 -0800
X-CSE-ConnectionGUID: orUB1YMISzufp6xwiQ/nhg==
X-CSE-MsgGUID: uOlJDxGRQM6bajounDIJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="247506200"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 09:04:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnJpW-000000003O5-4330;
	Tue, 03 Feb 2026 17:04:46 +0000
Date: Tue, 3 Feb 2026 18:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A SPI panel
Message-ID: <202602031842.bg1GhtQE-lkp@intel.com>
References: <20260203075548.14907-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203075548.14907-5-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd9ed02871f22beb0e50690b0c3caf457104f7c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-panel-ilitek-ili9806e-rename-to-specific-DSI-driver/20260203-155721
base:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
patch link:    https://lore.kernel.org/r/20260203075548.14907-5-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v3 4/4] drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel
config: hexagon-kismet-CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE-CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI-0-0 (https://download.01.org/0day-ci/archive/20260203/202602031842.bg1GhtQE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602031842.bg1GhtQE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031842.bg1GhtQE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE when selected by DRM_PANEL_ILITEK_ILI9806E_SPI
   WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=n]
     Selected by [y]:
     - DRM_PANEL_ILITEK_ILI9806E_SPI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
