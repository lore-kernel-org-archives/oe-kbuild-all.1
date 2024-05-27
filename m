Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542EA167260
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716845928; cv=none; b=NOGeztsNBwun/6neZPTbQiANJatDTuSlbbi6esnzR2gXJtss0ztMa0OaJkYuwS0y4qU9meQ/RDBVWyRM4xzqFZ6Y/SCX5EyeGRdTM1FInLRP8TiYC1k3WcmCxIVtx+3k8SA3pMfVO3axXtfXXHWEnyCTF/QrrRzrqB06P4ZoAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716845928; c=relaxed/simple;
	bh=sBaL+lBurkA8qqcakQUZMX2YptebSyPCWu+/5hXS4cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RP9ix4l1jR2obS4wMX2THwKBcw4ZiN0qhMFghUQUO5bVIQgeFv1XH604LFeDezVunemGc7MLLEaGQHWcP2WFOBnF18DkJoOUMZklFKtxaVUY1GgTjwP6E02a/fpYsYkL6NfiR8VK3dTWrSWtZIwJ15sDL7tmZWZsxwKrE6N8e0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnrQjo8/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnrQjo8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716845927; x=1748381927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sBaL+lBurkA8qqcakQUZMX2YptebSyPCWu+/5hXS4cw=;
  b=FnrQjo8/QspyIkN5tKwbFDQfrxGksdMoT3Es5SvR3hwfFMcE2ro8Oiil
   hcv3cRV0xZEJtgtfacnzA4rkNoMsdrVClpHEGHPHWgYY1mIO8ehs0WJ24
   /HjwZpN1KRXhuWu8yHkoo46SiuQ8GzHEN/AK95D7Aqip08vPoPsK4mJxD
   fLsEoBrYwG7mLqp0yKvbIEXS2uXG37Gw35rns1dSTDLnm1qZDmuVeTkO+
   djeZvdovv3c5AHYEesfn6w9B5rs0HGszrdLv91gucmV5yR0ZInHUnIeTx
   corhWy4ulaoFdxRB1VtVC7TDn6oj7G67/Si9knNmUSrr5OocSm9DmOuZ7
   g==;
X-CSE-ConnectionGUID: +FfCPS0ESmqF+aRauHejLA==
X-CSE-MsgGUID: Wb4GxvA0TRCX84kr7b3ECw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35687948"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="35687948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 14:38:45 -0700
X-CSE-ConnectionGUID: dKVAsre3RsumzjFsUlc1AQ==
X-CSE-MsgGUID: KA1Wq9UEThWACDXUJYjkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58046167"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2024 14:38:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBi3G-000B7z-0H;
	Mon, 27 May 2024 21:38:42 +0000
Date: Tue, 28 May 2024 05:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 2/3]
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:754:20:
 warning: variable 'ctrl' set but not used
Message-ID: <202405280504.RNaYGW4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   360fee4d8c80ae9a6cc9cddb55afd71f73c842d6
commit: 181862f67e4b1d1c98bdfcdb473a895ca5990ae3 [2/3] CHROMIUM: media: mediatek: vcodec: Add CID controls to get secure handle and set secure mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240528/202405280504.RNaYGW4o-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280504.RNaYGW4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280504.RNaYGW4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:754:20: warning: variable 'ctrl' set but not used [-Wunused-but-set-variable]
     754 |         struct v4l2_ctrl *ctrl;
         |                           ^
   1 warning generated.


vim +/ctrl +754 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c

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
