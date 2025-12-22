Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1F224240
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385913; cv=none; b=c7QOfyZMkqTovU1OMC+Djm0J7/lFkylhhh4QXBwi63FTG5OykuHzUoOBUSbJsokUlWZtYajNypZDTx1LjxUUODNzMggAoYmYWasUfm8x5JpHulOfZGHFTLJozH+vAPblAd5N65mNYee9S2XWDFJogOH/UO/ef9T6zgkji1M5dPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385913; c=relaxed/simple;
	bh=/irag8V/n3gEUyNcV1OEdX36UeQ5ynUFWFwU9xYxGe0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EY1j42W4qKdYwFgwicP4A3IkOXegtSyL+K20ja6ikR09G0sZ5QeBZrfPdQgkeY57XeKBUD7/GHe5hgQh9WmrwyZ802H6tL9v7k9Kk/zeCAF9LtHa1gzfIo9Aa6Vzd3gTh8iLRFN2UP4IO0mR6pH1pBp+rGMJPhsbvu+kTrn6wl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZkGupD/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZkGupD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766385911; x=1797921911;
  h=date:from:to:cc:subject:message-id;
  bh=/irag8V/n3gEUyNcV1OEdX36UeQ5ynUFWFwU9xYxGe0=;
  b=PZkGupD/LiLDAzfwhIEP7rw1sa4kjBYW+syOkB0zT15MxvlATl/2UrK/
   Kzm4TsNtS/+WJvUQiEg8yvexBl6MQFooE3FhDoVoNhCnUKmjVAkH+2MJQ
   P57yiq2ZGWU+BsrlKi1y1227MDTPq/E5q2zRrePqxJXfuMbZ7MH9s18Fp
   vAqjhgJizLEAgwtEUgvHVADswc1kVzWGKJF5J0IN+IJHxbd5F1DytmODU
   TUSBa6YWtarj+f34+2u9y/9wiumLnht8cjvooT0mmPYrmmvDjl4o/RwS7
   uNrF5WGPHiwZQqhO7Wr1dfWvQJZCgEtBnz1RaVbsSbv6czx3j9ya1vbNm
   A==;
X-CSE-ConnectionGUID: sVRr9aX4SnWSFyE2YfBpKQ==
X-CSE-MsgGUID: Gegq2BN4Qj+SFOtCemOjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78875933"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78875933"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:45:08 -0800
X-CSE-ConnectionGUID: Haz4vWupQ6CQc9IE5Mcqvw==
X-CSE-MsgGUID: uYXkdG/PRf+u6+o9UGIUOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199960743"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 22:45:06 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZfD-000000000AT-3k9v;
	Mon, 22 Dec 2025 06:45:03 +0000
Date: Mon, 22 Dec 2025 14:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Collins <bcollins@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202512221405.VHPKPjnp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 38c64dfe0af12778953846df5f259e913275cfe5 kexec: Include kernel-end even without crashkernel
date:   6 weeks ago
config: powerpc-randconfig-r111-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221405.VHPKPjnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221405.VHPKPjnp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kexec/core.c:217:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end @@     got restricted __be32 [usertype] @@
   arch/powerpc/kexec/core.c:217:20: sparse:     expected unsigned int static [addressable] [toplevel] [usertype] kernel_end
   arch/powerpc/kexec/core.c:217:20: sparse:     got restricted __be32 [usertype]

vim +217 arch/powerpc/kexec/core.c

6f29c3298b1821 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-17  203  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  204  static int __init kexec_setup(void)
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  205  {
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  206  	struct device_node *node;
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  207  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  208  	node = of_find_node_by_path("/chosen");
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  209  	if (!node)
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  210  		return -ENOENT;
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  211  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  212  	/* remove any stale properties so ours can be found */
38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  213  	of_remove_property(node, of_find_property(node, kernel_end_prop.name,
38c64dfe0af127 arch/powerpc/kexec/core.c           Ben Collins     2025-04-21  214  						  NULL));
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  215  
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  216  	/* information needed by userspace when using default_machine_kexec */
ea961a828fe725 arch/powerpc/kernel/machine_kexec.c Anton Blanchard 2014-01-22 @217  	kernel_end = cpu_to_be_ulong(__pa(_end));
79d1c712958f94 arch/powerpc/kernel/machine_kexec.c Nathan Fontenot 2012-10-02  218  	of_add_property(node, &kernel_end_prop);
2e8e4f5b80e101 arch/powerpc/kernel/machine_kexec.c Dale Farnsworth 2008-12-16  219  

:::::: The code at line 217 was first introduced by commit
:::::: ea961a828fe7250e954f086d74d9323c3d44c3e4 powerpc: Fix endian issues in kexec and crash dump code

:::::: TO: Anton Blanchard <anton@samba.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
