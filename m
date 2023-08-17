Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C81095A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692263606; x=1723799606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hb2I16/PcBXDU/MC/rPsad+K7woUW/aRaHMiIrqhuPA=;
  b=dxSQP71k3FEEaWoypesun5jcE2uhzghNQtm+1STvuB3at1Feb/6+opfV
   GDultLND2SRIiEFAs0gbjmFCNhYcWiRtX3HRpD3tvn4AHtsA/36xdxk2G
   nFxgHodCedSxI4jfgsHt4Le1nUOkvC65fK4csQcl055hPYUpmdUaWHlbR
   913k0wHnv+HS7CTXgV5B5NCFEQu4GVFPTXQkjIhr5zxudWVYU5ZXty3Gv
   KNsaLamfFfGofgtLpIJwtkwJmLEC+z68dueiSAcsmiGpVuSW3KVFXQwLT
   pmoPQ4c7t6eljrnrwyUfM9cqlNUXXQ/opOwUxM8ej+TjzoZqwZlJRgDNM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375522888"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="375522888"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763983671"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="763983671"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 02:13:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWZ4D-0000zZ-2J;
	Thu, 17 Aug 2023 09:13:21 +0000
Date: Thu, 17 Aug 2023 17:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dean Luick <dean.luick@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream_20230815-1 8/26]
 drivers/infiniband/hw/hfi1/init.c:1213: warning: Function parameter or
 member 'params' not described in 'hfi1_alloc_devdata'
Message-ID: <202308171720.XYG9JyX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20230815-1
head:   0abd733228fcd2852956680f4afba278548db977
commit: 3b7ed883d98076202b7be0801cca71f5829decd3 [8/26] RDMA/hfi1: Add per-ASIC parameter structure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308171720.XYG9JyX1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171720.XYG9JyX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171720.XYG9JyX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi1/init.c:1213: warning: Function parameter or member 'params' not described in 'hfi1_alloc_devdata'
>> drivers/infiniband/hw/hfi1/init.c:1213: warning: Excess function parameter 'extra' description in 'hfi1_alloc_devdata'


vim +1213 drivers/infiniband/hw/hfi1/init.c

7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1201  
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1202  /**
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1203   * hfi1_alloc_devdata - Allocate our primary per-unit data structure.
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1204   * @pdev: Valid PCI device
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1205   * @extra: How many bytes to alloc past the default
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1206   *
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1207   * Must be done via verbs allocator, because the verbs cleanup process
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1208   * both does cleanup and free of the data structure.
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1209   * "extra" is for chip-specific data.
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1210   */
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1211  static struct hfi1_devdata *hfi1_alloc_devdata(struct pci_dev *pdev,
3b7ed883d98076 drivers/infiniband/hw/hfi1/init.c Dean Luick          2023-05-25  1212  					       const struct chip_params *params)
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30 @1213  {
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1214  	struct hfi1_devdata *dd;
3b7ed883d98076 drivers/infiniband/hw/hfi1/init.c Dean Luick          2023-05-25  1215  	size_t extra;
7af6d00654a16c drivers/staging/rdma/hfi1/init.c  Dennis Dalessandro  2016-01-19  1216  	int ret, nports;
7af6d00654a16c drivers/staging/rdma/hfi1/init.c  Dennis Dalessandro  2016-01-19  1217  
3b7ed883d98076 drivers/infiniband/hw/hfi1/init.c Dean Luick          2023-05-25  1218  	nports = params->num_ports;
3b7ed883d98076 drivers/infiniband/hw/hfi1/init.c Dean Luick          2023-05-25  1219  	extra = nports * sizeof(struct hfi1_pportdata);
7af6d00654a16c drivers/staging/rdma/hfi1/init.c  Dennis Dalessandro  2016-01-19  1220  	dd = (struct hfi1_devdata *)rvt_alloc_device(sizeof(*dd) + extra,
7af6d00654a16c drivers/staging/rdma/hfi1/init.c  Dennis Dalessandro  2016-01-19  1221  						     nports);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1222  	if (!dd)
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1223  		return ERR_PTR(-ENOMEM);
3b7ed883d98076 drivers/infiniband/hw/hfi1/init.c Dean Luick          2023-05-25  1224  	dd->params = params;
7af6d00654a16c drivers/staging/rdma/hfi1/init.c  Dennis Dalessandro  2016-01-19  1225  	dd->num_pports = nports;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1226  	dd->pport = (struct hfi1_pportdata *)(dd + 1);
45d924571a5e13 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-01  1227  	dd->pcidev = pdev;
45d924571a5e13 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-01  1228  	pci_set_drvdata(pdev, dd);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1229  
03b92789e5cfda drivers/infiniband/hw/hfi1/init.c Matthew Wilcox      2019-02-08  1230  	ret = xa_alloc_irq(&hfi1_dev_table, &dd->unit, dd, xa_limit_32b,
03b92789e5cfda drivers/infiniband/hw/hfi1/init.c Matthew Wilcox      2019-02-08  1231  			GFP_KERNEL);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1232  	if (ret < 0) {
57f97e96625fe8 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1233  		dev_err(&pdev->dev,
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1234  			"Could not allocate unit ID: error %d\n", -ret);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1235  		goto bail;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1236  	}
5084c8ff21f202 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2017-12-18  1237  	rvt_set_ibdev_name(&dd->verbs_dev.rdi, "%s_%d", class_name(), dd->unit);
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1238  	/*
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1239  	 * If the BIOS does not have the NUMA node information set, select
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1240  	 * NUMA 0 so we get consistent performance.
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1241  	 */
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1242  	dd->node = pcibus_to_node(pdev->bus);
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1243  	if (dd->node == NUMA_NO_NODE) {
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1244  		dd_dev_err(dd, "Invalid PCI NUMA node. Performance may be affected\n");
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1245  		dd->node = 0;
5de61a47eb9064 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-03-29  1246  	}
5084c8ff21f202 drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2017-12-18  1247  
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1248  	/*
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1249  	 * Initialize all locks for the device. This needs to be as early as
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1250  	 * possible so locks are usable.
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1251  	 */
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1252  	spin_lock_init(&dd->sc_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1253  	spin_lock_init(&dd->sendctrl_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1254  	spin_lock_init(&dd->rcvctrl_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1255  	spin_lock_init(&dd->uctxt_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1256  	spin_lock_init(&dd->hfi1_diag_trans_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1257  	spin_lock_init(&dd->sc_init_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1258  	spin_lock_init(&dd->dc8051_memlock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1259  	seqlock_init(&dd->sc2vl_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1260  	spin_lock_init(&dd->sde_map_lock);
35f6befc8441d2 drivers/staging/rdma/hfi1/init.c  Jubin John          2016-02-14  1261  	spin_lock_init(&dd->pio_map_lock);
22546b741af835 drivers/infiniband/hw/hfi1/init.c Tadeusz Struk       2017-04-28  1262  	mutex_init(&dd->dc8051_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1263  	init_waitqueue_head(&dd->event_queue);
a2f7bbdc2dba0e drivers/infiniband/hw/hfi1/init.c Michael J. Ruhl     2018-08-15  1264  	spin_lock_init(&dd->irq_src_lock);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1265  
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1266  	dd->int_counter = alloc_percpu(u64);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1267  	if (!dd->int_counter) {
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1268  		ret = -ENOMEM;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1269  		goto bail;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1270  	}
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1271  
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1272  	dd->rcv_limit = alloc_percpu(u64);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1273  	if (!dd->rcv_limit) {
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1274  		ret = -ENOMEM;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1275  		goto bail;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1276  	}
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1277  
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1278  	dd->send_schedule = alloc_percpu(u64);
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1279  	if (!dd->send_schedule) {
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1280  		ret = -ENOMEM;
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1281  		goto bail;
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1282  	}
89abfc8d64dd1a drivers/staging/rdma/hfi1/init.c  Vennila Megavannan  2016-02-03  1283  
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1284  	dd->tx_opstats = alloc_percpu(struct hfi1_opcode_stats_perctx);
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1285  	if (!dd->tx_opstats) {
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1286  		ret = -ENOMEM;
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1287  		goto bail;
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1288  	}
1b311f8931cfe5 drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2017-10-23  1289  
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1290  	dd->comp_vect = kzalloc(sizeof(*dd->comp_vect), GFP_KERNEL);
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1291  	if (!dd->comp_vect) {
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1292  		ret = -ENOMEM;
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1293  		goto bail;
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1294  	}
5d18ee67d4c173 drivers/infiniband/hw/hfi1/init.c Sebastian Sanchez   2018-05-02  1295  
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1296  	/* allocate dummy tail memory for all receive contexts */
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1297  	dd->rcvhdrtail_dummy_kvaddr =
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1298  		dma_alloc_coherent(&dd->pcidev->dev, sizeof(u64),
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1299  				   &dd->rcvhdrtail_dummy_dma, GFP_KERNEL);
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1300  	if (!dd->rcvhdrtail_dummy_kvaddr) {
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1301  		ret = -ENOMEM;
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1302  		goto bail;
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1303  	}
60a8b5a1611b4a drivers/infiniband/hw/hfi1/init.c Mike Marciniszyn    2021-11-29  1304  
19d8b90a509f7f drivers/infiniband/hw/hfi1/init.c Grzegorz Andrejczuk 2020-05-11  1305  	atomic_set(&dd->ipoib_rsm_usr_num, 0);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1306  	return dd;
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1307  
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1308  bail:
5ab17a24cb82a6 drivers/infiniband/hw/hfi1/init.c Kaike Wan           2020-03-16  1309  	hfi1_free_devdata(dd);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1310  	return ERR_PTR(ret);
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1311  }
7724105686e718 drivers/staging/rdma/hfi1/init.c  Mike Marciniszyn    2015-07-30  1312  

:::::: The code at line 1213 was first introduced by commit
:::::: 7724105686e718ac476a6ad3304fea2fbcfcffde IB/hfi1: add driver files

:::::: TO: Mike Marciniszyn <mike.marciniszyn@intel.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
