Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8396BB46
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386981; cv=none; b=UcsJzSIY1mHryYbPVAqOey0H/oQRM2MiQ95FL0LjiWvoyMI9N7r2o4MZrbNinc1SzkZaZxXfm4Vkvxqol8R6uJ9y5IcKNFZgnTCzvScGVppGIkYkzlITAbb36UK9FT0aaFVcxlX8G7iGnxuQl5Z3vfulZ+fwjfJuf1bkv/8kKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386981; c=relaxed/simple;
	bh=UweKUrthHy1UQFunl1kRF9ITFlq41x8f9Kv5agoM18U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFKaF+5KPhoUFopd67va6/4r2rj6OHOadpJc/rtk5BEARr2eKAk3xqmT9TCHI3+/lY6mz4/Wc/dmYMezyev/COATY4T0IZ2lGNXHaxt4Pf08pC4nWTFUAGTTs90TCig/ev/Dm5CcQ4SUQJJ/jHOdOly1u3R0He++oKyzvmtv7Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8gKggTi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8gKggTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707386980; x=1738922980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UweKUrthHy1UQFunl1kRF9ITFlq41x8f9Kv5agoM18U=;
  b=A8gKggTiZRswUJNpCcdIacAIrpLKrKBIa+alUyCFf//AVlL5fv6nn8wR
   L4tE+jO4OBr7T3q0S4n1Jm/mm907ppZJtn5aqAYeI6Zzu85GlyDlVWrxJ
   d3NHHMwFz3/l7YbUamYzm5DH5N4rsCQB7m2WsqtwmEChlKuZIANsHHa/v
   bAyXPnYUNXBJH20jFRqK4yOuFcbAjtdGwJAr7UVyD+u4mAJGpNaDIt1Mn
   TTJ0Un0G3dLUwTnh4KDHgSnLR/dt1f6FtVyRpnhBzo/nAdR8uD//AksKT
   2u2tfkeQg1Tf+aNkLpDNWTDwVyKAZv/pn8a2gC0i5Ig2hEiSeREh6ve5L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4970128"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="4970128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1934557"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2024 02:09:35 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY1LY-0003bs-3B;
	Thu, 08 Feb 2024 10:09:32 +0000
Date: Thu, 8 Feb 2024 18:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21349/21625]
 drivers/mmc/host/phytium-sdci.c:271:14: warning: variable 'read' set but not
 used
Message-ID: <202402081748.h6l4DZWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [21349/21625] mmc: add support for Phytium MMC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402081748.h6l4DZWn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081748.h6l4DZWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081748.h6l4DZWn-lkp@intel.com/

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
