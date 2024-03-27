Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B4B20DC3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 02:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711506443; cv=none; b=rfan2fONPpHdACtxvFmT8dtzdyXTpv9JBbZaA71JVm5nIjkzSotrRVuRO0GpnRQ1IWv9d+VjqwnGbmlcwUHJk0UtZ+Gyc/pnVUJAauZDVA1nI50cps0nKVqK2AagANN7pZ/p39dAhW22tzLfkFxXhl4IJQ6iYw8fhNiT7vlVj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711506443; c=relaxed/simple;
	bh=z8+MAtWlXEX54MOWGYmXvimxNT8qq+rrqXoepRlEwEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DERiDByPKN2+0fGdDZ113rG9wjYwafuEgw7n/+ZzbVYzuztgOak5YqGfNd95KTNkyEPi57zbCo6XHM++hXQPbI602rWLzmdI91fKgtInU5ZLXfuZo9HQjNVczG7Y+pWcPw9AsbbCHua+G6UkHcaQt9TqJLyPI8chBQ682/aQECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8c9rNx6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8c9rNx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711506442; x=1743042442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8+MAtWlXEX54MOWGYmXvimxNT8qq+rrqXoepRlEwEw=;
  b=O8c9rNx6rcjJA6KzIYMF9yEhVBS1gKCVhT+n4VwLjom7qVUdQ40+IJ90
   F+v6pLDZFsSfWmztAvmu10PzmnDufyJ8HOpDxm2KjpHw6/QHCrc9jXBZK
   LRy7rZtwIrQaQ/hD2AHMulaCY94SS1Ufd4OGBoHErx/feQs/gc/sC5Rf4
   uC4rn3ACwKyS4+sjySmu6s/aec7Q/77dMGvBxePRzPUDgJZdzA3AeWb8C
   FmsLxg9MJxuhuRto1tvZ0c+97F3qYX/9C8848+sfv9Zhjg5Ak9NfxP0hG
   bipMZ+vQZ3Jsr0vf6OWNeb9Id57IzJneaMvkIOeb39t/w4dfOQy6dn8Ji
   g==;
X-CSE-ConnectionGUID: jkxVMAleQQigxHahqrV2JQ==
X-CSE-MsgGUID: hir1JflaQRqmEL6rVBZvng==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17318424"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17318424"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 19:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16535300"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2024 19:27:10 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpJ0O-0000eo-1D;
	Wed, 27 Mar 2024 02:27:08 +0000
Date: Wed, 27 Mar 2024 10:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:kprobes-v5 2/2] arch/riscv/kernel/execmem.c:10:39:
 error: use of undeclared identifier 'MODULES_VADDR'
Message-ID: <202403271023.dkmDQEyC-lkp@intel.com>
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
config: riscv-randconfig-r122-20240326 (https://download.01.org/0day-ci/archive/20240327/202403271023.dkmDQEyC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce: (https://download.01.org/0day-ci/archive/20240327/202403271023.dkmDQEyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271023.dkmDQEyC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/execmem.c:3:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/riscv/kernel/execmem.c:8:56: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
       8 | void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
         |                                                        ^
>> arch/riscv/kernel/execmem.c:10:39: error: use of undeclared identifier 'MODULES_VADDR'
      10 |         return __vmalloc_node_range(size, 1, MODULES_VADDR,
         |                                              ^
>> arch/riscv/kernel/execmem.c:11:9: error: use of undeclared identifier 'MODULES_END'
      11 |                                     MODULES_END, GFP_KERNEL,
         |                                     ^
   2 warnings and 2 errors generated.


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
