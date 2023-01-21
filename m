Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A9A748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674322900; x=1705858900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3AHLmZww85X6sg5oRcVUtkrs8lx7kHiW4etoG4HaNkc=;
  b=KoXsvzFW7jvyClBvTWQsdkCPpJHu0r4m3CrJIGQpz7rGN2v2oox7cbYn
   c4VZAWLjIhtrCIkZPm+9vGtue9tP/hiKFjoMt4jT48EOJeAUWArwgGKyR
   ghcfm9BV12QoP5U6byyXupsxa33I2M+NfedAnqTCDLONiLx1Zv1OrWFj9
   MMQeiHXwV3fQY6LkqoOWw29hkq7BIsTOEyZ+RkLJ71lLWaJF834c36Nxf
   l7N3sInHto73QElhLErEbh5HzBjOLWTNLesV12cSjSRnN8HGEQFPYGqHz
   8WAVu1E3ctlF9RkQ+Slkr7kJ4Adz9LInJnJFO24AYfaUR687OzvKUfLD/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388167991"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="388167991"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 09:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729472792"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729472792"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 09:41:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJHs1-0004K8-0e;
	Sat, 21 Jan 2023 17:41:37 +0000
Date: Sun, 22 Jan 2023 01:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 18/28]
 drivers/gpu/drm/msm/msm_drv.h:239:38: error: field has incomplete type
 'struct devfreq_simple_ondemand_data'
Message-ID: <202301220144.KpkTM9E1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   8dadbc362b2960d127ca86d0ef6856e68c311c2a
commit: ef47ed92d6440a771efdc4a748554126623a8115 [18/28] FROMGIT: drm/msm/gpu: Add devfreq tuning debugfs
config: hexagon-buildonly-randconfig-r002-20230121 (https://download.01.org/0day-ci/archive/20230122/202301220144.KpkTM9E1-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout ef47ed92d6440a771efdc4a748554126623a8115
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
   In file included from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15:
   In file included from drivers/gpu/drm/msm/msm_gpu.h:19:
>> drivers/gpu/drm/msm/msm_drv.h:239:38: error: field has incomplete type 'struct devfreq_simple_ondemand_data'
           struct devfreq_simple_ondemand_data gpu_devfreq_config;
                                               ^
   drivers/gpu/drm/msm/msm_drv.h:239:9: note: forward declaration of 'struct devfreq_simple_ondemand_data'
           struct devfreq_simple_ondemand_data gpu_devfreq_config;
                  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [m]:
   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n) && INPUT [=y]


vim +239 drivers/gpu/drm/msm/msm_drv.h

   108	
   109		struct drm_device *dev;
   110	
   111		struct msm_kms *kms;
   112		int (*kms_init)(struct drm_device *dev);
   113	
   114		/* subordinate devices, if present: */
   115		struct platform_device *gpu_pdev;
   116	
   117		/* possibly this should be in the kms component, but it is
   118		 * shared by both mdp4 and mdp5..
   119		 */
   120		struct hdmi *hdmi;
   121	
   122		/* DSI is shared by mdp4 and mdp5 */
   123		struct msm_dsi *dsi[2];
   124	
   125		struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
   126	
   127		/* when we have more than one 'msm_gpu' these need to be an array: */
   128		struct msm_gpu *gpu;
   129	
   130		/* gpu is only set on open(), but we need this info earlier */
   131		bool is_a2xx;
   132		bool has_cached_coherent;
   133	
   134		struct drm_fb_helper *fbdev;
   135	
   136		struct msm_rd_state *rd;       /* debugfs to dump all submits */
   137		struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
   138		struct msm_perf_state *perf;
   139	
   140		/**
   141		 * List of all GEM objects (mainly for debugfs, protected by obj_lock
   142		 * (acquire before per GEM object lock)
   143		 */
   144		struct list_head objects;
   145		struct mutex obj_lock;
   146	
   147		/**
   148		 * lru:
   149		 *
   150		 * The various LRU's that a GEM object is in at various stages of
   151		 * it's lifetime.  Objects start out in the unbacked LRU.  When
   152		 * pinned (for scannout or permanently mapped GPU buffers, like
   153		 * ringbuffer, memptr, fw, etc) it moves to the pinned LRU.  When
   154		 * unpinned, it moves into willneed or dontneed LRU depending on
   155		 * madvise state.  When backing pages are evicted (willneed) or
   156		 * purged (dontneed) it moves back into the unbacked LRU.
   157		 *
   158		 * The dontneed LRU is considered by the shrinker for objects
   159		 * that are candidate for purging, and the willneed LRU is
   160		 * considered for objects that could be evicted.
   161		 */
   162		struct {
   163			/**
   164			 * unbacked:
   165			 *
   166			 * The LRU for GEM objects without backing pages allocated.
   167			 * This mostly exists so that objects are always is one
   168			 * LRU.
   169			 */
   170			struct drm_gem_lru unbacked;
   171	
   172			/**
   173			 * pinned:
   174			 *
   175			 * The LRU for pinned GEM objects
   176			 */
   177			struct drm_gem_lru pinned;
   178	
   179			/**
   180			 * willneed:
   181			 *
   182			 * The LRU for unpinned GEM objects which are in madvise
   183			 * WILLNEED state (ie. can be evicted)
   184			 */
   185			struct drm_gem_lru willneed;
   186	
   187			/**
   188			 * dontneed:
   189			 *
   190			 * The LRU for unpinned GEM objects which are in madvise
   191			 * DONTNEED state (ie. can be purged)
   192			 */
   193			struct drm_gem_lru dontneed;
   194	
   195			/**
   196			 * lock:
   197			 *
   198			 * Protects manipulation of all of the LRUs.
   199			 */
   200			struct mutex lock;
   201		} lru;
   202	
   203		struct workqueue_struct *wq;
   204	
   205		unsigned int num_crtcs;
   206		struct drm_crtc *crtcs[MAX_CRTCS];
   207	
   208		struct msm_drm_thread event_thread[MAX_CRTCS];
   209	
   210		unsigned int num_bridges;
   211		struct drm_bridge *bridges[MAX_BRIDGES];
   212	
   213		/* VRAM carveout, used when no IOMMU: */
   214		struct {
   215			unsigned long size;
   216			dma_addr_t paddr;
   217			/* NOTE: mm managed at the page level, size is in # of pages
   218			 * and position mm_node->start is in # of pages:
   219			 */
   220			struct drm_mm mm;
   221			spinlock_t lock; /* Protects drm_mm node allocation/removal */
   222		} vram;
   223	
   224		struct notifier_block vmap_notifier;
   225		struct shrinker shrinker;
   226	
   227		struct drm_atomic_state *pm_state;
   228	
   229		/**
   230		 * hangcheck_period: For hang detection, in ms
   231		 *
   232		 * Note that in practice, a submit/job will get at least two hangcheck
   233		 * periods, due to checking for progress being implemented as simply
   234		 * "have the CP position registers changed since last time?"
   235		 */
   236		unsigned int hangcheck_period;
   237	
   238		/** gpu_devfreq_config: Devfreq tuning config for the GPU. */
 > 239		struct devfreq_simple_ondemand_data gpu_devfreq_config;
   240	
   241		/**
   242		 * gpu_clamp_to_idle: Enable clamping to idle freq when inactive
   243		 */
   244		bool gpu_clamp_to_idle;
   245	
   246		/**
   247		 * disable_err_irq:
   248		 *
   249		 * Disable handling of GPU hw error interrupts, to force fallback to
   250		 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
   251		 * the sw hangcheck mechanism.
   252		 */
   253		bool disable_err_irq;
   254	};
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
