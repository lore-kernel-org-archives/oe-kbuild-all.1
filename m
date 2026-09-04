Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A03B71D4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541250; cv=none; b=ZteVpsCJaJW8WcbYofwaftlUu27OSATWwi5DLpX2Uyl6V/2f+gReARCut/fiq3VBmbWqOGJN2ci/GQvOyJkVeM+cWc29VCCRVG9kB6xejrBRen0FyuFXDVfy718L+yGU7sFoIi9uKvBQfIhXRUBg8z8SyIVUJhXQLwFdaqlsEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541250; c=relaxed/simple;
	bh=4YhwCkjkWS++o1XBiYrNeB61cjcD1WW9nk2IZUVVGtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WSNbVcBv6Rdni6O+8W1MHbaNQ3BRJoWQqzssNzzwchuPtle2Tk12YuQlUTMWWdlyb4jekERaoMTzDMrP+edoJqsJ0fTO+oTVOIUwMWNvPZcLm/NTaXacMz6h/xJi1uZS15qj2K4uCP8Z6zndi0wFXDNGSamSn/SJ8xKvROZp8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7Ju7smC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7Ju7smC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788541249; x=1820077249;
  h=date:from:to:cc:subject:message-id;
  bh=4YhwCkjkWS++o1XBiYrNeB61cjcD1WW9nk2IZUVVGtk=;
  b=H7Ju7smCRFhpBAhFhbGq2bHUFsZZ1vqFDnKZhdnvQ/elmfSGYDp2gunO
   Bg6z/7z0byuCRi5g9haugVEvOlM45OhxRk+RmcZnl2CEIaIo15VEWqmcN
   O+gyVi+oU3fivzjePH/CL2MGylZypYSbNnTT5eo5W3qnT4lpLjhADhSD3
   VKPTzNnBzu3/CtmnaotI4dz7dPCmMX+iBY4TCUx2O7kzAzfh2RD+Sl63Y
   0FR8Yn4xbtd6avY4doCn6MfkAfXWuPpUAhSzIApChYnSCLtAuZ8rs4/I1
   9eNFSD8/TG8fYSYUFpi6yMWdEHs5Ucv5wNUl7iMo2kPQirWT76pLN9lJ+
   A==;
X-CSE-ConnectionGUID: 4Co0Os4uTR2NpjBALXlrXw==
X-CSE-MsgGUID: bqGRmAwzT0e9l50vegWiag==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99379668"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99379668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 10:00:48 -0700
X-CSE-ConnectionGUID: HhKZxGPGTE+EC6Hz0gpBhQ==
X-CSE-MsgGUID: JtuwNEIlQaalyMKBW0vXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="273610032"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Sep 2026 10:00:46 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2XHQ-000000009zy-0cl1;
	Fri, 04 Sep 2026 17:00:44 +0000
Date: Sat, 05 Sep 2026 01:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [linuxppc:merge-test 4/12]
 arch/powerpc/include/asm/entry-common.h:273:9: error: implicit declaration of
 function 'irq_soft_mask_set'; did you mean 'irq_soft_mask_return'?
Message-ID: <202609050027.YHSqD4Y8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux merge-test
head:   d6bf5e8fe0cb733d4c9eb332a5537b77956886a2
commit: 11d09e46b796ac14f24ab63de2c0185a307b2054 [4/12] powerpc/entry: Fix irq_soft_mask corruption on replayed interrupt exit
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260905/202609050027.YHSqD4Y8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050027.YHSqD4Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050027.YHSqD4Y8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irq-entry-common.h:14,
                    from arch/powerpc/include/asm/interrupt.h:70,
                    from arch/powerpc/kernel/irq.c:58:
   arch/powerpc/include/asm/entry-common.h: In function 'arch_interrupt_exit_prepare':
>> arch/powerpc/include/asm/entry-common.h:273:9: error: implicit declaration of function 'irq_soft_mask_set'; did you mean 'irq_soft_mask_return'? [-Wimplicit-function-declaration]
     273 |         irq_soft_mask_set(IRQS_ALL_DISABLED);
         |         ^~~~~~~~~~~~~~~~~
         |         irq_soft_mask_return


vim +273 arch/powerpc/include/asm/entry-common.h

   245	
   246	/*
   247	 * Care should be taken to note that arch_interrupt_exit_prepare and
   248	 * arch_interrupt_async_exit_prepare do not necessarily return immediately to
   249	 * regs context (e.g., if regs is usermode, we don't necessarily return to
   250	 * user mode). Other interrupts might be taken between here and return,
   251	 * context switch / preemption may occur in the exit path after this, or a
   252	 * signal may be delivered, etc.
   253	 *
   254	 * The real interrupt exit code is platform specific, e.g.,
   255	 * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
   256	 *
   257	 * However arch_interrupt_nmi_exit_prepare does return directly to regs, because
   258	 * NMIs do not do "exit work" or replay soft-masked interrupts.
   259	 */
   260	static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
   261	{
   262		if (user_mode(regs)) {
   263			BUG_ON(regs_is_unrecoverable(regs));
   264			BUG_ON(regs_irqs_disabled(regs));
   265			/*
   266			 * We don't need to restore AMR on the way back to userspace for KUAP.
   267			 * AMR can only have been unlocked if we interrupted the kernel.
   268			 */
   269			kuap_assert_locked();
   270		}
   271	
   272		/* irqentry_exit expects to be called with interrupts disabled */
 > 273		irq_soft_mask_set(IRQS_ALL_DISABLED);
   274	}
   275	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
