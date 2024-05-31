Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7DF80626
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138657; cv=none; b=HNTbpuJjlj3DzdzEZYP798Ar8hXq5y9D8uWAnFKH9xOZ8JwqNfR6nb6kmL77OjMIux+hOaP6/QGRZAaWSlfyCypgPCnRbyTPZk+Ri1M2QmES/4/XgLlQU1PLYpn9PSHy0AbH+cMoxDxPNpSSfMH5FoY9sqbYA4P30e9HoSIzL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138657; c=relaxed/simple;
	bh=t5Dt2IivDT6c7zkmjeX7B3V3PL21HNZ92qCN/L7vd/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLLExRsvwxE5G9D6CP1TVehT65y8FoC966exTpKXgnaYb14Xdx6MQ1tU+0ec5xnBrw1BWC6WKhQ8X8coB+/8GSGDenzcwCO7o7y2tvX3hYH05p0qwSMB+DIzEsecm/JaVv8ollL/1LtAdRYW9l6woqHWqDHDM1gcO33CkIrZbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES5X7szn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES5X7szn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717138656; x=1748674656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5Dt2IivDT6c7zkmjeX7B3V3PL21HNZ92qCN/L7vd/E=;
  b=ES5X7sznN1ynQRggdCs7414gkR+g++b7gX8jhqdWHmnRp+ZSjP2FNCGY
   498t9hJfSLK1f9MwBycsbgHHDB/ZsXfr1KatZ62clkNKCe8tC5+R86HLK
   rT7Quwf2lL03FYnmZ1tuM+l2SyamldajozTmUCPql1KRMncliXYurWoAv
   Lt8KnIa2+UVBA6SqBLbbPuZlm2nxKEYo4z7e4hWVA88156/saDSFU9LCP
   bBH1y73mUIdyQtOi9KC16A+VKqSSqeXex9aKXvO6y/X5wPI8o9DU5ccJ4
   ZWIaUfK2sf889qpbuKHczzd97viwsIUVsdHwtsTXjuIAECVJvg/7C2KmG
   g==;
X-CSE-ConnectionGUID: NIx8YJVURk2x7ClNVTzWdA==
X-CSE-MsgGUID: whCXtPVhSB6m/Ye7+RfxRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17498781"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17498781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 23:57:33 -0700
X-CSE-ConnectionGUID: jUEiOsSsSmy8ynXaBIkqbQ==
X-CSE-MsgGUID: KxlPERkxR7qIWP8oNJtNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36173102"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 23:57:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCwCf-000Gdb-2J;
	Fri, 31 May 2024 06:57:29 +0000
Date: Fri, 31 May 2024 14:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/11] ld:
 drivers/media/v4l2-core/v4l2-mem2mem.c:789:undefined reference to
 `vb2_dqbuf'
Message-ID: <202405311448.mEM6bM0o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   d615d2d8003fac8d2b7357f755efdf94deb1b83f
commit: c108d79a122aa94d1c5fe6305be8c4fec4b64ec5 [4/11] UPSTREAM: ubsan: disable object-size sanitizer under GCC
config: x86_64-randconfig-012-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311448.mEM6bM0o-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311448.mEM6bM0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311448.mEM6bM0o-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1207:(.text+0x181b): undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1208:(.text+0x1827): undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:924:(.text+0x1c85): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:935:(.text+0x1d53): undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810:(.text+0x2ad6): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:820:(.text+0x2b35): undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810:(.text+0x2bbc): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:820:(.text+0x2c3a): undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:789:(.text+0x2cb6): undefined reference to `vb2_dqbuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:789:(.text+0x2d58): undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796:(.text+0x2d8b): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:800:(.text+0x2de9): undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578:(.text+0x2e52): undefined reference to `vb2_reqbufs'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:578:(.text+0x2f39): undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796:(.text+0x2fe0): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:800:(.text+0x303b): undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:596:(.text+0x31e2): undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:851:(.text+0x33af): undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:831:(.text+0x417a): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831:(.text+0x4230): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:750:(.text+0x4445): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:762:(.text+0x44e5): undefined reference to `vb2_qbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2066:(.text+0x2844): undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
