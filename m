Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D3619397
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692995292; x=1724531292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KNQDy7GoPxw1urxB2S4tKwYFVUxfZeMu1tMfLdgJCiI=;
  b=VUvJg3uhnTv989K2UNXL+vKOjeIVhrA0/0tV/Ob35rZZ+T2kVTBjDXmd
   r4ME6lbjk06AN3TgTyX8LZdK6JKKPvOdRGfxXHdYZDDAlnTsZJFhuae59
   YByZrHzS9q4oHpGoDvfjwiJWveaIotSy5EQJDntvOZ3k310F/cEytWaP4
   QBQ+R1U1xDVYuZdUIsZV7SlYL6a+pmK8bpQ97N0FlJbPLxTKKKP4wBVl0
   F3USAPfESh+1fLeMwevTwn1OjPzkaK2/4yGa2cPubb0PyZcrg8TDhLoVK
   FV2/JsoQoSTtcHeR2etzxbdugnmpLVgNY1ays8V1Pn7bEFLgExXF3cnji
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373665533"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="373665533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731162064"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="731162064"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 13:28:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdPX-0003yt-0j;
	Fri, 25 Aug 2023 20:28:05 +0000
Date: Sat, 26 Aug 2023 04:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Huang, Sean Z" <sean.z.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [intel-lts:6.1/linux 2335/2351]
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h:144: warning: Function parameter
 or member 'next_tag_id' not described in 'intel_pxp'
Message-ID: <202308260434.tDPLuOXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   bcf6f14318c852a7319cf3ebeb0978432e314c0e
commit: 6977158e8425a487e4952c99eb80310471226b9f [2335/2351] drm/i915/pxp:[PXP-MULTI-UAPI] Implement ioctl action to query PXP tag
config: x86_64-randconfig-004-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260434.tDPLuOXg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260434.tDPLuOXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260434.tDPLuOXg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/pxp/intel_pxp_types.h:144: warning: Function parameter or member 'reserved_sessions' not described in 'intel_pxp'
   drivers/gpu/drm/i915/pxp/intel_pxp_types.h:144: warning: Function parameter or member 'hwdrm_sessions' not described in 'intel_pxp'
   drivers/gpu/drm/i915/pxp/intel_pxp_types.h:144: warning: Function parameter or member 'arb_session' not described in 'intel_pxp'
>> drivers/gpu/drm/i915/pxp/intel_pxp_types.h:144: warning: Function parameter or member 'next_tag_id' not described in 'intel_pxp'
   4 warnings as Errors


vim +144 drivers/gpu/drm/i915/pxp/intel_pxp_types.h

3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24   44  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   45  /**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   46   * struct intel_pxp - pxp state
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   47   */
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24   48  struct intel_pxp {
ba9fb207e7fa78 Alan Previn            2022-12-08   49  	/**
ba9fb207e7fa78 Alan Previn            2022-12-08   50  	 * @ctrl_gt: poiner to the tile that owns the controls for PXP subsystem assets that
ba9fb207e7fa78 Alan Previn            2022-12-08   51  	 * the VDBOX, the KCR engine (and GSC CS depending on the platform)
ba9fb207e7fa78 Alan Previn            2022-12-08   52  	 */
ba9fb207e7fa78 Alan Previn            2022-12-08   53  	struct intel_gt *ctrl_gt;
ba9fb207e7fa78 Alan Previn            2022-12-08   54  
ec41a80740ee13 Alan Previn            2023-05-11   55  	/**
ec41a80740ee13 Alan Previn            2023-05-11   56  	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
ec41a80740ee13 Alan Previn            2023-05-11   57  	 * vs newer platforms where the KCR is inside the media-tile.
ec41a80740ee13 Alan Previn            2023-05-11   58  	 */
ec41a80740ee13 Alan Previn            2023-05-11   59  	u32 kcr_base;
ec41a80740ee13 Alan Previn            2023-05-11   60  
7949319302adfe Alan Previn            2023-05-11   61  	/**
7949319302adfe Alan Previn            2023-05-11   62  	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
7949319302adfe Alan Previn            2023-05-11   63  	 */
7949319302adfe Alan Previn            2023-05-11   64  	struct gsccs_session_resources {
7949319302adfe Alan Previn            2023-05-11   65  		u64 host_session_handle; /* used by firmware to link commands to sessions */
7949319302adfe Alan Previn            2023-05-11   66  		struct intel_context *ce; /* context for gsc command submission */
33b9efbde1283c Alan Previn            2023-05-11   67  
33b9efbde1283c Alan Previn            2023-05-11   68  		struct i915_vma *pkt_vma; /* GSC FW cmd packet vma */
33b9efbde1283c Alan Previn            2023-05-11   69  		void *pkt_vaddr;  /* GSC FW cmd packet virt pointer */
33b9efbde1283c Alan Previn            2023-05-11   70  
33b9efbde1283c Alan Previn            2023-05-11   71  		struct i915_vma *bb_vma; /* HECI_PKT batch buffer vma */
33b9efbde1283c Alan Previn            2023-05-11   72  		void *bb_vaddr; /* HECI_PKT batch buffer virt pointer */
7949319302adfe Alan Previn            2023-05-11   73  	} gsccs_res;
7949319302adfe Alan Previn            2023-05-11   74  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   75  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   76  	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   77  	 * module. Only set and cleared inside component bind/unbind functions,
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   78  	 * which are protected by &tee_mutex.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   79  	 */
0436ac1b008d48 Huang, Sean Z          2021-09-24   80  	struct i915_pxp_component *pxp_component;
a6133bdffc8b57 Alexander Usyskin      2023-01-25   81  
6ac392fcbec01a Jani Nikula            2023-05-02   82  	/**
6ac392fcbec01a Jani Nikula            2023-05-02   83  	 * @dev_link: Enforce module relationship for power management ordering.
6ac392fcbec01a Jani Nikula            2023-05-02   84  	 */
a6133bdffc8b57 Alexander Usyskin      2023-01-25   85  	struct device_link *dev_link;
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   86  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   87  	 * @pxp_component_added: track if the pxp component has been added.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   88  	 * Set and cleared in tee init and fini functions respectively.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   89  	 */
0436ac1b008d48 Huang, Sean Z          2021-09-24   90  	bool pxp_component_added;
0436ac1b008d48 Huang, Sean Z          2021-09-24   91  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   92  	/** @ce: kernel-owned context used for PXP operations */
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24   93  	struct intel_context *ce;
cbbd3764b2399a Huang, Sean Z          2021-09-24   94  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   95  	/** @arb_mutex: protects arb session start */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   96  	struct mutex arb_mutex;
cbbd3764b2399a Huang, Sean Z          2021-09-24   97  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   98  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24   99  	 * @key_instance: tracks which key instance we're on, so we can use it
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  100  	 * to determine if an object was created using the current key or a
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  101  	 * previous one.
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  102  	 */
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  103  	u32 key_instance;
d3ac8d42168a9b Daniele Ceraolo Spurio 2021-09-24  104  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  105  	/** @tee_mutex: protects the tee channel binding and messaging. */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  106  	struct mutex tee_mutex;
2ae096872a2c61 Huang, Sean Z          2021-09-24  107  
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  108  	/** @stream_cmd: LMEM obj used to send stream PXP commands to the GSC */
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  109  	struct {
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  110  		struct drm_i915_gem_object *obj; /* contains PXP command memory */
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  111  		void *vaddr; /* virtual memory for PXP command */
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  112  	} stream_cmd;
8bb68ea7d2d926 Vitaly Lubart          2022-09-27  113  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  114  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  115  	 * @hw_state_invalidated: if the HW perceives an attack on the integrity
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  116  	 * of the encryption it will invalidate the keys and expect SW to
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  117  	 * re-initialize the session. We keep track of this state to make sure
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  118  	 * we only re-start the arb session when required.
2ae096872a2c61 Huang, Sean Z          2021-09-24  119  	 */
2ae096872a2c61 Huang, Sean Z          2021-09-24  120  	bool hw_state_invalidated;
2ae096872a2c61 Huang, Sean Z          2021-09-24  121  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  122  	/** @irq_enabled: tracks the status of the kcr irqs */
2ae096872a2c61 Huang, Sean Z          2021-09-24  123  	bool irq_enabled;
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  124  	/**
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  125  	 * @termination: tracks the status of a pending termination. Only
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  126  	 * re-initialized under gt->irq_lock and completed in &session_work.
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  127  	 */
2ae096872a2c61 Huang, Sean Z          2021-09-24  128  	struct completion termination;
2ae096872a2c61 Huang, Sean Z          2021-09-24  129  
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  130  	/** @session_mutex: protects hwdrm_sesions, and reserved_sessions. */
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  131  	struct mutex session_mutex;
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  132  	DECLARE_BITMAP(reserved_sessions, INTEL_PXP_MAX_HWDRM_SESSIONS);
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  133  	struct intel_pxp_session *hwdrm_sessions[INTEL_PXP_MAX_HWDRM_SESSIONS];
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  134  	struct intel_pxp_session arb_session;
6977158e8425a4 Huang, Sean Z          2020-12-09  135  	u8 next_tag_id[INTEL_PXP_MAX_HWDRM_SESSIONS];
aa985f9124e10e Daniele Ceraolo Spurio 2021-04-28  136  
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  137  	/** @session_work: worker that manages session events. */
2ae096872a2c61 Huang, Sean Z          2021-09-24  138  	struct work_struct session_work;
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  139  	/** @session_events: pending session events, protected with gt->irq_lock. */
2d5517a5c8bfcd Daniele Ceraolo Spurio 2021-09-24  140  	u32 session_events;
2ae096872a2c61 Huang, Sean Z          2021-09-24  141  #define PXP_TERMINATION_REQUEST  BIT(0)
2ae096872a2c61 Huang, Sean Z          2021-09-24  142  #define PXP_TERMINATION_COMPLETE BIT(1)
32271ecd6596e6 Daniele Ceraolo Spurio 2021-09-24  143  #define PXP_INVAL_REQUIRED       BIT(2)
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24 @144  };
3ad2dd9c4caa73 Daniele Ceraolo Spurio 2021-09-24  145  

:::::: The code at line 144 was first introduced by commit
:::::: 3ad2dd9c4caa7330dd08244e94bec49a62fee6e4 drm/i915/pxp: allocate a vcs context for pxp usage

:::::: TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
