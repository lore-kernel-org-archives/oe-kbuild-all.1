Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679462F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 02:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693104764; x=1724640764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0PYeY2XBKLjgDFIgCNWW8sw0CL6XiG0z5GOkNeKYo8=;
  b=R78FrsXWuq31Xt6AFwq/aKJjMgWgv3gFgWtvazaoOyDF03c9QGjD+wfU
   xKQ+E+IZSZKPT8UuGLfRrAkCUC4BSthSMMFNwZhWi0pTnjZGIYVIFf8X7
   D/6HbeWcYDylXT338q4AFmtRQebwjB5OprZT+M47hLhHBn/QYcYEw7OvY
   plNNNlxN4sM6RkqtzGBygWDij1EYr5JxBlp7F8Qn0DFI+ucEtvPpV81RW
   JaxAs/V2ASd4oZb8zNi84gcPA2tcnFEHsJCMMZFlqBFljJOAv6Y3re2OX
   N2sbQat/KVZiwUMqk+0byydgGX3R9FAg+ohrCqPt0vGkYxx5aqCxaU/Qs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="359903094"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="359903094"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 19:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="687716205"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="687716205"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Aug 2023 19:52:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa5tJ-0005Jb-23;
	Sun, 27 Aug 2023 02:52:41 +0000
Date: Sun, 27 Aug 2023 10:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 3/3] ld:
 drivers/media/v4l2-core/v4l2-mem2mem.c:822: undefined reference to
 `vb2_prepare_buf'
Message-ID: <202308271032.C3KmryZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   dcb17f36f37e648a8f6aebe7ee735f09197827c3
commit: 6def3a5ed8ee24465edf6b30cdbe4b27c6d4e1df [3/3] BACKPORT: media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
config: x86_64-randconfig-103-20230826 (https://download.01.org/0day-ci/archive/20230827/202308271032.C3KmryZu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271032.C3KmryZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271032.C3KmryZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:880: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:953: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:964: undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1236: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1237: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:612: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:803: undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:817: undefined reference to `video_devdata'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:822: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:760: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:772: undefined reference to `vb2_qbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:860: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:839: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:849: undefined reference to `vb2_expbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2066: undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
