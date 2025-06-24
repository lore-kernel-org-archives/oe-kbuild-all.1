Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624421A42F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766716; cv=none; b=GybRLRnNM6pBhe881Fef3DFVmqaoVBOgTu85bGEvtS7OsiKBxG/bT1+spH7c3Up9x+yKlJYCjiLYxM/A8ruGeQyvYBD6tAaBd91m2v16smK0IPRFaEmgM+mecChK760e43olzRujjqCuKNLNO3x94lLz5Yf8caKAPX497mmOgTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766716; c=relaxed/simple;
	bh=EarjytOqlz11MJlQepdxGKTt0kfKvP0dh+mT9P6bvPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKrXA7k8g0nqyuKk8v9x0y+5NA/chXgwSxEXFPpja5G28XF3t8MBCP9qPa0a201Vyr869AACVyJvP3Kul18K8zukacr5V9IrtxMnTtmEc6DjBLhuV+ZTR5EITBSnuGs5upNDU5MonVnHpo8TLA94ewW5OZf5mzb4wt+90+cShpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBZwt6KK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBZwt6KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750766714; x=1782302714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EarjytOqlz11MJlQepdxGKTt0kfKvP0dh+mT9P6bvPc=;
  b=cBZwt6KKVFGzszqVUKACWEQ4dRRvMVt4I96nJ+JmrUSovI/Db1QaK68M
   NNZ/awkwiyGC235BstI4MofQOpJsy9DV0WsMMfMkIIkRasIT4AUAARUp8
   g3/fKgH+J+j0OKyGzD6lbGtSClYqNxNXeH908KM6cU4ZMpJyYzQtAY54c
   6Tohqw7g9hJONV2un4kKJMIAA7fT5saoMJXVBeV2X7V+8EduRVA5mYK2J
   XeAiEbs8aFqNe+Wb4ZF2BPY8IlythWPADHuyNxI39lHPNEMgFXyn5ClZx
   4RhkicPxqueZ6ja3nvUqL0vVojFZAk+gJJR+2I04UC4zR9NE7xWg/9l2f
   Q==;
X-CSE-ConnectionGUID: yDLi0PyoQiuMSYxomjvozA==
X-CSE-MsgGUID: AcHKahO8SFygwoO+ycNXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56808022"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56808022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:05:14 -0700
X-CSE-ConnectionGUID: YjGL/aIQRoaLi1QQNcQZNA==
X-CSE-MsgGUID: tUDIMr3fQgGIVXO11Vcn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151492480"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2025 05:05:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU2Ok-000S5O-1w;
	Tue, 24 Jun 2025 12:05:10 +0000
Date: Tue, 24 Jun 2025 20:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] include/linux/string.h:290:33:
 error: '__builtin_strncpy' specified bound 64 equals destination size
Message-ID: <202506242039.A6yyLZE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   f55326b5b36a104711ee86c851bd2a981cae61d0
commit: 4e26f605716a88a00d0e51dfd7da55198b13d759 [2/2] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250624/202506242039.A6yyLZE8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242039.A6yyLZE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506242039.A6yyLZE8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:22,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:54,
                    from include/linux/thread_info.h:39,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:51,
                    from drivers/scsi/linkdata/ps3stor/./linux/ps3_driver_log.c:4:
   In function 'strncpy',
       inlined from 'ps3_filter_file_add' at drivers/scsi/linkdata/ps3stor/./linux/ps3_driver_log.c:131:2:
>> include/linux/string.h:290:33: error: '__builtin_strncpy' specified bound 64 equals destination size [-Werror=stringop-truncation]
     290 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/string.h:300:16: note: in expansion of macro '__underlying_strncpy'
     300 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function 'strncpy',
       inlined from 'ps3_filter_func_add' at drivers/scsi/linkdata/ps3stor/./linux/ps3_driver_log.c:193:2:
>> include/linux/string.h:290:33: error: '__builtin_strncpy' specified bound 64 equals destination size [-Werror=stringop-truncation]
     290 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/string.h:300:16: note: in expansion of macro '__underlying_strncpy'
     300 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
