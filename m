Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF96150997
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750049239; cv=none; b=qxyMSsfvzsgr+3ou0fgJmC6PsQSWRgYdVHJmuRvEaH7RYs8xvD7037LCmeXYfj5Iw3cQhLG2Ic4jYSuqD6pIwDM7a2iR8PGZAdOGdQDiNp9yP+gYHm3DlF0hXSZSQwedEdiEzFr6oq4Xcs+KKM1ZU64usdHx6HgseFBq/r8Z5EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750049239; c=relaxed/simple;
	bh=f/e/dINmwwU0vQ7kRWoMWdeLJ7da9Dn1rYowiLBOmOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSvyoVGGKV/T8usFW3zCTosI6vsywQFO1lp3AYLofd1MvJq4vulZ8t3N7OZEb5+Uvv+tbQ5Hv0Py/N3quEHwpVo5qf8MO25706X7ZrlfwwV0z8XKLngfKjyUKHSffXUmW0oymhybiAJIvn2NOv/FkFtj0qZnKWKuCSSYYSiT5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBZyWpto; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBZyWpto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750049236; x=1781585236;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f/e/dINmwwU0vQ7kRWoMWdeLJ7da9Dn1rYowiLBOmOo=;
  b=EBZyWptotCO19Da6OXE+43Yf+wF8Mf+PRKu7kKzRIouZ84U2Biin+OxJ
   HRmrlM1ykfDwmUWkldaJaSDZ2zA7+265g9bTojn7NbdasZOMQMzmKs4UL
   3onS/Q5PbRpqRsl65MeB0xmBicIWUTaagXKktz6Caf8lOlC6a5A7K5/R5
   1XiXgGBBoIz2qi9o/b7lIXTcX/LElKxFnAFBX1dDPzdv1D9t3LR2wJ6PQ
   HmA6msX0ce9On38PwBC4Qg96oTxcPh+YAyjacSLwGe+OywSYJNpKzKX77
   E5dYs2dv7/ZsEdEp/kcgMLoQjMUQWeUwbyZTEZ2nkDAcU46oECS9C/5ML
   g==;
X-CSE-ConnectionGUID: W7bGxHRWTVeBKhdSzlR1ng==
X-CSE-MsgGUID: NvzJGf+dR+WMpf65audYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52101994"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52101994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:47:16 -0700
X-CSE-ConnectionGUID: n8qgYkPrS2WGOVElmszOQA==
X-CSE-MsgGUID: pUA1SQrpQsCd5vCwmUwM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="171573929"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2025 21:47:16 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1kX-000Eka-19;
	Mon, 16 Jun 2025 04:47:13 +0000
Date: Mon, 16 Jun 2025 12:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/2392]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:3: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202506161212.8FdTH8ys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   93509d36bc89182689dc1bc16b348878b867f166
commit: a29c130b6607ab7a2d7e6df8625494cdafc6d736 [2392/2392] Linkdata：net：fix sxe compile errors 'sxe_resume' defined but not used
config: arm64-randconfig-004-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161212.8FdTH8ys-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161212.8FdTH8ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161212.8FdTH8ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 || ARM64 [=y]) && PCI [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +3 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c

dd013ad487534c liujie_answer 2025-04-15  @3   * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
dd013ad487534c liujie_answer 2025-04-15   4   *
dd013ad487534c liujie_answer 2025-04-15   5   * @file: sxe_main.c
dd013ad487534c liujie_answer 2025-04-15   6   * @author: Linkdata
dd013ad487534c liujie_answer 2025-04-15   7   * @date: 2025.02.16
dd013ad487534c liujie_answer 2025-04-15   8   * @brief:
dd013ad487534c liujie_answer 2025-04-15   9   * @note:
dd013ad487534c liujie_answer 2025-04-15  10   */
dd013ad487534c liujie_answer 2025-04-15  11  #include <linux/kernel.h>
dd013ad487534c liujie_answer 2025-04-15  12  #include <linux/pci.h>
dd013ad487534c liujie_answer 2025-04-15  13  #include <linux/moduleparam.h>
dd013ad487534c liujie_answer 2025-04-15  14  #include <linux/module.h>
dd013ad487534c liujie_answer 2025-04-15  15  #include <linux/netdevice.h>
dd013ad487534c liujie_answer 2025-04-15  16  #include <linux/etherdevice.h>
dd013ad487534c liujie_answer 2025-04-15  17  #include <net/rtnetlink.h>
dd013ad487534c liujie_answer 2025-04-15  18  #include <linux/moduleparam.h>
dd013ad487534c liujie_answer 2025-04-15  19  #include <linux/aer.h>
dd013ad487534c liujie_answer 2025-04-15  20  

:::::: The code at line 3 was first introduced by commit
:::::: dd013ad487534c1838afc2f55efdb5daec15aace Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
