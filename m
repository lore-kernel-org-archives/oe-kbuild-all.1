Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79122253351
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740003247; cv=none; b=vDNT/oql7Lwnmd0XDO0t5+5fb3Pf33hBvIENXuPmykuTze3MaM1xCgV/iGrLKE5HwCDClhDjy3ibgiMBV2m0PXi84htPMk7vhWA9TfvqYZmZ3p8juWZNaqT0aFc2zAx4CwuhjY6C1OpG9WM5nZlDYmj1q0UB3+lOTBgcC49/trA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740003247; c=relaxed/simple;
	bh=PO7yOcciKLo4uiIr5cPeahu84LOhKYsKrNHSV8MaRj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BX7M36Gcn1eIuIPe2XW6emG+7pkHU2q1c/FjqsiumuQumvzc0ZILwMvjaaquPOaGbbJRoSJCuK6Jz08BWoqlUKZwuKSOH0EPPUrs9xYBrYmuFS9HEl9LCnY0++oHl/wDGYIGrttjEKmd0/ev12kHs89bKda98XFDB0XAmv+o0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMleW+Fw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMleW+Fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740003244; x=1771539244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PO7yOcciKLo4uiIr5cPeahu84LOhKYsKrNHSV8MaRj4=;
  b=bMleW+FwFFU04cp2oB681+ko7SEMGStKEbngxZ3JkmjUikN6yqvlBBmo
   FQ5oywBXNlTEwY/59EV6THsHCA+o17lVNxzdGz8pT446pGrpifihm+YUZ
   ACA+t1ZB4MY4Lo99sYnz5gqkprhcV0jY6YKw7JXk1MBOGSY52KvNJgJhg
   svD09ZOQA83IJSlwdgmbM0kTbss14Iiqzla/BGu1TiKholgq8q4Y03okj
   h4HIPGARP+Xc2EiSH1BhkhLOfV9lPveSlyZ2aKkFACsEJFK03D4Fp4Bz0
   SlaogS+n8ig08CHs2SB/+rNxZypjjnb0YEYO+qHVLOzt/549MwYeja0CM
   A==;
X-CSE-ConnectionGUID: oNHAEAPhS1WnM+6vLaw07w==
X-CSE-MsgGUID: d7j+j9YwR+SMgWsW+J740g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40684080"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40684080"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 14:14:03 -0800
X-CSE-ConnectionGUID: 4dCa7uGlQVu3s/gbqQWPLg==
X-CSE-MsgGUID: bivxYPGNQyizh0BwHzrS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="138047701"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 12:55:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkr5t-0003T9-1q;
	Wed, 19 Feb 2025 20:54:57 +0000
Date: Thu, 20 Feb 2025 04:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] ERROR: modpost:
 "v4l2_m2m_ioctl_encoder_cmd" [drivers/media/platform/allegro-dvt/allegro.ko]
 undefined!
Message-ID: <202502200451.nhUxIba8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   df6f686ad391ff4f857a7ee9bd60c44c27ecd78c
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [1/1] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-r064-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200451.nhUxIba8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200451.nhUxIba8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200451.nhUxIba8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "v4l2_m2m_init" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_encoder_cmd" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
ERROR: modpost: "v4l2_m2m_last_buffer_done" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_expbuf" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_querybuf" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_queue" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_fop_poll" [drivers/media/platform/allegro-dvt/allegro.ko] undefined!
WARNING: modpost: suppressed 288 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
