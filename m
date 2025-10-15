Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312193043D4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760566861; cv=none; b=ILbF3kmfUj0wUlAX6gbnPNSAWhIXojfskrzPFPO7z1WI6zB4IMMb1zkf2e5SyCSHOS4Z2OMiIoZBaHfXlKPXAknN8PgYD3igouxqPZieKe2k8MYgzKIE6c8lOBG1OjlZt3JblX8uEffSMd3/Lsrq5Zd2Pw3ELMUbgPaZrmdUHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760566861; c=relaxed/simple;
	bh=y/p6WL1oAB4jOpDBS6GDnwEVGKbAd2nhXuTlaiEzs+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Se3rzqXumxJcMB0jAzfhq05UMgOjXoQ0G+zGAzsVn0ULuSGpC1B7/2syuHhg9JhiwMTfSlpiyEGF86B1cDMurfaO5hu7KCtF/KhyVgXuOxJOorAPA4CaXB6Xtpu2X0U/ShcCJPWJLtd/ZkFHuspcWzef8BagCLKizSCOi9brV8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebI7x4h9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebI7x4h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760566859; x=1792102859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/p6WL1oAB4jOpDBS6GDnwEVGKbAd2nhXuTlaiEzs+E=;
  b=ebI7x4h9LrcZzlWhK2uZYqUNN/Jl4sH5mjfG43pom+5a8i9M+S601GU/
   TzvIOodAgw+eFPhDzh++3XyhOI0B2bpI44S1qMTFSY4ej8dO/GTTKBPJe
   IpMLJFxnJE0r/41Cz/qFgFGSS5HL3X1R/QdUy+7c28b8VkBlQhE3TDNF8
   eJp8zWZF2Qg8xzkjmA+MN4QAFAb/xC4CFMI2ijk+MxNZX0BqPogwkb7O4
   /WSrkRAQWwPHCp6hnj6A81pAjDWh8Heffqi7DC9fpcxoeVtGJBJ+Y+1Of
   H0+CxPfKmL9CFu3Q3i8I2HFHumzJf6jdT8XeQI12vy5QKEr224aovIXaV
   A==;
X-CSE-ConnectionGUID: Yz0eCV8gST6DGZ3kk5EY9g==
X-CSE-MsgGUID: Wf4ZTpIoQBOoQ6/K6IOPKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74093805"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="74093805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 15:20:58 -0700
X-CSE-ConnectionGUID: KUnjml9uSmGZt8Re0aX7AA==
X-CSE-MsgGUID: zUFOU7eyQSCLoG3iBajv8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182079587"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2025 15:20:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v99ra-0004GF-2H;
	Wed, 15 Oct 2025 22:20:54 +0000
Date: Thu, 16 Oct 2025 06:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2972/2972]
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3288:37: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202510160611.0PJH3fo3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f974d7dec2997dfe2d417f1c9cc0e2a6adb2d25c
commit: 2048b5b7f264f56a4d9e73079e790e13c8596aaf [2972/2972] net: wangxun: txgbe: add support for wangxun 10G/25G/40G
config: x86_64-randconfig-123-20251016 (https://download.01.org/0day-ci/archive/20251016/202510160611.0PJH3fo3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160611.0PJH3fo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160611.0PJH3fo3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3288:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] h_proto @@     got int @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3288:37: sparse:     expected restricted __be16 [usertype] h_proto
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3288:37: sparse:     got int
>> drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3876:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [addressable] [assigned] [usertype] vlan_id @@     got int @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3876:40: sparse:     expected restricted __be16 [addressable] [assigned] [usertype] vlan_id
   drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c:3876:40: sparse:     got int
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2450:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2450:25: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2450:25: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2522:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2522:33: sparse:     expected unsigned int [usertype] val
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:2522:33: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:3171:29: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:3199:29: sparse: sparse: cast to restricted __le32
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6363:26: sparse: sparse: invalid assignment: ^=
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6363:26: sparse:    left side has type unsigned int
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6363:26: sparse:    right side has type restricted __be32
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6364:25: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6388:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] bkt_hash @@     got unsigned int @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6388:35: sparse:     expected restricted __be16 [usertype] bkt_hash
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6388:35: sparse:     got unsigned int
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6488:38: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6560:36: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6599:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fdirhash @@     got restricted __be16 [usertype] bkt_hash @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6599:18: sparse:     expected unsigned int [usertype] fdirhash
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6599:18: sparse:     got restricted __be16 [usertype] bkt_hash
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6946:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] address @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6946:24: sparse:     expected unsigned int [assigned] [usertype] address
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6946:24: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6948:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6948:23: sparse:     expected unsigned short [assigned] [usertype] length
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:6948:23: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7037:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] address @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7037:32: sparse:     expected unsigned int [assigned] [usertype] address
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7037:32: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7038:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7038:31: sparse:     expected unsigned short [assigned] [usertype] length
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7038:31: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7099:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] length @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7099:23: sparse:     expected unsigned short [assigned] [usertype] length
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7099:23: sparse:     got restricted __be16 [usertype]
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7101:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] address @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7101:24: sparse:     expected unsigned int [assigned] [usertype] address
   drivers/net/ethernet/wangxun/txgbe/txgbe_hw.c:7101:24: sparse:     got restricted __be32 [usertype]
--
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:178:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:848:50: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:6915:6: sparse: sparse: symbol 'txgbe_irq_rearm_queues' was not declared. Should it be static?
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7811:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:7989:50: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9982:28: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9988:37: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9988:37: sparse: sparse: cast from restricted __le16
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9989:37: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9993:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] vxlan_port @@     got unsigned short [usertype] port @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9993:37: sparse:     expected restricted __le16 [usertype] vxlan_port
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:9993:37: sparse:     got unsigned short [usertype] port
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10000:28: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10006:37: sparse: sparse: cast to restricted __be16
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10006:37: sparse: sparse: cast from restricted __le16
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10007:37: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10011:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] geneve_port @@     got unsigned short [usertype] port @@
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10011:38: sparse:     expected restricted __le16 [usertype] geneve_port
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10011:38: sparse:     got unsigned short [usertype] port
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10038:28: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/wangxun/txgbe/txgbe_main.c:10051:28: sparse: sparse: restricted __le16 degrades to integer

vim +3288 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c

  3274	
  3275	static int txgbe_get_etype_rule(struct txgbe_adapter *adapter,
  3276					struct ethtool_rx_flow_spec *fsp, int ef_idx)
  3277	{
  3278		struct txgbe_etype_filter_info *ef_info = &adapter->etype_filter_info;
  3279		u8 mask[6] = {0, 0, 0, 0, 0, 0};
  3280		u8 mac[6] = {0, 0, 0, 0, 0, 0};
  3281	
  3282		fsp->flow_type = ETHER_FLOW;
  3283		ether_addr_copy(fsp->h_u.ether_spec.h_dest, mac);
  3284		ether_addr_copy(fsp->m_u.ether_spec.h_dest, mask);
  3285		ether_addr_copy(fsp->h_u.ether_spec.h_source, mac);
  3286		ether_addr_copy(fsp->m_u.ether_spec.h_source, mask);
  3287		fsp->h_u.ether_spec.h_proto = htons(ef_info->etype_filters[ef_idx].ethertype);
> 3288		fsp->m_u.ether_spec.h_proto = 0xFFFF;
  3289		fsp->ring_cookie = ef_info->etype_filters[ef_idx].action;
  3290	
  3291		return 0;
  3292	}
  3293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
