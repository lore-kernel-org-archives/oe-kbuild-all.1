Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA16223DDA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747634933; cv=none; b=Hp8M9bUkdxd+g8pJiODHDjh+vHd7stL+CbWjXMk5SRC+MbbObTmsO2/nFJFGpyUSToRxetHusvyjiU00UeIzygsqWQNE8szdJk07jGSQlzmKWxn38GKvwoH+NK7z3TqxvFUpiF+I6sPKWYFUiBCHO3Cy6EMXe+Pn1KaOj1iXu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747634933; c=relaxed/simple;
	bh=a4LRrpdAL9Mtpqx4o3954jHsju/s2lx/wbNle+rH9sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUWFCX7tVentppQXdP4ipQ+noQRYHdZhlxe5MtqhRl6RvqI3QAfIvmYQDFJeH5Cjs+qNqAA77nFzYPwws1TxKNaImYw+i0NTGa9Gp+tIOwOfe8KWObzupZW9aro+IZ7wEFBNPd/zXHYJ3Up1WdsM5Ya1H2A+6s0TpCqiautotuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJQN6cD0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJQN6cD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747634932; x=1779170932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4LRrpdAL9Mtpqx4o3954jHsju/s2lx/wbNle+rH9sg=;
  b=DJQN6cD0/XSrW99+escpX0OgAvbSDqpZXIOdk0qSHPMes+3RIgLoZa7G
   2A2xV1HpbSpWNEv53W5qll6fzMxtV52Br1xVgsi9UiChef2PvoX9FYPYy
   4air9g32Q9Z6eE8BTWSKNthVPp229qTaM9zAWLyGWT7MEhE89JgTRnGwW
   /KDt9PmJUatgECZ7ZgsFcKiKv0ijJYpWmQveYmMsmKGazBTWQZZQvKRBz
   jN6LnGVUjgiTpSd/Sx6GjrTU7JtduPxaMphgDXh7gU0XtlGYswlAqCv/J
   jUUC+ezIPoNqGp0yVK4Mj2jDBXEbQpjoDljiRvsxRiQidHXN90dhMsC5H
   g==;
X-CSE-ConnectionGUID: 0n5Wv20bQxaBSzX9xkNpwQ==
X-CSE-MsgGUID: yTgt/lTiRVi+fTIFQvSYEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="72024841"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="72024841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:08:51 -0700
X-CSE-ConnectionGUID: UDMP399rQM+6U76otKD/3w==
X-CSE-MsgGUID: XdZlScP1Q9OfPOPDwmszsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139176133"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2025 23:08:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGtg8-000LBh-1b;
	Mon, 19 May 2025 06:08:48 +0000
Date: Mon, 19 May 2025 14:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bmfn 38/40] drivers/infiniband/hw/hfi1/affinity.c:970:14:
 error: unterminated function-like macro invocation
Message-ID: <202505191432.43cXdnqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bmfn
head:   1445b2966102b17479db9cc5c64c136e3a8af508
commit: c1651f6e8204ac656ef7810df2060090ff245811 [38/40] RDMA: hfi1: use rounddown in find_hw_thread_mask()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250519/202505191432.43cXdnqP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191432.43cXdnqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191432.43cXdnqP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi1/affinity.c:970:14: error: unterminated function-like macro invocation
     970 |         num_cores = rounddown(node_affinity.num_online_cpus / affinity->num_core_siblings,
         |                     ^
   include/linux/math.h:85:9: note: macro 'rounddown' defined here
      85 | #define rounddown(x, y) (                               \
         |         ^
>> drivers/infiniband/hw/hfi1/affinity.c:1180:2: error: expected expression
    1180 | }
         |  ^
>> drivers/infiniband/hw/hfi1/affinity.c:1180:2: error: expected '}'
   drivers/infiniband/hw/hfi1/affinity.c:961:1: note: to match this '{'
     961 | {
         | ^
   3 errors generated.


vim +970 drivers/infiniband/hw/hfi1/affinity.c

   957	
   958	/* This should be called with node_affinity.lock held */
   959	static void find_hw_thread_mask(uint hw_thread_no, cpumask_var_t hw_thread_mask,
   960					struct hfi1_affinity_node_list *affinity)
   961	{
   962		int curr_cpu;
   963		uint num_cores;
   964	
   965		cpumask_copy(hw_thread_mask, &affinity->proc.mask);
   966	
   967		if (affinity->num_core_siblings == 0)
   968			return;
   969	
 > 970		num_cores = rounddown(node_affinity.num_online_cpus / affinity->num_core_siblings,
   971					node_affinity.num_online_nodes;
   972	
   973		/* Removing other siblings not needed for now */
   974		curr_cpu = cpumask_cpumask_nth(num_cores - 1, hw_thread_mask);
   975	
   976		cpumask_clear_cpus(hw_thread_mask, curr_cpu, nr_cpu_ids - curr_cpu);
   977	
   978		/* Identifying correct HW threads within physical cores */
   979		cpumask_shift_left(hw_thread_mask, hw_thread_mask, num_cores * hw_thread_no);
   980	}
   981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
