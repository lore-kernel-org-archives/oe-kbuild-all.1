Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D212D203
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708639167; cv=none; b=k6fKrRZhnHC/Pt2bMI1tZ//ysLDS225zQoIyosTwmq6h/XzO4rfHUvPj8icez88RZ0pKeQKnfLeLfRwT1IJDgq9Pm7iDRIgT4aTYzwIt08h/JedLG6Nmq75hYAWMSfo9cJL8OcilC/EVG8stjArKDGOWkQcGiAL9L2uizbRbB5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708639167; c=relaxed/simple;
	bh=DFI8lGoPiwVUcf59XT4ZTb7ijKlHXUSEqGrfT60KDgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idCXp90qe8CUznp6eNOBTv6aWifim03jxqUGKREE1uYjgnj0AIy+Ap6Md+1Kc6dissbYn3Gx4cqvghWi9Sqzc1gSzrfMSAnEXPlJLgT1DS+r2RtWyHJ5pUFfqw5pHHfbCAWGsdbSVrL2adRWs2Dja9FLUvkp39RsdLH1RZwUXV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAWdXrb/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAWdXrb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708639165; x=1740175165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFI8lGoPiwVUcf59XT4ZTb7ijKlHXUSEqGrfT60KDgE=;
  b=gAWdXrb/sWdpyYLj1BjfZFPWvmPWcyMIulbbknlDf9i2EAhmmT1AFjfE
   tENamL4Xq1Z0k0NLhpf+LkKT8b064BGbeFrzoCUmndc0iAfH10lI7MKLt
   D7qiFWHg8XZ984HGWRS8curdEK9BbhKGmihTEG0sC/6kea6YgYeh2EwUp
   X6n7aNgIBzBEIMTVu4ydu+EOkDZaNNiMNt0ZxUM3P86RrX5TcnWSXWHG1
   7SyKfxstTZzg9RjOnRDEP/xNlNT3VJRIF9+RFBrhbWz+GCJf4n51dCfvw
   Akgy4lxbKquNLLGYWlVD2LsVDzdkhsHsDtMy+MJvtVd6yCrAwZOOzzWU0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3010886"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3010886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 13:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="36447641"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Feb 2024 13:59:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdH66-0006kg-03;
	Thu, 22 Feb 2024 21:59:19 +0000
Date: Fri, 23 Feb 2024 05:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/block/xen-blkfront.c:1576:13: error: implicit declaration of
 function 'RING_RESPONSE_PROD_OVERFLOW'; did you mean
 'RING_REQUEST_PROD_OVERFLOW'?
Message-ID: <202402230523.S90mhSpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: ece6cd0b8961263813a12d2ee8f055a92dd2f436 xen/blkfront: don't trust the backend response data blindly
date:   1 year, 3 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240223/202402230523.S90mhSpE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230523.S90mhSpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230523.S90mhSpE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/xen-blkfront.c: In function 'blkif_interrupt':
>> drivers/block/xen-blkfront.c:1576:13: error: implicit declaration of function 'RING_RESPONSE_PROD_OVERFLOW'; did you mean 'RING_REQUEST_PROD_OVERFLOW'? [-Werror=implicit-function-declaration]
    1576 |         if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             RING_REQUEST_PROD_OVERFLOW
   drivers/block/xen-blkfront.c:1586:17: error: implicit declaration of function 'RING_COPY_RESPONSE'; did you mean 'RING_GET_RESPONSE'? [-Werror=implicit-function-declaration]
    1586 |                 RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 RING_GET_RESPONSE
   cc1: some warnings being treated as errors


vim +1576 drivers/block/xen-blkfront.c

  1559	
  1560	static irqreturn_t blkif_interrupt(int irq, void *dev_id)
  1561	{
  1562		struct request *req;
  1563		struct blkif_response bret;
  1564		RING_IDX i, rp;
  1565		unsigned long flags;
  1566		struct blkfront_ring_info *rinfo = (struct blkfront_ring_info *)dev_id;
  1567		struct blkfront_info *info = rinfo->dev_info;
  1568	
  1569		if (unlikely(info->connected != BLKIF_STATE_CONNECTED))
  1570			return IRQ_HANDLED;
  1571	
  1572		spin_lock_irqsave(&rinfo->ring_lock, flags);
  1573	 again:
  1574		rp = READ_ONCE(rinfo->ring.sring->rsp_prod);
  1575		virt_rmb(); /* Ensure we see queued responses up to 'rp'. */
> 1576		if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
  1577			pr_alert("%s: illegal number of responses %u\n",
  1578				 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
  1579			goto err;
  1580		}
  1581	
  1582		for (i = rinfo->ring.rsp_cons; i != rp; i++) {
  1583			unsigned long id;
  1584			unsigned int op;
  1585	
  1586			RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
  1587			id = bret.id;
  1588	
  1589			/*
  1590			 * The backend has messed up and given us an id that we would
  1591			 * never have given to it (we stamp it up to BLK_RING_SIZE -
  1592			 * look in get_id_from_freelist.
  1593			 */
  1594			if (id >= BLK_RING_SIZE(info)) {
  1595				pr_alert("%s: response has incorrect id (%ld)\n",
  1596					 info->gd->disk_name, id);
  1597				goto err;
  1598			}
  1599			if (rinfo->shadow[id].status != REQ_WAITING) {
  1600				pr_alert("%s: response references no pending request\n",
  1601					 info->gd->disk_name);
  1602				goto err;
  1603			}
  1604	
  1605			rinfo->shadow[id].status = REQ_PROCESSING;
  1606			req  = rinfo->shadow[id].request;
  1607	
  1608			op = rinfo->shadow[id].req.operation;
  1609			if (op == BLKIF_OP_INDIRECT)
  1610				op = rinfo->shadow[id].req.u.indirect.indirect_op;
  1611			if (bret.operation != op) {
  1612				pr_alert("%s: response has wrong operation (%u instead of %u)\n",
  1613					 info->gd->disk_name, bret.operation, op);
  1614				goto err;
  1615			}
  1616	
  1617			if (bret.operation != BLKIF_OP_DISCARD) {
  1618				/*
  1619				 * We may need to wait for an extra response if the
  1620				 * I/O request is split in 2
  1621				 */
  1622				if (!blkif_completion(&id, rinfo, &bret))
  1623					continue;
  1624			}
  1625	
  1626			if (add_id_to_freelist(rinfo, id)) {
  1627				WARN(1, "%s: response to %s (id %ld) couldn't be recycled!\n",
  1628				     info->gd->disk_name, op_name(bret.operation), id);
  1629				continue;
  1630			}
  1631	
  1632			if (bret.status == BLKIF_RSP_OKAY)
  1633				blkif_req(req)->error = BLK_STS_OK;
  1634			else
  1635				blkif_req(req)->error = BLK_STS_IOERR;
  1636	
  1637			switch (bret.operation) {
  1638			case BLKIF_OP_DISCARD:
  1639				if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
  1640					struct request_queue *rq = info->rq;
  1641	
  1642					pr_warn_ratelimited("blkfront: %s: %s op failed\n",
  1643						   info->gd->disk_name, op_name(bret.operation));
  1644					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1645					info->feature_discard = 0;
  1646					info->feature_secdiscard = 0;
  1647					blk_queue_flag_clear(QUEUE_FLAG_DISCARD, rq);
  1648					blk_queue_flag_clear(QUEUE_FLAG_SECERASE, rq);
  1649				}
  1650				break;
  1651			case BLKIF_OP_FLUSH_DISKCACHE:
  1652			case BLKIF_OP_WRITE_BARRIER:
  1653				if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
  1654					pr_warn_ratelimited("blkfront: %s: %s op failed\n",
  1655					       info->gd->disk_name, op_name(bret.operation));
  1656					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1657				}
  1658				if (unlikely(bret.status == BLKIF_RSP_ERROR &&
  1659					     rinfo->shadow[id].req.u.rw.nr_segments == 0)) {
  1660					pr_warn_ratelimited("blkfront: %s: empty %s op failed\n",
  1661					       info->gd->disk_name, op_name(bret.operation));
  1662					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1663				}
  1664				if (unlikely(blkif_req(req)->error)) {
  1665					if (blkif_req(req)->error == BLK_STS_NOTSUPP)
  1666						blkif_req(req)->error = BLK_STS_OK;
  1667					info->feature_fua = 0;
  1668					info->feature_flush = 0;
  1669					xlvbd_flush(info);
  1670				}
  1671				/* fall through */
  1672			case BLKIF_OP_READ:
  1673			case BLKIF_OP_WRITE:
  1674				if (unlikely(bret.status != BLKIF_RSP_OKAY))
  1675					dev_dbg_ratelimited(&info->xbdev->dev,
  1676						"Bad return from blkdev data request: %#x\n",
  1677						bret.status);
  1678	
  1679				break;
  1680			default:
  1681				BUG();
  1682			}
  1683	
  1684			blk_mq_complete_request(req);
  1685		}
  1686	
  1687		rinfo->ring.rsp_cons = i;
  1688	
  1689		if (i != rinfo->ring.req_prod_pvt) {
  1690			int more_to_do;
  1691			RING_FINAL_CHECK_FOR_RESPONSES(&rinfo->ring, more_to_do);
  1692			if (more_to_do)
  1693				goto again;
  1694		} else
  1695			rinfo->ring.sring->rsp_event = i + 1;
  1696	
  1697		kick_pending_request_queues_locked(rinfo);
  1698	
  1699		spin_unlock_irqrestore(&rinfo->ring_lock, flags);
  1700	
  1701		return IRQ_HANDLED;
  1702	
  1703	 err:
  1704		info->connected = BLKIF_STATE_ERROR;
  1705	
  1706		spin_unlock_irqrestore(&rinfo->ring_lock, flags);
  1707	
  1708		pr_alert("%s disabled for further use\n", info->gd->disk_name);
  1709		return IRQ_HANDLED;
  1710	}
  1711	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
