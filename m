Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B256161
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 00:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683159287; x=1714695287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5/PAq1CgoCcecz4AHqB9OdvjH90Py8BMCiEJPpZ5MU=;
  b=U3LfWxUytgUvnwLPelRISwhiYjwP+oaqhxrKzMA9xZXkQY5luQHVYara
   oPoQA7kmzb69YAzkZ3+hBR56p+VBQUZljrw1Io4Psim+bRQf/1IuUs6Qx
   tUq4jJ4ctKZZvbH3U6G9CcTrDIdlnfxC3PLo55F3vOksSW27SYlz/MySD
   Io2x01s/gf8QsgkthesYz5aWW21PKBHDNFMNIlUYrUux5mXTyylcHOWYH
   K54WbkbBCeV+HNSGFtXIK44Ig1TWYiBOuRbKC7v1LlkfvqGuXybuxRqRw
   zEwzLDTfKoILitUsvMs3CbpYQlZTz6R0VKR2c0Equ9buNLyfuG4xy4FtB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414262323"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="414262323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 17:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="761699662"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="761699662"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 17:14:44 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puMcI-0002Ny-1m;
	Thu, 04 May 2023 00:14:38 +0000
Date: Thu, 4 May 2023 08:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmgt_page_track_cleanups 20/27]
 drivers/gpu/drm/i915/gvt/gvt.h:235:45: error: field 'track_node' has
 incomplete type
Message-ID: <202305040853.ZGtDea2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmgt_page_track_cleanups
head:   bfd59fb252be6cab5b5fba255307b4e8480fa03e
commit: 9ec394cb9ebef86af3af3048d78c0b4ae2aa7bdf [20/27] KVM: x86/mmu: Use page-track notifiers iff there are external users
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230504/202305040853.ZGtDea2W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/9ec394cb9ebef86af3af3048d78c0b4ae2aa7bdf
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/kvmgt_page_track_cleanups
        git checkout 9ec394cb9ebef86af3af3048d78c0b4ae2aa7bdf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040853.ZGtDea2W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> drivers/gpu/drm/i915/gvt/gvt.h:235:45: error: field 'track_node' has incomplete type
     235 |         struct kvm_page_track_notifier_node track_node;
         |                                             ^~~~~~~~~~


vim +/track_node +235 drivers/gpu/drm/i915/gvt/gvt.h

a06d4b9e15c0ea Zhi Wang          2022-11-10  180  
0ad35fed618cec Zhi Wang          2016-06-16  181  struct intel_vgpu {
a5ddd2a99a7a39 Kevin Tian        2022-09-21  182  	struct vfio_device vfio_device;
0ad35fed618cec Zhi Wang          2016-06-16  183  	struct intel_gvt *gvt;
f25a49ab8ab9c1 Colin Xu          2018-05-19  184  	struct mutex vgpu_lock;
0ad35fed618cec Zhi Wang          2016-06-16  185  	int id;
a06d4b9e15c0ea Zhi Wang          2022-11-10  186  	DECLARE_BITMAP(status, INTEL_VGPU_STATUS_NR_BITS);
fd64be636708d8 Min He            2017-02-17  187  	bool pv_notified;
fd64be636708d8 Min He            2017-02-17  188  	bool failsafe;
6184cc8ddbb318 Chuanxiao Dong    2017-08-01  189  	unsigned int resetting_eng;
9a512e23f173a3 Colin Xu          2018-05-19  190  
9a512e23f173a3 Colin Xu          2018-05-19  191  	/* Both sched_data and sched_ctl can be seen a part of the global gvt
9a512e23f173a3 Colin Xu          2018-05-19  192  	 * scheduler structure. So below 2 vgpu data are protected
9a512e23f173a3 Colin Xu          2018-05-19  193  	 * by sched_lock, not vgpu_lock.
9a512e23f173a3 Colin Xu          2018-05-19  194  	 */
4b63960ebd3f4c Zhi Wang          2016-05-01  195  	void *sched_data;
bc90d097ae144f Ping Gao          2017-03-30  196  	struct vgpu_sched_ctl sched_ctl;
28a60dee2ce602 Zhi Wang          2016-09-02  197  
28a60dee2ce602 Zhi Wang          2016-09-02  198  	struct intel_vgpu_fence fence;
28a60dee2ce602 Zhi Wang          2016-09-02  199  	struct intel_vgpu_gm gm;
82d375d1b56820 Zhi Wang          2016-07-05  200  	struct intel_vgpu_cfg_space cfg_space;
82d375d1b56820 Zhi Wang          2016-07-05  201  	struct intel_vgpu_mmio mmio;
c8fe6a6811a718 Zhi Wang          2015-09-17  202  	struct intel_vgpu_irq irq;
2707e44466881d Zhi Wang          2016-03-28  203  	struct intel_vgpu_gtt gtt;
4d60c5fd3f8751 Zhi Wang          2016-07-20  204  	struct intel_vgpu_opregion opregion;
04d348ae3f0aea Zhi Wang          2016-04-25  205  	struct intel_vgpu_display display;
1406a14b0ed977 Zhi Wang          2017-09-10  206  	struct intel_vgpu_submission submission;
e502a2af4c358d Changbin Du       2018-01-30  207  	struct radix_tree_root page_track_tree;
a2ae95af964631 Weinan Li         2017-10-20  208  	u32 hws_pga[I915_NUM_ENGINES];
ba25d977571e15 Colin Xu          2020-07-09  209  	/* Set on PCI_D3, reset on DMLR, not reflecting the actual PM state */
ba25d977571e15 Colin Xu          2020-07-09  210  	bool d3_entered;
f30437c5e7bfa9 Jike Song         2016-11-09  211  
bc7b0be316aeba Changbin Du       2017-09-26  212  	struct dentry *debugfs;
bc7b0be316aeba Changbin Du       2017-09-26  213  
e546e281d33d1f Tina Zhang        2017-11-23  214  	struct list_head dmabuf_obj_list_head;
e546e281d33d1f Tina Zhang        2017-11-23  215  	struct mutex dmabuf_lock;
e546e281d33d1f Tina Zhang        2017-11-23  216  	struct idr object_idr;
b01739fb865a26 Colin Xu          2021-02-26  217  	struct intel_vgpu_vblank_timer vblank_timer;
e546e281d33d1f Tina Zhang        2017-11-23  218  
96bebe39b2f453 Zhao Yan          2018-04-04  219  	u32 scan_nonprivbb;
28a60dee2ce602 Zhi Wang          2016-09-02  220  
62980cacc37f58 Christoph Hellwig 2022-04-11  221  	struct vfio_region *region;
62980cacc37f58 Christoph Hellwig 2022-04-11  222  	int num_regions;
62980cacc37f58 Christoph Hellwig 2022-04-11  223  	struct eventfd_ctx *intx_trigger;
62980cacc37f58 Christoph Hellwig 2022-04-11  224  	struct eventfd_ctx *msi_trigger;
62980cacc37f58 Christoph Hellwig 2022-04-11  225  
62980cacc37f58 Christoph Hellwig 2022-04-11  226  	/*
62980cacc37f58 Christoph Hellwig 2022-04-11  227  	 * Two caches are used to avoid mapping duplicated pages (eg.
62980cacc37f58 Christoph Hellwig 2022-04-11  228  	 * scratch pages). This help to reduce dma setup overhead.
62980cacc37f58 Christoph Hellwig 2022-04-11  229  	 */
62980cacc37f58 Christoph Hellwig 2022-04-11  230  	struct rb_root gfn_cache;
62980cacc37f58 Christoph Hellwig 2022-04-11  231  	struct rb_root dma_addr_cache;
62980cacc37f58 Christoph Hellwig 2022-04-11  232  	unsigned long nr_cache_entries;
62980cacc37f58 Christoph Hellwig 2022-04-11  233  	struct mutex cache_lock;
62980cacc37f58 Christoph Hellwig 2022-04-11  234  
10ddb96295f3bd Christoph Hellwig 2022-04-11 @235  	struct kvm_page_track_notifier_node track_node;
10ddb96295f3bd Christoph Hellwig 2022-04-11  236  #define NR_BKT (1 << 18)
10ddb96295f3bd Christoph Hellwig 2022-04-11  237  	struct hlist_head ptable[NR_BKT];
10ddb96295f3bd Christoph Hellwig 2022-04-11  238  #undef NR_BKT
62980cacc37f58 Christoph Hellwig 2022-04-11  239  };
06d63c48dd30b9 Julian Stecklina  2020-02-17  240  

:::::: The code at line 235 was first introduced by commit
:::::: 10ddb96295f3bdc6caf4518b8001725440d7a7d2 drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Zhi Wang <zhi.a.wang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
