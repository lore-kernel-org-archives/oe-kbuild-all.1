Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2D503BD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376531; cv=none; b=AsrLTHx7LbVAYqXLpRryeFuD2rTDaIoB35At7KF2QOkxdEXK+PaFiEwzOpeadKMt9fPowTmfjElk7r9o+sLIb6pIMSsk7eVD4ieY4PsBZD4pm4NRd4DYXcI5ScTROJObcW0UTSqouP+mzR8bBS2QYV1ZRKlwpc/Qz88X1qa3BEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376531; c=relaxed/simple;
	bh=8vdhxwdEWywtLGjfmdNLrvS5jwaNAmYnmdeAvIWO0fA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2ISXAPdcW+qzVBIsy7NCoyvhTh7ds6IYpYaYJMpUYER5eX3GwnsCMWdZ4eccQsGvocmpwpj0LG9cUXLxOSSitu6GlB4p2qwZvxcEIhFJqMAROOJBrYW0y7VLEfQ0qp0A7ne4S7aJH+jZjKzvdzoeIvHvZWmcslWaRCE7+uZ+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGNRSXnb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGNRSXnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790376530; x=1821912530;
  h=date:from:to:cc:subject:message-id;
  bh=8vdhxwdEWywtLGjfmdNLrvS5jwaNAmYnmdeAvIWO0fA=;
  b=kGNRSXnbmEY8FX1d53zf0plU0mCrbUFPtvIely/25kqFn33A6zWYg5B+
   A/TEMsrzH24+2C7vB+6ZJn5YlgZv1ipvXjEX+XFUtmBrTxXv66NxCNJ/Q
   h6ci0MUbCKwWohvrj8SszXxudxmy08ER0IRrC/LW/KkDEBBWDZocf3ZhK
   AxjNZRcXfc1mBye2pn6XrYbMwoSR6KO4zSVyXZP5VrxZ0cLst/qvmZeGq
   AyMZ3aHNKStkM2k4tNtawIgqO3Yx2SYdyfsaNn88YcthrWRjmDlYrK1U1
   4rRyw13lJfMKKmbllMMPn7kRJTY6lIys6edy0tA9XST0menonHG+31bWu
   w==;
X-CSE-ConnectionGUID: 6VerJ0T1R+yWbgoITYHjDg==
X-CSE-MsgGUID: /rSzTMplTGyaWj6n7TF4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90125468"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90125468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 15:48:49 -0700
X-CSE-ConnectionGUID: abZEy8NERGiWnRDh0rla9Q==
X-CSE-MsgGUID: /Cee/TMyRQOXCC9tOOCMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312370150"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 15:48:47 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAEih-0000000003j-2L2t;
	Fri, 25 Sep 2026 22:48:43 +0000
Date: Sat, 26 Sep 2026 00:48:30 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 530/673] kismet:
 WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_AUDIO_HELPER
 when selected by DRM_LONTIUM_LT9611UXC
Message-ID: <202609260059.Nz8hGpsW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 51e01c382b0b95ab961dadfe491eb9f9535ff370 [530/673] [SUBMITTED 20260216] drm/bridge: lontium-lt9611uxc: select CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER
config: xtensa-kismet-CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER-CONFIG_DRM_LONTIUM_LT9611UXC-0-0 (https://download.01.org/0day-ci/archive/20260926/202609260059.Nz8hGpsW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260926/202609260059.Nz8hGpsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260059.Nz8hGpsW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_AUDIO_HELPER when selected by DRM_LONTIUM_LT9611UXC
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_AUDIO_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_LONTIUM_LT9611UXC [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
