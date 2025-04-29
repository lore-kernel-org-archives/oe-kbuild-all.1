Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12A1519AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 06:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907628; cv=none; b=BXMBHcGKwf7zSHaK4Z0z9Yvdnxut3Yy2dikS8STnIRDQ3ARy10k0IudlqvBleeNCeh7vDSuUAY5IjcDQ6zUZK0zWWx75XZkVC3G399CLhotrNOFrlbznWQFz0aMngnXN2UsWmugj9LAFxSYApSWMg2BijNXp07aGJhlN9t94aMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907628; c=relaxed/simple;
	bh=4o/0a9LN73RQIVJwRvjmfyBecr+7vkkuWrxno4Lw1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdX3khw5gyldbFANpNWd10nh6fpFxZ0EfKn6FonO1PyDDLnNIWwJAIiE7EMbvkA8iRHQVhRSXT92LKxUFv0GsgwJDNbVxHc/W/H2F5NogWrWTnOG7qwrJsUeh+n5pseyQfWBHmXW2R9sWYLqhZQGo5N6HXBQ8VcuglFOBH6u2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWDZv+f+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWDZv+f+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745907626; x=1777443626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4o/0a9LN73RQIVJwRvjmfyBecr+7vkkuWrxno4Lw1Sg=;
  b=QWDZv+f+KBf/MTPJGXbWR0F0rbItFqYfCnncuQPsK4IwTnniuMiAN0fr
   D7sqKcFSA//ZD2WUvdbP9EeM0YZSMpR3jerlC7QEUSpp5eNQ/fPy0PG7v
   lQf1IK/5IBvMonpJ4GdvHwylwkx5B4dzaAztSwnRGsRkYOxNzEdFDXqjq
   nUcCNFQRhOEiy9WPaPd0ayO89Lc+jPuXrI5DS/1Rh5brp8D90dzGVAv+L
   Hg85jGLYBYq+HXbZQjWx2jtIsrJ+K0Ph6/iXDEXiG7n8dlV00W4eFRpUf
   5+YZSbISdShZAqMlilV8VirPzBKDJ2eLDmHCiWYxotjwatYvnHGCvleBb
   Q==;
X-CSE-ConnectionGUID: McB1VDR9Q1qvZem77tutFg==
X-CSE-MsgGUID: YQ99E/3TQCG6ASajx7pRQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72893040"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72893040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:20:25 -0700
X-CSE-ConnectionGUID: lzvoIK3rTsW8KpX9tOqWNQ==
X-CSE-MsgGUID: Qpfrl2alT2iPCH5gCvXNPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134245221"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Apr 2025 23:20:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9eKL-0000W1-1Y;
	Tue, 29 Apr 2025 06:20:21 +0000
Date: Tue, 29 Apr 2025 14:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks 17/18]
 arch/arm64/kernel/entry.S:592: Error: unknown mnemonic
 `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,t,64,sync'
Message-ID: <202504291450.X1C7hwF6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks
head:   6f50dac461ca66220a13a927db438e4a75708444
commit: 9f8b2eeb16285187ca7653f6e4ad94fdb43c9096 [17/18] HACK: aarch64 dynamic stack
config: arm64-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291450.X1C7hwF6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291450.X1C7hwF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291450.X1C7hwF6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry.S: Assembler messages:
>> arch/arm64/kernel/entry.S:592: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,t,64,sync'
>> arch/arm64/kernel/entry.S:597: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,h,64,sync'
   arch/arm64/kernel/entry.S:910: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,t,64,sync'
   arch/arm64/kernel/entry.S:910: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,h,64,sync'
   arch/arm64/kernel/entry.S:911: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,t,64,sync'
   arch/arm64/kernel/entry.S:911: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,h,64,sync'
   arch/arm64/kernel/entry.S:912: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,t,64,sync'
   arch/arm64/kernel/entry.S:912: Error: unknown mnemonic `kernel_ventry_el1_sync' -- `kernel_ventry_el1_sync 1,h,64,sync'


vim +592 arch/arm64/kernel/entry.S

   582	
   583		.text
   584	
   585	/*
   586	 * Exception vectors.
   587	 */
   588		.pushsection ".entry.text", "ax"
   589	
   590		.align	11
   591	SYM_CODE_START(vectors)
 > 592		kernel_ventry_el1_sync	1, t, 64, sync		// Synchronous EL1t
   593		kernel_ventry	1, t, 64, irq		// IRQ EL1t
   594		kernel_ventry	1, t, 64, fiq		// FIQ EL1t
   595		kernel_ventry	1, t, 64, error		// Error EL1t
   596	
 > 597		kernel_ventry_el1_sync	1, h, 64, sync		// Synchronous EL1h
   598		kernel_ventry	1, h, 64, irq		// IRQ EL1h
   599		kernel_ventry	1, h, 64, fiq		// FIQ EL1h
   600		kernel_ventry	1, h, 64, error		// Error EL1h
   601	
   602		kernel_ventry	0, t, 64, sync		// Synchronous 64-bit EL0
   603		kernel_ventry	0, t, 64, irq		// IRQ 64-bit EL0
   604		kernel_ventry	0, t, 64, fiq		// FIQ 64-bit EL0
   605		kernel_ventry	0, t, 64, error		// Error 64-bit EL0
   606	
   607		kernel_ventry	0, t, 32, sync		// Synchronous 32-bit EL0
   608		kernel_ventry	0, t, 32, irq		// IRQ 32-bit EL0
   609		kernel_ventry	0, t, 32, fiq		// FIQ 32-bit EL0
   610		kernel_ventry	0, t, 32, error		// Error 32-bit EL0
   611	SYM_CODE_END(vectors)
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
