Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776883;
	b=EXHzAkwYfrvQKXQUmd/RJsNzsVsTHRq991REJqq8HsW71WFG2Bzcvzvd5as8acHXx5YR
	 afp5/xYo3Z5zHj6ouqiZ1oY2jX/P1EDERS2yUqxFn25bnq13DW0AiTAnT3OI2J9yoFMDr
	 ccNa/8oeKUvrLE96dLtskTfSxRWR0lnRyqbXyRtt9DAqHlw59QBoWntJCF+ndJaYMVOOS
	 ue4d1jbp8PdIwiH953tvfM4IYW73y4nvlgt5QX0h8R2kMonpWiO4UQwEQNiEx2VTgzrmU
	 1SAP/Pmy/35cYnZxjx7SbFhoMKaXSyeEaxbAnOR1tYcukUdTWhoZ+BeaeG23e2+hgPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776883;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UgKtdGk6nxD3Wi9/QsOfwYAgEuMQPdKu5X85X+z0NiU=;
	b=Ke7Vh4uWnHqP8JkAcn2a/qa1m0KciJWawa29WIbuiqRxOY9BSfBFF5G/r1U2GxM1Tz56
	 DQBbtTUG9Yh0VFPdqHc+rx62/bTo4cGOnkrLuFkI7mpqWgxStv0EPlO8uREGjVTRKAyr3
	 RCScy2tSSIRB83wOnSaXtTmTbvktB78lAZbAJjokGChcsQxRokFN7hc7ZxWuzk0k3jlcl
	 D0UGz95KDimW24i+AbbHZ79o3N3bSiGlKxeDuJsteeOZ6FhnQb/fEMReNwI8PxsNMp5LU
	 u4BpIF1oqEsk6pw2k7ffR++e18AbgqPlqtuXBWvqgny+aYtfr81+2+60G+dzlYZHHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7P6Cm8s;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 17:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F70E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7P6Cm8s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792776882; x=1824312882;
  h=date:from:to:cc:subject:message-id;
  bh=0+fRmtddBKlRDOd8NhvyyxnigTG7Amws+mtShHYWweg=;
  b=m7P6Cm8svDWNJZQ67aNLFcqiV0kSOPYwCsW++ttk0KCif8EKzX+wbt3e
   cOrgCdHBbR7DbK8Jp/yQz24ewu9zbz0WVzBHflqRHr51Y2+ALczY8Nr48
   myfkIXQ0ufYIF8UbU9DpqkO0zhZCf8e38ySHBLjXqdha4u0l0KN6nTYMq
   fJKdX3srtpLxAqKDW4OFaxHq/yMXqynAtHH/yV0/LXA6X+EbA/hHdiNA6
   0+GYS/+Ip4h/vVrp9JGoTM1FmzQXtijPsud/R6KkpqkllNe95UXPScq6t
   L9cHOBdCAGZj9LdjOO3dEK6cNytQMhU3AjsbLQJRkO/Flzkr+GoDpr8tk
   w==;
X-CSE-ConnectionGUID: vk+iq3qqTyCkPd8YmeT+Ww==
X-CSE-MsgGUID: 4Q+q9MnPQR6k30kWGTLv7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1530586"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1530586"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 10:34:42 -0700
X-CSE-ConnectionGUID: zvkZXqXbQT6N0JSLFoTJ9g==
X-CSE-MsgGUID: hGVJpI50TUyCI/016gAIBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4040635"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 10:34:41 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKJA6-00000000131-3MQC;
	Fri, 23 Oct 2026 17:34:38 +0000
Date: Fri, 23 Oct 2026 19:34:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 drivers/vfio/vfio_pkvm_iommu.c:76:43: error: variable has incomplete type
 'const struct vfio_iommu_driver_ops'
Message-ID: <202610231952.Kn2UX3Bi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   ad91d8c494f612786c23b24dd753cae0dae6ef73
commit: 337160d05cbaaafe908f46474201f35f91da567c [1/1] ANDROID: drivers/vfio: Add VFIO_PKVM_IOMMU
config: arm64-randconfig-r2303-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231952.Kn2UX3Bi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231952.Kn2UX3Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231952.Kn2UX3Bi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/vfio_pkvm_iommu.c:76:43: error: variable has incomplete type 'const struct vfio_iommu_driver_ops'
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                                           ^
   drivers/vfio/vfio_pkvm_iommu.c:76:21: note: forward declaration of 'struct vfio_iommu_driver_ops'
      76 | static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
         |                     ^
>> drivers/vfio/vfio_pkvm_iommu.c:90:9: error: call to undeclared function 'vfio_register_iommu_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         return vfio_register_iommu_driver(&pkvm_iommu_ops);
         |                ^
>> drivers/vfio/vfio_pkvm_iommu.c:95:2: error: call to undeclared function 'vfio_unregister_iommu_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         vfio_unregister_iommu_driver(&pkvm_iommu_ops);
         |         ^
   drivers/vfio/vfio_pkvm_iommu.c:95:2: note: did you mean 'vfio_unregister_group_dev'?
   include/linux/vfio.h:301:6: note: 'vfio_unregister_group_dev' declared here
     301 | void vfio_unregister_group_dev(struct vfio_device *device);
         |      ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for XFRM_OFFLOAD
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +76 drivers/vfio/vfio_pkvm_iommu.c

    75	
  > 76	static const struct vfio_iommu_driver_ops pkvm_iommu_ops = {
    77		.name			= "vfio-pkvm-iommu",
    78		.owner			= THIS_MODULE,
    79		.open			= pkvm_iommu_open,
    80		.release		= pkvm_iommu_release,
    81		.ioctl			= pkvm_iommu_ioctl,
    82		.attach_group		= pkvm_iommu_attach_group,
    83		.detach_group		= pkvm_iommu_detach_group,
    84		.register_device	= pkvm_iommu_register_device,
    85		.unregister_device	= pkvm_iommu_unregister_device,
    86	};
    87	
    88	static int __init pkvm_iommu_init(void)
    89	{
  > 90		return vfio_register_iommu_driver(&pkvm_iommu_ops);
    91	}
    92	
    93	static void __exit pkvm_iommu_exit(void)
    94	{
  > 95		vfio_unregister_iommu_driver(&pkvm_iommu_ops);
    96	}
    97	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
