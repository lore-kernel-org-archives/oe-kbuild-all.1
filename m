Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DC22EF5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099339; cv=none; b=h+00oZworXzNs/HntVzS/+1kqFi2P0sR+RQLOiWsntY/ia1wjHheBM9K2kxnbOXE0pYM/8eWrzqhOuuZsb4OIIq+Etoqz1Q0UinFE01RMQGsC5ibllbTQM6Jek8OFsmURLbmb/Skz5lyqOPu0dluhKLDsYzkQ5hlSfjJfod/eao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099339; c=relaxed/simple;
	bh=U0jYeUNL41sNYTfaMJOCjc2UAUxt7pvi0qdom4qstDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWPVZlJziC0E/yRAVPFU63iXNJSw8BGXmQXjOWL7rg9CTnwqC0NvTQzMx9/t6T7gDm3yG6phyc4UTxda7k2KA4OEalzirrgO04kGeo+8Rxn4RbNZgcITDdy7439dBhAMLWmwx3ZTo/KYY5r2mTsJEFoq7zP86xckLkHTDY9NNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFBMn/V/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFBMn/V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753099338; x=1784635338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0jYeUNL41sNYTfaMJOCjc2UAUxt7pvi0qdom4qstDc=;
  b=YFBMn/V/o5LvqV133daKQuX5PKXMP3o+GGRikP1TpfZycmVsrX0I/EbK
   M9vcGOHjVC0pHMpS1G+oDvXlZm3Ecb1B4yikZT2pWFu493b5tLklkGwcX
   i+ffj4nm9IYbmwEh6r1e4eHI/3929ri1Lbdzn5Qz9cN9vEOZRLOjwT54T
   qGkAdP9i6jmq//q50O1KbS3Bbl/ZtTK1grrK9wS2mxGLbf1skYbIjZmdb
   KASRG8/q5gO+EMsFyw8XIl/PjW9TfZ6LQQczzNeE21vbNOD1MkmnsCew4
   7uXwNjFzl3m13MHtxr7KJ+PSP+GqxIpWep8Ks3JkgDuB7SzQIiRFOwK3g
   g==;
X-CSE-ConnectionGUID: aAi1qTRnRWKwTVW9KNqJSA==
X-CSE-MsgGUID: muTYQn23SOqkej9m5tlyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="42932726"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="42932726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:02:17 -0700
X-CSE-ConnectionGUID: bkYwQnbtTAmT16jSmsKEcQ==
X-CSE-MsgGUID: Cmih0uxnQciRtGTrl0ztcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="163120586"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2025 05:02:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpDi-000GmN-0v;
	Mon, 21 Jul 2025 12:02:14 +0000
Date: Mon, 21 Jul 2025 20:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [palmer:wip-hwprobe 9/10]
 arch/riscv/kernel/traps_misaligned.c:605:2: error: unknown register name
 'v0' in 'asm'
Message-ID: <202507211922.MfnXVhgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git wip-hwprobe
head:   4327171a587ac2af9620f085edb06605ab091884
commit: 3db02a78faf494fd44a2a9a29d3b159704ab00d0 [9/10] RISC-V: Add the mising clobbers while probing vector misaligned access
config: riscv-randconfig-r063-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211922.MfnXVhgM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211922.MfnXVhgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211922.MfnXVhgM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c: In function 'check_vector_unaligned_access_emulated':
>> arch/riscv/kernel/traps_misaligned.c:605:2: error: unknown register name 'v0' in 'asm'
     605 |  __asm__ __volatile__ (
         |  ^~~~~~~


vim +605 arch/riscv/kernel/traps_misaligned.c

d1703dc7bc8ec7 Jesse Taube    2024-10-17  595  
d1703dc7bc8ec7 Jesse Taube    2024-10-17  596  #ifdef CONFIG_RISCV_VECTOR_MISALIGNED
d1703dc7bc8ec7 Jesse Taube    2024-10-17  597  void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused)
d1703dc7bc8ec7 Jesse Taube    2024-10-17  598  {
d1703dc7bc8ec7 Jesse Taube    2024-10-17  599  	long *mas_ptr = this_cpu_ptr(&vector_misaligned_access);
d1703dc7bc8ec7 Jesse Taube    2024-10-17  600  	unsigned long tmp_var;
d1703dc7bc8ec7 Jesse Taube    2024-10-17  601  
d1703dc7bc8ec7 Jesse Taube    2024-10-17  602  	*mas_ptr = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
d1703dc7bc8ec7 Jesse Taube    2024-10-17  603  
d1703dc7bc8ec7 Jesse Taube    2024-10-17  604  	kernel_vector_begin();
d1703dc7bc8ec7 Jesse Taube    2024-10-17 @605  	__asm__ __volatile__ (
d1703dc7bc8ec7 Jesse Taube    2024-10-17  606  		".balign 4\n\t"
d1703dc7bc8ec7 Jesse Taube    2024-10-17  607  		".option push\n\t"
d1703dc7bc8ec7 Jesse Taube    2024-10-17  608  		".option arch, +zve32x\n\t"
d1703dc7bc8ec7 Jesse Taube    2024-10-17  609  		"       vsetivli zero, 1, e16, m1, ta, ma\n\t"	// Vectors of 16b
d1703dc7bc8ec7 Jesse Taube    2024-10-17  610  		"       vle16.v v0, (%[ptr])\n\t"		// Load bytes
d1703dc7bc8ec7 Jesse Taube    2024-10-17  611  		".option pop\n\t"
3db02a78faf494 Palmer Dabbelt 2025-07-16  612  		: : [ptr] "r" ((u8 *)&tmp_var + 1) : CLOBBER_V0 );
d1703dc7bc8ec7 Jesse Taube    2024-10-17  613  	kernel_vector_end();
d1703dc7bc8ec7 Jesse Taube    2024-10-17  614  }
d1703dc7bc8ec7 Jesse Taube    2024-10-17  615  

:::::: The code at line 605 was first introduced by commit
:::::: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 RISC-V: Detect unaligned vector accesses supported

:::::: TO: Jesse Taube <jesse@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
