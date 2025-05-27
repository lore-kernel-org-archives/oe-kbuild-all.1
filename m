Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4020296E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748385104; cv=none; b=I2z2y5+QNxpmWWAsFra7Soy9h/g/ewjl4xhysw3kFagd9pKhArSwfbjiYFDuAXVu8LlTANfnw5TOmZrRW6Lw+GO8bOTsEnCqPeV4xAs5+WtsV3bALbC/xXLRvQHucSsb7mXnV4j1ezo37l4N/kE5GM4QiweVI3fjBbHt5YtVzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748385104; c=relaxed/simple;
	bh=irFPzPAuX1iHJR56jtk6s5nxLK2TUOPVY8pkl0ILMfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UeOIfnhcdwtuZDkIDgqdrhmwNjKJms8FMNdvkMwNUle5sebSJQ9/jAmc1nT742Q06QBe0ZdJQKGoUGC5bgh9fNkv8vh6WXqR+JCh/lJ82TYgqq7ktlhXfl1wtMnyF0eCRXGFATISTwYw5BxRQ2deoZZEWSbDmFT/4r8iSGoQSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtVh8EYI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtVh8EYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748385103; x=1779921103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=irFPzPAuX1iHJR56jtk6s5nxLK2TUOPVY8pkl0ILMfs=;
  b=CtVh8EYIiomo+QXZvumecWQ/7eqhzIOWPVK3sPuni5cpBc6yVZYhMyAB
   dfjTPFj6tGWDN8MYpzRuOqeoRDS5CGP2pC1WzCnsLsVOp09p7FPDFXdpx
   Q0tbTq/NDS5+OjfLFLtoxfy7zM4Xzs2TxG7OwUHc9Lcnqa9My2vb1VeHt
   PuHs9nL9uTiwpig8LzrY/P72huMhCtaIkL/e9FW2wSmUNvA4SNdV75MWn
   +ujZEdDTyS2N1dmxmNu6iVvo3sUaVaua60xIjA9jQBJ+B0TX7jTzDvfiU
   eHcewbTkgpx4TK2FZU/scZTdii/arZWTb5hdYEC/Ni0GcJ/F7eA7wevQw
   w==;
X-CSE-ConnectionGUID: s5KfChiVQcmTms4+SMABrg==
X-CSE-MsgGUID: IoftoE98TlSv6JcLEY5PEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49509703"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49509703"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:31:40 -0700
X-CSE-ConnectionGUID: UfA8mPqxQgyptsgbHVVPwA==
X-CSE-MsgGUID: 71NPbzo7SkWNQr39mwvBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142921270"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 May 2025 15:31:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2pc-000V3k-1Z;
	Tue, 27 May 2025 22:31:36 +0000
Date: Wed, 28 May 2025 06:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Kuohai <xukuohai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [bpf-next:master 13/15] arch/arm64/net/bpf_jit_comp.c:2547:6:
 warning: variable 'nregs' set but not used
Message-ID: <202505280643.h0qYcSCM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   5ffb537e416ee22dbfb3d552102e50da33fec7f6
commit: 9014cf56f13d8ce21329837c148f723490950e28 [13/15] bpf, arm64: Support up to 12 function arguments
config: arm64-randconfig-004-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280643.h0qYcSCM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280643.h0qYcSCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280643.h0qYcSCM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/net/bpf_jit_comp.c: In function 'arch_bpf_trampoline_size':
>> arch/arm64/net/bpf_jit_comp.c:2547:6: warning: variable 'nregs' set but not used [-Wunused-but-set-variable]
    2547 |  int nregs, ret;
         |      ^~~~~


vim +/nregs +2547 arch/arm64/net/bpf_jit_comp.c

96d1b7c081c0c96 Song Liu       2023-12-06  2537  
96d1b7c081c0c96 Song Liu       2023-12-06  2538  int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
96d1b7c081c0c96 Song Liu       2023-12-06  2539  			     struct bpf_tramp_links *tlinks, void *func_addr)
96d1b7c081c0c96 Song Liu       2023-12-06  2540  {
96d1b7c081c0c96 Song Liu       2023-12-06  2541  	struct jit_ctx ctx = {
96d1b7c081c0c96 Song Liu       2023-12-06  2542  		.image = NULL,
96d1b7c081c0c96 Song Liu       2023-12-06  2543  		.idx = 0,
96d1b7c081c0c96 Song Liu       2023-12-06  2544  	};
96d1b7c081c0c96 Song Liu       2023-12-06  2545  	struct bpf_tramp_image im;
9014cf56f13d8ce Xu Kuohai      2025-05-27  2546  	struct arg_aux  aaux;
96d1b7c081c0c96 Song Liu       2023-12-06 @2547  	int nregs, ret;
96d1b7c081c0c96 Song Liu       2023-12-06  2548  
96d1b7c081c0c96 Song Liu       2023-12-06  2549  	nregs = btf_func_model_nregs(m);
90564f1e3dd6605 Florent Revest 2023-05-11  2550  
9014cf56f13d8ce Xu Kuohai      2025-05-27  2551  	ret = calc_arg_aux(m, &aaux);
9014cf56f13d8ce Xu Kuohai      2025-05-27  2552  	if (ret < 0)
9014cf56f13d8ce Xu Kuohai      2025-05-27  2553  		return ret;
9014cf56f13d8ce Xu Kuohai      2025-05-27  2554  
9014cf56f13d8ce Xu Kuohai      2025-05-27  2555  	ret = prepare_trampoline(&ctx, &im, tlinks, func_addr, m, &aaux, flags);
efc9909fdce00a8 Xu Kuohai      2022-07-11  2556  	if (ret < 0)
efc9909fdce00a8 Xu Kuohai      2022-07-11  2557  		return ret;
efc9909fdce00a8 Xu Kuohai      2022-07-11  2558  
96d1b7c081c0c96 Song Liu       2023-12-06  2559  	return ret < 0 ? ret : ret * AARCH64_INSN_SIZE;
96d1b7c081c0c96 Song Liu       2023-12-06  2560  }
efc9909fdce00a8 Xu Kuohai      2022-07-11  2561  

:::::: The code at line 2547 was first introduced by commit
:::::: 96d1b7c081c0c96cbe8901045f4ff15a2e9974a2 bpf: Add arch_bpf_trampoline_size()

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
