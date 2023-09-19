Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056F8817
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695138208; x=1726674208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTIBZjZ0+0qojH7Z9+btdzh6NU0coCBnEDug9co80YQ=;
  b=MuBJXRzrjqo8rWxxS8ku5qCzXJ2rluS2iWa9Q9JRuylqU7lTzyeO/u2e
   yMgrKNSNyjqt3n3ZgDDsGGtGhxgGsIco3RRoD68qzw1X3iaUuIMDgmvfc
   +FKKSEhBjkTSI6AO7MV8zTCQQWBcUkyqBLy6pi2g/Jz40cLg7S/xHRMgY
   sixFq1/ZxtC4Vg76n0y4toMlnhBplrEKWeA5cEPB9CtlB55IuM5Yn/wIs
   yHyOBzWAYVQTHVkzQWlyl8YVJIn3Tj8lNIRP2sE2O1zmhIdxSnBW6xft+
   /GZqh6sKo87wSHDslTSviR8xxUA8oW1Q88KKhqmmLrExMLnn6H4vRmC3o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370290175"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370290175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739762231"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="739762231"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 08:40:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qicpp-0007ZL-2w;
	Tue, 19 Sep 2023 15:40:21 +0000
Date: Tue, 19 Sep 2023 23:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1231/4552] include/linux/fortify-string.h:57:33:
 warning: writing 8 bytes into a region of size 0
Message-ID: <202309192314.VBsjiIm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: b2be0f6ff6f11af9c6572381fd4820740ba2a8b4 [1231/4552] bcachefs: Make bkey types globally unique
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192314.VBsjiIm5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192314.VBsjiIm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192314.VBsjiIm5-lkp@intel.com/

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:912:14: warning: 'BCH_MEMBER_REPLACEMENT_MAX' defined but not used [-Wunused-const-variable=]
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:912:1: note: in expansion of macro 'LE64_BITMASK'
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:912:14: warning: 'BCH_MEMBER_REPLACEMENT_BITS' defined but not used [-Wunused-const-variable=]
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:912:1: note: in expansion of macro 'LE64_BITMASK'
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:912:14: warning: 'BCH_MEMBER_REPLACEMENT_OFFSET' defined but not used [-Wunused-const-variable=]
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:912:1: note: in expansion of macro 'LE64_BITMASK'
     912 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:910:14: warning: 'BCH_MEMBER_STATE_MAX' defined but not used [-Wunused-const-variable=]
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:910:1: note: in expansion of macro 'LE64_BITMASK'
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:910:14: warning: 'BCH_MEMBER_STATE_BITS' defined but not used [-Wunused-const-variable=]
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:910:1: note: in expansion of macro 'LE64_BITMASK'
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:910:14: warning: 'BCH_MEMBER_STATE_OFFSET' defined but not used [-Wunused-const-variable=]
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:910:1: note: in expansion of macro 'LE64_BITMASK'
     910 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:757:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:757:1: note: in expansion of macro 'LE32_BITMASK'
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:757:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:757:1: note: in expansion of macro 'LE32_BITMASK'
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:757:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:757:1: note: in expansion of macro 'LE32_BITMASK'
     757 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:756:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     756 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:756:1: note: in expansion of macro 'LE32_BITMASK'
     756 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:182:
   fs/bcachefs/extents.c: In function 'bch2_bkey_append_ptr':
>> include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.c:235:17: note: in expansion of macro 'memcpy'
     235 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~
   fs/bcachefs/bcachefs_format.h:287:33: note: destination object 'v' of size 0
     287 |                 struct bch_val  v;
         |                                 ^


vim +57 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  46  
78a498c3a227f2 Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_MEMORY__)
78a498c3a227f2 Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2 Alexander Potapenko 2022-10-24  49   * For KMSAN builds all memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2 Alexander Potapenko 2022-10-24  50   * corresponding __msan_XXX functions.
78a498c3a227f2 Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2 Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_string.h>
78a498c3a227f2 Alexander Potapenko 2022-10-24  53  #define __underlying_memcpy	__msan_memcpy
78a498c3a227f2 Alexander Potapenko 2022-10-24  54  #define __underlying_memmove	__msan_memmove
78a498c3a227f2 Alexander Potapenko 2022-10-24  55  #define __underlying_memset	__msan_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf2 Francis Laniel      2021-02-25 @57  #define __underlying_memcpy	__builtin_memcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  58  #define __underlying_memmove	__builtin_memmove
a28a6e860c6cf2 Francis Laniel      2021-02-25  59  #define __underlying_memset	__builtin_memset
78a498c3a227f2 Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2 Alexander Potapenko 2022-10-24  61  

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
