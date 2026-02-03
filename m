Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E063D3333
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135714; cv=none; b=srB9QOBgWOovlmEwdgB+9j9b6uGyjzpiluhtHGqtrJ+TiIDlWT5SgXSZ+HwI9KVbehHi7iYikB9x6/lXl50xdhkHKN9UE5EBriZTxfyQtmBGOFC9MdvC//EJgKMBZ/J6ytFPsbja82Do4q4P32z5khY8zbcKdtuT76oZfnRKAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135714; c=relaxed/simple;
	bh=7Y2gy7hhsFI0b40ji/v+SoBFAiAx+y6+IF76XFVeOaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujiJUVV8VDMXghnudlsAx10oV42LwyZQiD+ayrjPeolEF0j03Utz3sz/wM/lELlNEhe7K5F6xYu49v95V0mpmXHY2zDUy0XbXQU5tn9pGGPgwPyFipZYQeqpta4elZ2DMzPHAX+Q5xxik3j1LVtnAAdilH+CkW6fRtZlOrIyN04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtZMFPpS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtZMFPpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770135713; x=1801671713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Y2gy7hhsFI0b40ji/v+SoBFAiAx+y6+IF76XFVeOaA=;
  b=EtZMFPpSU75a4zlmvewkaQQi/h07Zikfbkal1R6Pl//BYZK5x/RdnUep
   t46NB18OnNBjNSwIXgYSlIHEtZW9BDkhSmMK/TC6Ig6Eq09QWS3jjdEdc
   gYe7y/ZsUl/0jm7DzOgGCIhqU8tkB3sDa35nlheuIlTYmzmE8nL/ftYWs
   kweYzOL3DF1Qo/FXE0MidC7GEcWoxqAfDjSn2mklQ64cJs0ZPkNzdViil
   esMTkSryeMYdRUhtxDNpGOXMfdVMjvShDLHdMFilElM+FX0MD0vRVwu3J
   fX7zbBUcoJjzEdCwN7IYr1dX7xWPO5hPRs6j0FxbLw7BN8tw4F5barSzB
   A==;
X-CSE-ConnectionGUID: Xey7gSoaQ6yfPnrS7q23KQ==
X-CSE-MsgGUID: lXk2C3rSRT6LAA4C5MiNfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82682272"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82682272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:21:53 -0800
X-CSE-ConnectionGUID: LTnIiRNtQk6GtvTntW1wqg==
X-CSE-MsgGUID: g+qqdzp9SKCInIWgj3S9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="232804399"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2026 08:21:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnJ9u-000000003Nx-3Omr;
	Tue, 03 Feb 2026 16:21:46 +0000
Date: Tue, 3 Feb 2026 17:21:30 +0100
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
Subject: Re: [PATCH v3 2/4] drm/panel: ilitek-ili9806e: split core and DSI
 logic
Message-ID: <202602031753.CjqWRWVT-lkp@intel.com>
References: <20260203075548.14907-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203075548.14907-3-dario.binacchi@amarulasolutions.com>

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd9ed02871f22beb0e50690b0c3caf457104f7c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/drm-panel-ilitek-ili9806e-rename-to-specific-DSI-driver/20260203-155721
base:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
patch link:    https://lore.kernel.org/r/20260203075548.14907-3-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH v3 2/4] drm/panel: ilitek-ili9806e: split core and DSI logic
config: hexagon-kismet-CONFIG_DRM_PANEL_ILITEK_ILI9806E_CORE-CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI-0-0 (https://download.01.org/0day-ci/archive/20260203/202602031753.CjqWRWVT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260203/202602031753.CjqWRWVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031753.CjqWRWVT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE when selected by DRM_PANEL_ILITEK_ILI9806E_DSI
   WARNING: unmet direct dependencies detected for DRM_PANEL_ILITEK_ILI9806E_CORE
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=n]
     Selected by [y]:
     - DRM_PANEL_ILITEK_ILI9806E_DSI [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && DRM_MIPI_DSI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
