Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57935948
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760320773; cv=none; b=tGkfubbQbgmtj315yKIv5lPNrMD3ECNBsqLC9DLA+Z83rzxIcUOL0RV7Kuuc4YeKoWdjNykD6j3DnfRXtsHmzOvu3BhmfIXNcg+GtYU8SdR0o5E4xolWWCdcmHdJqVC2NruO8WYaNFlHWe6jwLWRg50IyNN7ZKnAL9IKKsbsYPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760320773; c=relaxed/simple;
	bh=/T3XCoRX3N7WQbcbsd1dZxZHjji1Bq9XUdLBzRWVosQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uo+gerFbrmGH6u45eqvL5yDURlSNFvR38nHbua7+xj6IInwW9TwWBbPA8Zfu3A/yaRTr6w4sLZFgEdUS9Y1s+3rpo44Zk+h61Nl0GuW6/PskWQf0Q8zJwwlzmoMGidfcbd2ECbuC6DIGaczLgdmMOIPwTWFJNT8+z+p7QNu91Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpNtRkg1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpNtRkg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760320770; x=1791856770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/T3XCoRX3N7WQbcbsd1dZxZHjji1Bq9XUdLBzRWVosQ=;
  b=MpNtRkg1WLMWHRQwEWryhOXZASgB+0re4yokWqnYKTIpo47ZY5weNLg1
   aXqE6+ZKThJvTq+MSt3q6ZoQ183qyMo7mKFh+piTigaz7z7TT3d8ySkhW
   GWIPfOI7Sw0hM91inKgv0y0vNB5vuA2IlxZRYqEmOUH9m9aafciqZGHUQ
   5KFsE3lPfS8qer798ZN8MLFTmosMMp2dfYphPi3GSUcx9NZIRHbQQZLB7
   gZLrHv9oHAodWl7e+AQFHjF92l+6JFho57PdB/dYOVzEKhMEWAAZ4Etu3
   XcOFlPemMuVoKWfBB/8PadMr7hx5NirlW48xOn2jZyWGqfpdLSt2boqtt
   A==;
X-CSE-ConnectionGUID: MMlcggUSTXCCzQeNhas2BQ==
X-CSE-MsgGUID: fmdPc1V/RJKLFng0iuLcyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87914236"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="87914236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 18:59:29 -0700
X-CSE-ConnectionGUID: pIaWaji8QdanHq8nuAJ65w==
X-CSE-MsgGUID: 0As3Jr5VQLWfZhjeqyJ1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181485100"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2025 18:59:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v87qO-00006N-32;
	Mon, 13 Oct 2025 01:59:24 +0000
Date: Mon, 13 Oct 2025 09:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 112/114]
 drivers/clk/mediatek/clk-mt8196-disp1.c:85:2: error: use of undeclared
 identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean
 'mtk_clk_gate_ops_setclr'?
Message-ID: <202510130936.jw2WNYar-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   03a2d4a9a273dee05ce257bd5b673d647742564d
commit: 4acdbb18ee854e8d5ff467e474421cece28c3d23 [112/114] Revert "clk: mediatek: clk-gate: Add ops for gates with HW voter"
config: powerpc-randconfig-003-20251013 (https://download.01.org/0day-ci/archive/20251013/202510130936.jw2WNYar-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130936.jw2WNYar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510130936.jw2WNYar-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8196-disp1.c:85:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      85 |         GATE_HWV_MM10(CLK_MM1_DISPSYS1_CONFIG, "mm1_dispsys1_config", "disp", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:86:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      86 |         GATE_HWV_MM10(CLK_MM1_DISPSYS1_S_CONFIG, "mm1_dispsys1_s_config", "disp", 1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:87:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      87 |         GATE_HWV_MM10(CLK_MM1_DISP_MUTEX0, "mm1_disp_mutex0", "disp", 2),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:88:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      88 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC20, "mm1_disp_dli_async20", "disp", 3),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:89:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      89 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC21, "mm1_disp_dli_async21", "disp", 4),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:90:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      90 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC22, "mm1_disp_dli_async22", "disp", 5),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:91:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      91 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC23, "mm1_disp_dli_async23", "disp", 6),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:92:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      92 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC24, "mm1_disp_dli_async24", "disp", 7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:93:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      93 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC25, "mm1_disp_dli_async25", "disp", 8),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:94:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      94 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC26, "mm1_disp_dli_async26", "disp", 9),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:95:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      95 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC27, "mm1_disp_dli_async27", "disp", 10),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-disp1.c:59:11: note: expanded from macro 'GATE_HWV_MM10'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-disp1.c:96:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      96 |         GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC28, "mm1_disp_dli_async28", "disp", 11),
--
>> drivers/clk/mediatek/clk-mt8196-venc.c:80:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      80 |         GATE_HWV_VEN10(CLK_VEN1_CKE0_LARB, "ven1_larb", "venc", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:81:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      81 |         GATE_HWV_VEN10(CLK_VEN1_CKE1_VENC, "ven1_venc", "venc", 4),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:85:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      85 |         GATE_HWV_VEN10(CLK_VEN1_CKE5_GALS, "ven1_gals", "venc", 28),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:86:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      86 |         GATE_HWV_VEN10(CLK_VEN1_CKE29_VENC_ADAB_CTRL, "ven1_venc_adab_ctrl",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      87 |                         "venc", 29),
         |                         ~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:88:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      88 |         GATE_HWV_VEN10_FLAGS(CLK_VEN1_CKE29_VENC_XPC_CTRL,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      89 |                               "ven1_venc_xpc_ctrl", "venc", 30,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      90 |                               CLK_IGNORE_UNUSED),
         |                               ~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:91:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      91 |         GATE_HWV_VEN10(CLK_VEN1_CKE6_GALS_SRAM, "ven1_gals_sram", "venc", 31),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:59:11: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      59 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:93:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
      93 |         GATE_HWV_VEN11(CLK_VEN1_RES_FLAT, "ven1_res_flat", "venc", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:74:11: note: expanded from macro 'GATE_HWV_VEN11'
      74 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
>> drivers/clk/mediatek/clk-mt8196-venc.c:80:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      80 |         GATE_HWV_VEN10(CLK_VEN1_CKE0_LARB, "ven1_larb", "venc", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:81:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      81 |         GATE_HWV_VEN10(CLK_VEN1_CKE1_VENC, "ven1_venc", "venc", 4),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:85:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      85 |         GATE_HWV_VEN10(CLK_VEN1_CKE5_GALS, "ven1_gals", "venc", 28),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:86:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      86 |         GATE_HWV_VEN10(CLK_VEN1_CKE29_VENC_ADAB_CTRL, "ven1_venc_adab_ctrl",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      87 |                         "venc", 29),
         |                         ~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:88:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      88 |         GATE_HWV_VEN10_FLAGS(CLK_VEN1_CKE29_VENC_XPC_CTRL,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      89 |                               "ven1_venc_xpc_ctrl", "venc", 30,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      90 |                               CLK_IGNORE_UNUSED),
         |                               ~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:91:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      91 |         GATE_HWV_VEN10(CLK_VEN1_CKE6_GALS_SRAM, "ven1_gals_sram", "venc", 31),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:65:2: note: expanded from macro 'GATE_HWV_VEN10'
      65 |         GATE_HWV_VEN10_FLAGS(_id, _name, _parent, _shift, 0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:57:4: note: expanded from macro 'GATE_HWV_VEN10_FLAGS'
      57 |                 .hwv_regs = &ven10_hwv_regs,                            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:93:2: error: field designator 'hwv_regs' does not refer to any field in type 'const struct mtk_gate'
      93 |         GATE_HWV_VEN11(CLK_VEN1_RES_FLAT, "ven1_res_flat", "venc", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:72:4: note: expanded from macro 'GATE_HWV_VEN11'
      72 |                 .hwv_regs = &ven11_hwv_regs,            \
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mediatek/clk-mt8196-venc.c:98:14: error: invalid application of 'sizeof' to an incomplete type 'const struct mtk_gate[]'
      98 |         .num_clks = ARRAY_SIZE(ven1_clks),
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:148:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
     148 |         GATE_HWV_VEN20(CLK_VEN2_CKE0_LARB, "ven2_larb", "venc", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:131:11: note: expanded from macro 'GATE_HWV_VEN20'
     131 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:149:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
     149 |         GATE_HWV_VEN20(CLK_VEN2_CKE1_VENC, "ven2_venc", "venc", 4),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:131:11: note: expanded from macro 'GATE_HWV_VEN20'
     131 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:152:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
     152 |         GATE_HWV_VEN20(CLK_VEN2_CKE5_GALS, "ven2_gals", "venc", 28),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:131:11: note: expanded from macro 'GATE_HWV_VEN20'
     131 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-venc.c:153:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr_inv'; did you mean 'mtk_clk_gate_ops_setclr_inv'?
     153 |         GATE_HWV_VEN20(CLK_VEN2_CKE29_VENC_XPC_CTRL, "ven2_venc_xpc_ctrl", "venc", 30),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-venc.c:131:11: note: expanded from macro 'GATE_HWV_VEN20'
     131 |                 .ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:19:29: note: 'mtk_clk_gate_ops_setclr_inv' declared here
      19 | extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
         |                             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/clk/mediatek/clk-mt8196-ovl0.c:66:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      66 |         GATE_HWV_OVL0(CLK_OVLSYS_CONFIG, "ovlsys_config", "disp", 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:67:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      67 |         GATE_HWV_OVL0(CLK_OVL_FAKE_ENG0, "ovl_fake_eng0", "disp", 1),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:68:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      68 |         GATE_HWV_OVL0(CLK_OVL_FAKE_ENG1, "ovl_fake_eng1", "disp", 2),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:69:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      69 |         GATE_HWV_OVL0(CLK_OVL_MUTEX0, "ovl_mutex0", "disp", 3),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:70:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      70 |         GATE_HWV_OVL0(CLK_OVL_EXDMA0, "ovl_exdma0", "disp", 4),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:71:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      71 |         GATE_HWV_OVL0(CLK_OVL_EXDMA1, "ovl_exdma1", "disp", 5),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:72:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      72 |         GATE_HWV_OVL0(CLK_OVL_EXDMA2, "ovl_exdma2", "disp", 6),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:73:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      73 |         GATE_HWV_OVL0(CLK_OVL_EXDMA3, "ovl_exdma3", "disp", 7),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:74:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      74 |         GATE_HWV_OVL0(CLK_OVL_EXDMA4, "ovl_exdma4", "disp", 8),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:75:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      75 |         GATE_HWV_OVL0(CLK_OVL_EXDMA5, "ovl_exdma5", "disp", 9),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:76:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      76 |         GATE_HWV_OVL0(CLK_OVL_EXDMA6, "ovl_exdma6", "disp", 10),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-ovl0.c:49:11: note: expanded from macro 'GATE_HWV_OVL0'
      49 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-gate.h:18:29: note: 'mtk_clk_gate_ops_setclr' declared here
      18 | extern const struct clk_ops mtk_clk_gate_ops_setclr;
         |                             ^
   drivers/clk/mediatek/clk-mt8196-ovl0.c:77:2: error: use of undeclared identifier 'mtk_clk_gate_hwv_ops_setclr'; did you mean 'mtk_clk_gate_ops_setclr'?
      77 |         GATE_HWV_OVL0(CLK_OVL_EXDMA7, "ovl_exdma7", "disp", 11),
..


vim +85 drivers/clk/mediatek/clk-mt8196-disp1.c

e2d924746082ec Laura Nao 2025-09-15   41  
e2d924746082ec Laura Nao 2025-09-15   42  #define GATE_MM10(_id, _name, _parent, _shift) {\
e2d924746082ec Laura Nao 2025-09-15   43  		.id = _id,			\
e2d924746082ec Laura Nao 2025-09-15   44  		.name = _name,			\
e2d924746082ec Laura Nao 2025-09-15   45  		.parent_name = _parent,		\
e2d924746082ec Laura Nao 2025-09-15   46  		.regs = &mm10_cg_regs,		\
e2d924746082ec Laura Nao 2025-09-15   47  		.shift = _shift,		\
e2d924746082ec Laura Nao 2025-09-15   48  		.flags = CLK_OPS_PARENT_ENABLE,	\
e2d924746082ec Laura Nao 2025-09-15   49  		.ops = &mtk_clk_gate_ops_setclr,\
e2d924746082ec Laura Nao 2025-09-15   50  	}
e2d924746082ec Laura Nao 2025-09-15   51  
e2d924746082ec Laura Nao 2025-09-15   52  #define GATE_HWV_MM10(_id, _name, _parent, _shift) {	\
e2d924746082ec Laura Nao 2025-09-15   53  		.id = _id,				\
e2d924746082ec Laura Nao 2025-09-15   54  		.name = _name,				\
e2d924746082ec Laura Nao 2025-09-15   55  		.parent_name = _parent,			\
e2d924746082ec Laura Nao 2025-09-15   56  		.regs = &mm10_cg_regs,			\
e2d924746082ec Laura Nao 2025-09-15   57  		.hwv_regs = &mm10_hwv_regs,		\
e2d924746082ec Laura Nao 2025-09-15   58  		.shift = _shift,			\
e2d924746082ec Laura Nao 2025-09-15   59  		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
e2d924746082ec Laura Nao 2025-09-15   60  		.flags = CLK_OPS_PARENT_ENABLE,		\
e2d924746082ec Laura Nao 2025-09-15   61  	}
e2d924746082ec Laura Nao 2025-09-15   62  
e2d924746082ec Laura Nao 2025-09-15   63  #define GATE_MM11(_id, _name, _parent, _shift) {\
e2d924746082ec Laura Nao 2025-09-15   64  		.id = _id,			\
e2d924746082ec Laura Nao 2025-09-15   65  		.name = _name,			\
e2d924746082ec Laura Nao 2025-09-15   66  		.parent_name = _parent,		\
e2d924746082ec Laura Nao 2025-09-15   67  		.regs = &mm11_cg_regs,		\
e2d924746082ec Laura Nao 2025-09-15   68  		.shift = _shift,		\
e2d924746082ec Laura Nao 2025-09-15   69  		.flags = CLK_OPS_PARENT_ENABLE,	\
e2d924746082ec Laura Nao 2025-09-15   70  		.ops = &mtk_clk_gate_ops_setclr,\
e2d924746082ec Laura Nao 2025-09-15   71  	}
e2d924746082ec Laura Nao 2025-09-15   72  
e2d924746082ec Laura Nao 2025-09-15   73  #define GATE_HWV_MM11(_id, _name, _parent, _shift) {	\
e2d924746082ec Laura Nao 2025-09-15   74  		.id = _id,				\
e2d924746082ec Laura Nao 2025-09-15   75  		.name = _name,				\
e2d924746082ec Laura Nao 2025-09-15   76  		.parent_name = _parent,			\
e2d924746082ec Laura Nao 2025-09-15   77  		.regs = &mm11_cg_regs,			\
e2d924746082ec Laura Nao 2025-09-15   78  		.hwv_regs = &mm11_hwv_regs,		\
e2d924746082ec Laura Nao 2025-09-15   79  		.shift = _shift,			\
e2d924746082ec Laura Nao 2025-09-15   80  		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
e2d924746082ec Laura Nao 2025-09-15   81  	}
e2d924746082ec Laura Nao 2025-09-15   82  
e2d924746082ec Laura Nao 2025-09-15   83  static const struct mtk_gate mm1_clks[] = {
e2d924746082ec Laura Nao 2025-09-15   84  	/* MM10 */
e2d924746082ec Laura Nao 2025-09-15  @85  	GATE_HWV_MM10(CLK_MM1_DISPSYS1_CONFIG, "mm1_dispsys1_config", "disp", 0),
e2d924746082ec Laura Nao 2025-09-15   86  	GATE_HWV_MM10(CLK_MM1_DISPSYS1_S_CONFIG, "mm1_dispsys1_s_config", "disp", 1),
e2d924746082ec Laura Nao 2025-09-15   87  	GATE_HWV_MM10(CLK_MM1_DISP_MUTEX0, "mm1_disp_mutex0", "disp", 2),
e2d924746082ec Laura Nao 2025-09-15   88  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC20, "mm1_disp_dli_async20", "disp", 3),
e2d924746082ec Laura Nao 2025-09-15   89  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC21, "mm1_disp_dli_async21", "disp", 4),
e2d924746082ec Laura Nao 2025-09-15   90  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC22, "mm1_disp_dli_async22", "disp", 5),
e2d924746082ec Laura Nao 2025-09-15   91  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC23, "mm1_disp_dli_async23", "disp", 6),
e2d924746082ec Laura Nao 2025-09-15   92  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC24, "mm1_disp_dli_async24", "disp", 7),
e2d924746082ec Laura Nao 2025-09-15   93  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC25, "mm1_disp_dli_async25", "disp", 8),
e2d924746082ec Laura Nao 2025-09-15   94  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC26, "mm1_disp_dli_async26", "disp", 9),
e2d924746082ec Laura Nao 2025-09-15   95  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC27, "mm1_disp_dli_async27", "disp", 10),
e2d924746082ec Laura Nao 2025-09-15   96  	GATE_HWV_MM10(CLK_MM1_DISP_DLI_ASYNC28, "mm1_disp_dli_async28", "disp", 11),
e2d924746082ec Laura Nao 2025-09-15   97  	GATE_HWV_MM10(CLK_MM1_DISP_RELAY0, "mm1_disp_relay0", "disp", 12),
e2d924746082ec Laura Nao 2025-09-15   98  	GATE_HWV_MM10(CLK_MM1_DISP_RELAY1, "mm1_disp_relay1", "disp", 13),
e2d924746082ec Laura Nao 2025-09-15   99  	GATE_HWV_MM10(CLK_MM1_DISP_RELAY2, "mm1_disp_relay2", "disp", 14),
e2d924746082ec Laura Nao 2025-09-15  100  	GATE_HWV_MM10(CLK_MM1_DISP_RELAY3, "mm1_disp_relay3", "disp", 15),
e2d924746082ec Laura Nao 2025-09-15  101  	GATE_HWV_MM10(CLK_MM1_DISP_DP_INTF0, "mm1_DP_CLK", "disp", 16),
e2d924746082ec Laura Nao 2025-09-15  102  	GATE_HWV_MM10(CLK_MM1_DISP_DP_INTF1, "mm1_disp_dp_intf1", "disp", 17),
e2d924746082ec Laura Nao 2025-09-15  103  	GATE_HWV_MM10(CLK_MM1_DISP_DSC_WRAP0, "mm1_disp_dsc_wrap0", "disp", 18),
e2d924746082ec Laura Nao 2025-09-15  104  	GATE_HWV_MM10(CLK_MM1_DISP_DSC_WRAP1, "mm1_disp_dsc_wrap1", "disp", 19),
e2d924746082ec Laura Nao 2025-09-15  105  	GATE_HWV_MM10(CLK_MM1_DISP_DSC_WRAP2, "mm1_disp_dsc_wrap2", "disp", 20),
e2d924746082ec Laura Nao 2025-09-15  106  	GATE_HWV_MM10(CLK_MM1_DISP_DSC_WRAP3, "mm1_disp_dsc_wrap3", "disp", 21),
e2d924746082ec Laura Nao 2025-09-15  107  	GATE_HWV_MM10(CLK_MM1_DISP_DSI0, "mm1_CLK0", "disp", 22),
e2d924746082ec Laura Nao 2025-09-15  108  	GATE_HWV_MM10(CLK_MM1_DISP_DSI1, "mm1_CLK1", "disp", 23),
e2d924746082ec Laura Nao 2025-09-15  109  	GATE_HWV_MM10(CLK_MM1_DISP_DSI2, "mm1_CLK2", "disp", 24),
e2d924746082ec Laura Nao 2025-09-15  110  	GATE_HWV_MM10(CLK_MM1_DISP_DVO0, "mm1_disp_dvo0", "disp", 25),
e2d924746082ec Laura Nao 2025-09-15  111  	GATE_HWV_MM10(CLK_MM1_DISP_GDMA0, "mm1_disp_gdma0", "disp", 26),
e2d924746082ec Laura Nao 2025-09-15  112  	GATE_HWV_MM10(CLK_MM1_DISP_MERGE0, "mm1_disp_merge0", "disp", 27),
e2d924746082ec Laura Nao 2025-09-15  113  	GATE_HWV_MM10(CLK_MM1_DISP_MERGE1, "mm1_disp_merge1", "disp", 28),
e2d924746082ec Laura Nao 2025-09-15  114  	GATE_HWV_MM10(CLK_MM1_DISP_MERGE2, "mm1_disp_merge2", "disp", 29),
e2d924746082ec Laura Nao 2025-09-15  115  	GATE_HWV_MM10(CLK_MM1_DISP_ODDMR0, "mm1_disp_oddmr0", "disp", 30),
e2d924746082ec Laura Nao 2025-09-15  116  	GATE_HWV_MM10(CLK_MM1_DISP_POSTALIGN0, "mm1_disp_postalign0", "disp", 31),
e2d924746082ec Laura Nao 2025-09-15  117  	/* MM11 */
e2d924746082ec Laura Nao 2025-09-15  118  	GATE_HWV_MM11(CLK_MM1_DISP_DITHER2, "mm1_disp_dither2", "disp", 0),
e2d924746082ec Laura Nao 2025-09-15  119  	GATE_HWV_MM11(CLK_MM1_DISP_R2Y0, "mm1_disp_r2y0", "disp", 1),
e2d924746082ec Laura Nao 2025-09-15  120  	GATE_HWV_MM11(CLK_MM1_DISP_SPLITTER0, "mm1_disp_splitter0", "disp", 2),
e2d924746082ec Laura Nao 2025-09-15  121  	GATE_HWV_MM11(CLK_MM1_DISP_SPLITTER1, "mm1_disp_splitter1", "disp", 3),
e2d924746082ec Laura Nao 2025-09-15  122  	GATE_HWV_MM11(CLK_MM1_DISP_SPLITTER2, "mm1_disp_splitter2", "disp", 4),
e2d924746082ec Laura Nao 2025-09-15  123  	GATE_HWV_MM11(CLK_MM1_DISP_SPLITTER3, "mm1_disp_splitter3", "disp", 5),
e2d924746082ec Laura Nao 2025-09-15  124  	GATE_HWV_MM11(CLK_MM1_DISP_VDCM0, "mm1_disp_vdcm0", "disp", 6),
e2d924746082ec Laura Nao 2025-09-15  125  	GATE_HWV_MM11(CLK_MM1_DISP_WDMA1, "mm1_disp_wdma1", "disp", 7),
e2d924746082ec Laura Nao 2025-09-15  126  	GATE_HWV_MM11(CLK_MM1_DISP_WDMA2, "mm1_disp_wdma2", "disp", 8),
e2d924746082ec Laura Nao 2025-09-15  127  	GATE_HWV_MM11(CLK_MM1_DISP_WDMA3, "mm1_disp_wdma3", "disp", 9),
e2d924746082ec Laura Nao 2025-09-15  128  	GATE_HWV_MM11(CLK_MM1_DISP_WDMA4, "mm1_disp_wdma4", "disp", 10),
e2d924746082ec Laura Nao 2025-09-15  129  	GATE_HWV_MM11(CLK_MM1_MDP_RDMA1, "mm1_mdp_rdma1", "disp", 11),
e2d924746082ec Laura Nao 2025-09-15  130  	GATE_HWV_MM11(CLK_MM1_SMI_LARB0, "mm1_smi_larb0", "disp", 12),
e2d924746082ec Laura Nao 2025-09-15  131  	GATE_HWV_MM11(CLK_MM1_MOD1, "mm1_mod1", "clk26m", 13),
e2d924746082ec Laura Nao 2025-09-15  132  	GATE_HWV_MM11(CLK_MM1_MOD2, "mm1_mod2", "clk26m", 14),
e2d924746082ec Laura Nao 2025-09-15  133  	GATE_HWV_MM11(CLK_MM1_MOD3, "mm1_mod3", "clk26m", 15),
e2d924746082ec Laura Nao 2025-09-15  134  	GATE_HWV_MM11(CLK_MM1_MOD4, "mm1_mod4", "dp0", 16),
e2d924746082ec Laura Nao 2025-09-15  135  	GATE_HWV_MM11(CLK_MM1_MOD5, "mm1_mod5", "dp1", 17),
e2d924746082ec Laura Nao 2025-09-15  136  	GATE_HWV_MM11(CLK_MM1_MOD6, "mm1_mod6", "dp1", 18),
e2d924746082ec Laura Nao 2025-09-15  137  	GATE_HWV_MM11(CLK_MM1_CG0, "mm1_cg0", "disp", 20),
e2d924746082ec Laura Nao 2025-09-15  138  	GATE_HWV_MM11(CLK_MM1_CG1, "mm1_cg1", "disp", 21),
e2d924746082ec Laura Nao 2025-09-15  139  	GATE_HWV_MM11(CLK_MM1_CG2, "mm1_cg2", "disp", 22),
e2d924746082ec Laura Nao 2025-09-15  140  	GATE_HWV_MM11(CLK_MM1_CG3, "mm1_cg3", "disp", 23),
e2d924746082ec Laura Nao 2025-09-15  141  	GATE_HWV_MM11(CLK_MM1_CG4, "mm1_cg4", "disp", 24),
e2d924746082ec Laura Nao 2025-09-15  142  	GATE_HWV_MM11(CLK_MM1_CG5, "mm1_cg5", "disp", 25),
e2d924746082ec Laura Nao 2025-09-15  143  	GATE_HWV_MM11(CLK_MM1_CG6, "mm1_cg6", "disp", 26),
e2d924746082ec Laura Nao 2025-09-15  144  	GATE_HWV_MM11(CLK_MM1_CG7, "mm1_cg7", "disp", 27),
e2d924746082ec Laura Nao 2025-09-15  145  	GATE_HWV_MM11(CLK_MM1_F26M, "mm1_f26m_ck", "clk26m", 28),
e2d924746082ec Laura Nao 2025-09-15  146  };
e2d924746082ec Laura Nao 2025-09-15  147  

:::::: The code at line 85 was first introduced by commit
:::::: e2d924746082ec2775f09c61279752aea0d670ac clk: mediatek: Add MT8196 disp1 clock support

:::::: TO: Laura Nao <laura.nao@collabora.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
