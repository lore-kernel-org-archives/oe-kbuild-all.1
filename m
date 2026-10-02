Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBFA46A5F1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932168; cv=none; b=O/qEFwrrUP9Udbi6eC/qAwBww6tVAQ2R+3C1RXhq6gIL4oHqadGys/mbOjYpbZkHZF7cfEdLdVMuiij5ASFlR/FhFe2VbEISuITRPuz6LKzLmm8H7cWlBti2Q88Eiq/9K1kaInasFZWInqZaR25Mv3476Dmb621nhCdPuP1PwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932168; c=relaxed/simple;
	bh=3+MJ+yqG9uWbo4brZgOaQkFOS6mZ+sMoc7NqC0o92QQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRswUK8Qoga12K6BSHTE3zdBmj4y+jjIypUCl6kCUsr145VE9m2m7Tw4VPqm1MKwpz5mc8o+GB4w94G+ihpsd69H2SUw/cD9cq0Co1TmWJIc9gJjvae8gVMrf3IgduOWz8EPZaLPyhpyF6sImNUg8IT8y+e5y5XocdDJS06PEzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+fqEwfP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+fqEwfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932166; x=1822468166;
  h=date:from:to:cc:subject:message-id;
  bh=3+MJ+yqG9uWbo4brZgOaQkFOS6mZ+sMoc7NqC0o92QQ=;
  b=O+fqEwfPZgdMAeBOJRH3VQX+j8oLcTy7B8D5lhkklQW9lkI6svgf5NGO
   npBKyoFPbnlU/Uhx5LHcdecmmgxo6zAoue/GY/t1VibSbYjyr3dwPB8vr
   r8nXFSRDmRGkcAr4amzC5fEixCU72dy4j5KEAhc2XPr7V3JeGwbTwrYQh
   VANbgKZMntEtIDrXEEu8KnfZD4fQTI30S8N3RrKFnohACJwy9zfMcr8Kh
   MKFMZxyf2+zS6RcviQYeE4/cxRKZYoPwjgnbl21JTV5fRKx5Vxj+WO2CI
   vjmkWzTEOa8YlO5vW6SVVOlachJ0OlRg/m7a/yaXBU+00sHl6/8idy9ET
   g==;
X-CSE-ConnectionGUID: JT7JcjEFQUCVr5JjnMClkg==
X-CSE-MsgGUID: 7vGTM+nqTZiO97mxjml3bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101860020"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101860020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:09:23 -0700
X-CSE-ConnectionGUID: zogt5/NOQEi4UMWdFFrEUA==
X-CSE-MsgGUID: pOi1C8KpQGShnoSGKPXnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284273019"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2026 02:09:21 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCZGY-000000000Tp-45hZ;
	Fri, 02 Oct 2026 09:09:18 +0000
Date: Fri, 02 Oct 2026 11:08:54 +0200
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Oracle)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v4 26/37] mm/vma.h:721:4: warning: format
 specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned
 long long')
Message-ID: <202610021118.9BQr7upg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v4
head:   2b62f73048b4ae3621680db6e895375832f9d458
commit: 10166ec28c930e60d2dd7d7e7dc4da6476fae643 [26/37] maple_tree: Convert data structures to u64
config: arm64-randconfig-r2308-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021118.9BQr7upg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021118.9BQr7upg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021118.9BQr7upg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
>> mm/vma.h:721:4: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
         |                         ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
   mm/vma.h:722:17: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                    ~~~
         |                                                                    %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                      ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
   mm/vma.h:722:33: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                        ~~~
         |                                                                        %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                                      ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
   mm/vma.h:727:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
         |                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
   mm/vma.h:728:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                  ~~~
         |                                                                  %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                        ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/vmscan.c:69:
   In file included from mm/internal.h:24:
   mm/vma.h:728:26: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                      ~~~
         |                                                                      %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
--
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
>> mm/vma.h:721:4: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
         |                         ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
   mm/vma.h:722:17: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                    ~~~
         |                                                                    %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                      ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
   mm/vma.h:722:33: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                        ~~~
         |                                                                        %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                                      ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
   mm/vma.h:727:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
         |                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
   mm/vma.h:728:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                  ~~~
         |                                                                  %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                        ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/oom_kill.c:50:
   In file included from mm/internal.h:24:
   mm/vma.h:728:26: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                      ~~~
         |                                                                      %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
--
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
>> mm/damon/../vma.h:721:4: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
         |                         ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
   mm/damon/../vma.h:722:17: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                    ~~~
         |                                                                    %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                      ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
   mm/damon/../vma.h:722:33: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     720 |                 pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
         |                                                                        ~~~
         |                                                                        %llx
     721 |                         vmi->mas.index, vma->vm_start, vma->vm_start,
     722 |                         vma->vm_end, vmi->mas.index, vmi->mas.last);
         |                                                      ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
   mm/damon/../vma.h:727:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                          ~~~
         |                          %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
         |                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
   mm/damon/../vma.h:728:10: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                  ~~~
         |                                                                  %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                        ^~~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   In file included from mm/damon/ops-common.c:15:
   In file included from mm/damon/../internal.h:24:
   mm/damon/../vma.h:728:26: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     726 |                 pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
         |                                                                      ~~~
         |                                                                      %llx
     727 |                        vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
     728 |                        vmi->mas.index, vmi->mas.last);
         |                                        ^~~~~~~~~~~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~


vim +721 mm/vma.h

49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  710  
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  711  /* Store a VMA with preallocated memory */
55e50223bf3e06 Suren Baghdasaryan 2025-02-13  712  static inline void vma_iter_store_overwrite(struct vma_iterator *vmi,
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  713  					    struct vm_area_struct *vma)
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  714  {
55e50223bf3e06 Suren Baghdasaryan 2025-02-13  715  	vma_assert_attached(vma);
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  716  
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  717  #if defined(CONFIG_DEBUG_VM_MAPLE_TREE)
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  718  	if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  719  			vmi->mas.index > vma->vm_start)) {
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  720  		pr_warn("%lx > %lx\n store vma %lx-%lx\n into slot %lx-%lx\n",
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29 @721  			vmi->mas.index, vma->vm_start, vma->vm_start,
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  722  			vma->vm_end, vmi->mas.index, vmi->mas.last);
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  723  	}
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  724  	if (MAS_WARN_ON(&vmi->mas, vmi->mas.status != ma_start &&
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  725  			vmi->mas.last <  vma->vm_start)) {
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  726  		pr_warn("%lx < %lx\nstore vma %lx-%lx\ninto slot %lx-%lx\n",
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  727  		       vmi->mas.last, vma->vm_start, vma->vm_start, vma->vm_end,
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  728  		       vmi->mas.index, vmi->mas.last);
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  729  	}
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  730  #endif
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  731  
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  732  	if (vmi->mas.status != ma_start &&
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  733  	    ((vmi->mas.index > vma->vm_start) || (vmi->mas.last < vma->vm_start)))
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  734  		vma_iter_invalidate(vmi);
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  735  
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  736  	__mas_set_range(&vmi->mas, vma->vm_start, vma->vm_end - 1);
49b1b8d6f68310 Lorenzo Stoakes    2024-07-29  737  	mas_store_prealloc(&vmi->mas, vma);
55e50223bf3e06 Suren Baghdasaryan 2025-02-13  738  }
55e50223bf3e06 Suren Baghdasaryan 2025-02-13  739  

:::::: The code at line 721 was first introduced by commit
:::::: 49b1b8d6f6831026cb105b0eafa18f13db612d86 mm: move internal core VMA manipulation functions to own file

:::::: TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
