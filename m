Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD14C80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734227810; cv=none; b=hf6bKF6EmWoTuEO5tQcThu3UufQsO5AUY/LcVs4SOd3bY1e3bC1OqEHw6qD4VGqUL3AHZFS5P3Qs394YpnpeQdgOsFt52PEIcXVOAc+aVOGGBDqqXzlMTr5zLNyHCJpZN81ppdKu95dUaXAGkhOzlXy0/L/glPNlPN4RSPxOycY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734227810; c=relaxed/simple;
	bh=cmxmYzOwsu4Yr5+lj+uO+N/345JX3tEzifZi5+NPRGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t6yx9WbDQCaOHk5dUIO3PgxaUyITcir+EW9/M3c/xCHTnZB/sDAkhTN5JDHNtzaqs3C38GoqEoJLQeq1WTz3oWmQnDxQCOO9r+SSFn6WvWFZ0J29aWjyw6V+JDOO1MY9JME7zGAVV1w3zIZxxn8/0nYgWtiiPNbqPl60FW5bWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJG6l9CS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJG6l9CS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734227809; x=1765763809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmxmYzOwsu4Yr5+lj+uO+N/345JX3tEzifZi5+NPRGw=;
  b=YJG6l9CSqcqr1Rw3SnoU40mKZBELaL/DW5R+PyHv0rdxQXPSVhrqhvKw
   Wu0MRrH5bFu2rFGnsk5qpiiKiFK1twQUhAneDUKe5CbOF2cesMSEILmFI
   cL75NCApGp7Ep03xPwXx8gABUb4ACFUFpBrHX8wldSnFiODJ66cyPVwZN
   CcB3IunnrCtSkksfR7LJPCejq/TBl1NEgRk62KfXAUWsXmQEjVnoL6Fxg
   hvdNa3+eG3fuEqrlrWzQlz9mOMi/lyKH0YskecSmiGaTw01VQWi0vGBu3
   nNOPPvz6CANpmewBM4ABGDwzvCrZA1QEgU84U0OpE82UtbsxqATIEkRat
   w==;
X-CSE-ConnectionGUID: WyO+cCabQvu/QB9liwpdkw==
X-CSE-MsgGUID: jXGRMWwmROGL5nAyDKjg7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38577033"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38577033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 17:56:48 -0800
X-CSE-ConnectionGUID: xqW2u2fXS86CcNHLoAxEDA==
X-CSE-MsgGUID: qMxQtZgDTaaUZckVMaHWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101965446"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 17:56:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMdsC-000DN8-22;
	Sun, 15 Dec 2024 01:56:44 +0000
Date: Sun, 15 Dec 2024 09:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/16] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202412150936.9R0JbmBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   979e6f6aa3c78b92ad965d072eddc53477a84fb6
commit: 440d11cd96f3f7bad78bdb2e10122b02a626478e [12/16] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241215/202412150936.9R0JbmBc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241215/202412150936.9R0JbmBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150936.9R0JbmBc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
