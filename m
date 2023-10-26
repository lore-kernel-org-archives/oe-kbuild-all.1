Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3542D7A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAcY8h1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698333990; x=1729869990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YzzvTfEMedLDncmhk8T00FKXupEQ5PQUxua+uWhDrp4=;
  b=TAcY8h1JcdWBUJTw5NdyCxt+lnf+cTr9F8Erlx7N0q4ZgOtokpEazF9r
   W7h8Am8EVM0R+eIE3yBw8Y4Sik5H8JJimEwhvX/e9Sag1/Ll6ctnTGnt0
   gKzO3S4CmKpEEKN25lutv3JC/ni8gxfX5hjGF2ahfciDTAsmjnHetplpU
   S5ajeZ+rjGoZg+oPoU9EqKM3/jw3gNI1KjCDrGOfryKqesce7xa8tWAFD
   3NUsuBxmGvhVkFY2y8he+pPVddG588N73quqF+qwPfys22MxuoWq7z8qJ
   EnGv9PUWkDQehdoFW9dZ2Dfk5GMt6WZ6Z6ZgVj04xALHs6PQpca11Lu4K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377940144"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377940144"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 08:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="902943386"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902943386"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2023 08:24:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw2Fc-0009tB-0U;
	Thu, 26 Oct 2023 15:26:24 +0000
Date: Thu, 26 Oct 2023 23:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4442/15770]
 drivers/staging/fsl-dpaa2/evb/evb.c:1238:43: warning: '%%' directive output
 may be truncated writing 1 byte into a region of size between 0 and 15
Message-ID: <202310262322.vzVRcDHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: f27e4259b42e29921b5bb4d080444dbf87c0a389 [4442/15770] staging: dpaa2-evb: Add Edge Virtual Bridge driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231026/202310262322.vzVRcDHh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262322.vzVRcDHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262322.vzVRcDHh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/fsl-dpaa2/evb/evb.c:766:6: warning: no previous prototype for 'evb_port_get_stats' [-Wmissing-prototypes]
     766 | void evb_port_get_stats(struct net_device *netdev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/staging/fsl-dpaa2/evb/evb.c:855:35: error: initialization of 'int (*)(struct ndmsg *, struct nlattr **, struct net_device *, const unsigned char *, u16,  struct netlink_ext_ack *)' {aka 'int (*)(struct ndmsg *, struct nlattr **, struct net_device *, const unsigned char *, short unsigned int,  struct netlink_ext_ack *)'} from incompatible pointer type 'int (*)(struct ndmsg *, struct nlattr **, struct net_device *, const unsigned char *, u16)' {aka 'int (*)(struct ndmsg *, struct nlattr **, struct net_device *, const unsigned char *, short unsigned int)'} [-Werror=incompatible-pointer-types]
     855 |         .ndo_fdb_del            = &evb_port_fdb_del,
         |                                   ^
   drivers/staging/fsl-dpaa2/evb/evb.c:855:35: note: (near initialization for 'evb_port_ops.ndo_fdb_del')
   drivers/staging/fsl-dpaa2/evb/evb.c: In function 'evb_probe':
>> drivers/staging/fsl-dpaa2/evb/evb.c:1238:43: warning: '%%' directive output may be truncated writing 1 byte into a region of size between 0 and 15 [-Wformat-truncation=]
    1238 |         snprintf(port_name, IFNAMSIZ, "%sp%%d", netdev->name);
         |                                           ^~
   drivers/staging/fsl-dpaa2/evb/evb.c:1238:9: note: 'snprintf' output between 4 and 19 bytes into a destination of size 16
    1238 |         snprintf(port_name, IFNAMSIZ, "%sp%%d", netdev->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1238 drivers/staging/fsl-dpaa2/evb/evb.c

  1186	
  1187	static int evb_probe(struct fsl_mc_device *evb_dev)
  1188	{
  1189		struct device		*dev;
  1190		struct evb_priv		*priv = NULL;
  1191		struct net_device	*netdev = NULL;
  1192		char			port_name[IFNAMSIZ];
  1193		int			i;
  1194		int			err = 0;
  1195	
  1196		dev = &evb_dev->dev;
  1197	
  1198		/* register switch device, it's for management only - no I/O */
  1199		netdev = alloc_etherdev(sizeof(*priv));
  1200		if (!netdev) {
  1201			dev_err(dev, "alloc_etherdev error\n");
  1202			return -ENOMEM;
  1203		}
  1204		netdev->netdev_ops = &evb_ops;
  1205	
  1206		dev_set_drvdata(dev, netdev);
  1207	
  1208		priv = netdev_priv(netdev);
  1209	
  1210		err = fsl_mc_portal_allocate(evb_dev, FSL_MC_IO_ATOMIC_CONTEXT_PORTAL,
  1211					     &priv->mc_io);
  1212		if (err) {
  1213			if (err == -ENXIO)
  1214				err = -EPROBE_DEFER;
  1215			else
  1216				dev_err(dev, "fsl_mc_portal_allocate err %d\n", err);
  1217			goto err_free_netdev;
  1218		}
  1219	
  1220		if (!priv->mc_io) {
  1221			dev_err(dev, "fsl_mc_portal_allocate returned null handle but no error\n");
  1222			err = -EFAULT;
  1223			goto err_free_netdev;
  1224		}
  1225	
  1226		err = evb_init(evb_dev);
  1227		if (unlikely(err)) {
  1228			dev_err(dev, "evb init err %d\n", err);
  1229			goto err_free_cmdport;
  1230		}
  1231	
  1232		INIT_LIST_HEAD(&priv->port_list);
  1233		netdev->flags |= IFF_PROMISC | IFF_MASTER;
  1234	
  1235		dev_alloc_name(netdev, "evb%d");
  1236	
  1237		/* register switch ports */
> 1238		snprintf(port_name, IFNAMSIZ, "%sp%%d", netdev->name);
  1239	
  1240		/* only register downlinks? */
  1241		for (i = 0; i < priv->attr.num_ifs + 1; i++) {
  1242			struct net_device *port_netdev;
  1243			struct evb_port_priv *port_priv;
  1244	
  1245			if (i) {
  1246				port_netdev =
  1247					alloc_etherdev(sizeof(struct evb_port_priv));
  1248				if (!port_netdev) {
  1249					dev_err(dev, "alloc_etherdev error\n");
  1250					goto err_takedown;
  1251				}
  1252	
  1253				port_priv = netdev_priv(port_netdev);
  1254	
  1255				port_netdev->flags |= IFF_PROMISC | IFF_SLAVE;
  1256	
  1257				dev_alloc_name(port_netdev, port_name);
  1258			} else {
  1259				port_netdev = netdev;
  1260				port_priv = &priv->uplink;
  1261			}
  1262	
  1263			port_priv->netdev = port_netdev;
  1264			port_priv->evb_priv = priv;
  1265			port_priv->port_index = i;
  1266	
  1267			SET_NETDEV_DEV(port_netdev, dev);
  1268	
  1269			if (i) {
  1270				port_netdev->netdev_ops = &evb_port_ops;
  1271	
  1272				err = register_netdev(port_netdev);
  1273				if (err < 0) {
  1274					dev_err(dev, "register_netdev err %d\n", err);
  1275					free_netdev(port_netdev);
  1276					goto err_takedown;
  1277				}
  1278	
  1279				rtnl_lock();
  1280				err = netdev_master_upper_dev_link(port_netdev, netdev,
  1281								   NULL, NULL, NULL);
  1282				if (unlikely(err)) {
  1283					dev_err(dev, "netdev_master_upper_dev_link err %d\n",
  1284						err);
  1285					unregister_netdev(port_netdev);
  1286					free_netdev(port_netdev);
  1287					rtnl_unlock();
  1288					goto err_takedown;
  1289				}
  1290				rtmsg_ifinfo(RTM_NEWLINK, port_netdev,
  1291					     IFF_SLAVE, GFP_KERNEL);
  1292				rtnl_unlock();
  1293	
  1294				list_add(&port_priv->list, &priv->port_list);
  1295			} else {
  1296				/* Set MTU limits only on uplink */
  1297				port_netdev->min_mtu = EVB_MIN_MTU;
  1298				port_netdev->max_mtu = EVB_MAX_MTU;
  1299	
  1300				err = register_netdev(netdev);
  1301	
  1302				if (err < 0) {
  1303					dev_err(dev, "register_netdev error %d\n", err);
  1304					goto err_takedown;
  1305				}
  1306			}
  1307	
  1308			port_netdev->ethtool_ops = &evb_port_ethtool_ops;
  1309	
  1310			/* ports are up from init */
  1311			rtnl_lock();
  1312			err = dev_open(port_netdev, NULL);
  1313			rtnl_unlock();
  1314			if (unlikely(err))
  1315				dev_warn(dev, "dev_open err %d\n", err);
  1316		}
  1317	
  1318		/* setup irqs */
  1319		err = evb_setup_irqs(evb_dev);
  1320		if (unlikely(err)) {
  1321			dev_warn(dev, "evb_setup_irqs err %d\n", err);
  1322			goto err_takedown;
  1323		}
  1324	
  1325		dev_info(dev, "probed evb device with %d ports\n",
  1326			 priv->attr.num_ifs);
  1327		return 0;
  1328	
  1329	err_takedown:
  1330		evb_remove(evb_dev);
  1331	err_free_cmdport:
  1332		fsl_mc_portal_free(priv->mc_io);
  1333	err_free_netdev:
  1334		return err;
  1335	}
  1336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
