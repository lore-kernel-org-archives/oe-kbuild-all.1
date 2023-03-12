Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1111399
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678580227; x=1710116227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqeWbIrZv6S1Q4F8zJDcnn2ll2O6kbvPhRNYPMfddAk=;
  b=n7kQwDijPt4OZ1J33/z/Aghdc+TeSkCifwlpeRBYznhpXQ0rXcFJlTze
   G9HY3gGb8Pvm4imze3+HUr1m78WaGbO9nq7VRsUtMb62RatR2zjbu4cxQ
   NXJNdDcM+qBerpEVnwfSoPRHTB+zX/vCFH8Gs4aQa3VeR6VBCaz0u6p+Y
   TvdvkI+5hRNlQmy5bEUibpCz+MoGShdXYgCsnNBWpXvYDFZMx8nW/tubG
   O0CbFfWlpmVdHV3rXjFuKoEgAYkDNXhzkDk8KKRnoj6BCRlX9Dyncx0o2
   fK5sfgBsucB2aBU1THOw77vWDtjinD4rHhE3ICevd5SGaEgH4zJq+FyOL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325306181"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="325306181"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 16:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="802024972"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="802024972"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2023 16:17:06 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb9Ob-0004rr-1L;
	Sun, 12 Mar 2023 00:17:05 +0000
Date: Sun, 12 Mar 2023 08:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] usb: gadget: ncm: Add support to configure
 wMaxSegmentSize
Message-ID: <202303120844.avMqtcOa-lkp@intel.com>
References: <20230310133640.11142-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310133640.11142-1-quic_kriskura@quicinc.com>

Hi Krishna,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/usb-gadget-ncm-Add-support-to-configure-wMaxSegmentSize/20230310-213823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230310133640.11142-1-quic_kriskura%40quicinc.com
patch subject: [RFC v2] usb: gadget: ncm: Add support to configure wMaxSegmentSize
config: openrisc-randconfig-s042-20230311 (https://download.01.org/0day-ci/archive/20230312/202303120844.avMqtcOa-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/64d95b6c6ffe4d09ed83dfbda138ffcaa94d4d69
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krishna-Kurapati/usb-gadget-ncm-Add-support-to-configure-wMaxSegmentSize/20230310-213823
        git checkout 64d95b6c6ffe4d09ed83dfbda138ffcaa94d4d69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120844.avMqtcOa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_ncm.c:1493:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wMaxSegmentSize @@     got unsigned int [usertype] max_segment_size @@
   drivers/usb/gadget/function/f_ncm.c:1493:34: sparse:     expected restricted __le16 static [addressable] [assigned] [toplevel] [usertype] wMaxSegmentSize
   drivers/usb/gadget/function/f_ncm.c:1493:34: sparse:     got unsigned int [usertype] max_segment_size
>> drivers/usb/gadget/function/f_ncm.c:1689:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_segment_size @@     got restricted __le16 [usertype] @@
   drivers/usb/gadget/function/f_ncm.c:1689:32: sparse:     expected unsigned int [usertype] max_segment_size
   drivers/usb/gadget/function/f_ncm.c:1689:32: sparse:     got restricted __le16 [usertype]

vim +1493 drivers/usb/gadget/function/f_ncm.c

  1415	
  1416	static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
  1417	{
  1418		struct usb_composite_dev *cdev = c->cdev;
  1419		struct f_ncm		*ncm = func_to_ncm(f);
  1420		struct usb_string	*us;
  1421		int			status;
  1422		struct usb_ep		*ep;
  1423		struct f_ncm_opts	*ncm_opts;
  1424	
  1425		if (!can_support_ecm(cdev->gadget))
  1426			return -EINVAL;
  1427	
  1428		ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
  1429	
  1430		if (cdev->use_os_string) {
  1431			f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
  1432						   GFP_KERNEL);
  1433			if (!f->os_desc_table)
  1434				return -ENOMEM;
  1435			f->os_desc_n = 1;
  1436			f->os_desc_table[0].os_desc = &ncm_opts->ncm_os_desc;
  1437		}
  1438	
  1439		/*
  1440		 * in drivers/usb/gadget/configfs.c:configfs_composite_bind()
  1441		 * configurations are bound in sequence with list_for_each_entry,
  1442		 * in each configuration its functions are bound in sequence
  1443		 * with list_for_each_entry, so we assume no race condition
  1444		 * with regard to ncm_opts->bound access
  1445		 */
  1446		if (!ncm_opts->bound) {
  1447			mutex_lock(&ncm_opts->lock);
  1448			ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
  1449			gether_set_gadget(ncm_opts->net, cdev->gadget);
  1450			status = gether_register_netdev(ncm_opts->net);
  1451			mutex_unlock(&ncm_opts->lock);
  1452			if (status)
  1453				goto fail;
  1454			ncm_opts->bound = true;
  1455		}
  1456		us = usb_gstrings_attach(cdev, ncm_strings,
  1457					 ARRAY_SIZE(ncm_string_defs));
  1458		if (IS_ERR(us)) {
  1459			status = PTR_ERR(us);
  1460			goto fail;
  1461		}
  1462		ncm_control_intf.iInterface = us[STRING_CTRL_IDX].id;
  1463		ncm_data_nop_intf.iInterface = us[STRING_DATA_IDX].id;
  1464		ncm_data_intf.iInterface = us[STRING_DATA_IDX].id;
  1465		ecm_desc.iMACAddress = us[STRING_MAC_IDX].id;
  1466		ncm_iad_desc.iFunction = us[STRING_IAD_IDX].id;
  1467	
  1468		/* allocate instance-specific interface IDs */
  1469		status = usb_interface_id(c, f);
  1470		if (status < 0)
  1471			goto fail;
  1472		ncm->ctrl_id = status;
  1473		ncm_iad_desc.bFirstInterface = status;
  1474	
  1475		ncm_control_intf.bInterfaceNumber = status;
  1476		ncm_union_desc.bMasterInterface0 = status;
  1477	
  1478		if (cdev->use_os_string)
  1479			f->os_desc_table[0].if_id =
  1480				ncm_iad_desc.bFirstInterface;
  1481	
  1482		status = usb_interface_id(c, f);
  1483		if (status < 0)
  1484			goto fail;
  1485		ncm->data_id = status;
  1486	
  1487		ncm_data_nop_intf.bInterfaceNumber = status;
  1488		ncm_data_intf.bInterfaceNumber = status;
  1489		ncm_union_desc.bSlaveInterface0 = status;
  1490	
  1491		status = -ENODEV;
  1492	
> 1493		ecm_desc.wMaxSegmentSize = ncm_opts->max_segment_size;
  1494	
  1495		/* allocate instance-specific endpoints */
  1496		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
  1497		if (!ep)
  1498			goto fail;
  1499		ncm->port.in_ep = ep;
  1500	
  1501		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_out_desc);
  1502		if (!ep)
  1503			goto fail;
  1504		ncm->port.out_ep = ep;
  1505	
  1506		ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_notify_desc);
  1507		if (!ep)
  1508			goto fail;
  1509		ncm->notify = ep;
  1510	
  1511		status = -ENOMEM;
  1512	
  1513		/* allocate notification request and buffer */
  1514		ncm->notify_req = usb_ep_alloc_request(ep, GFP_KERNEL);
  1515		if (!ncm->notify_req)
  1516			goto fail;
  1517		ncm->notify_req->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
  1518		if (!ncm->notify_req->buf)
  1519			goto fail;
  1520		ncm->notify_req->context = ncm;
  1521		ncm->notify_req->complete = ncm_notify_complete;
  1522	
  1523		/*
  1524		 * support all relevant hardware speeds... we expect that when
  1525		 * hardware is dual speed, all bulk-capable endpoints work at
  1526		 * both speeds
  1527		 */
  1528		hs_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1529		hs_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1530		hs_ncm_notify_desc.bEndpointAddress =
  1531			fs_ncm_notify_desc.bEndpointAddress;
  1532	
  1533		ss_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
  1534		ss_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
  1535		ss_ncm_notify_desc.bEndpointAddress =
  1536			fs_ncm_notify_desc.bEndpointAddress;
  1537	
  1538		status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
  1539				ncm_ss_function, ncm_ss_function);
  1540		if (status)
  1541			goto fail;
  1542	
  1543		/*
  1544		 * NOTE:  all that is done without knowing or caring about
  1545		 * the network link ... which is unavailable to this code
  1546		 * until we're activated via set_alt().
  1547		 */
  1548	
  1549		ncm->port.open = ncm_open;
  1550		ncm->port.close = ncm_close;
  1551	
  1552		hrtimer_init(&ncm->task_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
  1553		ncm->task_timer.function = ncm_tx_timeout;
  1554	
  1555		DBG(cdev, "CDC Network: %s speed IN/%s OUT/%s NOTIFY/%s\n",
  1556				gadget_is_superspeed(c->cdev->gadget) ? "super" :
  1557				gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
  1558				ncm->port.in_ep->name, ncm->port.out_ep->name,
  1559				ncm->notify->name);
  1560		return 0;
  1561	
  1562	fail:
  1563		kfree(f->os_desc_table);
  1564		f->os_desc_n = 0;
  1565	
  1566		if (ncm->notify_req) {
  1567			kfree(ncm->notify_req->buf);
  1568			usb_ep_free_request(ncm->notify, ncm->notify_req);
  1569		}
  1570	
  1571		ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);
  1572	
  1573		return status;
  1574	}
  1575	
  1576	static inline struct f_ncm_opts *to_f_ncm_opts(struct config_item *item)
  1577	{
  1578		return container_of(to_config_group(item), struct f_ncm_opts,
  1579				    func_inst.group);
  1580	}
  1581	
  1582	/* f_ncm_item_ops */
  1583	USB_ETHERNET_CONFIGFS_ITEM(ncm);
  1584	
  1585	/* f_ncm_opts_dev_addr */
  1586	USB_ETHERNET_CONFIGFS_ITEM_ATTR_DEV_ADDR(ncm);
  1587	
  1588	/* f_ncm_opts_host_addr */
  1589	USB_ETHERNET_CONFIGFS_ITEM_ATTR_HOST_ADDR(ncm);
  1590	
  1591	/* f_ncm_opts_qmult */
  1592	USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
  1593	
  1594	/* f_ncm_opts_ifname */
  1595	USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ncm);
  1596	
  1597	static ssize_t ncm_opts_max_segment_size_show(struct config_item *item,
  1598							char *page)
  1599	{
  1600		struct f_ncm_opts *opts = to_f_ncm_opts(item);
  1601		u32 segment_size;
  1602	
  1603		mutex_lock(&opts->lock);
  1604		segment_size = opts->max_segment_size;
  1605		mutex_unlock(&opts->lock);
  1606	
  1607		return sprintf(page, "%u\n", segment_size);
  1608	}
  1609	
  1610	static ssize_t ncm_opts_max_segment_size_store(struct config_item *item,
  1611							const char *page, size_t len)
  1612	{
  1613		struct f_ncm_opts *opts = to_f_ncm_opts(item);
  1614		int ret;
  1615		u32 segment_size;
  1616	
  1617		mutex_lock(&opts->lock);
  1618		if (opts->refcnt) {
  1619			ret = -EBUSY;
  1620			goto out;
  1621		}
  1622	
  1623		ret = kstrtou32(page, 0, &segment_size);
  1624		if (ret)
  1625			goto out;
  1626	
  1627		if (segment_size > MAX_DATAGRAM_SIZE) {
  1628			ret = -EINVAL;
  1629			goto out;
  1630		}
  1631	
  1632		opts->max_segment_size = segment_size;
  1633		ret = len;
  1634	out:
  1635		mutex_unlock(&opts->lock);
  1636		return ret;
  1637	}
  1638	
  1639	CONFIGFS_ATTR(ncm_opts_, max_segment_size);
  1640	
  1641	static struct configfs_attribute *ncm_attrs[] = {
  1642		&ncm_opts_attr_dev_addr,
  1643		&ncm_opts_attr_host_addr,
  1644		&ncm_opts_attr_qmult,
  1645		&ncm_opts_attr_ifname,
  1646		&ncm_opts_attr_max_segment_size,
  1647		NULL,
  1648	};
  1649	
  1650	static const struct config_item_type ncm_func_type = {
  1651		.ct_item_ops	= &ncm_item_ops,
  1652		.ct_attrs	= ncm_attrs,
  1653		.ct_owner	= THIS_MODULE,
  1654	};
  1655	
  1656	static void ncm_free_inst(struct usb_function_instance *f)
  1657	{
  1658		struct f_ncm_opts *opts;
  1659	
  1660		opts = container_of(f, struct f_ncm_opts, func_inst);
  1661		if (opts->bound)
  1662			gether_cleanup(netdev_priv(opts->net));
  1663		else
  1664			free_netdev(opts->net);
  1665		kfree(opts->ncm_interf_group);
  1666		kfree(opts);
  1667	}
  1668	
  1669	static struct usb_function_instance *ncm_alloc_inst(void)
  1670	{
  1671		struct f_ncm_opts *opts;
  1672		struct usb_os_desc *descs[1];
  1673		char *names[1];
  1674		struct config_group *ncm_interf_group;
  1675	
  1676		opts = kzalloc(sizeof(*opts), GFP_KERNEL);
  1677		if (!opts)
  1678			return ERR_PTR(-ENOMEM);
  1679		opts->ncm_os_desc.ext_compat_id = opts->ncm_ext_compat_id;
  1680	
  1681		mutex_init(&opts->lock);
  1682		opts->func_inst.free_func_inst = ncm_free_inst;
  1683		opts->net = gether_setup_default();
  1684		if (IS_ERR(opts->net)) {
  1685			struct net_device *net = opts->net;
  1686			kfree(opts);
  1687			return ERR_CAST(net);
  1688		}
> 1689		opts->max_segment_size = cpu_to_le16(ETH_FRAME_LEN);
  1690		INIT_LIST_HEAD(&opts->ncm_os_desc.ext_prop);
  1691	
  1692		descs[0] = &opts->ncm_os_desc;
  1693		names[0] = "ncm";
  1694	
  1695		config_group_init_type_name(&opts->func_inst.group, "", &ncm_func_type);
  1696		ncm_interf_group =
  1697			usb_os_desc_prepare_interf_dir(&opts->func_inst.group, 1, descs,
  1698						       names, THIS_MODULE);
  1699		if (IS_ERR(ncm_interf_group)) {
  1700			ncm_free_inst(&opts->func_inst);
  1701			return ERR_CAST(ncm_interf_group);
  1702		}
  1703		opts->ncm_interf_group = ncm_interf_group;
  1704	
  1705		return &opts->func_inst;
  1706	}
  1707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
