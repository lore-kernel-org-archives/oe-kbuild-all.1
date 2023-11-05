Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B1C17993
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 18:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4uWyxBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699209150; x=1730745150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weq8q7BBfPKw5FNROf+3PtiAYt+bJRibQIMA4Jv1p4c=;
  b=Z4uWyxBB3hIGB80SNIPkuMRiqzff3wdDh3vGCvvVg80mStpCHEOVtTm4
   HLydc5ZPu4vmIf2GHMrfmk8LYRFw5mD02lW31RA4wNvUenaLDx6wKz0C6
   qN+SQ0zxhkl1+4Vans5MLxp6LrsDsMZS0vjJdPZMXusCWLKPmedMqm0cJ
   +lYzfNr5Vp5bhe5Fl4AdxjD0oAEVyPufq8yqR2syV1IfNKA0I3skXorRt
   f0giIRjFLTZaGOdq/fo+PLjs0tfgr3I1pRhsWjBPUs9k0juDB/8JZ0UKy
   ExFZe39u5c1Jhrp++vQkwS5Jyfm8eq4qgQ2ept8q4lswxAVxJUCnLlY7C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="374199125"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="374199125"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 10:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762114063"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762114063"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 10:32:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzhv7-0005hk-2L;
	Sun, 05 Nov 2023 18:32:25 +0000
Date: Mon, 6 Nov 2023 02:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:hdmi-dbg 18/33] htmldocs:
 ./include/drm/drm_connector.h:1028: warning: Function parameter or member
 'hdmi' not described in 'drm_connector_state'
Message-ID: <202311060212.qPbEgYjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   8e65f28447c830fe113ba037c2ba210d781d4420
commit: dd6c2421f2780f4c2cdb0f246a176f1126c3af9d [18/33] drm/connector: hdmi: Create a custom state
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060212.qPbEgYjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060212.qPbEgYjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_connector.h:1028: warning: Function parameter or member 'hdmi' not described in 'drm_connector_state'

vim +1028 ./include/drm/drm_connector.h

299a16b163c95f Boris Brezillon      2016-12-02   880  
52217195176115 Daniel Vetter        2016-08-12   881  /**
52217195176115 Daniel Vetter        2016-08-12   882   * struct drm_connector_state - mutable connector state
52217195176115 Daniel Vetter        2016-08-12   883   */
52217195176115 Daniel Vetter        2016-08-12   884  struct drm_connector_state {
aab999a66e4bc4 Daniel Vetter        2018-07-09   885  	/** @connector: backpointer to the connector */
52217195176115 Daniel Vetter        2016-08-12   886  	struct drm_connector *connector;
52217195176115 Daniel Vetter        2016-08-12   887  
afb21ea63d815d Daniel Vetter        2016-08-31   888  	/**
afb21ea63d815d Daniel Vetter        2016-08-31   889  	 * @crtc: CRTC to connect connector to, NULL if disabled.
afb21ea63d815d Daniel Vetter        2016-08-31   890  	 *
afb21ea63d815d Daniel Vetter        2016-08-31   891  	 * Do not change this directly, use drm_atomic_set_crtc_for_connector()
afb21ea63d815d Daniel Vetter        2016-08-31   892  	 * instead.
afb21ea63d815d Daniel Vetter        2016-08-31   893  	 */
afb21ea63d815d Daniel Vetter        2016-08-31   894  	struct drm_crtc *crtc;
52217195176115 Daniel Vetter        2016-08-12   895  
aab999a66e4bc4 Daniel Vetter        2018-07-09   896  	/**
aab999a66e4bc4 Daniel Vetter        2018-07-09   897  	 * @best_encoder:
aab999a66e4bc4 Daniel Vetter        2018-07-09   898  	 *
aab999a66e4bc4 Daniel Vetter        2018-07-09   899  	 * Used by the atomic helpers to select the encoder, through the
aab999a66e4bc4 Daniel Vetter        2018-07-09   900  	 * &drm_connector_helper_funcs.atomic_best_encoder or
aab999a66e4bc4 Daniel Vetter        2018-07-09   901  	 * &drm_connector_helper_funcs.best_encoder callbacks.
27edadf6df811b Daniel Vetter        2019-05-06   902  	 *
1b27fbdde1df17 Laurent Pinchart     2019-06-11   903  	 * This is also used in the atomic helpers to map encoders to their
1b27fbdde1df17 Laurent Pinchart     2019-06-11   904  	 * current and previous connectors, see
12db36bc3cec76 Sean Paul            2019-08-12   905  	 * drm_atomic_get_old_connector_for_encoder() and
12db36bc3cec76 Sean Paul            2019-08-12   906  	 * drm_atomic_get_new_connector_for_encoder().
1b27fbdde1df17 Laurent Pinchart     2019-06-11   907  	 *
27edadf6df811b Daniel Vetter        2019-05-06   908  	 * NOTE: Atomic drivers must fill this out (either themselves or through
27edadf6df811b Daniel Vetter        2019-05-06   909  	 * helpers), for otherwise the GETCONNECTOR and GETENCODER IOCTLs will
27edadf6df811b Daniel Vetter        2019-05-06   910  	 * not return correct data to userspace.
aab999a66e4bc4 Daniel Vetter        2018-07-09   911  	 */
52217195176115 Daniel Vetter        2016-08-12   912  	struct drm_encoder *best_encoder;
52217195176115 Daniel Vetter        2016-08-12   913  
40ee6fbef75fe6 Manasi Navare        2016-12-16   914  	/**
40ee6fbef75fe6 Manasi Navare        2016-12-16   915  	 * @link_status: Connector link_status to keep track of whether link is
40ee6fbef75fe6 Manasi Navare        2016-12-16   916  	 * GOOD or BAD to notify userspace if retraining is necessary.
40ee6fbef75fe6 Manasi Navare        2016-12-16   917  	 */
40ee6fbef75fe6 Manasi Navare        2016-12-16   918  	enum drm_link_status link_status;
40ee6fbef75fe6 Manasi Navare        2016-12-16   919  
aab999a66e4bc4 Daniel Vetter        2018-07-09   920  	/** @state: backpointer to global drm_atomic_state */
52217195176115 Daniel Vetter        2016-08-12   921  	struct drm_atomic_state *state;
299a16b163c95f Boris Brezillon      2016-12-02   922  
21a01abbe32a3c Maarten Lankhorst    2017-09-04   923  	/**
21a01abbe32a3c Maarten Lankhorst    2017-09-04   924  	 * @commit: Tracks the pending commit to prevent use-after-free conditions.
21a01abbe32a3c Maarten Lankhorst    2017-09-04   925  	 *
21a01abbe32a3c Maarten Lankhorst    2017-09-04   926  	 * Is only set when @crtc is NULL.
21a01abbe32a3c Maarten Lankhorst    2017-09-04   927  	 */
21a01abbe32a3c Maarten Lankhorst    2017-09-04   928  	struct drm_crtc_commit *commit;
21a01abbe32a3c Maarten Lankhorst    2017-09-04   929  
aab999a66e4bc4 Daniel Vetter        2018-07-09   930  	/** @tv: TV connector state */
299a16b163c95f Boris Brezillon      2016-12-02   931  	struct drm_tv_connector_state tv;
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   932  
1452c25b0e6027 Sean Paul            2019-06-12   933  	/**
1452c25b0e6027 Sean Paul            2019-06-12   934  	 * @self_refresh_aware:
1452c25b0e6027 Sean Paul            2019-06-12   935  	 *
1452c25b0e6027 Sean Paul            2019-06-12   936  	 * This tracks whether a connector is aware of the self refresh state.
1452c25b0e6027 Sean Paul            2019-06-12   937  	 * It should be set to true for those connector implementations which
1452c25b0e6027 Sean Paul            2019-06-12   938  	 * understand the self refresh state. This is needed since the crtc
1452c25b0e6027 Sean Paul            2019-06-12   939  	 * registers the self refresh helpers and it doesn't know if the
1452c25b0e6027 Sean Paul            2019-06-12   940  	 * connectors downstream have implemented self refresh entry/exit.
1452c25b0e6027 Sean Paul            2019-06-12   941  	 *
1452c25b0e6027 Sean Paul            2019-06-12   942  	 * Drivers should set this to true in atomic_check if they know how to
1452c25b0e6027 Sean Paul            2019-06-12   943  	 * handle self_refresh requests.
1452c25b0e6027 Sean Paul            2019-06-12   944  	 */
1452c25b0e6027 Sean Paul            2019-06-12   945  	bool self_refresh_aware;
1452c25b0e6027 Sean Paul            2019-06-12   946  
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   947  	/**
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   948  	 * @picture_aspect_ratio: Connector property to control the
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   949  	 * HDMI infoframe aspect ratio setting.
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   950  	 *
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   951  	 * The %DRM_MODE_PICTURE_ASPECT_\* values much match the
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   952  	 * values for &enum hdmi_picture_aspect
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   953  	 */
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01   954  	enum hdmi_picture_aspect picture_aspect_ratio;
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   955  
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   956  	/**
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   957  	 * @content_type: Connector property to control the
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   958  	 * HDMI infoframe content type setting.
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   959  	 * The %DRM_MODE_CONTENT_TYPE_\* values much
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   960  	 * match the values.
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   961  	 */
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   962  	unsigned int content_type;
50525c332b55f8 Stanislav Lisovskiy  2018-05-15   963  
7672dbba85d30d Ramalingam C         2019-08-01   964  	/**
7672dbba85d30d Ramalingam C         2019-08-01   965  	 * @hdcp_content_type: Connector property to pass the type of
7672dbba85d30d Ramalingam C         2019-08-01   966  	 * protected content. This is most commonly used for HDCP.
7672dbba85d30d Ramalingam C         2019-08-01   967  	 */
7672dbba85d30d Ramalingam C         2019-08-01   968  	unsigned int hdcp_content_type;
7672dbba85d30d Ramalingam C         2019-08-01   969  
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   970  	/**
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   971  	 * @scaling_mode: Connector property to control the
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   972  	 * upscaling, mostly used for built-in panels.
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   973  	 */
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01   974  	unsigned int scaling_mode;
24557865c8b1a6 Sean Paul            2018-01-08   975  
24557865c8b1a6 Sean Paul            2018-01-08   976  	/**
24557865c8b1a6 Sean Paul            2018-01-08   977  	 * @content_protection: Connector property to request content
24557865c8b1a6 Sean Paul            2018-01-08   978  	 * protection. This is most commonly used for HDCP.
24557865c8b1a6 Sean Paul            2018-01-08   979  	 */
24557865c8b1a6 Sean Paul            2018-01-08   980  	unsigned int content_protection;
935774cd71fe60 Brian Starkey        2017-03-29   981  
d2c6a405846c24 Uma Shankar          2019-02-19   982  	/**
d2c6a405846c24 Uma Shankar          2019-02-19   983  	 * @colorspace: State variable for Connector property to request
d2c6a405846c24 Uma Shankar          2019-02-19   984  	 * colorspace change on Sink. This is most commonly used to switch
d2c6a405846c24 Uma Shankar          2019-02-19   985  	 * to wider color gamuts like BT2020.
d2c6a405846c24 Uma Shankar          2019-02-19   986  	 */
1626761ee4406c Harry Wentland       2023-02-03   987  	enum drm_colorspace colorspace;
d2c6a405846c24 Uma Shankar          2019-02-19   988  
935774cd71fe60 Brian Starkey        2017-03-29   989  	/**
935774cd71fe60 Brian Starkey        2017-03-29   990  	 * @writeback_job: Writeback job for writeback connectors
935774cd71fe60 Brian Starkey        2017-03-29   991  	 *
b13cc8dd588434 Brian Starkey        2017-03-29   992  	 * Holds the framebuffer and out-fence for a writeback connector. As
b13cc8dd588434 Brian Starkey        2017-03-29   993  	 * the writeback completion may be asynchronous to the normal commit
b13cc8dd588434 Brian Starkey        2017-03-29   994  	 * cycle, the writeback job lifetime is managed separately from the
b13cc8dd588434 Brian Starkey        2017-03-29   995  	 * normal atomic state by this object.
935774cd71fe60 Brian Starkey        2017-03-29   996  	 *
935774cd71fe60 Brian Starkey        2017-03-29   997  	 * See also: drm_writeback_queue_job() and
935774cd71fe60 Brian Starkey        2017-03-29   998  	 * drm_writeback_signal_completion()
935774cd71fe60 Brian Starkey        2017-03-29   999  	 */
935774cd71fe60 Brian Starkey        2017-03-29  1000  	struct drm_writeback_job *writeback_job;
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1001  
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1002  	/**
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1003  	 * @max_requested_bpc: Connector property to limit the maximum bit
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1004  	 * depth of the pixels.
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1005  	 */
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1006  	u8 max_requested_bpc;
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1007  
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1008  	/**
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1009  	 * @max_bpc: Connector max_bpc based on the requested max_bpc property
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1010  	 * and the connector bpc limitations obtained from edid.
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1011  	 */
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1012  	u8 max_bpc;
fbb5d0353c62d1 Uma Shankar          2019-05-16  1013  
107fe904302092 Rajat Jain           2021-10-05  1014  	/**
107fe904302092 Rajat Jain           2021-10-05  1015  	 * @privacy_screen_sw_state: See :ref:`Standard Connector
107fe904302092 Rajat Jain           2021-10-05  1016  	 * Properties<standard_connector_properties>`
107fe904302092 Rajat Jain           2021-10-05  1017  	 */
107fe904302092 Rajat Jain           2021-10-05  1018  	enum drm_privacy_screen_status privacy_screen_sw_state;
107fe904302092 Rajat Jain           2021-10-05  1019  
fbb5d0353c62d1 Uma Shankar          2019-05-16  1020  	/**
fbb5d0353c62d1 Uma Shankar          2019-05-16  1021  	 * @hdr_output_metadata:
fbb5d0353c62d1 Uma Shankar          2019-05-16  1022  	 * DRM blob property for HDR output metadata
fbb5d0353c62d1 Uma Shankar          2019-05-16  1023  	 */
fbb5d0353c62d1 Uma Shankar          2019-05-16  1024  	struct drm_property_blob *hdr_output_metadata;
dd6c2421f2780f Maxime Ripard        2023-10-31  1025  
dd6c2421f2780f Maxime Ripard        2023-10-31  1026  	struct {
dd6c2421f2780f Maxime Ripard        2023-10-31  1027  	} hdmi;
52217195176115 Daniel Vetter        2016-08-12 @1028  };
52217195176115 Daniel Vetter        2016-08-12  1029  

:::::: The code at line 1028 was first introduced by commit
:::::: 522171951761153172c75b94ae1f4bc9ab631745 drm: Extract drm_connector.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
