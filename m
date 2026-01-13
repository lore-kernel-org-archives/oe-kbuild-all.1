Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF69B2773E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313716; cv=none; b=qgkXwxN6ATU07401y0ti1Cwsecv5RFAyhxN8XvLPKNsOGedtASzxSAp6QNZU98vikb6snFhmtPzPCi1hV2AVLvg4qgbqcSht6CqOEj4JRcufQK5v+ZssoGe8Zv24en7APMgHND05FZrTPUUH0NXqZvRNlVTV/RQm4io+ptMkCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313716; c=relaxed/simple;
	bh=ZP0saPP1yT0gGFTBn1FNOJ8wSWXrzdYP4crG50lV078=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IMnNVzoPx0NV9fBnjqtgBGAKR1lqCLa1iFVp6wy8xnDFikUvJ5fgozocneNgYEp2D/DCU5/rAyvXVIHU657JGUwmRX1yFfuiB66csaNbD6S7svxhhibDNsHjexHAtehE8RhERlbt88dqUsQ1sI7rsZUZqbhWUodqa+asbWHVPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxPxsD52; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxPxsD52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313715; x=1799849715;
  h=date:from:to:cc:subject:message-id;
  bh=ZP0saPP1yT0gGFTBn1FNOJ8wSWXrzdYP4crG50lV078=;
  b=VxPxsD52g/laQug0ZpDL1UuHZZSSultEn6k+cqj/JYlagEYimUzCsV7R
   vso3m5mERAXJuBoUfFL8qbeXiwqBxt3CyVh2hMYma2WlmzXGywAonSM5n
   pvjTEivz5zh3cPpTw68F5sxcLoZvFHHtPsc0WY9Um6IXJuhaVGI+VXVAa
   No7GEgLBREh+SClztVr7V1CQ2pwOxhsFEL3QaJheIY8EdNHt/wJ18rMye
   FjLrFlpazjojzgRtDYcH1u3toajVpV/ksGk1qNS6n2T1Awh5NFhWq6kuW
   Y0bni5ZRa14VOAqHWsq2scXBzZLlyGIUMoI049FZMwifTUWEH45Y8WCwu
   A==;
X-CSE-ConnectionGUID: 4O7CxukCTOy9QqxyOqThVQ==
X-CSE-MsgGUID: o98MN5MQQgSFp9V5DhhRKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69651684"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69651684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:15:13 -0800
X-CSE-ConnectionGUID: wIGFr5a1T46wYQWP/V+ooA==
X-CSE-MsgGUID: ruTysV7bS0m7OAPdru352w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209231980"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 06:15:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffAr-00000000Eto-1Uoa;
	Tue, 13 Jan 2026 14:15:09 +0000
Date: Tue, 13 Jan 2026 22:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260113 7/16]
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c:1002:32: error: invalid application of
 'sizeof' to incomplete type 'struct ssp_command_iu'
Message-ID: <202601132207.vbf56Uh9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260113
head:   52754522a0ac00706210372e66bc73f60fa759d2
commit: 2f3d1d884e953f07b26e97dced8ba1b7adba61ad [7/16] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601132207.vbf56Uh9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132207.vbf56Uh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132207.vbf56Uh9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/hisi_sas/hisi_sas_main.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:47: error: field 'task' has incomplete type
     617 |                         struct ssp_command_iu task;
         |                                               ^~~~
--
   In file included from drivers/scsi/hisi_sas/hisi_sas_v1_hw.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:47: error: field 'task' has incomplete type
     617 |                         struct ssp_command_iu task;
         |                                               ^~~~
   drivers/scsi/hisi_sas/hisi_sas_v1_hw.c: In function 'prep_ssp_v1_hw':
>> drivers/scsi/hisi_sas/hisi_sas_v1_hw.c:1002:32: error: invalid application of 'sizeof' to incomplete type 'struct ssp_command_iu'
    1002 |                 dw2 = ((sizeof(struct ssp_command_iu) +
         |                                ^~~~~~
--
   In file included from drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:7:
>> drivers/scsi/hisi_sas/hisi_sas.h:617:47: error: field 'task' has incomplete type
     617 |                         struct ssp_command_iu task;
         |                                               ^~~~
   drivers/scsi/hisi_sas/hisi_sas_v2_hw.c: In function 'prep_ssp_v2_hw':
>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:1779:25: error: invalid application of 'sizeof' to incomplete type 'struct ssp_command_iu'
    1779 |         dw2 = (((sizeof(struct ssp_command_iu) + sizeof(struct ssp_frame_hdr)
         |                         ^~~~~~


vim +1002 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c

42e7a69368a585 John Garry  2015-11-18   950  
a2b3820bddfbff Xiang Chen  2018-05-09   951  static void prep_ssp_v1_hw(struct hisi_hba *hisi_hba,
78bd2b4f6e7c05 Xiaofei Tan 2018-05-21   952  			  struct hisi_sas_slot *slot)
42e7a69368a585 John Garry  2015-11-18   953  {
42e7a69368a585 John Garry  2015-11-18   954  	struct sas_task *task = slot->task;
42e7a69368a585 John Garry  2015-11-18   955  	struct hisi_sas_cmd_hdr *hdr = slot->cmd_hdr;
42e7a69368a585 John Garry  2015-11-18   956  	struct domain_device *device = task->dev;
42e7a69368a585 John Garry  2015-11-18   957  	struct hisi_sas_device *sas_dev = device->lldd_dev;
42e7a69368a585 John Garry  2015-11-18   958  	struct hisi_sas_port *port = slot->port;
42e7a69368a585 John Garry  2015-11-18   959  	struct sas_ssp_task *ssp_task = &task->ssp_task;
42e7a69368a585 John Garry  2015-11-18   960  	struct scsi_cmnd *scsi_cmnd = ssp_task->cmd;
bbfe82cdbaf84e John Garry  2022-02-17   961  	struct sas_tmf_task *tmf = slot->tmf;
78bd2b4f6e7c05 Xiaofei Tan 2018-05-21   962  	int has_data = 0, priority = !!tmf;
ebf26e93cfece2 John Garry  2023-08-15   963  	u8 *buf_cmd;
42e7a69368a585 John Garry  2015-11-18   964  	u32 dw1, dw2;
42e7a69368a585 John Garry  2015-11-18   965  
42e7a69368a585 John Garry  2015-11-18   966  	/* create header */
42e7a69368a585 John Garry  2015-11-18   967  	hdr->dw0 = cpu_to_le32((1 << CMD_HDR_RESP_REPORT_OFF) |
42e7a69368a585 John Garry  2015-11-18   968  			       (0x2 << CMD_HDR_TLR_CTRL_OFF) |
42e7a69368a585 John Garry  2015-11-18   969  			       (port->id << CMD_HDR_PORT_OFF) |
42e7a69368a585 John Garry  2015-11-18   970  			       (priority << CMD_HDR_PRIORITY_OFF) |
42e7a69368a585 John Garry  2015-11-18   971  			       (1 << CMD_HDR_MODE_OFF) | /* ini mode */
42e7a69368a585 John Garry  2015-11-18   972  			       (1 << CMD_HDR_CMD_OFF)); /* ssp */
42e7a69368a585 John Garry  2015-11-18   973  
42e7a69368a585 John Garry  2015-11-18   974  	dw1 = 1 << CMD_HDR_VERIFY_DTL_OFF;
42e7a69368a585 John Garry  2015-11-18   975  
78bd2b4f6e7c05 Xiaofei Tan 2018-05-21   976  	if (tmf) {
42e7a69368a585 John Garry  2015-11-18   977  		dw1 |= 3 << CMD_HDR_SSP_FRAME_TYPE_OFF;
42e7a69368a585 John Garry  2015-11-18   978  	} else {
42e7a69368a585 John Garry  2015-11-18   979  		switch (scsi_cmnd->sc_data_direction) {
42e7a69368a585 John Garry  2015-11-18   980  		case DMA_TO_DEVICE:
42e7a69368a585 John Garry  2015-11-18   981  			dw1 |= 2 << CMD_HDR_SSP_FRAME_TYPE_OFF;
42e7a69368a585 John Garry  2015-11-18   982  			has_data = 1;
42e7a69368a585 John Garry  2015-11-18   983  			break;
42e7a69368a585 John Garry  2015-11-18   984  		case DMA_FROM_DEVICE:
42e7a69368a585 John Garry  2015-11-18   985  			dw1 |= 1 << CMD_HDR_SSP_FRAME_TYPE_OFF;
42e7a69368a585 John Garry  2015-11-18   986  			has_data = 1;
42e7a69368a585 John Garry  2015-11-18   987  			break;
42e7a69368a585 John Garry  2015-11-18   988  		default:
42e7a69368a585 John Garry  2015-11-18   989  			dw1 |= 0 << CMD_HDR_SSP_FRAME_TYPE_OFF;
42e7a69368a585 John Garry  2015-11-18   990  		}
42e7a69368a585 John Garry  2015-11-18   991  	}
42e7a69368a585 John Garry  2015-11-18   992  
42e7a69368a585 John Garry  2015-11-18   993  	/* map itct entry */
42e7a69368a585 John Garry  2015-11-18   994  	dw1 |= sas_dev->device_id << CMD_HDR_DEVICE_ID_OFF;
42e7a69368a585 John Garry  2015-11-18   995  	hdr->dw1 = cpu_to_le32(dw1);
42e7a69368a585 John Garry  2015-11-18   996  
78bd2b4f6e7c05 Xiaofei Tan 2018-05-21   997  	if (tmf) {
42e7a69368a585 John Garry  2015-11-18   998  		dw2 = ((sizeof(struct ssp_tmf_iu) +
42e7a69368a585 John Garry  2015-11-18   999  			sizeof(struct ssp_frame_hdr)+3)/4) <<
42e7a69368a585 John Garry  2015-11-18  1000  			CMD_HDR_CFL_OFF;
42e7a69368a585 John Garry  2015-11-18  1001  	} else {
42e7a69368a585 John Garry  2015-11-18 @1002  		dw2 = ((sizeof(struct ssp_command_iu) +
42e7a69368a585 John Garry  2015-11-18  1003  			sizeof(struct ssp_frame_hdr)+3)/4) <<
42e7a69368a585 John Garry  2015-11-18  1004  			CMD_HDR_CFL_OFF;
42e7a69368a585 John Garry  2015-11-18  1005  	}
42e7a69368a585 John Garry  2015-11-18  1006  
42e7a69368a585 John Garry  2015-11-18  1007  	dw2 |= (HISI_SAS_MAX_SSP_RESP_SZ/4) << CMD_HDR_MRFL_OFF;
42e7a69368a585 John Garry  2015-11-18  1008  
42e7a69368a585 John Garry  2015-11-18  1009  	hdr->transfer_tags = cpu_to_le32(slot->idx << CMD_HDR_IPTT_OFF);
42e7a69368a585 John Garry  2015-11-18  1010  
a2b3820bddfbff Xiang Chen  2018-05-09  1011  	if (has_data)
a2b3820bddfbff Xiang Chen  2018-05-09  1012  		prep_prd_sge_v1_hw(hisi_hba, slot, hdr, task->scatter,
42e7a69368a585 John Garry  2015-11-18  1013  					slot->n_elem);
42e7a69368a585 John Garry  2015-11-18  1014  
42e7a69368a585 John Garry  2015-11-18  1015  	hdr->data_transfer_len = cpu_to_le32(task->total_xfer_len);
f557e32c0023ea Xiaofei Tan 2017-06-29  1016  	hdr->cmd_table_addr = cpu_to_le64(hisi_sas_cmd_hdr_addr_dma(slot));
f557e32c0023ea Xiaofei Tan 2017-06-29  1017  	hdr->sts_buffer_addr = cpu_to_le64(hisi_sas_status_buf_addr_dma(slot));
42e7a69368a585 John Garry  2015-11-18  1018  
f557e32c0023ea Xiaofei Tan 2017-06-29  1019  	buf_cmd = hisi_sas_cmd_hdr_addr_mem(slot) +
f557e32c0023ea Xiaofei Tan 2017-06-29  1020  		sizeof(struct ssp_frame_hdr);
42e7a69368a585 John Garry  2015-11-18  1021  	hdr->dw2 = cpu_to_le32(dw2);
42e7a69368a585 John Garry  2015-11-18  1022  
42e7a69368a585 John Garry  2015-11-18  1023  	memcpy(buf_cmd, &task->ssp_task.LUN, 8);
78bd2b4f6e7c05 Xiaofei Tan 2018-05-21  1024  	if (!tmf) {
4dc051eb0c6b6c John Garry  2023-08-15  1025  		buf_cmd[9] = task->ssp_task.task_attr;
42e7a69368a585 John Garry  2015-11-18  1026  		memcpy(buf_cmd + 12, task->ssp_task.cmd->cmnd,
42e7a69368a585 John Garry  2015-11-18  1027  				task->ssp_task.cmd->cmd_len);
42e7a69368a585 John Garry  2015-11-18  1028  	} else {
42e7a69368a585 John Garry  2015-11-18  1029  		buf_cmd[10] = tmf->tmf;
42e7a69368a585 John Garry  2015-11-18  1030  		switch (tmf->tmf) {
42e7a69368a585 John Garry  2015-11-18  1031  		case TMF_ABORT_TASK:
42e7a69368a585 John Garry  2015-11-18  1032  		case TMF_QUERY_TASK:
42e7a69368a585 John Garry  2015-11-18  1033  			buf_cmd[12] =
42e7a69368a585 John Garry  2015-11-18  1034  				(tmf->tag_of_task_to_be_managed >> 8) & 0xff;
42e7a69368a585 John Garry  2015-11-18  1035  			buf_cmd[13] =
42e7a69368a585 John Garry  2015-11-18  1036  				tmf->tag_of_task_to_be_managed & 0xff;
42e7a69368a585 John Garry  2015-11-18  1037  			break;
42e7a69368a585 John Garry  2015-11-18  1038  		default:
42e7a69368a585 John Garry  2015-11-18  1039  			break;
42e7a69368a585 John Garry  2015-11-18  1040  		}
42e7a69368a585 John Garry  2015-11-18  1041  	}
42e7a69368a585 John Garry  2015-11-18  1042  }
42e7a69368a585 John Garry  2015-11-18  1043  

:::::: The code at line 1002 was first introduced by commit
:::::: 42e7a69368a5855b36cbaff130e58e2cc9976ff3 hisi_sas: Add ssp command function

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
