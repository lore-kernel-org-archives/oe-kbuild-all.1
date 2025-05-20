Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D371CCEE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741774; cv=none; b=f3Jq4tr6BZ2E3APi5BBpqIuITc7CDd6dvVMyFDKWnjOe5Ycl6EIMNu2gCJ+sBhJr/4nmOGa67/n3IPzy6PobR/BEQmIFdBhDbVRYHSmtdvg33mqHZ4XOmjgztZIs2EAIBe3eatsYvk1otCfW57oXH4vbNRacFpc8S3pCJ3I9AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741774; c=relaxed/simple;
	bh=gcctEmOMB8/xZBo8QUAoV/HqxB1i417zp88odP8f5i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmzxGTbpEV+1rOLxDuCICpPV2PkAzajxCLycE5HR4BWkrpeNQzHnqyeDTIceA4nPDGfyzYVvU6EtJ0Zv0Z7BOu/73IC+Oj5L0/2rtwk6UQ9tDmECY88eOB6vy3VhdZMrNtOFe/ERKyRvgXXAwWRfS906WtTp9jzxPtkYBWRx2fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfxihqkF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfxihqkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747741773; x=1779277773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcctEmOMB8/xZBo8QUAoV/HqxB1i417zp88odP8f5i4=;
  b=NfxihqkFJrYD2kCSX5YPojZcgx3yxA/kOJOXKxLg9cfDd0pYR+GKy86I
   +Lm9MHbUAiGMipK9ckc+pkbrWcncA+sUX0PxDfhSipsr1w3+6jVYiIEsX
   ZjLKNIdLNBz7Jj6csU7XRyvFicT74Fzeq7NH/k26tLvOA4aA5upezaPWO
   VnskyzxEuAhOIA/8bJsKaP5qQ6hzdg7jd8ly3EEemGMLTd/lIndi8XoLo
   9VWIDMwU189rbr2wUUGlzYXdwf8PLuZW4jAgWru2/S7P91eJldnKL9+ys
   //0TD1YPy/TQ7QZ/8plJGdVy+Ew1X4tLoc6qHsHytrwCWR7ND1kviAL3z
   w==;
X-CSE-ConnectionGUID: vTL70GZ+TiO1dV9GfiaVIA==
X-CSE-MsgGUID: C2klK0mPRFeX99aL0L+udQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48925060"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48925060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 04:49:32 -0700
X-CSE-ConnectionGUID: ild0xZquRDmVIYTMaAQuNg==
X-CSE-MsgGUID: 7XSw+vJMSbaDJe3Y88dBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143668111"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 04:49:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHLTL-000MXG-2p;
	Tue, 20 May 2025 11:49:27 +0000
Date: Tue, 20 May 2025 19:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
Message-ID: <202505201924.nRldyjej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
commit: fd3b2c5f40a1e028bc813284260d430257444334 drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
date:   7 months ago
config: m68k-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8-0-0 (https://download.01.org/0day-ci/archive/20250520/202505201924.nRldyjej-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201924.nRldyjej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201924.nRldyjej-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_SAMSUNG_S6E3HA8 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
