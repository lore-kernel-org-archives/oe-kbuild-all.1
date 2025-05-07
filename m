Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE128D8CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654565; cv=none; b=t9vCvAgglK2/hZYKris+T4Ox8HPVVcxDzlWrTOdWbUNrYgV+uyqe/b279n75LHzrfvuLjEp5eA1Q4SKQ1w9QAPmKPjIhP9VnCEnnAzrj9jDVU0J6fuUzgxTEhOaV8Gq6xX6rmpDwe9sr3kq9PbrQVFsnAInMksk3jA351bc83L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654565; c=relaxed/simple;
	bh=R+9WgEdRQYc2xDhgOGL+uoJX/czlnrNA53bvN/w6qNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfwjCYGJUXrKejQlgu7pfFWxCM4gnT8Yy1+jzVk9F2VC67Ey4n/dyy7jceZUBokVDjJXkmdvoRYjyfnxwef8JbGXYktLvhmftD5xtUhz2y4veQEOx5OyIz8uppK/tiAMyrNQ3VJlF+l0WJqCrTPQ9xyvnTE+GmYDqmOuIJvnbVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fh+PmufD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fh+PmufD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746654564; x=1778190564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+9WgEdRQYc2xDhgOGL+uoJX/czlnrNA53bvN/w6qNk=;
  b=fh+PmufDwehAzqlK1zPOOrAg37mCbvmnhG9QkPYIvLMztFj0rRsU9NiC
   MdIdl7wwSUCjp7i0ubQ2VFi1uZOjU9N9g5yGzzCspvnVo1M8kguXXneOA
   w7OhDneTIOyowIm8vEFnTtcKhdUaV+A4cbUYLsp7tw+inZARrD8gevpoD
   3pPUu8jRx6n/Z6diX3VkNtWqDVZQxd9x6EqXZLCJD/d1a4CD/9fvd7fQX
   B58zzQuCeDLxgSQhy5VAATd7Te/WjAStMtlFpxNNr1FNAzS6kW2jcKRgZ
   U8GHIU6fTKFcuX8G4i+z8i9FudIT1jbW115VByX0Cxn5xLtGJiFwUx3ez
   w==;
X-CSE-ConnectionGUID: sGOaWQp/RSWFxFa8j7H5WA==
X-CSE-MsgGUID: o6ra5KK9Q++3umCRzdS/fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65944488"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="65944488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 14:49:23 -0700
X-CSE-ConnectionGUID: JtJjEojqSFOxylOEjDxUJQ==
X-CSE-MsgGUID: CBrrIjbgQ8emlHEhFasNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="141292025"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 14:49:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCmdj-00095T-3C;
	Wed, 07 May 2025 21:49:19 +0000
Date: Thu, 8 May 2025 05:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2208/2208]
 drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1128:21: warning: variable
 'bond_dev' set but not used
Message-ID: <202505080526.qCQgtY7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66448995cc552d846c7442188f69e833f4a86676
commit: d0888acfac5d4aca4538e40f027e80d9230c5002 [2208/2208] drivers: update Yunsilicon drivers to version rel_2412_std_card
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505080526.qCQgtY7V-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080526.qCQgtY7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505080526.qCQgtY7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c:1128:21: warning: variable 'bond_dev' set but not used [-Wunused-but-set-variable]
    1128 |         struct net_device *bond_dev;
         |                            ^
   1 warning generated.
--
>> drivers/net/ethernet/yunsilicon/xsc/pci/sriov_sysfs.c:911:31: warning: unused variable 'vf_type_ib' [-Wunused-const-variable]
     911 | static const struct kobj_type vf_type_ib = {
         |                               ^~~~~~~~~~
   1 warning generated.


vim +/bond_dev +1128 drivers/net/ethernet/yunsilicon/xsc/pci/xsc_lag.c

601fb01dc16f74 tianx    2024-04-11  1122  
bcfb3e65a5707c Tian Xin 2024-10-30  1123  static void xsc_handle_changelowerstate_event(struct xsc_board_lag *board_lag,
bcfb3e65a5707c Tian Xin 2024-10-30  1124  					      struct net_device *ndev,
bcfb3e65a5707c Tian Xin 2024-10-30  1125  					      struct netdev_notifier_changelowerstate_info *info)
601fb01dc16f74 tianx    2024-04-11  1126  {
bcfb3e65a5707c Tian Xin 2024-10-30  1127  	struct netdev_lag_lower_state_info *lag_lower_info;
bcfb3e65a5707c Tian Xin 2024-10-30 @1128  	struct net_device *bond_dev;
bcfb3e65a5707c Tian Xin 2024-10-30  1129  	struct slave *slave;
bcfb3e65a5707c Tian Xin 2024-10-30  1130  	struct xsc_lag *lag;
bcfb3e65a5707c Tian Xin 2024-10-30  1131  	u8 bond_id;
bcfb3e65a5707c Tian Xin 2024-10-30  1132  	enum lag_slave_status slave_status = XSC_LAG_SLAVE_INACTIVE;
d0888acfac5d4a Xin Tian 2025-04-29  1133  	struct xsc_adapter *adapter;
d0888acfac5d4a Xin Tian 2025-04-29  1134  	struct xsc_core_device *xdev;
601fb01dc16f74 tianx    2024-04-11  1135  
bcfb3e65a5707c Tian Xin 2024-10-30  1136  	if (!netif_is_lag_port(ndev) || !info->lower_state_info)
bcfb3e65a5707c Tian Xin 2024-10-30  1137  		return;
601fb01dc16f74 tianx    2024-04-11  1138  
bcfb3e65a5707c Tian Xin 2024-10-30  1139  	rcu_read_lock();
bcfb3e65a5707c Tian Xin 2024-10-30  1140  	slave = bond_slave_get_rtnl(ndev);
bcfb3e65a5707c Tian Xin 2024-10-30  1141  	rcu_read_unlock();
bcfb3e65a5707c Tian Xin 2024-10-30  1142  	if (!slave || !slave->bond || !slave->bond->dev)
bcfb3e65a5707c Tian Xin 2024-10-30  1143  		return;
601fb01dc16f74 tianx    2024-04-11  1144  
bcfb3e65a5707c Tian Xin 2024-10-30  1145  	bond_dev = slave->bond->dev;
bcfb3e65a5707c Tian Xin 2024-10-30  1146  
bcfb3e65a5707c Tian Xin 2024-10-30  1147  	lag_lower_info = info->lower_state_info;
bcfb3e65a5707c Tian Xin 2024-10-30  1148  	if (lag_lower_info->link_up && lag_lower_info->tx_enabled)
bcfb3e65a5707c Tian Xin 2024-10-30  1149  		slave_status = XSC_LAG_SLAVE_ACTIVE;
bcfb3e65a5707c Tian Xin 2024-10-30  1150  
bcfb3e65a5707c Tian Xin 2024-10-30  1151  	mutex_lock(&board_lag->lock);
bcfb3e65a5707c Tian Xin 2024-10-30  1152  	if (!xsc_board_lag_filter(board_lag, ndev)) {
bcfb3e65a5707c Tian Xin 2024-10-30  1153  		mutex_unlock(&board_lag->lock);
bcfb3e65a5707c Tian Xin 2024-10-30  1154  		return;
601fb01dc16f74 tianx    2024-04-11  1155  	}
601fb01dc16f74 tianx    2024-04-11  1156  
d0888acfac5d4a Xin Tian 2025-04-29  1157  	adapter = netdev_priv(ndev);
d0888acfac5d4a Xin Tian 2025-04-29  1158  	xdev = adapter->xdev;
d0888acfac5d4a Xin Tian 2025-04-29  1159  	bond_id = xdev->bond_id;
bcfb3e65a5707c Tian Xin 2024-10-30  1160  	if (bond_id == BOND_ID_INVALID) {
bcfb3e65a5707c Tian Xin 2024-10-30  1161  		mutex_unlock(&board_lag->lock);
bcfb3e65a5707c Tian Xin 2024-10-30  1162  		return;
601fb01dc16f74 tianx    2024-04-11  1163  	}
601fb01dc16f74 tianx    2024-04-11  1164  
bcfb3e65a5707c Tian Xin 2024-10-30  1165  	lag = &board_lag->xsc_lag[bond_id];
bcfb3e65a5707c Tian Xin 2024-10-30  1166  	pack_lag_update_member_status(lag, ndev, slave_status);
bcfb3e65a5707c Tian Xin 2024-10-30  1167  	mutex_unlock(&board_lag->lock);
bcfb3e65a5707c Tian Xin 2024-10-30  1168  
bcfb3e65a5707c Tian Xin 2024-10-30  1169  	return;
601fb01dc16f74 tianx    2024-04-11  1170  }
601fb01dc16f74 tianx    2024-04-11  1171  

:::::: The code at line 1128 was first introduced by commit
:::::: bcfb3e65a5707ca4caf593a33276f26b993ad71e drivers: update Yunsilicon driver to version 2406_rc16

:::::: TO: Tian Xin <tianx@yunsilicon.com>
:::::: CC: Tian Xin <tianx@yunsilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
