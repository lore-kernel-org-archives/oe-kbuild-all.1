Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951613AA2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734211407; cv=none; b=ggNa3/sYaKRHTtww+W1IuUt/ZNACaq2UVIDKuDMcorITaG3/6dxUAs9mM2RB9drQpIaXa05bM6iTQVwLpZfC+AZRKbXav7PQXYabyBClAYbLxcSzMfN+QDrZRq6gR08U7bVR0S+i4uPlGdC2dw/2GNZF7u5vTCZNj5U2xBApvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734211407; c=relaxed/simple;
	bh=e6/PZZOObaPmxldkN1rMNJo5ihvhedDQmKoW0/H8IBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EI6mIX75avuwycTPCy46oIdXqMSv0CT2aKr+czqlWofReLaCch0j0Tya/LPf8RrM85oIm0UNIwwC1HxtJlJl1zTy3j+sVQIaC9aGaEttbOM8AljXYCxM9I5iN3ZWXFBQkonVmgSZgfN3EAmI0ROoNt+I955wl/OIFyF6iiPPbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHdz7TNO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHdz7TNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734211406; x=1765747406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6/PZZOObaPmxldkN1rMNJo5ihvhedDQmKoW0/H8IBE=;
  b=oHdz7TNOu4p4SK5IEVYZCI0aRhcmk9FrAATPQC2g6DiK7jzWHwmlzikl
   /WfbbienRmoe9XwfdZKschW3wIPHEc8VRMi92J+GLjhkjsBvX7ORni7bM
   p6eKoLoFSdcA5oEbdKt9Mmlot0059YlkD5+7su76k2kzibgHEgPvJ/PEu
   qBXRCgSrjrpcdHJx2hMPd+tfGfX/Yw6fmWhlOMYgJRH/5es+QlKtdg2JT
   fttnlYFnfTB+9bkppMTCH8tKoO8khoS2BGifT6zMv9uwzXTlL7q0glCca
   fUiQSqueT2ZNnIX8ZWo3yxySr35vlLjtjfbvOSQ2dg9uxyq+rRsPu8kaP
   Q==;
X-CSE-ConnectionGUID: 9o1cZfzhTCuucFYRwi2PBg==
X-CSE-MsgGUID: 5ba1eqlLSeeL4txUa9pFOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="57120064"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="57120064"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 13:23:25 -0800
X-CSE-ConnectionGUID: uDuGCqJSTAiwbkZRX2Q+6A==
X-CSE-MsgGUID: RIZdpZ1OSwS4qe/M04yfVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96697525"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2024 13:23:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZbd-000DEs-1G;
	Sat, 14 Dec 2024 21:23:21 +0000
Date: Sun, 15 Dec 2024 05:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2566/2566]
 drivers/net/ethernet/hisilicon/hns3/hns3_unic.c:53: warning: Function
 parameter or member 'skb' not described in 'hns3_unic_set_l3_type'
Message-ID: <202412150525.dOfTAcoj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: f52063cd675564192638518d0a6d428e330ec7e1 [2566/2566] UNIC: Replace ether interface by ubl interface
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241215/202412150525.dOfTAcoj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150525.dOfTAcoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150525.dOfTAcoj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_unic.c:53: warning: Function parameter or member 'skb' not described in 'hns3_unic_set_l3_type'
>> drivers/net/ethernet/hisilicon/hns3/hns3_unic.c:53: warning: Function parameter or member 'type_cs_vlan_tso' not described in 'hns3_unic_set_l3_type'


vim +53 drivers/net/ethernet/hisilicon/hns3/hns3_unic.c

    44	
    45	/**
    46	 * L3T is an element of the TX BD interface for software and hardware
    47	 * interaction, used to identify the message type. As the message data
    48	 * given by software to the chip cannot be self-decoded, the driver needs
    49	 * to actively inform the chip of the message type, which is unrelated
    50	 * to checksum offloading.
    51	 */
    52	void hns3_unic_set_l3_type(struct sk_buff *skb, u32 *type_cs_vlan_tso)
  > 53	{
    54		if (skb->protocol == htons(ETH_P_IP))
    55			hnae3_set_field(*type_cs_vlan_tso, HNS3_TXD_L3T_M,
    56					HNS3_TXD_L3T_S, HNS3_L3T_IPV4);
    57		else if (skb->protocol == htons(ETH_P_IPV6))
    58			hnae3_set_field(*type_cs_vlan_tso, HNS3_TXD_L3T_M,
    59					HNS3_TXD_L3T_S, HNS3_L3T_IPV6);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
