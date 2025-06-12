Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759352E1730
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772097; cv=none; b=dyKIxY9WCaGDyAPSRmaoMIlLuIMmBduXhmfsmPKzy7UQTdrwOZH5kQpJ/qzhiX7s+wO5p15W4/omloWj5XaGLHscgY4cHeTFS3zsY1zySe35vrEBa8seLHVTVEXPthjCxrnu6t+pRbQS71lM/vZv1rMBRGUtQL04L8Gf7TPssbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772097; c=relaxed/simple;
	bh=8oKJGv4hjpS6ZCJ9CHA3H6sqN8FEChd9AcBYAaKqy9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e42o6Mo2FKEt8k1IX39GLD7Aaq6ycFxvYsfeOWvezgtunPbc7qA3CUh0/LQRPr4eQ3RXa/ea6BpAiMfcuwPzxgJmHSg9yD102IgMrmZfSQX9KeF17vReJTXEYsjlB54YyIUxWESMwKUSar8pUiszXCBqyqy+mi6/FzxtAJqY3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElLDgJw5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElLDgJw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749772096; x=1781308096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oKJGv4hjpS6ZCJ9CHA3H6sqN8FEChd9AcBYAaKqy9I=;
  b=ElLDgJw5PZIBHreojh6hcGkYpv3qasG1P38EJ+bhh8Y7xXiQqSpHqzGV
   9LmOQrXQezt2GtXhzx7Nov8BphP2UkLpgSKXX3ivBczI3yGmVLA/7a1/d
   oft9p4Z2VfoHVeThedIgoV4vgj+bc0iWPQezs22Mk4yS0zrhlvmIuAobe
   4WjZuljmyCW3t9wI/QCAgi3UUHWOl4wRLkQKsAiMwlcGpKy+mVTfi7zul
   r9yi9RjQp9X0UnxBhT81277FodWuJIdhmkNbIbCc0y5qko130M/ZlRb5o
   3QuU563d7gkCWPyqXxtC4S1+kALKEhBGJHTS/ENlaT6KHFdRrQtpM+Ntu
   Q==;
X-CSE-ConnectionGUID: TargsfGLRX2ZbGjkvsBaxA==
X-CSE-MsgGUID: 4q2+27OWQaqsFNdZ1gc8uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51691299"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51691299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 16:48:14 -0700
X-CSE-ConnectionGUID: 2lmFZ+Z6S4ehW7SytiVKgQ==
X-CSE-MsgGUID: mAIneNWBT6GvGJMlG1yqbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="170848382"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jun 2025 16:48:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPreT-000C2S-2Y;
	Thu, 12 Jun 2025 23:48:09 +0000
Date: Fri, 13 Jun 2025 07:47:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:testme 8/9] arch/x86/include/asm/tlbflush.h:195:39:
 error: use of undeclared identifier 'MAX_PCID_AVAILABLE'
Message-ID: <202506130741.5pTOuM5K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git testme
head:   733c4f3de1b68afd5fad839dbcd1806a3d29e1e0
commit: 9ec29e88c100497cc0a00d1c2203ed08573f1d0d [8/9] raise-MAX_KERN_PCID
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250613/202506130741.5pTOuM5K-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130741.5pTOuM5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130741.5pTOuM5K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
>> arch/x86/include/asm/tlbflush.h:195:39: error: use of undeclared identifier 'MAX_PCID_AVAILABLE'
     195 |         DECLARE_BITMAP(user_pcid_flush_mask, MAX_PTI_KERN_PCID);
         |                                              ^
   arch/x86/include/asm/tlbflush.h:104:28: note: expanded from macro 'MAX_PTI_KERN_PCID'
     104 | #define MAX_PTI_KERN_PCID       (MAX_KERN_PCID)
         |                                  ^
   arch/x86/include/asm/tlbflush.h:81:25: note: expanded from macro 'MAX_KERN_PCID'
      81 | #define MAX_KERN_PCID           (MAX_PCID_AVAILABLE)
         |                                  ^
   1 error generated.


vim +/MAX_PCID_AVAILABLE +195 arch/x86/include/asm/tlbflush.h

4012e77a903d11 Andy Lutomirski    2018-08-29  129  
4c71a2b6fd7e42 Thomas Gleixner    2018-11-25  130  	/* Last user mm for optimizing IBPB */
4c71a2b6fd7e42 Thomas Gleixner    2018-11-25  131  	union {
4c71a2b6fd7e42 Thomas Gleixner    2018-11-25  132  		struct mm_struct	*last_user_mm;
371b09c6fdc436 Balbir Singh       2021-01-08  133  		unsigned long		last_user_mm_spec;
4c71a2b6fd7e42 Thomas Gleixner    2018-11-25  134  	};
4c71a2b6fd7e42 Thomas Gleixner    2018-11-25  135  
10af6235e0d327 Andy Lutomirski    2017-07-24  136  	u16 loaded_mm_asid;
10af6235e0d327 Andy Lutomirski    2017-07-24  137  	u16 next_asid;
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  138  
2ea907c4fe7b78 Dave Hansen        2017-12-04  139  	/*
2ea907c4fe7b78 Dave Hansen        2017-12-04  140  	 * If set we changed the page tables in such a way that we
2ea907c4fe7b78 Dave Hansen        2017-12-04  141  	 * needed an invalidation of all contexts (aka. PCIDs / ASIDs).
2ea907c4fe7b78 Dave Hansen        2017-12-04  142  	 * This tells us to go invalidate all the non-loaded ctxs[]
2ea907c4fe7b78 Dave Hansen        2017-12-04  143  	 * on the next context switch.
2ea907c4fe7b78 Dave Hansen        2017-12-04  144  	 *
2ea907c4fe7b78 Dave Hansen        2017-12-04  145  	 * The current ctx was kept up-to-date as it ran and does not
2ea907c4fe7b78 Dave Hansen        2017-12-04  146  	 * need to be invalidated.
2ea907c4fe7b78 Dave Hansen        2017-12-04  147  	 */
2ea907c4fe7b78 Dave Hansen        2017-12-04  148  	bool invalidate_other;
2ea907c4fe7b78 Dave Hansen        2017-12-04  149  
82721d8b25d76c Kirill A. Shutemov 2023-03-12  150  #ifdef CONFIG_ADDRESS_MASKING
82721d8b25d76c Kirill A. Shutemov 2023-03-12  151  	/*
82721d8b25d76c Kirill A. Shutemov 2023-03-12  152  	 * Active LAM mode.
82721d8b25d76c Kirill A. Shutemov 2023-03-12  153  	 *
82721d8b25d76c Kirill A. Shutemov 2023-03-12  154  	 * X86_CR3_LAM_U57/U48 shifted right by X86_CR3_LAM_U57_BIT or 0 if LAM
82721d8b25d76c Kirill A. Shutemov 2023-03-12  155  	 * disabled.
82721d8b25d76c Kirill A. Shutemov 2023-03-12  156  	 */
82721d8b25d76c Kirill A. Shutemov 2023-03-12  157  	u8 lam;
82721d8b25d76c Kirill A. Shutemov 2023-03-12  158  #endif
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  159  	/*
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  160  	 * Access to this CR4 shadow and to H/W CR4 is protected by
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  161  	 * disabling interrupts when modifying either one.
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  162  	 */
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  163  	unsigned long cr4;
b0579ade7cd823 Andy Lutomirski    2017-06-29  164  
b0579ade7cd823 Andy Lutomirski    2017-06-29  165  	/*
b5e3d11481fcb6 Dave Hansen        2025-06-11  166  	 * This is a list of normal contexts that might exist in the
b5e3d11481fcb6 Dave Hansen        2025-06-11  167  	 * TLB.
b0579ade7cd823 Andy Lutomirski    2017-06-29  168  	 *
b0579ade7cd823 Andy Lutomirski    2017-06-29  169  	 * For each context, ctx_id indicates which mm the TLB's user
b0579ade7cd823 Andy Lutomirski    2017-06-29  170  	 * entries came from.  As an invariant, the TLB will never
b0579ade7cd823 Andy Lutomirski    2017-06-29  171  	 * contain entries that are out-of-date as when that mm reached
b0579ade7cd823 Andy Lutomirski    2017-06-29  172  	 * the tlb_gen in the list.
b0579ade7cd823 Andy Lutomirski    2017-06-29  173  	 *
b0579ade7cd823 Andy Lutomirski    2017-06-29  174  	 * To be clear, this means that it's legal for the TLB code to
b0579ade7cd823 Andy Lutomirski    2017-06-29  175  	 * flush the TLB without updating tlb_gen.  This can happen
b0579ade7cd823 Andy Lutomirski    2017-06-29  176  	 * (for now, at least) due to paravirt remote flushes.
10af6235e0d327 Andy Lutomirski    2017-07-24  177  	 *
b5e3d11481fcb6 Dave Hansen        2025-06-11  178  	 * Note: ctxs[0] maps to hardware PCID==1. These contexts never
b5e3d11481fcb6 Dave Hansen        2025-06-11  179  	 * map to PCID==0. However, PCID=0 does remains used by various
b5e3d11481fcb6 Dave Hansen        2025-06-11  180  	 * bits of code. This is fine -- that code ends up harmlessly
b5e3d11481fcb6 Dave Hansen        2025-06-11  181  	 * using a PCID which will not interact with these contexts.
b0579ade7cd823 Andy Lutomirski    2017-06-29  182  	 */
10af6235e0d327 Andy Lutomirski    2017-07-24  183  	struct tlb_context ctxs[TLB_NR_DYN_ASIDS];
8794c1ffcf435a Dave Hansen        2025-06-11  184  
8794c1ffcf435a Dave Hansen        2025-06-11  185  	/*
8794c1ffcf435a Dave Hansen        2025-06-11  186  	 * One bit per kernel PCID. A set bit indicates that the
8794c1ffcf435a Dave Hansen        2025-06-11  187  	 * corresponding user PCID needs a flush next time it is
8794c1ffcf435a Dave Hansen        2025-06-11  188  	 * switched to; see SWITCH_TO_USER_CR3. Only used with
8794c1ffcf435a Dave Hansen        2025-06-11  189  	 * PTI.
8794c1ffcf435a Dave Hansen        2025-06-11  190  	 *
8794c1ffcf435a Dave Hansen        2025-06-11  191  	 * Note: PCID 0 is special and should only be used within
8794c1ffcf435a Dave Hansen        2025-06-11  192  	 * the kernel, thus bit 0 in this bitmask should never
8794c1ffcf435a Dave Hansen        2025-06-11  193  	 * be set.
8794c1ffcf435a Dave Hansen        2025-06-11  194  	 */
8794c1ffcf435a Dave Hansen        2025-06-11 @195  	DECLARE_BITMAP(user_pcid_flush_mask, MAX_PTI_KERN_PCID);
1e02ce4cccdcb9 Andy Lutomirski    2014-10-24  196  };
2f4305b19fe6a2 Nadav Amit         2021-02-20  197  DECLARE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate);
2f4305b19fe6a2 Nadav Amit         2021-02-20  198  

:::::: The code at line 195 was first introduced by commit
:::::: 8794c1ffcf435a3668124c7f3ff34f95c19f8105 x86/mm: Move PTI user PCID flush mask to end of tlb_state

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
