Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390F238166
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772674; cv=none; b=DetQT/PGoySED1o2BZ912ffj+bISR8lGEXTiSixUj1IYHTuCMTStUwkD70JSpZix5aI0kfppjw5Qqs4sS198NqIXtyqbZ7RHKCPDtV/Yd5/uDtu9ZPSRnLJNT6ORw70aJS/ztmyl8EGuyHb2Kj82Q0kp17RZQl8V4B9hQCMnthA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772674; c=relaxed/simple;
	bh=lm1d0lKnxNV5Q2wbLaeVZWKf+E3d4QC1UHCDNZfiojE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PxzR7Anbno5+2mEz+S5+jdxDRMuEKcpDH+TCrOY2535mVNZT/hhsSNWxMjSwi1VndGwJvLKYjXHo688M2Vda8YqtB9/uWtejWA5KL568qUrJ4jhcOzh1ksWhw4c7QIiFtIP1R9OIIXk2eDldqeT4Xr0Vge8KLikr2+VxnzkCeMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iP8xSzot; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iP8xSzot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769772672; x=1801308672;
  h=date:from:to:cc:subject:message-id;
  bh=lm1d0lKnxNV5Q2wbLaeVZWKf+E3d4QC1UHCDNZfiojE=;
  b=iP8xSzotjv4UrVAWJE7Ni4EUkA4wVzY0S0Btb32133n8GLTTOdoHJhML
   9rAfV/xij3zWfKosPAT4+uSc9ycSZIezpqyDUH9OYFbFBrb0O4nPQhBdx
   8+ekc43daJ6Euc/f+xffTd3dHi4ZYeiuZlqHm/41/ma9O0hxK7gpjT00/
   4cMvPREhK/om2KqH1iQ6oDsUGX7v2qcha8sgdA5e+TuU1ziIZOb1GuniF
   pPedb9+HFywJaxCYFAoGtJna+3I0X5DD5ZI568chlH7cDz3Yff3jfr5Wu
   s5zfJ0TyCQSdixKI32axiE9Zltp1xkeMHHbFDCJ4RD3Vq5cClWWJkLTto
   g==;
X-CSE-ConnectionGUID: mkWwxsPfRFiw0LFpElihrg==
X-CSE-MsgGUID: UFLgOoO5RTOj4O33T1HR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74874475"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74874475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 03:31:12 -0800
X-CSE-ConnectionGUID: sK2qeelVSXCLUrGiVD6AZg==
X-CSE-MsgGUID: TNa0MzUpR9aJu8SloALXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213360924"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2026 03:31:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlmiR-00000000cvS-1KSo;
	Fri, 30 Jan 2026 11:31:07 +0000
Date: Fri, 30 Jan 2026 19:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/kvm/book3s_xive.c:357:41: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202601301921.IU6AfQtV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d310797262f0ddf129e76c2aad2b950adaf1fda
commit: 0305292f17bc1f4fc66a24a8dd1a5e047673c02d powerpc/io: Use generic raw accessors
date:   11 months ago
config: powerpc64-randconfig-r121-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301921.IU6AfQtV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301921.IU6AfQtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301921.IU6AfQtV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/kvm/book3s_xive.c:51:15: sparse: sparse: cast to restricted __be16
>> arch/powerpc/kvm/book3s_xive.c:357:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be64 [usertype] qw1 @@     got unsigned long long @@
   arch/powerpc/kvm/book3s_xive.c:357:41: sparse:     expected restricted __be64 [usertype] qw1
   arch/powerpc/kvm/book3s_xive.c:357:41: sparse:     got unsigned long long
>> arch/powerpc/kvm/book3s_xive.c:701:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] value @@     got restricted __be64 [usertype] w01 @@
   arch/powerpc/kvm/book3s_xive.c:701:57: sparse:     expected unsigned long long [usertype] value
   arch/powerpc/kvm/book3s_xive.c:701:57: sparse:     got restricted __be64 [usertype] w01
>> arch/powerpc/kvm/book3s_xive.c:702:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] xive_cam_word @@
   arch/powerpc/kvm/book3s_xive.c:702:32: sparse:     expected unsigned int [usertype] value
   arch/powerpc/kvm/book3s_xive.c:702:32: sparse:     got restricted __be32 [usertype] xive_cam_word
>> arch/powerpc/kvm/book3s_xive.c:774:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] w01 @@     got unsigned long long @@
   arch/powerpc/kvm/book3s_xive.c:774:49: sparse:     expected restricted __be64 [usertype] w01
   arch/powerpc/kvm/book3s_xive.c:774:49: sparse:     got unsigned long long

vim +357 arch/powerpc/kvm/book3s_xive.c

5af50993850a48 Benjamin Herrenschmidt 2017-04-05  335  
b22af904192707 Alexey Kardashevskiy   2022-05-09  336  static unsigned long xive_vm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server)
b22af904192707 Alexey Kardashevskiy   2022-05-09  337  {
b22af904192707 Alexey Kardashevskiy   2022-05-09  338  	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
b22af904192707 Alexey Kardashevskiy   2022-05-09  339  	u8 pending = xc->pending;
b22af904192707 Alexey Kardashevskiy   2022-05-09  340  	u32 hirq;
b22af904192707 Alexey Kardashevskiy   2022-05-09  341  
b22af904192707 Alexey Kardashevskiy   2022-05-09  342  	pr_devel("H_IPOLL(server=%ld)\n", server);
b22af904192707 Alexey Kardashevskiy   2022-05-09  343  
b22af904192707 Alexey Kardashevskiy   2022-05-09  344  	xc->stat_vm_h_ipoll++;
b22af904192707 Alexey Kardashevskiy   2022-05-09  345  
b22af904192707 Alexey Kardashevskiy   2022-05-09  346  	/* Grab the target VCPU if not the current one */
b22af904192707 Alexey Kardashevskiy   2022-05-09  347  	if (xc->server_num != server) {
b22af904192707 Alexey Kardashevskiy   2022-05-09  348  		vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
b22af904192707 Alexey Kardashevskiy   2022-05-09  349  		if (!vcpu)
b22af904192707 Alexey Kardashevskiy   2022-05-09  350  			return H_PARAMETER;
b22af904192707 Alexey Kardashevskiy   2022-05-09  351  		xc = vcpu->arch.xive_vcpu;
b22af904192707 Alexey Kardashevskiy   2022-05-09  352  
b22af904192707 Alexey Kardashevskiy   2022-05-09  353  		/* Scan all priorities */
b22af904192707 Alexey Kardashevskiy   2022-05-09  354  		pending = 0xff;
b22af904192707 Alexey Kardashevskiy   2022-05-09  355  	} else {
b22af904192707 Alexey Kardashevskiy   2022-05-09  356  		/* Grab pending interrupt if any */
b22af904192707 Alexey Kardashevskiy   2022-05-09 @357  		__be64 qw1 = __raw_readq(xive_tima + TM_QW1_OS);
b22af904192707 Alexey Kardashevskiy   2022-05-09  358  		u8 pipr = be64_to_cpu(qw1) & 0xff;
b22af904192707 Alexey Kardashevskiy   2022-05-09  359  
b22af904192707 Alexey Kardashevskiy   2022-05-09  360  		if (pipr < 8)
b22af904192707 Alexey Kardashevskiy   2022-05-09  361  			pending |= 1 << pipr;
b22af904192707 Alexey Kardashevskiy   2022-05-09  362  	}
b22af904192707 Alexey Kardashevskiy   2022-05-09  363  
b22af904192707 Alexey Kardashevskiy   2022-05-09  364  	hirq = xive_vm_scan_interrupts(xc, pending, scan_poll);
b22af904192707 Alexey Kardashevskiy   2022-05-09  365  
b22af904192707 Alexey Kardashevskiy   2022-05-09  366  	/* Return interrupt and old CPPR in GPR4 */
0e85b7df9cb0c6 Jordan Niethe          2023-09-14  367  	kvmppc_set_gpr(vcpu, 4, hirq | (xc->cppr << 24));
b22af904192707 Alexey Kardashevskiy   2022-05-09  368  
b22af904192707 Alexey Kardashevskiy   2022-05-09  369  	return H_SUCCESS;
b22af904192707 Alexey Kardashevskiy   2022-05-09  370  }
b22af904192707 Alexey Kardashevskiy   2022-05-09  371  

:::::: The code at line 357 was first introduced by commit
:::::: b22af9041927075b82bcaf4b6c7a354688198d47 KVM: PPC: Book3s: Remove real mode interrupt controller hcalls handlers

:::::: TO: Alexey Kardashevskiy <aik@ozlabs.ru>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
