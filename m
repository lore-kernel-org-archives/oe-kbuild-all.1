Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7D218EB7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350670; cv=none; b=uhFmYkL+unlE0HPO5+iZvamHN0ut13MbTpQYejeTEAbVL9qEbWrf87T4OlvBMsXWL2osCzQtGfDdHdF3paDXDrTofCUIqjhFRLPp4iE+k3NZPOYgE1yUzcym5beciOrxEadCVm9XY31TsUbleGNs70CB+mmbjUdM3DUWZCWyzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350670; c=relaxed/simple;
	bh=ISSneeCKztoeFQuOwlHaOWSgs0jKsJ1pk1Zw6+/8wTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sP0usx5EQJ7YmTWsUN2SbMKttSCbRHa2rVqJpHol+psoLDQHxQltWkdrIb5Zpd4f4K2Rn7WIa2fFHZp4KneYx6qo/FilxiXb/d9apT2G/a/lmyylvUXfy7yZpT2wtFKUoA8rnd5oq+7G4R0KlvLrqaMKAL2b2tP1jnfNwbY0e7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mw5FWq+T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mw5FWq+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741350668; x=1772886668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ISSneeCKztoeFQuOwlHaOWSgs0jKsJ1pk1Zw6+/8wTQ=;
  b=Mw5FWq+T4usd1aT0ZdoL1kthtRfg3FfM7HkunUqDGRkfVr8S3gALB+3o
   uQ+NKparcZ5y/wIuuSw9s1TAV8EAyB2uu3aKZHBmy/NhJLwVD9BAwO53U
   bkwZywmH/JYLXDHaTvOQ7wofHzURgckyFX/V+1Tp49H1F6SRnjeRqsy2P
   lJzJLwTnDMMJyh2IzOpD1IcboVkGn9gcz5I8G/aD7m0YQ4awx7dkRHkr7
   AHyz0ZXGmPFClZzPN5bstZboSDA4BIhKHsQHv1SEn9WrACxJJed8wF0ls
   lB2D2kEQuLpOEynb5qukaKz9FMAMrv7LB5IdzNfWnTLOBSRlDs2wSE4Wz
   g==;
X-CSE-ConnectionGUID: VAuBdxfNQpOUfcI1WJ+XXw==
X-CSE-MsgGUID: vsghCBfySlOdrX4A2xrXCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42274954"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42274954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:31:06 -0800
X-CSE-ConnectionGUID: TQ6qmN4dQOCnCxVTC34g+Q==
X-CSE-MsgGUID: Js0UaOOuR9aHDa/SuVhl4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124230490"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2025 04:31:04 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWr0-0000Sq-00;
	Fri, 07 Mar 2025 12:31:02 +0000
Date: Fri, 7 Mar 2025 20:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next v1 5/6] RDMA/mlx5: Expose RDMA TRANSPORT flow
 table types to userspace
Message-ID: <202503072017.WC5d8E9k-lkp@intel.com>
References: <2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/RDMA-uverbs-Introduce-UCAP-User-CAPabilities-API/20250306-195708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/2287d8c50483e880450c7e8e08d9de34cdec1b14.1741261611.git.leon%40kernel.org
patch subject: [PATCH rdma-next v1 5/6] RDMA/mlx5: Expose RDMA TRANSPORT flow table types to userspace
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503072017.WC5d8E9k-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503072017.WC5d8E9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503072017.WC5d8E9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/fs.c: In function '_get_prio':
   drivers/infiniband/hw/mlx5/fs.c:702:16: error: 'struct mlx5_flow_table_attr' has no member named 'vport'
     702 |         ft_attr.vport = vport;
         |                ^
   drivers/infiniband/hw/mlx5/fs.c: In function 'mlx5_ib_fill_transport_ns_info':
   drivers/infiniband/hw/mlx5/fs.c:1430:14: error: implicit declaration of function 'MLX5_CAP_ADV_RDMA'; did you mean 'MLX5_CAP_ODP_MAX'? [-Werror=implicit-function-declaration]
    1430 |         if (!MLX5_CAP_ADV_RDMA(dev->mdev, rdma_transport_manager))
         |              ^~~~~~~~~~~~~~~~~
         |              MLX5_CAP_ODP_MAX
   drivers/infiniband/hw/mlx5/fs.c:1430:43: error: 'rdma_transport_manager' undeclared (first use in this function); did you mean 'rdma_transport_type'?
    1430 |         if (!MLX5_CAP_ADV_RDMA(dev->mdev, rdma_transport_manager))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           rdma_transport_type
   drivers/infiniband/hw/mlx5/fs.c:1430:43: note: each undeclared identifier is reported only once for each function it appears in
   drivers/infiniband/hw/mlx5/fs.c: In function '_get_flow_table':
   drivers/infiniband/hw/mlx5/fs.c:1510:14: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS'?
    1510 |         case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS
   drivers/infiniband/hw/mlx5/fs.c:1511:14: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC'?
    1511 |         case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC
   drivers/infiniband/hw/mlx5/fs.c:1512:53: error: 'MLX5_RDMA_TRANSPORT_BYPASS_PRIO' undeclared (first use in this function)
    1512 |                 if (ib_port == 0 || user_priority > MLX5_RDMA_TRANSPORT_BYPASS_PRIO)
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from include/linux/ethtool.h:16,
                    from include/rdma/ib_verbs.h:15,
                    from drivers/infiniband/hw/mlx5/fs.c:7:
   drivers/infiniband/hw/mlx5/fs.c:1522:37: error: implicit declaration of function 'MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX'; did you mean 'MLX5_CAP_FLOWTABLE_RDMA_TX'? [-Werror=implicit-function-declaration]
    1522 |                                 BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX(
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/infiniband/hw/mlx5/fs.c:1523:50: error: 'log_max_ft_size' undeclared (first use in this function)
    1523 |                                         ft_mdev, log_max_ft_size));
         |                                                  ^~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/infiniband/hw/mlx5/fs.c:1526:37: error: implicit declaration of function 'MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX'; did you mean 'MLX5_CAP_FLOWTABLE_RDMA_TX'? [-Werror=implicit-function-declaration]
    1526 |                                 BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX(
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/infiniband/hw/mlx5/fs.c:1538:22: error: implicit declaration of function 'mlx5_get_flow_vport_namespace'; did you mean 'mlx5_get_flow_vport_acl_namespace'? [-Werror=implicit-function-declaration]
    1538 |                 ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      mlx5_get_flow_vport_acl_namespace
>> drivers/infiniband/hw/mlx5/fs.c:1538:20: warning: assignment to 'struct mlx5_flow_namespace *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1538 |                 ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
         |                    ^
   drivers/infiniband/hw/mlx5/fs.c: In function 'mlx5_ib_ft_type_to_namespace':
   drivers/infiniband/hw/mlx5/fs.c:1814:30: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS'?
    1814 |                 *namespace = MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS
   drivers/infiniband/hw/mlx5/fs.c:1817:30: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC'?
    1817 |                 *namespace = MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX;
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC
   drivers/infiniband/hw/mlx5/fs.c: In function 'get_dests':
   drivers/infiniband/hw/mlx5/fs.c:1909:37: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS'?
    1909 |              fs_matcher->ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX) &&
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS
   drivers/infiniband/hw/mlx5/fs.c:1949:44: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC'?
    1949 |                     fs_matcher->ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX) &&
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC
   drivers/infiniband/hw/mlx5/fs.c: In function 'mlx5_ib_handler_MLX5_IB_METHOD_FLOW_MATCHER_CREATE':
   drivers/infiniband/hw/mlx5/fs.c:2500:37: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS'?
    2500 |                 if (obj->ns_type != MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX &&
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     MLX5_FLOW_NAMESPACE_RDMA_TX_COUNTERS
   drivers/infiniband/hw/mlx5/fs.c:2501:37: error: 'MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX' undeclared (first use in this function); did you mean 'MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC'?
    2501 |                     obj->ns_type != MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX) {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     MLX5_FLOW_NAMESPACE_RDMA_TX_IPSEC
   cc1: some warnings being treated as errors


vim +1538 drivers/infiniband/hw/mlx5/fs.c

  1447	
  1448	static struct mlx5_ib_flow_prio *
  1449	_get_flow_table(struct mlx5_ib_dev *dev, u16 user_priority,
  1450			enum mlx5_flow_namespace_type ns_type,
  1451			bool mcast, u32 ib_port)
  1452	{
  1453		struct mlx5_core_dev *ft_mdev = dev->mdev;
  1454		struct mlx5_flow_namespace *ns = NULL;
  1455		struct mlx5_ib_flow_prio *prio = NULL;
  1456		int max_table_size = 0;
  1457		u16 vport_idx = 0;
  1458		bool esw_encap;
  1459		u32 flags = 0;
  1460		u16 vport = 0;
  1461		int priority;
  1462		int ret;
  1463	
  1464		if (mcast)
  1465			priority = MLX5_IB_FLOW_MCAST_PRIO;
  1466		else
  1467			priority = ib_prio_to_core_prio(user_priority, false);
  1468	
  1469		esw_encap = mlx5_eswitch_get_encap_mode(dev->mdev) !=
  1470			DEVLINK_ESWITCH_ENCAP_MODE_NONE;
  1471		switch (ns_type) {
  1472		case MLX5_FLOW_NAMESPACE_BYPASS:
  1473			max_table_size = BIT(
  1474				MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev, log_max_ft_size));
  1475			if (MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev, decap) && !esw_encap)
  1476				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_DECAP;
  1477			if (MLX5_CAP_FLOWTABLE_NIC_RX(dev->mdev,
  1478						      reformat_l3_tunnel_to_l2) &&
  1479			    !esw_encap)
  1480				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1481			break;
  1482		case MLX5_FLOW_NAMESPACE_EGRESS:
  1483			max_table_size = BIT(
  1484				MLX5_CAP_FLOWTABLE_NIC_TX(dev->mdev, log_max_ft_size));
  1485			if (MLX5_CAP_FLOWTABLE_NIC_TX(dev->mdev, reformat) &&
  1486			    !esw_encap)
  1487				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1488			break;
  1489		case MLX5_FLOW_NAMESPACE_FDB_BYPASS:
  1490			max_table_size = BIT(
  1491				MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev, log_max_ft_size));
  1492			if (MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev, decap) && esw_encap)
  1493				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_DECAP;
  1494			if (MLX5_CAP_ESW_FLOWTABLE_FDB(dev->mdev,
  1495						       reformat_l3_tunnel_to_l2) &&
  1496			    esw_encap)
  1497				flags |= MLX5_FLOW_TABLE_TUNNEL_EN_REFORMAT;
  1498			priority = user_priority;
  1499			break;
  1500		case MLX5_FLOW_NAMESPACE_RDMA_RX:
  1501			max_table_size = BIT(
  1502				MLX5_CAP_FLOWTABLE_RDMA_RX(dev->mdev, log_max_ft_size));
  1503			priority = user_priority;
  1504			break;
  1505		case MLX5_FLOW_NAMESPACE_RDMA_TX:
  1506			max_table_size = BIT(
  1507				MLX5_CAP_FLOWTABLE_RDMA_TX(dev->mdev, log_max_ft_size));
  1508			priority = user_priority;
  1509			break;
  1510		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
  1511		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
  1512			if (ib_port == 0 || user_priority > MLX5_RDMA_TRANSPORT_BYPASS_PRIO)
  1513				return ERR_PTR(-EINVAL);
  1514			ret = mlx5_ib_fill_transport_ns_info(dev, ns_type, &flags,
  1515							     &vport_idx, &vport,
  1516							     &ft_mdev, ib_port);
  1517			if (ret)
  1518				return ERR_PTR(ret);
  1519	
  1520			if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX)
  1521				max_table_size =
  1522					BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_RX(
  1523						ft_mdev, log_max_ft_size));
  1524			else
  1525				max_table_size =
  1526					BIT(MLX5_CAP_FLOWTABLE_RDMA_TRANSPORT_TX(
  1527						ft_mdev, log_max_ft_size));
  1528			priority = user_priority;
  1529			break;
  1530		default:
  1531			break;
  1532		}
  1533	
  1534		max_table_size = min_t(int, max_table_size, MLX5_FS_MAX_ENTRIES);
  1535	
  1536		if (ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX ||
  1537		    ns_type == MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX)
> 1538			ns = mlx5_get_flow_vport_namespace(ft_mdev, ns_type, vport_idx);
  1539		else
  1540			ns = mlx5_get_flow_namespace(ft_mdev, ns_type);
  1541	
  1542		if (!ns)
  1543			return ERR_PTR(-EOPNOTSUPP);
  1544	
  1545		switch (ns_type) {
  1546		case MLX5_FLOW_NAMESPACE_BYPASS:
  1547			prio = &dev->flow_db->prios[priority];
  1548			break;
  1549		case MLX5_FLOW_NAMESPACE_EGRESS:
  1550			prio = &dev->flow_db->egress_prios[priority];
  1551			break;
  1552		case MLX5_FLOW_NAMESPACE_FDB_BYPASS:
  1553			prio = &dev->flow_db->fdb[priority];
  1554			break;
  1555		case MLX5_FLOW_NAMESPACE_RDMA_RX:
  1556			prio = &dev->flow_db->rdma_rx[priority];
  1557			break;
  1558		case MLX5_FLOW_NAMESPACE_RDMA_TX:
  1559			prio = &dev->flow_db->rdma_tx[priority];
  1560			break;
  1561		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_RX:
  1562			prio = &dev->flow_db->rdma_transport_rx[ib_port - 1];
  1563			break;
  1564		case MLX5_FLOW_NAMESPACE_RDMA_TRANSPORT_TX:
  1565			prio = &dev->flow_db->rdma_transport_tx[ib_port - 1];
  1566			break;
  1567		default: return ERR_PTR(-EINVAL);
  1568		}
  1569	
  1570		if (!prio)
  1571			return ERR_PTR(-EINVAL);
  1572	
  1573		if (prio->flow_table)
  1574			return prio;
  1575	
  1576		return _get_prio(dev, ns, prio, priority, max_table_size,
  1577				 MLX5_FS_MAX_TYPES, flags, vport);
  1578	}
  1579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
