Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835D224AE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 05:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766296199; cv=none; b=pMds7GDONKrgC1SvMlZVqkzwH1ze1bH/YnJUm7KQh39O75sUG+hQoRQ6PXbKPNEb81kjOtcdEhaPU0SRr7hbeR158ZBk5EcuEDcgUC08nPUwDNimqEkIbr4nb2YydFy+AMWn2Q6X9pkIZkjxYAFW1V6TsqBha0KKWg9FW02uwXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766296199; c=relaxed/simple;
	bh=BUFB8syBoq8XJGdv2W0wsmZED9B/M+wZ8M8tF1aL+rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nCbwqZBpN9wj2ufmthmUejC/ZXURiYzLYHwGNTg271keHPgEzYo6yWckBxABQle5XV8qreis7PtHGqmP8qhNlswxmucNiYre8XooNnzHB16Zb4HgOdQTzuPOLdV2X8la2U2dCR4A19V8XQK9pBs9Em5kG7iNvGaUWR+NwX8juzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXwOEARM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXwOEARM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766296198; x=1797832198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUFB8syBoq8XJGdv2W0wsmZED9B/M+wZ8M8tF1aL+rI=;
  b=SXwOEARM7Z57kA7TZJgAJcozlJyaQAupoi9VGQFDNBbDQWqZ70We0yJU
   ZyNS/0xWJs1Bl5uy2VFgm0OKgAnZBUOnCjSbmDyKYuo0y85n+4CuxAIhm
   JUkpTdArvV44rpeOT0DL1em5VWPNi1L5zkFerMuVmZJTTFn02P6h7zCno
   PNGStcw5igHNjrDcbocBopoQh0ANuN/dIK81Z6MylM7bkSclT2D5IJX0A
   JPkrFnVwGEFcngGQ7tEAngGdGgT2h2x2QgwxXTc8OwWYQPU3aLnjHhYcg
   X1qbvsBI25QL0M/jZk1s2cbxxpidbCwaVCzYGaTN3rqheqcY7u00DFMMG
   g==;
X-CSE-ConnectionGUID: IVR4545MSXmKN8G+ShtNdw==
X-CSE-MsgGUID: Pr45Lom5QgqDWRo3lAd0Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85612523"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85612523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:49:56 -0800
X-CSE-ConnectionGUID: SSzhYpAPT26eBOh/kz8UXw==
X-CSE-MsgGUID: FY9o5/1aSsyC3HuObHd5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236638445"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 21:49:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCKG-000000004wg-3VQr;
	Sun, 21 Dec 2025 05:49:52 +0000
Date: Sun, 21 Dec 2025 06:49:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] htmldocs:
 ./include/drm/drm_bridge.h:861: warning: Excess struct member 'support_hdcp'
 description in 'drm_bridge'
Message-ID: <202512210627.QG2eOiB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hubert,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 8cf0645e7f921799d4676122f9bf6a4063816bb2 [1/1] ANDROID: drm: Fixup ABI break due to support_hdcp
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210627.QG2eOiB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210627.QG2eOiB4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/backlight.h
   ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:          * @fbdev_probe
   ./include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fbdev_probe' not described in 'drm_driver'
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
   ./drivers/gpu/drm/drm_writeback.c:249: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead
>> ./include/drm/drm_bridge.h:861: warning: Excess struct member 'support_hdcp' description in 'drm_bridge'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h


vim +861 ./include/drm/drm_bridge.h

11f6c4b1b2599d Laurent Pinchart 2020-02-26  765  
199e4e967af476 Simona Vetter    2016-08-31  766  /**
199e4e967af476 Simona Vetter    2016-08-31  767   * struct drm_bridge - central DRM bridge control structure
199e4e967af476 Simona Vetter    2016-08-31  768   */
199e4e967af476 Simona Vetter    2016-08-31  769  struct drm_bridge {
751465913f045a Boris Brezillon  2020-01-28  770  	/** @base: inherit from &drm_private_object */
751465913f045a Boris Brezillon  2020-01-28  771  	struct drm_private_obj base;
6aa13402c11035 Eric Anholt      2018-06-06  772  	/** @dev: DRM device this bridge belongs to */
199e4e967af476 Simona Vetter    2016-08-31  773  	struct drm_device *dev;
6aa13402c11035 Eric Anholt      2018-06-06  774  	/** @encoder: encoder to which this bridge is connected */
199e4e967af476 Simona Vetter    2016-08-31  775  	struct drm_encoder *encoder;
05193dc3819702 Boris Brezillon  2019-12-03  776  	/** @chain_node: used to form a bridge chain */
05193dc3819702 Boris Brezillon  2019-12-03  777  	struct list_head chain_node;
6aa13402c11035 Eric Anholt      2018-06-06  778  	/** @of_node: device node pointer to the bridge */
199e4e967af476 Simona Vetter    2016-08-31  779  	struct device_node *of_node;
6aa13402c11035 Eric Anholt      2018-06-06  780  	/** @list: to keep track of all added bridges */
199e4e967af476 Simona Vetter    2016-08-31  781  	struct list_head list;
6aa13402c11035 Eric Anholt      2018-06-06  782  	/**
6aa13402c11035 Eric Anholt      2018-06-06  783  	 * @timings:
6aa13402c11035 Eric Anholt      2018-06-06  784  	 *
6aa13402c11035 Eric Anholt      2018-06-06  785  	 * the timing specification for the bridge, if any (may be NULL)
6aa13402c11035 Eric Anholt      2018-06-06  786  	 */
36a776df6e088a Linus Walleij    2018-01-12  787  	const struct drm_bridge_timings *timings;
6aa13402c11035 Eric Anholt      2018-06-06  788  	/** @funcs: control functions */
199e4e967af476 Simona Vetter    2016-08-31  789  	const struct drm_bridge_funcs *funcs;
6aa13402c11035 Eric Anholt      2018-06-06  790  	/** @driver_private: pointer to the bridge driver's internal context */
199e4e967af476 Simona Vetter    2016-08-31  791  	void *driver_private;
11f6c4b1b2599d Laurent Pinchart 2020-02-26  792  	/** @ops: bitmask of operations supported by the bridge */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  793  	enum drm_bridge_ops ops;
11f6c4b1b2599d Laurent Pinchart 2020-02-26  794  	/**
11f6c4b1b2599d Laurent Pinchart 2020-02-26  795  	 * @type: Type of the connection at the bridge output
11f6c4b1b2599d Laurent Pinchart 2020-02-26  796  	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
11f6c4b1b2599d Laurent Pinchart 2020-02-26  797  	 * identifies the type of connected display.
11f6c4b1b2599d Laurent Pinchart 2020-02-26  798  	 */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  799  	int type;
64d05ff758e39b Laurent Pinchart 2020-02-26  800  	/**
64d05ff758e39b Laurent Pinchart 2020-02-26  801  	 * @interlace_allowed: Indicate that the bridge can handle interlaced
64d05ff758e39b Laurent Pinchart 2020-02-26  802  	 * modes.
64d05ff758e39b Laurent Pinchart 2020-02-26  803  	 */
64d05ff758e39b Laurent Pinchart 2020-02-26  804  	bool interlace_allowed;
4fb912e5e19075 Dave Stevenson   2022-12-05  805  	/**
4fb912e5e19075 Dave Stevenson   2022-12-05  806  	 * @pre_enable_prev_first: The bridge requires that the prev
4fb912e5e19075 Dave Stevenson   2022-12-05  807  	 * bridge @pre_enable function is called before its @pre_enable,
4fb912e5e19075 Dave Stevenson   2022-12-05  808  	 * and conversely for post_disable. This is most frequently a
4fb912e5e19075 Dave Stevenson   2022-12-05  809  	 * requirement for DSI devices which need the host to be initialised
4fb912e5e19075 Dave Stevenson   2022-12-05  810  	 * before the peripheral.
4fb912e5e19075 Dave Stevenson   2022-12-05  811  	 */
4fb912e5e19075 Dave Stevenson   2022-12-05  812  	bool pre_enable_prev_first;
30c11ac411f6b0 Hsin-Yi Wang     2025-08-12  813  	/**
30c11ac411f6b0 Hsin-Yi Wang     2025-08-12  814  	 * @support_hdcp: Indicate that the bridge supports HDCP.
30c11ac411f6b0 Hsin-Yi Wang     2025-08-12  815  	 */
8cf0645e7f9217 Hubert Mazur     2025-09-04  816  	ANDROID_KABI_IGNORE(0, bool support_hdcp);
11f6c4b1b2599d Laurent Pinchart 2020-02-26  817  	/**
11f6c4b1b2599d Laurent Pinchart 2020-02-26  818  	 * @ddc: Associated I2C adapter for DDC access, if any.
11f6c4b1b2599d Laurent Pinchart 2020-02-26  819  	 */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  820  	struct i2c_adapter *ddc;
11f6c4b1b2599d Laurent Pinchart 2020-02-26  821  	/** private: */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  822  	/**
11f6c4b1b2599d Laurent Pinchart 2020-02-26  823  	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
11f6c4b1b2599d Laurent Pinchart 2020-02-26  824  	 */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  825  	struct mutex hpd_mutex;
11f6c4b1b2599d Laurent Pinchart 2020-02-26  826  	/**
11f6c4b1b2599d Laurent Pinchart 2020-02-26  827  	 * @hpd_cb: Hot plug detection callback, registered with
11f6c4b1b2599d Laurent Pinchart 2020-02-26  828  	 * drm_bridge_hpd_enable().
11f6c4b1b2599d Laurent Pinchart 2020-02-26  829  	 */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  830  	void (*hpd_cb)(void *data, enum drm_connector_status status);
11f6c4b1b2599d Laurent Pinchart 2020-02-26  831  	/**
11f6c4b1b2599d Laurent Pinchart 2020-02-26  832  	 * @hpd_data: Private data passed to the Hot plug detection callback
11f6c4b1b2599d Laurent Pinchart 2020-02-26  833  	 * @hpd_cb.
11f6c4b1b2599d Laurent Pinchart 2020-02-26  834  	 */
11f6c4b1b2599d Laurent Pinchart 2020-02-26  835  	void *hpd_data;
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  836  
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  837  	/**
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  838  	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  839  	 * generation. This is required if @DRM_BRIDGE_OP_HDMI is set.
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  840  	 */
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  841  	const char *vendor;
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  842  
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  843  	/**
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  844  	 * @product: Name of the product to be used for the SPD InfoFrame
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  845  	 * generation. This is required if @DRM_BRIDGE_OP_HDMI is set.
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  846  	 */
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  847  	const char *product;
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  848  
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  849  	/**
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  850  	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  851  	 * output formats. This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  852  	 */
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  853  	unsigned int supported_formats;
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  854  
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  855  	/**
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  856  	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  857  	 * values are 8, 10 and 12. This is only relevant if
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  858  	 * @DRM_BRIDGE_OP_HDMI is set.
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  859  	 */
6b4468b0c6ba37 Dmitry Baryshkov 2024-06-07  860  	unsigned int max_bpc;
199e4e967af476 Simona Vetter    2016-08-31 @861  };
199e4e967af476 Simona Vetter    2016-08-31  862  

:::::: The code at line 861 was first introduced by commit
:::::: 199e4e967af476bdcab96c76237e6a1f9244d6ca drm: Extract drm_bridge.h

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
