Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724A1C230A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 17:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723827851; cv=none; b=DDW9a6E9hJnxrOVxLWVeX953V5XqbMKEvQSvpNIDRFSiAiCGZvKiLBai3JMZAJ1idOXsRSls/kWieP0oBoduZXwt2Tk2vcGv8F9e0xKo8DyD26dcOqXz84sQ9J6sb5+5OYdC4c0SIWq7lolc3Nt6HnlTDqogfc9b9dWlj90GhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723827851; c=relaxed/simple;
	bh=zehAHtP/f5G1BNx75QPiWoyPHQB/xtOsPBmj0eYDSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyiwiVG0MUf7VY5vk4dNKTa7UiXbBBxICnfg3OrSYbCkO49XOUeXYczKxxl2WEgY5dVCvmt/lA2qBXfXVqQx5yJaAtg+wb3ozOoIBTi5aAvi9FYPIuoyd5JUgrHNTlHmIQuk/bRg22ll80VIVOrNt/xZxILDAh7KQdYFL/JWR94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/UoeHZk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/UoeHZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723827849; x=1755363849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zehAHtP/f5G1BNx75QPiWoyPHQB/xtOsPBmj0eYDSBU=;
  b=B/UoeHZk3dP+tf4NwmXDO93wmT5020m6amcDfmfSfVPC2WottAHW8sRu
   4eKV1M2lYmNIGC7eOQr4RGAdJAZr1uccjPsDCYARkv9BIMTn5kwmickM7
   hYE0oyJdat1yrOUieIat7KhKE2Ngpg5cdd32SR4Ch2ORY+sd0uqEH7Zq7
   w1mh0UhGNBCnAxkrgUij+3Z3P2sX54apcFIq3t+gxsFR/cMU7BW71C6NN
   4K6BCdmdbjhI+32zreaP1SPN9QI5fmhCgP3AyvLePlNm3QbcSqy5Zgkgl
   1p6EQ5AgkXKA1iQgiN2IK6TsoAcwuundLTwgSY3yRC7T3KTv/23nNnvtc
   Q==;
X-CSE-ConnectionGUID: dtZMRX5jQL6kELcZGyrSCQ==
X-CSE-MsgGUID: oklTE2BEQESXu23bxcZhoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32766287"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32766287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:04:08 -0700
X-CSE-ConnectionGUID: zoTiRsYzTW2+zumD43vTXA==
X-CSE-MsgGUID: C+lAmasnR+aW+2OHv7HqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59741000"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2024 10:04:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf0Mt-0006fK-0t;
	Fri, 16 Aug 2024 17:04:03 +0000
Date: Sat, 17 Aug 2024 01:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9903/9914] iommu.c:undefined reference to
 `iova_reserve_domain_addr'
Message-ID: <202408170314.L4Y2ah6e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   89747eb5eee6205fec61a18a1e76fe0c1f1d37ca
commit: e1577467ecbc0e59577e1c31d15492c0401f8302 [9903/9914] iommu/vt-d: Add support for detecting ACPI namespace device in RMRR
config: x86_64-buildonly-randconfig-003-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170314.L4Y2ah6e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170314.L4Y2ah6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170314.L4Y2ah6e-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `iommu_create_device_direct_mappings':
>> iommu.c:(.text+0xa5daf5): undefined reference to `iova_reserve_domain_addr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
