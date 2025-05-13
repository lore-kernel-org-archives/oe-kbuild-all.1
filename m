Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C398417A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 03:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108324; cv=none; b=GoVMx+8N87j/vjtQ/oSxPLJz7Q2hQU1usH12ygXrX5gQ3Jdy40Q9C9/jOBkZ3QBWu0nzu8SsOOZIY4NLcG1VMA7ZON9Dgd5dKAnubFkNF5pd5oQmnjW90M32Q0+GRyuWaVGR/tszahi4tEUgtGAVdJMg6HIx977gwurhkszQ4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108324; c=relaxed/simple;
	bh=i+fqz1wz9rhYfHsWPInfwEunq+hVtGSHWvi0ZjBmWVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwikNtzG2oly+aNK1rnkWStoTC0qMbBGex+HyAw05yYUMNJyZ4XvXg8TwdyCxASOnzX/GQvRFW9yppxeSLiov8J/qCutopbPIz4SdaY8Z/dAUaRncxYsEYPNEHM7kW7vd8DLGo/i7Y871/nUGnFLOCghVcMbARgTzMCTZNpZ58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKJRnviI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKJRnviI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747108323; x=1778644323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+fqz1wz9rhYfHsWPInfwEunq+hVtGSHWvi0ZjBmWVc=;
  b=PKJRnviIegpCKHN9UEFsKciSyJ9yfgXjO7Ex8jPTpwV2K2EXq53R60K6
   5H8MFWwz3rH50rO998/dDTKsftJd7EhLp1md3gcgc1Jg4/U1a4RDXcfTQ
   EbjK1uoMGnnFQ/GrvtuJFHhLYLzP5oK0dNiOcZkDxmmwz4TUVqF4P+Z0A
   W4wUt7XVhFP258AlISzcm9feQHCUjc1NWh4udXEl5LFijjmQg7jgqvf+V
   LndRbDiZ28jc9JNyXaGMeAkwtPDKVlG0xgxQ1VvzfamwBhKccddWPy+WS
   GGlnsN9Ohp1UqMSpxM+/vNfTC6UhGCdP/bR+28zy9mNs9xdftMY9S21f3
   w==;
X-CSE-ConnectionGUID: avBAtnqSRROQjVeb+cdljg==
X-CSE-MsgGUID: 41nWpIfvTtOpwq2TmwnRMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52739016"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="52739016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 20:52:02 -0700
X-CSE-ConnectionGUID: Ck5H/ZrwR5qPFx2OpRqYQg==
X-CSE-MsgGUID: qPS0A7o1RmerGL/XY4tfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137982252"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 20:52:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEggR-000Fd5-0X;
	Tue, 13 May 2025 03:51:59 +0000
Date: Tue, 13 May 2025 11:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 2/2] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by
 INTEL_MEI_HDCP
Message-ID: <202505131120.vr56KPgS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   fc57f0cc9c0336bdc0b25e1e5c0482d1ee9d0ba8
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [2/2] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_HDCP-0-0 (https://download.01.org/0day-ci/archive/20250513/202505131120.vr56KPgS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131120.vr56KPgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131120.vr56KPgS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_HDCP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [y]:
     - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
