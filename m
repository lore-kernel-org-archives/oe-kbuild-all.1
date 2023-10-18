Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E93B2B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8EYEXPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697644507; x=1729180507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UOCeboPpxhsi9wRMwuwwTs6M5vpirLXn1bDYlGZ5dY=;
  b=k8EYEXPaAPlZuksewrw9S65uewjT5pexe/HN23W2KAXaxwomDnIjaiip
   kdlv20OpyZ9RVBNKe4SILLGedC5sUXeYWKwFUSNcGLsdUbvnmMV3/rhQJ
   mlBq10XxeqRmPPv8rHpcyKEHUUvYKGkqzSXX9lR0eUDTl/aKmT5qB/Rek
   tRH2NvDs6iMJGVt1IBQdgFHzRW0wgbZT+KoaL4SlyWUsugknU2eCwortO
   6WqL0tiKrFvTAyNN4rvE6IOqTgcVljSzZQxkVCAx/RVm1eLxPwjCQIp8A
   y6hNPSjCQ3GfzYSfhpnN5khxyFW7XydHv01L70rQY+dWAu43IIyCXnLaO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7594200"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="7594200"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 08:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791666563"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="791666563"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 08:55:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt8sw-0000c1-0F;
	Wed, 18 Oct 2023 15:55:02 +0000
Date: Wed, 18 Oct 2023 23:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3910/13299]
 fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is
 outside the bounds of an interior zero-length array 'struct
 journal_seq_blacklist_entry[0]'
Message-ID: <202310182303.V3tTgNQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 9a3dedfe50c12acbbea714a7e88dde7ede69290f [3910/13299] bcachefs: Array bounds fixes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231018/202310182303.V3tTgNQZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182303.V3tTgNQZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182303.V3tTgNQZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:870:1: note: in expansion of macro 'LE32_BITMASK'
     870 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
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
   In file included from fs/bcachefs/journal_seq_blacklist.c:6:
   In function 'blacklist_nr_entries',
       inlined from 'blacklist_entry_try_merge' at fs/bcachefs/journal_seq_blacklist.c:51:16:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'blacklist_entry_try_merge':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:428,
                    from include/linux/bitops.h:68,
                    from include/linux/radix-tree.h:11,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:186:
   fs/bcachefs/journal_seq_blacklist.c:53:34: warning: array subscript 268435454 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      53 |         if (le64_to_cpu(bl->start[i].end) >=
         |                         ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:53:13: note: in expansion of macro 'le64_to_cpu'
      53 |         if (le64_to_cpu(bl->start[i].end) >=
         |             ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:54:34: warning: array subscript 268435455 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      54 |             le64_to_cpu(bl->start[i + 1].start)) {
         |                         ~~~~~~~~~^~~~~~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:54:13: note: in expansion of macro 'le64_to_cpu'
      54 |             le64_to_cpu(bl->start[i + 1].start)) {
         |             ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:55:45: warning: array subscript 268435455 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      55 |                 bl->start[i].end = bl->start[i + 1].end;
         |                                    ~~~~~~~~~^~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:55:26: warning: array subscript 268435454 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      55 |                 bl->start[i].end = bl->start[i + 1].end;
         |                 ~~~~~~~~~^~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14:
   fs/bcachefs/journal_seq_blacklist.c:57:25: warning: array subscript 268435454 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      57 |                 memmove(&bl->start[i],
         |                         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:637:34: note: in definition of macro '__fortify_memcpy_chk'
     637 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:698:17: note: in expansion of macro '__struct_size'
     698 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:57:17: note: in expansion of macro 'memmove'
      57 |                 memmove(&bl->start[i],
         |                 ^~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:58:25: warning: array subscript 268435455 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      58 |                         &bl->start[i + 1],
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:638:34: note: in definition of macro '__fortify_memcpy_chk'
     638 |         const size_t __q_size = (q_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:698:35: note: in expansion of macro '__struct_size'
     698 |                 __struct_size(p), __struct_size(q),                     \
         |                                   ^~~~~~~~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:57:17: note: in expansion of macro 'memmove'
      57 |                 memmove(&bl->start[i],
         |                 ^~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_sb_journal_seq_blacklist_validate' at fs/bcachefs/journal_seq_blacklist.c:197:19:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_sb_journal_seq_blacklist_validate':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_sb_journal_seq_blacklist_to_text' at fs/bcachefs/journal_seq_blacklist.c:228:16:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_sb_journal_seq_blacklist_to_text':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_blacklist_table_initialize' at fs/bcachefs/journal_seq_blacklist.c:163:19:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_blacklist_table_initialize':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:176:64: warning: array subscript 268435454 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     176 |                 t->entries[i].start     = le64_to_cpu(bl->start[i].start);
         |                                                       ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:176:43: note: in expansion of macro 'le64_to_cpu'
     176 |                 t->entries[i].start     = le64_to_cpu(bl->start[i].start);
         |                                           ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:177:64: warning: array subscript 268435454 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     177 |                 t->entries[i].end       = le64_to_cpu(bl->start[i].end);
         |                                                       ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:177:43: note: in expansion of macro 'le64_to_cpu'
     177 |                 t->entries[i].end       = le64_to_cpu(bl->start[i].end);
         |                                           ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_journal_seq_blacklist_add' at fs/bcachefs/journal_seq_blacklist.c:83:7:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_journal_seq_blacklist_add':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:110:18: warning: array subscript 268435455 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     110 |         bl->start[nr].start     = cpu_to_le64(start);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:111:18: warning: array subscript 268435455 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     111 |         bl->start[nr].end       = cpu_to_le64(end);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_blacklist_entries_gc' at fs/bcachefs/journal_seq_blacklist.c:290:7:
>> fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_blacklist_entries_gc':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~


vim +9 fs/bcachefs/journal_seq_blacklist.h

e0750d9473522d Kent Overstreet 2017-03-16   4  
88e2c35339fd57 Kent Overstreet 2020-08-04   5  static inline unsigned
88e2c35339fd57 Kent Overstreet 2020-08-04   6  blacklist_nr_entries(struct bch_sb_field_journal_seq_blacklist *bl)
88e2c35339fd57 Kent Overstreet 2020-08-04   7  {
88e2c35339fd57 Kent Overstreet 2020-08-04   8  	return bl
88e2c35339fd57 Kent Overstreet 2020-08-04  @9  		? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
88e2c35339fd57 Kent Overstreet 2020-08-04  10  		   sizeof(struct journal_seq_blacklist_entry))
88e2c35339fd57 Kent Overstreet 2020-08-04  11  		: 0;
88e2c35339fd57 Kent Overstreet 2020-08-04  12  }
88e2c35339fd57 Kent Overstreet 2020-08-04  13  

:::::: The code at line 9 was first introduced by commit
:::::: 88e2c35339fd57d1f31cad7edd3a306969093298 bcachefs: Fix a bug with the journal_seq_blacklist mechanism

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
