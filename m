Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F55C8D1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723242676; cv=none; b=lJitpfnJ6PqiQCvzKMR2jbrlGrGxTNDmu34j9lq7w926FDN/nrEljOELg6JDOLrNUhSj/FIDQwQaSqf2V/VjBaES6Syx0OQv1bxD1yqhfnaGTnCB4GQIVIRPhq1p6J9uA59/RdnD4L8rMK8w2pGj8LIat+Tq6lYwTTFmABdv/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723242676; c=relaxed/simple;
	bh=0s1WR6o82ek09gNJyE91X6Duxz83byrk4zpwOY8CiDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ic1YB4d9eVyjHIp9VL9m/P4boKUzV/oHnaLS6jUDl4buuJwP8ufP8NeNxBFvPKOou4Rx6E1YfPQJ1PnmzXF7ncocmFo45pJORcSZHfFo+xVE+brR2g/JlVIs2QZiwAtpp4ywbrwDnzE33yi3L+hlUNzq5bIrGImjjVEDm3Hxthg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSgiHTKk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSgiHTKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723242675; x=1754778675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0s1WR6o82ek09gNJyE91X6Duxz83byrk4zpwOY8CiDs=;
  b=cSgiHTKkMst8IYVTGZ3nB82wk9dzOh+Mt6NpDw64VfhpXc1SkPsAPi69
   7N33e6gV8sbOxPF5GV8nEGyXRSFiQ2lqHNxgk9J9C6y82Lry8f2RPhDhS
   XNRiRYyKROR4AvCApfIsWZ+00EBvvLevoU5PDV7ioZbkR19Lm73kyWq6b
   SmzQQGaWWoyhabnmllNu7JznAQmni6GgyowB3Drp7F1VTDuVmhryLwQHu
   eXW/WYk9W3gRgSH7V89/QAmA5crZ8nYTvL2Yecnh/nKx+nb3GUpl21xp7
   MnKundD+VhoEfccuSOG4bCqWj20GJmY8NkeEw0YeMeUvJIX+LZSzA28Qb
   g==;
X-CSE-ConnectionGUID: P5epyST/Rx+gPNLpG49i1g==
X-CSE-MsgGUID: 4LMlO80uTBW/3c0t0KYYyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21290408"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="21290408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 15:31:14 -0700
X-CSE-ConnectionGUID: lLKH8VBbT8Ce3Qzb90cN2w==
X-CSE-MsgGUID: KtjP5irCTECLCUNLX6y6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="80919143"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2024 15:31:13 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scY8c-0009JT-38;
	Fri, 09 Aug 2024 22:31:10 +0000
Date: Sat, 10 Aug 2024 06:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [broonie-ci:filehZ3h8g 26/28] sound/soc/sof/amd/acp.c:407:26: error:
 'struct acp_dev_data' has no member named 'pci_rev'
Message-ID: <202408100602.KOK3d2GH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filehZ3h8g
head:   45576eb691a6ad128c577d4b904380458359e3e5
commit: a8d93b9b3a43cbb342fb6d37c0f0ad5a1a0e503f [26/28] ASoC: SOF: amd: fix for acp error reason registers wrong offset
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240810/202408100602.KOK3d2GH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100602.KOK3d2GH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100602.KOK3d2GH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/amd/acp.c: In function 'acp_irq_handler':
>> sound/soc/sof/amd/acp.c:407:26: error: 'struct acp_dev_data' has no member named 'pci_rev'
     407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
         |                          ^~


vim +407 sound/soc/sof/amd/acp.c

   377	
   378	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
   379	{
   380		struct amd_sdw_manager *amd_manager;
   381		struct snd_sof_dev *sdev = dev_id;
   382		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
   383		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
   384		unsigned int base = desc->dsp_intr_base;
   385		unsigned int val;
   386		int irq_flag = 0;
   387	
   388		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
   389		if (val & ACP_DSP_TO_HOST_IRQ) {
   390			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
   391					  ACP_DSP_TO_HOST_IRQ);
   392			return IRQ_WAKE_THREAD;
   393		}
   394	
   395		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
   396		if (val & ACP_SDW0_IRQ_MASK) {
   397			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
   398			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
   399			if (amd_manager)
   400				schedule_work(&amd_manager->amd_sdw_irq_thread);
   401			irq_flag = 1;
   402		}
   403	
   404		if (val & ACP_ERROR_IRQ_MASK) {
   405			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
   406			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
 > 407			if (adata->pci_rev >= ACP_RMB_PCI_ID)
   408				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
   409			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
   410			irq_flag = 1;
   411		}
   412	
   413		if (desc->ext_intr_stat1) {
   414			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
   415			if (val & ACP_SDW1_IRQ_MASK) {
   416				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
   417				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
   418						  ACP_SDW1_IRQ_MASK);
   419				if (amd_manager)
   420					schedule_work(&amd_manager->amd_sdw_irq_thread);
   421				irq_flag = 1;
   422			}
   423		}
   424		if (irq_flag)
   425			return IRQ_HANDLED;
   426		else
   427			return IRQ_NONE;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
