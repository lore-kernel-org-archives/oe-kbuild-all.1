Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A548989D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Aug 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785646861; cv=none; b=V+Z7U17BJoyGdCor7PpyQbcZNjeYyiqaNME/ru6+M3tdB6HI7K/ebcIvr4zpzuxiZcUJFvVaLgK/R7WSn0Nqi0nfLPqSOfQ6MipCouZgkLxJT7nY21pHBjtf+I+X5OGQ6oCgjusptqQO5Irj0s0XdcHe/8AZzGVkwhH1c7xjcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785646861; c=relaxed/simple;
	bh=dHxa82fYfYhogPS+MNgR1JfBzvX+Fi7WTK/SYXUc5is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VnwvQYOiLGBWo7mHt6HnrbwNsXEtqSF2HdPDaIFDIM67PgP1Vn7RkIv0WnnytwU9nLy0ECKBqaI0+kyue1kDgwfrVZRMHpe6qD7tF9t3YuE0vi1gOi1B0ZVlJ08uhaefHAcZZWHV7GHSo0FL7mvAzNoIVxB1IngRouhUkfmRrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyIxkOkN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyIxkOkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785646858; x=1817182858;
  h=date:from:to:cc:subject:message-id;
  bh=dHxa82fYfYhogPS+MNgR1JfBzvX+Fi7WTK/SYXUc5is=;
  b=FyIxkOkNQWp7tJjbwOLXeI20MRsyygx3H3Yu7pn1bGKoVNcaHUIm2IT6
   jY578x9jQAABZhdZ4iJYg2gm9zO55hBkmEUIWj3DakQxhwyaM1J6TFAvI
   qVTrO04qyu+Qa0qNOACsHFO9oXRPW+ynrU9up4ZbDjsZwohY89ncXC1l8
   /LFCASLTLgwJvAJk5QyFIk539OjGW14i2PZsXbONNGoudCiDEapQ35+c7
   IRXWDuNijjuv/YlF9wbzkmzZ599EiKr1fXGDo2Yhp0McdpMS21sehwAja
   42aFsU8n4n8nzs2DdOOp6Xj53a0D+OG44V+mj6ncQtSSU5WPcv05rgOfI
   w==;
X-CSE-ConnectionGUID: htiegY7oTXOhWyZQGpg4tg==
X-CSE-MsgGUID: qDJCedjGT9ejhh+3oK9Liw==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86093230"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86093230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 22:00:57 -0700
X-CSE-ConnectionGUID: q9G2AJWXQ3SdL9ZgqBAm5g==
X-CSE-MsgGUID: 9E4PK4FiR6acp2BgZWZT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="264393531"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Aug 2026 22:00:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqOJh-000000004Uf-3l78;
	Sun, 02 Aug 2026 05:00:53 +0000
Date: Sun, 02 Aug 2026 13:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 379/700]
 drivers/mmc/host/mstar-fcie.c:712:1: warning: label 'done' defined but not
 used
Message-ID: <202608021247.V2aqqf9C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 5a5e205cbe23f8ad3504218f0caee02f7a400828 [379/700] mmc: mstar fcie: MStar FCIE SD card host driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608021247.V2aqqf9C-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021247.V2aqqf9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608021247.V2aqqf9C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/mstar-fcie.c: In function 'mstar_fcie_request':
>> drivers/mmc/host/mstar-fcie.c:712:1: warning: label 'done' defined but not used [-Wunused-label]
     712 | done:
         | ^~~~
>> drivers/mmc/host/mstar-fcie.c:556:30: warning: unused variable 'cardbusy' [-Wunused-variable]
     556 |         unsigned int status, cardbusy;
         |                              ^~~~~~~~


vim +/done +712 drivers/mmc/host/mstar-fcie.c

   530	
   531	static void msc313_fcie_build_adma(struct msc313_fcie *fcie, struct scatterlist *data_sg,
   532			int count, int blksz, u32 *tfxlen)
   533	{
   534		struct scatterlist *sg;
   535		int i;
   536		for_each_sg(data_sg, sg, count, i) {
   537			struct msc313_sdio_adma_desc *desc = &fcie->descs[i];
   538			desc->dmaaddr = sg_dma_address(sg);
   539			desc->dmalen = sg_dma_len(sg);
   540			desc->ctrl = FIELD_PREP(ADMA_DESC_CTRL_END, i + 1 == count) |
   541				     FIELD_PREP(ADMA_DESC_MIU_SEL, 0) |
   542				     FIELD_PREP(ADMA_DESC_JOB_CNT, desc->dmalen / blksz);
   543			dev_dbg(fcie->dev, "desc %d:%d: ctrl: 0x%08x, dmaaddr: 0x%08x, dmalen: 0x%08x",
   544					i, count, desc->ctrl, desc->dmaaddr, desc->dmalen);
   545			*tfxlen += desc->dmalen;
   546		}
   547	}
   548	static void mstar_fcie_request(struct mmc_host *mmc, struct mmc_request *mrq)
   549	{
   550		struct msc313_fcie *fcie = mmc_priv(mmc);
   551		int rspsz, i, count, dir_data, blks, ret;
   552		struct mmc_command *cmd = mrq->cmd;
   553		struct mmc_command *sbc = mrq->sbc;
   554		struct mmc_data *data = mrq->data;
   555		bool dataread, sbcdone, useadma, busydet;
 > 556		unsigned int status, cardbusy;
   557		u32 dmaaddr, dmalen, tfrlen;
   558	
   559		/* If there is just a command, send it and return */
   560		if (data == NULL) {
   561			if(mstar_fcie_request_prepcmd_and_tx(fcie, cmd)) {
   562				dev_err(fcie->dev, "failed to send command; cmd: %d arg: 0x%08x\n",
   563						cmd->opcode, cmd->arg);
   564				goto tfr_err;
   565			}
   566			mmc_request_done(mmc, mrq);
   567			return;
   568		}
   569	
   570		/* There is data, but read or write is not set.. */
   571		if (!(data->flags & (MMC_DATA_READ | MMC_DATA_WRITE))) {
   572			dev_err(fcie->dev, "don't know what to do with this data, flags 0x%08x\n", data->flags);
   573			goto tfr_err;
   574		}
   575	
   576		/* If we have a set-block-count command send it now */
   577		if (sbc) {
   578			if(mstar_fcie_request_prepcmd_and_tx(fcie, sbc)) {
   579				dev_err(fcie->dev, "failed to sbc; cmd: 0x%02x arg: 0x%08x\n",
   580						sbc->opcode, sbc->arg);
   581				goto tfr_err;
   582			}
   583			sbcdone = true;
   584		}
   585	
   586		/*
   587		 * If there is data to read the cmd goes with the first block
   588		 * of data coming in if there is no data or we're writing
   589		 * run the command on it's own.
   590		 *
   591		 * It's possible we don't actually need to do this for writes
   592		 * but I haven't got it to work any other way.
   593		 */
   594		dataread = data->flags & MMC_DATA_READ;
   595		if (!dataread) {
   596			if(mstar_fcie_request_prepcmd_and_tx(fcie, cmd)) {
   597				dev_err(fcie->dev, "failed to send command; cmd: 0x%02x arg: 0x%08x\n",
   598						cmd->opcode, cmd->arg);
   599				goto tfr_err;
   600			}
   601		}
   602	
   603		/* If we're doing a read setup the command for the first block */
   604		if (dataread)
   605			rspsz = mstar_fcie_request_setupcmd(fcie, mrq->cmd);
   606		else
   607			regmap_write(fcie->regmap, REG_SD_CTL, 0);
   608	
   609		dir_data = dataread ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
   610		count = dma_map_sg(fcie->dev, data->sg, data->sg_len, dir_data);
   611		if (count == 0)
   612			goto drv_err;
   613	
   614		/* if there is more than one sg use ADMA */
   615		useadma = count > 1;
   616		if (useadma) {
   617			//printk("using ADMA\n");
   618			msc313_fcie_build_adma(fcie, data->sg, count, data->blksz, &tfrlen);
   619			dmaaddr = dma_map_single(fcie->dev, &fcie->descs, sizeof(fcie->descs), DMA_TO_DEVICE);
   620			ret = dma_mapping_error(fcie->dev, dmaaddr);
   621			if (ret) {
   622				printk("dma map fail\n");
   623				data->error = ret;
   624				goto tfr_err;
   625			}
   626			dmalen = 0x10;
   627			blks = 1;
   628			regmap_field_write(fcie->adma_en, 1);
   629		}
   630		/* otherwise use direct dma */
   631		else {
   632			//printk("Using single dma\n");
   633			dmaaddr = sg_dma_address(data->sg);
   634			dmalen = sg_dma_len(data->sg);
   635			blks = dmalen / data->blksz;
   636			tfrlen = dmalen;
   637		}
   638	
   639		/* Setup this transfer */
   640		regmap_field_write(fcie->jobdir, dataread ? 0 : 1);
   641		regmap_field_write(fcie->dtrf_en, 1);
   642		regmap_field_write(fcie->blk_sz, data->blksz);
   643		regmap_write(fcie->regmap, REG_DMA_ADDR_H, dmaaddr >> 16);
   644		regmap_write(fcie->regmap, REG_DMA_ADDR_L, dmaaddr & 0xffff);
   645		regmap_write(fcie->regmap, REG_DMA_LEN_H, dmalen >> 16);
   646		regmap_write(fcie->regmap, REG_DMA_LEN_L, dmalen & 0xffff);
   647		regmap_field_write(fcie->blk_cnt, blks);
   648	
   649	#ifdef SUPERDEBUG
   650		printk("%d - 0x%08x %s 0x%08x\n", cmd->opcode, dmaaddr,
   651				dataread ? "<-" : "->", dmalen);
   652	#endif
   653	
   654		busydet = dataread && (cmd->flags & MMC_RSP_BUSY);
   655		ret = mstar_fcie_start_transfer_and_wait(fcie, dataread,
   656				true, busydet, data->timeout_ns, &status);
   657		if (ret) {
   658			data->error = ret;
   659			dev_err(fcie->dev, "data %s error; cmd: 0x%02x arg: 0x%08x, blk_sz: %d, blk_cnt %d .. %d:%d\n",
   660					dataread ? "read" : "write", cmd->opcode, cmd->arg, data->blksz, blks, i, count);
   661			goto tfr_err;
   662		}
   663		/*
   664		 * the first block will have also triggered sending the cmd
   665		 * if this was a read so capture the rsp etc for that here
   666		 * and clear the cmd flags for the next block
   667		 */
   668		if (dataread) {
   669			ret = mstar_fcie_request_capturecmdresult(fcie, mrq->cmd, status, rspsz);
   670			if (ret && ret != -EBUSY)
   671				goto tfr_err;
   672		}
   673	
   674		{
   675			unsigned int cardbusy;
   676			regmap_field_read_poll_timeout(fcie->d0, cardbusy, cardbusy, 0, 1000);
   677		}
   678	
   679		/* check for errors */
   680		if (status & SD_STS_DATRDCERR) {
   681			dev_err(fcie->dev, "data read CRC error\n");
   682			data->error = -EILSEQ;
   683		}
   684	
   685		if (status & SD_STS_DATWRCERR) {
   686			dev_err(fcie->dev, "data write CRC error\n");
   687			data->error = -EILSEQ;
   688	
   689		}
   690	
   691		data->bytes_xfered += tfrlen;
   692	
   693		/*
   694		 * If sbc wasn't sent then send the stop command here.
   695		 * The card doesn't respond to this if sbc was sent.
   696		 *
   697		 * We probably also need to do this if there was an error during the transfer.
   698		 */
   699		if (!sbcdone && data->stop) {
   700			struct mmc_command *stop = data->stop;
   701			int ret = mstar_fcie_request_prepcmd_and_tx(fcie, stop);
   702	
   703			if (ret)
   704				dev_err(fcie->dev, "data stop command timeout; cmd: 0x%02x arg: 0x%08x, flags: 0x%08x\n",
   705					stop->opcode, stop->arg, stop->flags);
   706		}
   707	
   708		if (useadma)
   709			dma_unmap_single(fcie->dev, dmaaddr, sizeof(fcie->descs), DMA_TO_DEVICE);
   710		dma_unmap_sg(fcie->dev, data->sg, data->sg_len, dir_data);
   711	
 > 712	done:
   713		mmc_request_done(mmc, mrq);
   714		return;
   715	
   716	drv_err:
   717		mrq->cmd->error = -EINVAL;
   718	tfr_err:
   719		if (mrq->stop)
   720			mstar_fcie_request_prepcmd_and_tx(fcie, mrq->stop);
   721		mmc_request_done(mmc, mrq);
   722	}
   723	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
