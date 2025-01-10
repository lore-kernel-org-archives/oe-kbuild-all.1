Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41BE206F22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489645; cv=none; b=hfg7eWFhyfL8laJHdle+ztVxAgkxPCg3XLWm4fnMsF5JkruvMYt/4eREsp9z7/324wvQ7uxlGBUTSk+Sj0rt53ImQ+rjzqsQ5GdU52y/SnfQ3bKUZ2AQFbx8IJ5h9pgkiNnBBy1BPobpeyI+bdHPen0Tf/1aDuvHduLAtMsu9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489645; c=relaxed/simple;
	bh=Fhc/IqbLBBByoxBz3gB1HY/uJXnXWW064s4eKFkyBeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9L8AyPq4dzIFamUQLc4jkOz6hBcJsTPwCjS8o55wrvvkVw6vlmuxXp71hsWcNljH7+FZ5Q5hdGABIaBadUskcjnI0MO3OQvR0+ypvLaSKSvRtaFGylTfgDIPiEmycNQ8Vl3+23fRaAJg8G5RFeiML4GDzTY0nNdUKiUnpXmuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MD4Iqn7d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MD4Iqn7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736489643; x=1768025643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fhc/IqbLBBByoxBz3gB1HY/uJXnXWW064s4eKFkyBeM=;
  b=MD4Iqn7dXyvU5VI2WPiJihnUMw45Lvr6gz60IUSob0ShWT7pcJ4Mki/j
   Txv+FEbltNQrL7uX2vVOPtA0XC3Lf0Wm8874gpg+0LkokAUp7KC03HbWB
   9r3CzBDDz2ztORLTl2d+gcmRAt5YnACgJ0snoco58rY4GROJWJYQGrptO
   wRmkte5jaWDoAGMto2lSdLfJNdMOjTUET1qJFxjHL+FPDZpqC8zXeTooW
   fzk7i9qia5MhgYzmrkutuSz10/w0FIZwvc+pf+Kz5YR/axSi+PYCSb2JP
   CYE61iozajeqTqHwcoKYDGG/SkQ47GP8cCza5EwerbzVaV7EYIebE6b4l
   g==;
X-CSE-ConnectionGUID: aBY+3OvKSleS7DC+vcdu6A==
X-CSE-MsgGUID: c4c3/xbPQ6ipBBX+H5RMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36933388"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36933388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:14:02 -0800
X-CSE-ConnectionGUID: /ctlixoRT3SSduqykJonNA==
X-CSE-MsgGUID: SHOwVo7ISkGVHvCzFypLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103454041"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 22:14:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8HO-000Icl-2f;
	Fri, 10 Jan 2025 06:13:58 +0000
Date: Fri, 10 Jan 2025 14:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1] net-procfs.c:undefined
 reference to `wext_proc_exit'
Message-ID: <202501101416.WYXpA6SE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   5149b1dba0dfac219b4334d2632c56e260bc08e2
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [1/1] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: arm64-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250110/202501101416.WYXpA6SE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101416.WYXpA6SE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101416.WYXpA6SE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x5030): undefined reference to `wext_handle_ioctl'
   socket.c:(.text+0x5030): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_handle_ioctl'
   aarch64-linux-ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x5ab0): undefined reference to `compat_wext_handle_ioctl'
   socket.c:(.text+0x5ab0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `compat_wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net-procfs.c:(.text+0x7a8): undefined reference to `wext_proc_exit'
   net-procfs.c:(.text+0x7a8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net-procfs.c:(.text+0x8b0): undefined reference to `wext_proc_init'
   net-procfs.c:(.text+0x8b0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
