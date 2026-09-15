Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C0F4A2A69
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485781; cv=none; b=qYKpvAhA3zdS4vf6I06Bh9SJyO7tx1hPfSZTC2JMsWK88xqihpF0Ac/QgaOX5nzI1icnb9NfnuAVQz9IlqeCvZyQTCZWM1BNDuc2Va/eBgHze+fDCO8QzO4Y8QMTFnErSZHXqo7Z1KTw3xfVuygACAYwd4+VCh9I/4Nexbi+734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485781; c=relaxed/simple;
	bh=NgLjArT1FjtiDveqwNwhhi+bflGbDzShmZhDxAXRtaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ADQZyl4kPPvRyGTVDm5YKwvCwFILFtYPlmi7G04RSMFT0QmwdZug5FRNj53Q63j/i+vLVCBeivDE4nDjzxK7XIw7fle/3pq+hxzXEmdJXMcg2Y4fT2u6TCIz47Io6mBSdqH02xj+LU6xpy+l4VSX0dXYx7L56KItSrPQnsSPkVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtanEw9x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtanEw9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789485778; x=1821021778;
  h=date:from:to:cc:subject:message-id;
  bh=NgLjArT1FjtiDveqwNwhhi+bflGbDzShmZhDxAXRtaY=;
  b=WtanEw9xsiW7/U6tQYBBPv0D2ZZY5yGYoDMuNuUxcYxb466XMrbUoJwF
   ReUZtCt/PuNSH19y1VbybNLN425JMd+jGUny+TlnkCoJqfga2SZ/KdB91
   qTow7Lp7GRKKpB4iGgGcojp2CuxWXOJg8HN4BzT3geQ9itdWqZemagD7w
   JKHi5QlA02ZND+0QIsKM1hpzUBBMG+MutG5QCQFVqh5eN1Xs9gPBDFVXc
   VfecMskvU4gsp0DRKDjwZAFk32l1HvLlIQWzB5qyOCeVELllSilqj2/gy
   TQ+ZDx3ixn/RkGfdFhrJOZMiS7m2+l4P7Pb865Qkc01CCygOpybEPj8nZ
   Q==;
X-CSE-ConnectionGUID: mrc7l5SiQdaA50UMqQry9A==
X-CSE-MsgGUID: zHY1ix5bQE20i+i3cJnddQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100516847"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100516847"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:22:57 -0700
X-CSE-ConnectionGUID: eoR+mjbeR6CQXBnZqKab8Q==
X-CSE-MsgGUID: NaIcTJuiT7iDriXpbxF5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1262898"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 15 Sep 2026 08:22:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Uzl-000000004iP-3hYw;
	Tue, 15 Sep 2026 15:22:53 +0000
Date: Tue, 15 Sep 2026 23:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:24:1: sparse: sparse: symbol
 '__pcpu_scope___cur_context' was not declared. Should it be static?
Message-ID: <202609152301.SLiwfQFb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: 76e0641e684e84368e03c2176e5844feb95f3abf [1/1] ANDROID: KVM: arm64: iommu: Add context for guest teardown
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260915/202609152301.SLiwfQFb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152301.SLiwfQFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152301.SLiwfQFb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:24:1: sparse: sparse: symbol '__pcpu_scope___cur_context' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:81:22: sparse: sparse: symbol '__get_vcpu' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:209:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__pcpu_scope___cur_context +24 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    22	
    23	/* Hypervisor is non-preemptable, so cur_context can be per cpu. */
  > 24	DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, __cur_context);
    25	#define cur_context (*this_cpu_ptr(&__cur_context))
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
