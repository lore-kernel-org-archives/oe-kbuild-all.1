Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422054;
	b=fy94l4TMiHURQCYFDLBIwuqkt30dPRwuVPr2wQfABFeZunXoHqwu7iCZf9jZ08cEVO81
	 +MYWano8MdAriFL4C+E2Q9Gg4lCQ5P298EjR1WZCTrb0JmLXPLKV2OB5HgcfPnhlp+2ph
	 jxZzGjmZCiDFRwHvg7ZJwyco6kYGFqYcsZ0EcX1JbQ5DTQ1GFj99+0bCeksHjUsQHdLlL
	 +XosDU/egB2dnYuHlUIMj0Ai3ZaaIa3KZOnFZR1ulvvaHoWlQItqDXE/FOZLDPbxcIXFJ
	 9HRP6EgoNY4uijN77rOPQr40lDulhMxaixC6AvURZUUZyegmgnLMPJWQgPt9lRcIiMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422054;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YQMEJwk+nZwvfvEA1uklqm3oMaDzNAjFNJH4r0eiaTw=;
	b=bv7AskBtAGUWAG6ve6Z8+5qrkAaDmjwjl8bdzkdl1W9hXif4MtPWCQ1VBQsLmg3QxGxA
	 5hvRFZLdGJjgkTEMdqDQKPDfc9ubo6x7km0TCoyb4158plPqXtBYzLdu2zQsZjEC7WF8I
	 ywxXot4dmunJTuCAgSfDwneSAdoE7Kn2RPObfmQ5SQcCkGobSW91ARPPvLwyVAQtmRTf+
	 slCvK2lX+qqm9TBhgm0w6AMYWB+C112vByuXw/iY3BLnBjHEn+y9AlQiAPg8Uc1PfScL3
	 PdILz2PRWjuIdWKLTKnrlridMj87LmpY2ahCp++59FBBlzBgT7u+WbdfjCO3Ev+wNrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQ16Pz2e;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE66079D71
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 15:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BE66079D71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQ16Pz2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422053; x=1823958053;
  h=date:from:to:cc:subject:message-id;
  bh=lLDDYLcnfttdW1hIi5opFa15n7yaPr8jUMlKsf890TY=;
  b=KQ16Pz2eI4S67UhhRg9ntXdDMVhYZvOAWjUc4CyYceYcxsY7mVsKoWRn
   PfzQoSxREAPefvGoS0WXS+ChhrlxTLrC7auD2lRjc9paFiwZoXwiNks6L
   FE4YdOqgzMooZM35Rndq+0cknZqxUiMQl0SIRAR88DStlPG6jcQ7FGOho
   xPVKWGYWLloPW9sLRRa9q6a+xxzAFiHeOJAKmiplTFoMua/+6Bxq4dB1l
   F1gbihc3YZmjnx8/HG5RSa65jgEfBeitfqD7mVO6ZG0NCGhIyJ8ko2abc
   yqoc+kLU8mk5+uQjdcDdPW1Q55rWBszKqciKDEVaePNKk8T9UlY16PzlL
   w==;
X-CSE-ConnectionGUID: pQzHgiVwTzSRnCQ9dcA/9A==
X-CSE-MsgGUID: xKWTF30sTM2Z6osmVwKPvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1131409"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1131409"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:00:41 -0700
X-CSE-ConnectionGUID: SkYwMDS0SKGT74gzWDF3JA==
X-CSE-MsgGUID: bBC0TvgeRGCyROXWn9SpRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4318385"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Oct 2026 08:00:39 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIoqr-000000005f1-23cR;
	Mon, 19 Oct 2026 15:00:37 +0000
Date: Mon, 19 Oct 2026 17:00:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted
 __be16
Message-ID: <202610191637.XcCH8uqE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 790587097c013c95a96151c30312c5e589f0b30d [336/336] scsi: lpfc: Fix incorrect big endian type assignment in bsg loopback path
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191637.XcCH8uqE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191637.XcCH8uqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191637.XcCH8uqE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/lpfc/lpfc_bsg.c:195:32: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:196:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:201:30: sparse: sparse: cast to restricted __le32
>> drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted __be16
>> drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted __be16
>> drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted __be16
>> drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted __be16
   drivers/scsi/lpfc/lpfc_bsg.c:2626:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2629:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2633:38: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2850:32: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2851:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:2853:30: sparse: sparse: cast to restricted __le32
>> drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] CmdRsp:16 @@     got restricted __be16 [usertype] @@
   drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse:     expected unsigned int [usertype] CmdRsp:16
   drivers/scsi/lpfc/lpfc_bsg.c:3189:60: sparse:     got restricted __be16 [usertype]
>> drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Size:16 @@     got restricted __be16 [usertype] @@
   drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse:     expected unsigned int [usertype] Size:16
   drivers/scsi/lpfc/lpfc_bsg.c:3190:60: sparse:     got restricted __be16 [usertype]
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5226:29: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/lpfc/lpfc_bsg.c:5229:33: sparse: sparse: cast to restricted __be32

vim +918 drivers/scsi/lpfc/lpfc_bsg.c

   880	
   881	/*
   882	 * lpfc_bsg_ct_unsol_event - process an unsolicited CT command
   883	 *
   884	 * This function is called when an unsolicited CT command is received.  It
   885	 * forwards the event to any processes registered to receive CT events.
   886	 **/
   887	int
   888	lpfc_bsg_ct_unsol_event(struct lpfc_hba *phba, struct lpfc_sli_ring *pring,
   889				struct lpfc_iocbq *piocbq)
   890	{
   891		uint32_t evt_req_id = 0;
   892		u16 cmd;
   893		struct lpfc_dmabuf *dmabuf = NULL;
   894		struct lpfc_bsg_event *evt;
   895		struct event_data *evt_dat = NULL;
   896		struct lpfc_iocbq *iocbq;
   897		IOCB_t *iocb = NULL;
   898		size_t offset = 0;
   899		struct list_head head;
   900		struct ulp_bde64 *bde;
   901		dma_addr_t dma_addr;
   902		int i;
   903		struct lpfc_dmabuf *bdeBuf1 = piocbq->cmd_dmabuf;
   904		struct lpfc_dmabuf *bdeBuf2 = piocbq->bpl_dmabuf;
   905		struct lpfc_sli_ct_request *ct_req;
   906		struct bsg_job *job = NULL;
   907		struct fc_bsg_reply *bsg_reply;
   908		struct bsg_job_data *dd_data = NULL;
   909		unsigned long flags;
   910		int size = 0;
   911		u32 bde_count = 0;
   912	
   913		INIT_LIST_HEAD(&head);
   914		list_add_tail(&head, &piocbq->list);
   915	
   916		ct_req = (struct lpfc_sli_ct_request *)bdeBuf1->virt;
   917		evt_req_id = ct_req->FsType;
 > 918		cmd = be16_to_cpu(ct_req->CommandResponse.bits.CmdRsp);
   919	
   920		spin_lock_irqsave(&phba->ct_ev_lock, flags);
   921		list_for_each_entry(evt, &phba->ct_ev_waiters, node) {
   922			if (!(evt->type_mask & FC_REG_CT_EVENT) ||
   923				evt->req_id != evt_req_id)
   924				continue;
   925	
   926			lpfc_bsg_event_ref(evt);
   927			spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
   928			evt_dat = kzalloc(sizeof(*evt_dat), GFP_KERNEL);
   929			if (evt_dat == NULL) {
   930				spin_lock_irqsave(&phba->ct_ev_lock, flags);
   931				lpfc_bsg_event_unref(evt);
   932				lpfc_printf_log(phba, KERN_WARNING, LOG_LIBDFC,
   933						"2614 Memory allocation failed for "
   934						"CT event\n");
   935				break;
   936			}
   937	
   938			if (phba->sli3_options & LPFC_SLI3_HBQ_ENABLED) {
   939				/* take accumulated byte count from the last iocbq */
   940				iocbq = list_entry(head.prev, typeof(*iocbq), list);
   941				if (phba->sli_rev == LPFC_SLI_REV4)
   942					evt_dat->len = iocbq->wcqe_cmpl.total_data_placed;
   943				else
   944					evt_dat->len = iocbq->iocb.unsli3.rcvsli3.acc_len;
   945			} else {
   946				list_for_each_entry(iocbq, &head, list) {
   947					iocb = &iocbq->iocb;
   948					for (i = 0; i < iocb->ulpBdeCount;
   949					     i++)
   950						evt_dat->len +=
   951						iocb->un.cont64[i].tus.f.bdeSize;
   952				}
   953			}
   954	
   955			evt_dat->data = kzalloc(evt_dat->len, GFP_KERNEL);
   956			if (evt_dat->data == NULL) {
   957				lpfc_printf_log(phba, KERN_WARNING, LOG_LIBDFC,
   958						"2615 Memory allocation failed for "
   959						"CT event data, size %d\n",
   960						evt_dat->len);
   961				kfree(evt_dat);
   962				spin_lock_irqsave(&phba->ct_ev_lock, flags);
   963				lpfc_bsg_event_unref(evt);
   964				spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
   965				goto error_ct_unsol_exit;
   966			}
   967	
   968			list_for_each_entry(iocbq, &head, list) {
   969				size = 0;
   970				if (phba->sli3_options & LPFC_SLI3_HBQ_ENABLED) {
   971					bdeBuf1 = iocbq->cmd_dmabuf;
   972					bdeBuf2 = iocbq->bpl_dmabuf;
   973				}
   974				if (phba->sli_rev == LPFC_SLI_REV4)
   975					bde_count = iocbq->wcqe_cmpl.word3;
   976				else
   977					bde_count = iocbq->iocb.ulpBdeCount;
   978				for (i = 0; i < bde_count; i++) {
   979					if (phba->sli3_options &
   980					    LPFC_SLI3_HBQ_ENABLED) {
   981						if (i == 0) {
   982							size = iocbq->wqe.gen_req.bde.tus.f.bdeSize;
   983							dmabuf = bdeBuf1;
   984						} else if (i == 1) {
   985							size = iocbq->unsol_rcv_len;
   986							dmabuf = bdeBuf2;
   987						}
   988						if ((offset + size) > evt_dat->len)
   989							size = evt_dat->len - offset;
   990					} else {
   991						size = iocbq->iocb.un.cont64[i].
   992							tus.f.bdeSize;
   993						bde = &iocbq->iocb.un.cont64[i];
   994						dma_addr = getPaddr(bde->addrHigh,
   995								    bde->addrLow);
   996						dmabuf = lpfc_sli_ringpostbuf_get(phba,
   997								pring, dma_addr);
   998					}
   999					if (!dmabuf) {
  1000						lpfc_printf_log(phba, KERN_ERR,
  1001							LOG_LIBDFC, "2616 No dmabuf "
  1002							"found for iocbq x%px\n",
  1003							iocbq);
  1004						kfree(evt_dat->data);
  1005						kfree(evt_dat);
  1006						spin_lock_irqsave(&phba->ct_ev_lock,
  1007							flags);
  1008						lpfc_bsg_event_unref(evt);
  1009						spin_unlock_irqrestore(
  1010							&phba->ct_ev_lock, flags);
  1011						goto error_ct_unsol_exit;
  1012					}
  1013					memcpy((char *)(evt_dat->data) + offset,
  1014					       dmabuf->virt, size);
  1015					offset += size;
  1016					if (evt_req_id != SLI_CT_ELX_LOOPBACK &&
  1017					    !(phba->sli3_options &
  1018					      LPFC_SLI3_HBQ_ENABLED)) {
  1019						lpfc_sli_ringpostbuf_put(phba, pring,
  1020									 dmabuf);
  1021					} else {
  1022						switch (cmd) {
  1023						case ELX_LOOPBACK_DATA:
  1024							if (phba->sli_rev <
  1025							    LPFC_SLI_REV4)
  1026								diag_cmd_data_free(phba,
  1027								(struct lpfc_dmabufext
  1028								 *)dmabuf);
  1029							break;
  1030						case ELX_LOOPBACK_XRI_SETUP:
  1031							if ((phba->sli_rev ==
  1032								LPFC_SLI_REV2) ||
  1033								(phba->sli3_options &
  1034								LPFC_SLI3_HBQ_ENABLED
  1035								)) {
  1036								lpfc_in_buf_free(phba,
  1037										dmabuf);
  1038							} else {
  1039								lpfc_sli3_post_buffer(phba,
  1040										      pring,
  1041										      1);
  1042							}
  1043							break;
  1044						default:
  1045							if (!(phba->sli3_options &
  1046							      LPFC_SLI3_HBQ_ENABLED))
  1047								lpfc_sli3_post_buffer(phba,
  1048										      pring,
  1049										      1);
  1050							break;
  1051						}
  1052					}
  1053				}
  1054			}
  1055	
  1056			spin_lock_irqsave(&phba->ct_ev_lock, flags);
  1057			if (phba->sli_rev == LPFC_SLI_REV4) {
  1058				evt_dat->immed_dat = phba->ctx_idx;
  1059				phba->ctx_idx = (phba->ctx_idx + 1) % LPFC_CT_CTX_MAX;
  1060				/* Provide warning for over-run of the ct_ctx array */
  1061				if (phba->ct_ctx[evt_dat->immed_dat].valid ==
  1062				    UNSOL_VALID)
  1063					lpfc_printf_log(phba, KERN_WARNING, LOG_ELS,
  1064							"2717 CT context array entry "
  1065							"[%d] over-run: oxid:x%x, "
  1066							"sid:x%x\n", phba->ctx_idx,
  1067							phba->ct_ctx[
  1068							    evt_dat->immed_dat].oxid,
  1069							phba->ct_ctx[
  1070							    evt_dat->immed_dat].SID);
  1071				phba->ct_ctx[evt_dat->immed_dat].rxid =
  1072					get_job_ulpcontext(phba, piocbq);
  1073				phba->ct_ctx[evt_dat->immed_dat].oxid =
  1074					get_job_rcvoxid(phba, piocbq);
  1075				phba->ct_ctx[evt_dat->immed_dat].SID =
  1076					bf_get(wqe_els_did,
  1077					       &piocbq->wqe.xmit_els_rsp.wqe_dest);
  1078				phba->ct_ctx[evt_dat->immed_dat].valid = UNSOL_VALID;
  1079			} else
  1080				evt_dat->immed_dat = get_job_ulpcontext(phba, piocbq);
  1081	
  1082			evt_dat->type = FC_REG_CT_EVENT;
  1083			list_add(&evt_dat->node, &evt->events_to_see);
  1084			if (evt_req_id == SLI_CT_ELX_LOOPBACK) {
  1085				wake_up_interruptible(&evt->wq);
  1086				lpfc_bsg_event_unref(evt);
  1087				break;
  1088			}
  1089	
  1090			list_move(evt->events_to_see.prev, &evt->events_to_get);
  1091	
  1092			dd_data = (struct bsg_job_data *)evt->dd_data;
  1093			job = dd_data->set_job;
  1094			dd_data->set_job = NULL;
  1095			lpfc_bsg_event_unref(evt);
  1096			if (job) {
  1097				bsg_reply = job->reply;
  1098				bsg_reply->reply_payload_rcv_len = size;
  1099				/* make error code available to userspace */
  1100				bsg_reply->result = 0;
  1101				job->dd_data = NULL;
  1102				/* complete the job back to userspace */
  1103				spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
  1104				bsg_job_done(job, bsg_reply->result,
  1105					       bsg_reply->reply_payload_rcv_len);
  1106				spin_lock_irqsave(&phba->ct_ev_lock, flags);
  1107			}
  1108		}
  1109		spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
  1110	
  1111	error_ct_unsol_exit:
  1112		if (!list_empty(&head))
  1113			list_del(&head);
  1114		if ((phba->sli_rev < LPFC_SLI_REV4) &&
  1115		    (evt_req_id == SLI_CT_ELX_LOOPBACK))
  1116			return 0;
  1117		return 1;
  1118	}
  1119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
