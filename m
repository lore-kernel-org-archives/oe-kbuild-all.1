Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563AE3195EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984390; cv=none; b=UPQfpU3SRTl9J6wVW/dqNYqJKJLAuEKQOrMfhxvxdesfT/zVkhRMsuB0T7repN/xllJ6x+ufTRDN6SJ4og8tr+UqhLCPyRAvF9akNJYnXr/EVrqee6XwzHFf+ALjN68sbhPOORcw3XCDYQsrrFdl8CpCPadstcKHuZjXo+APGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984390; c=relaxed/simple;
	bh=ZxgwAdCoaPSYeVzZIkcIfyA9mpNZfqlvngkT+E0tbLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rPTcfH5XdOdP5AfgMphfrP4gc2927sMHeo6Zhhx5mHhafnLJ9tV6K49buRcYtMfL0T29wZmZ0BrfTne6tfpxtB5EKYOop7Ibdwv7jnzvTDfLuvg0XdrbeOOUlrJQoW+a/+Pkvy6RhhuXtxmm561vxywkow63l0pBjEMIINrCEtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4VupGO0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4VupGO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770984388; x=1802520388;
  h=date:from:to:cc:subject:message-id;
  bh=ZxgwAdCoaPSYeVzZIkcIfyA9mpNZfqlvngkT+E0tbLg=;
  b=i4VupGO0wUKaLdJ+NxYXymGklbA7S3ROz68AUT67xnJDIBxy/zio7exr
   h3zTbvofY3tS1CiBuck51M5sQojXBas2b1OnNBIj/7MryRVOyK5d9w3F2
   4FqXICgJ/+uEkqdc8ujY10ekJIXcfh/NInryGJWXztAGa/CuCvtTEfto4
   pBwaCQu/GD9m4uijGcjAElwZWAoOwuSYJt/zdsB1eDh8IpGdFcIu8W00B
   TIArz53AzrIs73Rdy9d3pAIDc+kmKQV7lwz7XmuPBKC1OWvA/EkjIqoRV
   kLNLvzeqz/QoCBx+q/FH+mLPDiA00czeoXpz6zTPX2dNSnPuzS1bwxDLz
   g==;
X-CSE-ConnectionGUID: Bx3ra/TURTy8YpgpYzpBBg==
X-CSE-MsgGUID: OSCEARB/R1GxDGFpvsWkrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71193573"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71193573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 04:06:28 -0800
X-CSE-ConnectionGUID: UsqmevT8S6Wr2o0EPoCMSw==
X-CSE-MsgGUID: q5e/WuykRMCQSC0+ieJbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211614499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 04:06:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqrwG-00000000vLu-22GH;
	Fri, 13 Feb 2026 12:06:24 +0000
Date: Fri, 13 Feb 2026 20:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/16] fs/binfmt_elf.c:52:10: fatal error:
 asm/traps.h: No such file or directory
Message-ID: <202602131938.HTJUU1Vp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: 2821e424a84cabe5f937347a2f1d6f6d69e995d3 [14/16] treewide: The rest of the owl
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131938.HTJUU1Vp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131938.HTJUU1Vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131938.HTJUU1Vp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/page.h:249,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from fs/binfmt_elf.c:13:
   arch/powerpc/include/asm/page_32.h:19:9: warning: 'PTE_SHIFT' redefined
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |         ^~~~~~~~~
   In file included from arch/powerpc/include/asm/page.h:24:
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~
>> fs/binfmt_elf.c:52:10: fatal error: asm/traps.h: No such file or directory
      52 | #include <asm/traps.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +52 fs/binfmt_elf.c

  > 13	#include <linux/module.h>
    14	#include <linux/kernel.h>
    15	#include <linux/fs.h>
    16	#include <linux/log2.h>
    17	#include <linux/mm.h>
    18	#include <linux/mman.h>
    19	#include <linux/errno.h>
    20	#include <linux/signal.h>
    21	#include <linux/binfmts.h>
    22	#include <linux/string.h>
    23	#include <linux/file.h>
    24	#include <linux/slab.h>
    25	#include <linux/personality.h>
    26	#include <linux/elfcore.h>
    27	#include <linux/init.h>
    28	#include <linux/highuid.h>
    29	#include <linux/compiler.h>
    30	#include <linux/highmem.h>
    31	#include <linux/hugetlb.h>
    32	#include <linux/pagemap.h>
    33	#include <linux/vmalloc.h>
    34	#include <linux/security.h>
    35	#include <linux/random.h>
    36	#include <linux/elf.h>
    37	#include <linux/elf-randomize.h>
    38	#include <linux/utsname.h>
    39	#include <linux/coredump.h>
    40	#include <linux/sched.h>
    41	#include <linux/sched/coredump.h>
    42	#include <linux/sched/task_stack.h>
    43	#include <linux/sched/cputime.h>
    44	#include <linux/sizes.h>
    45	#include <linux/types.h>
    46	#include <linux/cred.h>
    47	#include <linux/dax.h>
    48	#include <linux/uaccess.h>
    49	#include <linux/rseq.h>
    50	#include <asm/param.h>
    51	#include <asm/page.h>
  > 52	#include <asm/traps.h>
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
