Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794582;
	b=2iEySV8rA3JCMUTB036AoPGX1cIOYAVQAL0G4hTmOBHLsnhP+4PGPffOtTS3b4HBPPqd
	 crr/h2wlUvC+3dNuxWceb5MRqMNyKWoFxV9AGTxpvD+HnPbFEhE0LRqWsN0+O7KE5ZRlo
	 HwoRRS1aM2f54QRBAi6pmWFcMzq7+0uwmvFvNlyVGqoSsLBGfilqs2xqA1yQd/C8F0puT
	 6RPQQlGD80Utbkc6iaA2GxG+njRTi3HQtkf0F41HNKp1A+5tzfLnjLmkEiXjxjMzWavhn
	 se7ST6Ni0x37rJQqWHoH3CLGxYF0wI6fx9M4XqxDaY0pq7z3Vp2dR6+PU05SZ8AIHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794582;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=20AMYw8phH8e5sd5RqaJQ4BnSjzgWR/dkEbAXzQOCNY=;
	b=Dh6tToUcUzhFEEy2vwSvgrzzW8EToAuNRKKYDnTxl+smStuYW4QapoJMJFvpSxz+tHHS
	 sHktWa07abahqd0jILPkWSq1UE7v19ZRy6T6HHzZs4pN4U5oVYLEcSGR0JS1QtDpr1YsD
	 XStsGPbxJhO01kfBalP+XZuV9qUjVM5dZOyI96htOJgobiIaJDr0+PEuMefJUj18+Gstp
	 OTtOUk4HVbf9hC8rE2sPbXwZtSAlzlW9WNmMiIddb1SKGjw7StTcyB+BJQBKYxup3vXEo
	 +YzJ0FEyjmrCAsuvYf/CU+VNXIJxc5tuOvqzq9BFxP3RlIGX0KVof0fo+W9HhF7tE8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iROMsjmN;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128E606A32F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 15:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4128E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iROMsjmN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795794582; x=1827330582;
  h=date:from:to:cc:subject:message-id;
  bh=W2g6yCLjQtdgrjNaLrQWL40j+CbY8Wg6/o6/kdhdlXQ=;
  b=iROMsjmNPvOfLO4bjfbwLLUYC91Dpx4lx47SPKD/1iuwOtrEWBir2Inj
   NE37nR6f7TMoKuh2Lnujy7YerXMvGw55KiE4d4vDYnA6l/EoVko/hHQ4L
   u3PAnV936hlM+Iv9AKXuRkewcSd68Poe74Z0H1UW8lp+h4qlboDus0beT
   x2angd2AWeEh4LN98kBvs1rAMNE3g0UsJkgxX2NmH+H912B/KtY6OcxVi
   yq9efk0UAhPxYMAj7/8toGUlOSu/gjn5+c8niaImaFA5fwk/RH43Rbc3G
   7JOz5cY++IFuIe4VBzWk5ngjfv/pH5lBEqeJbHnaBhKshlnphOWJHuMd2
   w==;
X-CSE-ConnectionGUID: L9P79p0ySuWpZpufc7LgvA==
X-CSE-MsgGUID: B6H2sTejQE6oWlnFK2OeXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4727862"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4727862"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:49:41 -0800
X-CSE-ConnectionGUID: fdITKMO6STq4HpoYfPO2JA==
X-CSE-MsgGUID: /3Sy4l+PSg2lJ2hq45yvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14186784"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 27 Nov 2026 07:49:40 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWyCf-000000000Dd-20Y1;
	Fri, 27 Nov 2026 15:49:37 +0000
Date: Fri, 27 Nov 2026 16:49:11 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 246/348] kernel/bpf/coro.c:342:18:
 sparse: sparse: symbol 'bpf_coro_xdp_dtor' was not declared. Should it be
 static?
Message-ID: <20261127164453.3LMkeolJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   1d98f92a7b37670e804415b13c1d5d039706d4ce
commit: 98b9344cc99d4ef7244d6626ed4a8c92ce5a78b5 [246/348] bpf: Let a program park a coroutine frame and call its continuation
config: riscv-randconfig-r2303-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127164453.3LMkeolJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127164453.3LMkeolJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127164453.3LMkeolJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/coro.c:342:18: sparse: sparse: symbol 'bpf_coro_xdp_dtor' was not declared. Should it be static?
>> kernel/bpf/coro.c:348:18: sparse: sparse: symbol 'bpf_coro_syscall_dtor' was not declared. Should it be static?

vim +/bpf_coro_xdp_dtor +342 kernel/bpf/coro.c

   340	
   341	/* The destructors of kptr fields that hold a parked frame */
 > 342	__bpf_kfunc void bpf_coro_xdp_dtor(void *coro)
   343	{
   344		bpf_coro_drop(coro, this_cpu_ptr(&bpf_coro_drops_xdp));
   345	}
   346	CFI_NOSEAL(bpf_coro_xdp_dtor);
   347	
 > 348	__bpf_kfunc void bpf_coro_syscall_dtor(void *coro)
   349	{
   350		bpf_coro_drop(coro, this_cpu_ptr(&bpf_coro_drops_syscall));
   351	}
   352	CFI_NOSEAL(bpf_coro_syscall_dtor);
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
