Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA34D23D7FB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602796; cv=none; b=TS9UYhODZDp5c1CzENA1IUL0m0TVCuWn3FnpIQdXZA+OEn7+A08cPP0usoIFAnaG8hp5zAC3PwqQtPv6r33/kvmP7u5HYuhIkmahqgw/a+oTBXCmZ9QvXtDbTdMARoQpJR8TYE47AU27HWKaOT3eYJHPnv4ZJOTQTejKktfg9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602796; c=relaxed/simple;
	bh=plVzj907yWFGlsyNnCv3RmZM/NUE/YJ2Z19oJ3i9LeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HlzWQUGaGw/5p1jS3O1lH9EOBkK7kKSqU4uPih85S75vUWgBWbDcyQcZO7ESIMmvFeWXvF+poj5fy1eJY6FbuyqrYJq7c05FxPGca2+pUHYkvFouPNmgsNEF3wKJN0TwHHBe7eyu92oDnDFBDpkSd/6b1OqSeQ/qSq7UPEgAKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIP9KIg0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIP9KIg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783602795; x=1815138795;
  h=date:from:to:cc:subject:message-id;
  bh=plVzj907yWFGlsyNnCv3RmZM/NUE/YJ2Z19oJ3i9LeU=;
  b=jIP9KIg0/z+kOGqiJB5ANyWj6WQqDnDR0hwcErCSnIyl2eKOeUwguKBi
   c+1mYhHuK8slKG4H/URAAj4vcJD1nHPekKfND1kwAMuh2iozXNVvDyuQ8
   Zy21ZIcMVUGCk5gnzZovj51yQFUFIAetpmCb0bRzvdRDaJlMStACSidOq
   9FjMq3euvavkMm8L6l2wnh+yr9lnzekXyg6BUz6WIxVddgyFFrmvFg79o
   rJv8YpyZdQMgGMzvO3CyaI9jASQJ65gm0Qq8fZO05u4BNolBnkeHpnl/D
   n3LkuCgVixxlfCxGQ8ZfYQsmAgIL7pEqCNmvnx3RcehYqBJ+gAq838ai+
   g==;
X-CSE-ConnectionGUID: ptwnvRMFS6SUjRp0xhTuzA==
X-CSE-MsgGUID: 1thREP7HRR68rqNqSU60TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101829705"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101829705"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:13:13 -0700
X-CSE-ConnectionGUID: 6ewBdYtITHyggSLdIr9pbg==
X-CSE-MsgGUID: gv0KIXEBTOW/4NuXwaFq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251218066"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2026 06:13:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whoYu-00000000Hi5-3r0g;
	Thu, 09 Jul 2026 13:13:08 +0000
Date: Thu, 09 Jul 2026 21:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 3517/4669]
 drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202607092104.M6msr8GH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9810cd75b9fb56a3425d391cba3f608502bd474
commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d [3517/4669] remoteproc: xlnx: Add crash detection mechanism
config: arm64-randconfig-r123-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092104.M6msr8GH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092104.M6msr8GH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092104.M6msr8GH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *rsc_offset @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     expected void *rsc_offset
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got void [noderef] __iomem *

vim +837 drivers/remoteproc/xlnx_r5_remoteproc.c

   832	
   833	static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
   834					int offset, int avail)
   835	{
   836		struct zynqmp_r5_core *r5_core = rproc->priv;
 > 837		void *rsc_offset = (r5_core->rsc_tbl_va + offset);
   838	
   839		if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
   840			return RSC_IGNORED;
   841	
   842		r5_core->crash_report = rsc_offset;
   843		/* reset all values */
   844		r5_core->crash_report->crashed = false;
   845		r5_core->crash_report->crash_reason = 0;
   846		r5_core->crash_report->crash_reason_str[0] = '\0';
   847	
   848		return RSC_HANDLED;
   849	}
   850	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
