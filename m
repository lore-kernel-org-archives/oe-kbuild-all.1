Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385C10947
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694809391; x=1726345391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFaE9hgHvLpK2h09eLfOIw8PkBnMwNfoQScHHn7q0/E=;
  b=ZdsyJIgUkq+Os3BlHS+v0Ji/lEXxu6yhw4A6ZbSdISGQU4u4kQm4QiDo
   HtHPXiQvLtEBokKvJ2stthTkuCL3D78g01npqmKzCBjFDGH+x47f5Cv+t
   Kh0AOs08bEtXtwae3YFsL27Uxsy/O11p5c2+01pt9yRSUnCNChzKe+Tk2
   hbLAcyJeqraVD3VX31OcbOWnyOM5qhuSgdd7/OptBWD96ItQ8IkfQJg9h
   uMGQ3FCXbVJVvd2K+AxuY7cZk2y2pZl5lX5yHpX4mLRLMqO3Oi0d8jBkm
   Dvo/7D3eaTyUWH8DquTzidpFgd9JaCvpS7NRyTPcGLfJ5WPewF9jkoPpy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443399493"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="443399493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 13:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748313980"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="748313980"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 13:23:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhFLH-0003O6-2Q;
	Fri, 15 Sep 2023 20:23:07 +0000
Date: Sat, 16 Sep 2023 04:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 12/34] htmldocs:
 ./drivers/gpu/drm/i915/pxp/intel_pxp_types.h:151: warning: Function
 parameter or member 'gsccs_clients' not described in 'intel_pxp'
Message-ID: <202309160455.TrLuosTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d40af3977b3142766b5f13198eef7dbb4c1c431c
commit: 9b39a063a5855376413f556cf1911df355f502d1 [12/34] CHROMIUM: drm/i915/pxp/mtl: Add client resource management into GSCCS
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309160455.TrLuosTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160455.TrLuosTL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/i915/pxp/intel_pxp_types.h:151: warning: Function parameter or member 'gsccs_clients' not described in 'intel_pxp'

vim +151 ./drivers/gpu/drm/i915/pxp/intel_pxp_types.h

3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24   44  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   45  /**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   46   * struct intel_pxp - pxp state
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   47   */
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24   48  struct intel_pxp {
4d1ac4038c6414 Alan Previn            2022-12-08   49  	/**
4d1ac4038c6414 Alan Previn            2022-12-08   50  	 * @ctrl_gt: poiner to the tile that owns the controls for PXP subsystem assets that
4d1ac4038c6414 Alan Previn            2022-12-08   51  	 * the VDBOX, the KCR engine (and GSC CS depending on the platform)
4d1ac4038c6414 Alan Previn            2022-12-08   52  	 */
4d1ac4038c6414 Alan Previn            2022-12-08   53  	struct intel_gt *ctrl_gt;
4d1ac4038c6414 Alan Previn            2022-12-08   54  
864929effe391b Alan Previn            2023-05-11   55  	/**
864929effe391b Alan Previn            2023-05-11   56  	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
864929effe391b Alan Previn            2023-05-11   57  	 * vs newer platforms where the KCR is inside the media-tile.
864929effe391b Alan Previn            2023-05-11   58  	 */
864929effe391b Alan Previn            2023-05-11   59  	u32 kcr_base;
864929effe391b Alan Previn            2023-05-11   60  
3a9a2e7c067690 Alan Previn            2023-05-11   61  	/**
3a9a2e7c067690 Alan Previn            2023-05-11   62  	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
3a9a2e7c067690 Alan Previn            2023-05-11   63  	 */
3a9a2e7c067690 Alan Previn            2023-05-11   64  	struct gsccs_session_resources {
3a9a2e7c067690 Alan Previn            2023-05-11   65  		u64 host_session_handle; /* used by firmware to link commands to sessions */
3a9a2e7c067690 Alan Previn            2023-05-11   66  		struct intel_context *ce; /* context for gsc command submission */
9b39a063a58553 Alan Previn            2023-01-27   67  		struct i915_address_space *vm; /* only for user space session contexts */
db82fd1a37fff1 Alan Previn            2023-05-11   68  
db82fd1a37fff1 Alan Previn            2023-05-11   69  		struct i915_vma *pkt_vma; /* GSC FW cmd packet vma */
db82fd1a37fff1 Alan Previn            2023-05-11   70  		void *pkt_vaddr;  /* GSC FW cmd packet virt pointer */
db82fd1a37fff1 Alan Previn            2023-05-11   71  
db82fd1a37fff1 Alan Previn            2023-05-11   72  		struct i915_vma *bb_vma; /* HECI_PKT batch buffer vma */
db82fd1a37fff1 Alan Previn            2023-05-11   73  		void *bb_vaddr; /* HECI_PKT batch buffer virt pointer */
3a9a2e7c067690 Alan Previn            2023-05-11   74  	} gsccs_res;
9b39a063a58553 Alan Previn            2023-01-27   75  	struct list_head gsccs_clients; /* protected by session_mutex */
3a9a2e7c067690 Alan Previn            2023-05-11   76  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   77  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   78  	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   79  	 * module. Only set and cleared inside component bind/unbind functions,
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   80  	 * which are protected by &tee_mutex.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   81  	 */
0436ac1b008d48 Huang, Sean Z          2021-09-24   82  	struct i915_pxp_component *pxp_component;
aa8d170b2732e1 Alexander Usyskin      2023-01-25   83  
aa8d170b2732e1 Alexander Usyskin      2023-01-25   84  	/* @dev_link: Enforce module relationship for power management ordering. */
aa8d170b2732e1 Alexander Usyskin      2023-01-25   85  	struct device_link *dev_link;
5c4ea8d9c16eb3 Juston Li              2021-09-30   86  	/**
5c4ea8d9c16eb3 Juston Li              2021-09-30   87  	 * @mei_pxp_last_msg_interrupted: To catch and drop stale responses
5c4ea8d9c16eb3 Juston Li              2021-09-30   88  	 * from previuosly interrupted send-msg to mei before issuing new
5c4ea8d9c16eb3 Juston Li              2021-09-30   89  	 * send-recv.
5c4ea8d9c16eb3 Juston Li              2021-09-30   90  	 */
5c4ea8d9c16eb3 Juston Li              2021-09-30   91  	bool mei_pxp_last_msg_interrupted;
5c4ea8d9c16eb3 Juston Li              2021-09-30   92  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   93  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   94  	 * @pxp_component_added: track if the pxp component has been added.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   95  	 * Set and cleared in tee init and fini functions respectively.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   96  	 */
0436ac1b008d48 Huang, Sean Z          2021-09-24   97  	bool pxp_component_added;
0436ac1b008d48 Huang, Sean Z          2021-09-24   98  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   99  	/** @ce: kernel-owned context used for PXP operations */
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24  100  	struct intel_context *ce;
cbbd3764b2399a Huang, Sean Z          2021-09-24  101  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  102  	/** @arb_mutex: protects arb session start */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  103  	struct mutex arb_mutex;
cbbd3764b2399a Huang, Sean Z          2021-09-24  104  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  105  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  106  	 * @key_instance: tracks which key instance we're on, so we can use it
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  107  	 * to determine if an object was created using the current key or a
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  108  	 * previous one.
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  109  	 */
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  110  	u32 key_instance;
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  111  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  112  	/** @tee_mutex: protects the tee channel binding and messaging. */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  113  	struct mutex tee_mutex;
2ae096872a2c61 Huang, Sean Z          2021-09-24  114  
2da9c2ed6999df Vitaly Lubart          2022-09-27  115  	/** @stream_cmd: LMEM obj used to send stream PXP commands to the GSC */
2da9c2ed6999df Vitaly Lubart          2022-09-27  116  	struct {
2da9c2ed6999df Vitaly Lubart          2022-09-27  117  		struct drm_i915_gem_object *obj; /* contains PXP command memory */
2da9c2ed6999df Vitaly Lubart          2022-09-27  118  		void *vaddr; /* virtual memory for PXP command */
2da9c2ed6999df Vitaly Lubart          2022-09-27  119  	} stream_cmd;
2da9c2ed6999df Vitaly Lubart          2022-09-27  120  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  121  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  122  	 * @hw_state_invalidated: if the HW perceives an attack on the integrity
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  123  	 * of the encryption it will invalidate the keys and expect SW to
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  124  	 * re-initialize the session. We keep track of this state to make sure
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  125  	 * we only re-start the arb session when required.
2ae096872a2c61 Huang, Sean Z          2021-09-24  126  	 */
2ae096872a2c61 Huang, Sean Z          2021-09-24  127  	bool hw_state_invalidated;
2ae096872a2c61 Huang, Sean Z          2021-09-24  128  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  129  	/** @irq_enabled: tracks the status of the kcr irqs */
2ae096872a2c61 Huang, Sean Z          2021-09-24  130  	bool irq_enabled;
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  131  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  132  	 * @termination: tracks the status of a pending termination. Only
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  133  	 * re-initialized under gt->irq_lock and completed in &session_work.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  134  	 */
2ae096872a2c61 Huang, Sean Z          2021-09-24  135  	struct completion termination;
2ae096872a2c61 Huang, Sean Z          2021-09-24  136  
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  137  	/** @session_mutex: protects hwdrm_sesions, and reserved_sessions. */
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  138  	struct mutex session_mutex;
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  139  	DECLARE_BITMAP(reserved_sessions, INTEL_PXP_MAX_HWDRM_SESSIONS);
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  140  	struct intel_pxp_session *hwdrm_sessions[INTEL_PXP_MAX_HWDRM_SESSIONS];
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  141  	struct intel_pxp_session arb_session;
8870687b2cc07c Huang, Sean Z          2020-12-09  142  	u8 next_tag_id[INTEL_PXP_MAX_HWDRM_SESSIONS];
9aa7f609111f26 Daniele Ceraolo Spurio 2021-04-28  143  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  144  	/** @session_work: worker that manages session events. */
2ae096872a2c61 Huang, Sean Z          2021-09-24  145  	struct work_struct session_work;
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  146  	/** @session_events: pending session events, protected with gt->irq_lock. */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  147  	u32 session_events;
2ae096872a2c61 Huang, Sean Z          2021-09-24  148  #define PXP_TERMINATION_REQUEST  BIT(0)
2ae096872a2c61 Huang, Sean Z          2021-09-24  149  #define PXP_TERMINATION_COMPLETE BIT(1)
32271ecd6596e6 Daniele Ceraolo Spurio 2021-09-24  150  #define PXP_INVAL_REQUIRED       BIT(2)
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24 @151  };
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24  152  

:::::: The code at line 151 was first introduced by commit
:::::: 3ad2dd9c4caa7330dd08244e94bec49a62fee6e4 drm/i915/pxp: allocate a vcs context for pxp usage

:::::: TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
