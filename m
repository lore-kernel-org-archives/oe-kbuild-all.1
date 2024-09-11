Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE319F126
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065121; cv=none; b=HlbHBjENs6JWFCnuKoZ7aSINSVrN7GtkCTPQKjshYPPezdQIZ7ipbW0D3gxLrzM+vhzNxUhYe6iQFiFIVesGe+7aGzWAx0JVmV+4f7YQrqFlSznjTqHHOGqL1Ja2NbbgtLxm8y3G8v+VSeK+jjtC8IvavOByBWGGGfSd63MohiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065121; c=relaxed/simple;
	bh=41THF/E4LYMHaKNv2dUYsdh4NXJmpJfHEDcbI6Yrfxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSErxXu3TiQj7ZPblKm2nyFfdDjKo3Yx+gWEQQVPaCMWEAhVMmawrjUJ/5OGZOBTHl85f3onbtYs/W0Foi8T7Yj9Tcztt08xRjcb8C4wUL+s15W5cd60dt6u7nmOrsq4rkjY32xQ+b6ywvF+9QBCa1OyJ2txWQAiDB8riVNDhMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/PwNu+H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/PwNu+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065120; x=1757601120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=41THF/E4LYMHaKNv2dUYsdh4NXJmpJfHEDcbI6Yrfxs=;
  b=j/PwNu+HQoSLlWWGOQusYzyZHbLmruSIX8LmNKyZ4Qene/fU9bjhTT7x
   AAme521MrcMHizT2trDQVB0BrrnsgJ9mzGlOPhtZIYYK/FkOWl161r4f/
   jbXNV7HUsgfJqQTlgoOBsKd69v0QVPeo6TdLTR9mMoMGLTb+4GSWbe2vE
   HbQWDNqBE7yma3VlR7m3EMM64M+CZhqptuxg2Ti6n/2b5pZqOsj00wz/u
   8aSSX0qDAHOZiKlWv8LewxpoSDSroGQ9Pr99a6en5hD5Mz+yw/1KpzRFE
   dVLVpwSCehxwqyCt2VkXW5/5EdbUaTx7rZrFbuVnBOd5kSxtA3E3U9aXZ
   w==;
X-CSE-ConnectionGUID: FqDI5cuFSjaZnJFEO+y+gQ==
X-CSE-MsgGUID: oJlXwDsoQECE/4rvaJKz6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="13471445"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="13471445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:31:59 -0700
X-CSE-ConnectionGUID: BnSMd/Q/S5uvOCgT54ZbSw==
X-CSE-MsgGUID: qrIL28+ETCOVJT7+Cyn+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67229215"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 07:31:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soONw-0003hu-1p;
	Wed, 11 Sep 2024 14:31:56 +0000
Date: Wed, 11 Sep 2024 22:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 7521/30000] net-procfs.c:undefined
 reference to `wext_proc_exit'
Message-ID: <202409112203.zGte8zgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7d4d03eb539e5c78a894f5f3daeb61a606c3074e
commit: 2d8ce5be6941d90ea78a9237537268cd30f6d444 [7521/30000] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: arm64-randconfig-001-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112203.zGte8zgv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112203.zGte8zgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112203.zGte8zgv-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x4f2c): undefined reference to `wext_handle_ioctl'
   aarch64-linux-ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x710c): undefined reference to `compat_wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net-procfs.c:(.text+0x38c): undefined reference to `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net-procfs.c:(.text+0x490): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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
