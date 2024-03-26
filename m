Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1F134419
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711492507; cv=none; b=BslbAijAp/x5BOJrSsdyWCG8822ujmOOSODQ1AXOuttKXM2pMSnfjW1RsSO49zOBGTYKa2Zgx1zYsGMvYMWJ7BdAvr2fDsnOZ3dv0B2pEgfNQ8G8FhUlj1ahmUjK9yflmOrcZcPXsLwgonWWJSdJF52K6d/OPow2AsEdZct3xP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711492507; c=relaxed/simple;
	bh=89tZKsxcLjweuvQYCp8BWnjIYJE7DSXJM4o5T+bYt4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KU+yHwq6VgXfAg8O4+oj5zltvopGRz4v5Al26VDcHeqNCZnA/93rwQCLq1EtUFD/fYWWPFQw69xG8J/KuAhlwUJKjJHit1SwNN8c4L5Ig1xYqP2qiNPHL415wG+bXjWidghYnqDDbyxVJFKRWUDafEFp8530RqnlDe2sAcO3CUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLL7s+KE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLL7s+KE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711492506; x=1743028506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89tZKsxcLjweuvQYCp8BWnjIYJE7DSXJM4o5T+bYt4E=;
  b=jLL7s+KEADrfh7Arso3In8m/sd3pBxpnZucCmOa8xV5AP7WFzhuXRzn3
   sgZ1KGWChVs5sX7hz3wTBQXqDUZyzCh9/0qyzhtxC+v1ejkhnWB7f9XCj
   rFmsj6RLtW8g+l70SPWLlRX1aMhrJSNuG5VCh1TZv09MGorQsIGQlF41n
   ZC3lln/xSP8MUpp9+KfyyLlVb4v3I5rn3sE5bcVQrdAvmYdPjhqZCectt
   upB2k6QXgiliB1G7nS49zR2OEbdzkUaeL77TGz0Y6c/1v5ZbydX3re38a
   qyxjN+VOI0O0UDfYILc7SfBuDPWexl0Bn/R2tR6YiDNK+AHGFtcf/Nitq
   Q==;
X-CSE-ConnectionGUID: p4+2iiRFQouz4hLC/6L7Zw==
X-CSE-MsgGUID: IrzvmzAzRjCOGH2+iQr9lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="7171741"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="7171741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20819235"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2024 15:35:04 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpFNl-0000UE-0m;
	Tue, 26 Mar 2024 22:35:01 +0000
Date: Wed, 27 Mar 2024 06:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:kprobes-v5 2/2] arch/riscv/kernel/execmem.c:14:1:
 warning: control reaches end of non-void function
Message-ID: <202403270629.Kcyq9RmU-lkp@intel.com>
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
config: riscv-randconfig-r131-20240326 (https://download.01.org/0day-ci/archive/20240327/202403270629.Kcyq9RmU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240327/202403270629.Kcyq9RmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270629.Kcyq9RmU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/execmem.c: In function 'alloc_execmem':
   arch/riscv/kernel/execmem.c:10:46: error: 'MODULES_VADDR' undeclared (first use in this function)
      10 |         return __vmalloc_node_range(size, 1, MODULES_VADDR,
         |                                              ^~~~~~~~~~~~~
   arch/riscv/kernel/execmem.c:10:46: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/execmem.c:11:37: error: 'MODULES_END' undeclared (first use in this function)
      11 |                                     MODULES_END, GFP_KERNEL,
         |                                     ^~~~~~~~~~~
>> arch/riscv/kernel/execmem.c:14:1: warning: control reaches end of non-void function [-Wreturn-type]
      14 | }
         | ^


vim +14 arch/riscv/kernel/execmem.c

     7	
     8	void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
     9	{
    10		return __vmalloc_node_range(size, 1, MODULES_VADDR,
    11					    MODULES_END, GFP_KERNEL,
    12					    PAGE_KERNEL, 0, NUMA_NO_NODE,
    13					    __builtin_return_address(0));
  > 14	}
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
