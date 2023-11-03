Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0881427F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed/IpAaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699003401; x=1730539401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPBZPBq6eb7zGNmNqHgecq4qiTV24eqA4MvdVwVxxmY=;
  b=ed/IpAaWePAck/glvBSUyQDxHf7QqSl+uIoYlDmhzt0GAh+R1BaMDSyA
   VS8/MJ4rvgUF/XpGL/6mbWZe3eOCEw+/ExBhzW9Fz8+s/ty1XAFu9ro0o
   2wk1oWUKPtNEf63kfOeXV7h6+7EhmVo8SNsy9ddH+19rYz4KGs/ji8j9w
   NZoQzluJT/JSKYy1P4GjNUFCpWDao6GVMvZ5AzAE8fKU2ZSVS8LYOHpyq
   ein3Yk2ewccqcWgDy7S++egbpuA3SYk6TlGPJA+IbgRDUMza+mvrcLmjv
   s6pdGyM3QTRRUneHMSge08eymixjxFrKDcNq0JVABcv+NLkOXp/s8LPvn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369117538"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="369117538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9671023"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 02:23:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqOa-0002PI-1s;
	Fri, 03 Nov 2023 09:23:16 +0000
Date: Fri, 3 Nov 2023 17:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 3299/30000] drivers/base/core.c:1510:
 warning: Function parameter or member 'sup_handle' not described in
 'fw_devlink_create_devlink'
Message-ID: <202311031710.3XbV07Vr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: f0551d0cb24c444c7d80006399c71baf8e24bfd2 [3299/30000] UPSTREAM: driver core: Refactor fw_devlink feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231103/202311031710.3XbV07Vr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031710.3XbV07Vr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031710.3XbV07Vr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/core.c:1510: warning: Function parameter or member 'con' not described in 'fw_devlink_create_devlink'
>> drivers/base/core.c:1510: warning: Function parameter or member 'sup_handle' not described in 'fw_devlink_create_devlink'
   drivers/base/core.c:1510: warning: Function parameter or member 'flags' not described in 'fw_devlink_create_devlink'
>> drivers/base/core.c:1579: warning: Function parameter or member 'dev' not described in '__fw_devlink_link_to_consumers'
   drivers/base/core.c:1660: warning: Function parameter or member 'dev' not described in '__fw_devlink_link_to_suppliers'
>> drivers/base/core.c:1660: warning: Function parameter or member 'fwnode' not described in '__fw_devlink_link_to_suppliers'


vim +1510 drivers/base/core.c

  1488	
  1489	/**
  1490	 * fw_devlink_create_devlink - Create a device link from a consumer to fwnode
  1491	 * @con - Consumer device for the device link
  1492	 * @sup_handle - fwnode handle of supplier
  1493	 *
  1494	 * This function will try to create a device link between the consumer device
  1495	 * @con and the supplier device represented by @sup_handle.
  1496	 *
  1497	 * The supplier has to be provided as a fwnode because incorrect cycles in
  1498	 * fwnode links can sometimes cause the supplier device to never be created.
  1499	 * This function detects such cases and returns an error if it cannot create a
  1500	 * device link from the consumer to a missing supplier.
  1501	 *
  1502	 * Returns,
  1503	 * 0 on successfully creating a device link
  1504	 * -EINVAL if the device link cannot be created as expected
  1505	 * -EAGAIN if the device link cannot be created right now, but it may be
  1506	 *  possible to do that in the future
  1507	 */
  1508	static int fw_devlink_create_devlink(struct device *con,
  1509					     struct fwnode_handle *sup_handle, u32 flags)
> 1510	{
  1511		struct device *sup_dev;
  1512		int ret = 0;
  1513	
  1514		sup_dev = get_dev_from_fwnode(sup_handle);
  1515		if (sup_dev) {
  1516			/*
  1517			 * If this fails, it is due to cycles in device links.  Just
  1518			 * give up on this link and treat it as invalid.
  1519			 */
  1520			if (!device_link_add(con, sup_dev, flags))
  1521				ret = -EINVAL;
  1522	
  1523			goto out;
  1524		}
  1525	
  1526		/*
  1527		 * DL_FLAG_SYNC_STATE_ONLY doesn't block probing and supports
  1528		 * cycles. So cycle detection isn't necessary and shouldn't be
  1529		 * done.
  1530		 */
  1531		if (flags & DL_FLAG_SYNC_STATE_ONLY)
  1532			return -EAGAIN;
  1533	
  1534		/*
  1535		 * If we can't find the supplier device from its fwnode, it might be
  1536		 * due to a cyclic dependency between fwnodes. Some of these cycles can
  1537		 * be broken by applying logic. Check for these types of cycles and
  1538		 * break them so that devices in the cycle probe properly.
  1539		 *
  1540		 * If the supplier's parent is dependent on the consumer, then
  1541		 * the consumer-supplier dependency is a false dependency. So,
  1542		 * treat it as an invalid link.
  1543		 */
  1544		sup_dev = fwnode_get_next_parent_dev(sup_handle);
  1545		if (sup_dev && device_is_dependent(con, sup_dev)) {
  1546			dev_dbg(con, "Not linking to %pfwP - False link\n",
  1547				sup_handle);
  1548			ret = -EINVAL;
  1549		} else {
  1550			/*
  1551			 * Can't check for cycles or no cycles. So let's try
  1552			 * again later.
  1553			 */
  1554			ret = -EAGAIN;
  1555		}
  1556	
  1557	out:
  1558		put_device(sup_dev);
  1559		return ret;
  1560	}
  1561	
  1562	/**
  1563	 * __fw_devlink_link_to_consumers - Create device links to consumers of a device
  1564	 * @dev - Device that needs to be linked to its consumers
  1565	 *
  1566	 * This function looks at all the consumer fwnodes of @dev and creates device
  1567	 * links between the consumer device and @dev (supplier).
  1568	 *
  1569	 * If the consumer device has not been added yet, then this function creates a
  1570	 * SYNC_STATE_ONLY link between @dev (supplier) and the closest ancestor device
  1571	 * of the consumer fwnode. This is necessary to make sure @dev doesn't get a
  1572	 * sync_state() callback before the real consumer device gets to be added and
  1573	 * then probed.
  1574	 *
  1575	 * Once device links are created from the real consumer to @dev (supplier), the
  1576	 * fwnode links are deleted.
  1577	 */
  1578	static void __fw_devlink_link_to_consumers(struct device *dev)
> 1579	{
  1580		struct fwnode_handle *fwnode = dev->fwnode;
  1581		struct fwnode_link *link, *tmp;
  1582	
  1583		list_for_each_entry_safe(link, tmp, &fwnode->consumers, s_hook) {
  1584			u32 dl_flags = fw_devlink_get_flags();
  1585			struct device *con_dev;
  1586			bool own_link = true;
  1587			int ret;
  1588	
  1589			con_dev = get_dev_from_fwnode(link->consumer);
  1590			/*
  1591			 * If consumer device is not available yet, make a "proxy"
  1592			 * SYNC_STATE_ONLY link from the consumer's parent device to
  1593			 * the supplier device. This is necessary to make sure the
  1594			 * supplier doesn't get a sync_state() callback before the real
  1595			 * consumer can create a device link to the supplier.
  1596			 *
  1597			 * This proxy link step is needed to handle the case where the
  1598			 * consumer's parent device is added before the supplier.
  1599			 */
  1600			if (!con_dev) {
  1601				con_dev = fwnode_get_next_parent_dev(link->consumer);
  1602				/*
  1603				 * However, if the consumer's parent device is also the
  1604				 * parent of the supplier, don't create a
  1605				 * consumer-supplier link from the parent to its child
  1606				 * device. Such a dependency is impossible.
  1607				 */
  1608				if (con_dev &&
  1609				    fwnode_is_ancestor_of(con_dev->fwnode, fwnode)) {
  1610					put_device(con_dev);
  1611					con_dev = NULL;
  1612				} else {
  1613					own_link = false;
  1614					dl_flags = DL_FLAG_SYNC_STATE_ONLY;
  1615				}
  1616			}
  1617	
  1618			if (!con_dev)
  1619				continue;
  1620	
  1621			ret = fw_devlink_create_devlink(con_dev, fwnode, dl_flags);
  1622			put_device(con_dev);
  1623			if (!own_link || ret == -EAGAIN)
  1624				continue;
  1625	
  1626			list_del(&link->s_hook);
  1627			list_del(&link->c_hook);
  1628			kfree(link);
  1629		}
  1630	}
  1631	
  1632	/**
  1633	 * __fw_devlink_link_to_suppliers - Create device links to suppliers of a device
  1634	 * @dev - The consumer device that needs to be linked to its suppliers
  1635	 * @fwnode - Root of the fwnode tree that is used to create device links
  1636	 *
  1637	 * This function looks at all the supplier fwnodes of fwnode tree rooted at
  1638	 * @fwnode and creates device links between @dev (consumer) and all the
  1639	 * supplier devices of the entire fwnode tree at @fwnode.
  1640	 *
  1641	 * The function creates normal (non-SYNC_STATE_ONLY) device links between @dev
  1642	 * and the real suppliers of @dev. Once these device links are created, the
  1643	 * fwnode links are deleted. When such device links are successfully created,
  1644	 * this function is called recursively on those supplier devices. This is
  1645	 * needed to detect and break some invalid cycles in fwnode links.  See
  1646	 * fw_devlink_create_devlink() for more details.
  1647	 *
  1648	 * In addition, it also looks at all the suppliers of the entire fwnode tree
  1649	 * because some of the child devices of @dev that have not been added yet
  1650	 * (because @dev hasn't probed) might already have their suppliers added to
  1651	 * driver core. So, this function creates SYNC_STATE_ONLY device links between
  1652	 * @dev (consumer) and these suppliers to make sure they don't execute their
  1653	 * sync_state() callbacks before these child devices have a chance to create
  1654	 * their device links. The fwnode links that correspond to the child devices
  1655	 * aren't delete because they are needed later to create the device links
  1656	 * between the real consumer and supplier devices.
  1657	 */
  1658	static void __fw_devlink_link_to_suppliers(struct device *dev,
  1659						   struct fwnode_handle *fwnode)
> 1660	{
  1661		bool own_link = (dev->fwnode == fwnode);
  1662		struct fwnode_link *link, *tmp;
  1663		struct fwnode_handle *child = NULL;
  1664		u32 dl_flags;
  1665	
  1666		if (own_link)
  1667			dl_flags = fw_devlink_get_flags();
  1668		else
  1669			dl_flags = DL_FLAG_SYNC_STATE_ONLY;
  1670	
  1671		list_for_each_entry_safe(link, tmp, &fwnode->suppliers, c_hook) {
  1672			int ret;
  1673			struct device *sup_dev;
  1674			struct fwnode_handle *sup = link->supplier;
  1675	
  1676			ret = fw_devlink_create_devlink(dev, sup, dl_flags);
  1677			if (!own_link || ret == -EAGAIN)
  1678				continue;
  1679	
  1680			list_del(&link->s_hook);
  1681			list_del(&link->c_hook);
  1682			kfree(link);
  1683	
  1684			/* If no device link was created, nothing more to do. */
  1685			if (ret)
  1686				continue;
  1687	
  1688			/*
  1689			 * If a device link was successfully created to a supplier, we
  1690			 * now need to try and link the supplier to all its suppliers.
  1691			 *
  1692			 * This is needed to detect and delete false dependencies in
  1693			 * fwnode links that haven't been converted to a device link
  1694			 * yet. See comments in fw_devlink_create_devlink() for more
  1695			 * details on the false dependency.
  1696			 *
  1697			 * Without deleting these false dependencies, some devices will
  1698			 * never probe because they'll keep waiting for their false
  1699			 * dependency fwnode links to be converted to device links.
  1700			 */
  1701			sup_dev = get_dev_from_fwnode(sup);
  1702			__fw_devlink_link_to_suppliers(sup_dev, sup_dev->fwnode);
  1703			put_device(sup_dev);
  1704		}
  1705	
  1706		/*
  1707		 * Make "proxy" SYNC_STATE_ONLY device links to represent the needs of
  1708		 * all the descendants. This proxy link step is needed to handle the
  1709		 * case where the supplier is added before the consumer's parent device
  1710		 * (@dev).
  1711		 */
  1712		while ((child = fwnode_get_next_available_child_node(fwnode, child)))
  1713			__fw_devlink_link_to_suppliers(dev, child);
  1714	}
  1715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
