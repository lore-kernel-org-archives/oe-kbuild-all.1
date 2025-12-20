Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D441E2606
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252808; cv=none; b=GXeGKU8PvkOheYgfjTJII4l+gTNvkUvEkLDeNrFlr7v/BSTfosYcuOB8vVHfMwR6HcvXnYdphVfw/dsT13hV2yuUaj1z/O4uEZrACIdefRSTu0wwx/N1k0FAxtV6ERmojyncBFmTaZGyJG1BVueK6OXiNNV8prCN0xr/PEIqxxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252808; c=relaxed/simple;
	bh=2HCK7U+HqSDq/h3jl9cW4lcZS+ia1UR54vdVdBd2xm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mh40gNHXCUqr2vI04Zs/QHfUKexn7HPmWcCSzAmjT+nDwwV5Uc7E0H3AfR+4GMHm6uecpsROGhTPMxeJ0qUWuIq60ky9oMe5MbZkoRldqBc6cPGFl+WU/5RhSpyU5GUUPRt0+jZR9a/PVDAwhfio4fCEyXZufRIqTBrpT9sry4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIzM6EMX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIzM6EMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252806; x=1797788806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HCK7U+HqSDq/h3jl9cW4lcZS+ia1UR54vdVdBd2xm0=;
  b=aIzM6EMXHNHvZ5rUpN2TsFzvabkx3839wnBK4XT1fnXVPZ/HTPrqXm5a
   5TKvqGoqMv7S3MxdsYriBTw3gzzjhOAoXa5oPZ8gOWWz1x6f6Lq2tQ8Ew
   vmaNxA6sDexJyTqas/PtG6ujh69nNzto/CLQf65CIK5e7fAvFHOhUQTKi
   6OqaSE+JNGD4e+eLP9trIdJVOgRouFxfn7aYL0v8vn8hMZYxxn7jv8s4U
   Qu75BuE92p/shDIsv7uEc+ajDsuy838n3RYtYIO0vFNe5dibclTUfBMq8
   e/Z9B8/X6oTWrTnoEJ4lDF5Cv+H/lnv/XsZ8oQErfl+Sl6u1KA0vMD5z+
   w==;
X-CSE-ConnectionGUID: m/1gd3HuRG6kRUD8HpDssA==
X-CSE-MsgGUID: JAb4ndDHRNCOGkNcnY58cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70751742"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70751742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:46:46 -0800
X-CSE-ConnectionGUID: KoweDhyvR6aqHYTKjGfNNw==
X-CSE-MsgGUID: t0zWgyMqQmyTV3y7XD8KPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198893930"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 09:46:45 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX12Q-000000004j2-2QSc;
	Sat, 20 Dec 2025 17:46:42 +0000
Date: Sat, 20 Dec 2025 18:46:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] kismet: WARNING: unmet direct
 dependencies detected for INTERCONNECT_QCOM when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202512201832.cpsTAXU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8a0f08a5606260a0680a6074ee5392a57cd3133d
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [4/4] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: arm64-kismet-CONFIG_INTERCONNECT_QCOM-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201832.cpsTAXU4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201832.cpsTAXU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201832.cpsTAXU4-lkp@intel.com/

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
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
     Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
