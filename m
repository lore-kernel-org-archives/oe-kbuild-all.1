Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856803822BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161255; cv=none; b=YfCmsvlKcK58uuM6F4yJK8GFI6pCgx3oWj3uJMcd3AvwJ6RPx6PpVLQI0C7yO0nRE27HM3WwdmnEdLArRRn/HzXqR/i+kAECia6ShuC+svCtOzxhNVWibmjaWo2fZ89RGnek0dXzJcX7h9Km+74ibi2vFOXMksYMZkq20eohn6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161255; c=relaxed/simple;
	bh=GTj3SzpKSmbEp0aAixfrqq+eLJil7VvAviRGKXRKBWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DfnZVxC/p2sOYiVGXjwfox7sYATf0bypkfCq7csXAaa7y4vPleKyiv5KlPg5cFEOFrUVtetJlFpfgSo1/B10OVw+bVLvhpDJe09AevP67edrGalNu8oOjYARkODUKGdTpc03kQBRMrVSWiKYeG8kGo21Rj3ZKw2FDCGMzCpzGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juRhvv6H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juRhvv6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792161254; x=1823697254;
  h=date:from:to:cc:subject:message-id;
  bh=GTj3SzpKSmbEp0aAixfrqq+eLJil7VvAviRGKXRKBWw=;
  b=juRhvv6H/EqLJtYDifU0MUFAjXSn500GENf19HxcgBSCt4sofjUKViHa
   JbX+o+OkOz8M7a9N1BIm4P4toV2g4ONqNwOc45SbI2FA90Z5I9fmrBVBf
   NviC6J/jSuxs/rT5l1Qojv5C1a7T8GidqCKVedhNuCczUhqjuOY2qFEeX
   iME62ncLUf0aRYbFu4+nhYAklcCCB6gKC9XlcKY4PrE7FRVvgHZLo/Txj
   WpZ4cA1WoxLeTh0rqoUxp7iqq6k7FGvAeXlT0Ravb/OO7w13ZwJodo475
   6jd20CBUlZHrueMCexz1qvv4/qmcvscgmYQ1UHxrVJ6itK+VcgBJDrJZd
   w==;
X-CSE-ConnectionGUID: VUZnVIh+RZa0PRnjS9yK9g==
X-CSE-MsgGUID: WFQPpgM5S26dCYbrBS8u7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="1045299"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1045299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:34:14 -0700
X-CSE-ConnectionGUID: 4RRwtJnVRa6Kqxcv9b69Bw==
X-CSE-MsgGUID: IlIpylLhQeC8VsHo8ucC0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2377575"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 07:34:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHj0b-00000000CGZ-3q8d;
	Fri, 16 Oct 2026 14:34:09 +0000
Date: Fri, 16 Oct 2026 16:33:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1444:26: sparse: sparse: invalid
 assignment: |=
Message-ID: <202610161631.vB73XkUq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b9d5e9a3a59c79fd6ec703c9780ab38ad1c0505d
commit: a70ea9296419161d25ce586a8e91f0a5f5d48742 [1/1] scsi: hisi_sas: Enable force phy when SATA disk directly connected
config: arm64-randconfig-r2307-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161631.vB73XkUq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161631.vB73XkUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161631.vB73XkUq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1444:26: sparse: sparse: invalid assignment: |=
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1444:26: sparse:    left side has type restricted __le32
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:1444:26: sparse:    right side has type unsigned int

vim +1444 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  1421	
  1422	static void prep_ata_v3_hw(struct hisi_hba *hisi_hba,
  1423				  struct hisi_sas_slot *slot)
  1424	{
  1425		struct sas_task *task = slot->task;
  1426		struct domain_device *device = task->dev;
  1427		struct domain_device *parent_dev = device->parent;
  1428		struct hisi_sas_device *sas_dev = device->lldd_dev;
  1429		struct hisi_sas_cmd_hdr *hdr = slot->cmd_hdr;
  1430		struct asd_sas_port *sas_port = device->port;
  1431		struct hisi_sas_port *port = to_hisi_sas_port(sas_port);
  1432		int phy_id;
  1433		u8 *buf_cmd;
  1434		int has_data = 0, hdr_tag = 0;
  1435		u32 dw1 = 0, dw2 = 0;
  1436	
  1437		hdr->dw0 = cpu_to_le32(port->id << CMD_HDR_PORT_OFF);
  1438		if (parent_dev && dev_is_expander(parent_dev->dev_type)) {
  1439			hdr->dw0 |= cpu_to_le32(3 << CMD_HDR_CMD_OFF);
  1440		} else {
  1441			phy_id = device->phy->identify.phy_identifier;
  1442			hdr->dw0 |= cpu_to_le32((1U << phy_id)
  1443					<< CMD_HDR_PHY_ID_OFF);
> 1444			hdr->dw0 |= CMD_HDR_FORCE_PHY_MSK;
  1445			hdr->dw0 |= cpu_to_le32(4U << CMD_HDR_CMD_OFF);
  1446		}
  1447	
  1448		switch (task->data_dir) {
  1449		case DMA_TO_DEVICE:
  1450			has_data = 1;
  1451			dw1 |= DIR_TO_DEVICE << CMD_HDR_DIR_OFF;
  1452			break;
  1453		case DMA_FROM_DEVICE:
  1454			has_data = 1;
  1455			dw1 |= DIR_TO_INI << CMD_HDR_DIR_OFF;
  1456			break;
  1457		default:
  1458			dw1 &= ~CMD_HDR_DIR_MSK;
  1459		}
  1460	
  1461		if ((task->ata_task.fis.command == ATA_CMD_DEV_RESET) &&
  1462				(task->ata_task.fis.control & ATA_SRST))
  1463			dw1 |= 1 << CMD_HDR_RESET_OFF;
  1464	
  1465		dw1 |= (hisi_sas_get_ata_protocol(
  1466			&task->ata_task.fis, task->data_dir))
  1467			<< CMD_HDR_FRAME_TYPE_OFF;
  1468		dw1 |= sas_dev->device_id << CMD_HDR_DEV_ID_OFF;
  1469	
  1470		if (FIS_CMD_IS_UNCONSTRAINED(task->ata_task.fis))
  1471			dw1 |= 1 << CMD_HDR_UNCON_CMD_OFF;
  1472	
  1473		hdr->dw1 = cpu_to_le32(dw1);
  1474	
  1475		/* dw2 */
  1476		if (task->ata_task.use_ncq) {
  1477			struct ata_queued_cmd *qc = task->uldd_task;
  1478	
  1479			hdr_tag = qc->tag;
  1480			task->ata_task.fis.sector_count |= (u8) (hdr_tag << 3);
  1481			dw2 |= hdr_tag << CMD_HDR_NCQ_TAG_OFF;
  1482		}
  1483	
  1484		dw2 |= (HISI_SAS_MAX_STP_RESP_SZ / 4) << CMD_HDR_CFL_OFF |
  1485				2 << CMD_HDR_SG_MOD_OFF;
  1486		hdr->dw2 = cpu_to_le32(dw2);
  1487	
  1488		/* dw3 */
  1489		hdr->transfer_tags = cpu_to_le32(slot->idx);
  1490	
  1491		if (has_data)
  1492			prep_prd_sge_v3_hw(hisi_hba, slot, hdr, task->scatter,
  1493						slot->n_elem);
  1494	
  1495		hdr->data_transfer_len = cpu_to_le32(task->total_xfer_len);
  1496		hdr->cmd_table_addr = cpu_to_le64(hisi_sas_cmd_hdr_addr_dma(slot));
  1497		hdr->sts_buffer_addr = cpu_to_le64(hisi_sas_status_buf_addr_dma(slot));
  1498	
  1499		buf_cmd = hisi_sas_cmd_hdr_addr_mem(slot);
  1500	
  1501		if (likely(!task->ata_task.device_control_reg_update))
  1502			task->ata_task.fis.flags |= 0x80; /* C=1: update ATA cmd reg */
  1503		/* fill in command FIS */
  1504		memcpy(buf_cmd, &task->ata_task.fis, sizeof(struct host_to_dev_fis));
  1505	}
  1506	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
