Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2DA15B106
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161147; cv=none; b=AMhzHsD8aiQqcpievqXxrBfm0+29rzvGjkWzgI4J+CjBKN/LYBESkkadJ1EwoT+4sWt1sCyh1sXgS6XHjAljr+L2P6Q+Bzy7ZRLxDPMWiM/93ykVjqWDBvKQ5R8cGB11G38+tYnhmXvQFcbJT8w6vp3DQ7xkjqsavVCuAVmpCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161147; c=relaxed/simple;
	bh=SY4Q8qwxVTNrrO5pP2uFFxyGAVTuoO1YvN/EZ3akRi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCxrCMed4qelPDITX+eZ7TxiheE3F2xpcI69XILdPaHJPN0DfF+LRO+DJRiNw9BcINvjKZSDttebQpmZPEX3fHrN7RrxqzvRW9WlovM5QJcoA3Ej1CRpaQHL1qDiCpb/FnrwtG1RL/wEKX+v84WpalItojjgtdt6T4bKrKNLzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH367jQ7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH367jQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717161146; x=1748697146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SY4Q8qwxVTNrrO5pP2uFFxyGAVTuoO1YvN/EZ3akRi0=;
  b=ZH367jQ7FFUpMwsuX0o7JggaI4IRFFcovb3mhM63Y4c0IezdKBZiqFve
   os8PI2Vvn/qra718dh/1ghdToxNmdnBgt0cTdNMhmsYLTO6MTGDNxK06a
   dPf7CA/1q0gIjqW2/Ot9ECrB3e3Iu0HXi2ELSqdp20qh/tqkoS8CsG/t0
   1oe4XtLMBYaUfqHpAemX1EwoOyV/KRadGFSLExtQmPJh7gZ6hRFIfPy4D
   r0UtnC3qSCf+oRWBBGHDYfoK55vYRR2QKT+YWzy+C0jlTsT96pZzY1Rj6
   Ben0UUaitCV4sBJ6aAJRrYegrpKr68KVzPJApZoCJyzddeSUv80RV4hyV
   Q==;
X-CSE-ConnectionGUID: xOAYVca/T9+0NROSAXLylw==
X-CSE-MsgGUID: EZ9+YQjCQh6El8SCvdF2zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13824262"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13824262"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:12:26 -0700
X-CSE-ConnectionGUID: XysGI2krQNS4HMXH41hmuQ==
X-CSE-MsgGUID: u44qMuXQSyu6mAzklMHzXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40714909"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 06:12:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD23M-000H7q-0V;
	Fri, 31 May 2024 13:12:18 +0000
Date: Fri, 31 May 2024 21:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/3] ld:
 drivers/media/v4l2-core/v4l2-mem2mem.c:612:undefined reference to
 `vb2_querybuf'
Message-ID: <202405312132.Inrfna8d-lkp@intel.com>
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
commit: 6def3a5ed8ee24465edf6b30cdbe4b27c6d4e1df [3/3] BACKPORT: media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
config: x86_64-randconfig-012-20240531 (https://download.01.org/0day-ci/archive/20240531/202405312132.Inrfna8d-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405312132.Inrfna8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312132.Inrfna8d-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1236:(.text+0x18cb): undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1237:(.text+0x18d7): undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:953:(.text+0x1d35): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:964:(.text+0x1e03): undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:839:(.text+0x2a86): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:849:(.text+0x2ae5): undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:839:(.text+0x2b6c): undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:849:(.text+0x2bea): undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:612:(.text+0x2c48): undefined reference to `vb2_querybuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:612:(.text+0x2cee): undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578:(.text+0x2d72): undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:578:(.text+0x2e59): undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:803:(.text+0x2f26): undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:803:(.text+0x2fe8): undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:817:(.text+0x303b): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:822:(.text+0x3099): undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:880:(.text+0x32af): undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:860:(.text+0x3f5a): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:860:(.text+0x4010): undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:760:(.text+0x4225): undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:772:(.text+0x42c2): undefined reference to `vb2_qbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2066:(.text+0x21d4): undefined reference to `v4l_vb2q_enable_media_source'

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
