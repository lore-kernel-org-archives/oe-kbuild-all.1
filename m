Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D417DE36
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729241661; cv=none; b=Ow9FpCT2t2D+yMuQT3DWVGHw6H5D5S0rr6X9KOfg/gUIuddBt+5aZUKZ5x2upilymT3RIYefQ43vd0wLMPwErPtEU/A3GCbaxlo/jx9tRgKGIIysa9XZlq+NR3K2DAa7LPZ3lNlNOIlCnVJx/kBmfyBVL6ia+1WSbyRBcwWuqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729241661; c=relaxed/simple;
	bh=BbJcb6d5pF1hND7g7a4j8Z4mwaHFNJ9lUVRCHPn2AEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cLIM2JX9wEBs9/7KZnZNmZcMlTUQFs2Ubwpm4oZPQiIIXPaIy7Ck24mMpvVKJAbrhoNNMXAI2W+eDjeHz07tHCxy/qcGKB4AReqKBu+DemkhS+UcKKN7nz7Rb2SMJLQmxfVwG03+IewKGoOd60G89yn+B7DrhbLx8scIoO8F4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOz5H8YV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOz5H8YV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729241660; x=1760777660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbJcb6d5pF1hND7g7a4j8Z4mwaHFNJ9lUVRCHPn2AEI=;
  b=IOz5H8YVXbXTirAKf9++xzo9/hFABzZhTCl2QQqMm98OZwtmDVKDk4XC
   TGCnR9gj8h3dJZDaCKFIxd2bSWHSUSzB1mDwyotjOXBp+HPhSg4aIss/1
   ZB06YWHWiOOAefogDVgCXeA/9eS0hkZF043OrjcU3oxvJHxkkF4D9n+n7
   Db+BNZdvI4fTyatLObzJJxTxY05gRVaaKjMqfpsj7hqXd2Pgt/4B/ONZH
   i5rmlRt/QHvKxaCcb0PPLWPtFN4u0DtF/iXEbv207L0kGNtgjmlZSmSMm
   fLutSPOvPbzlZrr+RTTYGjf2cygXOcmJpgnDq1TF11KPZVwvjCF85c9Ht
   A==;
X-CSE-ConnectionGUID: 4MO5RwiKRlC0mVPPOQFWDg==
X-CSE-MsgGUID: ylQBn/PeRdWo26b2xKHDTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40164194"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="40164194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 01:54:19 -0700
X-CSE-ConnectionGUID: J82JdhEhTcizGuZSvogZVA==
X-CSE-MsgGUID: +78+/Yo/QT2xd1z9Q9HIPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78719134"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2024 01:54:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1ikR-000NUF-2l;
	Fri, 18 Oct 2024 08:54:15 +0000
Date: Fri, 18 Oct 2024 16:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [linux-next:master 4731/5686] kismet: WARNING: unmet direct
 dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by
 DRM_PANEL_SAMSUNG_S6E3HA8
Message-ID: <202410181612.6fkeFCY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: fd3b2c5f40a1e028bc813284260d430257444334 [4731/5686] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
config: i386-kismet-CONFIG_DRM_DISPLAY_DSC_HELPER-CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8-0-0 (https://download.01.org/0day-ci/archive/20241018/202410181612.6fkeFCY6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241018/202410181612.6fkeFCY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181612.6fkeFCY6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER when selected by DRM_PANEL_SAMSUNG_S6E3HA8
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DSC_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_PANEL_SAMSUNG_S6E3HA8 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && DRM_MIPI_DSI [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
