Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD418FDC2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739708770; cv=none; b=MjrZe4yUuUMbVOUv9OMlB6XzWUrB56QJ9cbPisnL6pEybh5tILZgoLqDNJoq7vj9rUIieBdRqpvwixdvc9m6EaIRKiM9eeN3zEi5Oe/R9D1E21WlBmnj9wFudgv/k2f04xFNTHWGRKIwnxkssBIKhQZ3d3okaL2LXVOS6ZfxHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739708770; c=relaxed/simple;
	bh=kg2l830iBr3o0HKwbEkZs0vaAs20WKJDDL101l8Axic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tc21tfE7UNIrlKpFocntxdarsYrgGgjw4bG5tbQs13iMfnlH6dRlAn8Tte8u6DgjuduHFYm1JMz7F83J31s6IC/5dNU2ri0rqo3rG0PwDXq6RCotD5tKqZToL1kNsLfg7YJM5blD7D/zoDphrdxObLvOjd03kEjAHTfGaOBBBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNeV/kp0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNeV/kp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739708767; x=1771244767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kg2l830iBr3o0HKwbEkZs0vaAs20WKJDDL101l8Axic=;
  b=SNeV/kp0FRRbWmeI9eQdLJ6sYK362Kco/7a/Osq62VEUJNQghlPilnZn
   uOcJV1GCsS9eY1aMhFIRR3Osd7McxbiZdqayhiumO2Jt80DW1riiMdf4Q
   CaT+TVlZ5PW37hFRxrs3Td83g/Z/lRfxM0FsnT0E/KpfjGl981p7dlC+R
   hyD6Cg+pVdJz/NinqGjua2nr/+3DZtzlMjnif9OkqRNYz3Y2L+0Qr/9Rw
   272GZZz0d/QYxe6/Cu4O5t3axvKVNrNNDo9tgVrW+SWhXHjXgtXEBEtd0
   Xlb6Rd10eqCOlBEJsXoyyoyXuKxrcDPJg+USZCSGWu1DC8r/xwlq6zZxj
   Q==;
X-CSE-ConnectionGUID: PKVDXXklRNWW8EjjInmHnw==
X-CSE-MsgGUID: mEH5gEO4Sf+Oihn6yfKlAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44335088"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="44335088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 04:26:06 -0800
X-CSE-ConnectionGUID: N5SSBFKMR7qqUsVlJXC1aA==
X-CSE-MsgGUID: 6/UrsIslTUq2E686mEKbWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="144733778"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2025 04:26:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjdik-001BuB-2h;
	Sun, 16 Feb 2025 12:26:02 +0000
Date: Sun, 16 Feb 2025 20:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 44/77]
 drivers/iommu/riscv/iommu.c:153:29: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202502162026.VcCLIIf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   a810219b42d39c2a9055150c3d3fc0677bc73e28
commit: 6ffcb04a541ee3af634b33aea0ed2fcee1ed1ab9 [44/77] iommu/riscv: Probe all icvec bits
config: riscv-randconfig-r111-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162026.VcCLIIf5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502162026.VcCLIIf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162026.VcCLIIf5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/riscv/iommu.c:153:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/iommu/riscv/iommu.c:153:29: sparse:     expected void *base
   drivers/iommu/riscv/iommu.c:153:29: sparse:     got void [noderef] __iomem *
>> drivers/iommu/riscv/iommu.c:687:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [usertype] *ddt_root @@     got void [noderef] __iomem * @@
   drivers/iommu/riscv/iommu.c:687:41: sparse:     expected unsigned long long [usertype] *ddt_root
   drivers/iommu/riscv/iommu.c:687:41: sparse:     got void [noderef] __iomem *

vim +153 drivers/iommu/riscv/iommu.c

856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  112  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  113  /*
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  114   * Discover queue ring buffer hardware configuration, allocate in-memory
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  115   * ring buffer or use fixed I/O memory location, configure queue base register.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  116   * Must be called before hardware queue is enabled.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  117   *
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  118   * @queue - data structure, configured with RISCV_IOMMU_QUEUE_INIT()
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  119   * @entry_size - queue single element size in bytes.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  120   */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  121  static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  122  				   struct riscv_iommu_queue *queue,
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  123  				   size_t entry_size)
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  124  {
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  125  	unsigned int logsz;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  126  	u64 qb, rb;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  127  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  128  	/*
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  129  	 * Use WARL base register property to discover maximum allowed
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  130  	 * number of entries and optional fixed IO address for queue location.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  131  	 */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  132  	riscv_iommu_writeq(iommu, queue->qbr, RISCV_IOMMU_QUEUE_LOG2SZ_FIELD);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  133  	qb = riscv_iommu_readq(iommu, queue->qbr);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  134  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  135  	/*
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  136  	 * Calculate and verify hardware supported queue length, as reported
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  137  	 * by the field LOG2SZ, where max queue length is equal to 2^(LOG2SZ + 1).
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  138  	 * Update queue size based on hardware supported value.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  139  	 */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  140  	logsz = ilog2(queue->mask);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  141  	if (logsz > FIELD_GET(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, qb))
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  142  		logsz = FIELD_GET(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, qb);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  143  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  144  	/*
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  145  	 * Use WARL base register property to discover an optional fixed IO
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  146  	 * address for queue ring buffer location. Otherwise allocate contiguous
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  147  	 * system memory.
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  148  	 */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  149  	if (FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb)) {
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  150  		const size_t queue_size = entry_size << (logsz + 1);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  151  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  152  		queue->phys = pfn_to_phys(FIELD_GET(RISCV_IOMMU_PPN_FIELD, qb));
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15 @153  		queue->base = devm_ioremap(iommu->dev, queue->phys, queue_size);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  154  	} else {
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  155  		do {
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  156  			const size_t queue_size = entry_size << (logsz + 1);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  157  			const int order = get_order(queue_size);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  158  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  159  			queue->base = riscv_iommu_get_pages(iommu, order);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  160  			queue->phys = __pa(queue->base);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  161  		} while (!queue->base && logsz-- > 0);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  162  	}
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  163  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  164  	if (!queue->base)
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  165  		return -ENOMEM;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  166  
1200f83d66c906 Andrew Jones   2024-11-14  167  	qb = riscv_iommu_phys_to_ppn(queue->phys) |
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  168  	     FIELD_PREP(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, logsz);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  169  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  170  	/* Update base register and read back to verify hw accepted our write */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  171  	riscv_iommu_writeq(iommu, queue->qbr, qb);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  172  	rb = riscv_iommu_readq(iommu, queue->qbr);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  173  	if (rb != qb) {
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  174  		dev_err(iommu->dev, "queue #%u allocation failed\n", queue->qid);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  175  		return -ENODEV;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  176  	}
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  177  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  178  	/* Update actual queue mask */
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  179  	queue->mask = (2U << logsz) - 1;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  180  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  181  	dev_dbg(iommu->dev, "queue #%u allocated 2^%u entries",
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  182  		queue->qid, logsz + 1);
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  183  
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  184  	return 0;
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  185  }
856c0cfe5c5f6a Tomasz Jeznach 2024-10-15  186  

:::::: The code at line 153 was first introduced by commit
:::::: 856c0cfe5c5f6a2cc8d995872eb67bff9c68c57c iommu/riscv: Command and fault queue support

:::::: TO: Tomasz Jeznach <tjeznach@rivosinc.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
