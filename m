Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455AC33EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349405; cv=none; b=RVDNiWJyrMHDuuXfCNLvOTlFkTrFDvEuFYivc3GrnjjY893v6tOSoZo7Kl+Qj/TIXiMalW4Cd5qCwott1DunoHFmrVbnntxOgVuTDKcCA3VsdREr9e0Wz/FJsxItUatTOLW2hsJEXN2f7rEpL1xu8463VzWEWracuE1WKknhO3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349405; c=relaxed/simple;
	bh=NrE+xnXa5BdqU2z7wvWi0YfsaWcTI7jwvLhxkKDhA14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jPPzFhdyABf3hgbIE8C6VzE6jcz6FB9hQ8QPjygVXM1RTmM/aPWUDDmmiq8RslMBS0VT1HDKwLaOs32SOW3NMt/tEe/YFARgHxm6L/pYdobC/3pRrFpiytFYqaBmwbxA4Hdpgnp6uOqL5uOHcfzSNTcWOR0laG4fsaRtk4j3Hm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoRIY67o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoRIY67o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751349404; x=1782885404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NrE+xnXa5BdqU2z7wvWi0YfsaWcTI7jwvLhxkKDhA14=;
  b=NoRIY67oaJ0ufx/x3pTXJN47h0sra8BEp7nO2CxuagUZp6MNUaFhdvP0
   0+vcuIVelQvUk4S3yVIF1eSlh1FTA+haUbjaZFn1OCPWyf/3YApNfvKdK
   MoESGsq4ZL5Q7/AdE2U6OVdG3qcjQpyvpyP7MMEyjGTzA/CXiapaoK6ky
   /IbFu0+Lxqop4MXjOGguhzQ5FvkLSp5KNdHzVB9RQJ81IQNEOMIPI1xk6
   iB+c+VVLoDfgv0LyHjiNbAHwfY5oMGR9Bc8kkeQWeOvb03Yb5A7NeRD1y
   QOLcGg5nL8q3Uj/CRQYU9HXF3XpcK1ul/l3VcfOrmNhjUTa9OAQSK/S37
   A==;
X-CSE-ConnectionGUID: 6yLIuAUiSPqvOknv9riSqw==
X-CSE-MsgGUID: F4ZOS+aqRWK3rtF5Sr0hpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71021215"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71021215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 22:56:43 -0700
X-CSE-ConnectionGUID: Ik+Egs91TUy4QhEHrHrqdg==
X-CSE-MsgGUID: SNtLYOrJSuGJMvFtE0pgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153973428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 22:56:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWTyx-000Zlm-2O;
	Tue, 01 Jul 2025 05:56:39 +0000
Date: Tue, 1 Jul 2025 13:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 440/440] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_MSM
Message-ID: <202507011337.pBvwjZnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   9262077f7dda6a5ced992027f566118fd18e154f
commit: 5edcc7517c2a97a1bf87fbe00aab8321c760f11a [440/440] ANDROID: pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
config: x86_64-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20250701/202507011337.pBvwjZnf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250701/202507011337.pBvwjZnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011337.pBvwjZnf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
