Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE433F384
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816429; cv=none; b=hObrY5bzDEU52FwLKaswl+ljHOVZtwkh3RJGdTBrHZ0NUGIqu8jfMhr5W0vfzw2M7HbrZ+hNjGUemrixl/4Z1ebNtUIDKy1gHEfRif2NQa+zD3xQCoaivgH+kBg94mGgblLYFtaYTLegM18Lm4nS+FgMAXxRCY/t431mjmA8thQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816429; c=relaxed/simple;
	bh=TBqDXTDK8YdxGeKYTpEDha0B/+5XxyHzHaMD+3lGXWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dd84wi5MJ9Kv/tAvRPtLvjdWbZBvPIVSInzKfc3d2ftwKRpJR/3m2E27RP2r6fRu5OCIPqBW64T00z09/YRPQuLmQrKIGS/jy7UAsvcXIY5aQ356DYF68SQUX5cV1Muy75hd3bVKGDjmDxqqJGdofZxRkloEvwLMMTe8rVKmYzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWb2Kq9S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWb2Kq9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775816428; x=1807352428;
  h=date:from:to:cc:subject:message-id;
  bh=TBqDXTDK8YdxGeKYTpEDha0B/+5XxyHzHaMD+3lGXWY=;
  b=iWb2Kq9SP7fPIYTs00g3Bg2CjN4HCI/g1T8oy46c4W6adeJd/5tCtZDJ
   enOYSUSzRb62E+laVVJlwGQpYpGW90b6H+OKMkIzp09m413ZXJHG1EC+Z
   3JEyUX1WSjG5upyNUo/g+EaPybj3/Y5OMYD0mjsVf6z+zKCFZASq6jDD7
   5cXnfI/TfWlrQzQ7t1eDeJB9EC42u++rZSM38hOammgGgfKnr7U6kUQat
   AOYHyZSnMmtfxrrvuYn+QdS/XuKtKX6Q4Bw9Y3rcE1uVGtgFXSHtsxmBi
   y4NUDLvU5s7fPcaNs1zsYWJ8xKRgrNXFypVZpR5G7rJkX0V6CkDpoKzWz
   Q==;
X-CSE-ConnectionGUID: qTloL20xR2qhtYiiL7ZoQQ==
X-CSE-MsgGUID: Dk1w5f01Ro6a7rzEqmy5Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="88277029"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88277029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 03:20:28 -0700
X-CSE-ConnectionGUID: 2U4zbNa6S4mavFNznJsgtg==
X-CSE-MsgGUID: e9AQW1//TsKpHIJ1q5VUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252417873"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 03:20:26 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB8yO-000000003bV-1PUn;
	Fri, 10 Apr 2026 10:20:24 +0000
Date: Fri, 10 Apr 2026 18:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:33:10: sparse: sparse: symbol
 'num_dynamic_hcalls' was not declared. Should it be static?
Message-ID: <202604101819.0MWNNC6Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 15d5bab7e86b00ad06770719a7cf68cdea68d2fe [1/1] ANDROID: KVM: arm64: Add support for custom hypercall registration
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260410/202604101819.0MWNNC6Z-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101819.0MWNNC6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101819.0MWNNC6Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:33:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:34:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/num_dynamic_hcalls +33 arch/arm64/kvm/hyp/nvhe/modules.c

    32	
  > 33	atomic_t num_dynamic_hcalls = ATOMIC_INIT(0);
  > 34	DEFINE_HYP_SPINLOCK(dyn_hcall_lock);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
