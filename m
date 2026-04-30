Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747612EBBA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777578491; cv=none; b=aFMzs9c5NqEh0ZddEFLgqx4BcS45Qk7NEXkUQg84DQi4g2/bDNwov6bI4K3FTKLuc/82VPgclh8hD2hSLj9ALvkPtlr/4Lp0OImcYc0xaDElJWpuOAu/+uwzzORYmc4yYvkII1Qx5I3OK8adEcmOGZvRLUQX3U2WPKgJ3jeSF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777578491; c=relaxed/simple;
	bh=L4UmQ7s5iw13cD3Yk7UdJewwA+xd8XMLilCExTkqA08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dfy59RmjYTqsxOx1gEucUeHBw9LaH1Dvda5fy5G19C0XzYkkJ1BJGHhI+WersFKYoc9vtHT5N7cgRUIt4hAxULZKDZ/RsI8bEbcXjGvgBbPaw5QIqwfXqObfaPVSBJLLO3097/CwMwc4LKC1bbh6bXNiECtBKZZHxk7lqPH1WEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUKCioN8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUKCioN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777578490; x=1809114490;
  h=date:from:to:cc:subject:message-id;
  bh=L4UmQ7s5iw13cD3Yk7UdJewwA+xd8XMLilCExTkqA08=;
  b=DUKCioN8bapkP8jZ1IMBU4FRqi+e71OruNH6IJ7NUu/6eUJK4cFROsdb
   zWo62V29kmnJ6oeWkr6KuiwisoajHQkCzT6f/cCqY3A9d3/gmfDsL/+VV
   UrHd2EAjflVac4ewXPTdasuzisNVsxbF0ASSwYUP/IVqB7728lUjcDduq
   88DNDrJ59xAZWtIvpf/wbXnA/vgKKwuUCzzaTuOY2YpAsM/FYXYO3aoA5
   RMI+6EbkuRZj/XwinV4D0T7J7LYsSMhdHAITJ4Fru4mp8cqzeVo8P0cHq
   3i7LLAUFj/SFMIwsS1XCPuep12LlTKi02LC0IeVao32V6obIddvKJMMwG
   Q==;
X-CSE-ConnectionGUID: sKyFP0y+SrCMUljzMn3whQ==
X-CSE-MsgGUID: 1rIdDp5/RZePrRN/dPfB+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90007042"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="90007042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:48:09 -0700
X-CSE-ConnectionGUID: oOT7/fhOTiSssMXDSmUlTA==
X-CSE-MsgGUID: 7pRTpLlLRf6+fEfCD0M9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233805715"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 12:48:08 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIXMj-00000000CsY-1sbe;
	Thu, 30 Apr 2026 19:48:05 +0000
Date: Fri, 01 May 2026 03:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 7/14] kernel/bpf/arena.c:931:17: sparse:
 sparse: symbol 'bpf_arena_memcmp' was not declared. Should it be static?
Message-ID: <202605010334.wPCwfKa1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: 57b8503e842e4c2843af80176ba6fd68b478c5d0 [7/14] bpf_arena_memcmp
config: x86_64-randconfig-121-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010334.wPCwfKa1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010334.wPCwfKa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010334.wPCwfKa1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/arena.c:931:17: sparse: sparse: symbol 'bpf_arena_memcmp' was not declared. Should it be static?
>> kernel/bpf/arena.c:939:18: sparse: sparse: symbol 'bpf_arena_memcpy' was not declared. Should it be static?

vim +/bpf_arena_memcmp +931 kernel/bpf/arena.c

   930	
 > 931	__bpf_kfunc int bpf_arena_memcmp(const void *a__ign, const void *b__ign, u32 n)
   932	{
   933		unsigned long base = arena_kern_base();
   934	
   935		return memcmp((const void *)(base + (u32)(unsigned long)a__ign),
   936			      (const void *)(base + (u32)(unsigned long)b__ign), n);
   937	}
   938	
 > 939	__bpf_kfunc void *bpf_arena_memcpy(void *dst__ign, const void *src__ign, u32 n)
   940	{
   941		unsigned long base = arena_kern_base();
   942	
   943		memcpy((void *)(base + (u32)(unsigned long)dst__ign),
   944		       (const void *)(base + (u32)(unsigned long)src__ign), n);
   945		return dst__ign;
   946	}
   947	__bpf_kfunc_end_defs();
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
