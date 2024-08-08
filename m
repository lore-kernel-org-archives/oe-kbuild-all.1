Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E37146584
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723115684; cv=none; b=cIf+9o6qqBGP/WsNV14ng70TccKpOOLDAns4yYdfLdeFsANxjZxyxcq40dXeX2/0zT8EX906eLqigxHwzo4eMefnMkeOxZvcx1GeV4tBpou4ySuZdCGKWrrbm/Wc93zmkYsHNi9jr5JSQS7H6s/cjcz24yy4zMlVsMqKRxEsCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723115684; c=relaxed/simple;
	bh=AAcpHOl0hGhv1ggvmKPF/7xx4G2FnrcSH89WaHt7ChU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MKxv6uuMgLcCJi4W7fWkMfFQVTqg2EQWNEr5TE+jAAeiQfAHgij2yndCMMBC2SCTVMi2CvIwHsYA35dGAFydnrOPOXUaF3nf7CAhh+H4fAl1Ft47fucIuxUlN0vnB0WFOYJbfMpB+XdPPFi+g5pjZSoDzd/bfejrr+1s2xXwAH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5ka1i8d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5ka1i8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723115683; x=1754651683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAcpHOl0hGhv1ggvmKPF/7xx4G2FnrcSH89WaHt7ChU=;
  b=G5ka1i8dg1J7WsTf1ujUDbo3q2uIdWUMA1Q1TmHdAitJM1JacJD4niRC
   0IV/8KvvwU/IIY9Tx38rmSrh8X1Zgl4MUdAoJgRcyhzCQxJNxTK3aEVOj
   5gus7PbFVZNIqP9ZJ32fQAkf4buBBaCefO9+duQJkpv97mQpT2Yva7+0d
   4paO3wOw1CheANJJSpc40LSWpndPCf+tBZ0ceJglJcl9q7fCVmFsJD6E9
   dNy/5ibGZHoZSOYZ+2l/4/uymFLPURxX2hhqrBJ2fJsoSJcsui81NMbDu
   cImeSsoL8T6PsGmoCXiAdN6rC8UM3jmeJw7qvX570G9VhgYqWNaMnylob
   A==;
X-CSE-ConnectionGUID: 9a98sSQSQwuxneDkqURURw==
X-CSE-MsgGUID: bwEG4/4PSnm73IX8kutaoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21092080"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="21092080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 04:14:42 -0700
X-CSE-ConnectionGUID: F6vD20NNRWaxTXu9IRoU5w==
X-CSE-MsgGUID: /FyxY21tQ9m7qhl1c8WhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57055143"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2024 04:14:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc16L-00068U-2o;
	Thu, 08 Aug 2024 11:14:37 +0000
Date: Thu, 8 Aug 2024 19:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [broonie-ci:fileZMvsMi 36/37] sound/soc/sof/amd/acp.c:277:17: error:
 'const struct sof_amd_acp_desc' has no member named 'rev'
Message-ID: <202408081943.I6HGz9Sp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileZMvsMi
head:   43e41a7c8601d155489d208c40809f96727ea7fe
commit: 1b18e9f7176f8bec6673befed88068f03fa6d254 [36/37] ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408081943.I6HGz9Sp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081943.I6HGz9Sp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081943.I6HGz9Sp-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/amd/acp.c: In function 'configure_and_run_sha_dma':
>> sound/soc/sof/amd/acp.c:277:17: error: 'const struct sof_amd_acp_desc' has no member named 'rev'
     277 |         if (desc->rev == 3) {
         |                 ^~
   sound/soc/sof/amd/acp.c:284:17: error: 'const struct sof_amd_acp_desc' has no member named 'rev'
     284 |         if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
         |                 ^~


vim +277 sound/soc/sof/amd/acp.c

f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  232  
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  233  int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  234  			      unsigned int start_addr, unsigned int dest_addr,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  235  			      unsigned int image_length)
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  236  {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  237  	struct snd_sof_dev *sdev = adata->dev;
b1db244c716fe3 Mastan Katragadda      2023-06-30  238  	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  239  	unsigned int tx_count, fw_qualifier, val;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  240  	int ret;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  241  
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  242  	if (!image_addr) {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  243  		dev_err(sdev->dev, "SHA DMA image address is NULL\n");
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  244  		return -EINVAL;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  245  	}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  246  
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  247  	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  248  	if (val & ACP_SHA_RUN) {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  249  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RESET);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  250  		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD_STS,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  251  						    val, val & ACP_SHA_RESET,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  252  						    ACP_REG_POLL_INTERVAL,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  253  						    ACP_REG_POLL_TIMEOUT_US);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  254  		if (ret < 0) {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  255  			dev_err(sdev->dev, "SHA DMA Failed to Reset\n");
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  256  			return ret;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  257  		}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  258  	}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  259  
33c3d813330718 Cristian Ciocaltea     2024-02-20  260  	if (adata->quirks && adata->quirks->signed_fw_image)
6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  261  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_INCLUDE_HDR, ACP_SHA_HEADER);
6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  262  
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  263  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_STRT_ADDR, start_addr);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  264  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  265  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  266  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RUN);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  267  
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  268  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_TRANSFER_BYTE_CNT,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  269  					    tx_count, tx_count == image_length,
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  270  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  271  	if (ret < 0) {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  272  		dev_err(sdev->dev, "SHA DMA Failed to Transfer Length %x\n", tx_count);
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  273  		return ret;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  274  	}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  275  
b1db244c716fe3 Mastan Katragadda      2023-06-30  276  	/* psp_send_cmd only required for renoir platform (rev - 3) */
b1db244c716fe3 Mastan Katragadda      2023-06-30 @277  	if (desc->rev == 3) {
bbdcd3d590cad7 Ajit Kumar Pandey      2022-04-21  278  		ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  279  		if (ret)
f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  280  			return ret;
b1db244c716fe3 Mastan Katragadda      2023-06-30  281  	}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  282  
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  283  	/* psp_send_cmd only required for vangogh platform (rev - 5) */
094d11768f740f Cristian Ciocaltea     2024-02-20  284  	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  285  		/* Modify IRAM and DRAM size */
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  286  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  287  		if (ret)
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  288  			return ret;
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  289  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  290  		if (ret)
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  291  			return ret;
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  292  	}
55d7bbe433467a Venkata Prasad Potturu 2023-12-19  293  
2a2f5f2384b979 Ajye Huang             2022-12-05  294  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
2a2f5f2384b979 Ajye Huang             2022-12-05  295  					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
2a2f5f2384b979 Ajye Huang             2022-12-05  296  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
2a2f5f2384b979 Ajye Huang             2022-12-05  297  	if (ret < 0) {
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  298  		dev_err(sdev->dev, "PSP validation failed\n");
2a2f5f2384b979 Ajye Huang             2022-12-05  299  		return ret;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  300  	}
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  301  
2dc643cd756398 Pierre-Louis Bossart   2021-12-21  302  	return 0;
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  303  }
0e44572a28a491 Ajit Kumar Pandey      2021-11-17  304  

:::::: The code at line 277 was first introduced by commit
:::::: b1db244c716fe300e36428aeb0874913d2e0a91d ASoC: SOF: amd: add revision check for sending sha dma completion command

:::::: TO: Mastan Katragadda <Mastan.Katragadda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
