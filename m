Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01B154435
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732784644; cv=none; b=Mhn8UqsM61b+lYN2FYdthjqflPBb9py8HSS5siIzFAVq9Dvgts/TerJf4Qxbjz66CsFJEKEBWzR667TrLv11XExDyMBHl5rfo7+dHPn8O/fwjGuB5PDO+Y/NH2leREwCO5AWOd9p2DbpKHtTDHpipWUb2KWOo96cI/NHLEMKPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732784644; c=relaxed/simple;
	bh=d4M4MGAEsW/fvR4UohRGfodTPTt/V/LcYzxLYgSZPC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcostXqj/HnqDUQyDr53fNuT1Ik53Pmh7J7Wc/jbuDAhubQHVietXWR2CYXShEqzwqpZ08+GpCbLAQ62A0A+3+91v9L/uiFa0us+PNsFPXR1n7A3asXtPRkYTKVhwcN9YH1i2G4VRASZMR8TaiTgMYTRosmHUWRRabyfyuKZE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCRnhS2X; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCRnhS2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732784642; x=1764320642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4M4MGAEsW/fvR4UohRGfodTPTt/V/LcYzxLYgSZPC8=;
  b=WCRnhS2Xbyrj9lYZUNWtFCRqnk9o65IuSi3qRAhD2CB/JgKJ2lXA75Ig
   gJ3CgtRW1SZ6snTPOZvq1eHBlBEgPR+50rfwlOwCdfL/MSx86+4NKQYVg
   A+TAPwY/LDSq/UNwsZ29cE8IkU21GDbakhm3JbDiggZUmTahUeAqdSST7
   h/gwCeFS3U4xe9/w9UQcTVCK/78jZv63vK5arOeJcpMsNzkcsXACArSG8
   x3q8tJ8bNIXUF2cbpVDxHVnaN8lU7R2Igf4AxhjNxAK5Vt5LTYvGoHieS
   ozmAwr8Exz44XoPXY+wAOjzs/KdPrLmZ6p/1lKUw0y1sPH318FbAh576Y
   g==;
X-CSE-ConnectionGUID: 5lfcqJXdRNWYS2OIL8VdZg==
X-CSE-MsgGUID: wEnUnCHnSwie0XoyCCbS8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32946006"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="32946006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 01:04:01 -0800
X-CSE-ConnectionGUID: jUKZxaEKR+Otgyqrcx/TeQ==
X-CSE-MsgGUID: xQL5vId8R9CArAcv0eMjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="96939055"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 01:03:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGaRJ-0009NH-1i;
	Thu, 28 Nov 2024 09:03:57 +0000
Date: Thu, 28 Nov 2024 17:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, JiangShui <1175135535@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2499/2499] include/linux/string.h:290:33:
 warning: '__builtin_strncpy' specified bound depends on the length of the
 source argument
Message-ID: <202411281656.uJnZiWID-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   48ec47c01c3800fd4419afd91af83e95ba9584d5
commit: a1666f44c2250f7413e73e2f4c02cb2c01f9e3b0 [2499/2499] crypto: hisilicon/qm - support no-sva feature
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281656.uJnZiWID-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281656.uJnZiWID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281656.uJnZiWID-lkp@intel.com/

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
       inlined from 'qm_alloc_uacce' at drivers/crypto/hisilicon/qm.c:2755:2,
       inlined from 'hisi_qm_init' at drivers/crypto/hisilicon/qm.c:5542:8:
>> include/linux/string.h:290:33: warning: '__builtin_strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     290 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/string.h:300:16: note: in expansion of macro '__underlying_strncpy'
     300 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function 'strlen',
       inlined from 'qm_alloc_uacce' at drivers/crypto/hisilicon/qm.c:2748:13,
       inlined from 'hisi_qm_init' at drivers/crypto/hisilicon/qm.c:5542:8:
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
