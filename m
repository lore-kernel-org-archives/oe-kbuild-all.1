Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C242E64C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709968100; cv=none; b=YijL09xdSqYA2aaG5KSWqxQeviTm76dYt+NA99FXr1Y6Yw6EeNaAg3ruEFkc6xxGpHvReOVzGsihhLVpI8W1MOFiwWaf2y6/G80uJjwo+zIstDAwF2Xkgcj3He5+BTqJIBOzf+WPAd5SqD65REVwc/zRBQjkTNkH6siqACmZhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709968100; c=relaxed/simple;
	bh=UK7s6j4xYMxMlheun1K9lfnBvpgU7jIjX9YxfybahBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KV6HK/y+0VkoDuXWzJOBHc9QaY1/na8pFDP4h/62BifU/i/RgZD/K2dbjJUqu2DS0C41EIckY9UU7qelUvbkNcXFdJ70PhJzYlmyTUz3LQ66tqPgWNbjsKECCYtPQ0BDeDzsT7jTMjPKDhG6tLzRWQH7IEe8EXvLtgP9ut5ePqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7lz89DA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7lz89DA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709968098; x=1741504098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UK7s6j4xYMxMlheun1K9lfnBvpgU7jIjX9YxfybahBs=;
  b=T7lz89DAHLAbDwDIEg96Lxpi1YZwkiHccDkISzzoZrco03AoWBUVTQoE
   CwxipHZHWeI7BWZUs/CgDueuv/qFINt33U4NsZrF8dyZtzkOKezZoA5St
   dVYHMr52WKugO/eQFiCqAPrNazR3C4nLbERFVyYdQxe5lpofoJR9qsVDW
   4eUePLuecBY2TgqQ7lyC2IJ5jYKqZ9iEhBr/bEDBIHz8RqOVBux9q/tEF
   mfJHTOaIH4Q483vLIK8aPjV2o5WH0JYvvhPxK8pBQQ2oaim3uDQk3EM6y
   1OBoebEc5iJeCOPrS24jTJkeUbnkRvvEso5XlDuhzxn5Im5jGEYdsdBeA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="5293389"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="5293389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 23:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="11078682"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Mar 2024 23:08:16 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riqoX-00075v-2H;
	Sat, 09 Mar 2024 07:08:13 +0000
Date: Sat, 9 Mar 2024 15:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13425/21785]
 drivers/net/ethernet/huawei/hinic/hinic_main.c:249:23: error: implicit
 declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'?
Message-ID: <202403091438.ZbJbSAui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3d10c870b322e5d1a4f8fb923b879a0b73246157
commit: 90f09a01314abe26de1a722d1b51c351d84e1f5b [13425/21785] net/hinic: Add support for X86 Arch
config: x86_64-randconfig-015-20240308 (https://download.01.org/0day-ci/archive/20240309/202403091438.ZbJbSAui-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091438.ZbJbSAui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091438.ZbJbSAui-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic/hinic_main.c: In function 'hinic_netdev_event':
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:249:23: error: implicit declaration of function 'vlan_dev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     249 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ^~~~~~~~~~~~~
         |                       netdev_priv
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:249:42: error: invalid type argument of '->' (have 'int')
     249 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                                          ^~
   drivers/net/ethernet/huawei/hinic/hinic_main.c:251:49: error: invalid type argument of '->' (have 'int')
     251 |                         ret = vlan_dev_priv(ret)->real_dev;
         |                                                 ^~
   drivers/net/ethernet/huawei/hinic/hinic_main.c: At top level:
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3294:6: warning: no previous prototype for 'nic_event' [-Wmissing-prototypes]
    3294 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         |      ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +249 drivers/net/ethernet/huawei/hinic/hinic_main.c

edd384f682cc29 Aviad Krawczyk 2017-08-21  221  
6cb2e756917d12 Xue            2019-01-31  222  #define HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT	2
6cb2e756917d12 Xue            2019-01-31  223  #define HINIC_VLAN_CLEAR_OFFLOAD	(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM | \
6cb2e756917d12 Xue            2019-01-31  224  					 NETIF_F_SCTP_CRC | NETIF_F_RXCSUM | \
6cb2e756917d12 Xue            2019-01-31  225  					 NETIF_F_ALL_TSO)
edd384f682cc29 Aviad Krawczyk 2017-08-21  226  
6cb2e756917d12 Xue            2019-01-31  227  int hinic_netdev_event(struct notifier_block *notifier,
6cb2e756917d12 Xue            2019-01-31  228  		       unsigned long event, void *ptr)
edd384f682cc29 Aviad Krawczyk 2017-08-21  229  {
6cb2e756917d12 Xue            2019-01-31  230  	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
6cb2e756917d12 Xue            2019-01-31  231  	struct net_device *real_dev, *ret;
6cb2e756917d12 Xue            2019-01-31  232  	struct hinic_nic_dev *nic_dev;
6cb2e756917d12 Xue            2019-01-31  233  	u16 vlan_depth;
6cb2e756917d12 Xue            2019-01-31  234  
6cb2e756917d12 Xue            2019-01-31  235  	if (!is_vlan_dev(ndev))
6cb2e756917d12 Xue            2019-01-31  236  		return NOTIFY_DONE;
6cb2e756917d12 Xue            2019-01-31  237  
6cb2e756917d12 Xue            2019-01-31  238  	dev_hold(ndev);
6cb2e756917d12 Xue            2019-01-31  239  
6cb2e756917d12 Xue            2019-01-31  240  	switch (event) {
6cb2e756917d12 Xue            2019-01-31  241  	case NETDEV_REGISTER:
6cb2e756917d12 Xue            2019-01-31  242  		real_dev = vlan_dev_real_dev(ndev);
6cb2e756917d12 Xue            2019-01-31  243  		nic_dev = hinic_get_uld_dev_by_ifname(real_dev->name,
6cb2e756917d12 Xue            2019-01-31  244  						      SERVICE_T_NIC);
6cb2e756917d12 Xue            2019-01-31  245  		if (!nic_dev)
6cb2e756917d12 Xue            2019-01-31  246  			goto out;
6cb2e756917d12 Xue            2019-01-31  247  
6cb2e756917d12 Xue            2019-01-31  248  		vlan_depth = 1;
6cb2e756917d12 Xue            2019-01-31 @249  		ret = vlan_dev_priv(ndev)->real_dev;
6cb2e756917d12 Xue            2019-01-31  250  		while (is_vlan_dev(ret)) {
6cb2e756917d12 Xue            2019-01-31  251  			ret = vlan_dev_priv(ret)->real_dev;
6cb2e756917d12 Xue            2019-01-31  252  			vlan_depth++;
6cb2e756917d12 Xue            2019-01-31  253  		}
6cb2e756917d12 Xue            2019-01-31  254  
6cb2e756917d12 Xue            2019-01-31  255  		if (vlan_depth == HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
6cb2e756917d12 Xue            2019-01-31  256  			ndev->vlan_features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
6cb2e756917d12 Xue            2019-01-31  257  		} else if (vlan_depth > HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
6cb2e756917d12 Xue            2019-01-31  258  #ifdef HAVE_NDO_SET_FEATURES
6cb2e756917d12 Xue            2019-01-31  259  #ifdef HAVE_RHEL6_NET_DEVICE_OPS_EXT
6cb2e756917d12 Xue            2019-01-31  260  			set_netdev_hw_features(ndev,
6cb2e756917d12 Xue            2019-01-31  261  					       get_netdev_hw_features(ndev) &
6cb2e756917d12 Xue            2019-01-31  262  					       (~HINIC_VLAN_CLEAR_OFFLOAD));
6cb2e756917d12 Xue            2019-01-31  263  #else
6cb2e756917d12 Xue            2019-01-31  264  			ndev->hw_features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
6cb2e756917d12 Xue            2019-01-31  265  #endif
6cb2e756917d12 Xue            2019-01-31  266  #endif
6cb2e756917d12 Xue            2019-01-31  267  			ndev->features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
6cb2e756917d12 Xue            2019-01-31  268  		}
edd384f682cc29 Aviad Krawczyk 2017-08-21  269  
6cb2e756917d12 Xue            2019-01-31  270  		break;
edd384f682cc29 Aviad Krawczyk 2017-08-21  271  
6cb2e756917d12 Xue            2019-01-31  272  	default:
6cb2e756917d12 Xue            2019-01-31  273  		break;
6cb2e756917d12 Xue            2019-01-31  274  	};
edd384f682cc29 Aviad Krawczyk 2017-08-21  275  
6cb2e756917d12 Xue            2019-01-31  276  out:
6cb2e756917d12 Xue            2019-01-31  277  	dev_put(ndev);
edd384f682cc29 Aviad Krawczyk 2017-08-21  278  
6cb2e756917d12 Xue            2019-01-31  279  	return NOTIFY_DONE;
edd384f682cc29 Aviad Krawczyk 2017-08-21  280  }
6cb2e756917d12 Xue            2019-01-31  281  #endif
edd384f682cc29 Aviad Krawczyk 2017-08-21  282  

:::::: The code at line 249 was first introduced by commit
:::::: 6cb2e756917d122560e0c52f350682760d004eec net: hinic: Add NIC Layer

:::::: TO: Xue <xuechaojing@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
