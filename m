Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE1382374
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777736660; cv=none; b=lJTJOwGWEq7aWoDvno9naGIIAjZVpYY1cUE2uNy+a7UIqhF7+aiR2+D5ls0AxCT2RjXin6W0ic/loAAGFL3tVtnuj15XHwugT6UUsnAE/GIbAPoUaV+1gTVQI5WoFnQj0sqVxrBoFk3q600SNrC7EQBUQzTTxF8fLU1iDScKgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777736660; c=relaxed/simple;
	bh=N4k5EFWE6SCa1qKNTTkTgsFReBWWvLe61gXSvt/QWd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqPiCFKsW1ige37bARdN1nNQDOKuZkA6pltt/D8tXgX8AK0ZoPOVUQDYe3xurW07ZPrkrIfQZ+sfbtV2KVlCB7IVqaqWxbBkzf2CBBYSgTLjvxjKhl2A8N9GWVUXVWyaTOV5FbrtSTzpHwWxO3+sRJnZbq6Y2B69GguzSoCU7GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0Od8noh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0Od8noh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777736657; x=1809272657;
  h=date:from:to:cc:subject:message-id;
  bh=N4k5EFWE6SCa1qKNTTkTgsFReBWWvLe61gXSvt/QWd0=;
  b=U0Od8nohfORAua5lqLiJUlIvxOaHTNQ5Vd14iOOM70Gf7SbhdDYtOrfK
   MOayxRnZobkKym7N99txt/jxqs5J6IAMLVj7anWsDfKj2OMqtQ7gZakYA
   J/Kl6MBmTSMJqhiiis2wpy72Hpm/RrQzLdM/H28CsTEQ2pEiceTdsGAFs
   CFi5RHoLZTZSwaW9WD9VdfD46ME6svNlt1hwSkRlJw0ihj6a96R9ZmiuM
   KN9t3nVoZoalAbqwtcdym1ZueWj8cw1/kLjamL+w2Oy2kmiomm8uIeR3E
   Rk0y8SUazvokpQ42/l0Bhq1vq5zunuS9XliUztcQJ/ovHc4+1OVQCWU36
   Q==;
X-CSE-ConnectionGUID: 7lk81LFLQiO3yyMj1ngjQA==
X-CSE-MsgGUID: SFPZH4laQRKQr6vVAwpjLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89768118"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="89768118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 08:44:17 -0700
X-CSE-ConnectionGUID: iKsQNDcxS4KXf8x2uLXtWw==
X-CSE-MsgGUID: XfmKLY/9RiqFOGp5MaBGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="239443189"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2026 08:44:16 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJCVo-000000001VO-48K3;
	Sat, 02 May 2026 15:44:12 +0000
Date: Sat, 02 May 2026 23:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 1/1]
 include/linux/android_kabi.h:65:17: error: static assertion failed:
 "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned
 the same as atomic64_t nr_task_refs"
Message-ID: <202605022332.oNYLGvDv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   f5f1b71c7f2185e607cfaac7c35e2289caa5c27c
commit: e24cc2d5218669b7412788d57528059ec6ecee4e [1/1] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605022332.oNYLGvDv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022332.oNYLGvDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022332.oNYLGvDv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/slab_common.c:7:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/page_alloc.c:19:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1831:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~


vim +65 include/linux/android_kabi.h

e97af2a2f5563a Giuliano Procida   2025-05-28  54  
e97af2a2f5563a Giuliano Procida   2025-05-28  55  #define _ANDROID_KABI_RULE(hint, target, value) \
e97af2a2f5563a Giuliano Procida   2025-05-28  56  	__ANDROID_KABI_RULE(hint, #target, #value)
e3e94686886450 Giuliano Procida   2025-04-16  57  
e3e94686886450 Giuliano Procida   2025-04-16  58  #define _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new)			\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  59  	union {								\
e3e94686886450 Giuliano Procida   2025-04-16  60  		_Static_assert(						\
e3e94686886450 Giuliano Procida   2025-04-16  61  			sizeof(struct { _new; }) <=			\
e3e94686886450 Giuliano Procida   2025-04-16  62  				sizeof(struct { _orig; }),		\
e3e94686886450 Giuliano Procida   2025-04-16  63  			FILE_LINE ": " __stringify(_new)		\
e3e94686886450 Giuliano Procida   2025-04-16  64  				" is larger than " __stringify(_orig));	\
e3e94686886450 Giuliano Procida   2025-04-16 @65  		_Static_assert(						\
e3e94686886450 Giuliano Procida   2025-04-16  66  			__alignof__(struct { _new; }) <=		\
e3e94686886450 Giuliano Procida   2025-04-16  67  				__alignof__(struct { _orig; }),		\
e3e94686886450 Giuliano Procida   2025-04-16  68  			FILE_LINE ": " __stringify(_orig)		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  69  				" is not aligned the same as "		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  70  				__stringify(_new));			\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  71  	}
804873a198f8dc Greg Kroah-Hartman 2020-03-11  72  

:::::: The code at line 65 was first introduced by commit
:::::: e3e946868864503f88b95a0d8ffe6d61b7df82d6 ANDROID: update KABI macros for gendwarfksyms

:::::: TO: Giuliano Procida <gprocida@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
