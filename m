Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A71BD51B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824129; cv=none; b=ojM4+uuPl1V574EgWYLj4PYdsRzVYgT6e61su7E4WY9/ER46lCmNp36gqO++EzAsXRTOoCGBI8od9rBVDZx4piovAjv3lYBPhwkpn0bZL0VV88LSDfHKv/dpVdmUOkkzvWRJGNfWqqwUGGJL92jhhVgOJBgfkMs72KRYxF/ATTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824129; c=relaxed/simple;
	bh=Y3/s81nRMM16wwj2RIZSjmyU0XOdvW3+eJW86er2h64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XLrB3gxCw6IwuyBm8rSuf4h4Nx9otgd1vIkzmrhdmoZaXewDiy94iq+5m1jILV3DcDjCHnkmoRgIXSTEpRJ6lRV9NbMvg079EWmorp8rbleIqIz8iQ5imqSvJopA9v8vFfmWEJQYe0uA9ueucfmS4xSYJGDBDJuMxr6qmGQqrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oD7w8/yh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oD7w8/yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723824128; x=1755360128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3/s81nRMM16wwj2RIZSjmyU0XOdvW3+eJW86er2h64=;
  b=oD7w8/yh+jmQGNPtTQQFTP4POwnYdvwFD8TLnHQvYnIO08ihekDtHAP6
   LDoCXFMdG0HlcABXrYxsHUBttPOsgBtJ8gsVCUlAxD6g57qEYwQRjtWqk
   +72aBC+kqi8TQBG8QIfOXG97DFIYfd2vV1sN0GBgXkA6/212UaFe5W265
   7Dc9w1NfD6eRdBQTi66QnzO/khip72yxKiu2ztdPODXBjwPArzorbid3M
   CY0KJ8aNvbrZ4d3GFw2QznJYfPQxLt5Q4v6yP1P9MmOJiQbL7fT6S2OzX
   etxIUsMelZinZUmf/sOuC12yRS9d/6ID9phMfhOAUBcGvRtTBOsNS5lw+
   w==;
X-CSE-ConnectionGUID: 6AUjyK4jSKOVRdypJh9Iag==
X-CSE-MsgGUID: feLi7qV/Ray9GIDZ+EJfMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25921741"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25921741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:02:07 -0700
X-CSE-ConnectionGUID: kq6gf0IxR8ONKPTJGMhSaA==
X-CSE-MsgGUID: hPJpWjMWR5CHOtJYNL3NUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="63890476"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Aug 2024 09:02:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sezOq-0006bv-2I;
	Fri, 16 Aug 2024 16:02:00 +0000
Date: Sat, 17 Aug 2024 00:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9902/9914]
 arch/x86/kernel/zhaoxin_kh40000.c:346:16: error: 'struct device' has no
 member named 'dma_ops'
Message-ID: <202408162311.V5yBZCt2-lkp@intel.com>
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
commit: 4660502422ff4f7e39f046cf452584165531c5ae [9902/9914] Add kh40000_iommu_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-002-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162311.V5yBZCt2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162311.V5yBZCt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162311.V5yBZCt2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_sync_single_dma_for_cpu':
   arch/x86/kernel/zhaoxin_kh40000.c:85:47: error: implicit declaration of function 'iommu_get_dma_domain'; did you mean 'iommu_is_dma_domain'? [-Werror=implicit-function-declaration]
      85 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^~~~~~~~~~~~~~~~~~~~
         |                                               iommu_is_dma_domain
   arch/x86/kernel/zhaoxin_kh40000.c:85:47: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_set_iommu_dma_ops':
>> arch/x86/kernel/zhaoxin_kh40000.c:346:16: error: 'struct device' has no member named 'dma_ops'
     346 |         if (dev->dma_ops) {
         |                ^~
   arch/x86/kernel/zhaoxin_kh40000.c:347:36: error: 'struct device' has no member named 'dma_ops'
     347 |                 iommu_dma_ops = dev->dma_ops;
         |                                    ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VFIO_MDEV
   Depends on [n]: VFIO [=n]
   Selected by [m]:
   - CRYPTO_DEV_HCT [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]


vim +346 arch/x86/kernel/zhaoxin_kh40000.c

   343	
   344	void kh40000_set_iommu_dma_ops(struct device *dev)
   345	{
 > 346		if (dev->dma_ops) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
