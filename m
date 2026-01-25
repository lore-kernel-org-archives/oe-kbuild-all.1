Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7ED3EBF20
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769305847; cv=none; b=WzGz6y4tMjj4doo9U7iyhJHJRUTQpqwC7kfom013MQ5Nu65GvJWh7A7W+KANPkq3HwVlS51krjt2oIqGVKfzcmxt2z83R7UDG4+60FWPaidEPfKRI9NWvz4buUvnm33cspqLCylbtV/uNvn35y3EVwiG8HepFz/OHBLxYKo6ZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769305847; c=relaxed/simple;
	bh=swWe+Hw4tQZllyR8+LD184aiJirw+h1qo84Q1Zd/gF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HHhtfzUg3kA6qDRJuboLivVd9caPfYLWH5wl1d4QX6zx8IN4/NxeXBW6aPCLSHHwDrWe8X99vXMUq/3IqZ1xCNi1Fv6vm/t/h/kjQHb1I7Y00nbc9+odFroVCN9Td2WsQ/AKPxC+lbzo6Lq5e1BMeEATRn6t56M8ctKBgjfdmEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/GRdjkR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/GRdjkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769305845; x=1800841845;
  h=date:from:to:cc:subject:message-id;
  bh=swWe+Hw4tQZllyR8+LD184aiJirw+h1qo84Q1Zd/gF4=;
  b=m/GRdjkRxWArrWMsWH68rQxquQb/nJhzp5jtBEJrBZqKPl2q8Q19yjYY
   a/LwYC8Hev9hHFPWlMJiACWKR+JxZkl0t0wA24YW6dCGTbYNqPt3sLpYM
   8Qsjeezi5oJoupwVtQo4UQwUeNDEWaKKBjN9TknD84GdJTjca8WoenoGE
   IngXDy8DnuShSA/hPAHAPEoWMUaGe7BxkDs6Fo+4+BMtNzmuG3pC6ADnR
   8KNB1i7nl+PHo//jnbdKao6QXVVfzmNMNGp9uAwsQ9pfutf9m0hesHwSB
   AvjXSgKugsa0THhN6noEOlr2kAxjMADvkTmZ4TUcMRULU9JiFlrCzn3af
   g==;
X-CSE-ConnectionGUID: bblaVcWYRoGgIbS4XQEICQ==
X-CSE-MsgGUID: fCCdFpVTTwuKBSs8DYVzAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69709202"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69709202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 17:50:44 -0800
X-CSE-ConnectionGUID: 28R94IdiR92oHpwa38jYyg==
X-CSE-MsgGUID: QAOh6oHgR7qi1HIPzEb3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211471886"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2026 17:50:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjpGy-00000000Vfa-1aOZ;
	Sun, 25 Jan 2026 01:50:40 +0000
Date: Sun, 25 Jan 2026 09:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] ld.lld: error: undefined
 symbol: of_regulator_bulk_get_all
Message-ID: <202601250936.nMoAUpBu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Manivannan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   83c6be0e1efeae09e04fb24fcfc221c5af65b1f4
commit: c61d3053974a917407ce02ff923505d45dd5b5bd [0/1] UPSTREAM: PCI/pwrctrl: Add pwrctrl driver for PCI slots
config: x86_64-randconfig-073-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250936.nMoAUpBu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250936.nMoAUpBu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250936.nMoAUpBu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: of_regulator_bulk_get_all
   >>> referenced by slot.c:39 (drivers/pci/pwrctrl/slot.c:39)
   >>>               vmlinux.o:(pci_pwrctrl_slot_probe)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
