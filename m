Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B981126C18
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737198362; cv=none; b=gWSeEVi4OQJ8gOny9vX5gEDRgRni9mNqhBFItu8BjRJQQbHjYsAcCsCIW73GxiChEkiBTm1JFLHNoEa9KT6YHJj6BzFxmZK2DmizLSYmp3wWAxFmM7EsL4iieiIl9xuf0WIqKAscf+9QKM9gO2s6BEFAJE65Lr/SPbIbMvHnmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737198362; c=relaxed/simple;
	bh=0vCI4cK2UcWSROVCntqE9mBKTh2ZXYPyqm3kKchCcLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHpcOEalJqEiLJqhoi+Y0MczTNH82jZBLFPWiGgFyzs2axSpjdb/QuEtMsUDmLM43FdXEHqVIqcuh4GqUQfS8XmcUYfdJYmVowKnnVYFQ+z4pRtVlouAZgsrs/C0q/eObE5X3qomu8Ztl6luwKMPoMGWHhAQPmcUKr/o5r8OHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXxAi+T1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXxAi+T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737198361; x=1768734361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vCI4cK2UcWSROVCntqE9mBKTh2ZXYPyqm3kKchCcLY=;
  b=SXxAi+T1ODHrvWiX0u5QXjeDzFL2kde6t1TLRH9zat+sX5nrDp44jvDw
   2Y1BjgYP1rrCDWhMhFYllvDdTq4HJteuJW0W5gG0rVjbtKtC1HLJr35++
   Yu7h/aF0Ud5b5ae2hjbArcvMM9DyQxobWz1nJuM5cjlZbplJQSV42kMV/
   4DH4Jpqs0urLO1hP5jFqQ7wh9P/U/8dxicPggdLyOGC9W1jJZll0IxaWZ
   Vfp4j2ut5ORXI0RXQFTuJMe1ePgvjvOcUQH1A9w3kePALleBl9QI/3cRw
   hdl6yy5Ya5phUlSMU+xviAYRQFUR4S+RPWcZ3DGENB+a6nu2WoiJP6Fbl
   w==;
X-CSE-ConnectionGUID: pQke0n6oTMCnoQhsBuTLMA==
X-CSE-MsgGUID: tYeMazyKSaaLQNK1rlfnkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37320941"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37320941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 03:06:00 -0800
X-CSE-ConnectionGUID: EMwiiEqKTi+GzhnN7oz8XA==
X-CSE-MsgGUID: U3Jt4dzrS5+XuclOtBE2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136943934"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 03:05:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ6eJ-000UKx-2M;
	Sat, 18 Jan 2025 11:05:55 +0000
Date: Sat, 18 Jan 2025 19:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Rowand <frowand.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: arch/mips/include/asm/page.h:189:24: sparse: sparse: cast truncates
 bits from constant value (a800000000000000 becomes 0)
Message-ID: <202501181915.7EJcsNDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
date:   11 months ago
config: mips-randconfig-r132-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181915.7EJcsNDo-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501181915.7EJcsNDo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181915.7EJcsNDo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/of/fdt.c: note: in included file (through include/linux/mm_types_task.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>> arch/mips/include/asm/page.h:189:24: sparse: sparse: cast truncates bits from constant value (a800000000000000 becomes 0)

vim +189 arch/mips/include/asm/page.h

c6e8b587718c48 include/asm-mips/page.h      Ralf Baechle    2005-02-10  167  
6f284a2ce7b8bc include/asm-mips/page.h      Franck Bui-Huu  2007-01-10  168  /*
6f284a2ce7b8bc include/asm-mips/page.h      Franck Bui-Huu  2007-01-10  169   * __pa()/__va() should be used only during mem init.
6f284a2ce7b8bc include/asm-mips/page.h      Franck Bui-Huu  2007-01-10  170   */
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  171  static inline unsigned long ___pa(unsigned long x)
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  172  {
a5ff1b34e16c20 arch/mips/include/asm/page.h Masahiro Yamada 2016-08-25  173  	if (IS_ENABLED(CONFIG_64BIT)) {
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  174  		/*
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  175  		 * For MIPS64 the virtual address may either be in one of
2f9060b1db4aa2 arch/mips/include/asm/page.h Bjorn Helgaas   2024-01-03  176  		 * the compatibility segments ckseg0 or ckseg1, or it may
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  177  		 * be in xkphys.
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  178  		 */
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  179  		return x < CKSEG0 ? XPHYSADDR(x) : CPHYSADDR(x);
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  180  	}
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  181  
a5ff1b34e16c20 arch/mips/include/asm/page.h Masahiro Yamada 2016-08-25  182  	if (!IS_ENABLED(CONFIG_EVA)) {
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  183  		/*
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  184  		 * We're using the standard MIPS32 legacy memory map, ie.
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  185  		 * the address x is going to be in kseg0 or kseg1. We can
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  186  		 * handle either case by masking out the desired bits using
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  187  		 * CPHYSADDR.
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  188  		 */
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02 @189  		return CPHYSADDR(x);
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  190  	}
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  191  
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  192  	/*
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  193  	 * EVA is in use so the memory map could be anything, making it not
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  194  	 * safe to just mask out bits.
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  195  	 */
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  196  	return x - PAGE_OFFSET + PHYS_OFFSET;
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  197  }
0d8d83d0447deb arch/mips/include/asm/page.h Paul Burton     2016-08-02  198  #define __pa(x)		___pa((unsigned long)(x))
6f284a2ce7b8bc include/asm-mips/page.h      Franck Bui-Huu  2007-01-10  199  #define __va(x)		((void *)((unsigned long)(x) + PAGE_OFFSET - PHYS_OFFSET))
49c426ba445f83 arch/mips/include/asm/page.h David Daney     2013-05-07  200  #include <asm/io.h>
5707bf6bcecd85 arch/mips/include/asm/page.h Ralf Baechle    2010-08-17  201  

:::::: The code at line 189 was first introduced by commit
:::::: 0d8d83d0447deb526c3125250eb391b5d76a3472 MIPS: Use CPHYSADDR to implement mips32 __pa

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
