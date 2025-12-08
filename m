Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E91DFF0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207057; cv=none; b=qx7rFQZjxLEcO5QvJ6BfaVXYU4qMuyESY+LJg1J30yL2qyMPwcyCuG+8yzYTuvI9/wnbar0t6H0QDvuFUmkXnTg5t7HaeqLHzm1sbHhAQZQh6GZ2WKok/Aw0NGmZ9EKRr1ntmxnUD3omAb+wtdggAx8i0ngipexBakWwUGcCzkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207057; c=relaxed/simple;
	bh=ujK+s6cjd1QMZRIWC9WmGZmpQBhYopa0TBqpydbNdmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQfHgQvel3ulGd+QT3YgY1uM2050NEmYM8a5zpJ4JVMPtolRweJpUCywKbWSPtiEB1E0RzPaJ8e7Rtn16kHbWI1ef/3qDFpeYA2GMhWTqfQxLupTu+ZxeQPsUVhpVtE8QPGoL8Vzo2IJsuqAlmn2DKY5IR8foERU5EG+5KkiVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVLmD0v7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVLmD0v7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765207055; x=1796743055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujK+s6cjd1QMZRIWC9WmGZmpQBhYopa0TBqpydbNdmI=;
  b=aVLmD0v79PNVa8wuEjkMajfnnbkP1KG/+zsCOUHm6N0ZPmNJhhFnlueh
   0xTH7C8OAAV+VxxDYjmf4duujbfwdkpt+yYKseapiOjph9lrHnVsZ9Ims
   awFQKltQd539tcWJoEj6oo4iLJyS7awxT/xKSEQItZSGJKummibhNhjr2
   UxuBVZC/DkSWaLQXwj0oYyQtLLlTnWDPZFWhUzgSkgTkUinY3sXaC5VvD
   ejiyFWOnkhFWoSgrSi24y+9FbxsPXlU+M9WWXsqpK9YIMjMCcKmv57bNc
   i9yR+wZu2KNFED4wB6MLQpTg7CtlrXq6/L2GUlTmJaf6bxAp3esl/WIQb
   Q==;
X-CSE-ConnectionGUID: WkkVBNPtSBWZszMUWID8xw==
X-CSE-MsgGUID: WEofnDXXRka/ye9OEF/GyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67080379"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67080379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 07:17:34 -0800
X-CSE-ConnectionGUID: fpFB1othT5KlXvt5/DiWkw==
X-CSE-MsgGUID: 225fGkkuRVWdheItpaOaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="200399980"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 07:17:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSczS-000000000VB-3B4p;
	Mon, 08 Dec 2025 15:17:30 +0000
Date: Mon, 8 Dec 2025 23:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3386/3386] include/linux/string.h:290:33:
 warning: '__builtin_strncpy' specified bound depends on the length of the
 source argument
Message-ID: <202512082302.Kf4xjvAw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weili,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   69d9543977fd7abe8b555406c7a3e5d64d8292f8
commit: a1666f44c2250f7413e73e2f4c02cb2c01f9e3b0 [3386/3386] crypto: hisilicon/qm - support no-sva feature
config: arm64-randconfig-r054-20251208 (https://download.01.org/0day-ci/archive/20251208/202512082302.Kf4xjvAw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512082302.Kf4xjvAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512082302.Kf4xjvAw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:17,
                    from include/linux/kobject.h:21,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/crypto/hisilicon/qm.c:4:
   In function 'strncpy',
       inlined from 'qm_alloc_uacce' at drivers/crypto/hisilicon/qm.c:2755:2:
>> include/linux/string.h:290:33: warning: '__builtin_strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     290 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/string.h:300:16: note: in expansion of macro '__underlying_strncpy'
     300 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function 'strlen',
       inlined from 'qm_alloc_uacce' at drivers/crypto/hisilicon/qm.c:2748:13:
   include/linux/string.h:288:33: note: length computed here
     288 | #define __underlying_strlen     __builtin_strlen
         |                                 ^
   include/linux/string.h:321:24: note: in expansion of macro '__underlying_strlen'
     321 |                 return __underlying_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +290 include/linux/string.h

47227d27e2fcb0 Daniel Axtens 2020-06-03  268  
47227d27e2fcb0 Daniel Axtens 2020-06-03  269  #ifdef CONFIG_KASAN
47227d27e2fcb0 Daniel Axtens 2020-06-03  270  extern void *__underlying_memchr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
47227d27e2fcb0 Daniel Axtens 2020-06-03  271  extern int __underlying_memcmp(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
47227d27e2fcb0 Daniel Axtens 2020-06-03  272  extern void *__underlying_memcpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
47227d27e2fcb0 Daniel Axtens 2020-06-03  273  extern void *__underlying_memmove(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
47227d27e2fcb0 Daniel Axtens 2020-06-03  274  extern void *__underlying_memset(void *p, int c, __kernel_size_t size) __RENAME(memset);
47227d27e2fcb0 Daniel Axtens 2020-06-03  275  extern char *__underlying_strcat(char *p, const char *q) __RENAME(strcat);
47227d27e2fcb0 Daniel Axtens 2020-06-03  276  extern char *__underlying_strcpy(char *p, const char *q) __RENAME(strcpy);
47227d27e2fcb0 Daniel Axtens 2020-06-03  277  extern __kernel_size_t __underlying_strlen(const char *p) __RENAME(strlen);
47227d27e2fcb0 Daniel Axtens 2020-06-03  278  extern char *__underlying_strncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
47227d27e2fcb0 Daniel Axtens 2020-06-03  279  extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
47227d27e2fcb0 Daniel Axtens 2020-06-03  280  #else
47227d27e2fcb0 Daniel Axtens 2020-06-03  281  #define __underlying_memchr	__builtin_memchr
47227d27e2fcb0 Daniel Axtens 2020-06-03  282  #define __underlying_memcmp	__builtin_memcmp
47227d27e2fcb0 Daniel Axtens 2020-06-03  283  #define __underlying_memcpy	__builtin_memcpy
47227d27e2fcb0 Daniel Axtens 2020-06-03  284  #define __underlying_memmove	__builtin_memmove
47227d27e2fcb0 Daniel Axtens 2020-06-03  285  #define __underlying_memset	__builtin_memset
47227d27e2fcb0 Daniel Axtens 2020-06-03  286  #define __underlying_strcat	__builtin_strcat
47227d27e2fcb0 Daniel Axtens 2020-06-03  287  #define __underlying_strcpy	__builtin_strcpy
47227d27e2fcb0 Daniel Axtens 2020-06-03  288  #define __underlying_strlen	__builtin_strlen
47227d27e2fcb0 Daniel Axtens 2020-06-03  289  #define __underlying_strncat	__builtin_strncat
47227d27e2fcb0 Daniel Axtens 2020-06-03 @290  #define __underlying_strncpy	__builtin_strncpy
47227d27e2fcb0 Daniel Axtens 2020-06-03  291  #endif
47227d27e2fcb0 Daniel Axtens 2020-06-03  292  

:::::: The code at line 290 was first introduced by commit
:::::: 47227d27e2fcb01a9e8f5958d8997cf47a820afc string.h: fix incompatibility between FORTIFY_SOURCE and KASAN

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
