Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4DF1D13E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCEoqiNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906499; x=1734442499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vi6nQglqoOLskTobNItUdvdxE9oxOkue65W6UTN6Qw=;
  b=dCEoqiNq+/67wYbP6aAUtaJdKvtV58xu0TSVaHup2fvj1yZ1FZqbv8wY
   O7lq4DVfsBS7juc6U1OVY4yESUnrTX4UuhqXxdoRg/gkpfQsXmdbM2V8S
   1sdej6Agj7x/YBlWrBh6KyMfJ9R/esTBRIC4Ok2dOOwX1RO4COX9ZYkkf
   2MM0WiCOH6prtUNpGU81WBRI2J17Km7sWzZQi1Z1UJw985VAdJFzfAfV5
   z+mETjkypJ6s9bFxa1fqStUlIu+UclnNu7o8SuUx4D1gq5jTMAm8lHANo
   kIACb2zKwxWAfH/QT8nhFGUFEShvub3u/dUhs+cbOqLL9+IYX9fh1phy/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868220"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8868220"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:34:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022752264"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="1022752264"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Dec 2023 05:34:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFDjW-00047J-2o;
	Mon, 18 Dec 2023 13:33:16 +0000
Date: Mon, 18 Dec 2023 21:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [linux-next:master 6282/9113]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct
 member 'debugfs_root' description in 'dpu_encoder_virt'
Message-ID: <202312182139.SzIkeNSk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: 62d35629da807d3a0729980e8012263ff84a0966 [6282/9113] drm/msm/dpu: move encoder status to standard encoder debugfs dir
config: arm-imx_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20231218/202312182139.SzIkeNSk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312182139.SzIkeNSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312182139.SzIkeNSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'


vim +212 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  114  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  115  /**
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  116   * struct dpu_encoder_virt - virtual encoder. Container of one or more physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  117   *	encoders. Virtual encoder manages one "logical" display. Physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  118   *	encoders manage one intf block, tied to a specific panel/sub-panel.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  119   *	Virtual encoder defers as much as possible to the physical encoders.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  120   *	Virtual encoder registers itself with the DRM Framework as the encoder.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  121   * @base:		drm_encoder base class for registration with DRM
585b3f9472eea8 Sean Paul         2018-11-16  122   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
fba7427eb59496 Sean Paul         2018-11-16  123   * @enabled:		True if the encoder is active, protected by enc_lock
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  124   * @num_phys_encs:	Actual number of physical encoders contained.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  125   * @phys_encs:		Container of physical encoders managed.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  126   * @cur_master:		Pointer to the current master in this mode. Optimization
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  127   *			Only valid after enable. Cleared as disable.
cca5ff947c7c6e Lee Jones         2020-11-23  128   * @cur_slave:		As above but for the slave encoder.
cca5ff947c7c6e Lee Jones         2020-11-23  129   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  130   *			pingpong blocks can be different than num_phys_encs.
58dca981074948 Vinod Koul        2022-04-06  131   * @hw_dsc:		Handle to the DSC blocks used for the display.
58dca981074948 Vinod Koul        2022-04-06  132   * @dsc_mask:		Bitmask of used DSC blocks.
cca5ff947c7c6e Lee Jones         2020-11-23  133   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  134   *			for partial update right-only cases, such as pingpong
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  135   *			split where virtual pingpong does not generate IRQs
e4914867ac99ca Sean Paul         2018-11-16  136   * @crtc:		Pointer to the currently assigned crtc. Normally you
e4914867ac99ca Sean Paul         2018-11-16  137   *			would use crtc->state->encoder_mask to determine the
e4914867ac99ca Sean Paul         2018-11-16  138   *			link between encoder/crtc. However in this case we need
e4914867ac99ca Sean Paul         2018-11-16  139   *			to track crtc in the disable() hook which is called
e4914867ac99ca Sean Paul         2018-11-16  140   *			_after_ encoder_mask is cleared.
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  141   * @connector:		If a mode is set, cached pointer to the active connector
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  142   * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  143   *				all CTL paths
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  144   * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  145   * @debugfs_root:		Debug file system root file node
fba7427eb59496 Sean Paul         2018-11-16  146   * @enc_lock:			Lock around physical encoder
fba7427eb59496 Sean Paul         2018-11-16  147   *				create/destroy/enable/disable
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  148   * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  149   *				busy processing current command.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  150   *				Bit0 = phys_encs[0] etc.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  151   * @crtc_frame_event_cb:	callback handler for frame event
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  152   * @crtc_frame_event_cb_data:	callback handler private data
70df9610de0fd3 Sean Paul         2019-01-28  153   * @frame_done_timeout_ms:	frame done timeout in ms
9cad81143ef000 Paloma Arellano   2023-11-30  154   * @frame_done_timeout_cnt:	atomic counter tracking the number of frame
9cad81143ef000 Paloma Arellano   2023-11-30  155   * 				done timeouts
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  156   * @frame_done_timer:		watchdog timer for frame done event
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  157   * @disp_info:			local copy of msm_display_info struct
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  158   * @idle_pc_supported:		indicate if idle power collaps is supported
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  159   * @rc_lock:			resource control mutex lock to protect
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  160   *				virt encoder over various state changes
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  161   * @rc_state:			resource controller state
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  162   * @delayed_off_work:		delayed worker to schedule disabling of
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  163   *				clks and resources after IDLE_TIMEOUT time.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  164   * @topology:                   topology of the display
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  165   * @idle_timeout:		idle timeout duration in milliseconds
4b27f469b155bd Dmitry Baryshkov  2023-01-18  166   * @wide_bus_en:		wide bus is enabled on this interface
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  167   * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  168   */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  169  struct dpu_encoder_virt {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  170  	struct drm_encoder base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  171  	spinlock_t enc_spinlock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  172  
fba7427eb59496 Sean Paul         2018-11-16  173  	bool enabled;
fba7427eb59496 Sean Paul         2018-11-16  174  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  175  	unsigned int num_phys_encs;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  176  	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  177  	struct dpu_encoder_phys *cur_master;
86b89080368b46 Jeykumar Sankaran 2018-09-05  178  	struct dpu_encoder_phys *cur_slave;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  179  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  180  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  181  
58dca981074948 Vinod Koul        2022-04-06  182  	unsigned int dsc_mask;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  183  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  184  	bool intfs_swapped;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  185  
e4914867ac99ca Sean Paul         2018-11-16  186  	struct drm_crtc *crtc;
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  187  	struct drm_connector *connector;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  188  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  189  	struct mutex enc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  190  	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  191  	void (*crtc_frame_event_cb)(void *, u32 event);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  192  	void *crtc_frame_event_cb_data;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  193  
70df9610de0fd3 Sean Paul         2019-01-28  194  	atomic_t frame_done_timeout_ms;
9cad81143ef000 Paloma Arellano   2023-11-30  195  	atomic_t frame_done_timeout_cnt;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  196  	struct timer_list frame_done_timer;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  197  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  198  	struct msm_display_info disp_info;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  199  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  200  	bool idle_pc_supported;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  201  	struct mutex rc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  202  	enum dpu_enc_rc_states rc_state;
e077fe752cd344 Jeykumar Sankaran 2018-12-14  203  	struct delayed_work delayed_off_work;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  204  	struct msm_display_topology topology;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  205  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  206  	u32 idle_timeout;
3309a75639718c Kuogee Hsieh      2022-02-25  207  
3309a75639718c Kuogee Hsieh      2022-02-25  208  	bool wide_bus_en;
58dca981074948 Vinod Koul        2022-04-06  209  
58dca981074948 Vinod Koul        2022-04-06  210  	/* DSC configuration */
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  211  	struct drm_dsc_config *dsc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @212  };
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  213  

:::::: The code at line 212 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
