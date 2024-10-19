Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C82EAC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729351601; cv=none; b=gwgWqSEURXV/Y36elfVlXnuOWgA/lIY581XXJKXeByCU5cc8zWmqGvZzzNh4CETapGXFMJ1qK7M1Ih5AwcXGHhurq6RUdW+dVpsl8t/ZK/G5zbwAgQKlOM9z+vtddhjC2N4jzSJFPck+WhoCZd7OBKXTDyVkFXNo5mch3bwmkFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729351601; c=relaxed/simple;
	bh=bem/AAVczurhqF5YxB4rolKp0iyRt/RY1U5RoXSWosA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZyZbemFXXQBCX5GbviGx+wt/pMkHd7zmtRj101QQtToOT4hFnrh+FyQIhXN339IKNqqOONSENodSUfGnxpYiDT2UH7gct98zqItqIISzVrrRylHcwoDHxbft5JDmlHayvM1dh8iHyAPs8BkpPyJbYh6Z7PZIEpZpaQSKQ7JQRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svj6qa/p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svj6qa/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729351599; x=1760887599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bem/AAVczurhqF5YxB4rolKp0iyRt/RY1U5RoXSWosA=;
  b=Svj6qa/p20nXBQtzxaT+GWl6REAvCrHjyqshDL4c4dwkyeotGHII/K3G
   Sb4VYtyCKKDto6FyymdDax1DQwnlPDCHUvebfWpWEKIPvLHk4IrBnPzCt
   2J9vYQ8vv9QYlPYaCuZ3dNOXs0llt1ROV2T1ELgXE5cnoGE07EeTWDl9e
   +vrPwrkK1D8XRFzzisrtFRWbmnRrveENGZ1WN0SvB2q6zb35IypmJjQ3E
   8/rOm5D/lpoMneuQ+WQvxGKr5aOu7zyPfgkgZmmVGrXHoY+Pun4qqRJdQ
   eEm3GxPViQEBlnecMinpQOnpNoAZlXsFU8Ap1fQz6qPHiIACvMdesjJBt
   g==;
X-CSE-ConnectionGUID: xLOGlgrgTEW7DJkzjJFZLg==
X-CSE-MsgGUID: eefCqtgcQYWkyTe6ZTP16A==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="16490068"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="16490068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 08:26:38 -0700
X-CSE-ConnectionGUID: xYhrW3gaSPujCF/QxwMujQ==
X-CSE-MsgGUID: 4dD6nVAkTdWH4tZWJMZdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79271740"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2024 08:26:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2BLe-000P6u-2b;
	Sat, 19 Oct 2024 15:26:34 +0000
Date: Sat, 19 Oct 2024 23:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 15/30000] videobuf2-core.c:undefined
 reference to `v4l_vb2q_enable_media_source'
Message-ID: <202410192309.fwgyzI3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   bc3c69590b1c5449c8107f1fbdce0126a09a6134
commit: 649238947d688eea17d27825fdc651d693e48a33 [15/30000] ANDROID: init: GKI: enable hidden configs for media
config: i386-buildonly-randconfig-003-20241019 (https://download.01.org/0day-ci/archive/20241019/202410192309.fwgyzI3m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192309.fwgyzI3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192309.fwgyzI3m-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: kernel/module_signing.o: in function `mod_verify_sig':
   module_signing.c:(.text+0x3d): undefined reference to `mod_check_sig'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> videobuf2-core.c:(.text+0xe2d): undefined reference to `v4l_vb2q_enable_media_source'
   ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0xdd7): undefined reference to `wext_handle_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
