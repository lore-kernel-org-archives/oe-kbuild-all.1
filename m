Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993A2F431C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572171; cv=none; b=pk9JtnoepDQB6fzi/CEQhNibllNqedk9noUGuWWlIPoUYDuAGnQq1UVzyLWNbuDqtoFrj9l6UuKEMlWJ7n+moAUkCvKDl74lKY8X75azjjgXdXfjQy5gp/jR3Vng4oeoCndAa9O8/GAu1NLmSDl93CYXrX/AEAqKRxYZlqcr6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572171; c=relaxed/simple;
	bh=KokbHtGmKCCoQXpIH41ckpOBmMgkkX7mzR+3wAl/iuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgnxfHCtPF4Qw+WVSVFi2ggIzWJ4DzCS0E1gVtKTYyOA4AVNWKbezGAPaUH2aGj/TrwdhpTwVz/lPCdv90YpNcd1o6kiKFtj5yMQsFGA2br3Vw7o8p+VzAPQgsl6MDGO7eVa0flbSGJ9xuMT+9T7DpaNPds7CoyZmi5o/u1sjko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NppxsMB+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NppxsMB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751572170; x=1783108170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KokbHtGmKCCoQXpIH41ckpOBmMgkkX7mzR+3wAl/iuI=;
  b=NppxsMB+ncqAjoCRTdVnK2ASlR+Kb+SkPZTEbPE0drN2nNC77skT5J80
   486bxAnAMiLzTibm1VxOOtS9W8alWl6zsShLcU9RkDh0gwlLFneywns+o
   wSBSZfQ5OBeasC1yDDRhU1AEtjzjai+b4kEzZIcx8O1ajJbeP1fDv/NTq
   Vn4zaVkfyueGUa5ZjkVt15Wvjc7O1AsWmgBIDpiFeAGiW6oQycvQw/J6f
   NcvJkNdshsR7xNFhRmROKkx1j5oAsK7p1gYbQOyP5eyRvZ+70TGok/nux
   t07eIk9i/tb/djFiWyKzItnAXGaSZuR4X/5F7jcujkPPrc0z2odaQHWB1
   w==;
X-CSE-ConnectionGUID: V62YfBMNSZGTMtbo27nlTw==
X-CSE-MsgGUID: IlM7QLJHQWiajLxGb0y/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53778136"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53778136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:49:30 -0700
X-CSE-ConnectionGUID: gTHWvH4gTRuXj1S7QfxA0g==
X-CSE-MsgGUID: bKD+tx2rTrmD9Qa5JDI/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="159971967"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 12:49:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXPvx-0002xD-1o;
	Thu, 03 Jul 2025 19:49:25 +0000
Date: Fri, 4 Jul 2025 03:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455]
 drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c:823:5: warning: no
 previous prototype for 'hinic3_set_rxq_recovery_flag'
Message-ID: <202507040311.LBh4TqFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [2455/2455] net/hinic3: add huawei/hinic3 driver
config: x86_64-buildonly-randconfig-006-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040311.LBh4TqFz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040311.LBh4TqFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040311.LBh4TqFz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c:823:5: warning: no previous prototype for 'hinic3_set_rxq_recovery_flag' [-Wmissing-prototypes]
     823 | int hinic3_set_rxq_recovery_flag(struct net_device *netdev, u32 priv_flags)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:64:55: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      64 | struct hinic3_uld_info g_uld_info[SERVICE_T_MAX] = { {0} };
         |                                                       ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:64:55: note: (near initialization for 'g_uld_info[0]')
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:64:55: error: invalid initializer
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:64:55: note: (near initialization for 'g_uld_info[0].<anonymous>')
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:69:6: warning: no previous prototype for 'hinic3_uld_lock_init' [-Wmissing-prototypes]
      69 | void hinic3_uld_lock_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/hinic3_set_rxq_recovery_flag +823 drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c

   822	
 > 823	int hinic3_set_rxq_recovery_flag(struct net_device *netdev, u32 priv_flags)
   824	{
   825		struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
   826	
   827		if (priv_flags & HINIC3_PRIV_FLAGS_RXQ_RECOVERY) {
   828			if (!HINIC3_SUPPORT_RXQ_RECOVERY(nic_dev->hwdev)) {
   829				nicif_info(nic_dev, drv, netdev, "Unsupport open rxq recovery\n");
   830				return -EOPNOTSUPP;
   831			}
   832	
   833			if (test_and_set_bit(HINIC3_RXQ_RECOVERY, &nic_dev->flags))
   834				return 0;
   835			queue_delayed_work(nic_dev->workq, &nic_dev->rxq_check_work, HZ);
   836			nicif_info(nic_dev, drv, netdev, "open rxq recovery\n");
   837		} else {
   838			if (!test_and_clear_bit(HINIC3_RXQ_RECOVERY, &nic_dev->flags))
   839				return 0;
   840			cancel_delayed_work_sync(&nic_dev->rxq_check_work);
   841			nicif_info(nic_dev, drv, netdev, "close rxq recovery\n");
   842		}
   843	
   844		return 0;
   845	}
   846	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
