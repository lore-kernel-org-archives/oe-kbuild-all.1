Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1E70836
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782595026; cv=none; b=kJqigFtghg3Tvdll06hsMuR7uwVyIQ8/sH9vx0QrG+/2t4Up9Xq9wLi++vmqz0G723p9hEf5NSt+lax47e33TmsykANZ2GS3U3sv4D7pVNcNvBSgshHiZCoNQPqSZdwi61OhE3YsNZOCXIgyq6pnL8TWE5ivQVD4OZq1L/cu6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782595026; c=relaxed/simple;
	bh=ME8fusEA96nyTfm90m0/JOMZ91crbTrq09Otw1SnzSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VnOsdoVm5Z4NQujStkrbG21JxHd2osG79mIPyjdKudMBuSBM3Atzxu/vh2SpnLBnL7xjkiGJfnGAWdp+oJhU4xsw746+f7JpblrDz29slQ1Ur6DZdkIb+mgBZufsBMJY0G7GKcWgMn1vh1d1EfGetd1MyiNxVq/cD2MzRq4jrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/iSZQBg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/iSZQBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782595023; x=1814131023;
  h=date:from:to:cc:subject:message-id;
  bh=ME8fusEA96nyTfm90m0/JOMZ91crbTrq09Otw1SnzSo=;
  b=S/iSZQBgQrbsKSa70yEXbuulpaqjx9FOGs1W/RSdW6HySC8jYk0zFoGL
   rzTUX38/eO3KrqKQIiOMgkWF4evwPXTnMKPAgqTxcQJtdWF9j/VggG2IO
   XK9dpOQDYKG5ocvxlB3Gqug7V9rEPaY2esGieskRP9Wx4rNGn3xgVSJWV
   4GSGdqrfnFcF3LA/rdUTSnomJ7mXYQgLpjAYbzSG2j/94iKiKZtkVMO7F
   YmUWRksOXKjFI58cHAH8b0+7YIFI98U48aLULzQcY/RNIkRBqolZdeI+o
   NZcJTVIAUbxHqIhoXTKGLKryOYj6hnlliPwVg8ChKxybw7T1CN61Tp8TG
   g==;
X-CSE-ConnectionGUID: DAXGGakaR/alEAYs+JF69Q==
X-CSE-MsgGUID: 6ikVZG7ZQJOzsr6WJRnFzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="87185050"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="87185050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 14:17:02 -0700
X-CSE-ConnectionGUID: svmUwVSBQnmtH0YJkBdDmQ==
X-CSE-MsgGUID: hbKAAU3rT2eospOO+peBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="289722857"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2026 14:17:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdaOZ-0000000064D-041V;
	Sat, 27 Jun 2026 21:16:59 +0000
Date: Sun, 28 Jun 2026 05:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 1/1] WARNING: modpost:
 "inet_sk_get_local_port_range" [net/sctp/sctp.ko] has no CRC!
Message-ID: <202606280550.nreOOAk4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiangxinpei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   4841c1137e56decaeabaecff4cfe5742e36b3c68
commit: 5ce1842cd12dbf6fb8c0373e4b727073ef0d2e3b [1/1] ANDROID: GKI: net: add vendor hook for network quality estimation
config: x86_64-randconfig-r053-20260628 (https://download.01.org/0day-ci/archive/20260628/202606280550.nreOOAk4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606280550.nreOOAk4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606280550.nreOOAk4-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: EXPORT symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_sk_get_local_port_range" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "inet_csk_get_port" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_csk_get_port" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "inet_csk_get_port" [net/wireless/cfg80211.ko] has no CRC!
>> WARNING: modpost: "inet_sk_get_local_port_range" [net/sctp/sctp.ko] has no CRC!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
