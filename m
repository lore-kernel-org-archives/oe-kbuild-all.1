Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C5817
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 00:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732320891; cv=none; b=uspQqpfMVN+W2/24YtxaIf2lWkuooBKQH1zhb+i9eQ+S3OZig4KqPZCubAopcaj7vDY2ztkOSmakanGx/Q/OXaJp2SAG2M5J8GCGLC7Zpr4q/54h0k1nk5/3eUnoqRWoivlfm8omQ3qFgR65PWyAPqSAGKEmrAxrqCXX+Wbw8z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732320891; c=relaxed/simple;
	bh=TebJJQnzxHV7TmWbRbCCK+pPf+BIMrbtiHQ+JJztYos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsWe8ThubfRrdQ4roG/zO3asnPoPYbZJeqYrB2OrBaR+EMBsu9NclLgdO/Exbx2RzOSSchG9KDU+NQEHqt1jJbwUpJZHjbaZqpmUmew+DS9ZCi2fwQy34WXoNaCVJUR59f4ZApwnOmj0Dbz4kWmbgkfAvv1SMW7dhRKCCWx6MtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHivN9Iq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHivN9Iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732320889; x=1763856889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TebJJQnzxHV7TmWbRbCCK+pPf+BIMrbtiHQ+JJztYos=;
  b=nHivN9IqFR2l6NO7PJBins/U+6InbjMvyDjBSbVX+IzXntmFWFlJwgcD
   SWrI1V92JddND0Ez1OXhFkcK4p6cFaxKxGk1HwBSyInj3qpUFIjaRkviu
   +NZ2FroGvBpCfapo7qU+tgkcBSCCOAWIG2Auwl6jbr6DmpMbb0W/OgOLi
   nWNtm2Mq/YXshQQJha4ktSnumIkX1swBvPxroakkOwFjAfJL7IvJy5/FR
   CTTeH2YYVwgGOWfojtIpOqx7PZZXS5DT5Xhk1gyMXRGawx5beqW0IHK3b
   OrrW5xQftUYxbgSZ1+WoTEdUCpolz7UJF8/FOYuKzd+8NZrAcGs2jeWvB
   w==;
X-CSE-ConnectionGUID: Dxq6wX6wTRm8xZf9tslfzQ==
X-CSE-MsgGUID: dMUL3hVWQ6ml8uK68gZBOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20079414"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20079414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 16:14:44 -0800
X-CSE-ConnectionGUID: D2vSb2z3Q9mn4Tsx/v4m7g==
X-CSE-MsgGUID: kgK9z5GySvqjb2iSk5Q6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90853135"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2024 16:14:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEdnL-0004JD-0z;
	Sat, 23 Nov 2024 00:14:39 +0000
Date: Sat, 23 Nov 2024 08:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 3/16] arch/x86/kernel/relocate_kernel_64.S:258:
 undefined reference to `saved_context_gdt_desc'
Message-ID: <202411230801.ZOwxQapg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   4ce379fe2c9332e340e1969fdc89ce756f382ab7
commit: 397c3df4d62afe238c46874cb5e3fd099954aa4c [3/16] x86/kexec: Restore GDT on return from preserve_context kexec
config: x86_64-randconfig-r053-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230801.ZOwxQapg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230801.ZOwxQapg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230801.ZOwxQapg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtual_mapped':
>> arch/x86/kernel/relocate_kernel_64.S:258: undefined reference to `saved_context_gdt_desc'


vim +258 arch/x86/kernel/relocate_kernel_64.S

   244	
   245	SYM_CODE_START_LOCAL_NOALIGN(virtual_mapped)
   246		UNWIND_HINT_END_OF_STACK
   247		ANNOTATE_NOENDBR // RET target, above
   248		movq	RSP(%r8), %rsp
   249		movq	CR4(%r8), %rax
   250		movq	%rax, %cr4
   251		movq	CR3(%r8), %rax
   252		movq	CR0(%r8), %r8
   253		movq	%rax, %cr3
   254		movq	%r8, %cr0
   255	
   256		/* Saved in save_processor_state. */
   257		movq    $saved_context, %rax
 > 258		lgdt    saved_context_gdt_desc(%rax)
   259	
   260		movq	%rbp, %rax
   261	
   262		popf
   263		popq	%r15
   264		popq	%r14
   265		popq	%r13
   266		popq	%r12
   267		popq	%rbp
   268		popq	%rbx
   269		ANNOTATE_UNRET_SAFE
   270		ret
   271		int3
   272	SYM_CODE_END(virtual_mapped)
   273	
   274		/* Do the copies */
   275	SYM_CODE_START_LOCAL_NOALIGN(swap_pages)
   276		UNWIND_HINT_END_OF_STACK
   277		movq	%rdi, %rcx	/* Put the indirection_page in %rcx */
   278		xorl	%edi, %edi
   279		xorl	%esi, %esi
   280		jmp	.Lstart		/* Should start with an indirection record */
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
