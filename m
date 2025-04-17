Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98922153DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929748; cv=none; b=XodfWLT/EUYEoTwdwdErg0O6C14Dw0BkwWUNONCndI9MxUVKzozrX7pyAjzGnXHzk5M5eJxCPrSi2T09EE19WpiEyrFp62VDknr/wN0ag5SQx3SrKsTPy6N+0Vf2Yr1PrsTMHyN3Va3kOmXfVuPseXkY6oW56dCK0W5gahBuZdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929748; c=relaxed/simple;
	bh=YDWEGoNHBUhIZFwF/urN0AH2iSSYRaioayA7wSQhW8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fa+DwabUew0MqBW0XhfDZDhLRVFH1S88MwzWwmaPXHeo615VInHA8SRDFYwL6He0fgq7LgevgsXXPXoGrhXkHBNT5SR3xVjHLTDF8hn2fQ8Id4SPFm8gF7sIIgwKqTCIwoCk6EebVV2LB2317ytrG5pAgYp/HejVXTSGXZaVDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9jhkRuS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9jhkRuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744929744; x=1776465744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDWEGoNHBUhIZFwF/urN0AH2iSSYRaioayA7wSQhW8E=;
  b=D9jhkRuSbLVgSn8lPv4Vuq18ag3ulYMGuWurk6XRiasSiybol/qGmvb7
   lHfsLI/MVmN266RdqyUVfKtrf6xzdIYUWCzCO/O2gFPxo7bDBQwT4NGe/
   iH3x0VKpew1XEXaOv0fZE2WhyQtQyx5/gIv4D2Za/IFzXGXrnbPSdDMZP
   G+RT5FZkZKAEslDiCuoPhhYwVpscc0LFpYoj86BwRecZUPY8y96BdcIvT
   JDNTgVbqogHDy2kV75zhaql/SvTjYkuQlivMqveocvK4WqtDqo6H7UqCy
   WhR4g72dw5q2DoJ9cJ+CxH7Hury2UOOY9ITMuaYox95VPM0Zlc8Fj+0jy
   Q==;
X-CSE-ConnectionGUID: Av/bSc6JQCOGS7OIPlfKZw==
X-CSE-MsgGUID: obF22DPbQdOxTNi9zATJFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46554801"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="46554801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 15:42:22 -0700
X-CSE-ConnectionGUID: fhzOiFPuTzyCJx3D1EvZyA==
X-CSE-MsgGUID: /Be+CfOmToGP47zlqLbNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="136056775"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2025 15:42:20 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Xw2-000275-0D;
	Thu, 17 Apr 2025 22:42:18 +0000
Date: Fri, 18 Apr 2025 06:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3890/4528] drivers/acpi/numa/srat.c:467:13:
 error: implicit declaration of function 'numa_add_reserved_memblk'
Message-ID: <202504180647.e3VdYsTZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: 8579eee90756b972a13ef678848c49eabb99f3b6 [3890/4528] mm: numa_memblks: introduce numa_add_reserved_memblk()
config: loongarch-randconfig-001-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180647.e3VdYsTZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180647.e3VdYsTZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180647.e3VdYsTZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/numa/srat.c: In function 'acpi_parse_cfmws':
>> drivers/acpi/numa/srat.c:467:13: error: implicit declaration of function 'numa_add_reserved_memblk' [-Wimplicit-function-declaration]
     467 |         if (numa_add_reserved_memblk(node, start, end) < 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/numa_add_reserved_memblk +467 drivers/acpi/numa/srat.c

   427	
   428	static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
   429					   void *arg, const unsigned long table_end)
   430	{
   431		struct acpi_cedt_cfmws *cfmws;
   432		int *fake_pxm = arg;
   433		u64 start, end, align;
   434		int node;
   435		int err;
   436	
   437		cfmws = (struct acpi_cedt_cfmws *)header;
   438		start = cfmws->base_hpa;
   439		end = cfmws->base_hpa + cfmws->window_size;
   440	
   441		/* Align memblock size to CFMW regions if possible */
   442		align = 1UL << __ffs(start | end);
   443		if (align >= SZ_256M) {
   444			err = memory_block_advise_max_size(align);
   445			if (err)
   446				pr_warn("CFMWS: memblock size advise failed (%d)\n", err);
   447		} else
   448			pr_err("CFMWS: [BIOS BUG] base/size alignment violates spec\n");
   449	
   450		/*
   451		 * The SRAT may have already described NUMA details for all,
   452		 * or a portion of, this CFMWS HPA range. Extend the memblks
   453		 * found for any portion of the window to cover the entire
   454		 * window.
   455		 */
   456		if (!numa_fill_memblks(start, end))
   457			return 0;
   458	
   459		/* No SRAT description. Create a new node. */
   460		node = acpi_map_pxm_to_node(*fake_pxm);
   461	
   462		if (node == NUMA_NO_NODE) {
   463			pr_err("ACPI NUMA: Too many proximity domains while processing CFMWS.\n");
   464			return -EINVAL;
   465		}
   466	
 > 467		if (numa_add_reserved_memblk(node, start, end) < 0) {
   468			/* CXL driver must handle the NUMA_NO_NODE case */
   469			pr_warn("ACPI NUMA: Failed to add memblk for CFMWS node %d [mem %#llx-%#llx]\n",
   470				node, start, end);
   471		}
   472		node_set(node, numa_nodes_parsed);
   473	
   474		/* Set the next available fake_pxm value */
   475		(*fake_pxm)++;
   476		return 0;
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
