Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E5125A0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 05:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764568220; cv=none; b=Rilm4OuHM8QVc/CEKi2GgMc2+VPABwk1QnSGsp8qIshbbBS9osFdXWQZ08bJkwr4dEBY6ua/QtEbgtcFe7GTjtM3TVjGx3AHevRhdAGNC/cgPhX7VBVfoE7QPgHfj40hCIeegbrsK5ZqJkaMKV25Hr9e2AFoCZbT/qfB9wp4zro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764568220; c=relaxed/simple;
	bh=1vHguioRnvDPkb3jE3IYwFRBIlcHk+m2AfLmh5COTfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdhNGejYTsHBwm9xZuRn15hdN5rK0X/D0ueoeCUnc203HfekV5caVipbxtgWs58qNAvW6ldogclrMLdIVyBxVxUtUsCUm1ECzFSft+fHIxiTShM4ppzlhuN//lAVHJDvs73LoJGBrQw5BQ8ExFSSbgMbqbs2eggENY6QShUy05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aH+CHdqq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aH+CHdqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764568218; x=1796104218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vHguioRnvDPkb3jE3IYwFRBIlcHk+m2AfLmh5COTfk=;
  b=aH+CHdqq0lSE51hAacVz83JbRF2zxPWIDviaWwHK0x5jBl+0IjOi8nlW
   0hn9VXwxxzq+WgG9BMWf893RxH2XZE58yCQRHx8juz0IJAkq1OmfBMud6
   b53ogQxFnT9/aPLV1TXTRipxHQybnaeTdcPd7b9faW7hHjSfpxd6a51U2
   40RTX0rDI9SLIdIdM80MT5lcnifBU46pCYxpWLKg9fOEecOWSZxgwreLc
   LdTRSmDj4WJ0qDlDBLu+Y4bz6AsXJ2wFD+cKHUwNvH4UljpF/FYnP9vFS
   uvwhgG7MnHHGafWSZdCZ3GsiqOz6blnP0+sLYby85v+QidXDqWvjUWAIb
   Q==;
X-CSE-ConnectionGUID: 2x/qnw+mTny13jkOF1zaKQ==
X-CSE-MsgGUID: J44Svoi9Q8qao2vWA0lo9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66528043"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66528043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 21:50:17 -0800
X-CSE-ConnectionGUID: aI7/GcSUSEW/4Nvix7dXWA==
X-CSE-MsgGUID: DvGlVzvFTG2GkucNvnfrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="198919951"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2025 21:50:16 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPwnd-000000008LN-2FhZ;
	Mon, 01 Dec 2025 05:50:13 +0000
Date: Mon, 1 Dec 2025 13:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA
 backed transport mode
Message-ID: <202512011355.xYtxLg6d-lkp@intel.com>
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
config: powerpc-randconfig-001-20251201 (https://download.01.org/0day-ci/archive/20251201/202512011355.xYtxLg6d-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011355.xYtxLg6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011355.xYtxLg6d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ntb/ntb_transport_core.c: In function 'ntb_transport_init_queue':
>> drivers/ntb/ntb_transport_core.c:1286:40: warning: variable 'qp_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                                        ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:30: warning: variable 'mw_count' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                              ^~~~~~~~
>> drivers/ntb/ntb_transport_core.c:1286:22: warning: variable 'mw_num' set but not used [-Wunused-but-set-variable]
    1286 |         unsigned int mw_num, mw_count, qp_count;
         |                      ^~~~~~
   drivers/ntb/ntb_transport_core.c: At top level:
>> drivers/ntb/ntb_transport_core.c:1367:47: warning: 'edma_backend_ops' defined but not used [-Wunused-const-variable=]
    1367 | static const struct ntb_transport_backend_ops edma_backend_ops;
         |                                               ^~~~~~~~~~~~~~~~


vim +/qp_count +1286 drivers/ntb/ntb_transport_core.c

fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1281  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1282  static int ntb_transport_init_queue(struct ntb_transport_ctx *nt,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1283  				    unsigned int qp_num)
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1284  {
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1285  	struct ntb_transport_qp *qp;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09 @1286  	unsigned int mw_num, mw_count, qp_count;
948d3a65b6d164 drivers/ntb/ntb_transport.c      Jon Mason    2013-04-18  1287  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1288  	mw_count = nt->mw_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1289  	qp_count = nt->qp_count;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1290  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1291  	mw_num = QP_TO_MW(nt, qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1292  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1293  	qp = &nt->qp_vec[qp_num];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1294  	qp->qp_num = qp_num;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1295  	qp->transport = nt;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1296  	qp->ndev = nt->ndev;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1297  	qp->client_ready = false;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1298  	qp->event_handler = NULL;
cc79bd2738c2d4 drivers/ntb/ntb_transport.c      Dave Jiang   2023-08-22  1299  	ntb_qp_link_context_reset(qp);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1300  
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1301  	if (nt->debugfs_node_dir) {
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1302  		char debugfs_name[8];
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1303  
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1304  		snprintf(debugfs_name, sizeof(debugfs_name), "qp%d", qp_num);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1305  		qp->debugfs_dir = debugfs_create_dir(debugfs_name,
c8650fd03d320e drivers/ntb/ntb_transport.c      Dave Jiang   2015-07-13  1306  						     nt->debugfs_node_dir);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1307  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1308  		qp->debugfs_stats = debugfs_create_file("stats", S_IRUSR,
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1309  							qp->debugfs_dir, qp,
2d1987992b40a8 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1310  							&ntb_qp_debugfs_stats_fops);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1311  	} else {
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1312  		qp->debugfs_dir = NULL;
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1313  		qp->debugfs_stats = NULL;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1314  	}
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1315  
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1316  	INIT_DELAYED_WORK(&qp->link_work, ntb_qp_link_work);
fca4d5188c1123 drivers/ntb/ntb_transport.c      Jon Mason    2013-09-09  1317  	INIT_WORK(&qp->link_cleanup, ntb_qp_link_cleanup_work);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1318  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1319  	spin_lock_init(&qp->ntb_rx_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1320  	spin_lock_init(&qp->ntb_tx_free_q_lock);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1321  
da2e5ae56164b8 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-07-13  1322  	INIT_LIST_HEAD(&qp->rx_post_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1323  	INIT_LIST_HEAD(&qp->rx_pend_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1324  	INIT_LIST_HEAD(&qp->rx_free_q);
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1325  	INIT_LIST_HEAD(&qp->tx_free_q);
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1326  
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1327  	tasklet_init(&qp->rxc_db_work, ntb_transport_rxc_db,
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1328  		     (unsigned long)qp);
e26a5843f7f501 drivers/ntb/ntb_transport.c      Allen Hubbe  2015-04-09  1329  
282a2feeb9bfb1 drivers/ntb/ntb_transport.c      Jon Mason    2013-02-12  1330  	return 0;
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1331  }
fce8a7bb5b4bfb drivers/ntb/ntb_transport.c      Jon Mason    2012-11-16  1332  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1333  static unsigned int ntb_transport_default_tx_free_entry(struct ntb_transport_qp *qp)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1334  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1335  	unsigned int head = qp->tx_index;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1336  	unsigned int tail = qp->remote_rx_info->entry;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1337  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1338  	return tail >= head ? tail - head : qp->tx_max_entry + tail - head;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1339  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1340  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1341  static int ntb_transport_default_rx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1342  					    struct ntb_queue_entry *entry)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1343  {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1344  	ntb_list_add(&qp->ntb_rx_q_lock, &entry->entry, &qp->rx_pend_q);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1345  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1346  	if (qp->active)
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1347  		tasklet_schedule(&qp->rxc_db_work);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1348  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1349  	return 0;
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1350  }
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1351  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1352  static void ntb_transport_default_rx_poll(struct ntb_transport_qp *qp);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1353  static int ntb_transport_default_tx_enqueue(struct ntb_transport_qp *qp,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1354  					    struct ntb_queue_entry *entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1355  					    void *cb, void *data, unsigned int len,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1356  					    unsigned int flags);
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1357  
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1358  static const struct ntb_transport_backend_ops default_backend_ops = {
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1359  	.setup_qp_mw = ntb_transport_default_setup_qp_mw,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1360  	.tx_free_entry = ntb_transport_default_tx_free_entry,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1361  	.tx_enqueue = ntb_transport_default_tx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1362  	.rx_enqueue = ntb_transport_default_rx_enqueue,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1363  	.rx_poll = ntb_transport_default_rx_poll,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1364  	.debugfs_stats_show = ntb_transport_default_debugfs_stats_show,
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1365  };
5c2671d8c2c274 drivers/ntb/ntb_transport.c      Koichiro Den 2025-11-30  1366  
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30 @1367  static const struct ntb_transport_backend_ops edma_backend_ops;
2c52b6a2a63cec drivers/ntb/ntb_transport_core.c Koichiro Den 2025-11-30  1368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
