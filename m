Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83F2191F91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362163; cv=none; b=YifdbB/7fUMPkt7sxlUKw64syx0Dx8MJIyIHW7yMhu/+bnEqJZP+RfjmRJXACedhdhtlKOxEXHcbbpWKz3Cn05wHCdCWBp7/1zbxulFFxlYQwp1eJQyJrQc6SakDn/pLnM/UwI/8+nwOe3ViTEslNC5TpULOKzFM6/iiihY+C7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362163; c=relaxed/simple;
	bh=XyeK7JxU7IF1joLx/PdpNCwCHY52nR8rEwlYfBUn1qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf0Q/nr9iLDBbTNvm/AuhpQCMHE4Tjbt0kONgWz0x50D+NSSSgNE0MmPBFhkKqDDIM0snLfQ9cA38XoTA5lnWLT0+tcWpE57rrUUZ9Iid9VvJ0I0cWRmGYd8boYJSGKWhDBhmhAB3rb+ZBvUGepOElXd9+2gmcngZw3ARgPzp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMEEqLC5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMEEqLC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763362161; x=1794898161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XyeK7JxU7IF1joLx/PdpNCwCHY52nR8rEwlYfBUn1qc=;
  b=dMEEqLC5ccallmppLVqwQb6h/D6AmPWMhMicAyCNKy87UBQTteXjPBmO
   1VUsmzZxWLZPlwMqsBQ1R8zknSRLTuwGIDdwYnyj+0newZ9/fXJEXh4iP
   TRdEdIr11w81RxHvv+G4OCJFFH0Az+tveVZDPgq2u2/POlR7m25qXTbEL
   +23XNSQvuZA3QmJIWg9MCMvTyjLjlKhqyeXP3Ad7QZhsnhwJ7eTIHPQPf
   UvMjhlMro9zT27L7hqSc40lTRLaRxwv41rl6Yi3/pDOr3TGNsRPohjT90
   8t9Zt6OAChRl419++WTBsmUlB0TaAVt9/LWB4aqeOiwtpGkeCC2pRYD/Z
   w==;
X-CSE-ConnectionGUID: 7kiquMtmQI+ERRLqGAATbg==
X-CSE-MsgGUID: nDRykHUCRtCVwrqUlHgcGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82742131"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82742131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:49:21 -0800
X-CSE-ConnectionGUID: DzZf2kj1SXyNZfSiiMgp9g==
X-CSE-MsgGUID: NcmMj+CmTmibCuJEpcYgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189668865"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2025 22:49:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKt38-0000EP-1F;
	Mon, 17 Nov 2025 06:49:18 +0000
Date: Mon, 17 Nov 2025 14:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 7/7] bpf: implement "jmp" mode for trampoline
Message-ID: <202511170737.AE1wZEEq-lkp@intel.com>
References: <20251114092450.172024-8-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114092450.172024-8-dongml2@chinatelecom.cn>

Hi Menglong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/ftrace-introduce-FTRACE_OPS_FL_JMP/20251114-173922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251114092450.172024-8-dongml2%40chinatelecom.cn
patch subject: [PATCH RFC bpf-next 7/7] bpf: implement "jmp" mode for trampoline
config: arm-randconfig-r071-20251117 (https://download.01.org/0day-ci/archive/20251117/202511170737.AE1wZEEq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511170737.AE1wZEEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511170737.AE1wZEEq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update':
   kernel/bpf/trampoline.c:499:25: error: invalid use of undefined type 'struct ftrace_ops'
     499 |                 tr->fops->flags |= FTRACE_OPS_FL_JMP;
         |                         ^~
>> kernel/bpf/trampoline.c:499:36: error: 'FTRACE_OPS_FL_JMP' undeclared (first use in this function)
     499 |                 tr->fops->flags |= FTRACE_OPS_FL_JMP;
         |                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:499:36: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/trampoline.c:501:25: error: invalid use of undefined type 'struct ftrace_ops'
     501 |                 tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
         |                         ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - DRM_PIXPAPER [=m] && HAS_IOMEM [=y] && DRM [=m] && SPI [=y]


vim +/FTRACE_OPS_FL_JMP +499 kernel/bpf/trampoline.c

   469	
   470		size = arch_bpf_trampoline_size(&tr->func.model, tr->flags,
   471						tlinks, tr->func.addr);
   472		if (size < 0) {
   473			err = size;
   474			goto out;
   475		}
   476	
   477		if (size > PAGE_SIZE) {
   478			err = -E2BIG;
   479			goto out;
   480		}
   481	
   482		im = bpf_tramp_image_alloc(tr->key, size);
   483		if (IS_ERR(im)) {
   484			err = PTR_ERR(im);
   485			goto out;
   486		}
   487	
   488		err = arch_prepare_bpf_trampoline(im, im->image, im->image + size,
   489						  &tr->func.model, tr->flags, tlinks,
   490						  tr->func.addr);
   491		if (err < 0)
   492			goto out_free;
   493	
   494		err = arch_protect_bpf_trampoline(im->image, im->size);
   495		if (err)
   496			goto out_free;
   497	
   498		if (bpf_trampoline_need_jmp(tr->flags))
 > 499			tr->fops->flags |= FTRACE_OPS_FL_JMP;
   500		else
   501			tr->fops->flags &= ~FTRACE_OPS_FL_JMP;
   502	
   503		WARN_ON(tr->cur_image && total == 0);
   504		if (tr->cur_image)
   505			/* progs already running at this address */
   506			err = modify_fentry(tr, tr->cur_image->image, im->image, lock_direct_mutex);
   507		else
   508			/* first time registering */
   509			err = register_fentry(tr, im->image);
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
