Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93ECA94F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741240334; cv=none; b=ehwE1NFxy+TrBP4Ll3fq194jRZiVoNcnFyJY/Gqo2idNaQtoX6m9VGyomgo46y8oxoaDN30pv1gTGpi8Ze3HSIAhoiw18bTuJU3dg3MNFAy8cA299hZLsRexuN7CIcSmHiDsDOzIY9B2pMac7viazRyRnJCN+JhMVTYthvSZCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741240334; c=relaxed/simple;
	bh=GYEAqCQore3wFZhWlemBpK8DRt/QTEEq5rCIPrKaihE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpFcw7ByuvOAIg8/pBhy9AT+GN/xjWj3lr6jEFkPTVNLbJ3NNQb+XdluLUM5DglWCkFEwLWdH8PXYHxT+7s5LRYnkJZrSdhKCsHWnn7cXKRz2YNY9+J7uGRizp442iFanNNC8hHd7u4voY2bCtgQcgOoOiQLaSIBALCAfPZondY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITtkFXl8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITtkFXl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741240332; x=1772776332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYEAqCQore3wFZhWlemBpK8DRt/QTEEq5rCIPrKaihE=;
  b=ITtkFXl8hr6g/r7YUk25Z624BHNkuq71ptcuBx5NTjUCLMIEyHt3yDaa
   VYJmQ4SYgh7QYGCpRyr8E+Kvsp21BWuM4/w0fzgZLfoBZqpdG6hQvZ2NW
   EA9kw2TCMgGdI//EbSsuUW+IqivsqhL7j5usLZ3cHJ1imKYL7P1vDPskD
   dUt30f2dpu8rnndsO1UWFzQBxT9ycLTEynNlW7Kq+EVXI66nfUhmC7GtJ
   SCvY7H0+t62fOmYHcuNzqklWlEfb0p51PztTA3mRX8n9f1so8Sut4drLy
   JRAmmSnYm9+Z8HXNWd+UyR4afRFLWRWp0VvQlHEdaKmWj3vsUpKMBNSUN
   A==;
X-CSE-ConnectionGUID: vsEoDMOdSritaVZgCfilog==
X-CSE-MsgGUID: fBYCo7VQRwOkhzxIbE++nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46007718"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="46007718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:52:11 -0800
X-CSE-ConnectionGUID: JQgycnJoTnmOtgVtWlDmmg==
X-CSE-MsgGUID: +EFp/eH+SKCkaoFlVJTJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="149688991"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2025 21:52:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq49P-000MbS-1Z;
	Thu, 06 Mar 2025 05:52:07 +0000
Date: Thu, 6 Mar 2025 13:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [drm-msm:msm-next 9/37]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:218: warning: Function parameter
 or struct member 'cwb_mask' not described in 'dpu_encoder_virt'
Message-ID: <202503061352.mMd1rKYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   6d3175a72cc07e90f81fb35841048a8a9b5134cb
commit: dd331404ac7c155b2863038864901049fcf9d3fe [9/37] drm/msm/dpu: Configure CWB in writeback encoder
config: arm64-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061352.mMd1rKYG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061352.mMd1rKYG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061352.mMd1rKYG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:218: warning: Function parameter or struct member 'cwb_mask' not described in 'dpu_encoder_virt'


vim +218 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  119  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  120  /**
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  121   * struct dpu_encoder_virt - virtual encoder. Container of one or more physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  122   *	encoders. Virtual encoder manages one "logical" display. Physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  123   *	encoders manage one intf block, tied to a specific panel/sub-panel.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  124   *	Virtual encoder defers as much as possible to the physical encoders.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  125   *	Virtual encoder registers itself with the DRM Framework as the encoder.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  126   * @base:		drm_encoder base class for registration with DRM
585b3f9472eea8 Sean Paul         2018-11-16  127   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
fba7427eb59496 Sean Paul         2018-11-16  128   * @enabled:		True if the encoder is active, protected by enc_lock
4be445f5b6b681 Dmitry Baryshkov  2024-02-26  129   * @commit_done_timedout: True if there has been a timeout on commit after
4be445f5b6b681 Dmitry Baryshkov  2024-02-26  130   *			enabling the encoder.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  131   * @num_phys_encs:	Actual number of physical encoders contained.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  132   * @phys_encs:		Container of physical encoders managed.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  133   * @cur_master:		Pointer to the current master in this mode. Optimization
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  134   *			Only valid after enable. Cleared as disable.
cca5ff947c7c6e Lee Jones         2020-11-23  135   * @cur_slave:		As above but for the slave encoder.
cca5ff947c7c6e Lee Jones         2020-11-23  136   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  137   *			pingpong blocks can be different than num_phys_encs.
5008375443ed26 Jessica Zhang     2025-02-14  138   * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
5008375443ed26 Jessica Zhang     2025-02-14  139   *			display. Number of CWB muxes can be different than
5008375443ed26 Jessica Zhang     2025-02-14  140   *			num_phys_encs.
58dca981074948 Vinod Koul        2022-04-06  141   * @hw_dsc:		Handle to the DSC blocks used for the display.
58dca981074948 Vinod Koul        2022-04-06  142   * @dsc_mask:		Bitmask of used DSC blocks.
dd331404ac7c15 Jessica Zhang     2025-02-14  143   * @cwb_mask		Bitmask of used CWB muxes
cca5ff947c7c6e Lee Jones         2020-11-23  144   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  145   *			for partial update right-only cases, such as pingpong
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  146   *			split where virtual pingpong does not generate IRQs
e4914867ac99ca Sean Paul         2018-11-16  147   * @crtc:		Pointer to the currently assigned crtc. Normally you
e4914867ac99ca Sean Paul         2018-11-16  148   *			would use crtc->state->encoder_mask to determine the
e4914867ac99ca Sean Paul         2018-11-16  149   *			link between encoder/crtc. However in this case we need
e4914867ac99ca Sean Paul         2018-11-16  150   *			to track crtc in the disable() hook which is called
e4914867ac99ca Sean Paul         2018-11-16  151   *			_after_ encoder_mask is cleared.
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  152   * @connector:		If a mode is set, cached pointer to the active connector
fba7427eb59496 Sean Paul         2018-11-16  153   * @enc_lock:			Lock around physical encoder
fba7427eb59496 Sean Paul         2018-11-16  154   *				create/destroy/enable/disable
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  155   * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  156   *				busy processing current command.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  157   *				Bit0 = phys_encs[0] etc.
70df9610de0fd3 Sean Paul         2019-01-28  158   * @frame_done_timeout_ms:	frame done timeout in ms
9cad81143ef000 Paloma Arellano   2023-11-30  159   * @frame_done_timeout_cnt:	atomic counter tracking the number of frame
9cad81143ef000 Paloma Arellano   2023-11-30  160   * 				done timeouts
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  161   * @frame_done_timer:		watchdog timer for frame done event
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  162   * @disp_info:			local copy of msm_display_info struct
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  163   * @idle_pc_supported:		indicate if idle power collaps is supported
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  164   * @rc_lock:			resource control mutex lock to protect
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  165   *				virt encoder over various state changes
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  166   * @rc_state:			resource controller state
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  167   * @delayed_off_work:		delayed worker to schedule disabling of
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  168   *				clks and resources after IDLE_TIMEOUT time.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  169   * @topology:                   topology of the display
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  170   * @idle_timeout:		idle timeout duration in milliseconds
4b27f469b155bd Dmitry Baryshkov  2023-01-18  171   * @wide_bus_en:		wide bus is enabled on this interface
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  172   * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  173   */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  174  struct dpu_encoder_virt {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  175  	struct drm_encoder base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  176  	spinlock_t enc_spinlock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  177  
fba7427eb59496 Sean Paul         2018-11-16  178  	bool enabled;
4be445f5b6b681 Dmitry Baryshkov  2024-02-26  179  	bool commit_done_timedout;
fba7427eb59496 Sean Paul         2018-11-16  180  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  181  	unsigned int num_phys_encs;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  182  	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  183  	struct dpu_encoder_phys *cur_master;
86b89080368b46 Jeykumar Sankaran 2018-09-05  184  	struct dpu_encoder_phys *cur_slave;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  185  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
5008375443ed26 Jessica Zhang     2025-02-14  186  	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  187  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  188  
58dca981074948 Vinod Koul        2022-04-06  189  	unsigned int dsc_mask;
dd331404ac7c15 Jessica Zhang     2025-02-14  190  	unsigned int cwb_mask;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  191  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  192  	bool intfs_swapped;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  193  
e4914867ac99ca Sean Paul         2018-11-16  194  	struct drm_crtc *crtc;
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  195  	struct drm_connector *connector;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  196  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  197  	struct mutex enc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  198  	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  199  
70df9610de0fd3 Sean Paul         2019-01-28  200  	atomic_t frame_done_timeout_ms;
9cad81143ef000 Paloma Arellano   2023-11-30  201  	atomic_t frame_done_timeout_cnt;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  202  	struct timer_list frame_done_timer;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  203  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  204  	struct msm_display_info disp_info;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  205  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  206  	bool idle_pc_supported;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  207  	struct mutex rc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  208  	enum dpu_enc_rc_states rc_state;
e077fe752cd344 Jeykumar Sankaran 2018-12-14  209  	struct delayed_work delayed_off_work;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  210  	struct msm_display_topology topology;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  211  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  212  	u32 idle_timeout;
3309a75639718c Kuogee Hsieh      2022-02-25  213  
3309a75639718c Kuogee Hsieh      2022-02-25  214  	bool wide_bus_en;
58dca981074948 Vinod Koul        2022-04-06  215  
58dca981074948 Vinod Koul        2022-04-06  216  	/* DSC configuration */
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  217  	struct drm_dsc_config *dsc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @218  };
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  219  

:::::: The code at line 218 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
