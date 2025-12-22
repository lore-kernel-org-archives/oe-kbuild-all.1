Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1131E0EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410826; cv=none; b=rjh09lRvB/eurC3x8VltZ7cJO00ealt+KrW+LH2Y+2UwskNdIj/Osler/+mA0ZT/A+2vV9fMB6yBlxqJuqB6pW8+iDrKYvI8O1/pvWsS1D31z360FK77BhoFTZgJ8Sfb31YaTenZAussDRZRQwdgrEEzwpaLcj1U0HBGYyXdN4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410826; c=relaxed/simple;
	bh=L26kV4ByZA4UIKGp0MpzynXvKT+Cb6/ZqERyQSTVI9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sivSAvAK6Cg1bHs6YU+arWWQpe0HrBzIcqFCFOiwE8yxLqHi/DFMOt8MO9MQojlguKDyNk+Tn89IqsJrUeueALjLae1kDKUATlSZlSZQSaEsQIw8nSnScBXJZCcVukzDIMZJDkup+E+yplxCaKwMgVcjGbK4QXKCyfe0BggWqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3rzsYf7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3rzsYf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766410823; x=1797946823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L26kV4ByZA4UIKGp0MpzynXvKT+Cb6/ZqERyQSTVI9s=;
  b=V3rzsYf7nbVmvn3TP0YrL72uT3NfdMSM1a9v2HFK6WeSQrpSuYsAOxZe
   HXBRzctL4EMjClcEFs3SmiHkydxVHlci7al8+5774t1C6Nf0T5Ngof0kf
   5yBa3sHEUWQNCdZWsWPX77bPYG2EHfIWoLSjeeZ7mCWa8HSO2fdvIb7mu
   GJhSdcXbstxBsuYD950+3x0IwyBC4utbXP0lUwgIWiz97pXmnN73Qf1jK
   8lXF68AFxF31lffZa/4P1rN0irjnlaMSbX73cvHAuN/PyPmnNF9J/IREG
   HoiAwSe4riQRntbx4PDQiDHiSk3TjOyqsRGIf8WXK6CZ+9TZCGK3opFj5
   g==;
X-CSE-ConnectionGUID: UcjWCs+uTcOl82v/Sw4dAg==
X-CSE-MsgGUID: ZK6NrJfzSVmE7x5qkMAqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68202177"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68202177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:40:21 -0800
X-CSE-ConnectionGUID: ymUSDK+bSaKu/0cDdVO5Lw==
X-CSE-MsgGUID: SKHh5FTZRMGUMOwCJ5iJlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="223015124"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 05:40:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXg93-000000005Ua-2DXz;
	Mon, 22 Dec 2025 13:40:17 +0000
Date: Mon, 22 Dec 2025 14:39:47 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for SND_INTEL_NHLT when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202512221412.S7J5xtwx-lkp@intel.com>
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
commit: 759fcb59aa96777565c1bab265491a77a612fee8 [12/12] ANDROID: GKI: Add SND_INTEL_NHLT
config: x86_64-kismet-CONFIG_SND_INTEL_NHLT-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221412.S7J5xtwx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221412.S7J5xtwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221412.S7J5xtwx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_INTEL_NHLT when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
