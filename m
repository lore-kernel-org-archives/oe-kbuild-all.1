Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6736364AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705824971; cv=none; b=krpxUrMu7Y5LzpzBrhux1PArgmRFz7F+w6Sk9T2XuCguSDHqxeoSi+YD5kHX3y0zARsstJd0nTmdGKB5+LmYv2QzsoxZGpTfmazpF2JW9x/zuc04HgXyVQ85/1J/tBjRQbo9zjf1SzZBkuwStd6ZV2w9nmcgSxmj0WFiBGK3NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705824971; c=relaxed/simple;
	bh=/K7Vvm7kE8Hfe/VujuuBZJqEjFo6DTj2QAAy+Dv7Jwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+UdjI08j3HeEl88MIDabx5wRGGN44bLMbcdAAMZrOWmafMYFlI+PHmKLsu+nc0EYvmBWlPLxPh9ZwugYtyr8fEsUoIgsw0PX3E7NPFQaJ6D4uIBsa2Y1Mbwqd5ZvJtymEA4KycMSB9NAFC3AOAyrmAGTgRE9nDk0cZZDaKGrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+3BmvGi; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+3BmvGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705824968; x=1737360968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/K7Vvm7kE8Hfe/VujuuBZJqEjFo6DTj2QAAy+Dv7Jwk=;
  b=O+3BmvGipzh7kj9R8OS9fnVbU2dxnSCnDeeq6lq+bvz3BqCglX1ABdta
   Mo5S6j5WODT87ot7FN5fkCItxTxIUgeG9FzNzyeI5QJ9c8MHFczUBrJhD
   /w1ACvErGmv3vHgGyZ3VaXbUuw0igmfcqA4F4dSJ8B76ELGJRtppEOGNZ
   hjjRyBpMVtU7LAn3dLVqHtyFFexQYubejyEvnK/ngQjtrYAfV89sWXWin
   cbz2tdV3jYqPEFyTOlBxOrqFr7bNvg1sSF8ww60JUH6KVcH0pWNlBGngq
   TnL02RBwUF1JXDTo/vVbtW/8OMfAaIusRxSih2ZoInSLhapNNMQtxlwu9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="467386265"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="467386265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 00:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="33756025"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2024 00:16:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRSzs-0005mI-1j;
	Sun, 21 Jan 2024 08:16:04 +0000
Date: Sun, 21 Jan 2024 16:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/21561]
 drivers/mmc/host/phytium-sdci.c:271:14: warning: variable 'read' set but not
 used
Message-ID: <202401211624.59a5VtaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/21561] mmc: add support for Phytium MMC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240121/202401211624.59a5VtaC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401211624.59a5VtaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211624.59a5VtaC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/phytium-sdci.c: In function 'phytium_sdci_start_data':
>> drivers/mmc/host/phytium-sdci.c:271:14: warning: variable 'read' set but not used [-Wunused-but-set-variable]
     271 |         bool read, res;
         |              ^~~~
   drivers/mmc/host/phytium-sdci.c: In function 'phytium_sdci_dma_irq':
>> drivers/mmc/host/phytium-sdci.c:1018:29: warning: variable 'cmd' set but not used [-Wunused-but-set-variable]
    1018 |         struct mmc_command *cmd;
         |                             ^~~
--
   drivers/mmc/host/phytium-mci.c: In function 'phytium_mci_start_data':
>> drivers/mmc/host/phytium-mci.c:661:14: warning: variable 'read' set but not used [-Wunused-but-set-variable]
     661 |         bool read;
         |              ^~~~


vim +/read +271 drivers/mmc/host/phytium-sdci.c

   266	
   267	static bool phytium_sdci_start_data(struct phytium_sdci_host *host,
   268					struct mmc_request *mrq,
   269					struct mmc_command *cmd, struct mmc_data *data)
   270	{
 > 271		bool read, res;
   272		u32 sg_dma_addrh, sg_dma_addrl;
   273		u32 sd_block_addrh, sd_block_addrl;
   274		u32 temp, timeout, sd_status;
   275		u32 block_cnt = 0;
   276		u32 sd_block_addr = cmd->arg;
   277		u32 private_cmd, resp_type, arg;
   278		u32 j, dma_len;
   279		unsigned long deadline_time;
   280		dma_addr_t dma_address;
   281		struct scatterlist *sg;
   282		int ret;
   283	
   284		WARN_ON(host->cmd);
   285		host->cmd = cmd;
   286	
   287		WARN_ON(host->data);
   288		host->data = data;
   289		read = data->flags & MMC_DATA_READ;
   290	
   291		for_each_sg(data->sg, sg, data->sg_count, j) {
   292			writel(0, host->base + SDCI_COMMAND);
   293	
   294			dma_address = sg_dma_address(sg);
   295			sg_dma_addrh = (u32) (dma_address >> 32);
   296			sg_dma_addrl = (u32) dma_address;
   297	
   298			dma_len = sg_dma_len(sg);
   299			block_cnt = (dma_len / SD_BLOCK_SIZE);
   300	
   301			sd_block_addrh = 0;
   302			sd_block_addrl = sd_block_addr;
   303	
   304			sdr_set_bits(host->base + SDCI_SOFTWARE, SDCI_SOFTWARE_BDRST);
   305			sdr_clr_bits(host->base + SDCI_SOFTWARE, SDCI_SOFTWARE_BDRST);
   306			writel(block_cnt, host->base + SDCI_BLK_CNT);
   307	
   308			if ((mrq->data->flags & MMC_DATA_READ) == MMC_DATA_READ) {
   309				writel(sg_dma_addrl, host->base + SDCI_BD_RX);
   310				writel(sg_dma_addrh, host->base + SDCI_BD_RX);
   311				writel(sd_block_addrl, host->base + SDCI_BD_RX);
   312				writel(sd_block_addrh, host->base + SDCI_BD_RX);
   313				timeout = 100 * block_cnt;
   314			} else {
   315				timeout = 250 * block_cnt;
   316				ret = phytium_sdci_cmd13_process(host, mrq, data,
   317								timeout, 1);
   318				if (ret != SDCI_CMD13_OK)
   319					return false;
   320	
   321				writel(sg_dma_addrl, host->base + SDCI_BD_TX);
   322				writel(sg_dma_addrh, host->base + SDCI_BD_TX);
   323				writel(sd_block_addrl, host->base + SDCI_BD_TX);
   324				writel(sd_block_addrh, host->base + SDCI_BD_TX);
   325			}
   326	
   327			deadline_time = jiffies + msecs_to_jiffies(timeout);
   328	
   329			temp = readl(host->base + SDCI_BD_ISR);
   330			if ((mrq->data->flags & MMC_DATA_READ) == MMC_DATA_READ) {
   331				while ((temp & SDCI_BD_ISR_TRS_R) !=
   332					SDCI_BD_ISR_TRS_R) {
   333					sd_status = readl(host->base + SDCI_STATUS);
   334					if (sd_status & SDCI_STATUS_CDSL) {
   335						phytsd_unexpected_error_handler(host,
   336								mrq, data,
   337								ERR_CARD_ABSENT);
   338						if (temp & SDCI_BD_ISR_DAIS)
   339							writel(1, host->base +
   340							       SDCI_BD_ISR);
   341						return false;
   342					}
   343	
   344					temp = readl(host->base + SDCI_BD_ISR);
   345					if (time_after(jiffies, deadline_time)) {
   346						phytsd_unexpected_error_handler(host,
   347									mrq, data,
   348									ERR_TIMEOUT);
   349						dev_err(host->dev, "Read Data timeout");
   350						dev_err(host->dev, "jiffies:0x%lx\n",
   351							jiffies);
   352						dev_err(host->dev, "dt_jiffies:0x%lx\n",
   353							jiffies - deadline_time);
   354						dev_err(host->dev, "BD_isr_reg:0x%x\n",
   355							temp);
   356						dev_err(host->dev,
   357							"cmd:%d, REG_D0:0x%x\n",
   358							cmd->opcode, readl(host->base +
   359							SDCI_STATUS));
   360	
   361						return false;
   362					}
   363				}
   364			} else {
   365				while ((temp & SDCI_BD_ISR_TRS_W) !=
   366				    SDCI_BD_ISR_TRS_W) {
   367					sd_status = readl(host->base + SDCI_STATUS);
   368					if (sd_status & SDCI_STATUS_CDSL) {
   369						phytsd_unexpected_error_handler(host,
   370								mrq, data,
   371								ERR_CARD_ABSENT);
   372						dev_err(host->dev,
   373							"[%s][%d]: Card absent !\n",
   374							__func__, __LINE__);
   375						dev_err(host->dev, "cmd(%d)\n",
   376							mrq->cmd->opcode);
   377						return false;
   378					}
   379	
   380					temp = readl(host->base + SDCI_BD_ISR);
   381					if (time_after(jiffies, deadline_time)) {
   382						phytsd_unexpected_error_handler(host,
   383									mrq, data,
   384									ERR_TIMEOUT);
   385						dev_err(host->dev,
   386							"Write Date timeout\n");
   387						dev_err(host->dev,
   388							"jiffies:0x%lx\n", jiffies);
   389						dev_err(host->dev, "dt_jiffies:0x%lx\n",
   390							jiffies - deadline_time);
   391						dev_err(host->dev, "BD_isr_reg:0x%x\n",
   392							temp);
   393						return false;
   394					}
   395				}
   396			}
   397			writel(1, host->base + SDCI_BD_ISR);
   398			writel(1, host->base + SDCI_NORMAL_ISR);
   399			sd_block_addr = sd_block_addr + block_cnt;
   400	
   401			if (j < (data->sg_count - 1) && 1 < block_cnt) {
   402				private_cmd = MMC_STOP_TRANSMISSION;
   403				resp_type = 0x2;
   404				arg = 0;
   405				res = phytium_sdci_private_send_cmd(host, private_cmd,
   406								    resp_type, arg);
   407				if (!res) {
   408					sd_status = readl(host->base + SDCI_STATUS);
   409					if (sd_status & SDCI_STATUS_CDSL) {
   410						phytsd_unexpected_error_handler(host,
   411								mrq, data,
   412								ERR_CARD_ABSENT);
   413						writel(1, host->base + SDCI_BD_ISR);
   414						dev_err(host->dev,
   415							"[%s][%d]:Card absent !\n",
   416							__func__, __LINE__);
   417						dev_err(host->dev, "private_cmd(%d)\n",
   418							private_cmd);
   419					} else {
   420						phytsd_unexpected_error_handler(host,
   421								mrq, data,
   422								ERR_CMD_RESPONED);
   423						dev_err(host->dev,
   424							"[%s][%d] cmd(%d) errored\n",
   425							__func__, __LINE__,
   426							mrq->cmd->opcode);
   427						phytium_sd_error(host);
   428					}
   429					writel(1, host->base + SDCI_NORMAL_ISR);
   430					return false;
   431				}
   432				writel(1, host->base + SDCI_NORMAL_ISR);
   433			}
   434		}
   435	
   436		host->is_multi_rw_only_one_blkcnt = false;
   437	
   438		if ((cmd->opcode == MMC_READ_MULTIPLE_BLOCK && block_cnt == 1) ||
   439		    (cmd->opcode == MMC_WRITE_MULTIPLE_BLOCK && block_cnt == 1))
   440			host->is_multi_rw_only_one_blkcnt = true;
   441	
   442		phytium_sdci_cmd_done(host, SDCI_NORMAL_ISR_CC, mrq, cmd);
   443		if ((mrq->data->flags & MMC_DATA_READ) == MMC_DATA_READ)
   444			phytium_sdci_data_xfer_done(host, SDCI_BD_ISR_TRS_R,
   445						    mrq, data);
   446		else
   447			phytium_sdci_data_xfer_done(host, SDCI_BD_ISR_TRS_W,
   448						    mrq, data);
   449	
   450		return true;
   451	}
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
