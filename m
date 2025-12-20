Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0B28C2A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248949; cv=none; b=C+bPvNUjbZsggaVfVOT/sZt/WZ77ukFgaGTqhiptZVYclIhRZE94Ay/0J+ksN9+AJKkrjquu0fy7+UTmQ5IMhdegPFP+98TDziwcPtMQh3OUyZiIo0vnPzTyq3kF1DlHYTBKtB9pt7oOPTGw1XITi9gjHIp7CM9BZPvjMDmKVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248949; c=relaxed/simple;
	bh=1iXMfwGhtnKyVqQcXdyH29EquJTCPdrHRRAIpzvx7vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qghTGmUeUKdogP4c5nqFzgrPB6rdWKCkpAkOhUwGz9n19tpA7KGwps++Z8iSkmDy0HmU7bCpLj2hXQHOz+LcbMA5z6P/G3kbO2i3RVxk55ZUEqBkj/MjqtZOjSBO6eSIq9AxXquewnoOlW0b85+PNOD1Bi5kIGfMW/DbwsWtMAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecoNSO3L; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecoNSO3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766248948; x=1797784948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1iXMfwGhtnKyVqQcXdyH29EquJTCPdrHRRAIpzvx7vs=;
  b=ecoNSO3LrxAN2lb+y1m7pKvNmNRYG9U33dFbRtvjyvIOxSxPtDsIqybJ
   18YRV76p0qi8VJsOfY1zrqo+6Dybifa2Y3I1YLpq33WQx58KJvKYDIT+Q
   QWG3ekzEEbHosMgl7sBp9rWO3q4aMZa9zREnR2MuGtpjX1JEJfYGGlrbs
   ZXxtq7NFKbQ5rfhCgQKKlhuLVaNKtVHg8nurrqrDj0V1s25uCyiJyfHA2
   LlKHPeLMvLQMIKRUEZ6DBvm+/57Q/AzEyiXnR3s8d5R0NosnzsBSP+Gw1
   JxGQjsOevLI1xDAGHpeujj2wxqQfW87lKfsBCsASMzjOoAgrTRsV39vBK
   Q==;
X-CSE-ConnectionGUID: tGzbSjqaRrO5YBnD/bMIQg==
X-CSE-MsgGUID: bBKT1aQvRVSeOXpI6G+Tyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78497130"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78497130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:42:27 -0800
X-CSE-ConnectionGUID: DuABLLhjSv+1/6FgxyTiJA==
X-CSE-MsgGUID: v256BLd1SLiJGonQfRuv9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199649429"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 08:42:26 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX02B-000000004tL-3Ckt;
	Sat, 20 Dec 2025 16:42:23 +0000
Date: Sun, 21 Dec 2025 00:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c:823:5: warning: no
 previous prototype for 'hinic3_set_rxq_recovery_flag'
Message-ID: <202512210010.kLb4fmr8-lkp@intel.com>
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
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [3547/3547] net/hinic3: add huawei/hinic3 driver
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251221/202512210010.kLb4fmr8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210010.kLb4fmr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210010.kLb4fmr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool.c:823:5: warning: no previous prototype for 'hinic3_set_rxq_recovery_flag' [-Wmissing-prototypes]
     823 | int hinic3_set_rxq_recovery_flag(struct net_device *netdev, u32 priv_flags)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
