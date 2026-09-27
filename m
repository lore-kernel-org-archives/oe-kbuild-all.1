Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150B3ED3CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526080; cv=none; b=Pdsmgv/vLOSO1SnHZZyAI5JP8R6mGmPRlEk7HMVUQFldghnUnJxXUW24elzfQX3k7yHROah7TOeysKBO/2+I3E/vyH0Dt/IVqVfIXeyHPkXvaAMoo4KZq5vIiGQsS0LdQdzgDB/tfqeeF+f+4er/IsiQO65NcNQPITmpxKaRabk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526080; c=relaxed/simple;
	bh=Dcr1W1gv13VSeEkK170F4/UnAnBkq0iUhls1VCvQz2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=chwpPJzQ8hWF0jlE1XG5KfTEi0dUgRD3ZEC0j9nklUF+zJR0DTSfvxv4wDx6sx9nMJCtbCIs6stupQmUWb+k+xkWNk9Zd2k9eVMrAQs7ChbQnHydEwCVXZQzccOZ+B0qmxPQLJm9fF9pSDyyoJCrm1FHPJEDPsgSXHeTsGxUqiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjoSKFod; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjoSKFod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790526078; x=1822062078;
  h=date:from:to:cc:subject:message-id;
  bh=Dcr1W1gv13VSeEkK170F4/UnAnBkq0iUhls1VCvQz2M=;
  b=bjoSKFodj0nRYbIlH+fANyLA+jr7nxkLi75Kse5DVrVa7MbxOZZAE6dw
   CxcT9P7oI05mKVvLHUfH8KvaBOM7Pl7qAWuiit7UDPch42/aUkM//7vrW
   deZQPm+M9Fp00tV6qONuDB4epsKvXf3xpEP/Wpy99io9uFCewsci3nq1x
   G6UyWDT4FOoGP760p9t5QWxWIXpsUkyzVlC/ppQcT6+ijRcV6TW/3Ud93
   6VlrrIJB0SlyPkZ5lBZo1601zAiySxMhGRGwp6RqE56JQkTwkeqBoPRqq
   jjZFpx/G3DbIiBHdXdAjktMXJRFRUpRxeNlFIjZ+Czx2dxnmXPAxgyd6l
   A==;
X-CSE-ConnectionGUID: OOtu8XwaRjGCae5zS+WmDA==
X-CSE-MsgGUID: KB4BQJ1QR5WH8w1WgalqdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91100946"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="91100946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 09:21:17 -0700
X-CSE-ConnectionGUID: HUY5wbE7ToavOcwxBY+JXg==
X-CSE-MsgGUID: pUESCQFtRLCTLn3LK/coKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="273941520"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2026 09:21:16 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xArcn-000000000d5-0M4B;
	Sun, 27 Sep 2026 16:21:13 +0000
Date: Sun, 27 Sep 2026 18:20:57 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-thread-safety 21/65]
 drivers/scsi/bnx2i/bnx2i_hwi.c:1352:48: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202609271809.Ov4QhF6p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   67ad293ba84284eaa5d8a5c335c59cf3ac091dc5
commit: 13ed9d6d42e5c66809971cb9f6a3365f85a87d3e [21/65] scsi: libiscsi: Prepare for enabling lock context analysis
config: i386-randconfig-2301-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271809.Ov4QhF6p-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271809.Ov4QhF6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271809.Ov4QhF6p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse:     expected unsigned int val
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] tsih @@     got restricted __be16 [usertype] tsih @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse:     expected unsigned short [usertype] tsih
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse:     got restricted __be16 [usertype] tsih
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cid @@     got restricted __be16 [usertype] cid @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse:     expected unsigned short [usertype] cid
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse:     got restricted __be16 [usertype] cid
   drivers/scsi/bnx2i/bnx2i_hwi.c:428:54: sparse: sparse: restricted itt_t degrades to integer
   drivers/scsi/bnx2i/bnx2i_hwi.c:431:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ref_itt @@     got restricted itt_t [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:431:39: sparse:     expected unsigned int [usertype] ref_itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:431:39: sparse:     got restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:435:32: sparse: sparse: cast to restricted __be32
>> drivers/scsi/bnx2i/bnx2i_hwi.c:1352:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1352:48: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1352:48: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1448:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1448:45: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1448:45: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1516:44: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1516:44: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1516:44: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1576:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1576:47: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1576:47: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1615:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1615:46: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1615:46: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1630:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1630:26: sparse:     expected restricted __be16 [usertype] t2wait
   drivers/scsi/bnx2i/bnx2i_hwi.c:1630:26: sparse:     got restricted __be32 [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1631:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2retain @@     got restricted __be32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1631:28: sparse:     expected restricted __be16 [usertype] t2retain
   drivers/scsi/bnx2i/bnx2i_hwi.c:1631:28: sparse:     got restricted __be32 [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1660:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1660:46: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1660:46: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1710:29: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1719:27: sparse: sparse: cast to restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1815:25: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1840:44: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1840:44: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1840:44: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1914:43: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted itt_t [usertype] itt @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1914:43: sparse:     expected restricted itt_t [usertype] itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:1914:43: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1984:44: sparse: sparse: cast from restricted itt_t

vim +1352 drivers/scsi/bnx2i/bnx2i_hwi.c

cf4e6363859d30 Michael Chan       2009-06-08  1327  
cf4e6363859d30 Michael Chan       2009-06-08  1328  
cf4e6363859d30 Michael Chan       2009-06-08  1329  /**
cf4e6363859d30 Michael Chan       2009-06-08  1330   * bnx2i_process_scsi_cmd_resp - this function handles scsi cmd completion.
b5cf6b63f73abd Eddie Wai          2011-06-23  1331   * @session:	iscsi session
b5cf6b63f73abd Eddie Wai          2011-06-23  1332   * @bnx2i_conn:	bnx2i connection
cf4e6363859d30 Michael Chan       2009-06-08  1333   * @cqe:	pointer to newly DMA'ed CQE entry for processing
cf4e6363859d30 Michael Chan       2009-06-08  1334   *
cf4e6363859d30 Michael Chan       2009-06-08  1335   * process SCSI CMD Response CQE & complete the request to SCSI-ML
cf4e6363859d30 Michael Chan       2009-06-08  1336   */
b5cf6b63f73abd Eddie Wai          2011-06-23  1337  int bnx2i_process_scsi_cmd_resp(struct iscsi_session *session,
cf4e6363859d30 Michael Chan       2009-06-08  1338  				struct bnx2i_conn *bnx2i_conn,
cf4e6363859d30 Michael Chan       2009-06-08  1339  				struct cqe *cqe)
cf4e6363859d30 Michael Chan       2009-06-08  1340  {
cf4e6363859d30 Michael Chan       2009-06-08  1341  	struct iscsi_conn *conn = bnx2i_conn->cls_conn->dd_data;
2e499d3cc13365 Barak Witkowski    2012-06-26  1342  	struct bnx2i_hba *hba = bnx2i_conn->hba;
cf4e6363859d30 Michael Chan       2009-06-08  1343  	struct bnx2i_cmd_response *resp_cqe;
cf4e6363859d30 Michael Chan       2009-06-08  1344  	struct bnx2i_cmd *bnx2i_cmd;
cf4e6363859d30 Michael Chan       2009-06-08  1345  	struct iscsi_task *task;
123521830c0ea3 Nicholas Bellinger 2011-05-27  1346  	struct iscsi_scsi_rsp *hdr;
cf4e6363859d30 Michael Chan       2009-06-08  1347  	u32 datalen = 0;
cf4e6363859d30 Michael Chan       2009-06-08  1348  
cf4e6363859d30 Michael Chan       2009-06-08  1349  	resp_cqe = (struct bnx2i_cmd_response *)cqe;
659743b02c4110 Shlomo Pongratz    2014-02-07  1350  	spin_lock_bh(&session->back_lock);
79a93e499f9903 Bart Van Assche    2026-08-28  1351  	task = iscsi_itt_to_task(session, conn,
cf4e6363859d30 Michael Chan       2009-06-08 @1352  				 resp_cqe->itt & ISCSI_CMD_RESPONSE_INDEX);
cf4e6363859d30 Michael Chan       2009-06-08  1353  	if (!task)
cf4e6363859d30 Michael Chan       2009-06-08  1354  		goto fail;
cf4e6363859d30 Michael Chan       2009-06-08  1355  
cf4e6363859d30 Michael Chan       2009-06-08  1356  	bnx2i_cmd = task->dd_data;
cf4e6363859d30 Michael Chan       2009-06-08  1357  
cf4e6363859d30 Michael Chan       2009-06-08  1358  	if (bnx2i_cmd->req.op_attr & ISCSI_CMD_REQUEST_READ) {
cf4e6363859d30 Michael Chan       2009-06-08  1359  		conn->datain_pdus_cnt +=
2e499d3cc13365 Barak Witkowski    2012-06-26  1360  			resp_cqe->task_stat.read_stat.num_data_ins;
cf4e6363859d30 Michael Chan       2009-06-08  1361  		conn->rxdata_octets +=
cf4e6363859d30 Michael Chan       2009-06-08  1362  			bnx2i_cmd->req.total_data_transfer_length;
2e499d3cc13365 Barak Witkowski    2012-06-26  1363  		ADD_STATS_64(hba, rx_pdus,
2e499d3cc13365 Barak Witkowski    2012-06-26  1364  			     resp_cqe->task_stat.read_stat.num_data_ins);
2e499d3cc13365 Barak Witkowski    2012-06-26  1365  		ADD_STATS_64(hba, rx_bytes,
2e499d3cc13365 Barak Witkowski    2012-06-26  1366  			     bnx2i_cmd->req.total_data_transfer_length);
cf4e6363859d30 Michael Chan       2009-06-08  1367  	} else {
cf4e6363859d30 Michael Chan       2009-06-08  1368  		conn->dataout_pdus_cnt +=
2e499d3cc13365 Barak Witkowski    2012-06-26  1369  			resp_cqe->task_stat.write_stat.num_data_outs;
cf4e6363859d30 Michael Chan       2009-06-08  1370  		conn->r2t_pdus_cnt +=
2e499d3cc13365 Barak Witkowski    2012-06-26  1371  			resp_cqe->task_stat.write_stat.num_r2ts;
cf4e6363859d30 Michael Chan       2009-06-08  1372  		conn->txdata_octets +=
cf4e6363859d30 Michael Chan       2009-06-08  1373  			bnx2i_cmd->req.total_data_transfer_length;
2e499d3cc13365 Barak Witkowski    2012-06-26  1374  		ADD_STATS_64(hba, tx_pdus,
2e499d3cc13365 Barak Witkowski    2012-06-26  1375  			     resp_cqe->task_stat.write_stat.num_data_outs);
2e499d3cc13365 Barak Witkowski    2012-06-26  1376  		ADD_STATS_64(hba, tx_bytes,
2e499d3cc13365 Barak Witkowski    2012-06-26  1377  			     bnx2i_cmd->req.total_data_transfer_length);
2e499d3cc13365 Barak Witkowski    2012-06-26  1378  		ADD_STATS_64(hba, rx_pdus,
2e499d3cc13365 Barak Witkowski    2012-06-26  1379  			     resp_cqe->task_stat.write_stat.num_r2ts);
cf4e6363859d30 Michael Chan       2009-06-08  1380  	}
cf4e6363859d30 Michael Chan       2009-06-08  1381  	bnx2i_iscsi_unmap_sg_list(bnx2i_cmd);
cf4e6363859d30 Michael Chan       2009-06-08  1382  
123521830c0ea3 Nicholas Bellinger 2011-05-27  1383  	hdr = (struct iscsi_scsi_rsp *)task->hdr;
cf4e6363859d30 Michael Chan       2009-06-08  1384  	resp_cqe = (struct bnx2i_cmd_response *)cqe;
cf4e6363859d30 Michael Chan       2009-06-08  1385  	hdr->opcode = resp_cqe->op_code;
cf4e6363859d30 Michael Chan       2009-06-08  1386  	hdr->max_cmdsn = cpu_to_be32(resp_cqe->max_cmd_sn);
cf4e6363859d30 Michael Chan       2009-06-08  1387  	hdr->exp_cmdsn = cpu_to_be32(resp_cqe->exp_cmd_sn);
cf4e6363859d30 Michael Chan       2009-06-08  1388  	hdr->response = resp_cqe->response;
cf4e6363859d30 Michael Chan       2009-06-08  1389  	hdr->cmd_status = resp_cqe->status;
cf4e6363859d30 Michael Chan       2009-06-08  1390  	hdr->flags = resp_cqe->response_flags;
cf4e6363859d30 Michael Chan       2009-06-08  1391  	hdr->residual_count = cpu_to_be32(resp_cqe->residual_count);
cf4e6363859d30 Michael Chan       2009-06-08  1392  
cf4e6363859d30 Michael Chan       2009-06-08  1393  	if (resp_cqe->op_code == ISCSI_OP_SCSI_DATA_IN)
cf4e6363859d30 Michael Chan       2009-06-08  1394  		goto done;
cf4e6363859d30 Michael Chan       2009-06-08  1395  
cf4e6363859d30 Michael Chan       2009-06-08  1396  	if (resp_cqe->status == SAM_STAT_CHECK_CONDITION) {
cf4e6363859d30 Michael Chan       2009-06-08  1397  		datalen = resp_cqe->data_length;
cf4e6363859d30 Michael Chan       2009-06-08  1398  		if (datalen < 2)
cf4e6363859d30 Michael Chan       2009-06-08  1399  			goto done;
cf4e6363859d30 Michael Chan       2009-06-08  1400  
cf4e6363859d30 Michael Chan       2009-06-08  1401  		if (datalen > BNX2I_RQ_WQE_SIZE) {
cf4e6363859d30 Michael Chan       2009-06-08  1402  			iscsi_conn_printk(KERN_ERR, conn,
cf4e6363859d30 Michael Chan       2009-06-08  1403  					  "sense data len %d > RQ sz\n",
cf4e6363859d30 Michael Chan       2009-06-08  1404  					  datalen);
cf4e6363859d30 Michael Chan       2009-06-08  1405  			datalen = BNX2I_RQ_WQE_SIZE;
cf4e6363859d30 Michael Chan       2009-06-08  1406  		} else if (datalen > ISCSI_DEF_MAX_RECV_SEG_LEN) {
cf4e6363859d30 Michael Chan       2009-06-08  1407  			iscsi_conn_printk(KERN_ERR, conn,
cf4e6363859d30 Michael Chan       2009-06-08  1408  					  "sense data len %d > conn data\n",
cf4e6363859d30 Michael Chan       2009-06-08  1409  					  datalen);
cf4e6363859d30 Michael Chan       2009-06-08  1410  			datalen = ISCSI_DEF_MAX_RECV_SEG_LEN;
cf4e6363859d30 Michael Chan       2009-06-08  1411  		}
cf4e6363859d30 Michael Chan       2009-06-08  1412  
cf4e6363859d30 Michael Chan       2009-06-08  1413  		bnx2i_get_rq_buf(bnx2i_cmd->conn, conn->data, datalen);
cf4e6363859d30 Michael Chan       2009-06-08  1414  		bnx2i_put_rq_buf(bnx2i_cmd->conn, 1);
cf4e6363859d30 Michael Chan       2009-06-08  1415  	}
cf4e6363859d30 Michael Chan       2009-06-08  1416  
cf4e6363859d30 Michael Chan       2009-06-08  1417  done:
79a93e499f9903 Bart Van Assche    2026-08-28  1418  	__iscsi_complete_pdu(session, conn, (struct iscsi_hdr *)hdr,
cf4e6363859d30 Michael Chan       2009-06-08  1419  			     conn->data, datalen);
cf4e6363859d30 Michael Chan       2009-06-08  1420  fail:
659743b02c4110 Shlomo Pongratz    2014-02-07  1421  	spin_unlock_bh(&session->back_lock);
cf4e6363859d30 Michael Chan       2009-06-08  1422  	return 0;
cf4e6363859d30 Michael Chan       2009-06-08  1423  }
cf4e6363859d30 Michael Chan       2009-06-08  1424  

:::::: The code at line 1352 was first introduced by commit
:::::: cf4e6363859d30f24f8cd3e8930dbff399cc3550 [SCSI] bnx2i: Add bnx2i iSCSI driver.

:::::: TO: Michael Chan <mchan@broadcom.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
