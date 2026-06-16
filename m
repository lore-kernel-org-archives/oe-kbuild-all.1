Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09097466B57
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627011; cv=none; b=r/8viT+tniwDmxRJaXUjZ7/kMs54MEuI7bTjZ1VKzKwdDvU2A9BQytVlk6DF4N0G/7uuxlKzuNAF+E2IyKPHrBxDi2QuKO59r9zQS+kuXk910IlZ8iWclfktyYuuRsMovZQk+VW1p5JtQiDZf2vrTN9w16c7UueqYXgtAc2gMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627011; c=relaxed/simple;
	bh=q/i3jj0UmZSYz+Ae9fQSOrSjfw7rXWVtgj0lKyQRXWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJyXl7NvHUA3yaEuWa9BFptHp6jEQ09SpBlE/XrC/BvlwTyJ+3Qm82WuQ7uME7cPMSAJKUkTIDdG4Vx8+cxTJJIgPT2qpL0RXrspnE5bB6gfL6TAEEP7lGhqOMAAx/GQqy2O2haydFB+ootOzFHthtNQD9/5bfjWgxlH/YCPh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3lVlRfL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3lVlRfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781627010; x=1813163010;
  h=date:from:to:cc:subject:message-id;
  bh=q/i3jj0UmZSYz+Ae9fQSOrSjfw7rXWVtgj0lKyQRXWc=;
  b=Q3lVlRfLrcG4dXubvigA0DPlzl4YwxiiQT7a8BMK0eFQmsyZzLNJ9rMp
   YEUvqAVbKGmNdo/8HjBl4UxMgTDmq1hmfvUDwf18PnzhC2UiG1QCy6uMv
   hlsf4tnBbvGxuxyEIHZHHh6wKl1Bic3+soUEvEfntSmjCboaX3GCZD55b
   tuBDarpUYlNycat0/JrNWbuZTcV3z7Nyn8vN2hqWSlkjoGtc51WbCDnyl
   +RH15MhZV9zL/kTMvoOIscH6pKcIynHdGQ7w74q7OQEljLiITD15eIqDk
   xu4ppro3NHGGYF0vYRIJvGLYN+ibkvNyqkE0vRQQTfFQv3yo994QMjFrF
   Q==;
X-CSE-ConnectionGUID: L3EPyM5oSuS6JWwVWDBoQg==
X-CSE-MsgGUID: 9tEfr9gQR6ehNIPnWmtcXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781332"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93781332"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 09:23:29 -0700
X-CSE-ConnectionGUID: McyH+WMPSQOl6QWziO2SFA==
X-CSE-MsgGUID: bfl1JM+tTmyzgTPejFcZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246697496"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jun 2026 09:23:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZWZR-00000000TVE-08mn;
	Tue, 16 Jun 2026 16:23:25 +0000
Date: Wed, 17 Jun 2026 00:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: arc-linux-ld:
 drivers/pci/controller/cadence/pcie-cadence-plat.c:113:undefined reference to
 `cdns_pcie_ep_setup'
Message-ID: <202606170021.m18QDxF2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b5a2b7d9bc156e505f09e698d85d6a1547c1206
commit: 69dc538a4f5a57dcc5ea4893c769d567f539a1b1 iommufd: Fix building without dmabuf
date:   6 months ago
config: arc-randconfig-r132-20260616 (https://download.01.org/0day-ci/archive/20260617/202606170021.m18QDxF2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170021.m18QDxF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 69dc538a4f5a ("iommufd: Fix building without dmabuf")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170021.m18QDxF2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/pci/controller/cadence/pcie-cadence-plat.o: in function `cdns_plat_pcie_probe':
   drivers/pci/controller/cadence/pcie-cadence-plat.c:113:(.text+0x15a): undefined reference to `cdns_pcie_ep_setup'
>> arc-linux-ld: drivers/pci/controller/cadence/pcie-cadence-plat.c:113:(.text+0x15a): undefined reference to `cdns_pcie_ep_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
