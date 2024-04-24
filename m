Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6DC1848
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713988533; cv=none; b=gKDhJqx2GOffrDaStaTwNPRIK4BnUmsOneI6UT+Cnss0Y7bBUJiEDJnIquPTERxb9mObW89L7bqxThZEToWCOZoGJZrVHf2MVCEc45o99Dt9qQ477QCHMiTl0CxOrQ/SoGTazuRbuQXp778kXPsOAe8kXPp9oHOAqMCbT3FOo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713988533; c=relaxed/simple;
	bh=4AXMmkpoCpN08hZUjgLq63VuAuFfihBAXwwFyNgRmNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCRtGb8+WfbKxKgfwYVRD3ZWN6K55ObigjrvgNGTEVXIdnjQD+Y4joXVDQJESFD+AiYpTRFeEZQrF33tF5c/UWeBmpbAZKI0Q2gcYKd4kjlKXMgCypUKLz6xVS68SIZYIlkktvb0Bvz1QYvf6fLTCFtq9SrTkg4UnXUTkTZiUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJsDhQgg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJsDhQgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713988531; x=1745524531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4AXMmkpoCpN08hZUjgLq63VuAuFfihBAXwwFyNgRmNE=;
  b=EJsDhQggJ0ST1PePvIY0vaUCMCJSLchjt+Zq0K1UyHImxZkC1WJwyU7c
   w3Ec2vpP9NAlOQxFo+mkEk1UzExVjVj/D7wNqECkOcCkljXRiGeq1FUfV
   jVyD7e7DWJOFTVPtpGORrKQ/NafgtIn9TlFEYPrCEqLrPbiy2L6ny3iBv
   X059hWJ07tuARAbkG1OBKFtmNXk6u96HtUH7xSylmzdR5Bz3xOzGxBvt+
   TuaXcJzXumVEuhl1fpTJRB4suCBYp8T4LHuEoc5XobLDMvj3WLt+JWdot
   VlOQMj8ZDURJlezitj92g0Cp6w39eBbq2pDWyG2li7FmKfaQH3MWobklI
   A==;
X-CSE-ConnectionGUID: yBQZpZYsSxuFtziLVr1hVA==
X-CSE-MsgGUID: hnTNcFQlShy8wK6iXD3OcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20791383"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="20791383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 12:55:31 -0700
X-CSE-ConnectionGUID: 7t6cdLIMRkylm44RZ5pPuA==
X-CSE-MsgGUID: GHIURpdxRzOT77Wo1cFnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="29621774"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Apr 2024 12:55:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rziiE-0001bg-2H;
	Wed, 24 Apr 2024 19:55:26 +0000
Date: Thu, 25 Apr 2024 03:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5877/30000] ld:
 drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.o:drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:67:
 multiple definition of `debug';
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50:
 first...
Message-ID: <202404250342.3tM2i8qb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fca9656c7bff35049038766e63e93888847b5bff
commit: 109f8498f4f75f08c42f98cce15ba127139b9782 [5877/30000] Huawei BMA: Adding Huawei BMA driver: host_cdev_drv
config: x86_64-randconfig-004-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250342.3tM2i8qb-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250342.3tM2i8qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250342.3tM2i8qb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.o:drivers/net/ethernet/huawei/bma/cdev_drv/bma_cdev.c:67: multiple definition of `debug'; drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50: first defined here
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
