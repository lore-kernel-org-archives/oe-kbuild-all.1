Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC72199EB7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963635; cv=none; b=YyHv4ZE7li4HDRAovEYm5xGY+Qr8P3NzV/xcvy7WMJeOQqZEVRl2FARxiAgwds3vcvuOrqvxTIlT7OH36VNtzD+x0ltSF4bQRxpeAppNfQz1nswLMllxGalwSXBi3KiTrBH5RCuQ6/5GwmnMYY1KYY/z5U20VDHVxvSCMKYphvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963635; c=relaxed/simple;
	bh=tAmz5PskC+aJ4pGeZKB7O0F5Rgtc0oMT13kxgMvbTC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1HTRPsBAFeVAm9vBYw3ecX7y6c8jhAvhlsQ7eoO45hw/5d6g3GMouooAcgM3OnOxDFZD2Nag6LpuLB8Y0IpNFaqS65b8ZigqrdvUKLQQk6+lrX5eGBOCtdxfAn2mcOuAsYIrgbiDvnQbYRAhxd2aglzhqzG/eAG6nzkdFVibjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVvJIHAb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVvJIHAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738963633; x=1770499633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tAmz5PskC+aJ4pGeZKB7O0F5Rgtc0oMT13kxgMvbTC8=;
  b=TVvJIHAbX4Iqu8wRIKixCFApt+PofJoXAnVGEbaDvNERidEYf7TBAc5M
   Z8VTQ5+qICbG4JX3lDB88wv+X3lU2r5VJc6rF5stVmuEfwi9/e9hvxFqj
   LpzHIPukoorbaZCNKY8PwzRwtR+LpFT9qJm/uBKJWJQVPKpJEcbmBlmFq
   lxSKVEy97CqfD72rUBwHPFsOjirKO1//JZUAVHrZJKrNe61MdGVQfGOjf
   5ka4hv9QRdWck0+QWZk9qn04aDc5j5OAn3WbdmNgqVfu7MM1jY1uBz8tY
   sj4x8CWKGzIMGqMrBTp2KpsWkteiVvlulgmQZ/IhfJJ31xjcikGRHJWlX
   Q==;
X-CSE-ConnectionGUID: 9Bn9nXD1RNSV6lvsCqifzQ==
X-CSE-MsgGUID: FmFPYn4YQ0qM3nx/9/9Ppw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50241715"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="50241715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 13:27:12 -0800
X-CSE-ConnectionGUID: GPG+JS+FTXWHLi/AnnJtlA==
X-CSE-MsgGUID: c+za+E+WQX2mT+KBx3FgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112064907"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2025 13:27:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgVsR-000z49-3D;
	Fri, 07 Feb 2025 21:27:07 +0000
Date: Sat, 8 Feb 2025 05:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1901/1901]
 drivers/net/ethernet/huawei/hinic/hinic_main.c:204:30: error: member
 reference type 'int' is not a pointer
Message-ID: <202502080513.W05LfnyB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be69fb5fc3212547e4408752b099094739f31aaa
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [1901/1901] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: x86_64-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080513.W05LfnyB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080513.W05LfnyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080513.W05LfnyB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_main.c:18:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/huawei/hinic/hinic_main.c:204:9: error: call to undeclared function 'vlan_dev_priv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     204 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ^
>> drivers/net/ethernet/huawei/hinic/hinic_main.c:204:30: error: member reference type 'int' is not a pointer
     204 |                 ret = vlan_dev_priv(ndev)->real_dev;
         |                       ~~~~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:206:30: error: member reference type 'int' is not a pointer
     206 |                         ret = vlan_dev_priv(ret)->real_dev;
         |                               ~~~~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:182:5: warning: no previous prototype for function 'hinic_netdev_event' [-Wmissing-prototypes]
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | int hinic_netdev_event(struct notifier_block *notifier,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_main.c:2291:21: error: no member named 'dcbnl_ops' in 'struct net_device'
    2291 |                         adapter->netdev->dcbnl_ops = &hinic_dcbnl_ops;
         |                         ~~~~~~~~~~~~~~~  ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:6: warning: no previous prototype for function 'nic_event' [-Wmissing-prototypes]
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_main.c:3058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3058 | void nic_event(struct hinic_lld_dev *lld_dev, void *adapter,
         | ^
         | static 
   3 warnings and 4 errors generated.


vim +/int +204 drivers/net/ethernet/huawei/hinic/hinic_main.c

   176	
   177	#define HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT	2
   178	#define HINIC_VLAN_CLEAR_OFFLOAD	(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM | \
   179						 NETIF_F_SCTP_CRC | NETIF_F_RXCSUM | \
   180						 NETIF_F_ALL_TSO)
   181	
   182	int hinic_netdev_event(struct notifier_block *notifier,
   183			       unsigned long event, void *ptr)
   184	{
   185		struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
   186		struct net_device *real_dev, *ret;
   187		struct hinic_nic_dev *nic_dev;
   188		u16 vlan_depth;
   189	
   190		if (!is_vlan_dev(ndev))
   191			return NOTIFY_DONE;
   192	
   193		dev_hold(ndev);
   194	
   195		switch (event) {
   196		case NETDEV_REGISTER:
   197			real_dev = vlan_dev_real_dev(ndev);
   198			nic_dev = hinic_get_uld_dev_by_ifname(real_dev->name,
   199							      SERVICE_T_NIC);
   200			if (!nic_dev)
   201				goto out;
   202	
   203			vlan_depth = 1;
 > 204			ret = vlan_dev_priv(ndev)->real_dev;
   205			while (is_vlan_dev(ret)) {
   206				ret = vlan_dev_priv(ret)->real_dev;
   207				vlan_depth++;
   208			}
   209	
   210			if (vlan_depth == HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
   211				ndev->vlan_features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
   212			} else if (vlan_depth > HINIC_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT) {
   213				ndev->hw_features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
   214				ndev->features &= (~HINIC_VLAN_CLEAR_OFFLOAD);
   215			}
   216	
   217			break;
   218	
   219		default:
   220			break;
   221		};
   222	
   223	out:
   224		dev_put(ndev);
   225	
   226		return NOTIFY_DONE;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
