Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6F42669A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072360; cv=none; b=iouGR7FjUd/LL4rt4xwmD1eP4OmUP1sXdlkqIIr948RfvzQNqmdcyuB2qGIZruESJtd9U6ssTzuUiHdcV68htzxX10cUPQr+WUa0SfA6lQAp5MUYAAYeQ6VyxaeB9IAB4Z+cR7uI4pBx1adB5sLzM6C4JhBOp0pO1kixzIB9jXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072360; c=relaxed/simple;
	bh=fmGuwZG6ISapI+S0hDCXirNl+sSSkPCRkleHgD4YtpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLGzQshtzJFOxVHfo2XJKWimg50v5tJnf4TIhd7M3l7T0n82l2+ZhIqopqz4QUOQ5G+VJlAGl4uoc/gFJluc9IqUvbRbIU4j9YLhoWZD5X2hTtHX3/HLZrJJIeB+KCJTpbbWlJXuY5SKAX71ox7aRe/vX525cZlPhmW/qbhzZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnyZwwh7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnyZwwh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787072359; x=1818608359;
  h=date:from:to:cc:subject:message-id;
  bh=fmGuwZG6ISapI+S0hDCXirNl+sSSkPCRkleHgD4YtpI=;
  b=cnyZwwh7kAcPXHKxjySbh02NYKJX4E3Kk7w1fXAMRuDOVBq/NRwG51yg
   hUTZx4g1zcAYoeJi5YMhVPSfEVslMeBVoLd1P6cpS86U0FNK1FETcv04Z
   FXgIcYfLmDhUqLDq1UVFeU1/LUBAMEUZLHp3TWv6h2NzbPKn8sIvnj1xo
   eiOAliZwvYoGYST7wLqOBQiGApWbQpSZitm6HQtzug7VSCJAD+yOCyyTr
   R1cQU0aI9cHI9xe7psplWv+4v9Tp9W8c0uSWDAlF0Sb93bkqsgiIoQDyC
   eAFtvcYfnCYovjIF6fZ/Qszd20Qb7k4kL/Ci07WtLx5OeMXLHtIOC33Au
   w==;
X-CSE-ConnectionGUID: F6hPWHXAS+GBLSIhXWBwPA==
X-CSE-MsgGUID: ZrbygLi6Ti6kdcV6Exf4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90086866"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90086866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 09:59:14 -0700
X-CSE-ConnectionGUID: N930foZ5QIWozpqFK9ykjg==
X-CSE-MsgGUID: m7fhGVUAQ9+sthUCayYf4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259092155"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 09:59:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwN9a-00000000eSG-25YK;
	Tue, 18 Aug 2026 16:59:10 +0000
Date: Wed, 19 Aug 2026 00:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 2763/15982]
 drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202608190009.uCbYi1Y5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d [2763/15982] remoteproc: xlnx: Add crash detection mechanism
config: arm64-randconfig-r111-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/

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
