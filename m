Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8D14F90
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732681902; cv=none; b=LX6rXbdkc/QbhpulQY6b2tcOKsjF/aWLTdvieNzUOCQ28mXeNRh+pWCAut7MvItZwxKX3ZucNDY9evbYpnWj0+e0M6KJUWgI79g+eKm80Zzk9BjDnFbtUk/eMNwq0aIfZ5Q7TprMygRhR10lmASBnIcR0JABHMk1JlKq62mQekw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732681902; c=relaxed/simple;
	bh=VvSUuniCzzWAg/Ey4ckyXj0Hdl0h+cYNeaUFvwbw7Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiygMK42u8ayZEvQZTIClBlxxO5vywNcJTPrM8G3d32hJ1EHJZIwtIfUi2tbbmEQ7qxR1DkDniXORH3CMPv4mf5FP5BHA18yWt93lXCeeZsao8VX9oNtiySNja91wJLu0gNjmgzKSIiXj1dqWYWX5p15XBNNkaP7swk9b0I580w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMD4aybx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMD4aybx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732681899; x=1764217899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvSUuniCzzWAg/Ey4ckyXj0Hdl0h+cYNeaUFvwbw7Cg=;
  b=aMD4aybxPQoCyScOyUNuFTEvISz1HLMemxJ5UmNq39G2Fm0hF2c4Xweu
   9a1R6o6O9VrT82LMGIWtN5OV3+72l6JCN0LKPS71Mz44V8uOxjR++u9qs
   /wGJ9Lz0AWlS17uWC3ULC4QCXa5+qKSUkcQfWVD1xZ8h1xW7yCpSGj38J
   5BsMUXJAdGrb7wkTr87NswJVY6r8t2YEwZxCAH6h9jvNVWh7faeo5jCIP
   PYoenB6co1PZmrDOQL48w4VzcxhviKZsuxYj2Zf9FGFbWtOvJ4vNDmsnP
   YseiStLwbKNqxz3C1PmkpeYdRsTJNnMIHhv6jLuHSoqRQVYwxLfzO6SK1
   w==;
X-CSE-ConnectionGUID: 4LRYBCekRXS9DdUhH3Fybg==
X-CSE-MsgGUID: UwKocHZiRzOBqzA1R5bBLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="20467916"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="20467916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 20:31:38 -0800
X-CSE-ConnectionGUID: YPAnq5cVTLWS7iFPb0atyQ==
X-CSE-MsgGUID: MOXJVTZoQFK2CheIB7GoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="96735178"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2024 20:31:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG9iB-0007iM-0m;
	Wed, 27 Nov 2024 04:31:35 +0000
Date: Wed, 27 Nov 2024 12:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maheshwar Ajja <majja@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: aarch64-linux-ld: v4l2-mem2mem.c:undefined reference to
 `vb2_create_bufs'
Message-ID: <202411271254.4vbweHLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maheshwar,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 1d74cced13c8a1bc8c2808697d4ffe73bdab9b19 ANDROID: Kconfig.gki: Enable media controller configs
date:   4 years, 1 month ago
config: arm64-randconfig-004-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271254.4vbweHLs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271254.4vbweHLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271254.4vbweHLs-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   v4l2-mem2mem.c:(.text+0xd9c): undefined reference to `vb2_create_bufs'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xdc4): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   v4l2-mem2mem.c:(.text+0xe3c): undefined reference to `vb2_expbuf'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xe64): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_create_bufs':
   v4l2-mem2mem.c:(.text+0xee4): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xf0c): undefined reference to `vb2_create_bufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_expbuf':
   v4l2-mem2mem.c:(.text+0xf84): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0xfac): undefined reference to `vb2_expbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   v4l2-mem2mem.c:(.text+0x1038): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_dqbuf':
   v4l2-mem2mem.c:(.text+0x10dc): undefined reference to `vb2_dqbuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1124): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1174): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   v4l2-mem2mem.c:(.text+0x1200): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_reqbufs':
   v4l2-mem2mem.c:(.text+0x12e4): undefined reference to `vb2_reqbufs'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_prepare_buf':
   v4l2-mem2mem.c:(.text+0x1388): undefined reference to `video_devdata'
   aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x13d8): undefined reference to `vb2_prepare_buf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   v4l2-mem2mem.c:(.text+0x145c): undefined reference to `vb2_querybuf'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   v4l2-mem2mem.c:(.text+0x1c6c): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x1f08): undefined reference to `v4l2_event_pending'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   v4l2-mem2mem.c:(.text+0x23e0): undefined reference to `vb2_streamoff'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   v4l2-mem2mem.c:(.text+0x2660): undefined reference to `vb2_queue_release'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x2668): undefined reference to `vb2_queue_release'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   v4l2-mem2mem.c:(.text+0x3e98): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ioctl_streamon':
   v4l2-mem2mem.c:(.text+0x3f68): undefined reference to `vb2_streamon'
   aarch64-linux-ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   v4l2-mem2mem.c:(.text+0x4190): undefined reference to `video_devdata'
>> aarch64-linux-ld: v4l2-mem2mem.c:(.text+0x4220): undefined reference to `vb2_qbuf'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x6030): undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
