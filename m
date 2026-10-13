Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C547334C3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876839; cv=none; b=iJ/o1GZSyRlKEERETXxT6hovQpVnajD1NbQoQfauUZJ01JxNNicWaaHpZoOMDRbFkXQ7zTYpyMN4bK1PaAAJATD0H51lmQrM14FFH5njTsjgHJk54iE4XtX7oVkmiCZrt86fulDKBoyUISoa6W8RW59cIA4qCgiWlHTIz7M2JMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876839; c=relaxed/simple;
	bh=/84qz+HKNn9Q7/u9gRzQi86Jhc6wuLE1/XSUpECA8uE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=laslBNBgT0lq+4k9ArAatTDC2mjMCu4Wbt0TIywGd/xwH6vabEeiy0egHQU3soMjNO1pqTqNc9M27+GaxN9goDjRn/wwaztUlIoKyP38dwqn3nVO2Wcaj9aI8DDSirDyNrYvYDCU0lKNgBwoEBBMSNGA/uPrNbZZfuSCtQQAp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ntuwy8xC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ntuwy8xC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791876838; x=1823412838;
  h=date:from:to:cc:subject:message-id;
  bh=/84qz+HKNn9Q7/u9gRzQi86Jhc6wuLE1/XSUpECA8uE=;
  b=Ntuwy8xCzqmFe2wlDnqsz5pQZ5IPAglAbA9eMnJvcjGR6/CCeeKdhl9J
   Qq3G3DCcHxeaN1CqQxH22E77VqR28HPly39KVtLTKgkRQKMTx816C0OGl
   2TcsrxKrbbApAAgBZzDphW5oFJQJoE+uxc0yHzzeWwRhjXsCt+QGT7N4a
   AKvE07ir+NmlUT0breVmOFqvahwqEhdU64EkYMQjZzgwdfKr2kTzAQ9/3
   JMJc9oLhFlvpFFSm33IgESQisYcn/Hi41B2gG5MSzPy5ugJh/KmHABEP7
   1cnDIg8rBn0ziBZU1P1PgjZgOlhh6w8dLpb4x6bF7fC8yC0IJaJbWkTQ+
   A==;
X-CSE-ConnectionGUID: SA+6LTYGTguv0IP5O7d76g==
X-CSE-MsgGUID: 8D5dHlaEQjG3f62mAQ0rHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="479849"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="479849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:33:57 -0700
X-CSE-ConnectionGUID: r4+k52LlRwSos56w3GLerA==
X-CSE-MsgGUID: 8hJ1hNW1SjKDhOsEZKDzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1193900"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 00:33:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGX1F-00000000AQZ-3kGv;
	Tue, 13 Oct 2026 07:33:53 +0000
Date: Tue, 13 Oct 2026 09:33:17 +0200
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202610130906.aIeRR116-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   dd5d1340f9d2226762be6e009f9dcc3d8639d1a2
commit: dd5d1340f9d2226762be6e009f9dcc3d8639d1a2 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r2308-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130906.aIeRR116-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130906.aIeRR116-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130906.aIeRR116-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:776:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:776:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:791:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:791:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:791:25: sparse:     got unsigned short [usertype] *ip

vim +776 arch/arm/mm/alignment.c

c2860d43f5dfab George G. Davis   2009-06-04  769  
1bb9fb0a147f9d Russell King      2019-09-06  770  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487ad Russell King      2019-08-31  771  {
67e15fa5b487ad Russell King      2019-08-31  772  	u32 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  773  	int fault;
67e15fa5b487ad Russell King      2019-08-31  774  
67e15fa5b487ad Russell King      2019-08-31  775  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @776  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  777  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  778  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  779  
67e15fa5b487ad Russell King      2019-08-31  780  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487ad Russell King      2019-08-31  781  
67e15fa5b487ad Russell King      2019-08-31  782  	return fault;
67e15fa5b487ad Russell King      2019-08-31  783  }
67e15fa5b487ad Russell King      2019-08-31  784  
67e15fa5b487ad Russell King      2019-08-31  785  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487ad Russell King      2019-08-31  786  {
67e15fa5b487ad Russell King      2019-08-31  787  	u16 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  788  	int fault;
67e15fa5b487ad Russell King      2019-08-31  789  
67e15fa5b487ad Russell King      2019-08-31  790  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @791  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  792  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  793  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  794  
67e15fa5b487ad Russell King      2019-08-31  795  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487ad Russell King      2019-08-31  796  
67e15fa5b487ad Russell King      2019-08-31  797  	return fault;
67e15fa5b487ad Russell King      2019-08-31  798  }
67e15fa5b487ad Russell King      2019-08-31  799  

:::::: The code at line 776 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
