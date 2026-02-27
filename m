Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C476330334
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199468; cv=none; b=oyqcR61fX86feW3jXqSeStGOICYnnHcRW2cvMRjo8iMRU7b0EUYkpvg5Hmm1I1AZrO+gkjsJlWu0yXxveRycMbqBEmNj9qAi6u/SfTRT4J5+erfcuDgAge91xJcjmhMeCOkbMVB+dwlbR+cBwZZ24ShjVBlMTkTHvyv3CTmze2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199468; c=relaxed/simple;
	bh=vF4DcvSJzf52hW4yPm45oVfk8OCMhMRCyL5WVgZ6HxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oFN4Xm1u7hh/xWeJ7/OZSom0MjNT9Ut1wx2mhNgvsxAPGLDD66Z7jrb0crybn8r3sJUSmBfaIT5Q4bZeGZQnKLuUYosnHT4o+eFfA2ABUB9zVWFds7DF1zqbt1D8HiQf6/0UlCxF/CU153uYHZi7jlis7uasFG0wGyrr6ToWLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi4EkJk1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi4EkJk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772199467; x=1803735467;
  h=date:from:to:cc:subject:message-id;
  bh=vF4DcvSJzf52hW4yPm45oVfk8OCMhMRCyL5WVgZ6HxQ=;
  b=Hi4EkJk1hKfZlxilKzAjzvcRGlBdfxxjiORFp7H0LzVu9w4J+Y4REu42
   gm8nlyZ+tZlnZrt83fxEOaylWKZgBUZ+mIruxpdqCAQrZsYmkpVn03oLF
   50f9FdTUAjeSIWldispPwzLOGSvLPWIgdwXWCm3mqC7BqiK0dMezKJ8m2
   inZFIDykI68jzxmVSNlCUqyVJhFd/2bLjmvuV/xIz1GcpKWdAft+72YPF
   WR9UKjow+slhn1FbX7kMOHXZSwsZ+95f+npffj5I+cxlgDFy+XUTB/mv0
   x1znMkMLA4JDLnYRiVfuYoByRoVu2r9Yn5JjenHaw9J1Dy+/8K2I7+p/g
   g==;
X-CSE-ConnectionGUID: MVtAzGvhRuSgemrnL57QBw==
X-CSE-MsgGUID: gnVahkJeSVuJcn17dr062Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95899935"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="95899935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 05:37:47 -0800
X-CSE-ConnectionGUID: NgiABOxlSH+xDlFGbFIsBw==
X-CSE-MsgGUID: OfT/QjJqQQi+anu5DGk82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221895411"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2026 05:37:45 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvy2I-00000000AcV-2I6Q;
	Fri, 27 Feb 2026 13:37:42 +0000
Date: Fri, 27 Feb 2026 21:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kai-test 1/1] drivers/acpi/numa/srat.c:428:19:
 warning: 'acpi_parse_cfmws' defined but not used
Message-ID: <202602272127.2klx5tDI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git kai-test
head:   be169775bdf68592e987ac703eb842f581412ca6
commit: be169775bdf68592e987ac703eb842f581412ca6 [1/1] ACPI: NUMA: Only parse CFMWS at boot when CXL_ACPI is on
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260227/202602272127.2klx5tDI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272127.2klx5tDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272127.2klx5tDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/numa/srat.c:428:19: warning: 'acpi_parse_cfmws' defined but not used [-Wunused-function]
     428 | static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
         |                   ^~~~~~~~~~~~~~~~


vim +/acpi_parse_cfmws +428 drivers/acpi/numa/srat.c

fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  427  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29 @428  static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  429  				   void *arg, const unsigned long table_end)
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  430  {
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  431  	struct acpi_cedt_cfmws *cfmws;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  432  	int *fake_pxm = arg;
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  433  	u64 start, end, align;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  434  	int node;
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  435  	int err;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  436  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  437  	cfmws = (struct acpi_cedt_cfmws *)header;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  438  	start = cfmws->base_hpa;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  439  	end = cfmws->base_hpa + cfmws->window_size;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  440  
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  441  	/* Align memblock size to CFMW regions if possible */
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  442  	align = 1UL << __ffs(start | end);
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  443  	if (align >= SZ_256M) {
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  444  		err = memory_block_advise_max_size(align);
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  445  		if (err)
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  446  			pr_warn("CFMWS: memblock size advise failed (%d)\n", err);
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  447  	} else
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  448  		pr_err("CFMWS: [BIOS BUG] base/size alignment violates spec\n");
6e3d1b1813c778 drivers/acpi/numa/srat.c Gregory Price    2025-01-27  449  
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  450  	/*
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  451  	 * The SRAT may have already described NUMA details for all,
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  452  	 * or a portion of, this CFMWS HPA range. Extend the memblks
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  453  	 * found for any portion of the window to cover the entire
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  454  	 * window.
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  455  	 */
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  456  	if (!numa_fill_memblks(start, end))
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  457  		return 0;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  458  
8f100467998730 drivers/acpi/numa/srat.c Alison Schofield 2023-07-10  459  	/* No SRAT description. Create a new node. */
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  460  	node = acpi_map_pxm_to_node(*fake_pxm);
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  461  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  462  	if (node == NUMA_NO_NODE) {
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  463  		pr_err("ACPI NUMA: Too many proximity domains while processing CFMWS.\n");
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  464  		return -EINVAL;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  465  	}
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  466  
3f12680913fda8 drivers/acpi/numa/srat.c Yuquan Wang      2025-05-08  467  	if (numa_add_reserved_memblk(node, start, end) < 0) {
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  468  		/* CXL driver must handle the NUMA_NO_NODE case */
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  469  		pr_warn("ACPI NUMA: Failed to add memblk for CFMWS node %d [mem %#llx-%#llx]\n",
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  470  			node, start, end);
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  471  	}
24f0692bfd41fd drivers/acpi/numa/srat.c Dan Williams     2022-10-20  472  	node_set(node, numa_nodes_parsed);
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  473  
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  474  	/* Set the next available fake_pxm value */
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  475  	(*fake_pxm)++;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  476  	return 0;
fd49f99c180996 drivers/acpi/numa/srat.c Alison Schofield 2021-10-29  477  }
6525afdf53b399 drivers/acpi/numa.c      Hanjun Guo       2016-05-24  478  

:::::: The code at line 428 was first introduced by commit
:::::: fd49f99c180996cef2d707ad71bee4f060dbe367 ACPI: NUMA: Add a node and memblk for each CFMWS not in SRAT

:::::: TO: Alison Schofield <alison.schofield@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
