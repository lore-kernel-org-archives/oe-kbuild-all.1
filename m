Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587221A44F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356499; cv=none; b=IxhnH0Mz3mdZbkxts4bS83Eh0Dj6Qd7FgSB7bjAaHZVi+F4jNCcyT0fQ6b8c/s/G65lT8qzacF9j9EkbNDSTZ7EYbsHPT6oIdur0B22P9bcWboLPBCFDYY+t2ur4OSqNMm/TTdGXjgTZfwpKkpWieL+m4O7cpeRgTi4bDXvN4yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356499; c=relaxed/simple;
	bh=J8MCkD9cjo90DhVBv/FvO7ZoUYt37oQqJbrr8lhVti4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjneswVAXiBOrbZNlWJXc9ZPlsA/LyoQZ7wsl/INqYSOm/RiPhd/lv5x4CApdtxmo4zmNRBJ6okXM2zjkX8j/XPMwbA9Z/93pyyc5jIthz3b0t4udmhrrVMp9XObUATE7UnMVgxkNtTqhKHD/8NfZ0wYMdAZdP4AnAV/B05kaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la7oxGSw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la7oxGSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741356498; x=1772892498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8MCkD9cjo90DhVBv/FvO7ZoUYt37oQqJbrr8lhVti4=;
  b=la7oxGSwcZ8R0BIvrVmP3R4ZM5LlChYdkAaGNfsKmBw9mJNzT/dKK+gM
   JA5p+r6pTv2Ww40RjZPeDFQ5iqvHQNhbX0iEXnYuoJE+dN3DHolrGqleH
   BfcZIuPzMlu3AD+NzYIiv1v0gVq0ww2rTGCy6IXoT6G+lbFE11tWlyBxs
   PSWL+/cilVmLIW+Qv75eyg00RxMtRKEbl/56izYzJgKUB7h8IPs9kSf67
   /BUUBcAoFIXd3u+3v5ISdxCH9hkw32NbKwBhKgeW3mrqWEFj71cBN8S6w
   RESzQ6F9CLidNtKYhs4F7lDCm8LfwoKBxOg9TPOzw62b/5FWz1xKy2jSO
   g==;
X-CSE-ConnectionGUID: 0YMOtw1pRH+RhBn+902q2Q==
X-CSE-MsgGUID: amP6r9wtTN2T3RBfjcMStg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59961848"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="59961848"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:08:17 -0800
X-CSE-ConnectionGUID: +bv2jkeMQuilBtb0xQLbdw==
X-CSE-MsgGUID: PVbS58BuQoSDn7emtTn6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124553830"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 06:08:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqYN3-0000Yd-0K;
	Fri, 07 Mar 2025 14:08:13 +0000
Date: Fri, 7 Mar 2025 22:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 6/6]
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or
 '(' before '{' token
Message-ID: <202503072207.tRaqMIgE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3035d9b996ef99bc35325e91d9bcf6437259e374
commit: 56c7482df8dc4a22d074197a9e4313cc79b734a3 [6/6] CHROMIUM: drm/mediatek: Add support for MST HDCP
config: arm64-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072207.tRaqMIgE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072207.tRaqMIgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072207.tRaqMIgE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp_common.h:19,
                    from drivers/gpu/drm/mediatek/mtk_dp_mst.h:9,
                    from drivers/gpu/drm/mediatek/mtk_dp_mst.c:19:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or '(' before '{' token
     220 | {
         | ^
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:219:19: warning: 'tee_hdcp_toggle_encrypt' declared 'static' but never defined [-Wunused-function]
     219 | static inline int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/mediatek/mtk_dp_common.h:19,
                    from drivers/gpu/drm/mediatek/mtk_dp_v2.h:10,
                    from drivers/gpu/drm/mediatek/mtk_dp_v2.c:65:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or '(' before '{' token
     220 | {
         | ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:6: warning: no previous prototype for 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2587 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:6: warning: no previous prototype for 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2595 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:6: warning: no previous prototype for 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2625 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:6: warning: no previous prototype for 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2655 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:6: warning: no previous prototype for 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2674 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:6: warning: no previous prototype for 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2700 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:6: warning: no previous prototype for 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2719 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:6: warning: no previous prototype for 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2725 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3699:12: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3699 |         u8 data;
         |            ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4678:18: warning: initialized field overwritten [-Woverride-init]
    4678 |         .reset = drm_atomic_helper_connector_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4678:18: note: (near initialization for 'mtk_dp_con_funcs.reset')
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_drm_dp_notifier_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:6097:17: error: implicit declaration of function 'mtk_dp_suspend_v2'; did you mean 'mtk_dp_tu_set_v2'? [-Wimplicit-function-declaration]
    6097 |                 mtk_dp_suspend_v2(dev);
         |                 ^~~~~~~~~~~~~~~~~
         |                 mtk_dp_tu_set_v2
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:6100:17: error: implicit declaration of function 'mtk_dp_resume_v2'; did you mean 'mtk_dp_read_v2'? [-Wimplicit-function-declaration]
    6100 |                 mtk_dp_resume_v2(dev);
         |                 ^~~~~~~~~~~~~~~~
         |                 mtk_dp_read_v2
   drivers/gpu/drm/mediatek/tlc_dp_hdcp.h: At top level:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:219:19: warning: 'tee_hdcp_toggle_encrypt' declared 'static' but never defined [-Wunused-function]
     219 | static inline int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/mediatek/mtk_dp_common.h:19,
                    from drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:9:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or '(' before '{' token
     220 | {
         | ^
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:219:19: warning: 'tee_hdcp_toggle_encrypt' declared 'static' but never defined [-Wunused-function]
     219 | static inline int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:22:21: warning: 'dp_ta_uuid' defined but not used [-Wunused-const-variable=]
      22 | static const uuid_t dp_ta_uuid =
         |                     ^~~~~~~~~~


vim +220 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h

   105	
   106	#if IS_ENABLED(CONFIG_TEE)
   107	int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version);
   108	void tee_remove_device(struct mtk_hdcp_info *hdcp_info);
   109	int tee_clear_paring(struct mtk_hdcp_info *hdcp_info);
   110	int tee_calculate_lm(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *bksv);
   111	int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv);
   112	int tee_compare_r0(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len);
   113	int tee_hdcp1x_compute_compare_v(u8 id, struct mtk_hdcp_info *hdcp_info,
   114					u8 *crypto_param, u32 param_len, u8 *rx_v);
   115	int tee_hdcp1x_set_tx_an(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *an_code);
   116	int tee_hdcp1x_soft_rst(u8 id, struct mtk_hdcp_info *hdcp_info);
   117	int tee_hdcp2_soft_rst(u8 id, struct mtk_hdcp_info *hdcp_info);
   118	int tee_hdcp_update_encrypt(u8 id, struct mtk_hdcp_info *hdcp_info, bool enable, u8 version);
   119	int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
   120					u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm);
   121	int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm);
   122	int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
   123					u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len);
   124	int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm);
   125	int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len);
   126	int tee_ske_enc_ks(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks);
   127	int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
   128					u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v);
   129	int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
   130					u8 *crypto_param, u32 param_len, u8 *rx_m);
   131	int tee_hdcp2_set_rx_info(struct mtk_hdcp_info *hdcp_info, u8 *rx_info);
   132	int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
   133	#else
   134	static inline int tee_add_device(struct mtk_hdcp_info *hdcp_info, u32 version)
   135	{
   136		return -EFAULT;
   137	}
   138	static inline void tee_remove_device(struct mtk_hdcp_info *hdcp_info)
   139	{
   140		return;
   141	}
   142	static inline int tee_clear_paring(struct mtk_hdcp_info *hdcp_info)
   143	{
   144		return -EFAULT;
   145	}
   146	static inline int tee_calculate_lm(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *bksv)
   147	{
   148		return -EFAULT;
   149	}
   150	static inline int tee_get_aksv(struct mtk_hdcp_info *hdcp_info, u8 *aksv)
   151	{
   152		return -EFAULT;
   153	}
   154	static inline int tee_compare_r0(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *r0, u32 len)
   155	{
   156		return -EFAULT;
   157	}
   158	static inline int tee_hdcp1x_compute_compare_v(u8 id, struct mtk_hdcp_info *hdcp_info,
   159					u8 *crypto_param, u32 param_len, u8 *rx_v)
   160	{
   161		return -EFAULT;
   162	}
   163	static inline int tee_hdcp1x_set_tx_an(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *an_code)
   164	{
   165		return -EFAULT;
   166	}
   167	static inline int tee_hdcp1x_soft_rst(u8 id, struct mtk_hdcp_info *hdcp_info)
   168	{
   169		return -EFAULT;
   170	}
   171	static inline int tee_hdcp2_soft_rst(u8 id, struct mtk_hdcp_info *hdcp_info)
   172	{
   173		return -EFAULT;
   174	}
   175	static inline int tee_hdcp_update_encrypt(u8 id, struct mtk_hdcp_info *hdcp_info, bool enable, u8 version)
   176	{
   177		return -EFAULT;
   178	}
   179	static inline int tee_ake_certificate(struct mtk_hdcp_info *hdcp_info,
   180					u8 *certificate, bool *stored, u8 *out_m, u8 *out_ekm)
   181	{
   182		return -EFAULT;
   183	}
   184	static inline int tee_enc_rsaes_oaep(struct mtk_hdcp_info *hdcp_info, u8 *ekm)
   185	{
   186		return -EFAULT;
   187	}
   188	static inline int tee_ake_h_prime(struct mtk_hdcp_info *hdcp_info,
   189					u8 *rtx, u8 *rrx, u8 *rx_caps, u8 *tx_caps, u8 *rx_h, u32 rx_h_len)
   190	{
   191		return -EFAULT;
   192	}
   193	static inline int tee_ake_paring(struct mtk_hdcp_info *hdcp_info, u8 *rx_ekm)
   194	{
   195		return -EFAULT;
   196	}
   197	static inline int tee_lc_l_prime(struct mtk_hdcp_info *hdcp_info, u8 *rn, u8 *rx_l, u32 len)
   198	{
   199		return -EFAULT;
   200	}
   201	static inline int tee_ske_enc_ks(u8 id, struct mtk_hdcp_info *hdcp_info, u8 *riv, u8 *eks)
   202	{
   203		return -EFAULT;
   204	}
   205	static inline int tee_hdcp2_compute_compare_v(struct mtk_hdcp_info *hdcp_info,
   206					u8 *crypto_param, u32 param_len, u8 *rx_v, u8 *tx_v)
   207	{
   208		return -EFAULT;
   209	}
   210	static inline int tee_hdcp2_compute_compare_m(struct mtk_hdcp_info *hdcp_info,
   211					u8 *crypto_param, u32 param_len, u8 *rx_m)
   212	{
   213		return -EFAULT;
   214	}
   215	static inline int tee_hdcp2_set_rx_info(struct mtk_hdcp_info *hdcp_info, u8 *rx_info)
   216	{
   217		return -EFAULT;
   218	}
 > 219	static inline int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
 > 220	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
