Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2221B28A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 23:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147955; cv=none; b=eEtMN982xE2tcl2TsZ0m2JsYIyg7uAlSt9TbR7Ngm9RmwsTPFPuYAF5pnfAW+Z+LjANXTfumaIw425fQWzAXeyrW6vJKD1ycmIJbaKtvxRYd38U+abGocpK2d4ySrUL4E/rGbqzjUsL9q9Pd2evMRaE911kS0k6QgNrsWdmBKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147955; c=relaxed/simple;
	bh=FeaHogAUa0PuzBKBzKtuZwdoTiQghzEXBQ0GfZhgwFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fz8BASEu+QiabYBdkkPknv1UWECWSyWpdCPWWOFRIoIGRNomPwgfOjcjRdSgYPrcRwT51sUKZykhvkG8fMx2OC1dP0TWXhtmwe9DcbghByqYfb73LcM+KPXdbU0YUdk5xmlCIduo5Mn6CvbDaQ5844T2WImgc011KsUDn0CWuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRx6SHlt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRx6SHlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718147953; x=1749683953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FeaHogAUa0PuzBKBzKtuZwdoTiQghzEXBQ0GfZhgwFU=;
  b=NRx6SHltv01d+W9pwf1BF6Q2MeGxkHrMITi/1BuuyLEFxX9cGBq4Fft9
   Urf5i6weYCj1SpXr5+IYuaMSjaPsS2RrmHNUK7zdDEDddIgZsBQoyk8ro
   ojjZxD1V4/N3fvlYHtBhQyWFuboF9KdKcXNEKlEd0L3E0G4EGKHzAHIQV
   rcNWc+IT6pD/uXU0CfF5UTCVnDNGrUlVaVsNfojSS3/Si3qaIoH/M1aDa
   5IWpNupIaWDURSzSZAfV5S6XnNECG1kG4UtUUxCtkF+9s9sdxDyBRbNH+
   UBb7AMT3yUx0lTCdmdtwZq6LgQC5euoCriyigv2nyJJn9cRxylEh5NMKX
   A==;
X-CSE-ConnectionGUID: rOOn4MSoS3SBwPXUbZ25jw==
X-CSE-MsgGUID: 0SEwcp4nQqijRYjiEfN6gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14613011"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14613011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:18:12 -0700
X-CSE-ConnectionGUID: 1GxaJ235QbukZMgb7iDftg==
X-CSE-MsgGUID: 7+7V5LuQR/i6Hvbo5t8s6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39488177"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2024 16:18:11 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHAkj-0000z8-1r;
	Tue, 11 Jun 2024 23:18:09 +0000
Date: Wed, 12 Jun 2024 07:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 172/176]
 drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.c:754:27:
 warning: variable 'ctrl' set but not used
Message-ID: <202406120754.xx9uOlxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   647b8418b5ae299998e2190ba3bd174fa8651630
commit: 8d7d0c81f6734a83eefa334ce4c6dcde09300166 [172/176] Reapply "CHROMIUM: media: mediatek: vcodec: Add CID controls to get secure handle and set secure mode"
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120754.xx9uOlxr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120754.xx9uOlxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120754.xx9uOlxr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.c: In function 'mtk_vcodec_dec_ctrls_setup':
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.c:754:27: warning: variable 'ctrl' set but not used [-Wunused-but-set-variable]
     754 |         struct v4l2_ctrl *ctrl;
         |                           ^~~~


vim +/ctrl +754 drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.c

   750	
   751	static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
   752	{
   753		unsigned int i;
 > 754		struct v4l2_ctrl *ctrl;
   755	
   756		v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS + 2);
   757		if (ctx->ctrl_hdl.error) {
   758			mtk_v4l2_vdec_err(ctx, "v4l2_ctrl_handler_init failed\n");
   759			return ctx->ctrl_hdl.error;
   760		}
   761	
   762		for (i = 0; i < NUM_CTRLS; i++) {
   763			struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
   764			cfg.ops = &mtk_vcodec_dec_ctrl_ops;
   765	
   766			mtk_vcodec_dec_reset_controls(&cfg, ctx);
   767			v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
   768			if (ctx->ctrl_hdl.error) {
   769				mtk_v4l2_vdec_err(ctx, "Adding control %d failed %d", i,
   770						  ctx->ctrl_hdl.error);
   771				return ctx->ctrl_hdl.error;
   772			}
   773		}
   774	
   775		ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
   776					 V4L2_CID_MPEG_MTK_GET_SECURE_HANDLE, 0, 65535, 1 , 0);
   777		ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl, &mtk_vcodec_dec_ctrl_ops,
   778					 V4L2_CID_MPEG_MTK_SET_SECURE_MODE, 0, 65535, 1 , 0);
   779	
   780		v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
   781	
   782		return 0;
   783	}
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
