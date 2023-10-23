Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D276C15EA7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERTCVnoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698061491; x=1729597491;
  h=date:from:cc:subject:message-id:mime-version;
  bh=a6FR7RBtUYAp9DI4iRwg15I6FrCO8vuea7zBC8ZW9qg=;
  b=ERTCVnoZEvnj8kPLX7QII0dcgAH4Qq6rv0t6beQPTxzoZyDuZ7xyrCqk
   E+JBG7F1vQ/Sgsbh0zOkl8EUFSk8U/YWS1yFXX95OAJn5zdt7wZq72ujr
   hNlvIKh7LryOvt2eE9iZx7MwgsZtVZGajp878HH1r6T8cjO4vcQ92aaPr
   11ihiK+vmlsCMCee9O1Cvn260I8RLEnOuANAHUEB/dX5axglSVXimUTcm
   HUSrlYwvdK9LVYy6JTAWEX1Xpz7K+QhMixbAGjISpbvh7DTnqSFg3Liua
   4iQpWsZOInX24KY7DGM3f7rokNTq7xF5ELfIPtLsTac7hyz8ck6TYVfp5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="473034711"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="473034711"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734639951"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="734639951"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Oct 2023 04:44:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qutMU-0006s0-2h;
	Mon, 23 Oct 2023 11:44:46 +0000
Date: Mon, 23 Oct 2023 19:44:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 179/2351] drivers/gpu/drm/msm/msm_drv.h:237:45:
 error: field 'gpu_devfreq_config' has incomplete type
Message-ID: <202310231950.dQQ4CnOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   f2dd63af74e6d69feb6350c55dfdb0ee6c166416
commit: 48a95ae6c5e6fa970128aaa20466f2f4294a032e [179/2351] drm/msm/gpu: Add devfreq tuning debugfs
config: i386-buildonly-randconfig-004-20231023 (https://download.01.org/0day-ci/archive/20231023/202310231950.dQQ4CnOG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310231950.dQQ4CnOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231950.dQQ4CnOG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/dsi/dsi.h:16,
                    from drivers/gpu/drm/msm/dsi/dsi_host.c:27:
>> drivers/gpu/drm/msm/msm_drv.h:237:45: error: field 'gpu_devfreq_config' has incomplete type
     237 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
         |                                             ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/msm/msm_kms.h:14,
                    from drivers/gpu/drm/msm/disp/msm_disp_snapshot.h:27,
                    from drivers/gpu/drm/msm/msm_drv.c:23:
>> drivers/gpu/drm/msm/msm_drv.h:237:45: error: field 'gpu_devfreq_config' has incomplete type
     237 |         struct devfreq_simple_ondemand_data gpu_devfreq_config;
         |                                             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_drm_init':
   drivers/gpu/drm/msm/msm_drv.c:438:17: error: label 'err_put_dev' used but not defined
     438 |                 goto err_put_dev;
         |                 ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_GOV_SIMPLE_ONDEMAND
   Depends on [n]: PM_DEVFREQ [=n]
   Selected by [y]:
   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)


vim +/gpu_devfreq_config +237 drivers/gpu/drm/msm/msm_drv.h

   106	
   107		struct drm_device *dev;
   108	
   109		struct msm_kms *kms;
   110		int (*kms_init)(struct drm_device *dev);
   111	
   112		/* subordinate devices, if present: */
   113		struct platform_device *gpu_pdev;
   114	
   115		/* possibly this should be in the kms component, but it is
   116		 * shared by both mdp4 and mdp5..
   117		 */
   118		struct hdmi *hdmi;
   119	
   120		/* DSI is shared by mdp4 and mdp5 */
   121		struct msm_dsi *dsi[2];
   122	
   123		struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
   124	
   125		/* when we have more than one 'msm_gpu' these need to be an array: */
   126		struct msm_gpu *gpu;
   127	
   128		/* gpu is only set on open(), but we need this info earlier */
   129		bool is_a2xx;
   130		bool has_cached_coherent;
   131	
   132		struct drm_fb_helper *fbdev;
   133	
   134		struct msm_rd_state *rd;       /* debugfs to dump all submits */
   135		struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
   136		struct msm_perf_state *perf;
   137	
   138		/**
   139		 * List of all GEM objects (mainly for debugfs, protected by obj_lock
   140		 * (acquire before per GEM object lock)
   141		 */
   142		struct list_head objects;
   143		struct mutex obj_lock;
   144	
   145		/**
   146		 * lru:
   147		 *
   148		 * The various LRU's that a GEM object is in at various stages of
   149		 * it's lifetime.  Objects start out in the unbacked LRU.  When
   150		 * pinned (for scannout or permanently mapped GPU buffers, like
   151		 * ringbuffer, memptr, fw, etc) it moves to the pinned LRU.  When
   152		 * unpinned, it moves into willneed or dontneed LRU depending on
   153		 * madvise state.  When backing pages are evicted (willneed) or
   154		 * purged (dontneed) it moves back into the unbacked LRU.
   155		 *
   156		 * The dontneed LRU is considered by the shrinker for objects
   157		 * that are candidate for purging, and the willneed LRU is
   158		 * considered for objects that could be evicted.
   159		 */
   160		struct {
   161			/**
   162			 * unbacked:
   163			 *
   164			 * The LRU for GEM objects without backing pages allocated.
   165			 * This mostly exists so that objects are always is one
   166			 * LRU.
   167			 */
   168			struct drm_gem_lru unbacked;
   169	
   170			/**
   171			 * pinned:
   172			 *
   173			 * The LRU for pinned GEM objects
   174			 */
   175			struct drm_gem_lru pinned;
   176	
   177			/**
   178			 * willneed:
   179			 *
   180			 * The LRU for unpinned GEM objects which are in madvise
   181			 * WILLNEED state (ie. can be evicted)
   182			 */
   183			struct drm_gem_lru willneed;
   184	
   185			/**
   186			 * dontneed:
   187			 *
   188			 * The LRU for unpinned GEM objects which are in madvise
   189			 * DONTNEED state (ie. can be purged)
   190			 */
   191			struct drm_gem_lru dontneed;
   192	
   193			/**
   194			 * lock:
   195			 *
   196			 * Protects manipulation of all of the LRUs.
   197			 */
   198			struct mutex lock;
   199		} lru;
   200	
   201		struct workqueue_struct *wq;
   202	
   203		unsigned int num_crtcs;
   204		struct drm_crtc *crtcs[MAX_CRTCS];
   205	
   206		struct msm_drm_thread event_thread[MAX_CRTCS];
   207	
   208		unsigned int num_bridges;
   209		struct drm_bridge *bridges[MAX_BRIDGES];
   210	
   211		/* VRAM carveout, used when no IOMMU: */
   212		struct {
   213			unsigned long size;
   214			dma_addr_t paddr;
   215			/* NOTE: mm managed at the page level, size is in # of pages
   216			 * and position mm_node->start is in # of pages:
   217			 */
   218			struct drm_mm mm;
   219			spinlock_t lock; /* Protects drm_mm node allocation/removal */
   220		} vram;
   221	
   222		struct notifier_block vmap_notifier;
   223		struct shrinker shrinker;
   224	
   225		struct drm_atomic_state *pm_state;
   226	
   227		/**
   228		 * hangcheck_period: For hang detection, in ms
   229		 *
   230		 * Note that in practice, a submit/job will get at least two hangcheck
   231		 * periods, due to checking for progress being implemented as simply
   232		 * "have the CP position registers changed since last time?"
   233		 */
   234		unsigned int hangcheck_period;
   235	
   236		/** gpu_devfreq_config: Devfreq tuning config for the GPU. */
 > 237		struct devfreq_simple_ondemand_data gpu_devfreq_config;
   238	
   239		/**
   240		 * gpu_clamp_to_idle: Enable clamping to idle freq when inactive
   241		 */
   242		bool gpu_clamp_to_idle;
   243	
   244		/**
   245		 * disable_err_irq:
   246		 *
   247		 * Disable handling of GPU hw error interrupts, to force fallback to
   248		 * sw hangcheck timer.  Written (via debugfs) by igt tests to test
   249		 * the sw hangcheck mechanism.
   250		 */
   251		bool disable_err_irq;
   252	};
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
