Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8E1FC7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 03:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791728; cv=none; b=TROIT8FV4ASOmBD/7r2I5yXJNja78oa8x3/N/zmvxLKLnXkX6ffJ4fq8adaGwONM9ZYGNkuRIDLRNl5AGJgWqXGS1tuBlIgtu3XassTZW22VULO/4+h48t0H7i/UzVU/S1oenKMLiJE8K+oDONK6cysZKah+g5AI2tKBfOCluEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791728; c=relaxed/simple;
	bh=Kqz36kvGXfR4Ujzac3FC7zeMGbROQjtMOBV0nW/PAIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HBvXTuYU4jHAuh5oiV5VscCrfAWB5zQSTgIpFcgu8363hF3yRxqtx1qJlsGhE6TtwZJWppvueDdAwoY5cYMIPPo1nSg1Fh1L88c1WP7HMMq6AP0DIxaHOKICdBdrkNB37gGGoLqISqhwUsUEo+hjXacOdP/0w98eum5hYIKuyFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwWHUSLe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwWHUSLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791726; x=1800327726;
  h=date:from:to:cc:subject:message-id;
  bh=Kqz36kvGXfR4Ujzac3FC7zeMGbROQjtMOBV0nW/PAIE=;
  b=GwWHUSLeokDET/Sl6dImB8MmT9y9ETWevvNL784ipls+Kbss9UeCSBze
   OnBQyZfrzeqZ+SN8SScuDSIs4H83ccnMkKDtRPcxxZGPxQkiVHukvvVES
   uITF05j4sQ/NJklh4NdhfFLCUa2dcd7UIjexfyOuOVC9LUdqjV+U5I+qK
   Ov3q9Fow8TsSSoat7MRBuIOE627kGZAsc56oWRllDWYI1ZeXdefPOF1iP
   KqfDej/IFD+yNvJvOL3UiUVhLxSjsuc45GMXpFIXzsYbvo5Sg/KdUE6h7
   XaWWXWfbKnHTiqYUkskU8NbUHdT0N7nSGLTPaNiRegrHso/quLXAWGHgl
   g==;
X-CSE-ConnectionGUID: Uzkr4As/QP6t0bVU8/RTaQ==
X-CSE-MsgGUID: Cz8OiYyDSjSnNbJniIXM1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69903253"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69903253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 19:02:05 -0800
X-CSE-ConnectionGUID: uqQydB1EQ9SlHJ/eCl9QjA==
X-CSE-MsgGUID: j2vQJsOfQduFN7+FC6RP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243319400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 19:02:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfWi-00000000NOo-3J5l;
	Mon, 19 Jan 2026 03:02:00 +0000
Date: Mon, 19 Jan 2026 11:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>
Subject: drivers/infiniband/hw/mlx5/macsec.c:246:undefined reference
 to `macsec_netdev_is_offloaded'
Message-ID: <202601191026.2MzVFp0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 15d157c3ad018a7b9d99d0cf35d6b163e570728e eth: mlx5: remove Kconfig co-dependency with VXLAN
date:   5 months ago
config: csky-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191026.2MzVFp0i-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191026.2MzVFp0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191026.2MzVFp0i-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/infiniband/hw/mlx5/macsec.o: in function `mlx5r_add_gid_macsec_operations':
>> drivers/infiniband/hw/mlx5/macsec.c:246:(.text+0x7e6): undefined reference to `macsec_netdev_is_offloaded'
>> csky-linux-ld: drivers/infiniband/hw/mlx5/macsec.c:295:(.text+0x978): undefined reference to `macsec_netdev_is_offloaded'
   csky-linux-ld: drivers/infiniband/hw/mlx5/macsec.o: in function `mlx5r_del_gid_macsec_operations':
   drivers/infiniband/hw/mlx5/macsec.c:332:(.text+0xbc2): undefined reference to `macsec_netdev_is_offloaded'
   csky-linux-ld: drivers/infiniband/hw/mlx5/macsec.c:341:(.text+0xcd8): undefined reference to `macsec_netdev_is_offloaded'


vim +246 drivers/infiniband/hw/mlx5/macsec.c

758ce14aee825f Patrisious Haddad 2022-05-03  217  
758ce14aee825f Patrisious Haddad 2022-05-03  218  int mlx5r_add_gid_macsec_operations(const struct ib_gid_attr *attr)
758ce14aee825f Patrisious Haddad 2022-05-03  219  {
758ce14aee825f Patrisious Haddad 2022-05-03  220  	struct mlx5_ib_dev *dev = to_mdev(attr->device);
58dbd6428a6819 Patrisious Haddad 2023-04-13  221  	struct mlx5_macsec_device *macsec_device;
758ce14aee825f Patrisious Haddad 2022-05-03  222  	const struct ib_gid_attr *physical_gid;
758ce14aee825f Patrisious Haddad 2022-05-03  223  	struct mlx5_reserved_gids *mgids;
758ce14aee825f Patrisious Haddad 2022-05-03  224  	struct net_device *ndev;
758ce14aee825f Patrisious Haddad 2022-05-03  225  	int ret = 0;
58dbd6428a6819 Patrisious Haddad 2023-04-13  226  	union {
58dbd6428a6819 Patrisious Haddad 2023-04-13  227  		struct sockaddr_in  sockaddr_in;
58dbd6428a6819 Patrisious Haddad 2023-04-13  228  		struct sockaddr_in6 sockaddr_in6;
58dbd6428a6819 Patrisious Haddad 2023-04-13  229  	} addr;
758ce14aee825f Patrisious Haddad 2022-05-03  230  
758ce14aee825f Patrisious Haddad 2022-05-03  231  	if (attr->gid_type != IB_GID_TYPE_ROCE_UDP_ENCAP)
758ce14aee825f Patrisious Haddad 2022-05-03  232  		return 0;
758ce14aee825f Patrisious Haddad 2022-05-03  233  
758ce14aee825f Patrisious Haddad 2022-05-03  234  	if (!mlx5_is_macsec_roce_supported(dev->mdev)) {
758ce14aee825f Patrisious Haddad 2022-05-03  235  		mlx5_ib_dbg(dev, "RoCE MACsec not supported due to capabilities\n");
758ce14aee825f Patrisious Haddad 2022-05-03  236  		return 0;
758ce14aee825f Patrisious Haddad 2022-05-03  237  	}
758ce14aee825f Patrisious Haddad 2022-05-03  238  
758ce14aee825f Patrisious Haddad 2022-05-03  239  	rcu_read_lock();
758ce14aee825f Patrisious Haddad 2022-05-03  240  	ndev = rcu_dereference(attr->ndev);
758ce14aee825f Patrisious Haddad 2022-05-03  241  	if (!ndev) {
758ce14aee825f Patrisious Haddad 2022-05-03  242  		rcu_read_unlock();
758ce14aee825f Patrisious Haddad 2022-05-03  243  		return -ENODEV;
758ce14aee825f Patrisious Haddad 2022-05-03  244  	}
758ce14aee825f Patrisious Haddad 2022-05-03  245  
758ce14aee825f Patrisious Haddad 2022-05-03 @246  	if (!netif_is_macsec(ndev) || !macsec_netdev_is_offloaded(ndev)) {
758ce14aee825f Patrisious Haddad 2022-05-03  247  		rcu_read_unlock();
758ce14aee825f Patrisious Haddad 2022-05-03  248  		return 0;
758ce14aee825f Patrisious Haddad 2022-05-03  249  	}
58dbd6428a6819 Patrisious Haddad 2023-04-13  250  	dev_hold(ndev);
758ce14aee825f Patrisious Haddad 2022-05-03  251  	rcu_read_unlock();
758ce14aee825f Patrisious Haddad 2022-05-03  252  
58dbd6428a6819 Patrisious Haddad 2023-04-13  253  	mutex_lock(&dev->macsec.lock);
58dbd6428a6819 Patrisious Haddad 2023-04-13  254  	macsec_device = get_macsec_device(ndev, &dev->macsec.macsec_devices_list);
58dbd6428a6819 Patrisious Haddad 2023-04-13  255  	if (!macsec_device) {
58dbd6428a6819 Patrisious Haddad 2023-04-13  256  		ret = -ENOMEM;
58dbd6428a6819 Patrisious Haddad 2023-04-13  257  		goto dev_err;
58dbd6428a6819 Patrisious Haddad 2023-04-13  258  	}
58dbd6428a6819 Patrisious Haddad 2023-04-13  259  
758ce14aee825f Patrisious Haddad 2022-05-03  260  	physical_gid = rdma_find_gid(attr->device, &attr->gid,
758ce14aee825f Patrisious Haddad 2022-05-03  261  				     attr->gid_type, NULL);
58dbd6428a6819 Patrisious Haddad 2023-04-13  262  	if (!IS_ERR(physical_gid)) {
758ce14aee825f Patrisious Haddad 2022-05-03  263  		ret = set_roce_addr(to_mdev(physical_gid->device),
758ce14aee825f Patrisious Haddad 2022-05-03  264  				    physical_gid->port_num,
758ce14aee825f Patrisious Haddad 2022-05-03  265  				    physical_gid->index, NULL,
758ce14aee825f Patrisious Haddad 2022-05-03  266  				    physical_gid);
758ce14aee825f Patrisious Haddad 2022-05-03  267  		if (ret)
758ce14aee825f Patrisious Haddad 2022-05-03  268  			goto gid_err;
758ce14aee825f Patrisious Haddad 2022-05-03  269  
758ce14aee825f Patrisious Haddad 2022-05-03  270  		mgids = &dev->port[attr->port_num - 1].reserved_gids[physical_gid->index];
758ce14aee825f Patrisious Haddad 2022-05-03  271  		mgids->macsec_index = attr->index;
758ce14aee825f Patrisious Haddad 2022-05-03  272  		mgids->physical_gid = physical_gid;
58dbd6428a6819 Patrisious Haddad 2023-04-13  273  	}
758ce14aee825f Patrisious Haddad 2022-05-03  274  
58dbd6428a6819 Patrisious Haddad 2023-04-13  275  	/* Proceed with adding steering rules, regardless if there was gid ambiguity or not.*/
58dbd6428a6819 Patrisious Haddad 2023-04-13  276  	rdma_gid2ip((struct sockaddr *)&addr, &attr->gid);
58dbd6428a6819 Patrisious Haddad 2023-04-13  277  	ret = mlx5_macsec_add_roce_rule(ndev, (struct sockaddr *)&addr, attr->index,
58dbd6428a6819 Patrisious Haddad 2023-04-13  278  					&macsec_device->tx_rules_list,
58dbd6428a6819 Patrisious Haddad 2023-04-13  279  					&macsec_device->rx_rules_list, dev->mdev->macsec_fs);
58dbd6428a6819 Patrisious Haddad 2023-04-13  280  	if (ret && !IS_ERR(physical_gid))
58dbd6428a6819 Patrisious Haddad 2023-04-13  281  		goto rule_err;
758ce14aee825f Patrisious Haddad 2022-05-03  282  
58dbd6428a6819 Patrisious Haddad 2023-04-13  283  	mlx5_macsec_save_roce_gid(macsec_device, (struct sockaddr *)&addr, attr->index);
58dbd6428a6819 Patrisious Haddad 2023-04-13  284  
58dbd6428a6819 Patrisious Haddad 2023-04-13  285  	dev_put(ndev);
58dbd6428a6819 Patrisious Haddad 2023-04-13  286  	mutex_unlock(&dev->macsec.lock);
58dbd6428a6819 Patrisious Haddad 2023-04-13  287  	return ret;
58dbd6428a6819 Patrisious Haddad 2023-04-13  288  
58dbd6428a6819 Patrisious Haddad 2023-04-13  289  rule_err:
58dbd6428a6819 Patrisious Haddad 2023-04-13  290  	set_roce_addr(to_mdev(physical_gid->device), physical_gid->port_num,
58dbd6428a6819 Patrisious Haddad 2023-04-13  291  		      physical_gid->index, &physical_gid->gid, physical_gid);
58dbd6428a6819 Patrisious Haddad 2023-04-13  292  	mgids->macsec_index = -1;
758ce14aee825f Patrisious Haddad 2022-05-03  293  gid_err:
758ce14aee825f Patrisious Haddad 2022-05-03  294  	rdma_put_gid_attr(physical_gid);
58dbd6428a6819 Patrisious Haddad 2023-04-13 @295  	cleanup_macsec_device(macsec_device);
58dbd6428a6819 Patrisious Haddad 2023-04-13  296  dev_err:
58dbd6428a6819 Patrisious Haddad 2023-04-13  297  	dev_put(ndev);
58dbd6428a6819 Patrisious Haddad 2023-04-13  298  	mutex_unlock(&dev->macsec.lock);
758ce14aee825f Patrisious Haddad 2022-05-03  299  	return ret;
758ce14aee825f Patrisious Haddad 2022-05-03  300  }
758ce14aee825f Patrisious Haddad 2022-05-03  301  

:::::: The code at line 246 was first introduced by commit
:::::: 758ce14aee825f8f3ca8f76c9991c108094cae8b RDMA/mlx5: Implement MACsec gid addition and deletion

:::::: TO: Patrisious Haddad <phaddad@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
