Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7672DCC1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171743; cv=none; b=InTk4a0XITLWNNYC2ZpovKN6yJFkp1ymUKXP66AS9rnum0G0xpFO+bBo5srYTGHa6+3SXrC0plCk6cuSDEbLyvxlL3BhcP5pgf7lQLPGlzxFZmP2mCRSKnp06CkexY5P+N3HJDEiGtsr6uTs2ndDQ/9WIcnrJ6TLCvxYMbia3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171743; c=relaxed/simple;
	bh=4445hRdYWXoa4/3p9bp4BKba778UcTvSNwOqgsnLLlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxI8t09yK4otFirmOAIR36gV3e/0giGj3bIVyUnqyO2BlLbTHnkO0wHvumqFOFu6IjpOJrT/VFwG04gM5JnzXQBSstUG/zpXcs2FglJf/nOD5Ta042AOJK5s/b2OFVj/3WfCRsCRGjovGj7tC/dKE97KoqqaDjFLznk7r4K55JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArQm+NSz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArQm+NSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748171742; x=1779707742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4445hRdYWXoa4/3p9bp4BKba778UcTvSNwOqgsnLLlE=;
  b=ArQm+NSz+C8ilp2t9cIRMvKY+KaKoFg7R/JyWAybLNyGK4AknJ8tS0ra
   nZ8FAL6uB4GCoNS+wcrnuvSgiFt1HH0irX6GT67A3aXckxFrWq3NagIjn
   Ukt/d97PNob6LAzDKxsttWqRKbqCnB1RCDzy7mlw0hnoGudkVavCAQmpD
   QGF8cH+NIp6+LRb9HrpKQkrhHrPIzW/fYwg5LlWQV/B1FcNP5S5OO5X7q
   vCEn6+HocyRVOWiZ9a4Ti9ZGz8Bvk06AdQGdhE+XMBNnIJ4HsU0YzUF2W
   du0NkkSysZum9QO3J3ZIUZzeHb2/KIaK1K+y1XYbcl396fhh4ZRGmYYIo
   g==;
X-CSE-ConnectionGUID: 3zcIvYgNQq2Xbpnj2RxyKw==
X-CSE-MsgGUID: YgHRc4inQ+KodN8fbA9/pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="49415061"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="49415061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 04:15:41 -0700
X-CSE-ConnectionGUID: wTsAIxK6RlyToW4EFNrt7g==
X-CSE-MsgGUID: hBITPih3RWafswzmexStSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="146761183"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 May 2025 04:15:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ9KL-000Rmc-2J;
	Sun, 25 May 2025 11:15:37 +0000
Date: Sun, 25 May 2025 19:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream-backup 8/12] arch/x86/net/bpf_jit_comp.c:1407:
 undefined reference to `bpf_prog_report_arena_violation'
Message-ID: <202505251909.Qu13J8gN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream-backup
head:   1803b4a8c6147f6614b9c1e0ec54e479ae330072
commit: 8c6fef67a8aeaaff4fa6bfbe7b9d624baadd5c9b [8/12] bpf: Report arena faults to BPF stderr
config: x86_64-randconfig-077-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251909.Qu13J8gN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251909.Qu13J8gN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251909.Qu13J8gN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/net/bpf_jit_comp.o: in function `ex_handler_bpf':
>> arch/x86/net/bpf_jit_comp.c:1407: undefined reference to `bpf_prog_report_arena_violation'
   ld: kernel/bpf/core.o: in function `bpf_prog_report_may_goto_violation':
   kernel/bpf/core.c:3170: undefined reference to `bpf_prog_stream_error_limit'
   ld: kernel/bpf/core.c:3170: undefined reference to `bpf_stream_stage_init'
   ld: kernel/bpf/core.c:3170: undefined reference to `bpf_stream_stage_printk'
   ld: kernel/bpf/core.c:3170: undefined reference to `bpf_stream_stage_dump_stack'
   ld: kernel/bpf/core.c:3170: undefined reference to `bpf_stream_stage_commit'
   ld: kernel/bpf/core.c:3170: undefined reference to `bpf_stream_stage_free'
   ld: drivers/media/i2c/lt6911uxe.o: in function `lt6911uxe_status_update':
   drivers/media/i2c/lt6911uxe.c:227: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.c:236: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.c:238: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.c:248: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.c:250: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.o:drivers/media/i2c/lt6911uxe.c:263: more undefined references to `cci_read' follow
   ld: drivers/media/i2c/lt6911uxe.o: in function `lt6911uxe_status_update':
   drivers/media/i2c/lt6911uxe.c:292: undefined reference to `cci_write'
   ld: drivers/media/i2c/lt6911uxe.o: in function `lt6911uxe_enable_streams':
   drivers/media/i2c/lt6911uxe.c:357: undefined reference to `cci_write'
   ld: drivers/media/i2c/lt6911uxe.o: in function `lt6911uxe_disable_streams':
   drivers/media/i2c/lt6911uxe.c:378: undefined reference to `cci_write'
   ld: drivers/media/i2c/lt6911uxe.o: in function `lt6911uxe_identify_module':
   drivers/media/i2c/lt6911uxe.c:536: undefined reference to `cci_write'
   ld: drivers/media/i2c/lt6911uxe.c:537: undefined reference to `cci_read'
   ld: drivers/media/i2c/lt6911uxe.c:538: undefined reference to `cci_write'


vim +1407 arch/x86/net/bpf_jit_comp.c

  1388	
  1389	bool ex_handler_bpf(const struct exception_table_entry *x, struct pt_regs *regs)
  1390	{
  1391		u32 arena_reg = (x->fixup >> 8) & 0xff;
  1392		bool is_arena = !!arena_reg;
  1393		u32 reg = x->fixup >> 16;
  1394		int off = x->data >> 8;
  1395		unsigned long addr;
  1396	
  1397		/* Read here, if src_reg is dst_reg for load, we'll write 0 to it. */
  1398		if (is_arena)
  1399			addr = *(unsigned long *)((void *)regs + arena_reg);
  1400	
  1401		/* jump over faulting load and clear dest register */
  1402		if (reg != DONT_CLEAR)
  1403			*(unsigned long *)((void *)regs + reg) = 0;
  1404		regs->ip += x->fixup & 0xff;
  1405	
  1406		if (is_arena)
> 1407			bpf_prog_report_arena_violation(reg == DONT_CLEAR, addr + off);
  1408	
  1409		return true;
  1410	}
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
