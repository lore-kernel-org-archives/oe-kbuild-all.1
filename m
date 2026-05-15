Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1242FF147
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870186; cv=none; b=Q00fITRFtDlyVAuEYYk4Yjc8UJA0u4hQXxSShjqDzim4+2UCCUr2wzcVlG3DHraLZ7GcJlWFJRPAU109jeuEn4q8E7R7uGqOSk0CstkOAD9/qOuvSbodbL0p9RHke0aIa+lHZ72HViX299QIYcEJ+9id+K1vlk7iPHtsRKmEyas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870186; c=relaxed/simple;
	bh=9UEQ2WQ2uZ521CovQUldpI/EQ+IlNtNAGipPdydmmmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sbX9BDAdqZs/F6+iIcZaGYakX0+Nj+bMzWUiLEgVNRrYnhdLp76QfzAQIFzjN2sY9Fji2jab3R3S+6JOkqR/KOXFOWAqkawC2LNXakUkqHgqS5Vw0hTln/YPpuyextCPT2bOA+d5MtA+UVCHDc29IpIW1hnxq8LpzZuGHU/2puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGqybmHK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGqybmHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778870183; x=1810406183;
  h=date:from:to:cc:subject:message-id;
  bh=9UEQ2WQ2uZ521CovQUldpI/EQ+IlNtNAGipPdydmmmU=;
  b=DGqybmHKlb5cg+4vnArvQ4Jo5E8D6oHDqCzpx/jiFfBjFgbCkcezmqyF
   eD4cA4jWzYEhhVVqlLG5aSC7MxJV7x+CEe2u6bZ9eLpuxTOtiNFkYrdPK
   gavXfPtn0RJCvuHPhMXUe/g1/cvUzK1wyW51UlwLyQRFbBjAu3JNHXKIe
   8G2jQL88gBdLaCRpvksr4rtZp6VcxH1ul+r8bYGiV+0vkXcKL2+YaUfrp
   7zzDZofhOuePABO6J40Tfyme8oZleeyEwa3q5KOwTkXY1aKUrb6K6gMA7
   gghVcZOn+3TF3MRkTl+hwBIMjaup80cxwNfJkcaZJysFawkT0/O/JR1+T
   Q==;
X-CSE-ConnectionGUID: tpEbCb6vSl2km8fhGL4V2A==
X-CSE-MsgGUID: geqg0uA3QRuoKtvqsCAyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97403574"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="97403574"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:36:22 -0700
X-CSE-ConnectionGUID: 54+MKs4iR+eTGyY/tgDkoA==
X-CSE-MsgGUID: VZHx9M40TKeP4e88JDspOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="236120658"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2026 11:36:20 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNxOU-000000002YX-0wT7;
	Fri, 15 May 2026 18:36:18 +0000
Date: Sat, 16 May 2026 02:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:30:1: sparse: sparse: symbol
 '__pcpu_scope___cur_context' was not declared. Should it be static?
Message-ID: <202605160205.IbGWL9np-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   79c615dd0adaeeac00c371d31bbdf632f99e2e9b
commit: 7f533be77c8d49b94da2c5bcb9b7dcbe1e403f76 [2/2] ANDROID: KVM: arm64: iommu: Add context for guest teardown
config: arm64-randconfig-r112-20260515 (https://download.01.org/0day-ci/archive/20260516/202605160205.IbGWL9np-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160205.IbGWL9np-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160205.IbGWL9np-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:30:1: sparse: sparse: symbol '__pcpu_scope___cur_context' was not declared. Should it be static?

vim +/__pcpu_scope___cur_context +30 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    28	
    29	/* Hypervisor is non-preemptable, so cur_context can be per cpu. */
  > 30	DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, __cur_context);
    31	#define cur_context (*this_cpu_ptr(&__cur_context))
    32	static struct hyp_pool iommu_host_pool;
    33	static bool iommu_pools_ready;
    34	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
