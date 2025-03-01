Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3C322E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740812101; cv=none; b=c2nNndDN5jDyNTsJq/cVVJzf5Pecc4MIRJO3ubW6ZXAvc0wjTTuiddlgeaFSlBzYVGK0TKA+vbFcwT3He+5sQZ63IIfl2iNwAY2yjPkM6CoCGVqPPa6NZ0G6eXhl3LMwweYqFn1sWk5Ky+SKAbRM6SFHSglKit+uH7D01r3FEtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740812101; c=relaxed/simple;
	bh=c41RIIq7tshLUvJIeCckS6qmsuVgUPpuzrWGeN3G5Po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEVSBcQGcAhRi20Fqi6JtO0Sdtsw8aoEWXi/QwNTomnOHjq9syoV/V0uGFURuJ1QIsAXZ2ZCQsvsbFOF45EmQriCL0zCTAbqREm8Wrc97KyqN2/JLKPxpUy1DGTfdMN10N4QHXZSITrdAiDRqRTpL4MaI93yKCoiYjcjoOkkeaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAk44ohf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAk44ohf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740812099; x=1772348099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c41RIIq7tshLUvJIeCckS6qmsuVgUPpuzrWGeN3G5Po=;
  b=RAk44ohfqLpNZmNmXKS2l0BUcoxy1n7/4wZA2iA5PTUtB2kQ7dqU8diJ
   pTF84u84vghxthGijXXAl8suHYQjunP5AoubD7aOUQ2EZe+Sixyzmfpyl
   GOPT3PPiIBQiF6yqniDwcHc3rgBhdf7Syo10drSydq9A5o9umiuppTHgo
   YNgESVWbwLcrz08/nmtGDXQMck+7QY57Q+KYOoRbpsaLLePNfV51P3id0
   Isueo5k4nUQkZIvNtXh2pCzAzmevrlI57A1TSrwQQJUyFqvBgRf+JpFoJ
   dM48e7yAC/W/b4AZRJ1B8t36x/ArVXybMZdtApvD7QYjUDjhAJvyS0FFI
   g==;
X-CSE-ConnectionGUID: CXP2p50kSV++EyymahSFBg==
X-CSE-MsgGUID: VAVmvlX+RfOZv9MfFbsigg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40921129"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="40921129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 22:54:58 -0800
X-CSE-ConnectionGUID: P5GAyoqXQN+eoQjMBbfeBQ==
X-CSE-MsgGUID: cnMsT9uUQp2WXiTc3Vjc7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="122485875"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 22:54:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toGkQ-000FyY-31;
	Sat, 01 Mar 2025 06:54:54 +0000
Date: Sat, 1 Mar 2025 14:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 3/3]
 drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or
 '('
Message-ID: <202503011409.avnMpK5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   56c7482df8dc4a22d074197a9e4313cc79b734a3
commit: 56c7482df8dc4a22d074197a9e4313cc79b734a3 [3/3] CHROMIUM: drm/mediatek: Add support for MST HDCP
config: x86_64-buildonly-randconfig-002-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011409.avnMpK5j-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011409.avnMpK5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011409.avnMpK5j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c:8:
   In file included from drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h:9:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or '('
     220 | {
         | ^
   1 error generated.
--
   In file included from drivers/gpu/drm/mediatek/mtk_dp_v2.c:65:
   In file included from drivers/gpu/drm/mediatek/mtk_dp_v2.h:10:
   In file included from drivers/gpu/drm/mediatek/mtk_dp_common.h:19:
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.h:220:1: error: expected identifier or '('
     220 | {
         | ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:6: warning: no previous prototype for function 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2587 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2587 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:6: warning: no previous prototype for function 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2595 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2595:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2595 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:6: warning: no previous prototype for function 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2625 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2625:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2625 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:6: warning: no previous prototype for function 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2655 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2655:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2655 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:6: warning: no previous prototype for function 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2674 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2674:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2674 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:6: warning: no previous prototype for function 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2700 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2700:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2700 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:6: warning: no previous prototype for function 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2719 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2719:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2719 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:6: warning: no previous prototype for function 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2725 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2725 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3699:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3699 |         u8 data;
         |            ^
   9 warnings and 1 error generated.


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
   219	static inline int tee_hdcp_toggle_encrypt(struct mtk_hdcp_info *hdcp_info);
 > 220	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
