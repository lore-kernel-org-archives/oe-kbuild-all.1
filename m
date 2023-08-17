Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B171BB43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692311260; x=1723847260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUr6J2W6YhYMwAII/oJykAtiipc+ROslsaXy7VLUxYE=;
  b=ABnXMCnfJ+sgjy9oZcypgd9PwhUuZ1YMZANLCWs/XsrUCBFaK7wNd2M2
   0R4H1dYTUjcTZd6I4UbhfTI69Sz+le6ajLMWt7QfNNC3UQifOo6rNnPKV
   /z6S41hzOfcgLsohvWk56LnZixn6cpUG80X7jWGQF5Q1XhmVtu4F6JEkW
   s1W32lgXwc+Xs6+VhSBq6CdKAwfhK3JqOuUWo/QqtGh0z4KDDiMX4qGXu
   TwvIUGKZkiSVQ9cBJuvtb93ZrV5usw3nUnCm3rLTrXWWaJAlexppk5pSC
   D8bYm87iA67WWj0NNvPPA6A/wIknrrFtqqNvpusLKEtPJ5DlzudginTef
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439327468"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="439327468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 15:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="849021482"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="849021482"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 15:27:37 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWlSq-0001WJ-1y;
	Thu, 17 Aug 2023 22:27:36 +0000
Date: Fri, 18 Aug 2023 06:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-04 1705/20089] ld:
 drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to
 `vb2_create_bufs'
Message-ID: <202308180605.FdmH2gOI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maheshwar,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-04
head:   7be82deea703a8cc82184f3fefd3c3cb2188ea84
commit: 1d74cced13c8a1bc8c2808697d4ffe73bdab9b19 [1705/20089] ANDROID: Kconfig.gki: Enable media controller configs
config: i386-randconfig-m021-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180605.FdmH2gOI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180605.FdmH2gOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180605.FdmH2gOI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:924: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:935: undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1207: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1208: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:810: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:820: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:789: undefined reference to `vb2_dqbuf'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:789: undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:800: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:796: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:800: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:596: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:596: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:851: undefined reference to `vb2_streamoff'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:851: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
>> ld: drivers/media/v4l2-core/v4l2-mem2mem.c:831: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:750: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:762: undefined reference to `vb2_qbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2044: undefined reference to `v4l_vb2q_enable_media_source'

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
