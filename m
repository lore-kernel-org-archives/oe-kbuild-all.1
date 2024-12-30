Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4EBAD2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735576461; cv=none; b=V/81oPgGuuYitezc3w/nSLNPKoAVVKN5MDRX0QKf88yMuuHWVdJWFetAhDCUW/+1WnIcJk5myk9auGPaAbCBcoLdg/d0/pueGdCKXAfJqGCCdvoz9fj9yJpAbiIfTOqcOUXegs5okvYfHRvZBCtvx1Mi2ITuorBzdVoUxLdrUdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735576461; c=relaxed/simple;
	bh=0WD18hbsZXoYOzbeXVkDsw5PSRDweGEbHRvKh7PAQ08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kl3ULN4L936GCLf5GslG80GsAxN2RS/e/NZrZUnzj62YD3nuhxQOzLV1cM6+I/iYPdJhbdEAnmYiwi55OFKNG8oMlQqO2uRasGkDqpRzHOlutKA2P+xqUMhY36sdvSj9BnEQ2Id3htGuteztRlp9/nI7soqO5Va5z2IS9B50hXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc5K9PY+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc5K9PY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735576456; x=1767112456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WD18hbsZXoYOzbeXVkDsw5PSRDweGEbHRvKh7PAQ08=;
  b=Dc5K9PY+xu3RskLyl6IR9r+h/ehnaRsZ4DP5uvbEFJMfxImSb01czSTz
   BPllaZ9yG3o4/Y22pP9ORj9nZx6DBVlkHoyuBC+DWghnC02XQpuTLFv35
   /qaehvyFayf4WJJy7uv+unDiDH7q8pSDcpgijVKHlZop6GrIJ1ybFERe5
   NBYhfyAdQJMIHYaeeX5ya2UWrvDMO45AGByVjRQeB/Nj+NVy/vlPupKq6
   Q7vBsLIF0Ncxac+gyyzIRRuhjfwKj78AetJHvve847kWv5dzToHZSrh31
   j9qDOoHFt9mXJNGEabr3Dp4dfG2KSxefqLeH6OBAuejZigWZJKmkmXTif
   A==;
X-CSE-ConnectionGUID: UDKe+0/xSgiPu4LHhkfZ3g==
X-CSE-MsgGUID: eqU2+UdhSPavEEi9a8VKDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35887632"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35887632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:34:15 -0800
X-CSE-ConnectionGUID: XNW1XmUmSXGCN+XnER39GA==
X-CSE-MsgGUID: 5cfl2O8UR8u4TTFwLr/UXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="105815883"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2024 08:34:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSIiZ-0006CJ-2a;
	Mon, 30 Dec 2024 16:34:11 +0000
Date: Tue, 31 Dec 2024 00:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb 6/12] arch/x86/include/asm/invlpgb.h:23:9: error:
 inconsistent operand constraints in an 'asm'
Message-ID: <202412310027.xAIGhOiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/invlpgb
head:   6960238e894267da7a06ad453cebe17c2cf72f4a
commit: 635f87781dd8a283a8bdc5634cbac1ca9fadffc5 [6/12] x86/mm: use INVLPGB for kernel TLB flushes
config: i386-buildonly-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310027.xAIGhOiR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310027.xAIGhOiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310027.xAIGhOiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tlbflush.h:13,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from arch/x86/mm/tlb.c:4:
   In function '__invlpgb',
       inlined from 'invlpgb_flush_all' at arch/x86/include/asm/invlpgb.h:72:2,
       inlined from 'broadcast_kernel_range_flush' at arch/x86/mm/tlb.c:1064:3,
       inlined from 'flush_tlb_kernel_range' at arch/x86/mm/tlb.c:1089:3:
>> arch/x86/include/asm/invlpgb.h:23:9: error: inconsistent operand constraints in an 'asm'
      23 |         asm volatile("invlpgb" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~
>> arch/x86/include/asm/invlpgb.h:23:9: error: inconsistent operand constraints in an 'asm'
   In function '__invlpgb',
       inlined from 'invlpgb_flush_addr' at arch/x86/include/asm/invlpgb.h:78:2,
       inlined from 'broadcast_kernel_range_flush' at arch/x86/mm/tlb.c:1069:4,
       inlined from 'flush_tlb_kernel_range' at arch/x86/mm/tlb.c:1089:3:
>> arch/x86/include/asm/invlpgb.h:23:9: error: inconsistent operand constraints in an 'asm'
      23 |         asm volatile("invlpgb" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~


vim +/asm +23 arch/x86/include/asm/invlpgb.h

39c0b57c90b5e9 Rik van Riel 2024-12-22   6  
39c0b57c90b5e9 Rik van Riel 2024-12-22   7  /*
39c0b57c90b5e9 Rik van Riel 2024-12-22   8   * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
39c0b57c90b5e9 Rik van Riel 2024-12-22   9   *
39c0b57c90b5e9 Rik van Riel 2024-12-22  10   * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
39c0b57c90b5e9 Rik van Riel 2024-12-22  11   * be done in a parallel fashion.
39c0b57c90b5e9 Rik van Riel 2024-12-22  12   *
39c0b57c90b5e9 Rik van Riel 2024-12-22  13   * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
39c0b57c90b5e9 Rik van Riel 2024-12-22  14   * this CPU have completed.
39c0b57c90b5e9 Rik van Riel 2024-12-22  15   */
39c0b57c90b5e9 Rik van Riel 2024-12-22  16  static inline void __invlpgb(unsigned long asid, unsigned long pcid, unsigned long addr,
39c0b57c90b5e9 Rik van Riel 2024-12-22  17  			    int extra_count, bool pmd_stride, unsigned long flags)
39c0b57c90b5e9 Rik van Riel 2024-12-22  18  {
39c0b57c90b5e9 Rik van Riel 2024-12-22  19  	u64 rax = addr | flags;
39c0b57c90b5e9 Rik van Riel 2024-12-22  20  	u32 ecx = (pmd_stride << 31) | extra_count;
39c0b57c90b5e9 Rik van Riel 2024-12-22  21  	u32 edx = (pcid << 16) | asid;
39c0b57c90b5e9 Rik van Riel 2024-12-22  22  
39c0b57c90b5e9 Rik van Riel 2024-12-22 @23  	asm volatile("invlpgb" : : "a" (rax), "c" (ecx), "d" (edx));
39c0b57c90b5e9 Rik van Riel 2024-12-22  24  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  25  
39c0b57c90b5e9 Rik van Riel 2024-12-22  26  /*
39c0b57c90b5e9 Rik van Riel 2024-12-22  27   * INVLPGB can be targeted by virtual address, PCID, ASID, or any combination
39c0b57c90b5e9 Rik van Riel 2024-12-22  28   * of the three. For example:
39c0b57c90b5e9 Rik van Riel 2024-12-22  29   * - INVLPGB_VA | INVLPGB_INCLUDE_GLOBAL: invalidate all TLB entries at the address
39c0b57c90b5e9 Rik van Riel 2024-12-22  30   * - INVLPGB_PCID:              	  invalidate all TLB entries matching the PCID
39c0b57c90b5e9 Rik van Riel 2024-12-22  31   *
39c0b57c90b5e9 Rik van Riel 2024-12-22  32   * The first can be used to invalidate (kernel) mappings at a particular
39c0b57c90b5e9 Rik van Riel 2024-12-22  33   * address across all processes.
39c0b57c90b5e9 Rik van Riel 2024-12-22  34   *
39c0b57c90b5e9 Rik van Riel 2024-12-22  35   * The latter invalidates all TLB entries matching a PCID.
39c0b57c90b5e9 Rik van Riel 2024-12-22  36   */
39c0b57c90b5e9 Rik van Riel 2024-12-22  37  #define INVLPGB_VA			BIT(0)
39c0b57c90b5e9 Rik van Riel 2024-12-22  38  #define INVLPGB_PCID			BIT(1)
39c0b57c90b5e9 Rik van Riel 2024-12-22  39  #define INVLPGB_ASID			BIT(2)
39c0b57c90b5e9 Rik van Riel 2024-12-22  40  #define INVLPGB_INCLUDE_GLOBAL		BIT(3)
39c0b57c90b5e9 Rik van Riel 2024-12-22  41  #define INVLPGB_FINAL_ONLY		BIT(4)
39c0b57c90b5e9 Rik van Riel 2024-12-22  42  #define INVLPGB_INCLUDE_NESTED		BIT(5)
39c0b57c90b5e9 Rik van Riel 2024-12-22  43  
39c0b57c90b5e9 Rik van Riel 2024-12-22  44  /* Flush all mappings for a given pcid and addr, not including globals. */
39c0b57c90b5e9 Rik van Riel 2024-12-22  45  static inline void invlpgb_flush_user(unsigned long pcid,
39c0b57c90b5e9 Rik van Riel 2024-12-22  46  				      unsigned long addr)
39c0b57c90b5e9 Rik van Riel 2024-12-22  47  {
39c0b57c90b5e9 Rik van Riel 2024-12-22  48  	__invlpgb(0, pcid, addr, 0, 0, INVLPGB_PCID | INVLPGB_VA);
39c0b57c90b5e9 Rik van Riel 2024-12-22  49  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  50  
39c0b57c90b5e9 Rik van Riel 2024-12-22  51  static inline void invlpgb_flush_user_nr(unsigned long pcid, unsigned long addr,
39c0b57c90b5e9 Rik van Riel 2024-12-22  52  					 int nr, bool pmd_stride)
39c0b57c90b5e9 Rik van Riel 2024-12-22  53  {
39c0b57c90b5e9 Rik van Riel 2024-12-22  54  	__invlpgb(0, pcid, addr, nr - 1, pmd_stride, INVLPGB_PCID | INVLPGB_VA);
39c0b57c90b5e9 Rik van Riel 2024-12-22  55  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  56  
39c0b57c90b5e9 Rik van Riel 2024-12-22  57  /* Flush all mappings for a given ASID, not including globals. */
39c0b57c90b5e9 Rik van Riel 2024-12-22  58  static inline void invlpgb_flush_single_asid(unsigned long asid)
39c0b57c90b5e9 Rik van Riel 2024-12-22  59  {
39c0b57c90b5e9 Rik van Riel 2024-12-22  60  	__invlpgb(asid, 0, 0, 0, 0, INVLPGB_ASID);
39c0b57c90b5e9 Rik van Riel 2024-12-22  61  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  62  
39c0b57c90b5e9 Rik van Riel 2024-12-22  63  /* Flush all mappings for a given PCID, not including globals. */
39c0b57c90b5e9 Rik van Riel 2024-12-22  64  static inline void invlpgb_flush_single_pcid(unsigned long pcid)
39c0b57c90b5e9 Rik van Riel 2024-12-22  65  {
39c0b57c90b5e9 Rik van Riel 2024-12-22  66  	__invlpgb(0, pcid, 0, 0, 0, INVLPGB_PCID);
39c0b57c90b5e9 Rik van Riel 2024-12-22  67  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  68  
39c0b57c90b5e9 Rik van Riel 2024-12-22  69  /* Flush all mappings, including globals, for all PCIDs. */
39c0b57c90b5e9 Rik van Riel 2024-12-22  70  static inline void invlpgb_flush_all(void)
39c0b57c90b5e9 Rik van Riel 2024-12-22  71  {
39c0b57c90b5e9 Rik van Riel 2024-12-22 @72  	__invlpgb(0, 0, 0, 0, 0, INVLPGB_INCLUDE_GLOBAL);
39c0b57c90b5e9 Rik van Riel 2024-12-22  73  }
39c0b57c90b5e9 Rik van Riel 2024-12-22  74  

:::::: The code at line 23 was first introduced by commit
:::::: 39c0b57c90b5e9281dff6c35bd32d9695f328b17 x86/mm: add INVLPGB support code

:::::: TO: Rik van Riel <riel@surriel.com>
:::::: CC: Steven Barrett <steven@liquorix.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
