Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9801B85D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726394443; cv=none; b=ZSX5ywJweh25IXYof1U/E2qWo0Bqlg7w4XAwkktQbghdOR7n58q+eZv3x/5p7l04bVVf+EzofsQLqxgvyxMpYDssU6+DEv6efdmR2JCMVBCNxbBfXS61t0xC5lHmJ3kxXtCbQpHh+U0yC1NKTXNoQapqysFEgtLd6AXopwlb9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726394443; c=relaxed/simple;
	bh=ZAGCXhlF74PZ1d2OeztcC5kRSD1Zi8InuG9QSjU2+Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO3OmYQHBgHCVxNcIERTw4F2J58N/kgTWYBgKI0Ns2kOKCKl+KcBf/IF/bavKqHY6RSEsJbz/8SGAuOqZgzm049TNtJWj0IwcJq7MymVwbHNRQgYc/iyJB4NdDlTsfyI5z7BC9jsgyKdGxkHwofWF/vGZjVCAZ18Qbi7HRP7+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdATL4hK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdATL4hK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726394440; x=1757930440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAGCXhlF74PZ1d2OeztcC5kRSD1Zi8InuG9QSjU2+Cs=;
  b=JdATL4hKSMbV5XGqSkkmbKsUuUu7ky/Jug+mCGhhn0mPn40jeihvCu+p
   vO+HmMZ6Jzw0+SKwYZlzE51DNvKCxX6uK37Ck+Yq8mZ8LdtDsr0VUP183
   rjZ/4ipxiXweM3nGExPeAQLpNq3MUCGDY2+TatdYGNyzBXH353SXFv3MO
   OIvBW5+YA4A5b1obzhIR/h2n5GMQMUCFmkzWsB1gg/Y4YpYK5kEZVR2rz
   QcOLapI7VB5gOJev1mT+lt62VhkcNhnNucQgZ4+93/jH1BvvbV1nVOj2a
   GlguPAYNP8LUcH5xZqudO5FKfhlUuPcIp1eMcVz0eIDOraSnkRJC9fKwn
   A==;
X-CSE-ConnectionGUID: qTEXK5+oT5CSNLr1IEly6w==
X-CSE-MsgGUID: 0/tIH1IsTIyolwH2zOyUxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="29144416"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="29144416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 03:00:40 -0700
X-CSE-ConnectionGUID: Bn59FV3qSsKwG3Kxpp5GVw==
X-CSE-MsgGUID: TjhKaNuhQN++ymu8PjGJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="69360317"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2024 03:00:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spm3Y-0008b7-3D;
	Sun, 15 Sep 2024 10:00:36 +0000
Date: Sun, 15 Sep 2024 17:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15490/23714] ld:
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50:
 multiple definition of `debug';
 arch/x86/entry/entry_64.o:arch/x86/entry/entry_64.S:1094: first defined here
Message-ID: <202409151713.s9RtLBuv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Naixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: ea190d90c609e9909f37afa0d1a19f938ffb95d3 [15490/23714] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-randconfig-r054-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151713.s9RtLBuv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151713.s9RtLBuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151713.s9RtLBuv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:50: multiple definition of `debug'; arch/x86/entry/entry_64.o:arch/x86/entry/entry_64.S:1094: first defined here
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
