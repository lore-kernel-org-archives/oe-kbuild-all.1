Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F5286D63
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617469; cv=none; b=kCU/SHwyJct3je3E6pEIigf86nf9YuL9lx9Wes48aoHwNR0dy4Xj4o0X97RoC6vFAC+5bVlrSn9pyjAcuOWv4T6uOdMj1HKQlHdMoQqBkgph27IjXDMOHJlsOJaI+qH96NR9MuzYdmFErFqR3pBJJVRgEBhsTOtYg4zALtb0BZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617469; c=relaxed/simple;
	bh=49Q+xcDBC08lYgEtZ6ww+DHe0J0Y+EOdS5VnT1rruys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moV1c187SmResDn/AXAq0oT65wDPWZiSOq0i2BxSax6cAf/SBJr8tRFWZq7cYDvTLipp/47XflwItT9IiV0mRBnBBXZarphobW3A3q9wJucm59VaDuwacgyEyIn+jaX0jv3Bdn4PFvUZfrEueDxwss9PRjtc8+/O+8BOYnAHd/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6BUPuLU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6BUPuLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751617467; x=1783153467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49Q+xcDBC08lYgEtZ6ww+DHe0J0Y+EOdS5VnT1rruys=;
  b=f6BUPuLUuiy0p14yj3wjeA5idBnowZe1ZZQ10P0zFS1K4Mg1lyY8m5Fy
   P+lCr4apEDDgiXLNYw7773Y8DqMJOHQASu17GEm6dCGkN+gQFfysEHU1G
   DlPDYrJGqcxpWxHQ0ViCWMIi3splMIuffN96zN+M1WUqNTkbfwYL/Y/cW
   ZaLTjDXbLZNLpeDaFMprLUJlT4Bguen8iDkPcKs6Zk+KVeVhGx+fZFpee
   TPqUhfCLUVymIu8QPmXPvCUyKh6VxYtsjVAUz77ICfNrxGkTm75j4QZk+
   5imhiPlZzbUaiEIUVjo5fWOZ20t4KtpaE1QtK0aG8DOcdENdAeRIbawPA
   w==;
X-CSE-ConnectionGUID: IN5tEmXoT1+/fMETszq0Ug==
X-CSE-MsgGUID: gGBjpR/mRpKG8MBs1thOTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53172963"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53172963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:24:27 -0700
X-CSE-ConnectionGUID: ONcIO+2jTRKcpLy7lQ8LFA==
X-CSE-MsgGUID: DvC1MGGCTHW93G751wGvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="159141492"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 01:24:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXbiZ-0003UH-1K;
	Fri, 04 Jul 2025 08:24:23 +0000
Date: Fri, 4 Jul 2025 16:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3011/3011]
 drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:1524:2: warning: 'strncpy'
 specified bound 100 equals destination size
Message-ID: <202507041638.fqBxner2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   41b7827f33a9fc1fe425b85029312de34b0f0abe
commit: a0c5bfdbc099daf30cbadb9657803f0cb3f89d0b [3011/3011] drivers: support for rnpm drivers from Mucse Technology N10/N400
config: arm64-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041638.fqBxner2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041638.fqBxner2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041638.fqBxner2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:5: warning: no previous prototype for 'rnpm_mbx_get_pn_sn' [-Wmissing-prototypes]
     263 | int rnpm_mbx_get_pn_sn(struct rnpm_hw *hw, char pn[33], char sn[33])
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c: In function '_switch_loopback':
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:1524:2: warning: 'strncpy' specified bound 100 equals destination size [-Wstringop-truncation]
    1524 |  strncpy(name, peer_eth, sizeof(name));
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +1524 drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c

  1515	
  1516	static ssize_t _switch_loopback(struct rnpm_adapter *adapter,
  1517					const char *peer_eth, int en)
  1518	{
  1519		struct net_device *peer_netdev = NULL;
  1520		struct rnpm_adapter *peer_adapter = NULL;
  1521		int i;
  1522		char name[100];
  1523	
> 1524		strncpy(name, peer_eth, sizeof(name));
  1525		strim(name);
  1526	
  1527		peer_netdev = dev_get_by_name(&init_net, name);
  1528		if (!peer_netdev) {
  1529			e_dev_info("canot' find [%s]\n", name);
  1530			return -EINVAL;
  1531		}
  1532		peer_adapter = netdev_priv(peer_netdev);
  1533	
  1534		// check if in same slot
  1535		if (PCI_SLOT(peer_adapter->pdev->devfn) !=
  1536		    PCI_SLOT(adapter->pdev->devfn)) {
  1537			e_dev_info("%s %s not in same slot\n",
  1538				   netdev_name(adapter->netdev),
  1539				   netdev_name(peer_adapter->netdev));
  1540			dev_put(peer_netdev);
  1541			return -EINVAL;
  1542		}
  1543	
  1544		e_dev_info("%s: %s(%d,%d) <-> %s(%d,%d) en:%d\n", __func__,
  1545			   netdev_name(adapter->netdev), adapter->lane, adapter->port,
  1546			   netdev_name(peer_adapter->netdev), peer_adapter->lane,
  1547			   peer_adapter->port, en);
  1548	
  1549		/* clear pf0/pf1 input port policy eth reg */
  1550		for (i = 0; i < MAX_PORT_NUM; i++) {
  1551			wr32(&adapter->hw, RNPM_ETH_INPORT_POLICY_REG(i), 0);
  1552			wr32(&peer_adapter->hw, RNPM_ETH_INPORT_POLICY_REG(i), 0);
  1553		}
  1554	
  1555		wr32(&adapter->hw, RNPM_ETH_INPORT_POLICY_VAL, 0);
  1556		wr32(&peer_adapter->hw, RNPM_ETH_INPORT_POLICY_VAL, 0);
  1557	
  1558		do_switch_loopback_set(adapter, en, adapter->lane,
  1559				       to_switch_port(peer_adapter));
  1560	
  1561		do_switch_loopback_set(peer_adapter, en, peer_adapter->lane,
  1562				       to_switch_port(adapter));
  1563	
  1564		if (peer_netdev)
  1565			dev_put(peer_netdev);
  1566	
  1567		return 0;
  1568	}
  1569	static ssize_t switch_loopback_on_store(struct device *dev,
  1570						struct device_attribute *attr,
  1571						const char *buf, size_t count)
  1572	{
  1573		struct rnpm_adapter *adapter = netdev_priv(to_net_device(dev));
  1574	
  1575		return _switch_loopback(adapter, buf, 1) == 0 ? count : -EINVAL;
  1576	}
  1577	static DEVICE_ATTR_WO(switch_loopback_on);
  1578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
