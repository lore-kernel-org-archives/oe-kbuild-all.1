Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E5339AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120785; x=1726656785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kH9cYkiwx4gHdyI6XAjUPtb76Rex1yjdbGgVHs5eTF8=;
  b=Zj2HZCbb3VhC9ksUqTWLUF2XHZWJpX3vTBoyyfyHe2GgtqxxNo9ShmKL
   xMdfSOGjDaSPhpzcbK5fWSRxwdRSavKWFc6abfYT8roegZI1xe+ZASqNh
   uzhbsvfLlf+D0mptbc/PY4mSvSfbIYDbQ0omzUy0WyYGXem8FmkjKBIq5
   ArGj1v0+nC5u6c2wN2DG+e3O3UGhv8/Brl9ooyw15AJTMNjPgIZQ0Pce9
   PA07qlP1TDeJB83EO8Ph7zoinfkaqEz0vwlyhGT9Sk7uiMLnbfoEGlYyx
   8NgwE9KoGzGta5nLa202ahmQLeKElQ2jqHvFu06EhWfwW1pTVSTX4Rfwq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379812931"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="379812931"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="993124114"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="993124114"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2023 03:53:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiYLk-0007Eq-33;
	Tue, 19 Sep 2023 10:53:00 +0000
Date: Tue, 19 Sep 2023 18:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1836/6333]
 fs/bcachefs/journal_seq_blacklist.c:159:26: warning: array subscript idx is
 outside array bounds of 'struct journal_seq_blacklist_table_entry[0]'
Message-ID: <202309191855.UhxeKA3r-lkp@intel.com>
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
commit: 8b35d6a1e1f2a9b790744db7883cfc04814a73fb [1836/6333] bcachefs: Rewrite journal_seq_blacklist machinery
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309191855.UhxeKA3r-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191855.UhxeKA3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191855.UhxeKA3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:767:1: note: in expansion of macro 'LE32_BITMASK'
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:767:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:767:1: note: in expansion of macro 'LE32_BITMASK'
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:767:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:767:1: note: in expansion of macro 'LE32_BITMASK'
     767 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:447:23: warning: 'bch_crc_bytes' defined but not used [-Wunused-const-variable=]
     447 | static const unsigned bch_crc_bytes[] = {
         |                       ^~~~~~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/alpha/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/alpha/include/asm/bitops.h:452,
                    from include/linux/bitops.h:68,
                    from include/linux/radix-tree.h:11,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:182:
   fs/bcachefs/journal_seq_blacklist.c: In function 'blacklist_entry_try_merge':
   fs/bcachefs/journal_seq_blacklist.c:62:34: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      62 |         if (le64_to_cpu(bl->start[i].end) >=
         |                         ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:62:13: note: in expansion of macro 'le64_to_cpu'
      62 |         if (le64_to_cpu(bl->start[i].end) >=
         |             ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:63:34: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      63 |             le64_to_cpu(bl->start[i + 1].start)) {
         |                         ~~~~~~~~~^~~~~~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:63:13: note: in expansion of macro 'le64_to_cpu'
      63 |             le64_to_cpu(bl->start[i + 1].start)) {
         |             ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:64:45: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      64 |                 bl->start[i].end = bl->start[i + 1].end;
         |                                    ~~~~~~~~~^~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:64:26: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      64 |                 bl->start[i].end = bl->start[i + 1].end;
         |                 ~~~~~~~~~^~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:66:25: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      66 |                 memmove(&bl->start[i],
         |                         ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:67:25: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
      67 |                         &bl->start[i + 1],
         |                         ^~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c: In function 'bch2_journal_seq_blacklist_add':
   fs/bcachefs/journal_seq_blacklist.c:120:18: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
     120 |         bl->start[nr].start     = cpu_to_le64(start);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:121:18: warning: array subscript <unknown> is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
     121 |         bl->start[nr].end       = cpu_to_le64(end);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/backing-dev-defs.h:5:
   fs/bcachefs/journal_seq_blacklist.c: In function 'bch2_journal_seq_is_blacklisted':
>> fs/bcachefs/journal_seq_blacklist.c:159:26: warning: array subscript idx is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     159 |         BUG_ON(t->entries[idx].start > seq);
         |                ~~~~~~~~~~^~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/bcachefs/journal_seq_blacklist.c:159:9: note: in expansion of macro 'BUG_ON'
     159 |         BUG_ON(t->entries[idx].start > seq);
         |         ^~~~~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:161:30: warning: array subscript idx is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     161 |         if (seq >= t->entries[idx].end)
         |                    ~~~~~~~~~~^~~~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:165:27: warning: array subscript idx is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     165 |                 t->entries[idx].dirty = true;
         |                 ~~~~~~~~~~^~~~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c: In function 'bch2_blacklist_table_initialize':
   fs/bcachefs/journal_seq_blacklist.c:189:64: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
     189 |                 t->entries[i].start     = le64_to_cpu(bl->start[i].start);
         |                                                       ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:189:43: note: in expansion of macro 'le64_to_cpu'
     189 |                 t->entries[i].start     = le64_to_cpu(bl->start[i].start);
         |                                           ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:189:27: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     189 |                 t->entries[i].start     = le64_to_cpu(bl->start[i].start);
         |                 ~~~~~~~~~~^~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:190:64: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_entry[0]' [-Warray-bounds=]
     190 |                 t->entries[i].end       = le64_to_cpu(bl->start[i].end);
         |                                                       ~~~~~~~~~^~~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: in definition of macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   fs/bcachefs/journal_seq_blacklist.c:190:43: note: in expansion of macro 'le64_to_cpu'
     190 |                 t->entries[i].end       = le64_to_cpu(bl->start[i].end);
         |                                           ^~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1137:52: note: while referencing 'start'
    1137 |                 struct journal_seq_blacklist_entry start[0];
         |                                                    ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:190:27: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     190 |                 t->entries[i].end       = le64_to_cpu(bl->start[i].end);
         |                 ~~~~~~~~~~^~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c: In function 'bch2_blacklist_entries_gc':
   fs/bcachefs/journal_seq_blacklist.c:294:34: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     294 |                 BUG_ON(t->entries[i].start      != le64_to_cpu(src->start));
         |                        ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/bcachefs/journal_seq_blacklist.c:294:17: note: in expansion of macro 'BUG_ON'
     294 |                 BUG_ON(t->entries[i].start      != le64_to_cpu(src->start));
         |                 ^~~~~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:295:34: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     295 |                 BUG_ON(t->entries[i].end        != le64_to_cpu(src->end));
         |                        ~~~~~~~~~~^~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/bcachefs/journal_seq_blacklist.c:295:17: note: in expansion of macro 'BUG_ON'
     295 |                 BUG_ON(t->entries[i].end        != le64_to_cpu(src->end));
         |                 ^~~~~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~
   fs/bcachefs/journal_seq_blacklist.c:297:31: warning: array subscript i is outside array bounds of 'struct journal_seq_blacklist_table_entry[0]' [-Warray-bounds=]
     297 |                 if (t->entries[i].dirty)
         |                     ~~~~~~~~~~^~~
   fs/bcachefs/bcachefs.h:522:33: note: while referencing 'entries'
     522 |         }                       entries[0];
         |                                 ^~~~~~~


vim +159 fs/bcachefs/journal_seq_blacklist.c

   141	
   142	bool bch2_journal_seq_is_blacklisted(struct bch_fs *c, u64 seq,
   143					     bool dirty)
   144	{
   145		struct journal_seq_blacklist_table *t = c->journal_seq_blacklist_table;
   146		struct journal_seq_blacklist_table_entry search = { .start = seq };
   147		int idx;
   148	
   149		if (!t)
   150			return false;
   151	
   152		idx = eytzinger0_find_le(t->entries, t->nr,
   153					 sizeof(t->entries[0]),
   154					 journal_seq_blacklist_table_cmp,
   155					 &search);
   156		if (idx < 0)
   157			return false;
   158	
 > 159		BUG_ON(t->entries[idx].start > seq);
   160	
   161		if (seq >= t->entries[idx].end)
   162			return false;
   163	
   164		if (dirty)
   165			t->entries[idx].dirty = true;
   166		return true;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
