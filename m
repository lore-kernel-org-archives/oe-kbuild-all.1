Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D919A31
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728151646; cv=none; b=LpNu830gUSbmDT88EhV9YisuDTuRTDseNy3czBI+9KVpnEUkVKED+16pKyIPmSWuUV2aFZ0KmbF3LzgU0w3SH538h3L44kYuyNwaariIHt2seIF6CW2UizWpUJGuRv5SCNFe+T7EuwQPLrZ4P0UcS6rsoHjuDMBYD2lFKIp/aHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728151646; c=relaxed/simple;
	bh=ZfmirUqwg8nnBXu+z9zQQbTjLXO4hYjk2moWXG+F74Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gW444iMGEeIx1RCK0e9udQJZ+9x0BszOLItj/u4i1Ottb/flKGvemsh5nFWVp2AqWTY42ML2kmyk1RSbZem+fkbKKXwh2bk39ApoJIFTiZUAZG7cNoA/6gFEyFW+NFm4EhraFmLSD8mqemNMsqglL+lALuxnhbg6XgNTQWT4FGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbZslCk1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbZslCk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728151645; x=1759687645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZfmirUqwg8nnBXu+z9zQQbTjLXO4hYjk2moWXG+F74Q=;
  b=EbZslCk176XRwLv3rwO4L5UeJ6TrD2uAOXP3m7wprwVV+XzNF2tETQgs
   qzeWfIv2ziXStSV7/27uPnzW+JtT9fkbsJkc0JrpoQjlFzLHEo4h+7fWo
   y7F9rSMOFpG4EPkSYC+3EIJS72KJuJCen6F+7K0cXFl3fXPzPCS1ft/zs
   fJSqQhUQxXW9nCJIw4zmXTtBN0VaN7sQsk7SsENZ2MMEeyz9ng8BpjM8v
   6eQoCme8Th4Vk7khfseLowEnAkbHQHBVYaFr+jAlDdMl49kV+rAvDGx8Q
   QbzXVLliozVxuyWsxVXkzuyzFphS7iktNIogKVQKB0NkP0sM9O3O8SAP/
   g==;
X-CSE-ConnectionGUID: yly9JInnScusvM8oyPEIdQ==
X-CSE-MsgGUID: gauzGiZITPmsQ5SZ3nGDlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27484790"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27484790"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 11:07:24 -0700
X-CSE-ConnectionGUID: gWZhd8eES6OU6JvJSSequw==
X-CSE-MsgGUID: iZnbZ44wSnGcb9yGil7Vag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="98331658"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Oct 2024 11:07:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx9BY-0003FG-2f;
	Sat, 05 Oct 2024 18:07:20 +0000
Date: Sun, 6 Oct 2024 02:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-entry-v6.12-rc1 12/30]
 arch/arm/kernel/entry-common.S:448: Error: selected processor does not
 support `bx lr' in ARM mode
Message-ID: <202410060257.X4Gsy55o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-entry-v6.12-rc1
head:   073ac3744274d4bf1cf29f48147b13adadb2c6d3
commit: cfb9012b62a1eec08a60761f6a318940213ed3e8 [12/30] ARM: entry: move all tracing invocation to C
config: arm-collie_defconfig (https://download.01.org/0day-ci/archive/20241006/202410060257.X4Gsy55o-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060257.X4Gsy55o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060257.X4Gsy55o-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/entry-common.S: Assembler messages:
>> arch/arm/kernel/entry-common.S:448: Error: selected processor does not support `bx lr' in ARM mode


vim +448 arch/arm/kernel/entry-common.S

   423	
   424	/*
   425	 * This call wants:
   426	 * r0: syscall table
   427	 * r1: regs
   428	 * r2: syscall number
   429	 */
   430	SYM_TYPED_FUNC_START(invoke_syscall_trace_asm)
   431	#ifdef CONFIG_CPU_SPECTRE
   432		csdb
   433	#endif
   434		/* Save registers because we are being called from C */
   435		push	{r4 - r10, lr}
   436		mov	tbl, r0
   437		/* Make space to copy the two syscall stack arguments */
   438		sub	sp, sp, #S_OFF
   439		mov	scno, r2
   440		badr	lr, __invoke_syscall_trace_ret	@ return right here
   441		ldmia	r1, {r0 - r6}			@ reload r0-r6 from regs
   442		stmia	sp, {r4, r5}			@ copy stack arguments
   443		ldr	pc, [tbl, scno, lsl #2]		@ call sys_* routine
   444	__invoke_syscall_trace_ret:
   445		/* Drop the copied stack arguments */
   446		add	sp, sp, #S_OFF
   447		pop	{r4 - r10, lr}
 > 448		bx	lr
   449	SYM_FUNC_END(invoke_syscall_trace_asm)
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
