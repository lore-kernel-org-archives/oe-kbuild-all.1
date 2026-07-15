Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A5A3C3439
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784159325; cv=none; b=WHBYelNMF/1kIPGX0g1f/SARCarX5nVwtltlj3SKkKu3Ws7mSjnYBKUqbnhhbfttLVIk2h2spYK5NgpOKzuPOq0dLSas3OxqqD3BC8dCiM5EXMeQZvR3z2ozJtGMrdp4JxubQCYBtpJiK0ZH5LnrD+xDhSq1PqUhhJKjs9TO2zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784159325; c=relaxed/simple;
	bh=26LHq6F37j4O/fb3g8d3GIQ5WOPofM0KN8/zJROcE/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EtGo37683+pMg39WAnI++wZxM1pdhCQsDI8cWHP9kQpzUdr4P3jREnLmkzKr7YLbBs/9F5w5p2LSOtjJ+0fXqCkF6crWnUWnVzMe32qCtEyO23zbjhYWw0gcjWqd+8c+Ns3Cts94+Ohuisuh8aH1XU5gptKE+Ev1R4rpqFA4u6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m72boCyG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m72boCyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784159324; x=1815695324;
  h=date:from:to:cc:subject:message-id;
  bh=26LHq6F37j4O/fb3g8d3GIQ5WOPofM0KN8/zJROcE/I=;
  b=m72boCyG4+ja2WB0iHEZOsewItSKuZP3bCdJdA62Np3dPrTXhP4Y+sO1
   QIXrkyTUQbW26cE8JjA8DtepaqEOTXFuum7YPi5mcyY11OvgD4e6Dvf/n
   lydjGo+TNV03xgqsQ4u1Q29986QyElZ+LO5LveOH6J/FpOekwfcAMSq3X
   pnFLuupjN0v2aQX/XCfTkFx2FnU0DRJXzdVLThe79R0uKgMj394HTm+yf
   hz8/tBMd6dKRUxCpsu7GhQCD6E4vBGeo6if3jyu8hHFwTE4DknXIHB7Lv
   2ipG6XRPGgaDboW8q7RbMcVCUTqYhYQdk62jMxHxBUSXaPm0Bmrn0UUvi
   Q==;
X-CSE-ConnectionGUID: 1OlELA/vR5eb2fz/fefOZw==
X-CSE-MsgGUID: oY+rvqlbRGeVtZKBDlYZ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88716352"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88716352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 16:48:43 -0700
X-CSE-ConnectionGUID: HdgY56reQlyJWzjSleHXcw==
X-CSE-MsgGUID: +lHLc9YOR8qV+6672RKNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294552669"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 16:48:41 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk9LC-000000004Mf-3s4D;
	Wed, 15 Jul 2026 23:48:38 +0000
Date: Thu, 16 Jul 2026 01:48:09 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 5/9]
 ./arch/arm64/include/asm/kvm_nested.h:281:10: error: 'elr' undeclared
Message-ID: <202607160125.gE6Dyou5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   a26aa760586e73f8bb0a6cf67438ad0d89c486f5
commit: b2c35cdee47a019777aa9f9216b49a6392cc79e3 [5/9] KVM: arm64: Validate GCS exception lock when emulating ERET
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260716/202607160125.gE6Dyou5-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160125.gE6Dyou5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160125.gE6Dyou5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_emulate.h:21,
                    from ./arch/arm64/include/asm/kvm_mmu.h:99,
                    from arch/arm64/kernel/smp.c:46:
   ./arch/arm64/include/asm/kvm_nested.h: In function 'kvm_check_illegal_exlock_return':
>> ./arch/arm64/include/asm/kvm_nested.h:281:10: error: 'elr' undeclared (first use in this function)
     281 |         *elr = 0xbad9acc0debadbad;
         |          ^~~
   ./arch/arm64/include/asm/kvm_nested.h:281:10: note: each undeclared identifier is reported only once for each function it appears in


vim +/elr +281 ./arch/arm64/include/asm/kvm_nested.h

   274	
   275	#else
   276	static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
   277							   u64 spsr)
   278	{
   279		/* We really should never execute this... */
   280		WARN_ON_ONCE(1);
 > 281		*elr = 0xbad9acc0debadbad;
   282		return false;
   283	}
   284	#endif
   285	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
