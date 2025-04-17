Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD888204C2F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922954; cv=none; b=etfpWSWAJ5WKeMoSyt+CpblW6rR3T7kPDi+qW+0Wa0L0pAFJyqTBKwRKqqgcyqUvAeWIWJoOWBb7eOZi9t57pmBDGWt54JUVL5Sp+HiBSnb1ljIrAnenqIF0j9vygwjsx5NIWZ0omlP4uD+N5mv7fHojqIdnIOEZJIy7jOtUBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922954; c=relaxed/simple;
	bh=DWS07BFjRraNsuTItPweGdB3f9Vke3kxJW4VRMjVaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO7NhNseCQsVXadzEQa7NfJmORFpGQGBChBON4DHWW0H8ZAqdHvCPC1YaEBnERn37MIbowW3S0Cnyw8Ge1n+8dS4z8ARkGEZi9Pq2eIcxkBUjQvGevV2dZKexP73wNOnnOW5MB2tOdDPGN8q0EhyKicsq+seUaC9V1sL/A/Wlv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xnr+RMR1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xnr+RMR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744922953; x=1776458953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWS07BFjRraNsuTItPweGdB3f9Vke3kxJW4VRMjVaLM=;
  b=Xnr+RMR1IiOdl9GE2c7E/uVHxKmQysWYvMy+6jmnWyQpCDCnUedDQALy
   6ZsOs7/y5xn59eQl9jUQSEjah0PbCg4CTaQXSCXu4/6JGARFNT+9/+aC/
   twyz67Z/JF0lOriFKWrBVo7HJYFCIA+Qs1jypmxOCmWBDXLpI9HXN3w7m
   KxBFxekisM5NCwdDgVkjIPunpnoyxgvebxCDwQje8xocJV4cjXA5nvDTg
   lZ+XAIZqKGj+AUHnUBB1wNN78upOKtdxxD1HHWMhhlRtQz7Ik0ZdNLTyp
   iIGE7WQdcX/qyqr2yInfup/akPg0ExQK/zIput1FsTqV5IBaLomUgRaw5
   A==;
X-CSE-ConnectionGUID: sb5Suak0QOewMogmBcD7pw==
X-CSE-MsgGUID: AtwIrOmvQPi2RZ+SAZ/0KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57530197"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="57530197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 13:49:12 -0700
X-CSE-ConnectionGUID: xJciFMqlQ/WcBnIzUhhR5w==
X-CSE-MsgGUID: Vc2zxfXJR1SCxYWyU3pREQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130772880"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Apr 2025 13:49:10 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5WAV-00021t-2t;
	Thu, 17 Apr 2025 20:49:07 +0000
Date: Fri, 18 Apr 2025 04:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
Message-ID: <202504180453.imViKVk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5c6891b2c5b54bf58069966296917da46cda6f2
commit: fd3b2c5f40a1e028bc813284260d430257444334 drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
date:   6 months ago
config: sparc64-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180453.imViKVk7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180453.imViKVk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180453.imViKVk7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_SAMSUNG_S6E3HA8 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
