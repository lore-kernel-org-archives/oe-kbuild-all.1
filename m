Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED7223336
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768169843; cv=none; b=WhQDVNHwnJ9oKpSzia9q6jqjYF9sm5aACBJFr5IbGR2cwDFJYhYydA+yjl/55+6yyGoWz5oAZCsZDM5ikB+nfq3UNmmBdESM3kMYTqbrUJ/GSAQrpa7f1Z4QHPMCbiBTYAnsKAIeLyMjupavL3cnDNYcxnrlx3D4UePWJbWjA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768169843; c=relaxed/simple;
	bh=3qWHeuqbaFNjUWF2qKu4p4IesGBtPxa6GXG0G6yIZ8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F7212GO1oLecQ7ZNtoBLq+CzFvDPDOakIMv/x448Fs5XUF9gCdZuGt7HR9LETDvxM37FE96mMBfo89YuHAUqeLbfkQovohf+JyaAu4VFouzOipQ3rXS/TiW+wvZRwlAXLHIr6c594NaI+hhdxyCBufOPeHfGW5WEc/w2RzH6gNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE/WRDN0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE/WRDN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768169842; x=1799705842;
  h=date:from:to:cc:subject:message-id;
  bh=3qWHeuqbaFNjUWF2qKu4p4IesGBtPxa6GXG0G6yIZ8U=;
  b=gE/WRDN0eNs3MXY5gcQOHwKNuGbY6JbyqTzs0UUbxcZii3zJl2Dv6yo+
   wwjADl9Mfh89EJ4ZvWv8WWG8he95fZNfdwDqSTNMBckoo34KbGf/BdOdP
   Bh+HQ1LD/XC5PUn00zG0tWfBahpgVLcXt+zJiXkU0n1Tj5bGJGZL/LW0u
   ck5RoX+RrCgxRwBOwM5VrcFiOrRV+YFS8Z4FF8QqWeNFT/fDd6Lmtbi0E
   alisbKn5XanUQVCzlS/YetqvxPaQMTgJtDKIqDJ1ztVTvCbT/VskCHknA
   i9nAwQRFeuDukBS+sEs5Z0T/vG/CgVm8Ec5/J1C4b0zNOD3uduL5snTb+
   w==;
X-CSE-ConnectionGUID: 8ViwOK8vRSKpsa/dPthThw==
X-CSE-MsgGUID: AFCx7yshTliTI80ipzyVwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73083247"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73083247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 14:17:22 -0800
X-CSE-ConnectionGUID: igyaqZ/JRkytdaVrIPDBgg==
X-CSE-MsgGUID: Zijn/8lQSsuGlKLfjpnUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208471432"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 14:17:20 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf3kL-000000000VJ-198R;
	Sun, 11 Jan 2026 22:17:17 +0000
Date: Sun, 11 Jan 2026 23:16:54 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
Message-ID: <202601112323.ICCSphRR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: fd3b2c5f40a1e028bc813284260d430257444334 drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
date:   1 year, 3 months ago
config: hexagon-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112323.ICCSphRR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112323.ICCSphRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112323.ICCSphRR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_SAMSUNG_S6E3HA8 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
