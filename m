Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F5BA42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947167; cv=none; b=YXocfp5muCai7D8Ox0Jgq+/t7g+BWh0Pari51U67hWMh8V7n0JAsx9iF4Vv1EE23RPAHFNoqcRedsilDDGoAjyV/hf+f7wqsLCxCMJrZtv/heGkR/tILs2+4D1csfd2m4a4PHxJ3Lm5E18XI4Uuo6cuHJXpU/G6n2KYtXL+PkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947167; c=relaxed/simple;
	bh=NuRq0ODXWCIDuyUDFNqAGvTuDp/q2SC0qEs7keqG7B4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WJ1jI1JwPDOHug0nClRHkI+ULUrbTwfWDRXltif9WKjJZT2YC/EZeWdx0rY/ecvoEglKty966QLv4iRcJIX1YmCMrgl/dSLRpgyM1Esik89aCqIGRHJgRv1iD9Dn+3/y7I1d3iKxnNUDBjM1d1KFazBhmPHGqrX5Kqe5mgjS1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOmrMx7K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOmrMx7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725947166; x=1757483166;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=NuRq0ODXWCIDuyUDFNqAGvTuDp/q2SC0qEs7keqG7B4=;
  b=UOmrMx7Klr992Eu6NCVxYnpq22Yl3MdKlA7J2HYF4DVcOHhY5urtQXM3
   nUKfeUXh6E4OPg1PRlBXkWBHJ3ACDJ1+VguyK2wDYqejmyu/Zx+xfmCoa
   siz8Sfr9X6M36l8JMIiw0p7rgmOK5fAPUQT8OlZrGp50mlupP974JN3Ea
   zewyxxy3OZ1mPc56133igJnObdyR9GjlQ7jvYRdx7jtqqSLq30I5XdqcP
   d1mos6sl98rBtG+RTLFrFGIFOvV6dlP+Q/GuMRbp57gNfPnapZpuFvZlz
   yxoRBUs2bIN3ZpZCupZjppck/3SLupn4scQsHsLAJOQSg93TwRIWtJ2D7
   A==;
X-CSE-ConnectionGUID: +aWvXt6tSwCnNLeSCs7VPg==
X-CSE-MsgGUID: mPg+ryNITLqGAUsirVgt4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28453588"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28453588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:46:05 -0700
X-CSE-ConnectionGUID: f00Ey9gqRfCHfys9LuYGng==
X-CSE-MsgGUID: W0f2nt+wQbuhe4QmCTfbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66537903"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:46:03 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
  Linux Memory Management List <linux-mm@kvack.org>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
In-Reply-To: <20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	(Andrew Morton's message of "Mon, 9 Sep 2024 20:45:55 -0700")
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
Date: Tue, 10 Sep 2024 13:42:30 +0800
Message-ID: <87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Andrew Morton <akpm@linux-foundation.org> writes:

> On Tue, 10 Sep 2024 09:33:48 +0800 kernel test robot <lkp@intel.com> wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   100cc857359b5d731407d1038f7e76cd0e871d94
>> commit: 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 14.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100913.RxkfrKU6-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    In file included from include/linux/ioport.h:15,
>>                     from kernel/resource.c:15:
>>    kernel/resource.c: In function 'gfr_start':
>> >> include/linux/mm.h:101:35: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function)
>>      101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
>>          |                                   ^~~~~~~~~~~~~~~~
>>    include/linux/minmax.h:93:38: note: in definition of macro '__cmp_once_unique'
>>       93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>>          |                                      ^
>
> Thanks. "resource, kunit: add test case for region_intersects" is the culprit.

Yes.  Although the definition in include/linux/mm.h introduced in

  commit ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory address space")

doesn't compile on m68k.  There are no users of PHYSMEM_END before patch
"resource, kunit: add test case for region_intersects".  This can be
fixed via the following patch.

---------------------------------8<--------------------------------------
From 00d176e0cd07e3df1ea37a5e56ca576c819b585a Mon Sep 17 00:00:00 2001
From: Huang Ying <ying.huang@intel.com>
Date: Tue, 10 Sep 2024 13:20:40 +0800
Subject: [PATCH] mm: fix PHYSMEM_END build error on m68k

0Day build system reported build error on m68k architecture for missing
the definition of MAX_PHYSMEM_BITS when defining PHYSMEM_END.  Fixed it
via making PHYSMEM_END definition depends on MAX_PHYSMEM_BITS definition
conditionally.

Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/
---
 include/linux/mm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 147073601716..62bb7e7e0a17 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -98,7 +98,11 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #endif
 
 #ifndef PHYSMEM_END
-# define PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
+# ifdef MAX_PHYSMEM_BITS
+#  define PHYSMEM_END		((1ULL << MAX_PHYSMEM_BITS) - 1)
+# else
+#  define PHYSMEM_END		(-1ULL)
+# endif
 #endif
 
 #include <asm/page.h>
-- 
2.39.2

