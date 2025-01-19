Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05A8194147
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737279384; cv=none; b=Mp2Q33tdjS2j0JG5t9bh6F2bjMKJUVDySyYjXmxDortfqUZvVvu/6bOhWyQxrl/yEMFfLTanM4bE2jhr1yHSsdDICAhDMP2sYZI6zKgR9qkKvtQn62oX8I/+i7eRT4gEyYN0hGJgltpudWdQmOL20+h6li1csU6UXhxYQUb8uX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737279384; c=relaxed/simple;
	bh=PI8U1FCGzoxTYpWVmKC/NTuhDujJxTY7lytkKpCZxbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRNu+849Q4U1azoFV+oI9prIGcyL3BhvpBLXGKlM3hs3alpP1NI8GCgWikJOlZqsPQvKjroQ9C4w24Wuxpl8jq7oayX46nIrKTgblrLaYvs17JLmOdudfCQ8gmNzOjJHC+MIBJ79eUNUibKUgvaqKcg1FrQl5EYgvOzTFh7yPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7/ywe1U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7/ywe1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737279383; x=1768815383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PI8U1FCGzoxTYpWVmKC/NTuhDujJxTY7lytkKpCZxbk=;
  b=D7/ywe1UzFB2O1r0A57tlYk5JeeSU13gDDpFHl/yAGkWUq0PdTt0vuks
   yaJqk+7vb3XxYhbl9WMiVujLNSsMS+mKqkVk/6Fm9xsyFMKJUrFnRGWLA
   NYNeLzavbJz4yCoO+5jQ7r94jOTCC9e5INJ1tx0n1xbZBUlgxdCfWBDIR
   aDqMVfbf7E+KoZyWrmZ7SUDZJ5+yzIDxWZQnRPaIiqtRyIc+pTJxdtJBn
   MFgxI6l5OuVBT4FSHLrcwTHaPlcQSk+F+iyGmraW/tkpbDKxSVsIOAPB3
   snauhv3gzgBQCn4ynx5RUVyjEZavgXK4KGKlztSz+rEHC7q9ThCKk8A/7
   A==;
X-CSE-ConnectionGUID: FYYIoymmSyWtMLTX/fUN0w==
X-CSE-MsgGUID: wjY9PjwBRLGnaDfAMIoD1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37773291"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37773291"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 01:36:21 -0800
X-CSE-ConnectionGUID: 3nAM2X1rSG60PrwU3qLS/g==
X-CSE-MsgGUID: XTx8fTS+Sc2BIBKqmQJg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106659019"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 01:36:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZRj7-000VKU-1J;
	Sun, 19 Jan 2025 09:36:17 +0000
Date: Sun, 19 Jan 2025 17:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1355:47: warning:
 '%d' directive output may be truncated writing between 1 and 5 bytes into a
 region of size between 1 and 16
Message-ID: <202501191754.rHed7h4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rahul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fda5e3f284002ea55dac1c98c1498d6dd684046e
commit: 2b465ed00f7db9c5b2aca95a91671f86282b1822 cxgb4: add support for mirror Rxqs
date:   4 years, 7 months ago
config: x86_64-randconfig-104-20240627 (https://download.01.org/0day-ci/archive/20250119/202501191754.rHed7h4L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191754.rHed7h4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191754.rHed7h4L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c: In function 'cxgb4_port_mirror_alloc_queues':
>> drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1355:47: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
    1355 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                               ^~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1355:34: note: directive argument in the range [0, 65534]
    1355 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                  ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1353:25: note: 'snprintf' output between 12 and 31 bytes into a destination of size 26
    1353 |                         snprintf(mirror_rxq->msix->desc,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1354 |                                  sizeof(mirror_rxq->msix->desc),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1355 |                                  "%s-mirrorrxq%d", dev->name, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1355 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c

  1315	
  1316	static int cxgb4_port_mirror_alloc_queues(struct net_device *dev)
  1317	{
  1318		struct port_info *pi = netdev2pinfo(dev);
  1319		struct adapter *adap = netdev2adap(dev);
  1320		struct sge_eth_rxq *mirror_rxq;
  1321		struct sge *s = &adap->sge;
  1322		int ret = 0, msix = 0;
  1323		u16 i, rxqid;
  1324		u16 *rss;
  1325	
  1326		if (!pi->vi_mirror_count)
  1327			return 0;
  1328	
  1329		if (s->mirror_rxq[pi->port_id])
  1330			return 0;
  1331	
  1332		mirror_rxq = kcalloc(pi->nmirrorqsets, sizeof(*mirror_rxq), GFP_KERNEL);
  1333		if (!mirror_rxq)
  1334			return -ENOMEM;
  1335	
  1336		s->mirror_rxq[pi->port_id] = mirror_rxq;
  1337	
  1338		if (!(adap->flags & CXGB4_USING_MSIX))
  1339			msix = -((int)adap->sge.intrq.abs_id + 1);
  1340	
  1341		for (i = 0, rxqid = 0; i < pi->nmirrorqsets; i++, rxqid++) {
  1342			mirror_rxq = &s->mirror_rxq[pi->port_id][i];
  1343	
  1344			/* Allocate Mirror Rxqs */
  1345			if (msix >= 0) {
  1346				msix = cxgb4_get_msix_idx_from_bmap(adap);
  1347				if (msix < 0) {
  1348					ret = msix;
  1349					goto out_free_queues;
  1350				}
  1351	
  1352				mirror_rxq->msix = &adap->msix_info[msix];
  1353				snprintf(mirror_rxq->msix->desc,
  1354					 sizeof(mirror_rxq->msix->desc),
> 1355					 "%s-mirrorrxq%d", dev->name, i);
  1356			}
  1357	
  1358			init_rspq(adap, &mirror_rxq->rspq,
  1359				  CXGB4_MIRROR_RXQ_DEFAULT_INTR_USEC,
  1360				  CXGB4_MIRROR_RXQ_DEFAULT_PKT_CNT,
  1361				  CXGB4_MIRROR_RXQ_DEFAULT_DESC_NUM,
  1362				  CXGB4_MIRROR_RXQ_DEFAULT_DESC_SIZE);
  1363	
  1364			mirror_rxq->fl.size = CXGB4_MIRROR_FLQ_DEFAULT_DESC_NUM;
  1365	
  1366			ret = t4_sge_alloc_rxq(adap, &mirror_rxq->rspq, false,
  1367					       dev, msix, &mirror_rxq->fl,
  1368					       t4_ethrx_handler, NULL, 0);
  1369			if (ret)
  1370				goto out_free_msix_idx;
  1371	
  1372			/* Setup MSI-X vectors for Mirror Rxqs */
  1373			if (adap->flags & CXGB4_USING_MSIX) {
  1374				ret = request_irq(mirror_rxq->msix->vec,
  1375						  t4_sge_intr_msix, 0,
  1376						  mirror_rxq->msix->desc,
  1377						  &mirror_rxq->rspq);
  1378				if (ret)
  1379					goto out_free_rxq;
  1380	
  1381				cxgb4_set_msix_aff(adap, mirror_rxq->msix->vec,
  1382						   &mirror_rxq->msix->aff_mask, i);
  1383			}
  1384	
  1385			/* Start NAPI for Mirror Rxqs */
  1386			cxgb4_enable_rx(adap, &mirror_rxq->rspq);
  1387		}
  1388	
  1389		/* Setup RSS for Mirror Rxqs */
  1390		rss = kcalloc(pi->rss_size, sizeof(u16), GFP_KERNEL);
  1391		if (!rss) {
  1392			ret = -ENOMEM;
  1393			goto out_free_queues;
  1394		}
  1395	
  1396		mirror_rxq = &s->mirror_rxq[pi->port_id][0];
  1397		for (i = 0; i < pi->rss_size; i++)
  1398			rss[i] = mirror_rxq[i % pi->nmirrorqsets].rspq.abs_id;
  1399	
  1400		ret = cxgb4_config_rss(pi, rss, pi->rss_size, pi->viid_mirror);
  1401		kfree(rss);
  1402		if (ret)
  1403			goto out_free_queues;
  1404	
  1405		return 0;
  1406	
  1407	out_free_rxq:
  1408		free_rspq_fl(adap, &mirror_rxq->rspq, &mirror_rxq->fl);
  1409	
  1410	out_free_msix_idx:
  1411		cxgb4_free_msix_idx_in_bmap(adap, mirror_rxq->msix->idx);
  1412	
  1413	out_free_queues:
  1414		while (rxqid-- > 0)
  1415			cxgb4_port_mirror_free_rxq(adap,
  1416						   &s->mirror_rxq[pi->port_id][rxqid]);
  1417	
  1418		kfree(s->mirror_rxq[pi->port_id]);
  1419		s->mirror_rxq[pi->port_id] = NULL;
  1420		return ret;
  1421	}
  1422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
