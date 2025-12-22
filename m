Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94543128B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392577; cv=none; b=llIX7YiK7SaaYNwIktIzNj2tGvbKsmxo3bmkf+Fq57acd/0cV2fXVPhjQR1BOH1cmi0bVjKoiYn7++qnYU28Bp3Wznv2vrPCsr5ma3fR7RqZHdvR7QjACiL9nlXnFvvi7j2zSskByeLoVy4nOdvcvC0Ia7oNNiqSece5DPFwM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392577; c=relaxed/simple;
	bh=j9byBVY2EDqVfOMOjWtWGNJywwZRGA2Vtgk+K68DjYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/mtFTRczrN17jOeQEFlq0Np8dGptLLnQl9ULixH6c7e6GCHz7Q+c0DcYX7yKueQFA1L9q3NdZ2dO8lVm1fKdYX1+fVb0+9H7CaB9ux6UEpsql02IZz5PLztTYPIlK891yhsWolHPIbZcs+TzmP3yxgCsNctTR2Jhh/D+j3RDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWY39Xb1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWY39Xb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766392575; x=1797928575;
  h=date:from:to:cc:subject:message-id;
  bh=j9byBVY2EDqVfOMOjWtWGNJywwZRGA2Vtgk+K68DjYQ=;
  b=fWY39Xb1xSxClYwqRoo78UIKbG0lcA9FDI3IboDH+UgWoZm/rilgwwq2
   0ogmlxsIBVlJZ9F/UG8mkK1zr42GOypH1y4GoSxlI9qHKbXEEVmbtpEon
   90Lr5mXwYzX/dz/zRKM39HN7FApzRnre8MNFXvRThkgQxeoGffvWbsOYH
   HOpo7Kq5keUljGB8FWHcloQRHzK+koUGphQNRdG7nKHcF3d6lyzH77rQR
   aow2UU7j508Hhfo7mZCvUL0i2ORlB7e4NkgVl4Rc/7IfEHc0937aUKTW7
   4fWhOzTtZYDyCXOMIrPIHwxu8FtsTvQXx5SMzLzUPvErks9Rf+4gjqjeA
   g==;
X-CSE-ConnectionGUID: EBFhg9svRkuj1a8Ad3evrQ==
X-CSE-MsgGUID: YzJ2Jr9uQ86sqUlPwM0/Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68399587"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68399587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:36:15 -0800
X-CSE-ConnectionGUID: PchlpVEyQgak8ablwnrYVg==
X-CSE-MsgGUID: N1njX+EoRbyHm50s90y1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199384657"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 00:36:12 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXbOf-000000000HH-3fVX;
	Mon, 22 Dec 2025 08:36:06 +0000
Date: Mon, 22 Dec 2025 16:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/kvm/book3s_xive.c:357:41: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202512221607.BaZr4kZY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 0305292f17bc1f4fc66a24a8dd1a5e047673c02d powerpc/io: Use generic raw accessors
date:   10 months ago
config: powerpc64-randconfig-r134-20251218 (https://download.01.org/0day-ci/archive/20251222/202512221607.BaZr4kZY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221607.BaZr4kZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221607.BaZr4kZY-lkp@intel.com/

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
