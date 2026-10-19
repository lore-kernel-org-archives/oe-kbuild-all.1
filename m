Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76C383984
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 05:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386951; cv=none; b=HkgQrEQ4WiequG1gS32Q3i7wcq6Xv+GbhBQcbodRaD9cR5tE0fO1IQQyuw0PYJe20oarZeXj4iqcLUCICmxmJGm3orqxZY2TzRC2GktlnI188VG6fkFRy/jzFEHg7n98aR/R7i6mtVividzWKpOwc7pOqPt+zdas0+xUG4l8dlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386951; c=relaxed/simple;
	bh=muvEBiiNMmo6DHwW67/K+0djeM0XJ9PXoHWXKTnZ9Qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K6arKn30yQQtIso+lDx1IwDgMRrFvPeu0QLGR/BFGNoM0LwD0VCzFQG0FojDdF3q/9ct86r7TUZDgMgdmbcGYuQ3jU67vyZrIbERcJDrOgOOF25kX6ECLCfUmIKRPpz29rEVvXVOxDp+iYVocPjT5ajia52Qbi6UtnJ1+rggLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwnVaIkX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwnVaIkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792386948; x=1823922948;
  h=date:from:to:cc:subject:message-id;
  bh=muvEBiiNMmo6DHwW67/K+0djeM0XJ9PXoHWXKTnZ9Qw=;
  b=GwnVaIkXxVx3jHWgDKuyXfw7GEa1jt7XuoVNb4ooIiuAcb2dgQo9Prfr
   tb8AYXcYCfkajR4Ubqa8zrkVc99BK/iqNcudm9otU0j6dUNe54ROA4E2n
   vLsusvmf7+t9DfFSQHam0/owYpzUgUwdrY9I1cIQs6gz4ahOsRahLYpcG
   EwpazXW+tfeEd4rV/IAg0m084yksiMHn7YktbfbrQbADA1YUkC6v7mqYa
   XYhl8opOdmTCAObDe2SVSNpH6eqAJyxMVmBtbsm8N2/LYzAJLeBD9xe5E
   bFdng+pGDXV26I1IZ0RMv0jB2/aa+RMuAQXI6CJb4jOYvb355uOHr9w7A
   A==;
X-CSE-ConnectionGUID: 9vTpp2XhSFCqxnJxRdeyYA==
X-CSE-MsgGUID: 0DMyRyBeSv6WJGSl9qDoYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="966802"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="966802"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 22:15:47 -0700
X-CSE-ConnectionGUID: clMeK6J/QMWRaMm/PapDXQ==
X-CSE-MsgGUID: vM5tbKpTT0y8aplM8tajsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4194517"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 22:15:46 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIfip-000000005UZ-46Ck;
	Mon, 19 Oct 2026 05:15:43 +0000
Date: Mon, 19 Oct 2026 07:15:20 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 0/1]
 drivers/net/xen-netfront.c:680:17: warning: no previous prototype for
 function 'bounce_skb'
Message-ID: <202610190751.OBek9Voy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Roger,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 4923217af5742a796821272ee03f8d6de15c0cca [0/1] xen/netfront: force data bouncing when backend is untrusted
config: x86_64-randconfig-2102-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190751.OBek9Voy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190751.OBek9Voy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190751.OBek9Voy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/net/xen-netfront.c:680:17: warning: no previous prototype for function 'bounce_skb' [-Wmissing-prototypes]
     680 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         |                 ^
   drivers/net/xen-netfront.c:680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     680 | struct sk_buff *bounce_skb(const struct sk_buff *skb)
         | ^
         | static 
   drivers/net/xen-netfront.c:2618:16: warning: variable 'target' set but not used [-Wunused-but-set-variable]
    2618 |         unsigned long target;
         |                       ^
   3 warnings generated.


vim +/bounce_skb +680 drivers/net/xen-netfront.c

   679	
 > 680	struct sk_buff *bounce_skb(const struct sk_buff *skb)
   681	{
   682		unsigned int headerlen = skb_headroom(skb);
   683		/* Align size to allocate full pages and avoid contiguous data leaks */
   684		unsigned int size = ALIGN(skb_end_offset(skb) + skb->data_len,
   685					  XEN_PAGE_SIZE);
   686		struct sk_buff *n = alloc_skb(size, GFP_ATOMIC | __GFP_ZERO);
   687	
   688		if (!n)
   689			return NULL;
   690	
   691		if (!IS_ALIGNED((uintptr_t)n->head, XEN_PAGE_SIZE)) {
   692			WARN_ONCE(1, "misaligned skb allocated\n");
   693			kfree_skb(n);
   694			return NULL;
   695		}
   696	
   697		/* Set the data pointer */
   698		skb_reserve(n, headerlen);
   699		/* Set the tail pointer and length */
   700		skb_put(n, skb->len);
   701	
   702		BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
   703	
   704		skb_copy_header(n, skb);
   705		return n;
   706	}
   707	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
