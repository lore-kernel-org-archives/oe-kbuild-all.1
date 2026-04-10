Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB92351C09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810484; cv=none; b=YFKBV1ZwwT+XE3n7VSeaJ7WPD0NyzpktxdzzBixICb4GsBKMpyxM5RSN1T4CD/4V3KSwh/+3STvnA5aEbLdUyBEz9ET7qU/K/lcac7FK+Jua8mCE7Heu5budG3rdEy5DibB1UE4iBaKmpmbYIY3fUbRt5NSrI6FJvEyecsksYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810484; c=relaxed/simple;
	bh=cEw/6f/yDPa0zdm9Pc5TXyrjumW/Z5PJiIkGPSIDUnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NeFDZklt+UkkyvbrNsAI4k8FpPQ1wggZ58nOkTh7Omzztf7Kimia6/2dhaOAfgIeh1MN28CQBawEh4XTQRtkXKZeY33GB85NRo3btOYbJIZwK7ECtFwjz+59lbCxcUpdNjdhvGx171ch1AKVjRolbEg7+HgyrsLbWA5OEGwjQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2jTIxIr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2jTIxIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775810483; x=1807346483;
  h=date:from:to:cc:subject:message-id;
  bh=cEw/6f/yDPa0zdm9Pc5TXyrjumW/Z5PJiIkGPSIDUnw=;
  b=E2jTIxIrrnYVqtnC+xFhqsp0RjmV2V19A5B9PByxqanuTqsPy8QvsPlS
   Na4j09giK13bmISxdx9Gyv7ghmqHPaD3Ln8EGW3XQno7Q8A17tN4LkSjY
   LkbVqSI4i5/nPDu5r8pz2qfRBDJLVa6hhPpOGsuzf1OqnNvHEDv3VuATU
   BrECoIlehuXGDH6hPge1uFtaQ4VtjBUasMhdExOYrQBo2dzE0Pdi6YUeq
   k6ngUEaDK0ubXpw5LgzjUnzAEtAKLkeDey6O9chMStQNc0ZtSAJU4LZQr
   3Ol7tEvIzW8rQVgf3Cpl2Dt+QjH1VBb7cnH0LvpHqgcgSvaLrEWVtV/ai
   w==;
X-CSE-ConnectionGUID: wA88WgoCTsil2KnqFRdILQ==
X-CSE-MsgGUID: 0Rv7sbIERfCyFrklLUgRPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64362749"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="64362749"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:41:22 -0700
X-CSE-ConnectionGUID: a7wNvNx0SEu8PPfp84C4tA==
X-CSE-MsgGUID: N09K9WiYSkOYzLLPhE2pug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233422904"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2026 01:41:22 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB7QU-000000003Un-3nq3;
	Fri, 10 Apr 2026 08:41:18 +0000
Date: Fri, 10 Apr 2026 16:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock'
 was not declared. Should it be static?
Message-ID: <202604101654.04HYIWFe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 9fca73b21dda02bad2a97f8911768923f03ce302 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260410/202604101654.04HYIWFe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101654.04HYIWFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101654.04HYIWFe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer as NULL pointer

vim +/trace_rb_lock +38 arch/arm64/kvm/hyp/nvhe/trace.c

    35	
    36	static struct hyp_buffer_pages_backing hyp_buffer_pages_backing;
    37	DEFINE_PER_CPU(struct hyp_rb_per_cpu, trace_rb);
  > 38	DEFINE_HYP_SPINLOCK(trace_rb_lock);
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
