Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C740A958
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751380; cv=none; b=uuahSIH7RSR3a2dSrkludKA4FiDpxVBDJz2lgMsxGsbJxRPC6MpaUg9znn7FrJIqVo0UCS6rBxdaAoWHjYAhZUirVRXP1HTiZO+otNH27gzqjeA5r0hI7TUQK9zhH7NX9gfcHAWjwkAyCnTheg1H5kEw0GsAf9Ukuz+bYaj1bsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751380; c=relaxed/simple;
	bh=WVTIWjZLY4gTjwEMp4qSwLhliKSyZYCj6rmbBDe9eO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SXl33CBpqSwqT3eH5FVgzo/ZWgTy/x9vhD93ghrSUeK97ZAr8n7juIsGFR4P0k/satR7BpQeLDLjGkhUmwcifPiki0YOOQ9F4dNAg/HsztMX1JwrfpdcHxPmzGzyY0BFtQKbCcQGQ8rH7wbf5q7L7eyJqB0dCMsroy5A5R8VphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nclibsda; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nclibsda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787751378; x=1819287378;
  h=date:from:to:cc:subject:message-id;
  bh=WVTIWjZLY4gTjwEMp4qSwLhliKSyZYCj6rmbBDe9eO0=;
  b=nclibsdah9DVb6uSEJc5es7m3Y0T9LKp/+mMh9WdqM9EtTQyIW0UNqN3
   WUdRrLeyZC1kQtq2qDZ8Njml2Gw+qk2yGOh8OGAd3SMdWqfse/NJ+vNR7
   HoIc09kBxW8bCmHEa074bJe0VSNSYVPAlIV8pjcOXO6x8DITv7j8JeRdJ
   2is8NEx9IC8EPeMd+0+b/vR18TViMEOk9Nu9F8PLMKQ0RmIdB09nJPTpd
   UcqDjm1f2hZlUM3FxBija6sZYweVXsQjz/MVyPCDHaMWn9PepgLJuiave
   UxesGiut3oznSuiI9g+32NGYAivZM//6tePBM1FyI6V2LGzVYXOjVb+Su
   Q==;
X-CSE-ConnectionGUID: SPugZgrGQoSTZsuDEwMPWw==
X-CSE-MsgGUID: 6zaL0v5MQHaT8nz7LbkOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88151932"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88151932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:36:17 -0700
X-CSE-ConnectionGUID: HEiaGYN9TVq+/HgCMse4yg==
X-CSE-MsgGUID: bacon9FPQBC3tBuysV92lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="264979426"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2026 06:36:16 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzDna-000000000Jp-0yq7;
	Wed, 26 Aug 2026 13:36:14 +0000
Date: Wed, 26 Aug 2026 15:36:04 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202608261543.31IRG9Bc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   624994dfdb395b0071c731f6940cd7f26df5979c
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [6/6] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: x86_64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261543.31IRG9Bc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261543.31IRG9Bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261543.31IRG9Bc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
