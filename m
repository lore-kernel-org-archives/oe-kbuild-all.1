Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3303C1992
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779712; cv=none; b=Fv2DNBTlabEgh5IrwbAyNj/cqVITI7a8SdNkk34HeGN7SfDa6p1/muegttpbL3R+n7Eoq/p+B9Ctg843nTIPasOYwk7Ue+giaWlft9mmXUsTLTsBVrJkRHd26hoq5VIg4dYaGzH+9nefhhm1hCCmR8a7lVAdPm7UVKslKuY9gI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779712; c=relaxed/simple;
	bh=/SW2kbjyIi3ivDLIKajF1QR7pN5AQrYB40XOEljdwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gc0QXrBNkNI0PSPgp1WZ4Bd70yiR3LvYe+LOEyEIy3R4SqR5cvY3dNRYDBlwnk0NdNBp2UMbJcwy//MYYuo7M10+f/ZS0t33aZmYFuOdPT2cbhg6wV1EhDTol+iXqvcrEXLOUOVkKszn5SPo48GmdXiB37bLjvfoe+avIgSWf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO44UvbK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO44UvbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787779710; x=1819315710;
  h=date:from:to:cc:subject:message-id;
  bh=/SW2kbjyIi3ivDLIKajF1QR7pN5AQrYB40XOEljdwRQ=;
  b=QO44UvbKmBh5eEthEXG+rFofK5cqZwrKKeD3VcbGwlz1am5LUQ+Qna0I
   JX6xd2E54AB85BE8m+XJW2fREsRGNFOy0pVk/p/QIvV6TulVR1TcaQJVg
   5zJVaPwGaB27pzJFKzWOI7us152yWuru+Ygct8dtS87WnrVONi6tW/czH
   kb8k/Ih5PSpuKnZYxMICoZrkrj2Ak77sZ1QzKq6EUnZAELGwZfIiF3qss
   CUrCBee4SwV9wwVy00wzuD2dJUumBrYq2F1yBHZf67Z1MNuJ9plcqXrIj
   C/+scynsolP3YTImceYwFX9cgRXn5zOroxAf+eKb8ibMTXi/QLFw5ps39
   w==;
X-CSE-ConnectionGUID: G6/+L9KNSDOrD0onPSTYyg==
X-CSE-MsgGUID: YYDHUU+rQ6SYiOPzEuj9Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99433644"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="99433644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 14:28:29 -0700
X-CSE-ConnectionGUID: tWqRjG8ARCiHBEtmbYkSkQ==
X-CSE-MsgGUID: 2nH7ABYjT+mJq/OT1YIGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="305908383"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2026 14:28:29 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzLAY-000000000aD-1IYQ;
	Wed, 26 Aug 2026 21:28:26 +0000
Date: Wed, 26 Aug 2026 23:27:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202608262321.UnVBGzka-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d8341b8849fc866938a185ec0be05ee3d071704f
commit: e3307b7f3bb21206b109ac721449d36269d095e6 [6/6] ANDROID: dma: Select CONFIG_DMA_ENGINE_RAID in Kconfig.gki
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262321.UnVBGzka-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262321.UnVBGzka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262321.UnVBGzka-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
