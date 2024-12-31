Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39917346D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735633097; cv=none; b=dE4xIG3afuCF1ixQZ61KXMLW+1xZhgpZRPTtDvwWF2x3RDlgMqQBJPiA3PlwNs1avNjXhIExhNvHLUNrrzEJCDYH0ql5QT26/VQ68QRxHR25OO96UWxXeVi7nmMSoTxEnWb/1UboZZTjVHHI9W0M58J+2rX8aWQnkVMU1xTkhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735633097; c=relaxed/simple;
	bh=vhpldAKfgSlVdvX47jE6i0k0pHB9BgK7yIzoD0uKwh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WN75pupR6YUbRiz09o1+P4MxhkBJ5KXarOUDvj9IB/BO6NRYjVnZoICOQ6QGgReAfWORZ0JttEOAmI2RDTdKikxkrGd5ovXjw8N2jytQro61fbcmmsIU6rjyobiLlasUqKD8eihqI9crYnQYzIv8LyPNuJcepChrh1gcDon4sio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X30cM7gA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X30cM7gA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735633096; x=1767169096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhpldAKfgSlVdvX47jE6i0k0pHB9BgK7yIzoD0uKwh8=;
  b=X30cM7gAbX1pNamDjV44tJrO54gUirZIxZ78Kye85ns0eOLs+pUnfDbh
   l6mB+RHYB5EuRrsgsjQ6OmaRtIzImXNDRHtV34vKkj4WR8HrkJZXn06no
   eTlBSfor30eBDqhlhsfVxUVjlMzVqHtvXcWydm3x2Klg8NTmjOLIVdO4p
   G6E6eNe2Yl+AGbP+ofUfu9ywd4nLkrYq27j96JtFvdsHWBBAs1RqS7y9c
   eWuHu5CM8ZphMAVeoDUpEdltQhiEXz3e/lV2qrFXrcmI1LVEvNW/jqJDZ
   gijMy6Z4QOlm1hXxegdJSDBeIwTxPVjW8ZES17lCLf32BzSRsHLnqiKvA
   A==;
X-CSE-ConnectionGUID: ZFcMBfSQSDSYT4n8O79g3Q==
X-CSE-MsgGUID: mg5BOnCwSQCAE4aEOWnpZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36072993"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36072993"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:18:15 -0800
X-CSE-ConnectionGUID: XaaQjiHcQYy++is83PJ7lg==
X-CSE-MsgGUID: h8mMOwwUTeaSe7YQJplQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101485566"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Dec 2024 00:18:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSXS7-0006xv-1t;
	Tue, 31 Dec 2024 08:18:11 +0000
Date: Tue, 31 Dec 2024 16:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype
 for 'pkvm_smc_filter_hyp_init'
Message-ID: <202412311632.sjDz47iL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   69b3c870d0b8d800f7140a73551a9603ccf67c93
commit: fec28c0f19050ced22791075319327fa416f30a4 [2/2] ANDROID: misc: pkvm_smc: Add pKVM SMC filter driver
config: arm64-randconfig-r123-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311632.sjDz47iL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241231/202412311632.sjDz47iL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311632.sjDz47iL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
      10 | int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/pkvm_smc_filter_hyp_init +10 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

     9	
  > 10	int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
