Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653B7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 01:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHUA//tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702085624; x=1733621624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uyl5n1sQa6+EKicT5d14VoZcFDsczSgY7/zpK2P4yvg=;
  b=DHUA//tpMIjkd1OmBj4AGs4LUM+SlCvrFNpn7DWMcFs7nUAaFu382GkP
   5gQXetQt6F2rfomkFiwZr4VbMdiCar99GOO3XsOX5+aDtLgZ9qwaCxulO
   Oh2LecsMR3R1Xa1AGysLSVMF4er9HCgrtQgmP82WdDbUIkghMRfRdeej4
   zY1NE0Rhp6PJBG3TJngQTOqWFO8Fy2f9uYiNoTgvNhaY2HCCJhY1zpDS7
   iScK7vjgneRjRqbkilkdcLWbNeT3JV1gY3wsy/067HxKvHKMa6RaIa3p7
   GEPT/7jhSlKQ6yl6sMuZnrMblMDTk+64OjlxiVelPbIZhedDe1m9HNI0d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1361995"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1361995"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 17:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="916144023"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="916144023"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 17:33:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBmDs-000Edl-0d;
	Sat, 09 Dec 2023 01:33:40 +0000
Date: Sat, 9 Dec 2023 09:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/2] kismet: WARNING: unmet direct
 dependencies detected for INTERCONNECT_QCOM when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202312090942.6lhtxq2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   804ee293f248a54af987ef834785e45fa545f4a0
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [1/2] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: arm-kismet-CONFIG_INTERCONNECT_QCOM-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20231209/202312090942.6lhtxq2o-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312090942.6lhtxq2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090942.6lhtxq2o-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM when selected by GKI_HIDDEN_QCOM_CONFIGS
   
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM [=y] || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
     Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
