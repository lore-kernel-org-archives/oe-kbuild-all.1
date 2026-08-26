Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482AA1B4223
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761291; cv=none; b=UxWRDq+MtcdFDC3Q5gw6ERSi0jL0iaxVbj8dV3fseKXAJxg1P56Ob4Z/c61qHmUoiGmgshTP1HAc+PvICc6gKBFyCyjDzIdpB4L3hefLay9OHHE+++QLlYIzCnTS31e1OGHHGum2+6GcR1AZK00o+oIRUKoNFLlJD6MxB6SBVtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761291; c=relaxed/simple;
	bh=p1yLteY9FsrXeRxmGpWI4Tdwj7fcGjk2LI8ZyVRlnKA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PpUwPCoe0taSuWxozHwR9f0eooXT2wFOYw83PbCsMlaJ3Au4ZbfmTH5bNL3oakUDjDq9rAuKgdGdreDcY8siJxmVSrLfCtwNislb1aFOqKtMYyqpY5HxnTioj/Id8CC/EMIkPmaPv8WnCqGeg/1pjeEj41Ut4geQiUTMGF1i8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nerZhftN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nerZhftN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787761288; x=1819297288;
  h=date:from:to:cc:subject:message-id;
  bh=p1yLteY9FsrXeRxmGpWI4Tdwj7fcGjk2LI8ZyVRlnKA=;
  b=nerZhftNHzHrVYKv713PlBPPEYKkQxMHeU6cBc0q2YTBn9ESm0wE94gM
   FnSthq3NCDlgKVushsjhY5Gc9z/m3v0ULbWmXY8gzT4vYkIVWPY63dpWi
   qN6StQ2bh+EswRw/AD4yQlHudWuOJCwHFSkh//4xEYkGwogV3ec9Fhfv9
   vOCWGGBYx72z00cjVexNoKBL4Q12iRup4MLQC6T9QP8x+TpU76VO/rqEP
   QUQ1f980PIY5CCunFTu3vtMHoT7t/gJfQF+Hvp1ywVrog9EvEc69+WJS9
   PqwtJ4w5yQT8VE6LryDP89bnhKAIJlORqxALPctNecSBxQsvt44XhXJ3D
   Q==;
X-CSE-ConnectionGUID: 8whg1lXEQ/2VKbxHpuRwpA==
X-CSE-MsgGUID: pAYjbJryRJKPtbVFozFDUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98583610"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98583610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:21:27 -0700
X-CSE-ConnectionGUID: ibuFVMAmQTiLvgLR0y8AiA==
X-CSE-MsgGUID: 8FDgwch1QbSWWG6voOrDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271424882"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 09:21:26 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzGNP-000000000XJ-2J4t;
	Wed, 26 Aug 2026 16:21:23 +0000
Date: Wed, 26 Aug 2026 18:20:26 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202608261840.6rVbdjgv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   97c6de407fa22bc729802f8a67bf88699953bcc1
commit: e3307b7f3bb21206b109ac721449d36269d095e6 [6/6] ANDROID: dma: Select CONFIG_DMA_ENGINE_RAID in Kconfig.gki
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261840.6rVbdjgv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261840.6rVbdjgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261840.6rVbdjgv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
