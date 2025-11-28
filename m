Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBDC149C6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 03:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302217; cv=none; b=cA4z9ARCuzizDahKlSSSlTfsu0Is4zUAS21/73bfFNIpU5IQ8e8T6dAXGrdH1Ew+Bg7qPflVvwEMocE7TduBWnnlwBvqwmdv5Vs24KpGXQo9p0IPzaRTY7KLo6RAKPJILLZp6loAgmfNtMYkpNgpCaRIN2qQIwrvVk5T0Bi8F6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302217; c=relaxed/simple;
	bh=UMqTCaDwldL0LfXr8jTnIouASNS0ueChF/JL6+6rwsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeFKL1kRWb+UYJXpS6muQFsDyEOm3hIeaREmALOE4QAF3wcX8ohk1hpQ3vr/IB7oV0vfrIwyC88hHcT6v+wXVcJ/cEaBDZrt9S9e/FZWNxDS1uccI36Pv0ldvacNF77cYNwvTjEl1DtRIkCpHasWEJk21eHbiAG+HMP8NP5y0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0XrGpFq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0XrGpFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764302216; x=1795838216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMqTCaDwldL0LfXr8jTnIouASNS0ueChF/JL6+6rwsM=;
  b=J0XrGpFq5ZVsb3MDTJC/kxgF5ij5ub/qZthikJCEyAHXifxCYhqBl2fX
   XFyE5AuwsMsznVStiLjvRNLzYVGp3PZR/1M1MFLQHpW617FQRkZfgPMv8
   dhquLDtRoT9YwoLnlJvhCum5w7jRmAj+HnSqF2tT4N2fmX4xYfjSGM+wA
   BWup4xi2jYS9Xk3OB+DtljptGFWeP2qaJW008CR4tZiTuHOOcHbktw/Pw
   H9OEPP7sw3Fb88KKR4crQcS+EDW6tyT+XEvUOG2xmtfhiSzzUYGXSh2A5
   mBubZ2KqPwYipLO2++r07JTtjsCpX5JI+7NKb9ngIRY71Td4Jm+nidv5a
   Q==;
X-CSE-ConnectionGUID: EPicTBZ+SN+fzcX7/HaRug==
X-CSE-MsgGUID: ppiD/7dfRwKr88RvD3mvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66050408"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66050408"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:56:55 -0800
X-CSE-ConnectionGUID: jx6JkqdVSTmEO/b+1cuTfA==
X-CSE-MsgGUID: yItV8Jo6REWJIaD0LKLRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193374830"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2025 19:56:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpbH-0000000060I-28VI;
	Fri, 28 Nov 2025 03:56:51 +0000
Date: Fri, 28 Nov 2025 11:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 2/2]
 drivers/gpu/drm/mediatek/mtk_disp_dither.c:143:3: error: implicit
 declaration of function 'mtk_crtc_start_crc_cmdq'; did you mean
 'mtk_merge_start_cmdq'?
Message-ID: <202511281116.LVwqXklp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   603ff1c9ed9f7d6441d63f591ba6abfc87c04964
commit: 31d89b3b35a1b3278e9075c9c02bc52730c223b4 [2/2] CHROMIUM: mediatek/drm: Add DITHER CRC functionality and refactor OUTPROC
config: arm64-randconfig-004-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281116.LVwqXklp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281116.LVwqXklp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281116.LVwqXklp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_dither.c: In function 'mtk_dither_start':
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:143:3: error: implicit declaration of function 'mtk_crtc_start_crc_cmdq'; did you mean 'mtk_merge_start_cmdq'? [-Werror=implicit-function-declaration]
     143 |   mtk_crtc_start_crc_cmdq(&dither->crc);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
         |   mtk_merge_start_cmdq
   drivers/gpu/drm/mediatek/mtk_disp_dither.c: In function 'mtk_dither_stop':
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:156:3: error: implicit declaration of function 'mtk_crtc_stop_crc_cmdq'; did you mean 'mtk_merge_stop_cmdq'? [-Werror=implicit-function-declaration]
     156 |   mtk_crtc_stop_crc_cmdq(&dither->crc);
         |   ^~~~~~~~~~~~~~~~~~~~~~
         |   mtk_merge_stop_cmdq
   drivers/gpu/drm/mediatek/mtk_disp_dither.c: In function 'mtk_dither_crc_read':
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:178:2: error: implicit declaration of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'? [-Werror=implicit-function-declaration]
     178 |  mtk_crtc_read_crc(&priv->crc);
         |  ^~~~~~~~~~~~~~~~~
         |  mtk_crtc_create
   drivers/gpu/drm/mediatek/mtk_disp_dither.c: In function 'mtk_dither_crc_attach':
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:200:2: error: implicit declaration of function 'mtk_crtc_create_crc_cmdq' [-Werror=implicit-function-declaration]
     200 |  mtk_crtc_create_crc_cmdq(&priv->crc, data);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_dither.c: In function 'mtk_dither_crc_detach':
>> drivers/gpu/drm/mediatek/mtk_disp_dither.c:207:2: error: implicit declaration of function 'mtk_crtc_destroy_crc_cmdq' [-Werror=implicit-function-declaration]
     207 |  mtk_crtc_destroy_crc_cmdq(&priv->crc);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_dither.c: At top level:
   drivers/gpu/drm/mediatek/mtk_disp_dither.c:210:6: warning: no previous prototype for 'mtk_dither_set' [-Wmissing-prototypes]
     210 | void mtk_dither_set(struct device *dev, unsigned int bpc,
         |      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c: In function 'mtk_disp_outproc_crc_read':
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:80:2: error: implicit declaration of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'? [-Werror=implicit-function-declaration]
      80 |  mtk_crtc_read_crc(&priv->crc);
         |  ^~~~~~~~~~~~~~~~~
         |  mtk_crtc_create
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c: In function 'mtk_disp_outproc_crc_attach':
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:226:2: error: implicit declaration of function 'mtk_crtc_create_crc_cmdq' [-Werror=implicit-function-declaration]
     226 |  mtk_crtc_create_crc_cmdq(&priv->crc, data);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c: In function 'mtk_disp_outproc_crc_detach':
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:233:2: error: implicit declaration of function 'mtk_crtc_destroy_crc_cmdq' [-Werror=implicit-function-declaration]
     233 |  mtk_crtc_destroy_crc_cmdq(&priv->crc);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c:58:18: warning: 'outproc_crc_ofs' defined but not used [-Wunused-const-variable=]
      58 | static const u32 outproc_crc_ofs[] = {
         |                  ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +143 drivers/gpu/drm/mediatek/mtk_disp_dither.c

   135	
   136	void mtk_dither_start(struct device *dev)
   137	{
   138		struct mtk_disp_dither *dither = dev_get_drvdata(dev);
   139	
   140		if (dither->crc.cnt) {
   141			writel(DITHER_CRC_EN | DITHER_CRC_START,
   142			       dither->regs + DISP_REG_DITHER(0));
 > 143			mtk_crtc_start_crc_cmdq(&dither->crc);
   144		}
   145	
   146		writel(DITHER_EN, dither->regs + DISP_REG_DITHER_EN);
   147	}
   148	
   149	void mtk_dither_stop(struct device *dev)
   150	{
   151		struct mtk_disp_dither *dither = dev_get_drvdata(dev);
   152	
   153		writel_relaxed(0x0, dither->regs + DISP_REG_DITHER_EN);
   154		if (dither->crc.cnt) {
   155			writel(0, dither->regs + DISP_REG_DITHER(0));
 > 156			mtk_crtc_stop_crc_cmdq(&dither->crc);
   157		}
   158	}
   159	
   160	size_t mtk_dither_crc_cnt(struct device *dev)
   161	{
   162		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   163	
   164		return priv->crc.cnt;
   165	}
   166	
   167	u32 *mtk_dither_crc_entry(struct device *dev)
   168	{
   169		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   170	
   171		return priv->crc.va;
   172	}
   173	
   174	void mtk_dither_crc_read(struct device *dev)
   175	{
   176		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   177	
 > 178		mtk_crtc_read_crc(&priv->crc);
   179	}
   180	
   181	void mtk_dither_crc_reset(struct device *dev, struct cmdq_pkt *cmdq_pkt)
   182	{
   183		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   184		struct mtk_crtc_crc *crc = &priv->crc;
   185		u32 crc_mask = DITHER_CRC_CLR | DITHER_CRC_START;
   186	
   187		/* reset crc and clear crc start bit*/
   188		mtk_ddp_write_mask(cmdq_pkt, DITHER_CRC_CLR, &priv->cmdq_reg, priv->regs,
   189				   crc->rst_ofs, crc_mask);
   190	
   191		/* clear reset bit and start crc */
   192		mtk_ddp_write_mask(cmdq_pkt, DITHER_CRC_START, &priv->cmdq_reg, priv->regs,
   193				   crc->rst_ofs, crc_mask);
   194	}
   195	
   196	void mtk_dither_crc_attach(struct device *dev, struct mtk_crtc *data)
   197	{
   198		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   199	
 > 200		mtk_crtc_create_crc_cmdq(&priv->crc, data);
   201	}
   202	
   203	void mtk_dither_crc_detach(struct device *dev)
   204	{
   205		struct mtk_disp_dither *priv = dev_get_drvdata(dev);
   206	
 > 207		mtk_crtc_destroy_crc_cmdq(&priv->crc);
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
