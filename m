Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E74B1E5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747500960; cv=none; b=rI0xPbcVqiXMP1SkUxJ0fPMjL7NXDAzx59jkPcILRwO8FJD9VEnTP73H+DoHijRuFbz9xfjAM15dYqLd8U7gv5ylMrX9ohSA8UWMc2O6YaOo/TU8g04wNOOHOWGjx+jdGhuGclIRsWnExZ9UPfqAaMOQOTjSNtTspsGYEc0ByjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747500960; c=relaxed/simple;
	bh=dDO3eFgm1AnG109j2NzSghhWainqJ1doT4i2XBtYr1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jod0CRNc6A7uHbYPmJ3v84nH5ue5jOXv4RxQybCLE3o8EK3XB9d1b9e+q897DpaeGDf1CWiUx6G9DX2ERJmJZaHL4L5XMwIT7Oe1Z4RIihqFjH9zw1ZlQ+NVNKJWFVLNLbhkCJUug4NTXgu6e7Uu1JseCitspSaRKORGIgjMKlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbnCCKu2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbnCCKu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747500959; x=1779036959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDO3eFgm1AnG109j2NzSghhWainqJ1doT4i2XBtYr1s=;
  b=QbnCCKu2xDzxdAMIynlP7wbwJVMscD8cWFTBi5WMEiZtKf9zHZtIRM8v
   srkOnwfQtB7DcLo1xZNIlDX96tbKJ719flfBD311VSEQArLUX2L4S9LcW
   +1hZ3SoAHx6J4EJpeR56FKy+tcaJtaHOguddgHqVvj4cLQcBL4N1l9OKx
   F3H+AGH6p+Ek6m6NwF4bwnLfJJnd3Ikwfn9TLiDwpzJKHZeZTaiT4OZDw
   Bsrr/lkha03tPHrSqMPREciV2841h4wRMrUOGw2m9H6sTiU8g/l2caQg0
   v+/kF1Nb+I3wmZosIX49eLi7BOrk6rnLgDaRRHTnJ3i8DLCIKaGcgJHc0
   Q==;
X-CSE-ConnectionGUID: vG5ci9HvTUONDCldJ5Kogw==
X-CSE-MsgGUID: qPkjwDXTSA6IqV1vwWgLQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60481425"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="60481425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:55:58 -0700
X-CSE-ConnectionGUID: OfeCT80jTvKQSxPectv+hw==
X-CSE-MsgGUID: Rq+5kU0CQMq0b6uNxpApvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138713581"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 May 2025 09:55:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGKpG-000KHV-2M;
	Sat, 17 May 2025 16:55:54 +0000
Date: Sun, 18 May 2025 00:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2025-05 1/1] kismet: WARNING: unmet
 direct dependencies detected for HMM_MIRROR when selected by
 GKI_HIDDEN_GPU_CONFIGS
Message-ID: <202505180042.AAuAxfVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10-2025-05
head:   ddfe089e2cec754ada82621f9c3f5dc15caf2ce5
commit: 2ea27b7efa3f6fd0b4fab6a748ab08322280f29b [1/1] ANDROID: GKI: Kconfig.gki: enable CONFIG_HMM_MIRROR with HIDDEN GPU
config: arm-kismet-CONFIG_HMM_MIRROR-CONFIG_GKI_HIDDEN_GPU_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250518/202505180042.AAuAxfVT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180042.AAuAxfVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180042.AAuAxfVT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HMM_MIRROR when selected by GKI_HIDDEN_GPU_CONFIGS
   WARNING: unmet direct dependencies detected for HMM_MIRROR
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_GPU_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
