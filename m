Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47203F4837
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476353; cv=none; b=JEjAFpjnI8y+aTi6jpvM4hIMX5uhG3pIduQtJYHQyzzBi1RNAO1VFvVbv56OyzjcmK8Ej0Tdp6npVUvZQ+dyQfHYX/5Jmh7nE3RFbdI3YcNmPU859Kn8hMDQEuJNYFYV7TU5tefG2ygJWYAuNI0qm75gjEA9nmQYd+PZ3xxkYb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476353; c=relaxed/simple;
	bh=zh8/CZ/D5v8hhilZYJEpZDOhefxyT69L7QytBFAypG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWQPHb6Lcxdpxe0kxfQeVOTLsIirx5KSP3OvpIqDZYd0QtKwtPlgZeWNsPN86ilAx0SpxNB/hQZIQOsq2MhVqnn7ZInxOKPRLd9AsrDDsNKJDK21d/RwP7jCq3G+mpD79nGr5AP8fGdrk1S+02WaPakCufur5/ZeH3fzL84VT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtuR3iEC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtuR3iEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782476351; x=1814012351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zh8/CZ/D5v8hhilZYJEpZDOhefxyT69L7QytBFAypG8=;
  b=VtuR3iEC9gbXKxOms3j49XMz10lAKgfJrrJf5g0u5KuLuWiy4XG6NBfW
   BLO0CvYpvSBXYycEQ/AhmMJ9sBNO0HXGyPJ1Gvh4aH/gtd3sSQtR4rzzG
   aiilU/KgaN69/VvYIKN2EmJxI1g6gf0JGzfiv590A2Q8wTb+TXnhcTiFe
   oCsiPM8L/z9SDZNWM6VJPBscoKy3ZFCilnd+QDqeu/s4hekP5q6udmcm/
   pjjvQIpE3e+UO0lHZrtIJXtkyMxYcEO9QkOuHGj9jgdtGusDar7kuCjD2
   E2PbzeQcJo2orxA9R0+4eMApOj4se21+6aaMsn0lH3QJXKQWlrsuMPX+k
   g==;
X-CSE-ConnectionGUID: dDs6DtCoSB+ji528Ooo2sA==
X-CSE-MsgGUID: KTSw0xT6SF25SeQk9x8HNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="86947323"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="86947323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:19:11 -0700
X-CSE-ConnectionGUID: H2XLAHS6TqyEopNz8WO6OA==
X-CSE-MsgGUID: 4/nvKSZxQI6cL2O08tYEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="244915402"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2026 05:19:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd5WT-0000000053t-211S;
	Fri, 26 Jun 2026 12:19:05 +0000
Date: Fri, 26 Jun 2026 20:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sourav Panda <souravpanda@google.com>, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, surenb@google.com,
	fvdl@google.com, gthelen@google.com, souravpanda@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/hugetlb_cma: support percentage-based hugetlb_cma
 reservation
Message-ID: <202606262023.IKUrn01I-lkp@intel.com>
References: <20260625215900.2151690-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625215900.2151690-1-souravpanda@google.com>

Hi Sourav,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourav-Panda/mm-hugetlb_cma-support-percentage-based-hugetlb_cma-reservation/20260626-060014
base:   v7.1
patch link:    https://lore.kernel.org/r/20260625215900.2151690-1-souravpanda%40google.com
patch subject: [PATCH v1] mm/hugetlb_cma: support percentage-based hugetlb_cma reservation
config: i386-randconfig-062-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262023.IKUrn01I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262023.IKUrn01I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606262023.IKUrn01I-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/hugetlb_cma.o: in function `hugetlb_cma_reserve':
>> mm/hugetlb_cma.c:219:(.init.text+0x21b): undefined reference to `__udivmoddi4'
>> ld: mm/hugetlb_cma.c:219:(.init.text+0x22f): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +219 mm/hugetlb_cma.c

   189	
   190	void __init hugetlb_cma_reserve(void)
   191	{
   192		unsigned long size, reserved, per_node, order;
   193		bool node_specific_cma_alloc = false;
   194		bool has_node_specific_param = false;
   195		int nid;
   196	
   197		for (nid = 0; nid < MAX_NUMNODES; nid++) {
   198			if (hugetlb_cma_size_in_node[nid] || hugetlb_cma_percent_in_node[nid]) {
   199				has_node_specific_param = true;
   200				break;
   201			}
   202		}
   203	
   204		if (has_node_specific_param) {
   205			for (nid = 0; nid < MAX_NUMNODES; nid++) {
   206				if (hugetlb_cma_percent_in_node[nid]) {
   207					unsigned long node_gfp_mem = memblock_node_memory_size(nid);
   208					unsigned long s;
   209	
   210					s = mult_frac(node_gfp_mem,
   211						      hugetlb_cma_percent_in_node[nid],
   212						      100);
   213	
   214					hugetlb_cma_size_in_node[nid] = s;
   215					hugetlb_cma_size += s;
   216				}
   217			}
   218		} else if (hugetlb_cma_percent) {
 > 219			hugetlb_cma_size = mult_frac(memblock_phys_mem_size(), hugetlb_cma_percent, 100);
   220		}
   221	
   222		if (!hugetlb_cma_size)
   223			return;
   224	
   225		order = arch_hugetlb_cma_order();
   226		if (!order) {
   227			pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
   228			return;
   229		}
   230	
   231		/*
   232		 * HugeTLB CMA reservation is required for gigantic
   233		 * huge pages which could not be allocated via the
   234		 * page allocator. Just warn if there is any change
   235		 * breaking this assumption.
   236		 */
   237		VM_WARN_ON(order <= MAX_PAGE_ORDER);
   238	
   239		hugetlb_bootmem_set_nodes();
   240	
   241		for (nid = 0; nid < MAX_NUMNODES; nid++) {
   242			if (hugetlb_cma_size_in_node[nid] == 0)
   243				continue;
   244	
   245			if (!node_isset(nid, hugetlb_bootmem_nodes)) {
   246				pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
   247				hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
   248				hugetlb_cma_size_in_node[nid] = 0;
   249				continue;
   250			}
   251	
   252			if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
   253				pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n",
   254					nid, (PAGE_SIZE << order) / SZ_1M);
   255				hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
   256				hugetlb_cma_size_in_node[nid] = 0;
   257			} else {
   258				node_specific_cma_alloc = true;
   259			}
   260		}
   261	
   262		/* Validate the CMA size again in case some invalid nodes specified. */
   263		if (!hugetlb_cma_size)
   264			return;
   265	
   266		if (hugetlb_cma_size < (PAGE_SIZE << order)) {
   267			pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
   268				(PAGE_SIZE << order) / SZ_1M);
   269			hugetlb_cma_size = 0;
   270			return;
   271		}
   272	
   273		if (!node_specific_cma_alloc) {
   274			/*
   275			 * If 3 GB area is requested on a machine with 4 numa nodes,
   276			 * let's allocate 1 GB on first three nodes and ignore the last one.
   277			 */
   278			per_node = DIV_ROUND_UP(hugetlb_cma_size,
   279						nodes_weight(hugetlb_bootmem_nodes));
   280			per_node = round_up(per_node, PAGE_SIZE << order);
   281			pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
   282				hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
   283		}
   284	
   285		reserved = 0;
   286		for_each_node_mask(nid, hugetlb_bootmem_nodes) {
   287			int res;
   288			char name[CMA_MAX_NAME];
   289	
   290			if (node_specific_cma_alloc) {
   291				if (hugetlb_cma_size_in_node[nid] == 0)
   292					continue;
   293	
   294				size = hugetlb_cma_size_in_node[nid];
   295			} else {
   296				size = min(per_node, hugetlb_cma_size - reserved);
   297			}
   298	
   299			size = round_up(size, PAGE_SIZE << order);
   300	
   301			snprintf(name, sizeof(name), "hugetlb%d", nid);
   302			/*
   303			 * Note that 'order per bit' is based on smallest size that
   304			 * may be returned to CMA allocator in the case of
   305			 * huge page demotion.
   306			 */
   307			res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
   308						HUGETLB_PAGE_ORDER, name,
   309						&hugetlb_cma[nid], nid);
   310			if (res) {
   311				pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
   312					res, nid);
   313				continue;
   314			}
   315	
   316			reserved += size;
   317			pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
   318				size / SZ_1M, nid);
   319	
   320			if (reserved >= hugetlb_cma_size)
   321				break;
   322		}
   323	
   324		if (!reserved)
   325			/*
   326			 * hugetlb_cma_size is used to determine if allocations from
   327			 * cma are possible.  Set to zero if no cma regions are set up.
   328			 */
   329			hugetlb_cma_size = 0;
   330	}
   331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
