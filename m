Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88AB347500
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813145; cv=none; b=RinwBJumr4eSXiyvaf7iToDJCpTJWDhjE2SxK7laGw62ka/93TcEiTPTvUDGfsntRdxymXMyLqvAcseOaHAZ7DoJoNtIdY3BqVVMxcjuyGI/h/0OSLExWJGLnzBaC3zKRZ/lBYG33xRecE05BF7rnsb2qs6Gb3A3FQPPGOcyHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813145; c=relaxed/simple;
	bh=ExFoleg3VNZ+BrsLpKWFlZcp5hez2Jro9lgLnaHBJps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ar/M4vbLqFPEUBpQIuWp6UGAjGTVCz6zPdk8GFO/aQQEUQkOXnC2lQJGO3pp0DPnYVI+s9LOweo0XDr3u4Ec+ctV4NYXRkQZktZlPPoQLLsI4rJVSjrekszzgmI59FXMOurrQhs/iq7LuWH+VOxGqDSBRxXoghRJu0YgNQSNi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRkKn0zp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRkKn0zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787813143; x=1819349143;
  h=date:from:to:cc:subject:message-id;
  bh=ExFoleg3VNZ+BrsLpKWFlZcp5hez2Jro9lgLnaHBJps=;
  b=eRkKn0zpnu5J3dklhNO2pmhTgs3PRW/cJQedz4zy4ffQzDardUb6/zz7
   NeO0DdX+Iaf+5XRpSgzpLylpRP4yiINzcItyXdJjJ8HSN86folcbgOW9m
   QRFVIiIt/pZlicMVVf84JEALAzfH2w6i4KCjqxNYV354zUAcORp4CgnXV
   1JOB8HQSrRw8NUUpMeMnm7/tOl4izNtyjzGS9Wkscz6j9Y/rzR7zi7lsJ
   O+ZGzWKvE6oOxtGPP2Ew/0fhTm7oPABnBtmlnBPQbnco5MZEdMzYJ5Ygx
   uHaWM5ABDZH87+WjXD8L9fAlWXUIugtHPkscYqUeuSXmgy+6xMY1dW3bv
   w==;
X-CSE-ConnectionGUID: cs2Cxn7AQWm4Kt05+BlW0A==
X-CSE-MsgGUID: rVDXB14USFigkMyxzA3nbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92123080"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="92123080"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 23:45:42 -0700
X-CSE-ConnectionGUID: 2XV4y5lzStCc35sBaKnh9w==
X-CSE-MsgGUID: Bbj/WRUPQMC20pZp6iirag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263514945"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Aug 2026 23:45:41 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzTrn-000000000jd-11nE;
	Thu, 27 Aug 2026 06:45:39 +0000
Date: Thu, 27 Aug 2026 08:45:18 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for SND_COMPRESS_ACCEL when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202608270820.ckx4jeus-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f67745b7d96806e622db56f4be97af16d6e99850
commit: 55670275a4b2f66710da9f3c902f4af3e3474943 [6/6] ANDROID: GKI: Enable SND_COMPRESS_ACCEL
config: x86_64-kismet-CONFIG_SND_COMPRESS_ACCEL-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270820.ckx4jeus-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270820.ckx4jeus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270820.ckx4jeus-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
