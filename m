Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBE0210F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbDl5l0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697366551; x=1728902551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTdtRwquAxfne2SsBlmHuN6TLqGYY2LORBKvDtD4exw=;
  b=kbDl5l0hgmNjEOGjtR4+FDIQkYQ+pw1VNPuSoTKMdeqy5DD/EivbXu9P
   Bjwt8VVrVmm6538zmJpGW1FpUko9w4cLllG6F1GdEVzWrbPdEr1A1gjSS
   xfH/BPKeAJjNjNHH8dWhGzBrf1m/kuUTWJdTc+iC18kXs4xybtB6zqR2J
   Kq94zqm2bPU9D5oBspYDSRAW/ZFUEx4+57HPXSN2BWR08Qc/IZiDIsow2
   q7BfpxGhpBImIAw+uCA93EfKGSSta1x0UzhvRI8k0Ngb9OHcXhvbl/bFN
   Q5h1GRlu1nDOKJ4rhJvdb50zm/1YQ3FTIPgL4L8ZlT++KEAszelEPWnb7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365644401"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365644401"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 03:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879096584"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="879096584"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 03:42:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qryZn-0007KV-09;
	Sun, 15 Oct 2023 10:42:27 +0000
Date: Sun, 15 Oct 2023 18:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3009/15768]
 drivers/net/imx-shmem-net.c:1125:29: warning: passing argument 1 of
 'eth_random_addr' discards 'const' qualifier from pointer target type
Message-ID: <202310151816.crXvKEz9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nitin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 20d25fd5707691f053f98f87fcdde68e46fa7168 [3009/15768] MLK-25346: net: add imx-shmem-net driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151816.crXvKEz9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151816.crXvKEz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151816.crXvKEz9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/imx-shmem-net.c: In function 'imx_shm_net_probe':
>> drivers/net/imx-shmem-net.c:1125:29: warning: passing argument 1 of 'eth_random_addr' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1125 |         eth_random_addr(ndev->dev_addr);
         |                         ~~~~^~~~~~~~~~
   In file included from drivers/net/imx-shmem-net.c:25:
   include/linux/etherdevice.h:230:40: note: expected 'u8 *' {aka 'unsigned char *'} but argument is of type 'const unsigned char *'
     230 | static inline void eth_random_addr(u8 *addr)
         |                                    ~~~~^~~~
   drivers/net/imx-shmem-net.c:1133:9: error: too many arguments to function 'netif_napi_add'
    1133 |         netif_napi_add(ndev, &in->napi, imx_shm_net_poll, NAPI_POLL_WEIGHT);
         |         ^~~~~~~~~~~~~~
   In file included from drivers/net/imx-shmem-net.c:24:
   include/linux/netdevice.h:2562:1: note: declared here
    2562 | netif_napi_add(struct net_device *dev, struct napi_struct *napi,
         | ^~~~~~~~~~~~~~


vim +1125 drivers/net/imx-shmem-net.c

  1033	
  1034	static int imx_shm_net_probe(struct platform_device *pdev)
  1035	{
  1036		struct net_device *ndev = NULL;
  1037		struct imx_shm_net *in;
  1038		resource_size_t shmaddr;
  1039		resource_size_t shmlen;
  1040		char *device_name;
  1041		void *shm = NULL;
  1042		u32 ivpos;
  1043		int ret;
  1044	
  1045		/* check if 1st probe or another attempt after EAGAIN */
  1046		if (pdev->dev.driver_data) {
  1047			dev_dbg(&pdev->dev, "Retrying connection...\n");
  1048			in = netdev_priv(platform_get_drvdata(pdev));
  1049			goto retry;
  1050		}
  1051	
  1052		if (of_property_read_bool(pdev->dev.of_node, "rxfirst")) {
  1053			ivpos = 1;
  1054			dev_info(&pdev->dev, "queue position is RX first\n");
  1055		} else {
  1056			ivpos = 0;
  1057			dev_info(&pdev->dev, "queue position is TX first\n");
  1058		}
  1059	
  1060		/* get shared coherent memory for buffers */
  1061		if (of_reserved_mem_device_init(&pdev->dev)) {
  1062			dev_err(&pdev->dev,
  1063				"dev doesn't have specific DMA pool.\n");
  1064			return -ENOMEM;
  1065		}
  1066		shmlen = IMX_SHM_NET_DMA_SIZE;
  1067		shm = dma_alloc_coherent(&pdev->dev, IMX_SHM_NET_DMA_SIZE,
  1068					 &shmaddr, GFP_KERNEL);
  1069		if (!shm || !shmaddr)
  1070			return -ENOMEM;
  1071	
  1072		dev_info(&pdev->dev, "allocated %d bytes in coherent mem @ 0x%x\n",
  1073			 (uint)shmlen, (uint)shmaddr);
  1074	
  1075		device_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s[%s]", DRV_NAME,
  1076					     dev_name(&pdev->dev));
  1077		if (!device_name) {
  1078			ret = -ENOMEM;
  1079			goto err_free_dma;
  1080		}
  1081	
  1082		ndev = alloc_etherdev(sizeof(*in));
  1083		if (!ndev) {
  1084			ret = -ENOMEM;
  1085			goto err_free_dma;
  1086		}
  1087		dev_info(&pdev->dev, "allocated ethernet device %s\n", ndev->name);
  1088	
  1089		platform_set_drvdata(pdev, ndev);
  1090		SET_NETDEV_DEV(ndev, &pdev->dev);
  1091	
  1092		/* get struct 'imx_shm_net' stored as private data in ndev */
  1093		in = netdev_priv(ndev);
  1094	
  1095		list_add(&in->isn_node, &imx_shm_net_head);
  1096	
  1097		in->shm = shm;
  1098		in->shmaddr = shmaddr;
  1099		in->shmlen = shmlen;
  1100		in->pdev = pdev;
  1101		in->regs.ivpos = ivpos;
  1102		in->regs.rstate = IMX_SHM_NET_STATE_RESET;
  1103		in->remote_message = IMX_SHM_NET_STATE_RESET;
  1104		spin_lock_init(&in->tx_free_lock);
  1105		spin_lock_init(&in->tx_clean_lock);
  1106		mutex_init(&in->state_lock);
  1107	
  1108		/* enable peer's reset notification */
  1109		ret = mu_enable_reset_irq(ndev);
  1110		if (ret)
  1111			goto err_free;
  1112	
  1113		ret = imx_shm_net_calc_qsize(ndev);
  1114		if (ret)
  1115			goto err_reset_irq;
  1116	
  1117		in->state_wq = alloc_ordered_workqueue(device_name, 0);
  1118		if (!in->state_wq) {
  1119			ret = -ENOMEM;
  1120			goto err_reset_irq;
  1121		}
  1122	
  1123		INIT_WORK(&in->state_work, imx_shm_net_state_change);
  1124	
> 1125		eth_random_addr(ndev->dev_addr);
  1126		ndev->netdev_ops = &imx_shm_net_ops;
  1127		ndev->ethtool_ops = &imx_shm_net_ethtool_ops;
  1128		ndev->mtu = min_t(u32, IMX_SHM_NET_MTU_DEF, in->qsize / 16);
  1129		ndev->hw_features = NETIF_F_HW_CSUM | NETIF_F_SG;
  1130		ndev->features = ndev->hw_features;
  1131	
  1132		netif_carrier_off(ndev);
  1133		netif_napi_add(ndev, &in->napi, imx_shm_net_poll, NAPI_POLL_WEIGHT);
  1134	
  1135		ret = register_netdev(ndev);
  1136		if (ret)
  1137			goto err_wq;
  1138	
  1139		/* initialize Mailbox for RX/TX */
  1140		ret = imx_shm_xtr_channel_init(in);
  1141		if (ret) {
  1142			dev_err(&in->pdev->dev, "unable to initialize Mailbox.\n");
  1143			/* MU may not be ready yet, need to try later on */
  1144			ret = -EPROBE_DEFER;
  1145			goto err_unregister;
  1146		}
  1147		dev_info(&in->pdev->dev,
  1148			 "Mailbox is ready for cross core communication!\n");
  1149	
  1150	retry:
  1151		/* notify reset */
  1152		mutex_lock(&in->state_lock);
  1153		in->regs.lstate = IMX_SHM_NET_STATE_RESET;
  1154		in->message_state = MESS_STATE_NEW;
  1155		mutex_unlock(&in->state_lock);
  1156	
  1157		/* only device with queue position TXfirst sends the first message */
  1158		if (!ivpos) {
  1159			ret = mbox_send_message(in->tx_ch, &in->regs.lstate);
  1160			if (ret < 0)
  1161				dev_err(&pdev->dev, "%s first message error=%d!\n",
  1162					__func__, ret);
  1163	
  1164			dev_dbg(&pdev->dev, "%s sent first message\n", __func__);
  1165		}
  1166	
  1167		return 0;
  1168	
  1169	err_unregister:
  1170		unregister_netdev(ndev);
  1171	
  1172	err_wq:
  1173		destroy_workqueue(in->state_wq);
  1174	
  1175	err_reset_irq:
  1176		imx_scu_irq_unregister_notifier(&in->pnotifier);
  1177	
  1178	err_free:
  1179		list_del(&in->isn_node);
  1180		free_netdev(ndev);
  1181	
  1182	err_free_dma:
  1183		dma_free_coherent(&pdev->dev, shmlen, shm, shmaddr);
  1184	
  1185		return ret;
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
