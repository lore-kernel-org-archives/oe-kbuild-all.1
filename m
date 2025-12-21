Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6EE6FBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766350992; cv=none; b=OKmk2g9qZJiBgYC8a/LGH0RYrhx4ySHtq8l+oTSqZrbFVR+Z6jG0N+OnYakxp1StFnc/M9c5x3GcHjtKcKHFtPX229CFxaa+/wqzI+qMZOriPGcJtMIZ1BaMOAFfA6EvgOOykMi/ilrpt2vLx1iID42u88QzQw9gsRoOvMz6ido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766350992; c=relaxed/simple;
	bh=Tn32Df6L+ScJpVdhUlMt4je7G2PxFyspnJgPIHP/bcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1KXrm21UpCzRJmA+TEBg0J99hb61GIAlqsRgRJYOmJn00L+qASGqmTWQm9oKmWi8aKCVHLmb2vUDJ3nAuVTbM8ffqsdCDdHj1iUZJMipYvyqnd9k4neVjciE7HilvMqITptUGWqFxVD1xysYqRykph4CMJYLI4CRpTt5zfyNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRQtk57q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRQtk57q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766350991; x=1797886991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn32Df6L+ScJpVdhUlMt4je7G2PxFyspnJgPIHP/bcg=;
  b=hRQtk57qC1dt2gJR3olDpHyf/MFaEp5Ad9binbmjcgQtsoXSu70WyriK
   Clv2WY5uyfbTQLMh3dIXlx7ZfoC3WK1TMxnwgIBiS3ykcRuCFSusFRNVv
   7QxZQBC1psWcw1hW3FCsPme6fSjgCTYdkj48bBFsFtq46elZk6foiQSjf
   KfJ06rnpL0/fOZCPCZW7U8TcmhxmWLxQBfsHUxsYZC2Zcg+h0JEFOjUlo
   hg0u2Xl9bZzYNCGrfbXkm8ussO5WDDupCIVLAapqJdSWOsbIapeYHiPKf
   GRIwsm34Vy63G7aaWHl7S/UL9wGSKwfC+4rTo38BFixk9jwCYRHoCySzC
   Q==;
X-CSE-ConnectionGUID: mYu6RTj7QCWQO1h37uW7+g==
X-CSE-MsgGUID: cXFhzHxVQGC4gMXiVpXSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79338766"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79338766"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:03:09 -0800
X-CSE-ConnectionGUID: jis1ia4ETjOy1FIaysZ80g==
X-CSE-MsgGUID: A1dCQMwhSY+GUuM3v9Edsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199884770"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 13:03:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQa1-000000005Em-3hHB;
	Sun, 21 Dec 2025 21:03:05 +0000
Date: Sun, 21 Dec 2025 22:02:47 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_SHA256 when selected by
 INCREMENTAL_FS
Message-ID: <202512212211.NQUf9JuB-lkp@intel.com>
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
commit: a95005100dd1e4f70c4fce3abead12cb5f1d7b0d [12/12] ANDROID: Incremental fs: Remove unnecessary dependencies
config: x86_64-kismet-CONFIG_CRYPTO_SHA256-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512212211.NQUf9JuB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212211.NQUf9JuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212211.NQUf9JuB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_DMIC
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STM32_DFSDM [=y] && SOUND [=y] && !UML && SND [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && SND_SOC [=y] && STM32_DFSDM_ADC [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_LIB_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - SND_SOC_CROS_EC_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && CROS_EC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
