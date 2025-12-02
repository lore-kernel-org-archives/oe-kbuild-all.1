Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AD3016F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664876; cv=none; b=O7Bq7F6jfnfuTUtj1T8ba0b11E+jLn9FAy99odhDO+z5jqcQbWtubIr54iaRQWRYYca8NNq8mE3+8HH7InRIJuzcF2oC5wV/MHCJAE2qc0PU81JXiYC8G9tBywLM/J25J2S+At+4faHkw2W+pd12VY3Oubm0yyP8le9bCIeC6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664876; c=relaxed/simple;
	bh=BYTiDcdhxCAGocS6ZftdQ9/2eGcWkIhEYjSR9KWxvFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNFnfwcz9Get9WIeCJb+vUpE8C6OFhGOKc3Oua3pnD78oFoU1ND8t64SnC87I+rQmaPJd1uTgyZut2vX7OQJWOyH+C7ECaMGfZBDD8ikY6Td0Jd1JYPhdWjDlINdjMn78TZ5rjBsRnPQDEFUfb7TDxYY+ez++lkmclwQgBlXl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZQymIn/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZQymIn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764664874; x=1796200874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYTiDcdhxCAGocS6ZftdQ9/2eGcWkIhEYjSR9KWxvFU=;
  b=HZQymIn/cAbQlnTf2etF99v3VYU1NoBa8KuQS4qMKtO31zDCsUGZi2Lc
   ze4S2xBJ5J0MbKAUE1qnI/Ll4jQeKHiV/Ven0a+NkLT383iTvfUD3cTsI
   6KiAtPLU1JRfNA6X31V18SOwKX0wv34c7EdTP4eYNo6drUdAtWIlrRry2
   LTa2BwHk7hGjuGf4iCQTkWhLoYetFQapbIgSrGwbfeNX0373tOQaOiwVc
   qL+4T8mIyC6X1dHXoZvh+wSB5hiBa81S8xc0SOY6tqBvtgZdwuj1yf3UZ
   i9ss16hRucVPjq7lQQLRGR1OWWuvBoy4EW5Wd8ILPjpEER0kb280Te4pl
   w==;
X-CSE-ConnectionGUID: YDGvwkYPRIavs8nd9zD3yQ==
X-CSE-MsgGUID: akZ9i1y7Tdyp082CMaU5+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66661815"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66661815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:41:11 -0800
X-CSE-ConnectionGUID: ZLrST2yMQsSuyUDSv6R5gQ==
X-CSE-MsgGUID: vETNE/pXRsWNFKCL94CwCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198782177"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 00:41:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLwZ-000000009b4-3zT4;
	Tue, 02 Dec 2025 08:41:07 +0000
Date: Tue, 2 Dec 2025 16:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 11/11]
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c:226:2: error: call to undeclared
 function 'mtk_crtc_create_crc_cmdq'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202512021643.dpoxThyu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a3288bce089f912740a68f94368270c1eb6218b1
commit: 31d89b3b35a1b3278e9075c9c02bc52730c223b4 [11/11] CHROMIUM: mediatek/drm: Add DITHER CRC functionality and refactor OUTPROC
config: arm64-randconfig-002-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021643.dpoxThyu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021643.dpoxThyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021643.dpoxThyu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:80:2: error: call to undeclared function 'mtk_crtc_read_crc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         mtk_crtc_read_crc(&priv->crc);
         |         ^
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:226:2: error: call to undeclared function 'mtk_crtc_create_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     226 |         mtk_crtc_create_crc_cmdq(&priv->crc, data);
         |         ^
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:233:2: error: call to undeclared function 'mtk_crtc_destroy_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     233 |         mtk_crtc_destroy_crc_cmdq(&priv->crc);
         |         ^
   3 errors generated.
--
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:143:3: error: call to undeclared function 'mtk_crtc_start_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |                 mtk_crtc_start_crc_cmdq(&dither->crc);
         |                 ^
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:156:3: error: call to undeclared function 'mtk_crtc_stop_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |                 mtk_crtc_stop_crc_cmdq(&dither->crc);
         |                 ^
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:178:2: error: call to undeclared function 'mtk_crtc_read_crc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     178 |         mtk_crtc_read_crc(&priv->crc);
         |         ^
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:200:2: error: call to undeclared function 'mtk_crtc_create_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     200 |         mtk_crtc_create_crc_cmdq(&priv->crc, data);
         |         ^
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:207:2: error: call to undeclared function 'mtk_crtc_destroy_crc_cmdq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         mtk_crtc_destroy_crc_cmdq(&priv->crc);
         |         ^
   drivers/gpu/drm/mediatek/mtk_disp_dither.c:210:6: warning: no previous prototype for function 'mtk_dither_set' [-Wmissing-prototypes]
     210 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         |      ^
   drivers/gpu/drm/mediatek/mtk_disp_dither.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         | ^
         | static 
   1 warning and 5 errors generated.


vim +/mtk_crtc_create_crc_cmdq +226 drivers/gpu/drm/mediatek/mtk_disp_outproc.c

   221	
   222	void mtk_disp_outproc_crc_attach(struct device *dev, struct mtk_crtc *data)
   223	{
   224		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
   225	
 > 226		mtk_crtc_create_crc_cmdq(&priv->crc, data);
   227	}
   228	
   229	void mtk_disp_outproc_crc_detach(struct device *dev)
   230	{
   231		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
   232	
 > 233		mtk_crtc_destroy_crc_cmdq(&priv->crc);
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
