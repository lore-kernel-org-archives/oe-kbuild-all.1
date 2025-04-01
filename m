Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB651CAA90
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544964; cv=none; b=GNr0S6ld5IG8LTwFq+5UZeEqVMp1aeKRucCwUSz5BvjLAmyQHjQBUXSISYK/rKVG49uQM6Wj6ZAwbgkDHsiydxVBzpxDhLIXWIsHfnkQMaEsMn9oQRt+iouv7gQX3p7rF0MIqG7C0kU3kwUjGwbLaLntnuTvrFj96YVDIkcIoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544964; c=relaxed/simple;
	bh=bdesKOdFLA2jGJ8UtLGhw+wpPuQJgmKUNM9582pbDrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMIqFo1Rdy0cwqA69mBmYsZMnRxkMWkr1Jfe16ssP1E9REnIJtT7cRMs1g76nzZs3JN78z8APnJ0X7RoB2LKgUoJOU4iDn9vQsOhL11uQu968FQR0XuW0tg2/ksmouQpgHA5gn8rEyUAPwxzAruABvc/xhgYxrOtI4mC5KOaSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+jlEQbR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+jlEQbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743544961; x=1775080961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdesKOdFLA2jGJ8UtLGhw+wpPuQJgmKUNM9582pbDrY=;
  b=I+jlEQbRWWsR9Qch+sCSJ6ZmnW6XIYR0W/SJd7OwBcakhojXHGri65ny
   qFvHxUT5+5XvrbcyZB6nw8bOzBK1aWquQRbk/2LSvSa02fVudBz0Isf4B
   uIUR5oR7kkasZmxxoGOz9vjp0V+fllJ+Jw9JHqZEWEWFAUnm8YNcETQGd
   tMBVLaz/If1d2CkQpSNWD3PWDA1k/3x6BiQ03a6meHrySZwiodmdiP2Jp
   gonXlpiPL+/JsvBmLNyayRrCT0Ghf4v3n3cCr7CTWrpeDh5YjW5ONT8u0
   7J18prhN3xEcnJAvU5olWoLZ0X7HeJXo+G7mFQiz9+WRK47uslF6lzAXa
   w==;
X-CSE-ConnectionGUID: En3WVZ6wQgG/8a9oZ1Eiyw==
X-CSE-MsgGUID: ogvlJioqShO9zJpWFPzikQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32485057"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="32485057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:02:40 -0700
X-CSE-ConnectionGUID: 8hk/bLHJTOKWi/+kHP0fkQ==
X-CSE-MsgGUID: 2nZGgRK8TMmlLIyQgOEhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126403218"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 15:02:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjgi-000AAI-1m;
	Tue, 01 Apr 2025 22:02:35 +0000
Date: Wed, 2 Apr 2025 06:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_any_andnot 13/13]
 arch/powerpc/include/asm/string.h:20:15: error: storage class specified for
 parameter 'strcpy'
Message-ID: <202504020521.OsBGPV73-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_any_andnot
head:   d18e9bef696af868ef6afafb5d50ca9732a089cd
commit: d18e9bef696af868ef6afafb5d50ca9732a089cd [13/13] cpumask_any_andnot_but
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250402/202504020521.OsBGPV73-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020521.OsBGPV73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020521.OsBGPV73-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   include/linux/find.h:32:15: warning: no previous prototype for '_find_first_andnot_bit' [-Wmissing-prototypes]
      32 | unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h: In function '_find_first_andnot_bit':
   include/linux/find.h:36:22: error: storage class specified for parameter '_find_first_zero_bit'
      36 | extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
         |                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:37:22: error: storage class specified for parameter '_find_last_bit'
      37 | extern unsigned long _find_last_bit(const unsigned long *addr, unsigned long size);
         |                      ^~~~~~~~~~~~~~
   include/linux/find.h:60:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      60 | {
         | ^
   include/linux/find.h:90:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      90 | {
         | ^
   include/linux/find.h:121:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     121 | {
         | ^
   include/linux/find.h:151:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     151 | {
         | ^
   include/linux/find.h:179:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     179 | {
         | ^
   include/linux/find.h:205:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     205 | {
         | ^
   include/linux/find.h:231:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     231 | {
         | ^
   include/linux/find.h:257:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     257 | {
         | ^
   include/linux/find.h:284:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     284 | {
         | ^
   include/linux/find.h:314:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     314 | {
         | ^
   include/linux/find.h:341:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     341 | {
         | ^
   include/linux/find.h:365:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     365 | {
         | ^
   include/linux/find.h:390:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     390 | {
         | ^
   include/linux/find.h:411:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     411 | {
         | ^
   include/linux/find.h:432:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     432 | {
         | ^
   include/linux/find.h:457:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     457 | {
         | ^
   include/linux/find.h:479:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     479 | {
         | ^
   include/linux/find.h:496:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     496 | {
         | ^
   include/linux/find.h:525:22: error: storage class specified for parameter 'find_next_clump8'
     525 | extern unsigned long find_next_clump8(unsigned long *clump,
         |                      ^~~~~~~~~~~~~~~~
   include/linux/find.h:558:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     558 | {
         | ^
   include/linux/find.h:576:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     576 | {
         | ^
   include/linux/find.h:591:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     591 | {
         | ^
   In file included from include/linux/bitmap.h:13:
   include/linux/string.h:17:14: error: storage class specified for parameter 'strndup_user'
      17 | extern char *strndup_user(const char __user *, long);
         |              ^~~~~~~~~~~~
   include/linux/string.h:18:14: error: storage class specified for parameter 'memdup_user'
      18 | extern void *memdup_user(const void __user *, size_t) __realloc_size(2);
         |              ^~~~~~~~~~~
   include/linux/string.h:19:14: error: storage class specified for parameter 'vmemdup_user'
      19 | extern void *vmemdup_user(const void __user *, size_t) __realloc_size(2);
         |              ^~~~~~~~~~~~
   include/linux/string.h:20:14: error: storage class specified for parameter 'memdup_user_nul'
      20 | extern void *memdup_user_nul(const void __user *, size_t);
         |              ^~~~~~~~~~~~~~~
   include/linux/string.h:33:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      33 | {
         | ^
   include/linux/string.h:53:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      53 | {
         | ^
   In file included from include/linux/string.h:65:
>> arch/powerpc/include/asm/string.h:20:15: error: storage class specified for parameter 'strcpy'
      20 | extern char * strcpy(char *,const char *);
         |               ^~~~~~
>> arch/powerpc/include/asm/string.h:21:15: error: storage class specified for parameter 'strncpy'
      21 | extern char * strncpy(char *,const char *, __kernel_size_t);
         |               ^~~~~~~
>> arch/powerpc/include/asm/string.h:22:24: error: storage class specified for parameter 'strlen'
      22 | extern __kernel_size_t strlen(const char *);
         |                        ^~~~~~
>> arch/powerpc/include/asm/string.h:23:12: error: storage class specified for parameter 'strcmp'
      23 | extern int strcmp(const char *,const char *);
         |            ^~~~~~
>> arch/powerpc/include/asm/string.h:24:12: error: storage class specified for parameter 'strncmp'
      24 | extern int strncmp(const char *, const char *, __kernel_size_t);
         |            ^~~~~~~
>> arch/powerpc/include/asm/string.h:25:15: error: storage class specified for parameter 'strcat'
      25 | extern char * strcat(char *, const char *);
         |               ^~~~~~
>> arch/powerpc/include/asm/string.h:26:15: error: storage class specified for parameter 'memset'
      26 | extern void * memset(void *,int,__kernel_size_t);
         |               ^~~~~~
>> arch/powerpc/include/asm/string.h:27:15: error: storage class specified for parameter 'memcpy'
      27 | extern void * memcpy(void *,const void *,__kernel_size_t);
         |               ^~~~~~
>> arch/powerpc/include/asm/string.h:28:15: error: storage class specified for parameter 'memmove'
      28 | extern void * memmove(void *,const void *,__kernel_size_t);
         |               ^~~~~~~
>> arch/powerpc/include/asm/string.h:29:12: error: storage class specified for parameter 'memcmp'
      29 | extern int memcmp(const void *,const void *,__kernel_size_t);
         |            ^~~~~~
>> arch/powerpc/include/asm/string.h:30:15: error: storage class specified for parameter 'memchr'
      30 | extern void * memchr(const void *,int,__kernel_size_t);
         |               ^~~~~~
>> arch/powerpc/include/asm/string.h:88:14: error: storage class specified for parameter 'memset16'
      88 | extern void *memset16(uint16_t *, uint16_t, __kernel_size_t);
         |              ^~~~~~~~
   include/linux/string.h:68:15: error: storage class specified for parameter 'strcpy'
      68 | extern char * strcpy(char *,const char *);
         |               ^~~~~~
>> include/linux/string.h:68:15: error: redefinition of parameter 'strcpy'
   arch/powerpc/include/asm/string.h:20:15: note: previous definition of 'strcpy' with type 'char * (*)(char *, const char *)'
      20 | extern char * strcpy(char *,const char *);
         |               ^~~~~~
   include/linux/string.h:152:15: error: storage class specified for parameter 'strcat'
     152 | extern char * strcat(char *, const char *);
         |               ^~~~~~
>> include/linux/string.h:152:15: error: redefinition of parameter 'strcat'
   arch/powerpc/include/asm/string.h:25:15: note: previous definition of 'strcat' with type 'char * (*)(char *, const char *)'
      25 | extern char * strcat(char *, const char *);
         |               ^~~~~~
   include/linux/string.h:155:15: error: storage class specified for parameter 'strncat'
     155 | extern char * strncat(char *, const char *, __kernel_size_t);
         |               ^~~~~~~
   include/linux/string.h:158:15: error: storage class specified for parameter 'strlcat'
     158 | extern size_t strlcat(char *, const char *, __kernel_size_t);
         |               ^~~~~~~
   include/linux/string.h:161:12: error: storage class specified for parameter 'strcmp'
     161 | extern int strcmp(const char *,const char *);
         |            ^~~~~~
>> include/linux/string.h:161:12: error: redefinition of parameter 'strcmp'
   arch/powerpc/include/asm/string.h:23:12: note: previous definition of 'strcmp' with type 'int (*)(const char *, const char *)'
      23 | extern int strcmp(const char *,const char *);
         |            ^~~~~~
   include/linux/string.h:167:12: error: storage class specified for parameter 'strcasecmp'
     167 | extern int strcasecmp(const char *s1, const char *s2);
         |            ^~~~~~~~~~
   include/linux/string.h:170:12: error: storage class specified for parameter 'strncasecmp'
     170 | extern int strncasecmp(const char *s1, const char *s2, size_t n);
         |            ^~~~~~~~~~~
   include/linux/string.h:173:15: error: storage class specified for parameter 'strchr'
     173 | extern char * strchr(const char *,int);
         |               ^~~~~~
   include/linux/string.h:176:15: error: storage class specified for parameter 'strchrnul'
     176 | extern char * strchrnul(const char *,int);
         |               ^~~~~~~~~
   include/linux/string.h:178:15: error: storage class specified for parameter 'strnchrnul'
     178 | extern char * strnchrnul(const char *, size_t, int);
         |               ^~~~~~~~~~
   include/linux/string.h:180:15: error: storage class specified for parameter 'strnchr'
     180 | extern char * strnchr(const char *, size_t, int);
         |               ^~~~~~~
   include/linux/string.h:183:15: error: storage class specified for parameter 'strrchr'
     183 | extern char * strrchr(const char *,int);
         |               ^~~~~~~
   include/linux/string.h:185:28: error: storage class specified for parameter 'skip_spaces'
     185 | extern char * __must_check skip_spaces(const char *);
         |                            ^~~~~~~~~~~
   include/linux/string.h:187:14: error: storage class specified for parameter 'strim'
     187 | extern char *strim(char *);
         |              ^~~~~
   include/linux/string.h:190:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     190 | {
         | ^
   include/linux/string.h:195:15: error: storage class specified for parameter 'strstr'
     195 | extern char * strstr(const char *, const char *);
         |               ^~~~~~
   include/linux/string.h:198:15: error: storage class specified for parameter 'strnstr'
     198 | extern char * strnstr(const char *, const char *, size_t);
         |               ^~~~~~~
   include/linux/string.h:204:24: error: storage class specified for parameter 'strnlen'
     204 | extern __kernel_size_t strnlen(const char *,__kernel_size_t);
         |                        ^~~~~~~
   include/linux/string.h:207:15: error: storage class specified for parameter 'strpbrk'
     207 | extern char * strpbrk(const char *,const char *);
         |               ^~~~~~~
   include/linux/string.h:210:15: error: storage class specified for parameter 'strsep'
     210 | extern char * strsep(char **,const char *);
         |               ^~~~~~
   include/linux/string.h:213:24: error: storage class specified for parameter 'strspn'
     213 | extern __kernel_size_t strspn(const char *,const char *);
         |                        ^~~~~~
   include/linux/string.h:216:24: error: storage class specified for parameter 'strcspn'
     216 | extern __kernel_size_t strcspn(const char *,const char *);
         |                        ^~~~~~~
   include/linux/string.h:228:14: error: storage class specified for parameter 'memset32'
     228 | extern void *memset32(uint32_t *, uint32_t, __kernel_size_t);
         |              ^~~~~~~~
   include/linux/string.h:232:14: error: storage class specified for parameter 'memset64'
     232 | extern void *memset64(uint64_t *, uint64_t, __kernel_size_t);
         |              ^~~~~~~~
   include/linux/string.h:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   include/linux/string.h:245:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     245 | {
         | ^
   include/linux/string.h:252:15: error: storage class specified for parameter '__memcat_p'
     252 | extern void **__memcat_p(void **a, void **b);
         |               ^~~~~~~~~~
   include/linux/string.h:266:15: error: storage class specified for parameter 'memscan'
     266 | extern void * memscan(void *,int,__kernel_size_t);
         |               ^~~~~~~
   include/linux/string.h:272:12: error: storage class specified for parameter 'bcmp'
     272 | extern int bcmp(const void *,const void *,__kernel_size_t);
         |            ^~~~
   include/linux/string.h:295:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     295 | {
         | ^
   include/linux/string.h:299:13: error: storage class specified for parameter 'kfree_const'
     299 | extern void kfree_const(const void *x);
         |             ^~~~~~~~~~~
   include/linux/string.h:301:14: error: storage class specified for parameter 'kstrdup'
     301 | extern char *kstrdup(const char *s, gfp_t gfp) __malloc;
         |              ^~~~~~~
   include/linux/string.h:301:1: warning: 'malloc' attribute ignored; valid only for functions [-Wattributes]
     301 | extern char *kstrdup(const char *s, gfp_t gfp) __malloc;
         | ^~~~~~
   include/linux/string.h:302:20: error: storage class specified for parameter 'kstrdup_const'
     302 | extern const char *kstrdup_const(const char *s, gfp_t gfp);
         |                    ^~~~~~~~~~~~~
   include/linux/string.h:303:14: error: storage class specified for parameter 'kstrndup'
     303 | extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
         |              ^~~~~~~~
   include/linux/string.h:304:14: error: storage class specified for parameter 'kmemdup_noprof'
     304 | extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
         |              ^~~~~~~~~~~~~~
   include/linux/string.h:307:14: error: storage class specified for parameter 'kvmemdup'
     307 | extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
         |              ^~~~~~~~
   include/linux/string.h:308:14: error: storage class specified for parameter 'kmemdup_nul'
--
   include/linux/bitmap.h:267:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     267 | {
         | ^
   include/linux/bitmap.h:276:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     276 | {
         | ^
   include/linux/bitmap.h:324:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     324 | {
         | ^
   include/linux/bitmap.h:333:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     333 | {
         | ^
   include/linux/bitmap.h:343:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     343 | {
         | ^
   include/linux/bitmap.h:353:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     353 | {
         | ^
   include/linux/bitmap.h:361:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     361 | {
         | ^
   include/linux/bitmap.h:377:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     377 | {
         | ^
   include/linux/bitmap.h:398:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     398 | {
         | ^
   include/linux/bitmap.h:407:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     407 | {
         | ^
   include/linux/bitmap.h:416:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     416 | {
         | ^
   include/linux/bitmap.h:425:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     425 | {
         | ^
   include/linux/bitmap.h:434:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     434 | {
         | ^
   include/linux/bitmap.h:443:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     443 | {
         | ^
   include/linux/bitmap.h:452:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     452 | {
         | ^
   include/linux/bitmap.h:461:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     461 | {
         | ^
   include/linux/bitmap.h:469:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     469 | {
         | ^
   include/linux/bitmap.h:485:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     485 | {
         | ^
   include/linux/bitmap.h:502:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     502 | {
         | ^
   include/linux/bitmap.h:512:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     512 | {
         | ^
   include/linux/bitmap.h:525:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     525 | {
         | ^
   include/linux/bitmap.h:570:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     570 | {
         | ^
   include/linux/bitmap.h:627:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     627 | {
         | ^
   include/linux/bitmap.h:640:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     640 | {
         | ^
   include/linux/bitmap.h:656:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     656 | {
         | ^
   include/linux/bitmap.h:673:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     673 | {
         | ^
   include/linux/bitmap.h:698:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     698 | {
         | ^
   include/linux/bitmap.h:752:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     752 | {
         | ^
   include/linux/bitmap.h:768:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     768 | {
         | ^
   include/linux/bitmap.h:803:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     803 | {
         | ^
   In file included from include/linux/cpumask.h:13:
   include/linux/cpumask_types.h:9:59: error: storage class specified for parameter 'cpumask_t'
       9 | typedef struct cpumask { DECLARE_BITMAP(bits, NR_CPUS); } cpumask_t;
         |                                                           ^~~~~~~~~
   include/linux/cpumask_types.h:63:24: error: storage class specified for parameter 'cpumask_var_t'
      63 | typedef struct cpumask cpumask_var_t[1];
         |                        ^~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:14:
>> arch/powerpc/include/asm/cmpxchg.h:18:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      18 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:81:1: note: in expansion of macro 'XCHG_GEN'
      81 | XCHG_GEN(u8, _local, "memory");
         | ^~~~~~~~
>> arch/powerpc/include/asm/cmpxchg.h:81:31: error: expected declaration specifiers before ';' token
      81 | XCHG_GEN(u8, _local, "memory");
         |                               ^
>> arch/powerpc/include/asm/cmpxchg.h:18:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      18 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:82:1: note: in expansion of macro 'XCHG_GEN'
      82 | XCHG_GEN(u8, _relaxed, "cc");
         | ^~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:82:29: error: expected declaration specifiers before ';' token
      82 | XCHG_GEN(u8, _relaxed, "cc");
         |                             ^
>> arch/powerpc/include/asm/cmpxchg.h:18:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      18 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:83:1: note: in expansion of macro 'XCHG_GEN'
      83 | XCHG_GEN(u16, _local, "memory");
         | ^~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:83:32: error: expected declaration specifiers before ';' token
      83 | XCHG_GEN(u16, _local, "memory");
         |                                ^
>> arch/powerpc/include/asm/cmpxchg.h:18:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      18 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:84:1: note: in expansion of macro 'XCHG_GEN'
      84 | XCHG_GEN(u16, _relaxed, "cc");
         | ^~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:84:30: error: expected declaration specifiers before ';' token
      84 | XCHG_GEN(u16, _relaxed, "cc");
         |                              ^
   arch/powerpc/include/asm/cmpxchg.h:153:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     153 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:169:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     169 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:219:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     219 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:238:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     238 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:273:1: note: in expansion of macro 'CMPXCHG_GEN'
     273 | CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:273:79: error: expected declaration specifiers before ';' token
     273 | CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
         |                                                                               ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:274:1: note: in expansion of macro 'CMPXCHG_GEN'
     274 | CMPXCHG_GEN(u8, _local, , , "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:274:38: error: expected declaration specifiers before ';' token
     274 | CMPXCHG_GEN(u8, _local, , , "memory");
         |                                      ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:275:1: note: in expansion of macro 'CMPXCHG_GEN'
     275 | CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:275:59: error: expected declaration specifiers before ';' token
     275 | CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
         |                                                           ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:276:1: note: in expansion of macro 'CMPXCHG_GEN'
     276 | CMPXCHG_GEN(u8, _relaxed, , , "cc");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:276:36: error: expected declaration specifiers before ';' token
     276 | CMPXCHG_GEN(u8, _relaxed, , , "cc");
         |                                    ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:277:1: note: in expansion of macro 'CMPXCHG_GEN'
     277 | CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:277:80: error: expected declaration specifiers before ';' token
     277 | CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
         |                                                                                ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:278:1: note: in expansion of macro 'CMPXCHG_GEN'
     278 | CMPXCHG_GEN(u16, _local, , , "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:278:39: error: expected declaration specifiers before ';' token
     278 | CMPXCHG_GEN(u16, _local, , , "memory");
         |                                       ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:279:1: note: in expansion of macro 'CMPXCHG_GEN'
     279 | CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:279:60: error: expected declaration specifiers before ';' token
     279 | CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
         |                                                            ^
   arch/powerpc/include/asm/cmpxchg.h:43:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      43 | {                                                               \
         | ^
   arch/powerpc/include/asm/cmpxchg.h:280:1: note: in expansion of macro 'CMPXCHG_GEN'
     280 | CMPXCHG_GEN(u16, _relaxed, , , "cc");
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/cmpxchg.h:280:37: error: expected declaration specifiers before ';' token
     280 | CMPXCHG_GEN(u16, _relaxed, , , "cc");
         |                                     ^
   arch/powerpc/include/asm/cmpxchg.h:446:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     446 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:469:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     469 | {
         | ^
   arch/powerpc/include/asm/cmpxchg.h:489:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     489 | {


vim +/strcpy +20 arch/powerpc/include/asm/string.h

^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16  19  
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @20  extern char * strcpy(char *,const char *);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @21  extern char * strncpy(char *,const char *, __kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @22  extern __kernel_size_t strlen(const char *);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @23  extern int strcmp(const char *,const char *);
0119536cd314ef9 include/asm-powerpc/string.h      Steven Rostedt   2008-03-01 @24  extern int strncmp(const char *, const char *, __kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @25  extern char * strcat(char *, const char *);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @26  extern void * memset(void *,int,__kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @27  extern void * memcpy(void *,const void *,__kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @28  extern void * memmove(void *,const void *,__kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @29  extern int memcmp(const void *,const void *,__kernel_size_t);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16 @30  extern void * memchr(const void *,int,__kernel_size_t);
e28026189705662 arch/powerpc/include/asm/string.h Li RongQing      2019-04-26  31  void memcpy_flushcache(void *dest, const void *src, size_t size);
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16  32  
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  33  #ifdef CONFIG_KASAN
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  34  /* __mem variants are used by KASAN to implement instrumented meminstrinsics. */
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  35  #ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  36  #define __memset memset
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  37  #define __memcpy memcpy
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  38  #define __memmove memmove
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  39  #else /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  40  void *__memset(void *s, int c, __kernel_size_t count);
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  41  void *__memcpy(void *to, const void *from, __kernel_size_t n);
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  42  void *__memmove(void *to, const void *from, __kernel_size_t n);
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  43  #ifndef __SANITIZE_ADDRESS__
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  44  /*
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  45   * For files that are not instrumented (e.g. mm/slub.c) we
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  46   * should use not instrumented version of mem* functions.
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  47   */
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  48  #define memcpy(dst, src, len) __memcpy(dst, src, len)
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  49  #define memmove(dst, src, len) __memmove(dst, src, len)
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  50  #define memset(s, c, n) __memset(s, c, n)
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  51  
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  52  #ifndef __NO_FORTIFY
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  53  #define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  54  #endif
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  55  #endif /* !__SANITIZE_ADDRESS__ */
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  56  #endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
90db9dbedd26ce0 arch/powerpc/include/asm/string.h Marco Elver      2023-02-27  57  #endif /* CONFIG_KASAN */
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  58  
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  59  #ifdef CONFIG_PPC64
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  60  #ifndef CONFIG_KASAN
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  61  #define __HAVE_ARCH_MEMSET32
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  62  #define __HAVE_ARCH_MEMSET64
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  63  
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  64  extern void *__memset16(uint16_t *, uint16_t v, __kernel_size_t);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  65  extern void *__memset32(uint32_t *, uint32_t v, __kernel_size_t);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  66  extern void *__memset64(uint64_t *, uint64_t v, __kernel_size_t);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  67  
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  68  static inline void *memset16(uint16_t *p, uint16_t v, __kernel_size_t n)
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  69  {
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  70  	return __memset16(p, v, n * 2);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  71  }
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  72  
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  73  static inline void *memset32(uint32_t *p, uint32_t v, __kernel_size_t n)
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  74  {
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  75  	return __memset32(p, v, n * 4);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  76  }
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  77  
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  78  static inline void *memset64(uint64_t *p, uint64_t v, __kernel_size_t n)
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  79  {
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  80  	return __memset64(p, v, n * 8);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  81  }
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  82  #endif
da74f659205ea08 arch/powerpc/include/asm/string.h Christophe Leroy 2017-08-23  83  #else
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  84  #ifndef CONFIG_KASAN
9412b234501eef1 arch/powerpc/include/asm/string.h Christophe Leroy 2018-08-01  85  #define __HAVE_ARCH_STRLEN
26deb04342e343a arch/powerpc/include/asm/string.h Christophe Leroy 2019-04-26  86  #endif
9412b234501eef1 arch/powerpc/include/asm/string.h Christophe Leroy 2018-08-01  87  
da74f659205ea08 arch/powerpc/include/asm/string.h Christophe Leroy 2017-08-23 @88  extern void *memset16(uint16_t *, uint16_t, __kernel_size_t);
694fc88ce271fd4 arch/powerpc/include/asm/string.h Naveen N Rao     2017-03-28  89  #endif
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16  90  #endif /* __KERNEL__ */
^1da177e4c3f415 include/asm-ppc/string.h          Linus Torvalds   2005-04-16  91  

:::::: The code at line 20 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
