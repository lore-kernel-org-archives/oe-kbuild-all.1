Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453159;
	b=r5jKoN8toZfC+IA6XjOdbUNZ29/ljhgGVQBLAdcirbLSLotuER7KX4hZv637TrAkQVeW
	 tQtmhxZ9PD/8L8/otmxZQMr26ZJxRJxDj3jKXmWn8lFpbeCcn3Qd5mibMwT3B02/ziP1y
	 FkgIrLS/I/j0NcTCi4OuJfMHeGUepDA1tCQxdRwPvhadREM+m5NJmEORVO5vNzlGBJuCZ
	 jJ0Jocp/t8cG6+QqaLIm79nuBestOtK6QJcI2Zqe9zlk3/TLoXVmxgBHnmrE+39DQQ+Ze
	 h052Vmf4mIAha8zulvz9nGBWbBe0y/eFPe2bLAuEu4biJHvps50W8P/jPIL3MRkl4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453159;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LoOLTgeVOr2u3jo2L9B4a45A3WMr7vCA6NGVMbELKuY=;
	b=CdbuwJSCdIKOF2RUwaNA3PS0b2Z4ucDXVYPVzH2THgga/bwNIV1WNOqRvGN96uXLo19U
	 bVFyq8pyketwov30CCIFZnh0g+CSmP2Sm1980hC8ErKxirjnNyhgfKPcct5K/sixmx75c
	 LmatGo6gbR91Ghyyv62riaX27vpPfwaCfn6bSkGwvauzT+kpb+bu0/y8Vm8dg6nBe0wzk
	 l+aKcmRAJOqgZa/nndyFPvUQWZDqf4AVchkiQgHJr33XPQTkB1WrTKKeuNUZHKZg5FqYZ
	 KWumjuv4ZHWD0AiyL7vKQa3jHIeXIdypVMhuTm9rG83k6x12BwX5RqgG2nYOAkwDW3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpQpMkz9;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AC606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 16:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VpQpMkz9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795453159; x=1826989159;
  h=date:from:to:cc:subject:message-id;
  bh=7p8v0YMd9eOc7ZAIQT2OzgMKxUcjB+dmzrM62U9nAdw=;
  b=VpQpMkz9HSYkOCWNBFW8FcBza2uresenMhogLQbOKm0ywGBgjlAXN0Rf
   RvJoY4IMs2oRSiGQ6WdU6srz98KQhgG3K/PMGZ1SMWfwW9S8Sj1vgzgFQ
   eH/crT40G7RR46OyrqfjsdRuS84YsXpR1oPvD78+rfvYc/MV5GLUhb+iR
   pIpbEqzTaAWW1BPDJSKvh9TOipaWEjEZTq/tMiO0cRg/pqsl2okramnA2
   WYDI9AbtHup8cmWvEm5Y/qpuyjBNdOQac8coJm5oqG8Jbz2OT0Kd5dK+L
   yP8bLpsTSsYYAdFe9yvwMAvCt4ntMcPJw3HHKebZe4dg85HM3grsY+zbT
   A==;
X-CSE-ConnectionGUID: RTiJOjVYRAi1OJBteyjwjg==
X-CSE-MsgGUID: sn3zQtIZTp6kcib5KIUfQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4304386"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4304386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 08:59:18 -0800
X-CSE-ConnectionGUID: NwR40+dCQPe4Rlm92jWnQg==
X-CSE-MsgGUID: 4LmeoSXfQui6Ppc8Z0Avlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11675692"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Nov 2026 08:59:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVXNq-000000004sH-26ig;
	Mon, 23 Nov 2026 16:59:14 +0000
Date: Mon, 23 Nov 2026 17:59:00 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 330/330]
 arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits
 from constant value (ffffffffffffff00 becomes 0)
Message-ID: <20261123175809.JEwkidA8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   1b09ce8b32c8782b06415be8b3627cac08ae1100
commit: 1f8645b7686d6cadc50b7b93b0ab2f94a677db09 [330/330] arm64: percpu: Fix this_cpu_and() mask generation
config: arm64-randconfig-r2301-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123175809.JEwkidA8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123175809.JEwkidA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123175809.JEwkidA8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk_safe.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h):
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (10000000 becomes 0)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (10000000 becomes 0)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (fffffffff0000000 becomes 0)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (fffffffff0000000 becomes 0)
   arch/arm64/include/asm/percpu.h:128:1: sparse: sparse: cast truncates bits from constant value (8000000 becomes 0)
   arch/arm64/include/asm/percpu.h:128:1: sparse: sparse: cast truncates bits from constant value (8000000 becomes 0)
>> kernel/printk/printk_safe.c:334:9: sparse: sparse: cast truncates bits from constant value (f7ffffff becomes ff)
>> arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffffffffff00 becomes 0)
>> kernel/printk/printk_safe.c:334:9: sparse: sparse: cast truncates bits from constant value (f7ffffff becomes ffff)
>> arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffffffff0000 becomes 0)

vim +127 arch/arm64/include/asm/percpu.h

f97fc810798c261 Steve Capper 2014-11-19  109  
959bf2fd03b59fc Will Deacon  2018-09-13  110  #define PERCPU_OP(name, op_llsc, op_lse)				\
959bf2fd03b59fc Will Deacon  2018-09-13  111  	__PERCPU_OP_CASE(w, b, name,  8, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  112  	__PERCPU_OP_CASE(w, h, name, 16, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  113  	__PERCPU_OP_CASE(w,  , name, 32, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  114  	__PERCPU_OP_CASE( ,  , name, 64, op_llsc, op_lse)
959bf2fd03b59fc Will Deacon  2018-09-13  115  
959bf2fd03b59fc Will Deacon  2018-09-13  116  #define PERCPU_RET_OP(name, op_llsc, op_lse)				\
959bf2fd03b59fc Will Deacon  2018-09-13  117  	__PERCPU_RET_OP_CASE(w, b, name,  8, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  118  	__PERCPU_RET_OP_CASE(w, h, name, 16, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  119  	__PERCPU_RET_OP_CASE(w,  , name, 32, op_llsc, op_lse)		\
959bf2fd03b59fc Will Deacon  2018-09-13  120  	__PERCPU_RET_OP_CASE( ,  , name, 64, op_llsc, op_lse)
959bf2fd03b59fc Will Deacon  2018-09-13  121  
959bf2fd03b59fc Will Deacon  2018-09-13  122  PERCPU_RW_OPS(8)
959bf2fd03b59fc Will Deacon  2018-09-13  123  PERCPU_RW_OPS(16)
959bf2fd03b59fc Will Deacon  2018-09-13  124  PERCPU_RW_OPS(32)
959bf2fd03b59fc Will Deacon  2018-09-13  125  PERCPU_RW_OPS(64)
959bf2fd03b59fc Will Deacon  2018-09-13  126  PERCPU_OP(add, add, stadd)
959bf2fd03b59fc Will Deacon  2018-09-13 @127  PERCPU_OP(andnot, bic, stclr)
959bf2fd03b59fc Will Deacon  2018-09-13  128  PERCPU_OP(or, orr, stset)
959bf2fd03b59fc Will Deacon  2018-09-13  129  PERCPU_RET_OP(add, add, ldadd)
959bf2fd03b59fc Will Deacon  2018-09-13  130  

:::::: The code at line 127 was first introduced by commit
:::::: 959bf2fd03b59fc107584c21425f3dc73c49f762 arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
