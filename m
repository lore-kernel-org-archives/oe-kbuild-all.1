Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6F25B1CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 05:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588375; cv=none; b=Khp3maKgoLDS2uUxwICkPv7WinBEzoYCPp5GPnaiLLB/IzPxW2zwaua4nTQKrcXu33jep10Mn1p15WMdzBMp0HbByCQZyTsR6AyU+TaKgf7Fmz27vjtNozIXktRH0rB7Nqh+qdBuwoQM8x6oSUGJGwiwD8vlDFp6wGFYGAwsnj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588375; c=relaxed/simple;
	bh=QO+LPmXeaZr5Nd7hgD1Xot71U2yAsIPk9WodJkCWOuY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mRBGPa58ID6+xRyYHZiOp5iDvWOkxRykUSoWGX3mPpMA8ajuZKRj+E9KzFO+q//M/2uMhzuT+LstjpaybpR3+Z3Zb3CKigs4AAyx0wclbPq1Qzke7WKRAYCXJI1Ezq+eEwp+HNNmibZ3hye+wnS4I/lDvcKWKuoCwJncNEC8XGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lxavwwh2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lxavwwh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774588374; x=1806124374;
  h=date:from:to:cc:subject:message-id;
  bh=QO+LPmXeaZr5Nd7hgD1Xot71U2yAsIPk9WodJkCWOuY=;
  b=Lxavwwh2GvtkgPnvoxiYKQSoQ3KlFWvgOjIyY587uJUq9hZgmNnPoN2V
   l0gPwkw1Ln0zSN4So2TVYhwKvpO9S4k+AzLZ4iChzySO3ZnqKZ0pPCTE6
   x8bHpOWgOmC3pGuS7LnSzJ/vERO83CfEvOfdXw+mN1XvUypNPsoBcR176
   IRLRk93Ox62R4yyK3wqH9H7QpmNrnvPjCPrDs2l0acJ7Q5GuGOI6FVJ0p
   3OXlhnPv7RfDuYYzrlK+Qudev/dtkz0Tu/r5AXMyDAxZvfPovcoqr6i1c
   OWXCN26+Gz3AKF64rIN8ELvUPfExPEPDYMDbRCao20hFFMxkYet1t0Y25
   Q==;
X-CSE-ConnectionGUID: A8Jlxo4BTF6Pq1/jfGRCQQ==
X-CSE-MsgGUID: CyrPyV4TRYeHTfyrWtbtNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86279700"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86279700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 22:12:53 -0700
X-CSE-ConnectionGUID: CgaggoZETO2SsDnGThFx2g==
X-CSE-MsgGUID: Dta2SMwPQzG1seju0jtSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229994309"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 22:12:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5zV3-000000009oX-2w8C;
	Fri, 27 Mar 2026 05:12:49 +0000
Date: Fri, 27 Mar 2026 13:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 drivers/net/xen-netfront.c:678:17: warning: no previous prototype for
 function 'bounce_skb'
Message-ID: <202603271342.Tmcs2KUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roger,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: ed3cfc690675d852c3416aedb271e0e7d179bf49 [0/1] xen/netfront: force data bouncing when backend is untrusted
config: x86_64-randconfig-014-20260324 (https://download.01.org/0day-ci/archive/20260327/202603271342.Tmcs2KUQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271342.Tmcs2KUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271342.Tmcs2KUQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/net/xen-netfront.c:41:
   In file included from include/net/tcp.h:38:
   include/net/ip.h:448:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     448 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> drivers/net/xen-netfront.c:678:17: warning: no previous prototype for function 'bounce_skb' [-Wmissing-prototypes]
     678 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         |                 ^
   drivers/net/xen-netfront.c:678:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     678 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         | ^
         | static 
   3 warnings generated.


vim +/bounce_skb +678 drivers/net/xen-netfront.c

   677	
 > 678	struct sk_buff *bounce_skb(const struct sk_buff *skb)
   679	{
   680		unsigned int headerlen = skb_headroom(skb);
   681		/* Align size to allocate full pages and avoid contiguous data leaks */
   682		unsigned int size = ALIGN(skb_end_offset(skb) + skb->data_len,
   683					  XEN_PAGE_SIZE);
   684		struct sk_buff *n = alloc_skb(size, GFP_ATOMIC | __GFP_ZERO);
   685	
   686		if (!n)
   687			return NULL;
   688	
   689		if (!IS_ALIGNED((uintptr_t)n->head, XEN_PAGE_SIZE)) {
   690			WARN_ONCE(1, "misaligned skb allocated\n");
   691			kfree_skb(n);
   692			return NULL;
   693		}
   694	
   695		/* Set the data pointer */
   696		skb_reserve(n, headerlen);
   697		/* Set the tail pointer and length */
   698		skb_put(n, skb->len);
   699	
   700		BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
   701	
   702		skb_copy_header(n, skb);
   703		return n;
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
