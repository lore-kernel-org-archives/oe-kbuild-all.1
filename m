Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67700231C91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756591805; cv=none; b=m/eVGPkHe+DuH48NXVRA74b8xDpOzfcZhs1sawTzDyLqc/p+FnrL1ybdh4wn+0sDJrMCIJzcSrkqGR8noPRt4im8PDnQhbbG9wZmbmnLv0Bt4J6/HUr92GIR8nQn8fLDc/3Np41bC79zj1lpsjEknovwrzmbq7qpo0XOoXSuRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756591805; c=relaxed/simple;
	bh=t8hwzsDau1jGuAcqrIc1tdaoEAOr6NdcoVaRdP/uLGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rzn4q2ZgvVCxNBZj33/tCDXKfisOultzTF0P1VGti/6UqewI/YSwlDk4DoD+zX8JZ5FavvFw7AhX4L6EuneckUzZC2fNlIVNk8HrIQEzob4SEWThy/zdaaKWUS6t7fw6AgD7fpQM5hACK/cbm6jzQLp4Pv9ZYXx5GQD/Js6fRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fofaAg4O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fofaAg4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756591803; x=1788127803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8hwzsDau1jGuAcqrIc1tdaoEAOr6NdcoVaRdP/uLGI=;
  b=fofaAg4Ot6oAglpV+v2evN03KRFxelZ+BbecjUMqtD7/mf29i2djcQNC
   4w0+PD4Orgas0a33Com8Y2uHH0s5NWssV/CJE0slOTZ1SvGAt+SGn1zPw
   zBRtGg8nmf5+rvxDc4kAdphDz4P0wHVxELwn+pmpPSXgqAzYqrnPmKp9H
   3tVasTkeu2462V2LT0bSEGwgrdW/3mbz6zqzQQg3L5LHVbz3nTEejbRpW
   bElJsbCh+lISjeg/sqmRq2Kc1c2fZOTQnGJFmlvwFdoAN/YbHl283Dy7i
   24gJXcTMX1/g4pcRxu17WtW9x34ZFLchLOET4e16hMVvip+6OrgdAHs32
   g==;
X-CSE-ConnectionGUID: /WNBnM3rRnWrdsp7u7S1qQ==
X-CSE-MsgGUID: NGAtCAumROCpo9qxYSJIWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58788260"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58788260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 15:10:03 -0700
X-CSE-ConnectionGUID: SYOVRlJkQkaEwmWpN6rZLA==
X-CSE-MsgGUID: UEnkhFNyRIO/B1kcRr2Ytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171039534"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2025 15:09:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usTlk-000Vin-04;
	Sat, 30 Aug 2025 22:09:56 +0000
Date: Sun, 31 Aug 2025 06:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
Message-ID: <202508310606.VnCCH6pS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: arc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_IWLEGACY-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310606.VnCCH6pS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310606.VnCCH6pS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310606.VnCCH6pS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=y]=y [=y] || LEDS_CLASS [=y]=MAC80211 [=y])
     - IWLEGACY [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y]
     - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y [=y] || LEDS_CLASS [=y]=MAC80211 [=y]) && (IWLMVM [=n] || IWLDVM [=y])
   
   WARNING: unmet direct dependencies detected for INPUT_SPARSEKMAP
     Depends on [n]: INPUT [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
