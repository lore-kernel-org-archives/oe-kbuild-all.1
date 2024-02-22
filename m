Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7FF14E2C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617107; cv=none; b=prBccqTF37Synl8hAuU0CnN2QKY0/gNREt5Tk8OZ51C/cmKmTC/gnUHoZeAEjlW8+Omj/05gD4CAnFxoYV5T4QacBuWdPg5Vt9R3ynfrS9kEixqbYrYw3RWB8TdNe6t1hYG7+H/wLtuTJjC+Bnx+UF0dXKTPrBCSiTfnULAdv9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617107; c=relaxed/simple;
	bh=vYOM1F/KMaw0z4WaI06kVXsRMTaxMe5qi91V6azCWhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=APv3o3n6ffn3XOJEvCrYNpVgoPyTVnJsyvfEHklje+fgzd9+IV+S9fT2fmqCbHNkLXYd4jWoXRVZOYkWPPfu3pyry27oO7zCcNrBly7Fe8KFf5+csclKF/UJlqgDYcxHrQnkn3wQ9HGnpqxr7wvTVV63C8s7+BamGmFgF1M8+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/qvtxTN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/qvtxTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708617106; x=1740153106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYOM1F/KMaw0z4WaI06kVXsRMTaxMe5qi91V6azCWhI=;
  b=C/qvtxTN2ZM6BnbtpBU/njLBa7wC73OFjGBAMaPoSb9Zii3DxQIEZD5x
   yrpOxCyg9KON7b7J11RAx3+Q2BbMANNDN4yUtN5Eua1t9CxbC0DxVWnXL
   OctJtBRZZtyH5fO7iGCXLqHFBdwewfKYGpQncujK9wT58kjRrQzdONj9Y
   R8m1o316/f7j/WhBvwFJARMxmxRSSPO5PzkmZUoFA+GXBDTgnYH39X6FX
   cP21Ll3ZVZI15tJekVuvCOBy90bsu5++MVuzn91Pwpfuz6p4xMtxRDhzS
   xqXHKwjNj5gNJnmcq+SAmsxZ1odtppPdFLM6zz1KlUAxB5z888js53Vba
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13551178"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13551178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10263673"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2024 07:51:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdBMJ-0006SC-2j;
	Thu, 22 Feb 2024 15:51:39 +0000
Date: Thu, 22 Feb 2024 23:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/block/xen-blkfront.c:1569:17: error: implicit declaration of
 function 'RING_COPY_RESPONSE'; did you mean 'RING_GET_RESPONSE'?
Message-ID: <202402222333.tEB3ItCd-lkp@intel.com>
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
commit: 3da388c649201db4324bae7d127eac06cfb23215 xen/blkfront: read response from backend only once
date:   1 year, 3 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240222/202402222333.tEB3ItCd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222333.tEB3ItCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222333.tEB3ItCd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/xen-blkfront.c: In function 'blkif_interrupt':
>> drivers/block/xen-blkfront.c:1569:17: error: implicit declaration of function 'RING_COPY_RESPONSE'; did you mean 'RING_GET_RESPONSE'? [-Werror=implicit-function-declaration]
    1569 |                 RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 RING_GET_RESPONSE
   cc1: some warnings being treated as errors


vim +1569 drivers/block/xen-blkfront.c

  1548	
  1549	static irqreturn_t blkif_interrupt(int irq, void *dev_id)
  1550	{
  1551		struct request *req;
  1552		struct blkif_response bret;
  1553		RING_IDX i, rp;
  1554		unsigned long flags;
  1555		struct blkfront_ring_info *rinfo = (struct blkfront_ring_info *)dev_id;
  1556		struct blkfront_info *info = rinfo->dev_info;
  1557	
  1558		if (unlikely(info->connected != BLKIF_STATE_CONNECTED))
  1559			return IRQ_HANDLED;
  1560	
  1561		spin_lock_irqsave(&rinfo->ring_lock, flags);
  1562	 again:
  1563		rp = rinfo->ring.sring->rsp_prod;
  1564		rmb(); /* Ensure we see queued responses up to 'rp'. */
  1565	
  1566		for (i = rinfo->ring.rsp_cons; i != rp; i++) {
  1567			unsigned long id;
  1568	
> 1569			RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
  1570			id = bret.id;
  1571	
  1572			/*
  1573			 * The backend has messed up and given us an id that we would
  1574			 * never have given to it (we stamp it up to BLK_RING_SIZE -
  1575			 * look in get_id_from_freelist.
  1576			 */
  1577			if (id >= BLK_RING_SIZE(info)) {
  1578				WARN(1, "%s: response to %s has incorrect id (%ld)\n",
  1579				     info->gd->disk_name, op_name(bret.operation), id);
  1580				/* We can't safely get the 'struct request' as
  1581				 * the id is busted. */
  1582				continue;
  1583			}
  1584			req  = rinfo->shadow[id].request;
  1585	
  1586			if (bret.operation != BLKIF_OP_DISCARD) {
  1587				/*
  1588				 * We may need to wait for an extra response if the
  1589				 * I/O request is split in 2
  1590				 */
  1591				if (!blkif_completion(&id, rinfo, &bret))
  1592					continue;
  1593			}
  1594	
  1595			if (add_id_to_freelist(rinfo, id)) {
  1596				WARN(1, "%s: response to %s (id %ld) couldn't be recycled!\n",
  1597				     info->gd->disk_name, op_name(bret.operation), id);
  1598				continue;
  1599			}
  1600	
  1601			if (bret.status == BLKIF_RSP_OKAY)
  1602				blkif_req(req)->error = BLK_STS_OK;
  1603			else
  1604				blkif_req(req)->error = BLK_STS_IOERR;
  1605	
  1606			switch (bret.operation) {
  1607			case BLKIF_OP_DISCARD:
  1608				if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
  1609					struct request_queue *rq = info->rq;
  1610					printk(KERN_WARNING "blkfront: %s: %s op failed\n",
  1611						   info->gd->disk_name, op_name(bret.operation));
  1612					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1613					info->feature_discard = 0;
  1614					info->feature_secdiscard = 0;
  1615					blk_queue_flag_clear(QUEUE_FLAG_DISCARD, rq);
  1616					blk_queue_flag_clear(QUEUE_FLAG_SECERASE, rq);
  1617				}
  1618				break;
  1619			case BLKIF_OP_FLUSH_DISKCACHE:
  1620			case BLKIF_OP_WRITE_BARRIER:
  1621				if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
  1622					printk(KERN_WARNING "blkfront: %s: %s op failed\n",
  1623					       info->gd->disk_name, op_name(bret.operation));
  1624					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1625				}
  1626				if (unlikely(bret.status == BLKIF_RSP_ERROR &&
  1627					     rinfo->shadow[id].req.u.rw.nr_segments == 0)) {
  1628					printk(KERN_WARNING "blkfront: %s: empty %s op failed\n",
  1629					       info->gd->disk_name, op_name(bret.operation));
  1630					blkif_req(req)->error = BLK_STS_NOTSUPP;
  1631				}
  1632				if (unlikely(blkif_req(req)->error)) {
  1633					if (blkif_req(req)->error == BLK_STS_NOTSUPP)
  1634						blkif_req(req)->error = BLK_STS_OK;
  1635					info->feature_fua = 0;
  1636					info->feature_flush = 0;
  1637					xlvbd_flush(info);
  1638				}
  1639				/* fall through */
  1640			case BLKIF_OP_READ:
  1641			case BLKIF_OP_WRITE:
  1642				if (unlikely(bret.status != BLKIF_RSP_OKAY))
  1643					dev_dbg(&info->xbdev->dev, "Bad return from blkdev data "
  1644						"request: %x\n", bret.status);
  1645	
  1646				break;
  1647			default:
  1648				BUG();
  1649			}
  1650	
  1651			blk_mq_complete_request(req);
  1652		}
  1653	
  1654		rinfo->ring.rsp_cons = i;
  1655	
  1656		if (i != rinfo->ring.req_prod_pvt) {
  1657			int more_to_do;
  1658			RING_FINAL_CHECK_FOR_RESPONSES(&rinfo->ring, more_to_do);
  1659			if (more_to_do)
  1660				goto again;
  1661		} else
  1662			rinfo->ring.sring->rsp_event = i + 1;
  1663	
  1664		kick_pending_request_queues_locked(rinfo);
  1665	
  1666		spin_unlock_irqrestore(&rinfo->ring_lock, flags);
  1667	
  1668		return IRQ_HANDLED;
  1669	}
  1670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
