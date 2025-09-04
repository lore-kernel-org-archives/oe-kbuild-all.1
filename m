Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FDB2264B1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975771; cv=none; b=LPk1aBnaP5Feoam3MH2zMvsnSEJQ+8Z1ulaB/GacUBO8qmNRD4LQgfi3v4LdxGjAKTzrpTgJA7lQf7ekho4vRlVkR7ccw7b015BYV5grygZB3GWnP/KHF4CcgQ5nmmG2EQ8AtwDGjdrK2RMLlQVZXN7QNZlBQO1GF+NHWraXyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975771; c=relaxed/simple;
	bh=bQLMXk8dSStRGkO4OCby2gC8+1LEMJmUy4eWIQ5ktzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJ1E0iXQv6/5ykG3PA80IgY88P6QotF6FmqU/UYavyOIAPk07/tEKylFyxduJjhtMsiwHwNachv/xBXB3roKvue/Bx3Izjsg7dNRlysAHjO34bMhexsjECaogG16tMfUw2T3LmjRnkoekuVpTaDaF9J3eyQZQqNV9BoSiFEG/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq6JDatr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq6JDatr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756975769; x=1788511769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQLMXk8dSStRGkO4OCby2gC8+1LEMJmUy4eWIQ5ktzs=;
  b=Mq6JDatr7nuCReSme5SXuNnMsCixZEIv3QuB4b1R0ixQQ7mJZeWKrBnj
   R54W4UaTzPdZBg8Q5W1bq8PBW/qAUh9hvVm3usnpn+T47jIaCkA1x2GR3
   bCSim/ucdyPg+5f6MiIRaGt7fbLHMdlQBfBRVd0MiD1p3czwwXB1VJGiI
   8CMJ5AWl5jjeM5PMBSEgAk/T02jGsmldBhJSGjRa45s//LLwBcVwJe4o2
   P/0hg5YcsA63QNG08DNsGKeNpqHy71fAE0+0WL525Z5p8fqjE0zfnb8X1
   5FGi3tb2HsnR/WVaITFOve7xPyqpMhWHbV9B/0uby0TzwzWRoeQqAWxOD
   Q==;
X-CSE-ConnectionGUID: RVaDY+dkSn+SCf3dZ38sRQ==
X-CSE-MsgGUID: pwYl0lv/TlqkZSlXtecDDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69570633"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="69570633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 01:49:29 -0700
X-CSE-ConnectionGUID: pdi/XMR/SESsH5k4k8FoaQ==
X-CSE-MsgGUID: juqNr/CnRkCyPD9dIcDhdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171379752"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2025 01:49:28 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu5en-0003gb-0O;
	Thu, 04 Sep 2025 08:49:25 +0000
Date: Thu, 4 Sep 2025 10:48:48 +0200
From: kernel test robot <lkp@intel.com>
To: Nick Child <nchild@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream-20250903-1 2/2]
 drivers/infiniband/sw/rdmavt/qp.c:1275:5: warning: no previous prototype for
 '__rvt_error_qp_locked'
Message-ID: <202509041031.69B5OjmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20250903-1
head:   42ab16807bc676eb7d0d33ede83d44aca682abf2
commit: 42ab16807bc676eb7d0d33ede83d44aca682abf2 [2/2] IB/rdmavt: Fix lock dependency in rvt_send/recv_cq
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250904/202509041031.69B5OjmD-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041031.69B5OjmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041031.69B5OjmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/sw/rdmavt/qp.c:1275:5: warning: no previous prototype for '__rvt_error_qp_locked' [-Wmissing-prototypes]
    1275 | int __rvt_error_qp_locked(struct rvt_qp *qp, enum ib_wc_status err)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/__rvt_error_qp_locked +1275 drivers/infiniband/sw/rdmavt/qp.c

  1274	
> 1275	int __rvt_error_qp_locked(struct rvt_qp *qp, enum ib_wc_status err)
  1276	{
  1277		struct ib_wc wc;
  1278		int ret = 0;
  1279		struct rvt_dev_info *rdi = ib_to_rvt(qp->ibqp.device);
  1280	
  1281		lockdep_assert_held(&qp->r_lock);
  1282		lockdep_assert_held(&qp->s_lock);
  1283		if (qp->state == IB_QPS_ERR || qp->state == IB_QPS_RESET)
  1284			goto bail;
  1285	
  1286		qp->state = IB_QPS_ERR;
  1287	
  1288		if (qp->s_flags & (RVT_S_TIMER | RVT_S_WAIT_RNR)) {
  1289			qp->s_flags &= ~(RVT_S_TIMER | RVT_S_WAIT_RNR);
  1290			timer_delete(&qp->s_timer);
  1291		}
  1292	
  1293		if (qp->s_flags & RVT_S_ANY_WAIT_SEND)
  1294			qp->s_flags &= ~RVT_S_ANY_WAIT_SEND;
  1295	
  1296		rdi->driver_f.notify_error_qp(qp);
  1297	
  1298		/* Schedule the sending tasklet to drain the send work queue. */
  1299		if (READ_ONCE(qp->s_last) != qp->s_head)
  1300			rdi->driver_f.schedule_send(qp);
  1301	
  1302		rvt_clear_mr_refs(qp, 0);
  1303	
  1304		memset(&wc, 0, sizeof(wc));
  1305		wc.qp = &qp->ibqp;
  1306		wc.opcode = IB_WC_RECV;
  1307	
  1308		if (test_and_clear_bit(RVT_R_WRID_VALID, &qp->r_aflags)) {
  1309			wc.wr_id = qp->r_wr_id;
  1310			wc.status = err;
  1311			rvt_cq_enter(ibcq_to_rvtcq(qp->ibqp.recv_cq), &wc, 1);
  1312		}
  1313		wc.status = IB_WC_WR_FLUSH_ERR;
  1314	
  1315		if (qp->r_rq.kwq) {
  1316			u32 head;
  1317			u32 tail;
  1318			struct rvt_rwq *wq = NULL;
  1319			struct rvt_krwq *kwq = NULL;
  1320	
  1321			spin_lock(&qp->r_rq.kwq->c_lock);
  1322			/* qp->ip used to validate if there is a  user buffer mmaped */
  1323			if (qp->ip) {
  1324				wq = qp->r_rq.wq;
  1325				head = RDMA_READ_UAPI_ATOMIC(wq->head);
  1326				tail = RDMA_READ_UAPI_ATOMIC(wq->tail);
  1327			} else {
  1328				kwq = qp->r_rq.kwq;
  1329				head = kwq->head;
  1330				tail = kwq->tail;
  1331			}
  1332			/* sanity check pointers before trusting them */
  1333			if (head >= qp->r_rq.size)
  1334				head = 0;
  1335			if (tail >= qp->r_rq.size)
  1336				tail = 0;
  1337			while (tail != head) {
  1338				wc.wr_id = rvt_get_rwqe_ptr(&qp->r_rq, tail)->wr_id;
  1339				if (++tail >= qp->r_rq.size)
  1340					tail = 0;
  1341				rvt_cq_enter(ibcq_to_rvtcq(qp->ibqp.recv_cq), &wc, 1);
  1342			}
  1343			if (qp->ip)
  1344				RDMA_WRITE_UAPI_ATOMIC(wq->tail, tail);
  1345			else
  1346				kwq->tail = tail;
  1347			spin_unlock(&qp->r_rq.kwq->c_lock);
  1348		} else if (qp->ibqp.event_handler) {
  1349			ret = 1;
  1350		}
  1351	
  1352	bail:
  1353		return ret;
  1354	}
  1355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
