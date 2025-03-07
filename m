Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EE2F32
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312543; cv=none; b=ZzzMLrYBVvRZ0Qb76/cFVWljBkV0hGDXLOTHjlc8cwh6PR61wHkPONz1HiVqcZHCUQwCcNbW0yR5OaHq/QGdvbc6wx3ngdEY421CL0eDTSSrYijXz23pg4oQh+H4E7SJkYd9mX8HsOWPbuC5WpnyUamzApqx/lM3MFZAuT3x6MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312543; c=relaxed/simple;
	bh=WFtlNwCp6F6dypP+jkyqN+ro2kON98q9i7vFLuLj63Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2TPSF6peMnos/eUy4uTuO4cuCayljAa5eMTgJLhXPe0XKPlOBQzGt1M3Qnkn4cn7b+2oaQR3KDSwUkoW9k7+8o9XnA+so69LM7JswSeEUdzZmj+HXRrwrYtNSMbQaVIPdmOHvfZ+smtNtqxrkIxxPhr90HfhdMYibKyccZqP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftFHrrK/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftFHrrK/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so41622366b.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Mar 2025 17:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741312540; x=1741917340; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfMo9BSVD+wSJIQf7ahUDMQqezCtFreygJl3Rk+iXCc=;
        b=ftFHrrK/AAFJB8luosZsBRrC6C2Ch/gUevCOE0KbNBk5ob9Z+e3TUYRIXxWKHhLkqa
         S2G8COXtGjS027tCeo0yd0fyJKPQCY444VdcOyn+jn8hmFK8u8jiR+giN8sHfcvhjaeF
         py/fUs1wGR4lDiFXdDcVJ+t4qXQSd/aXATvLnmkhRcjTF4Ty7vRGTj/+fZQEZxxP0VOe
         XPyPieacQgEYh3R53uBViwyck5iG6ScG9WNrPqL5pj4wNb5JifUNHhNo8oJI68KtZq5F
         SWretHR9MjI9spWo76r2huUtA3AgWupMcBvHmT5VbhqU7QXbMr/49zR5ti6Aka6li3o/
         BL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741312540; x=1741917340;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dfMo9BSVD+wSJIQf7ahUDMQqezCtFreygJl3Rk+iXCc=;
        b=n0AD9c56wgRQ87sFfbQjMpH9BlePlxXnZ8VmWzvnDWl/trPmZi3D7Em0pBvseML1oZ
         RVokFQ72gun3vilbokM5637Oq6s0V30h47VWrmbNZEsKV9nWBv7uZhaU027v4uzq8yyW
         qMNiVbauyxHVo6NnJhIoNaoxRjuFN4qBWRdnEQBTLoZb8s66v7ZBsRaOr08Df/Yvv1rl
         HhDug8zdfDCpos8zVQdomSglVsb7/g3MS77yOFFs6Ms3HqW3WqEjqkteZ2BYjgKD/119
         sXvRAZTvMWrj62WgCzw9CqyroIlutUm/DXCEElfPtJgvdCXbY69MFrdgxbd0rJxWcc9M
         GZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXakviWuiWRBt7qaGGmfYzqu6UqGHjW/GlJMjPl4zTR/avRoWz+l0JfHyVDi7CuAUfinzIlMFk1bR5TOI4v@lists.linux.dev
X-Gm-Message-State: AOJu0YwX/RJ4K9ZywFOuJVeiFEhJJDIXrJ7bZor3I/lWC81cz+FtYYM8
	yUmBozq27eR/yp5QBCyLhnR7CVTjl2+tX0cGMgPp93t2bDiiFv+v
X-Gm-Gg: ASbGncvoatpbth/Ny9MIFbiPbHpmB8SHY7QfrcF1HUhuN7ik/fdC+Tjwnp9NGLOvd70
	X9ffKA4xC6OHTJ+FQfQsr1kn2aWFj50vGdie3rlve2JyEW1o6aT7j0XB8KPvPGhh3nru7b/cRNy
	jFh5IYQFnNAj1b/kHuneOABZNaQs/gKNaGM5e37ebtJ/qr7tqrR54ny/1/9/vzSvtOCQkwgZElc
	y4TyMUAn0cMVEV/UWg4IWegbGi+XV0/YXrTTBA+cSv74aPaPMVmCj9c5tF83NQuKO1NsIJh5VFx
	WhfNGxBXEVQbHwqGNyxtdFWN74mgT2q4/zUeG1VKQw0l
X-Google-Smtp-Source: AGHT+IG6Qf8izM34HbnM9PviHh6ntJthb32BZxheV4Ot2SGT+WNbAG/93pztik+oWtMYRmbAS8B+kg==
X-Received: by 2002:a17:906:f58b:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-ac252ae319dmr141714766b.29.1741312539669;
        Thu, 06 Mar 2025 17:55:39 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25d376342sm2392566b.106.2025.03.06.17.55.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 17:55:39 -0800 (PST)
Date: Fri, 7 Mar 2025 01:55:38 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	michel@lespinasse.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/7] lib/rbtree: add random seed
Message-ID: <20250307015538.yu6f7hgt3lfefoyw@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250304011952.29182-4-richard.weiyang@gmail.com>
 <202503061924.hFdFosTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503061924.hFdFosTG-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Mar 06, 2025 at 07:34:21PM +0800, kernel test robot wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on linus/master]
>[also build test WARNING on v6.14-rc5 next-20250306]
>[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/lib-rbtree-enable-userland-test-suite-for-rbtree-related-data-structure/20250304-092345
>base:   linus/master
>patch link:    https://lore.kernel.org/r/20250304011952.29182-4-richard.weiyang%40gmail.com
>patch subject: [PATCH 3/7] lib/rbtree: add random seed
>config: csky-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061924.hFdFosTG-lkp@intel.com/config)
>compiler: csky-linux-gcc (GCC) 14.2.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061924.hFdFosTG-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202503061924.hFdFosTG-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>>> lib/interval_tree_test.c:22:22: warning: conversion from 'long long unsigned int' to 'ulong' {aka 'long unsigned int'} changes value from '3141592653589793238' to '2721204694' [-Woverflow]
>      22 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
>         |                      ^~~~~~~~~~~~~~~~~~~~~~
>   lib/interval_tree_test.c:10:28: note: in definition of macro '__param'
>      10 |         static type name = init;                \
>         |                            ^~~~
>--
>>> lib/rbtree_test.c:17:22: warning: conversion from 'long long unsigned int' to 'ulong' {aka 'long unsigned int'} changes value from '3141592653589793238' to '2721204694' [-Woverflow]
>      17 | __param(ulong, seed, 3141592653589793238ULL, "Random seed");
>         |                      ^~~~~~~~~~~~~~~~~~~~~~
>   lib/rbtree_test.c:10:28: note: in definition of macro '__param'
>      10 |         static type name = init;                \
>         |                            ^~~~
>
>
>vim +22 lib/interval_tree_test.c
>
>    20	
>    21	__param(uint, max_endpoint, ~0, "Largest value for the interval's endpoint");
>  > 22	__param(ulong, seed, 3141592653589793238ULL, "Random seed");
>    23	
>

Thanks for reporting. I went through the mail list, it seems I need send a diff
reply here.

Since we already have proper definition of param_xxx_ullong(), I choose
following fix. If any comment, just let me know.

Thanks

diff --git a/include/linux/types.h b/include/linux/types.h
index a3d2182c2686..49b79c8bb1a9 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -92,6 +92,7 @@ typedef unsigned char		unchar;
 typedef unsigned short		ushort;
 typedef unsigned int		uint;
 typedef unsigned long		ulong;
+typedef unsigned long long	ullong;
 
 #ifndef __BIT_TYPES_DEFINED__
 #define __BIT_TYPES_DEFINED__
diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index 37198afa87ed..5fd62656f42e 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -21,7 +21,7 @@ __param(int, search_loops, 1000, "Number of iterations searching the tree");
 __param(bool, search_all, false, "Searches will iterate all nodes in the tree");
 
 __param(uint, max_endpoint, ~0, "Largest value for the interval's endpoint");
-__param(ulong, seed, 3141592653589793238ULL, "Random seed");
+__param(ullong, seed, 3141592653589793238ULL, "Random seed");
 
 static struct rb_root_cached root = RB_ROOT_CACHED;
 static struct interval_tree_node *nodes = NULL;
diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 94ace8f0fbf8..690cede46ac2 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -14,7 +14,7 @@
 __param(int, nnodes, 100, "Number of nodes in the rb-tree");
 __param(int, perf_loops, 1000, "Number of iterations modifying the rb-tree");
 __param(int, check_loops, 100, "Number of iterations modifying and verifying the rb-tree");
-__param(ulong, seed, 3141592653589793238ULL, "Random seed");
+__param(ullong, seed, 3141592653589793238ULL, "Random seed");
 
 struct test_node {
 	u32 key;
diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
index 8519386acd23..4928e33d44ac 100644
--- a/tools/include/linux/types.h
+++ b/tools/include/linux/types.h
@@ -42,6 +42,8 @@ typedef __s16 s16;
 typedef __u8  u8;
 typedef __s8  s8;
 
+typedef unsigned long long	ullong;
+
 #ifdef __CHECKER__
 #define __bitwise	__attribute__((bitwise))
 #else

-- 
Wei Yang
Help you, Help me
