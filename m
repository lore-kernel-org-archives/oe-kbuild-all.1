Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912431F9EDC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732730053; cv=none; b=kEUvWsnEY0vtIl6ncoLwntEqthg8kzgvjdWuaO688m/qb4zKinZ6YQbq55IjWmyerjbxqVblsLNcp0nFmN0ITLUJGINOZYNk3KT/OEPX2NCUcvSyFYRs4irdgpINq7rw0RoDv72WT5bGv0fFktR7Egs74bVP7XFSGGLQVZ9qzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732730053; c=relaxed/simple;
	bh=yQF1TUvBDswoffiZByS81+GVOYKm/b1itAuAgAyZH2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AmZ+LxVAp3Y8KSEGiBj+UsAnNuu5ggjrg/tLj7V6Xe1QQKKmHs1bdC5dqZIwLPgOaWTfppHNV5btLWNKMNykcdwjj3EQgbzxovMIWCY+ZmbRPOpjV9+dqYfgrR4wOmEFY3ssG86+Ito4oKGBY8v1pd3b1YZMKsNQbYumNboxcJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMuPvunk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMuPvunk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732730051; x=1764266051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQF1TUvBDswoffiZByS81+GVOYKm/b1itAuAgAyZH2I=;
  b=eMuPvunkWjQXpUu+EICiKkk3uBgKsmUmAsxtj/qfYPSx57lBHU7qrRxJ
   8330u1Zucx9LxpriQSM9aHgWihBf+WzretQIK/9MPvLnkQ7Ap6X7LSU91
   x8wEG4lWNuShhae3wbWJLXsxNFmQx1e2MO7TbYluhpgYiSWVihKPrc8lJ
   Vcjm8x6pV7Q+fhvmwiVKC0cLkOyi2sqjbAaIOERrjh+9j/D/Pvw7Jc75D
   sugMwgEX47/DW6ZIy2Q3+ABkmHxeZgAZeaHhrH3wEpuVaGEvySE53jpXJ
   jSscmfK7LlERIF9suzvJ+zN3Yz0sjGGF7jqfRm9hvfoNClid/3D3FbkC7
   g==;
X-CSE-ConnectionGUID: meXmcVlqQBCBVIIva9EnWw==
X-CSE-MsgGUID: 7dBu6l1CTWSuhIUQwdUjlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43554401"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43554401"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 09:54:10 -0800
X-CSE-ConnectionGUID: oFNZgWziQ+ySv24R0dRIUg==
X-CSE-MsgGUID: PN1hFLRMRtGRs7xbJ+1hwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96951977"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2024 09:54:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGMEn-0008EP-2a;
	Wed, 27 Nov 2024 17:54:05 +0000
Date: Thu, 28 Nov 2024 01:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 15/16]
 arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before
 ';' token
Message-ID: <202411280106.KeHQL4oB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   703847fa8622c4437cdd73d4759cf26a0b72b439
commit: d5b316b3aee42be192647dd8f7461ffef4683be7 [15/16] objtool: 'Fix' ANNOTATE_REACHABLE to be a normal annotation
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411280106.KeHQL4oB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280106.KeHQL4oB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280106.KeHQL4oB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:390,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from scripts/mod/devicetable-offsets.c:3:
   include/linux/uuid.h: In function 'guid_copy':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:53:9: note: in expansion of macro 'memcpy'
      53 |         memcpy(dst, src, sizeof(guid_t));
         |         ^~~~~~
   include/linux/uuid.h: In function 'import_guid':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:58:9: note: in expansion of macro 'memcpy'
      58 |         memcpy(dst, src, sizeof(guid_t));
         |         ^~~~~~
   include/linux/uuid.h: In function 'export_guid':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:63:9: note: in expansion of macro 'memcpy'
      63 |         memcpy(dst, src, sizeof(guid_t));
         |         ^~~~~~
   include/linux/uuid.h: In function 'uuid_copy':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:78:9: note: in expansion of macro 'memcpy'
      78 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^~~~~~
   include/linux/uuid.h: In function 'import_uuid':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:83:9: note: in expansion of macro 'memcpy'
      83 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^~~~~~
   include/linux/uuid.h: In function 'export_uuid':
>> arch/loongarch/include/asm/bug.h:48:74: error: expected ':' or ')' before ';' token
      48 |         __BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
      49 |         instrumentation_end();                                  \
   arch/loongarch/include/asm/bug.h:43:30: note: in definition of macro '__BUG_FLAGS'
      43 |                              extra);
         |                              ^~~~~
   include/asm-generic/bug.h:107:17: note: in expansion of macro '__WARN_FLAGS'
     107 |                 __WARN_FLAGS(BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^~~~~~~~~~~~
   include/asm-generic/bug.h:134:17: note: in expansion of macro '__WARN_printf'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:152:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/fortify-string.h:24:41: note: in expansion of macro 'WARN_ONCE'
      24 | # define fortify_warn_once(x...)        WARN_ONCE(x)
         |                                         ^~~~~~~~~
   include/linux/fortify-string.h:626:9: note: in expansion of macro 'fortify_warn_once'
     626 |         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,  \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:678:26: note: in expansion of macro '__fortify_memcpy_chk'
     678 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/uuid.h:88:9: note: in expansion of macro 'memcpy'
      88 |         memcpy(dst, src, sizeof(uuid_t));
         |         ^~~~~~
   make[3]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +48 arch/loongarch/include/asm/bug.h

    40	
    41	#define __BUG_FLAGS(flags, extra)					\
    42		asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
    43				     extra);
    44	
    45	#define __WARN_FLAGS(flags)					\
    46	do {								\
    47		instrumentation_begin();				\
  > 48		__BUG_FLAGS(BUGFLAG_WARNING|(flags), __ANNOTATE_REACHABLE(10001b);\
    49		instrumentation_end();					\
    50	} while (0)
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
