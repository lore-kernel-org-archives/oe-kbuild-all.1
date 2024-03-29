Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFD61946F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680696; cv=none; b=h5UuVZmRzIUb78pbyju9D1gPUaDU7Msbhhc2k6VyYHh5x6gMPffOp2zUASDB/4mXDgY/PQ+CesBZ5AHjARxzgfYamVSIor/TPTVEnulxNjywcDDxO05VDPr7lTabgkvcJglk+FK4erATXAfi57QF55e+ELnydP0wBbJAEyOUQ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680696; c=relaxed/simple;
	bh=F5YWWi1DiC236nG2WJAT5LXB8zQd10GLOzjLxISwXh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VfaIo72hgHpTY3PCUCf5KzhjoJHQO2Poug8K9MBFVh7N8Pdy7YbLwZPIjXLRfZoeB0Vqeq97pYbRTn1hEEuLxuwl5jF2/tlNQLc8WWfcCwTN7TKOX3wYrxiTzOWPgZI+CKjyd1NPnr09TWOz7pcWFRmAFVF5t3AhcZixPPQp6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxRBsW2N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxRBsW2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711680694; x=1743216694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5YWWi1DiC236nG2WJAT5LXB8zQd10GLOzjLxISwXh0=;
  b=JxRBsW2NLl7bF9BBNrrSTqSXmlNzWuYvLbxYWLTDXw+lw1BjJHYJRmuL
   v51oK1gWIQRf1HaM19vDLMTi9SUjNJ7Gx5fr03hCVxc+1ZAJXIzeSegQ7
   GxyH+PT2urudcMpB4nYPywnBR3e5ikZpuqsZSNMuLr43AnGbbClqgaVWq
   kJbudedXjzIPP0ntXrPZzvtluxm1zthgba6xDv8KF/5ojc3GSnAOLQh4P
   OPa3d+Jwk7LRRwR4nZPBgNydZZamYchN/P0XbP7m5ur0/Npr5tb9WGQP6
   eWZY3dtcUP2Ud4BUBZEaikTAWE7QA8L2V6hbaaQA084CzvauqtemvAIo+
   A==;
X-CSE-ConnectionGUID: y359qNEMRWmqZKPcnIjQwg==
X-CSE-MsgGUID: TkeJYP2VT1yukd+N06TeGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18247502"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="18247502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 19:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16678869"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2024 19:51:32 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq2L4-0002mq-0V;
	Fri, 29 Mar 2024 02:51:30 +0000
Date: Fri, 29 Mar 2024 10:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:kprobes-v5 2/2] arch/riscv/kernel/execmem.c:10:46:
 error: 'MODULES_VADDR' undeclared
Message-ID: <202403291045.DV4aepEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git kprobes-v5
head:   551464954a1ec4f0b14974861e113ac93287da99
commit: 551464954a1ec4f0b14974861e113ac93287da99 [2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
config: riscv-randconfig-r131-20240326 (https://download.01.org/0day-ci/archive/20240329/202403291045.DV4aepEk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240329/202403291045.DV4aepEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291045.DV4aepEk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/execmem.c: In function 'alloc_execmem':
>> arch/riscv/kernel/execmem.c:10:46: error: 'MODULES_VADDR' undeclared (first use in this function)
      10 |         return __vmalloc_node_range(size, 1, MODULES_VADDR,
         |                                              ^~~~~~~~~~~~~
   arch/riscv/kernel/execmem.c:10:46: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/execmem.c:11:37: error: 'MODULES_END' undeclared (first use in this function)
      11 |                                     MODULES_END, GFP_KERNEL,
         |                                     ^~~~~~~~~~~
   arch/riscv/kernel/execmem.c:14:1: warning: control reaches end of non-void function [-Wreturn-type]
      14 | }
         | ^


vim +/MODULES_VADDR +10 arch/riscv/kernel/execmem.c

     7	
     8	void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
     9	{
  > 10		return __vmalloc_node_range(size, 1, MODULES_VADDR,
  > 11					    MODULES_END, GFP_KERNEL,
    12					    PAGE_KERNEL, 0, NUMA_NO_NODE,
    13					    __builtin_return_address(0));
    14	}
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
