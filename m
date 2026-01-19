Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DA311979
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768844767; cv=none; b=qvGAdvbM04Bm87nPxPRY6nKKvZa1MjFPNOK6hfuvR+o6PQUIFW7FIjhzyAXwB01lDyXNR8PXwTx97y7TZdTPQv/8c+6Z5eEefTavbTOaYaKtTvWzKppE/cRM2+hW1A1+WSsb4mN0imasJr+CBhXS1ClbrveoHXln6IdKv75J/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768844767; c=relaxed/simple;
	bh=9sDmkmjeomltyc1bDC+6FXN0P9iRUp3uBxe+sJcQuAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQiRgfL+g1j/bE+DatY9U9x8tNJfcveNtz+TXyH70dYzbFS52QP4tp4yvtjxiyLn4ClODaw/hC2O7HAYLib/BkgdOMiiyxuuLOhCp28OFxFFz+RaHSkzzlrVxVN98s5LqWf1xvqES7RJQgbtx79HHajEcgcpwSSX2S3kpVYJbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGTasr58; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGTasr58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768844765; x=1800380765;
  h=date:from:to:cc:subject:message-id;
  bh=9sDmkmjeomltyc1bDC+6FXN0P9iRUp3uBxe+sJcQuAU=;
  b=XGTasr58+Iqf8ySQ3HKbpjHGC1dBgs9p5cAXwEx3zMYpMXCQgzZqZvMv
   Tx1farWhGkLef9xe7J7eVa5lhGMGoKB4h3dTJSU3t84dOfFrzSuIgeT+9
   vnzkAkDTfw5DMJ97iavBv47ptFIZ5iqAnXW9xvhYYkduBWTA28ZWm8uIO
   +vRG1YIv5+n6ut5MA9S15I+pnVcRZT9KUrbU7aB5pSjDV5Em5dv4bccT1
   xpHc5NH4uUa/0c2FoPsPE5oc+O5aNGX1cWZSrIRqOBxNSEDblsgGviGHT
   6jezpHA/eU0FPYgwi3Hacng7ksIt5wsQzuyaLp0CQpDrM7cz/CK+ZZ6mj
   g==;
X-CSE-ConnectionGUID: jUesMdYPSEeLw58wYKVSyw==
X-CSE-MsgGUID: b9AO6bHZSRCWVcx+8WeXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72646434"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="72646434"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:46:04 -0800
X-CSE-ConnectionGUID: rIJ8KIUNQgim5TzyCAVdJg==
X-CSE-MsgGUID: q/nkjw0ZT1WcKjDYwFzb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210051845"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 09:46:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhtKB-00000000O85-2HiX;
	Mon, 19 Jan 2026 17:45:59 +0000
Date: Tue, 20 Jan 2026 01:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:749:2-3: Unneeded
 semicolon
Message-ID: <202601200114.YImDis3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 8d0f798862731c62b09e7138a9032964d70566c2 drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
date:   9 weeks ago
config: arm64-randconfig-r052-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200114.YImDis3Z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200114.YImDis3Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:749:2-3: Unneeded semicolon
   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1160:2-3: Unneeded semicolon
   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:1188:2-3: Unneeded semicolon

vim +749 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

   680	
   681	static void mtk_hdmi_v2_change_video_resolution(struct mtk_hdmi *hdmi,
   682							struct drm_connector_state *conn_state)
   683	{
   684		mtk_hdmi_v2_hw_reset(hdmi);
   685		mtk_hdmi_v2_set_sw_hpd(hdmi, true);
   686		udelay(2);
   687	
   688		regmap_write(hdmi->regs, HDCP_TOP_CTRL, 0);
   689	
   690		/*
   691		 * Enable HDCP reauthentication interrupt: the HW uses this internally
   692		 * for the HPD state machine even if HDCP encryption is not enabled.
   693		 */
   694		regmap_set_bits(hdmi->regs, TOP_INT_ENABLE00, HDCP2X_RX_REAUTH_REQ_DDCM_INT);
   695	
   696		/* Enable hotplug and pord interrupts */
   697		mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
   698	
   699		/* Force enabling HDCP HPD */
   700		regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
   701		regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
   702	
   703		/* Set 8 bits per pixel */
   704		regmap_update_bits(hdmi->regs, TOP_CFG00, TMDS_PACK_MODE,
   705				   FIELD_PREP(TMDS_PACK_MODE, TMDS_PACK_MODE_8BPP));
   706		/* Disable generating deepcolor packets */
   707		regmap_clear_bits(hdmi->regs, TOP_CFG00, DEEPCOLOR_PKT_EN);
   708		/* Disable adding deepcolor information to the general packet */
   709		regmap_clear_bits(hdmi->regs, TOP_MISC_CTLR, DEEP_COLOR_ADD);
   710	
   711		if (hdmi->curr_conn->display_info.is_hdmi)
   712			regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
   713		else
   714			regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
   715	
   716		udelay(5);
   717		mtk_hdmi_v2_hw_vid_mute(hdmi, true);
   718		mtk_hdmi_v2_hw_aud_mute(hdmi, true);
   719		mtk_hdmi_v2_hw_gcp_avmute(hdmi, false);
   720	
   721		regmap_update_bits(hdmi->regs, TOP_CFG01,
   722				   NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN, NULL_PKT_VSYNC_HIGH_EN);
   723		usleep_range(100, 150);
   724	
   725		/* Enable scrambling if tmds clock is 340MHz or more */
   726		mtk_hdmi_v2_enable_scrambling(hdmi, hdmi->mode.clock >= 340 * KILO);
   727	
   728		switch (conn_state->hdmi.output_format) {
   729		default:
   730		case HDMI_COLORSPACE_RGB:
   731		case HDMI_COLORSPACE_YUV444:
   732			/* Disable YUV420 downsampling for RGB and YUV444 */
   733			mtk_hdmi_yuv420_downsampling(hdmi, false);
   734			break;
   735		case HDMI_COLORSPACE_YUV422:
   736			/*
   737			 * YUV420 downsampling is special and needs a bit of setup
   738			 * so we disable everything there before doing anything else.
   739			 *
   740			 * YUV422 downsampling instead just needs one bit to be set.
   741			 */
   742			mtk_hdmi_yuv420_downsampling(hdmi, false);
   743			regmap_set_bits(hdmi->regs, VID_DOWNSAMPLE_CONFIG,
   744					C444_C422_CONFIG_ENABLE);
   745			break;
   746		case HDMI_COLORSPACE_YUV420:
   747			mtk_hdmi_yuv420_downsampling(hdmi, true);
   748			break;
 > 749		};
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
