Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CA2BEFFD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768158536; cv=none; b=BVIh+MglvcyXukJ9Xq8Qbhq2DigTQO2+SCZR502K5yWLmlkBbF+4c3b7KrHYlJLETvXNiSm7haTHYO1DHZ8dnZ/X8KgGd347djvvYkYrhmTFg5LGW1279WmcCpcdam+LY+OJ/iIomQ/EnQnKcGyvsmUBTcTp69Rqc9uUo8/KlsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768158536; c=relaxed/simple;
	bh=n0r9LfWMVN5og6Cgb8Qyt4wrc0yZ+a+B4+Mczm90+TM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uF3oFHtlBqs4d9dCOwO4QgVs+Sfw0ukjRJ5+cD6hKtYvNF8E3qvuwMq9Gi1Ny8uXHS8aHRiT+pWRjAO3qQck353qZvQ2m7av+prVAlju09NqtDJm42PTKiUWb8UKA5EuzTwu1e04FEF0mcdWYfVeD03jy68cYcNtYeNa2W+vMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICaxEnAI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICaxEnAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768158535; x=1799694535;
  h=date:from:to:cc:subject:message-id;
  bh=n0r9LfWMVN5og6Cgb8Qyt4wrc0yZ+a+B4+Mczm90+TM=;
  b=ICaxEnAIBcaYcDOlu1bvrURlXR1OlhukgFccfo0mt6MbnY8/lPZH4Fd0
   k3xBdm6ouVpNT4dBdkXb1cO9ZO36i/B6udYlwHck4vOtp07Snc/JholMY
   E+JOZUJhe0pX1FF81Fq6rLKbdKHmFR9XGPrV9MwFu7vMfoSLL2M/9ojm2
   OZazW9CbfQrhnaQbxMHc7NOfE6ByHkI7R9X0eznRTErdPoE//sccm/Y9w
   zxSS8HvKeW/iSuHeGAIRPvXv+vuOOlvJPnJboxk1oXawM3ndIYd0scqU1
   26yTORsWBOrP3ON6s4s4x3UqzzFbDeOMkmyHr5imKhkHQCyZav0kAf3zA
   Q==;
X-CSE-ConnectionGUID: KUfKJcHdQ6Od3dEFiFIXew==
X-CSE-MsgGUID: CoUFAnrTRSKWxjpm8tybFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68654087"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68654087"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 11:08:55 -0800
X-CSE-ConnectionGUID: ifUxaonVSgO1Ox5FTDCm0g==
X-CSE-MsgGUID: bql2u/7IQMaB7/fNUh17og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234621257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 11:08:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf0ny-00000000CdG-24YL;
	Sun, 11 Jan 2026 19:08:50 +0000
Date: Mon, 12 Jan 2026 03:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/4]
 drivers/scsi/lpfc/lpfc_bsg.c:918:15: sparse: sparse: cast to restricted
 __be16
Message-ID: <202601120337.89QMtpqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   4472ce9a8930cd43ed2633eebd15c370947c0715
commit: 790587097c013c95a96151c30312c5e589f0b30d [0/4] scsi: lpfc: Fix incorrect big endian type assignment in bsg loopback path
config: i386-randconfig-061-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120337.89QMtpqh-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120337.89QMtpqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120337.89QMtpqh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/lpfc/lpfc_bsg.c:195:32: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:196:33: sparse: sparse: cast to restricted __le32
   drivers/scsi/lpfc/lpfc_bsg.c:201:30: sparse: sparse: cast to restricted __le32
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
