Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E743C38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674238576; x=1705774576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0BOZvAn9ChRv/b/fHEiig/Rng5sQwvjOOA852IqgV4=;
  b=W4EcAbskO7EQESptQ091vbBzlcYv0Nfys04ZAI5NX9yEAAWI1l3V73Iz
   dHqpluD/3CPQkSEbFFpm5ct5K7tBVbipUXpffeUnf6fx1Ys18oTMH6irT
   xJVcTJAcu8fcqed7jKnJfEQHr6CG+lU86HSX+oyHXc/+euC9KTcwFmWxQ
   yPmeWTQtZqLG5pYcD7NUCSN0YJQmqZsQnTNkRFYowak5Em6Yz4FXcZGms
   BarTv4pwa2idIPf2Y5RPwKKVlqJxfKKt4MNCqtg5CfhaFqgqjLpJyqMP2
   EujOLKs3pn4XCp98FmW4MwrshIBm70oR5gnxJSAQ8V3C9PlNG16S0D2Tj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="326923629"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="326923629"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 10:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989478297"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989478297"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 10:16:14 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIvvy-0002n7-0Z;
	Fri, 20 Jan 2023 18:16:14 +0000
Date: Sat, 21 Jan 2023 02:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [linux-next:master 4530/6912] drivers/gpu/drm/msm/msm_drv.h:238:45:
 error: field 'gpu_devfreq_config' has incomplete type
Message-ID: <202301210249.QexGmmKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544 [4530/6912] drm/msm/gpu: Add devfreq tuning debugfs
config: openrisc-randconfig-r011-20230119 (https://download.01.org/0day-ci/archive/20230121/202301210249.QexGmmKq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/msm_gpu.h:18,
                    from drivers/gpu/drm/msm/adreno/adreno_gpu.h:15,
                    from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
>> drivers/gpu/drm/msm/msm_drv.h:238:45: error: field 'gpu_devfreq_config' has incomplete type
     238 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
         |                                             ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [y]:
   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)


vim +/gpu_devfreq_config +238 drivers/gpu/drm/msm/msm_drv.h

   107	
   108		struct drm_device *dev;
   109	
   110		struct msm_kms *kms;
   111		int (*kms_init)(struct drm_device *dev);
   112	
   113		/* subordinate devices, if present: */
   114		struct platform_device *gpu_pdev;
   115	
   116		/* possibly this should be in the kms component, but it is
   117		 * shared by both mdp4 and mdp5..
   118		 */
   119		struct hdmi *hdmi;
   120	
   121		/* DSI is shared by mdp4 and mdp5 */
   122		struct msm_dsi *dsi[2];
   123	
   124		struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
   125	
   126		/* when we have more than one 'msm_gpu' these need to be an array: */
   127		struct msm_gpu *gpu;
   128	
   129		/* gpu is only set on open(), but we need this info earlier */
   130		bool is_a2xx;
   131		bool has_cached_coherent;
   132	
   133		struct drm_fb_helper *fbdev;
   134	
   135		struct msm_rd_state *rd;       /* debugfs to dump all submits */
   136		struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
   137		struct msm_perf_state *perf;
   138	
   139		/**
   140		 * List of all GEM objects (mainly for debugfs, protected by obj_lock
   141		 * (acquire before per GEM object lock)
   142		 */
   143		struct list_head objects;
   144		struct mutex obj_lock;
   145	
   146		/**
   147		 * lru:
   148		 *
   149		 * The various LRU's that a GEM object is in at various stages of
   150		 * it's lifetime.  Objects start out in the unbacked LRU.  When
   151		 * pinned (for scannout or permanently mapped GPU buffers, like
   152		 * ringbuffer, memptr, fw, etc) it moves to the pinned LRU.  When
   153		 * unpinned, it moves into willneed or dontneed LRU depending on
   154		 * madvise state.  When backing pages are evicted (willneed) or
   155		 * purged (dontneed) it moves back into the unbacked LRU.
   156		 *
   157		 * The dontneed LRU is considered by the shrinker for objects
   158		 * that are candidate for purging, and the willneed LRU is
   159		 * considered for objects that could be evicted.
   160		 */
   161		struct {
   162			/**
   163			 * unbacked:
   164			 *
   165			 * The LRU for GEM objects without backing pages allocated.
   166			 * This mostly exists so that objects are always is one
   167			 * LRU.
   168			 */
   169			struct drm_gem_lru unbacked;
   170	
   171			/**
   172			 * pinned:
   173			 *
   174			 * The LRU for pinned GEM objects
   175			 */
   176			struct drm_gem_lru pinned;
   177	
   178			/**
   179			 * willneed:
   180			 *
   181			 * The LRU for unpinned GEM objects which are in madvise
   182			 * WILLNEED state (ie. can be evicted)
   183			 */
   184			struct drm_gem_lru willneed;
   185	
   186			/**
   187			 * dontneed:
   188			 *
   189			 * The LRU for unpinned GEM objects which are in madvise
   190			 * DONTNEED state (ie. can be purged)
   191			 */
   192			struct drm_gem_lru dontneed;
   193	
   194			/**
   195			 * lock:
   196			 *
   197			 * Protects manipulation of all of the LRUs.
   198			 */
   199			struct mutex lock;
   200		} lru;
   201	
   202		struct workqueue_struct *wq;
   203	
   204		unsigned int num_crtcs;
   205		struct drm_crtc *crtcs[MAX_CRTCS];
   206	
   207		struct msm_drm_thread event_thread[MAX_CRTCS];
   208	
   209		unsigned int num_bridges;
   210		struct drm_bridge *bridges[MAX_BRIDGES];
   211	
   212		/* VRAM carveout, used when no IOMMU: */
   213		struct {
   214			unsigned long size;
   215			dma_addr_t paddr;
   216			/* NOTE: mm managed at the page level, size is in # of pages
   217			 * and position mm_node->start is in # of pages:
   218			 */
   219			struct drm_mm mm;
   220			spinlock_t lock; /* Protects drm_mm node allocation/removal */
   221		} vram;
   222	
   223		struct notifier_block vmap_notifier;
   224		struct shrinker shrinker;
   225	
   226		struct drm_atomic_state *pm_state;
   227	
   228		/**
   229		 * hangcheck_period: For hang detection, in ms
   230		 *
   231		 * Note that in practice, a submit/job will get at least two hangcheck
   232		 * periods, due to checking for progress being implemented as simply
   233		 * "have the CP position registers changed since last time?"
   234		 */
   235		unsigned int hangcheck_period;
   236	
   237		/** gpu_devfreq_config: Devfreq tuning config for the GPU. */
 > 238		struct devfreq_simple_ondemand_data gpu_devfreq_config;
   239	
   240		/**
   241		 * gpu_clamp_to_idle: Enable clamping to idle freq when inactive
   242		 */
   243		bool gpu_clamp_to_idle;
   244	
   245		/**
   246		 * disable_err_irq:
   247		 *
   248		 * Disable handling of GPU hw error interrupts, to force fallback to
   249		 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
   250		 * the sw hangcheck mechanism.
   251		 */
   252		bool disable_err_irq;
   253	};
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
