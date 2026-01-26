Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392126299
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470589; cv=none; b=hROJATX1ZngLXlSerN2XYUp1rMdmj6TKqPulxZcjpVD2XLWMH4irE8JgnpbAk4SD6tgXzuCw0xehksllc8SJxhcDod4si4r3Lwit5wOI7wsBadB/JOus41pqwOMhggSzutE7itY2/D5Eqq0+9Fg5Lz2a2W8XqUnVDz2WMVNQQ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470589; c=relaxed/simple;
	bh=2qihAeStLk8UtWiG+d3xuYz0JuSr+DATgvhbmOIawlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nr4Faaw4xWQGlxOpcUmWTPPR3j3Bb0a5EfiGM1QyO79GmqFgk6NoJvjzHMBquI6LQHC0r7489KoOkZD9eAWeK/x3fKb+yC/53bijznSrFQ6XIGs1NjiSSmaQzRAyhccvZRe3W75Dcu/PPodfHgYDaJxp3FJgkxuar2sQOrsRV4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JADC1FnE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JADC1FnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769470588; x=1801006588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2qihAeStLk8UtWiG+d3xuYz0JuSr+DATgvhbmOIawlY=;
  b=JADC1FnEMBKGMp3xQnDR/BKu5KtXr3o3vVPmSbgODzk/0eKtTF1ys1Fg
   ur1j2ESxawbm9uoxmHStDJK6ETQOzNNn9xNnV9k+W3kMeJyqegAC8l9WP
   X3V6APHSeMRAeavvgnoWDFnlOorz+BeN5mwkmoNTkSvZc+w6wewolP+tM
   6UibaYkxS9H9ro7jKBWSnuxinPuej9X6shGZJD2WBAHmk0yhS9IkF7jkU
   yorBFyLJwqB7E7kbc19F/XDJqB+RTVPSc/pWbLPWCF7pK5ovGDt0t/gkh
   MSj4OzDHkYJ62r0U9loQi7DZ3LOnVYS3BSbEvFKbwWd4TvvUKQvLOsjZ6
   Q==;
X-CSE-ConnectionGUID: npOtxfMmQDqmggpZQ51TSg==
X-CSE-MsgGUID: ECidTHR+Sw2PU176uI20+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96119302"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96119302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 15:36:28 -0800
X-CSE-ConnectionGUID: Nlgz/Ii+THSBIh9nc2kzag==
X-CSE-MsgGUID: kgB4YVN/Q/+xsGC27zwTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212357394"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 15:36:25 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkW86-000000001cz-3iP5;
	Mon, 26 Jan 2026 23:36:22 +0000
Date: Tue, 27 Jan 2026 00:35:35 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Ma=C3=ADra?= Canal" <mcanal@igalia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [drm-misc:drm-misc-next 1/1] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by
 DRM_PANEL_ILITEK_ILI9882T
Message-ID: <202601270005.VK6B66uK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   68e28facbc8ab3e701e1814323d397a75b400865
commit: 68e28facbc8ab3e701e1814323d397a75b400865 [1/1] drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
config: openrisc-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_ILITEK_ILI9882T-0-0 (https://download.01.org/0day-ci/archive/20260127/202601270005.VK6B66uK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601270005.VK6B66uK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270005.VK6B66uK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_ILITEK_ILI9882T
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_ILITEK_ILI9882T [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
