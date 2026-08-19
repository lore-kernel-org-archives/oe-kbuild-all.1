Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94523438B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135595; cv=none; b=WO95JZCDdSU5KOHBtpEF9gQv2z6yU7of+k7x+0IWVWGOe/iUzGIBRlopIH6+wRJMyxPNvkPwtG8ynohehQFMHRqUly/d3w2m+0FIvMq2vkeFEtps2YODVT6BHb1CeoOkZh7Z5lBDmZmTOIjSVJkxG5FBoiCgRvZjfrQnWhY50lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135595; c=relaxed/simple;
	bh=RF11uUTn2VtNqUT+7SXpyMUMsneA56fL5cSdsZ7EA9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=utHDsq60VsilpKY1R4CRM+3C+6i89N9VmZgnOKinOvrtzruUEVDKCeGbjDdMKM5cvdgqIDfYDAL+0KsCwc5pFIyTAL2tRVYwgC763K0mfqxAfX3u5mZRDUmy86kXYQYLIXodmbNKQEjpXAcwH0PjK+L0NM/Re8cHGPsbwre859U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFQLzryS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFQLzryS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787135593; x=1818671593;
  h=date:from:to:cc:subject:message-id;
  bh=RF11uUTn2VtNqUT+7SXpyMUMsneA56fL5cSdsZ7EA9o=;
  b=fFQLzrySiFvEtjDeKgO0GF7sftW9n7SqX0GGnTopOJ1FML1i+nK7gN4A
   ZXNHhfSE4e+J7kjPe5j1LeRDRYMWC4ref1KEJq+Bnft/9e6voKY5bEkQ6
   Q9o2U1zEClvPiWx2GkiW4DwNixtNF99C/fUoOqkELJ9H1z80q19I1AwlV
   aZcqctozi0lEIcer10MTIBzqGp6ZduXc6khNmPuR6upaprpk5d2akSG4H
   iWHTdzbMYTBYbAXHPXj3KssNQIhc0W1YLfSAj82ob0nO69iSzXVTOhGMH
   AWK28tAYJH6Y5sZ9tg4InKH6CxzffFEi9LYz8wwcV8UmbAatdOZDs/73I
   w==;
X-CSE-ConnectionGUID: XpUA5NiJQl+Biam7Y2mi5w==
X-CSE-MsgGUID: Z97vEIU6ThitnpK/l0EekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87562971"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87562971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 03:33:12 -0700
X-CSE-ConnectionGUID: h2n1UL4lQBmB5th0Uc5Hew==
X-CSE-MsgGUID: RfSnsjivSn+Ixc+FcewRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="267459442"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2026 03:33:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwdbX-00000000f3q-2JYX;
	Wed, 19 Aug 2026 10:33:07 +0000
Date: Wed, 19 Aug 2026 18:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Subject: [linux-next:master 14650/16300]
 arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202608191856.qdgSFpI0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5453bc3279e9f8578ac3e534d476240e40c879e1
commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650 [14650/16300] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
config: riscv-randconfig-r131-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191856.qdgSFpI0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191856.qdgSFpI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191856.qdgSFpI0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: cast removes address space '__rcu' of expression
>> arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:27:13: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:30:9: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:36:9: sparse:    void ( * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse: sparse: cast removes address space '__rcu' of expression
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse:    void ( [noderef] __rcu * )( ... )
   arch/riscv/kernel/kernel_mode_vector.c:111:41: sparse:    void ( * )( ... )

vim +/__rcu +27 arch/riscv/kernel/kernel_mode_vector.c

    24	
    25	void kvm_riscv_register_vctx_callback(void (*func)(void))
    26	{
  > 27		if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
    28			return;
    29	
    30		rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
    31	}
    32	EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
