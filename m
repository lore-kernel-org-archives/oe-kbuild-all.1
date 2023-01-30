Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F2160
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675118964; x=1706654964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PO5YWlUBNRXNOdNebHtvXGtYmOSzMJZi7HPdSWEJ6VU=;
  b=Kcs5jSPJObjfMao6QwwXWbrDLp/mnimVt1MB8XIxL/aREOkrUD6Xxouh
   DFwdtrNswX5j2CIaMZEJh7J5Wuk6g320Z5dRucRZLfUMXDkpiBU6bdtfi
   B77fkJ4VZ6QCjUDf+AkwlieowPPVdzLureHwQpMUIgmotYh38M6ps7O9q
   iwYsrIBuc3JpIAg0e1vyREySevEprWqQMgtsD1oPKeVE0W0C92gu7t6aj
   fqbn+cAV+9kfrO/Q90qKty26wL6pd1vrC7G1ttTprHS1xH8nRCD5J2yoS
   DKz7K0ksqgBDGAO2FJlS6MsIrDvy59AdyxAPZAlECkBqFiLVtXGoWYQDH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392242292"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="392242292"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 14:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641734714"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="641734714"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 14:49:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMcxl-0003wk-2p;
	Mon, 30 Jan 2023 22:49:21 +0000
Date: Tue, 31 Jan 2023 06:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robdclark@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [linux-next:master 4150/9183] drivers/gpu/drm/msm/msm_drv.h:238:45:
 error: field 'gpu_devfreq_config' has incomplete type
Message-ID: <202301310656.JGI6Knv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544 [4150/9183] drm/msm/gpu: Add devfreq tuning debugfs
config: loongarch-randconfig-r021-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310656.JGI6Knv3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6563f60f14cbb3dcbdc4e1d8469fc0fbaaa80544
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:15,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h:8,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:9:
>> drivers/gpu/drm/msm/msm_drv.h:238:45: error: field 'gpu_devfreq_config' has incomplete type
     238 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
         |                                             ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [m]:
   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=n] || QCOM_LLCC [=n]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)


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
