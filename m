Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99D1E1E0B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 04:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764563960; cv=none; b=nsWMIZA1SNShsFuJqc0JrDYNrlXbR/+66RsmpxCup+gLGCyRTGCfqACpzafo6NkG7SukbV8VeIhj9+SE9IGtn6U1mdNncyYmfqDqtt/dETfm8b82bSvfiU7rTggbpsY2vRjYIXgc+ZCsa+DoOihGwFaRUy7YqkPcA4//W0oYu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764563960; c=relaxed/simple;
	bh=1xcXG5eOiDPwvHuoxp+0KLOSm7NkfDUN2fpvmfXIU/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9tbcfzn2Xc21ykfGhKlnMg5Fap6LWx4vZJEEGq2Eo3zFxxzaXXqWoPhKqxw4GDVKI6YY5k6TOGN1HuKHwb6M+qNIa7KrFMWS35aWkW/oCxZLTT6dwg0OG0p08r9uETAbesVcQoWXc4hpE8CVclkUMny3v8AIIw3ZLHbQ0R60Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiX2Q+ZU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiX2Q+ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764563959; x=1796099959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1xcXG5eOiDPwvHuoxp+0KLOSm7NkfDUN2fpvmfXIU/o=;
  b=DiX2Q+ZUjrM3UYL2VhNoO6yrHR+OcfsBapwHtvdwGN/sCK+GukDvvc3V
   a9hQ5EzpmP9Gbm6zlpmuTQ7cskX8gdfVPVMDjC9+vgzFbdS+UkKEmoM0T
   mMUlYVrU095GZTeA4UkUa+tiyrLSor3ip9ucFzM+59A8tYP8HFnHDAi8M
   o49euTE/K/k5oPbghQGi2d9/JDa/39ocC7A6zkeZNtBCfeA/GRANRVks9
   /qbuh910ON9phMW2qQLIEOk4KsFyRAfaiGQ1Ry0Pi3YuI6oF6OC4dw4Fs
   LX/oKUQSIuBtONXitCGQZm9ozWbza/hbWozZOJ+KTqrfTpzQPc4OWAoSR
   Q==;
X-CSE-ConnectionGUID: 6qDc9lQqTUmPZLsgQqZECQ==
X-CSE-MsgGUID: mapZv5fWSmy/sn5gdKecCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77598121"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77598121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 20:39:16 -0800
X-CSE-ConnectionGUID: M2TT5fteS2qcjbk8JMtHkw==
X-CSE-MsgGUID: yhZ0bMi3Sby9VFva9d3XPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194752247"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2025 20:39:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPvgu-000000008KL-2Adz;
	Mon, 01 Dec 2025 04:39:12 +0000
Date: Mon, 1 Dec 2025 12:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA
 backed transport mode
Message-ID: <202512011208.AnoqH1AC-lkp@intel.com>
References: <20251129160405.2568284-21-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129160405.2568284-21-den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on next-20251128]
[cannot apply to jonmason-ntb/ntb-next pci/for-linus geert-renesas-devel/next linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251129160405.2568284-21-den%40valinux.co.jp
patch subject: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA backed transport mode
config: riscv-randconfig-r071-20251201 (https://download.01.org/0day-ci/archive/20251201/202512011208.AnoqH1AC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011208.AnoqH1AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011208.AnoqH1AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ntb/ntb_transport_core.c:1286:15: warning: variable 'mw_num' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                      ^
   drivers/ntb/ntb_transport_core.c:1286:23: warning: variable 'mw_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                              ^
   drivers/ntb/ntb_transport_core.c:1286:33: warning: variable 'qp_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                                        ^
>> drivers/ntb/ntb_transport_core.c:1367:47: warning: unused variable 'edma_backend_ops' [-Wunused-const-variable]
    1367 | static const struct ntb_transport_backend_ops edma_backend_ops;
         |                                               ^~~~~~~~~~~~~~~~
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=y] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]

smatch warnings:
drivers/ntb/ntb_transport_core.c:1425 ntb_transport_probe() warn: inconsistent indenting
drivers/ntb/ntb_transport_core.c:2412 ntb_transport_rx_enqueue() warn: variable dereferenced before check 'qp' (see line 2409)
drivers/ntb/ntb_transport_core.c:2451 ntb_transport_tx_enqueue() warn: variable dereferenced before check 'qp' (see line 2447)

vim +/edma_backend_ops +1367 drivers/ntb/ntb_transport_core.c

  1281	
  1282	static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
  1283					    unsigned int qp_num)
  1284	{
  1285		struct ntb_transport_qp *qp;
> 1286		unsigned int mw_num, mw_count, qp_count;
  1287	
  1288		mw_count = nt->mw_count;
  1289		qp_count = nt->qp_count;
  1290	
  1291		mw_num = QP_TO_MW(nt, qp_num);
  1292	
  1293		qp = &nt->qp_vec[qp_num];
  1294		qp->qp_num = qp_num;
  1295		qp->transport = nt;
  1296		qp->ndev = nt->ndev;
  1297		qp->client_ready = false;
  1298		qp->event_handler = NULL;
  1299		ntb_qp_link_context_reset(qp);
  1300	
  1301		if (nt->debugfs_node_dir) {
  1302			char debugfs_name[8];
  1303	
  1304			snprintf(debugfs_name, sizeof(debugfs_name), "qp%d", qp_num);
  1305			qp->debugfs_dir = debugfs_create_dir(debugfs_name,
  1306							     nt->debugfs_node_dir);
  1307	
  1308			qp->debugfs_stats = debugfs_create_file("stats", S_IRUSR,
  1309								qp->debugfs_dir, qp,
  1310								&ntb_qp_debugfs_stats_fops);
  1311		} else {
  1312			qp->debugfs_dir = NULL;
  1313			qp->debugfs_stats = NULL;
  1314		}
  1315	
  1316		INIT_DELAYED_WORK(&qp->link_work, ntb_qp_link_work);
  1317		INIT_WORK(&qp->link_cleanup, ntb_qp_link_cleanup_work);
  1318	
  1319		spin_lock_init(&qp->ntb_rx_q_lock);
  1320		spin_lock_init(&qp->ntb_tx_free_q_lock);
  1321	
  1322		INIT_LIST_HEAD(&qp->rx_post_q);
  1323		INIT_LIST_HEAD(&qp->rx_pend_q);
  1324		INIT_LIST_HEAD(&qp->rx_free_q);
  1325		INIT_LIST_HEAD(&qp->tx_free_q);
  1326	
  1327		tasklet_init(&qp->rxc_db_work, ntb_transport_rxc_db,
  1328			     (unsigned long)qp);
  1329	
  1330		return 0;
  1331	}
  1332	
  1333	static unsigned int ntb_transport_default_tx_free_entry(struct ntb_transport_qp *qp)
  1334	{
  1335		unsigned int head = qp->tx_index;
  1336		unsigned int tail = qp->remote_rx_info->entry;
  1337	
  1338		return tail >= head ? tail - head : qp->tx_max_entry + tail - head;
  1339	}
  1340	
  1341	static int ntb_transport_default_rx_enqueue(struct ntb_transport_qp *qp,
  1342						    struct ntb_queue_entry *entry)
  1343	{
  1344		ntb_list_add(&qp->ntb_rx_q_lock, &entry->entry, &qp->rx_pend_q);
  1345	
  1346		if (qp->active)
  1347			tasklet_schedule(&qp->rxc_db_work);
  1348	
  1349		return 0;
  1350	}
  1351	
  1352	static void ntb_transport_default_rx_poll(struct ntb_transport_qp *qp);
  1353	static int ntb_transport_default_tx_enqueue(struct ntb_transport_qp *qp,
  1354						    struct ntb_queue_entry *entry,
  1355						    void *cb, void *data, unsigned int len,
  1356						    unsigned int flags);
  1357	
  1358	static const struct ntb_transport_backend_ops default_backend_ops = {
  1359		.setup_qp_mw = ntb_transport_default_setup_qp_mw,
  1360		.tx_free_entry = ntb_transport_default_tx_free_entry,
  1361		.tx_enqueue = ntb_transport_default_tx_enqueue,
  1362		.rx_enqueue = ntb_transport_default_rx_enqueue,
  1363		.rx_poll = ntb_transport_default_rx_poll,
  1364		.debugfs_stats_show = ntb_transport_default_debugfs_stats_show,
  1365	};
  1366	
> 1367	static const struct ntb_transport_backend_ops edma_backend_ops;
  1368	
  1369	static int ntb_transport_probe(struct ntb_client *self, struct ntb_dev *ndev)
  1370	{
  1371		struct ntb_transport_ctx *nt;
  1372		struct ntb_transport_mw *mw;
  1373		unsigned int mw_count, qp_count, spad_count, max_mw_count_for_spads;
  1374		u64 qp_bitmap;
  1375		int node;
  1376		int rc, i;
  1377	
  1378		mw_count = ntb_peer_mw_count(ndev);
  1379	
  1380		if (!ndev->ops->mw_set_trans) {
  1381			dev_err(&ndev->dev, "Inbound MW based NTB API is required\n");
  1382			return -EINVAL;
  1383		}
  1384	
  1385		if (ntb_db_is_unsafe(ndev))
  1386			dev_dbg(&ndev->dev,
  1387				"doorbell is unsafe, proceed anyway...\n");
  1388		if (ntb_spad_is_unsafe(ndev))
  1389			dev_dbg(&ndev->dev,
  1390				"scratchpad is unsafe, proceed anyway...\n");
  1391	
  1392		if (ntb_peer_port_count(ndev) != NTB_DEF_PEER_CNT)
  1393			dev_warn(&ndev->dev, "Multi-port NTB devices unsupported\n");
  1394	
  1395		node = dev_to_node(&ndev->dev);
  1396	
  1397		nt = kzalloc_node(sizeof(*nt), GFP_KERNEL, node);
  1398		if (!nt)
  1399			return -ENOMEM;
  1400	
  1401		nt->ndev = ndev;
  1402	
  1403	#ifdef CONFIG_NTB_TRANSPORT_EDMA
  1404		if (use_remote_edma) {
  1405			rc = ntb_transport_edma_init(nt, &mw_count);
  1406			if (rc) {
  1407				nt->mw_count = 0;
  1408				goto err;
  1409			}
  1410			nt->backend_ops = edma_backend_ops;
  1411	
  1412			/*
  1413			 * On remote eDMA mode, we reserve a read channel for Host->EP
  1414			 * interruption.
  1415			 */
  1416			use_msi = false;
  1417		} else
  1418	#endif
  1419			nt->backend_ops = default_backend_ops;
  1420	
  1421		/*
  1422		 * If we are using MSI, and have at least one extra memory window,
  1423		 * we will reserve the last MW for the MSI window.
  1424		 */
> 1425		if (use_msi && mw_count > 1) {
  1426			rc = ntb_msi_init(ndev, ntb_transport_msi_desc_changed);
  1427			if (!rc) {
  1428				mw_count -= 1;
  1429				nt->use_msi = true;
  1430			}
  1431		}
  1432	
  1433		spad_count = ntb_spad_count(ndev);
  1434	
  1435		/* Limit the MW's based on the availability of scratchpads */
  1436	
  1437		if (spad_count < NTB_TRANSPORT_MIN_SPADS) {
  1438			nt->mw_count = 0;
  1439			rc = -EINVAL;
  1440			goto err;
  1441		}
  1442	
  1443		max_mw_count_for_spads = (spad_count - MW0_SZ_HIGH) / 2;
  1444		nt->mw_count = min(mw_count, max_mw_count_for_spads);
  1445	
  1446		nt->msi_spad_offset = nt->mw_count * 2 + MW0_SZ_HIGH;
  1447	
  1448		nt->mw_vec = kcalloc_node(mw_count, sizeof(*nt->mw_vec),
  1449					  GFP_KERNEL, node);
  1450		if (!nt->mw_vec) {
  1451			rc = -ENOMEM;
  1452			goto err;
  1453		}
  1454	
  1455		for (i = 0; i < mw_count; i++) {
  1456			mw = &nt->mw_vec[i];
  1457	
  1458			rc = ntb_peer_mw_get_addr(ndev, i, &mw->phys_addr,
  1459						  &mw->phys_size);
  1460			if (rc)
  1461				goto err1;
  1462	
  1463			mw->vbase = ioremap_wc(mw->phys_addr, mw->phys_size);
  1464			if (!mw->vbase) {
  1465				rc = -ENOMEM;
  1466				goto err1;
  1467			}
  1468	
  1469			mw->buff_size = 0;
  1470			mw->xlat_size = 0;
  1471			mw->virt_addr = NULL;
  1472			mw->dma_addr = 0;
  1473		}
  1474	
  1475		qp_bitmap = ntb_db_valid_mask(ndev);
  1476	
  1477		qp_count = ilog2(qp_bitmap);
  1478		if (nt->use_msi) {
  1479			qp_count -= 1;
  1480			nt->msi_db_mask = BIT_ULL(qp_count);
  1481			ntb_db_clear_mask(ndev, nt->msi_db_mask);
  1482		}
  1483	
  1484		if (max_num_clients && max_num_clients < qp_count)
  1485			qp_count = max_num_clients;
  1486	
  1487		qp_bitmap &= BIT_ULL(qp_count) - 1;
  1488	
  1489		nt->qp_count = qp_count;
  1490		nt->qp_bitmap = qp_bitmap;
  1491		nt->qp_bitmap_free = qp_bitmap;
  1492	
  1493		nt->qp_vec = kcalloc_node(qp_count, sizeof(*nt->qp_vec),
  1494					  GFP_KERNEL, node);
  1495		if (!nt->qp_vec) {
  1496			rc = -ENOMEM;
  1497			goto err1;
  1498		}
  1499	
  1500		if (nt_debugfs_dir) {
  1501			nt->debugfs_node_dir =
  1502				debugfs_create_dir(pci_name(ndev->pdev),
  1503						   nt_debugfs_dir);
  1504		}
  1505	
  1506		for (i = 0; i < qp_count; i++) {
  1507			rc = ntb_transport_init_queue(nt, i);
  1508			if (rc)
  1509				goto err2;
  1510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
