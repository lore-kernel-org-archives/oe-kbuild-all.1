Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FB84A35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332148; cv=none; b=Kxv7smePzx4xjI1EdfKqpWFUghRc3G5hn+x0BsEV/JyN3XeJI+0Y0rxOMroeHK1pzFP4BedNoXVrAS1ialMD4JYPNTqVMCkHdehrkTDJ8nehd8wU6GxQglLFbMG2KrO/K9a1/bbuKEFg+pRY3Jhe4wSs8XvJ7WWc0oFMlbhjJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332148; c=relaxed/simple;
	bh=ZNKfpA3/LoSAuop3TzR1liQuJ2BYjtDK6B/r2C2gQIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/4xIwrenx1xiVechqg5iwm+72BzPthjyadsENZ48eTfj4Y+bL4EKVIQBReCX5oWX+f3dSwZAh/2ahrgqTTItQTewlvYrd/nCRMW0XAy60ZmrgY+H81bxxaI/M4/IOpydLZgTBsOPYGobCeuAAT3bFS5afEVPR1uol7gSnl5MvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeO6Nj2w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeO6Nj2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766332146; x=1797868146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNKfpA3/LoSAuop3TzR1liQuJ2BYjtDK6B/r2C2gQIk=;
  b=XeO6Nj2wLAn2HrpZy1SERMzjiDDsNG9kyKyw2aYWX4hn7bpoj+l9a84z
   5C2hQtPLMZ4eSExziet6nM8/0AxrE2zOKe7lzs6oCkQs9YAaiNzY9g4K6
   si5UmR5vLC5q3fKyYdotx/QIu/hYIdboClYl+CiYbaAd/yejavooDdZDN
   jMERJmJKzrYGKOZof2T1rwDo7Faa7CvVXDISyZ0hLs3hibDC8ukea08RM
   cTHJ7XhHUSpFtE/VoXW0ablf6gY1aX88RdzuQfIkyQo9TDzszCuyNLO6/
   bFYxWvkC7+kTIPOBhBPshs3GXbzsHYcxXmkFncs/NbiMQRiR8NOcLokLG
   A==;
X-CSE-ConnectionGUID: 9oEiystsSYi9aed4sB6VeA==
X-CSE-MsgGUID: krEMW76vTS+hlwKC/pPc9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68363449"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68363449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:49:05 -0800
X-CSE-ConnectionGUID: x2lyZOFHQgm61ttvH54NlQ==
X-CSE-MsgGUID: 8qU+TYAfTVG1zgZufgfzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="230344374"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 07:49:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLg5-0000000059Y-3dS9;
	Sun, 21 Dec 2025 15:49:01 +0000
Date: Sun, 21 Dec 2025 16:48:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512211647.sTmkcFmB-lkp@intel.com>
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
commit: 025be59f9131c7d197bef270bd95dcaa100c2b80 [12/12] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211647.sTmkcFmB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211647.sTmkcFmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211647.sTmkcFmB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
