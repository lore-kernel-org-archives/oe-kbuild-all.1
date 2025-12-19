Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC99D2E7185
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133189; cv=none; b=JQYOzW3X6fsMZEPKaj4YRteoxwKEey8ZpJB33SpEj0Oc/75B7m9X+2BimBP80WgTpntJl5sLd7FXRtwVxlNJUd10hpZNA6GHHijobqSXYuVPGzGFM7m1OrvmVmEyrNrptUnB8BeFvvc5pZvbLzFekhtwgTmAq93kK47bWmK3xB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133189; c=relaxed/simple;
	bh=lcgsu4lyvxboFP8WC0G17xmAFeYh9NsgHUEwby+xD+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPfrc9Ya7YYKA6k1R0OlHTzCi6iKNMNUSwBZ1qMGh+Me563kuH+ExDd7BYkeBoC8T6J9CW+vGKWfGRitJAB+FwuyT6KZcoOPVF4GmKp5ikgDTHEeHDxp95p4w6ROSkCOfHXvIn/44NJ9qSk2nZKOU2n1Nh10Fz4XubWuzj2AiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPtP3eIr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPtP3eIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766133187; x=1797669187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lcgsu4lyvxboFP8WC0G17xmAFeYh9NsgHUEwby+xD+Q=;
  b=dPtP3eIrVBRDO/qELN2gVZr15cy1RCGgGEMggwOmyp36CksUvboIYPfx
   ogIALZhRQAHiGjkCSFytNzoK9DRw6S0Fy8LIeHyCEuttH4EZj56fnPNKG
   gXGf5/ZEEQxeqinflDXNN9ZW9T4M35BcTrw0X2u6cgb6bfI0SYMEEPeC/
   NRO4O8tvRurNJ06JwRKSiuLKUQ3B18KsJQnjwxm0ocdBRVflpFQ+rnaxh
   oHdLRlzV4KWKCRElGg8MzjuwDMPJ6y3yAy+6PViWM0ZJLq2fgXszL74w9
   RZR/UzXqvusz6iUCzlh8Z+3AuqddIsltLIOZUi+WF6qgrjWTrN9qtXgHU
   w==;
X-CSE-ConnectionGUID: Dc74w6RYRSa8sKhsQU3BCA==
X-CSE-MsgGUID: io7sm0PmTVSqCJGiW+btjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="55670496"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="55670496"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 00:33:06 -0800
X-CSE-ConnectionGUID: EuF9/Xm9QY+KfrYCroEZMA==
X-CSE-MsgGUID: b+cc7NPAR5ChHumSHfKB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199286113"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2025 00:33:04 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWVv4-000000003Gx-1D3j;
	Fri, 19 Dec 2025 08:33:02 +0000
Date: Fri, 19 Dec 2025 16:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Maxwell Bland <mbland@motorola.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202512191616.mTJdtOrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 710618c760c0a3267221517d78f4cfb65ca7b882 arm64/cfi,bpf: Support kCFI + BPF on arm64
date:   5 months ago
config: arm64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251219/202512191616.mTJdtOrm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191616.mTJdtOrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191616.mTJdtOrm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/net/bpf_jit_comp.c:3071:32: sparse: sparse: arithmetics on pointers to functions
>> arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
>> arch/arm64/net/bpf_jit_comp.c:121:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] data @@
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     expected restricted __le32 [usertype]
   arch/arm64/net/bpf_jit_comp.c:121:38: sparse:     got unsigned int const [usertype] data
>> arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving pointer to integer cast
>> arch/arm64/net/bpf_jit_comp.c:3071:17: sparse: sparse: non size-preserving integer to pointer cast

vim +121 arch/arm64/net/bpf_jit_comp.c

   117	
   118	static inline void emit_u32_data(const u32 data, struct jit_ctx *ctx)
   119	{
   120		if (ctx->image != NULL && ctx->write)
 > 121			ctx->image[ctx->idx] = data;
   122	
   123		ctx->idx++;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
