Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD48F60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694524113; x=1726060113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkE8lG82EDJN09NJ3o1sQAiZvur1P55NKmgigQmEeN8=;
  b=FGriSbbI+DOtJEb1QX6M9IeenhJPUlHYqdccfVQIRAAT6yXNkXP/2UAk
   8YX7SBJ4BV0TuiYsCRpBcTTkceOX/89x/YOA3dCHWCCZcJcnfrI0gKiDC
   pXSj+9GTg5pb13h2q/cA+rLuD7UTIRtECZkFjUQlFx/oBvLSd5YleR1Fp
   4SI/0Yl5zCRzqqNNmPTfSfls94G2/mQiuSZTxp8AHzpGZ4evvJeylt3NV
   kc91ibjejGQ3N3m5tT5pUH7iMAHs9D29xQ70pI8vthaCVW6moT3b+icP5
   6sGf7dG/9PftvzPIqpOXgDA+2KWyNZcl8nhgvlRRDQ78BthcxbCtDp+hW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="409323464"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="409323464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 06:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743717625"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="743717625"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 06:07:58 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg37T-0000PD-2M;
	Tue, 12 Sep 2023 13:07:55 +0000
Date: Tue, 12 Sep 2023 21:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4491/4552] include/linux/fortify-string.h:57:33:
 warning: writing 8 bytes into a region of size 0
Message-ID: <202309122155.dteFhtkC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 977590f1aca51242a59e24bb9a50285107f29a98 [4491/4552] Merge branch 'for-next' of https://evilpiepirate.org/git/bcachefs.git
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122155.dteFhtkC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122155.dteFhtkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122155.dteFhtkC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186:
   In function 'bch2_bkey_append_ptr',
       inlined from 'bch2_alloc_sectors_append_ptrs_inlined' at fs/bcachefs/alloc_foreground.h:194:3:
>> include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:645:17: note: in expansion of macro 'memcpy'
     645 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_alloc_sectors_append_ptrs_inlined':
   fs/bcachefs/bcachefs_format.h:303:25: note: destination object 'v' of size 0
     303 |         struct bch_val  v;
         |                         ^
--
   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186:
   In function 'bch2_bkey_append_ptr',
       inlined from 'bch2_alloc_sectors_append_ptrs_inlined' at fs/bcachefs/alloc_foreground.h:194:3:
>> include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:645:17: note: in expansion of macro 'memcpy'
     645 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_alloc_sectors_append_ptrs_inlined':
   fs/bcachefs/bcachefs_format.h:303:25: note: destination object 'v' of size 0
     303 |         struct bch_val  v;
         |                         ^
--
   fs/bcachefs/bcachefs_format.h:870:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:869:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:869:1: note: in expansion of macro 'LE32_BITMASK'
     869 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:868:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:868:1: note: in expansion of macro 'LE32_BITMASK'
     868 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:678:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:678:1: note: in expansion of macro 'LE16_BITMASK'
     678 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186:
   In function 'bch2_bkey_append_ptr',
       inlined from '__journal_write_alloc' at fs/bcachefs/journal_io.c:1363:3:
>> include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:648:9: note: in expansion of macro '__underlying_memcpy'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:693:26: note: in expansion of macro '__fortify_memcpy_chk'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:645:17: note: in expansion of macro 'memcpy'
     645 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~
   fs/bcachefs/bcachefs_format.h: In function '__journal_write_alloc':
   fs/bcachefs/bcachefs_format.h:303:25: note: destination object 'v' of size 0
     303 |         struct bch_val  v;
         |                         ^


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
