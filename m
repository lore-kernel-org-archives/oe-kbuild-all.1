Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442626AF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937858; cv=none; b=ir8GSo1XthzH9a78ui2zKtOxvRhnTvkB+K31OzD6xzb5mHkzecN/3nk1x+6WXzxvMWoP5GkF2gRd4ekA5NNgyKxivdTreD4c4b4lrLPnyVI7wpg9ZAJ4YKObXneFllOoSx2D7bVH1VIq0r9WjALMJ7pCZY2URFBRfts6GtoeF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937858; c=relaxed/simple;
	bh=gLaaUFnrkaWL+4kmp0mv3iy6qse19XLFkWP3RCaJ1DI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPj1JP0X+Tr8anO0IHpiRi0oCzkwHBHt7rp2Zht0+71cQTsDGudGDmfAPNAHbxF/ypgTytPC4KoX5oFh1WS6eydAmK4rVNK6XfUAHx4MdvjuYlExyCkhsAXxXqjFHpo0jW0o2WTGlGhJFepD+XcBNUobuH5YYnqq3CUCe2PR8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/3Hynhf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/3Hynhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744937857; x=1776473857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLaaUFnrkaWL+4kmp0mv3iy6qse19XLFkWP3RCaJ1DI=;
  b=m/3HynhfAk56N9MKz8Uc0cMLYm+T6k5i2XpGbiyJoxbx/Apw6IOrNax2
   ROV9R9w1mweOmRM+maDLrt7UCl5rPziWqx31uNm/HkeDPXHxr2AJ+wDSZ
   XtH8IqKaOfua+6d7LW+jAjQqg76nXD6xPHe4l9cfd04ZrP7nJwfs7BWPt
   XOI2JMO1hMtahKoIK3iLDaBWVvrf8Hl/wq53vrKeTnQQXVxuTxDxdY94S
   ckl9uFnNPW0cVyZa09BrDEHxpu1FRRs2JyWXi5FH6cou7RqRDk8u+MJW8
   lHM6QScjzcgSK5CX0eTbmeXOT3J3M80y7XVQWM+FAWF05sQjYjubZHbZ/
   g==;
X-CSE-ConnectionGUID: uBSjpj4yTd2kaqaYsnhVQw==
X-CSE-MsgGUID: jffQf74aQMmbDt3pnHnCwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="64102281"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="64102281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 17:57:34 -0700
X-CSE-ConnectionGUID: Q0l42n+HSMG76TbcPUGpxA==
X-CSE-MsgGUID: ftcHoJG/SKCKpvfFJuNlnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="131514357"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 17:57:32 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5a2s-0002Dw-1x;
	Fri, 18 Apr 2025 00:57:30 +0000
Date: Fri, 18 Apr 2025 08:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Junhao He <hejunhao3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2135/2135]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1448:26: sparse: sparse: invalid
 assignment: |=
Message-ID: <202504180825.AdhYDR7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   020d455b1d7b83ce376f0c652850dd49f02f9e4c
commit: cd982c1a99959671f5ea416edf968fccfd300108 [2135/2135] scsi: hisi_sas: Enable force phy when SATA disk directly connected
config: loongarch-randconfig-r121-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180825.AdhYDR7q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180825.AdhYDR7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180825.AdhYDR7q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1448:26: sparse: sparse: invalid assignment: |=
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1448:26: sparse:    left side has type restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1448:26: sparse:    right side has type unsigned int

vim +1448 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  1425	
  1426	static void prep_ata_v3_hw(struct hisi_hba *hisi_hba,
  1427				  struct hisi_sas_slot *slot)
  1428	{
  1429		struct sas_task *task = slot->task;
  1430		struct domain_device *device = task->dev;
  1431		struct domain_device *parent_dev = device->parent;
  1432		struct hisi_sas_device *sas_dev = device->lldd_dev;
  1433		struct hisi_sas_cmd_hdr *hdr = slot->cmd_hdr;
  1434		struct asd_sas_port *sas_port = device->port;
  1435		struct hisi_sas_port *port = to_hisi_sas_port(sas_port);
  1436		u8 *buf_cmd;
  1437		int has_data = 0, hdr_tag = 0;
  1438		u32 dw1 = 0, dw2 = 0;
  1439	
  1440		hdr->dw0 = cpu_to_le32(port->id << CMD_HDR_PORT_OFF);
  1441		if (parent_dev && dev_is_expander(parent_dev->dev_type)) {
  1442			hdr->dw0 |= cpu_to_le32(3 << CMD_HDR_CMD_OFF);
  1443		} else {
  1444			int phy_id = device->phy->identify.phy_identifier;
  1445	
  1446			hdr->dw0 |= cpu_to_le32((1U << phy_id)
  1447					<< CMD_HDR_PHY_ID_OFF);
> 1448			hdr->dw0 |= CMD_HDR_FORCE_PHY_MSK;
  1449			hdr->dw0 |= cpu_to_le32(4U << CMD_HDR_CMD_OFF);
  1450		}
  1451	
  1452		switch (task->data_dir) {
  1453		case DMA_TO_DEVICE:
  1454			has_data = 1;
  1455			dw1 |= DIR_TO_DEVICE << CMD_HDR_DIR_OFF;
  1456			break;
  1457		case DMA_FROM_DEVICE:
  1458			has_data = 1;
  1459			dw1 |= DIR_TO_INI << CMD_HDR_DIR_OFF;
  1460			break;
  1461		default:
  1462			dw1 &= ~CMD_HDR_DIR_MSK;
  1463		}
  1464	
  1465		if ((task->ata_task.fis.command == ATA_CMD_DEV_RESET) &&
  1466				(task->ata_task.fis.control & ATA_SRST))
  1467			dw1 |= 1 << CMD_HDR_RESET_OFF;
  1468	
  1469		dw1 |= (hisi_sas_get_ata_protocol(
  1470			&task->ata_task.fis, task->data_dir))
  1471			<< CMD_HDR_FRAME_TYPE_OFF;
  1472		dw1 |= sas_dev->device_id << CMD_HDR_DEV_ID_OFF;
  1473	
  1474		if (FIS_CMD_IS_UNCONSTRAINED(task->ata_task.fis))
  1475			dw1 |= 1 << CMD_HDR_UNCON_CMD_OFF;
  1476	
  1477		hdr->dw1 = cpu_to_le32(dw1);
  1478	
  1479		/* dw2 */
  1480		if (task->ata_task.use_ncq) {
  1481			struct ata_queued_cmd *qc = task->uldd_task;
  1482	
  1483			hdr_tag = qc->tag;
  1484			task->ata_task.fis.sector_count |= (u8) (hdr_tag << 3);
  1485			dw2 |= hdr_tag << CMD_HDR_NCQ_TAG_OFF;
  1486		}
  1487	
  1488		dw2 |= (HISI_SAS_MAX_STP_RESP_SZ / 4) << CMD_HDR_CFL_OFF |
  1489				2 << CMD_HDR_SG_MOD_OFF;
  1490		hdr->dw2 = cpu_to_le32(dw2);
  1491	
  1492		/* dw3 */
  1493		hdr->transfer_tags = cpu_to_le32(slot->idx);
  1494	
  1495		if (has_data)
  1496			prep_prd_sge_v3_hw(hisi_hba, slot, hdr, task->scatter,
  1497						slot->n_elem);
  1498	
  1499		hdr->data_transfer_len = cpu_to_le32(task->total_xfer_len);
  1500		hdr->cmd_table_addr = cpu_to_le64(hisi_sas_cmd_hdr_addr_dma(slot));
  1501		hdr->sts_buffer_addr = cpu_to_le64(hisi_sas_status_buf_addr_dma(slot));
  1502	
  1503		buf_cmd = hisi_sas_cmd_hdr_addr_mem(slot);
  1504	
  1505		if (likely(!task->ata_task.device_control_reg_update))
  1506			task->ata_task.fis.flags |= 0x80; /* C=1: update ATA cmd reg */
  1507		/* fill in command FIS */
  1508		memcpy(buf_cmd, &task->ata_task.fis, sizeof(struct host_to_dev_fis));
  1509	}
  1510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
