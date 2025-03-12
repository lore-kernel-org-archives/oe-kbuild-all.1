Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48823231A51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774253; cv=none; b=GASmuGInjOQiSnHoxVGoS2AvSsJgnpldP0sdb8bTHOWgtqNbCnJHuB2zYpKVooqwkjAZ2p48z60ByQbGoyih1u1HaRfm+rf8mePmZ/U8icBdUm0S9LMUdadX47Pc0BPeVVoM0MZSydSG9j7Dxirej9I/foHdH0ynWzUyt6Gp5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774253; c=relaxed/simple;
	bh=NcwqdmlEjQvgsUOatDxRxBywgE/YZeeSc5qecLlsg7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K77SprlvkQiWPsdBq8X23nG2TFE6kHwLFHGN0p1dyeceYwK4dltJbbW1UnQQYYIGnSzOLll8yyEfnn2le8cnohemSUQBq8Z+pHxUEULKBiFAEt53/tJO5iWzPV4IrWo4eYeaUUpPNOA40AyNnabFWiP1JnMH7sWhVZ5UE7jEjWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NO0wPreM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NO0wPreM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741774251; x=1773310251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcwqdmlEjQvgsUOatDxRxBywgE/YZeeSc5qecLlsg7o=;
  b=NO0wPreM/4CaZLr1mlVnxhJb8MFaRl97wmt0f6Xr3Pol4+0NgMX84nDU
   d1kb49ZTq4y6jGXdhDkE8eWHAG8wA73d6tPYQq5y7hAiOVabEAOKvz7Ze
   jVF6caPYRHjphI25LC2gzSnUsN7qcifNeeg6Xc+xld+BCiBm/bnN+JCeb
   pZsAv9yHBx3+zHzwHr9fEwkz6mEg6oy28WfbUk994ac7PA/SDMVNpD7ub
   6dbGkmsfJBA6qZpByvVjn7WEQh4/UZ3Apgs8O1K182Cs3hNm2JbS+YZss
   +vVAtDIGFJj+D2csCaYi5IVoGUQswrGD8tiFJVyXCN7dhsSF/lhCT8619
   g==;
X-CSE-ConnectionGUID: cNQrK0OCRryQkxWptTwbNQ==
X-CSE-MsgGUID: AVGYTmz1ReGh+or3TvKX5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46628428"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="46628428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 03:10:50 -0700
X-CSE-ConnectionGUID: pV/iBGVpQcWB2Jo9EtnPNQ==
X-CSE-MsgGUID: oQl/5p0nTZudcFVIcmkOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125782802"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2025 03:10:50 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsJ2n-0008NP-2J;
	Wed, 12 Mar 2025 10:10:37 +0000
Date: Wed, 12 Mar 2025 18:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6/6] kismet: WARNING: unmet direct
 dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
Message-ID: <202503121804.qqrL18pi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   196e23be873afbb2901b85db8be99549a8cbd0f4
commit: 33931f4741d1b477edb647eafd4b03d7aacabf50 [6/6] ANDROID: Kconfig.gki: Add PINCTRL_MSM to QCOM Hidden configs
config: arm-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20250312/202503121804.qqrL18pi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121804.qqrL18pi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121804.qqrL18pi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_BCM2835 [=y] && PINCTRL [=y] && OF [=y] && (ARCH_BCM2835 [=n] || ARCH_BRCMSTB [=y] || COMPILE_TEST [=y])
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
