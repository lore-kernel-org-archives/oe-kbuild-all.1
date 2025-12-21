Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8D2571C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766327824; cv=none; b=C7W9o7ZatLQuwxfrXTODilTD+HpZxC5RSs3Er+xNczV1LjiYZoZ7YS/bCXyHjXzeQtEGHHGTK2YJZekmHjRL82w0cKrVrSYUrxkW4puXMALL8rXX/+a5zvJIIG+0meoj9rhuvjR/WEzsAOWvw1cSHlE+UU1SHWQfKJpVXG7c9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766327824; c=relaxed/simple;
	bh=9UoYdT+GjmGN6heaf6inC0gQIcrKzI9BFfptNedNhqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JS1/ojfzMkFr0fR5Dfh5J04G67mnxsSko/7ptpqFT9LLHNJZrnvuOo2Q08kbZE328gxzw8oFAWt87DWnboHuvthOcMEUgbJZFAorI0XRSunUlx/0Rtk8KSGaYvt4VrFKiQgVS/kSEIhPBkrjPHoc25xWAp7Zx9D1I/5yEX4Oo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dqi0TMMI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dqi0TMMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766327822; x=1797863822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9UoYdT+GjmGN6heaf6inC0gQIcrKzI9BFfptNedNhqs=;
  b=Dqi0TMMIbXHAr+UBR1K8m1i9ZQCN0bo5g2c3+ouECdTpOIZG08bSqnVp
   fDmcHOOKti3jIjZq0Q9zcMNLoTJP4taRQzEUKwtRQqCVey9TNlvciFGU1
   09Eqb5nWaLQWHyen+6O68XAtE1aoCAcxKCil4Ka2hHJ1h3JyTNV+PnhJP
   8Q4Ot4wjyNHE/mgE0f0uR45Rn6kyGEaH0H0x+2KZBwdbcQATfA0CaMCdT
   aDrfVuluEmaSLtmcpRoq/AFq22jgHpJVzP7nMpCyXCzNnLj4P/g8YU/VK
   vkMIe0hsNm/c51H07Mi+Q0fQ08zzf3wwytp52Sf0MlxiBOQpHBxdllsnz
   Q==;
X-CSE-ConnectionGUID: rRQtk1ieQ3+LPu2mIgnZCA==
X-CSE-MsgGUID: ipBHGOCQSFOu5fL2w10PoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67405390"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="67405390"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 06:37:02 -0800
X-CSE-ConnectionGUID: f/4SN9ZITjqKEXfxJY73Dg==
X-CSE-MsgGUID: cDM2cfPWQrGzVoeMPmkmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="200194338"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 06:37:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXKYM-00000000554-3z3R;
	Sun, 21 Dec 2025 14:36:58 +0000
Date: Sun, 21 Dec 2025 15:36:40 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for NET_DEVLINK when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202512211515.40OWKda0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 9a034cb996202d13ff2bdf6d90539fdf47fe2eb5 [12/12] ANDROID: devlink: Select CONFIG_NET_DEVLINK in Kconfig.gki
config: x86_64-kismet-CONFIG_NET_DEVLINK-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211515.40OWKda0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211515.40OWKda0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211515.40OWKda0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_DEVLINK when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
