Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344E2153CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605589; cv=none; b=GaPNyfKXzn9+eaEAb+Mxc/DdVaPfjRCNrGevdC22tqBg1pAui/n/VVwpiewlowqK6ip9zJ6+gZ+VGulY7x9qkPSEX7emx+1aT/emmwsJITJ1ZnSc9eBpUOQmLwP/9AqHWrsdmzUpNwgBMffBXasUottTxkDLScMbN1OKiFwekPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605589; c=relaxed/simple;
	bh=E4YyB5SYtkGnfZf8kMfyhjoMeLIkwYTzRqnG8fZQWYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfph0G/1l+o4tOpFIGvuDmiq3DORM3jMXWnDRxzg4h2tYcVqTtZXzo46L95iPUIZx3RxV7sNie4sxHHo5r5MqtVtPR5UH14fvR5SVL4aMDBeO/oIugAbP5KmProqQ0p34ekiVQO5qjBP3IHofNKJF/1lVgLUAcQPJuAkdRU2yHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv/4lnu3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv/4lnu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746605587; x=1778141587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4YyB5SYtkGnfZf8kMfyhjoMeLIkwYTzRqnG8fZQWYI=;
  b=mv/4lnu3lqiOn+D6vC4XxWeMqxbseo/FAkXxsfhmFUyhnGcUTM8JNpA+
   vIu5ISc/MxWMa+4oen4jOIR1zNYOHwigl+Et/F6WrM0BX0T7XHzQP1FZL
   OYREzJc+nVkT0DJUI6f3sa5aGrw/NBimqrgccwhmmqG0oR4GnqhZWjk2m
   KulESbmXh6mH1T/HJeB1YJHfyRnUZaEYyEtTCzGuAProI0yYy4hl2p2Rx
   cKcu6Mio9ZkODX7bPysnebeNo7pwawDITfO6E0MJgTXTtHIqXJaKufoGU
   2zmTVGLdOqHoXGFv6gX7UYHkffF7nsNYfZEQtLE/Z2FuH1/NlV1VRyGBz
   g==;
X-CSE-ConnectionGUID: WfdQtLwTTMGzFpPj6A3/Pg==
X-CSE-MsgGUID: CHzSq/D0ScGzaf8X9lad1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48330719"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48330719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:07 -0700
X-CSE-ConnectionGUID: mUmMRR8BSveKoT+jfVTRdA==
X-CSE-MsgGUID: asRs3a6XTUeYFEvW7Sq1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="139938739"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 01:13:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZtn-0007O5-2g;
	Wed, 07 May 2025 08:13:03 +0000
Date: Wed, 7 May 2025 16:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
Message-ID: <202505071627.1wV4VKqR-lkp@intel.com>
References: <20250430165655.605595-9-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430165655.605595-9-tabba@google.com>

Hi Fuad,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250501-005807
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250430165655.605595-9-tabba%40google.com
patch subject: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map guest_memfd() pages
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071627.1wV4VKqR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071627.1wV4VKqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071627.1wV4VKqR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:36:
   In file included from arch/powerpc/include/asm/dbell.h:17:
   In file included from arch/powerpc/include/asm/kvm_ppc.h:19:
>> include/linux/kvm_host.h:2530:6: error: call to undeclared function 'kvm_arch_gmem_supports_shared_mem'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2530 |         if (kvm_arch_gmem_supports_shared_mem(kvm))
         |             ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kvm_arch_gmem_supports_shared_mem +2530 include/linux/kvm_host.h

  2527	
  2528	static inline bool kvm_mem_from_gmem(struct kvm *kvm, gfn_t gfn)
  2529	{
> 2530		if (kvm_arch_gmem_supports_shared_mem(kvm))
  2531			return true;
  2532	
  2533		return kvm_mem_is_private(kvm, gfn);
  2534	}
  2535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
