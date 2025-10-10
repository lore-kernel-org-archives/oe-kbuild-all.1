Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38ED26CE1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091565; cv=none; b=s+Mi7gXSfLBRWaDkGh+Zns6ziQjlZv1ERoUtTPw7SIn/UJoplNfo5Az4Uh5ZJra9IYqz0vIiYV6pLhafOg2vzrgi11sBkUnfm0vky8pEhkxLaMIQm3KAdv1Rel9QCgkIjTGhI9WwAgcem+nlr5C1TQH9lqG/dj9/XCcuMZhhFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091565; c=relaxed/simple;
	bh=dgGReKGpGjCNW3w2o2EMwgn1c2dXdcl2li4SCvYsDfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TCvRyQRzropuDsaSG4R+K4u9/Jf+o95KpTTukUsy5jccoH0penoBZ66zD/eoQzE1lS3o3cTZnjdTL7FY66XHU5sXrJebzq6MQKmQM2ukbgtbVqzjPSeGyvcuYEcZMYQNe4r2WaUOaYiWYXuT+ZrAveyuACTy+9Pa/crs1ircN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPFxOyCV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPFxOyCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760091564; x=1791627564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dgGReKGpGjCNW3w2o2EMwgn1c2dXdcl2li4SCvYsDfc=;
  b=JPFxOyCVXO13qgSXMNQI115q+IPsVloDX1XiggJWXEsiZoNwecBNiPSy
   WhlAZSNynO62/gnU0utYjPHFAQyFME9maCSb4DSRbh9KJomg7ugPTvg0y
   Y9zeWpq/2pugACh1y7T2ipbacbt48Tr+ayXmM5ssVxO9VAqQDWv8b5jr+
   qPu+ztd5Jtqb9IgabHIr6qx1JF59dGt1wqp1nvQmrASNXBgH46zWpP51D
   QKPvbTKTK5SDsje2QiIw8Fq5NPiF7BmQEgHMxajjjsz95oG5e1p7Zs9EH
   uk/UCOtILgNbQlD9pAdjOfrczkB76wXO+C+6ev4CFlPXrCyixZsAW+z7O
   w==;
X-CSE-ConnectionGUID: xxGT463aSKy+Ix/Bq6u1Rg==
X-CSE-MsgGUID: R/9y1LI8SqeuihKKvOuS6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73411853"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="73411853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 03:19:21 -0700
X-CSE-ConnectionGUID: gB9Umr/2TTqB43b145cdTg==
X-CSE-MsgGUID: gufkWno4RjWqo6uWCbgSAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184977480"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 03:19:20 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ADV-0002Xt-1g;
	Fri, 10 Oct 2025 10:19:17 +0000
Date: Fri, 10 Oct 2025 18:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2959/2959]
 drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c:865:9: error: use of
 undeclared label 'out'
Message-ID: <202510101828.gRkDvu1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5eb2e030c0e9dcbd54aac7aea8a1a806ac347251
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [2959/2959] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: arm64-randconfig-003-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101828.gRkDvu1F-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101828.gRkDvu1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101828.gRkDvu1F-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c:15:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c:865:9: error: use of undeclared label 'out'
     865 |                         goto out;
         |                              ^
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:10:
   In file included from drivers/net/ethernet/wangxun/txgbe/txgbe_e56.h:8:
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:987:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     987 |         u32 cur_diff = 0;
         |             ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6111:24: warning: unused variable 'adapter' [-Wunused-variable]
    6111 |         struct txgbe_adapter *adapter = (struct txgbe_adapter *)hw->back;
         |                               ^~~~~~~
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:3: error: use of undeclared identifier 'adapter'
    6450 |                 e_info(drv, " bucket hash should always be 0 in mask\n");
         |                 ^
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:13: note: expanded from macro 'e_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                    ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:3: error: use of undeclared identifier 'adapter'
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:13: note: expanded from macro 'e_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                    ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:3: error: use of undeclared identifier 'adapter'
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:13: note: expanded from macro 'e_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                    ^
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6450:3: error: use of undeclared identifier 'adapter'
   drivers/net/ethernet/wangxun/txgbe/txgbe.h:1292:30: note: expanded from macro 'e_info'
    1292 |         netif_info(adapter, msglvl, adapter->netdev, format, ## arg)
         |                                     ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7554:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7554 |         int status;
         |             ^
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7687:6: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    7687 |         int status;
         |             ^
   4 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]


vim +/out +865 drivers/net/ethernet/wangxun/txgbe/txgbe_sriov.c

   851	
   852	static int txgbe_set_vf_vlan_msg(struct txgbe_adapter *adapter,
   853					 u32 *msgbuf, u16 vf)
   854	{
   855		struct txgbe_hw *hw = &adapter->hw;
   856		int add = (msgbuf[0] & TXGBE_VT_MSGINFO_MASK) >> TXGBE_VT_MSGINFO_SHIFT;
   857		int vid = (msgbuf[1] & TXGBE_PSR_VLAN_SWC_VLANID_MASK);
   858		int vlan_offload = (msgbuf[0] & TXGBE_VT_MSGINFO_MASK) >>
   859							TXGBE_VT_MSGINFO_VLAN_OFFLOAD_SHIFT;
   860		int err = 0;
   861		u8 tcs = netdev_get_num_tc(adapter->netdev);
   862	
   863		if (adapter->vfinfo[vf].pf_vlan || tcs) {
   864			if (!vlan_offload) {
 > 865				goto out;
   866			} else {
   867				e_warn(drv, "VF %d attempted to override set VLAN configuration\n",
   868				       vf);
   869				return -1;
   870			}
   871		}
   872	
   873		if (add)
   874			adapter->vfinfo[vf].vlan_count++;
   875		else if (adapter->vfinfo[vf].vlan_count)
   876			adapter->vfinfo[vf].vlan_count--;
   877	
   878		/* in case of promiscuous mode any VLAN filter set for a VF must
   879		 * also have the PF pool added to it.
   880		 */
   881		if (add && adapter->netdev->flags & IFF_PROMISC)
   882			err = txgbe_set_vf_vlan(adapter, add, vid, VMDQ_P(0));
   883	
   884		err = txgbe_set_vf_vlan(adapter, add, vid, vf);
   885		if (!err && adapter->vfinfo[vf].spoofchk_enabled)
   886			hw->mac.ops.set_vlan_anti_spoofing(hw, true, vf);
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
