Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6C23CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 03:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692069463; x=1723605463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ochVKoDKm2Uo7IVlD6oX1HgWUn63LaDO6aCSCpFrf+s=;
  b=LnG9FX47AO3ua+/n3b07Xr3VzA62RLPpDr622K+jqgl1aISb6uUMRjfn
   KIblq0tdCtMFi4Be1BnjvmPned/iZJ6X70j3VmcH0RlncPrEls5PiTSUA
   Z1nuGoZhGXYVUQXoQZs1/FzS4vZ6cpWwoI9PVqY8QjgF+38+tPL+Gw1Zm
   3nq/jJVQOp87Bext1u25co8pL16Jj7km2feoqW9zaaYLX3iOh9MyOuPnq
   xbVY0fTu54isMfDi2DxnR8C3J7ZMZAWfS0SSPVbCa8qe9hJI6HRL6v83d
   sAIPt/OAdmuRTDl7xt7YQKC1FkA8D3pzpDORyN/M35IJUfoExTN53OXM0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="357157145"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="357157145"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 20:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768684793"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="768684793"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2023 20:17:41 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVkYv-0000c3-0Z;
	Tue, 15 Aug 2023 03:17:41 +0000
Date: Tue, 15 Aug 2023 11:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei Xu <xuwei5@hisilicon.com>
Subject: [hisilicon-hisi:next/drivers 1/3]
 drivers/soc/hisilicon/kunpeng_hccs.c:88:32: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202308151142.dH5Muhva-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/hisilicon/linux-hisi next/drivers
head:   b51022b416f5be113cd5345a2cab287d78e6b74c
commit: 886bdf9c883bcc9bfb0a0bc0ed27680e68c8b6c2 [1/3] soc: hisilicon: Support HCCS driver on Kunpeng SoC
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230815/202308151142.dH5Muhva-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151142.dH5Muhva-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151142.dH5Muhva-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/hisilicon/kunpeng_hccs.c:88:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pcc_comm_addr @@
   drivers/soc/hisilicon/kunpeng_hccs.c:88:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/hisilicon/kunpeng_hccs.c:88:32: sparse:     got void *pcc_comm_addr
>> drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned short * @@
   drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse:     got unsigned short *
>> drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned short * @@
   drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/hisilicon/kunpeng_hccs.c:156:15: sparse:     got unsigned short *
>> drivers/soc/hisilicon/kunpeng_hccs.c:183:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got struct acpi_pcct_shared_memory *comm_base @@
   drivers/soc/hisilicon/kunpeng_hccs.c:183:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/soc/hisilicon/kunpeng_hccs.c:183:21: sparse:     got struct acpi_pcct_shared_memory *comm_base
>> drivers/soc/hisilicon/kunpeng_hccs.c:189:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *comm_space @@
   drivers/soc/hisilicon/kunpeng_hccs.c:189:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/soc/hisilicon/kunpeng_hccs.c:189:21: sparse:     got void *comm_space
>> drivers/soc/hisilicon/kunpeng_hccs.c:205:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *comm_space @@
   drivers/soc/hisilicon/kunpeng_hccs.c:205:37: sparse:     expected void const volatile [noderef] __iomem *
   drivers/soc/hisilicon/kunpeng_hccs.c:205:37: sparse:     got void *comm_space

vim +88 drivers/soc/hisilicon/kunpeng_hccs.c

    82	
    83	static void hccs_unregister_pcc_channel(struct hccs_dev *hdev)
    84	{
    85		struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
    86	
    87		if (cl_info->pcc_comm_addr)
  > 88			iounmap(cl_info->pcc_comm_addr);
    89		pcc_mbox_free_channel(hdev->cl_info.pcc_chan);
    90	}
    91	
    92	static int hccs_register_pcc_channel(struct hccs_dev *hdev)
    93	{
    94		struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
    95		struct mbox_client *cl = &cl_info->client;
    96		struct pcc_mbox_chan *pcc_chan;
    97		struct device *dev = hdev->dev;
    98		int rc;
    99	
   100		cl->dev = dev;
   101		cl->tx_block = false;
   102		cl->knows_txdone = true;
   103		cl->tx_done = hccs_chan_tx_done;
   104		pcc_chan = pcc_mbox_request_channel(cl, hdev->chan_id);
   105		if (IS_ERR(pcc_chan)) {
   106			dev_err(dev, "PPC channel request failed.\n");
   107			rc = -ENODEV;
   108			goto out;
   109		}
   110		cl_info->pcc_chan = pcc_chan;
   111		cl_info->mbox_chan = pcc_chan->mchan;
   112	
   113		/*
   114		 * pcc_chan->latency is just a nominal value. In reality the remote
   115		 * processor could be much slower to reply. So add an arbitrary amount
   116		 * of wait on top of nominal.
   117		 */
   118		cl_info->deadline_us =
   119				HCCS_PCC_CMD_WAIT_RETRIES_NUM * pcc_chan->latency;
   120		if (cl_info->mbox_chan->mbox->txdone_irq) {
   121			dev_err(dev, "PCC IRQ in PCCT is enabled.\n");
   122			rc = -EINVAL;
   123			goto err_mbx_channel_free;
   124		}
   125	
   126		if (pcc_chan->shmem_base_addr) {
   127			cl_info->pcc_comm_addr = (void __force *)ioremap(
   128				pcc_chan->shmem_base_addr, pcc_chan->shmem_size);
   129			if (!cl_info->pcc_comm_addr) {
   130				dev_err(dev, "Failed to ioremap PCC communication region for channel-%d.\n",
   131					hdev->chan_id);
   132				rc = -ENOMEM;
   133				goto err_mbx_channel_free;
   134			}
   135		}
   136	
   137		return 0;
   138	
   139	err_mbx_channel_free:
   140		pcc_mbox_free_channel(cl_info->pcc_chan);
   141	out:
   142		return rc;
   143	}
   144	
   145	static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
   146	{
   147		struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
   148		struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
   149		u16 status;
   150		int ret;
   151	
   152		/*
   153		 * Poll PCC status register every 3us(delay_us) for maximum of
   154		 * deadline_us(timeout_us) until PCC command complete bit is set(cond)
   155		 */
 > 156		ret = readw_poll_timeout(&comm_base->status, status,
   157					 status & HCCS_PCC_STATUS_CMD_COMPLETE,
   158					 HCCS_POLL_STATUS_TIME_INTERVAL_US,
   159					 cl_info->deadline_us);
   160		if (unlikely(ret))
   161			dev_err(hdev->dev, "poll PCC status failed, ret = %d.\n", ret);
   162	
   163		return ret;
   164	}
   165	
   166	static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
   167				     struct hccs_desc *desc)
   168	{
   169		struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
   170		struct acpi_pcct_shared_memory *comm_base = cl_info->pcc_comm_addr;
   171		void *comm_space = (void *)(comm_base + 1);
   172		struct hccs_fw_inner_head *fw_inner_head;
   173		struct acpi_pcct_shared_memory tmp = {0};
   174		u16 comm_space_size;
   175		int ret;
   176	
   177		/* Write signature for this subspace */
   178		tmp.signature = HCCS_PCC_SIGNATURE_MASK | hdev->chan_id;
   179		/* Write to the shared command region */
   180		tmp.command = cmd;
   181		/* Clear cmd complete bit */
   182		tmp.status = 0;
 > 183		memcpy_toio(comm_base, (void *)&tmp,
   184				sizeof(struct acpi_pcct_shared_memory));
   185	
   186		/* Copy the message to the PCC comm space */
   187		comm_space_size = HCCS_PCC_SHARE_MEM_BYTES -
   188					sizeof(struct acpi_pcct_shared_memory);
 > 189		memcpy_toio(comm_space, (void *)desc, comm_space_size);
   190	
   191		/* Ring doorbell */
   192		ret = mbox_send_message(cl_info->mbox_chan, &cmd);
   193		if (ret < 0) {
   194			dev_err(hdev->dev, "Send PCC mbox message failed, ret = %d.\n",
   195				ret);
   196			goto end;
   197		}
   198	
   199		/* Wait for completion */
   200		ret = hccs_check_chan_cmd_complete(hdev);
   201		if (ret)
   202			goto end;
   203	
   204		/* Copy response data */
 > 205		memcpy_fromio((void *)desc, comm_space, comm_space_size);
   206		fw_inner_head = &desc->rsp.fw_inner_head;
   207		if (fw_inner_head->retStatus) {
   208			dev_err(hdev->dev, "Execute PCC command failed, error code = %u.\n",
   209				fw_inner_head->retStatus);
   210			ret = -EIO;
   211		}
   212	
   213	end:
   214		mbox_client_txdone(cl_info->mbox_chan, ret);
   215		return ret;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
