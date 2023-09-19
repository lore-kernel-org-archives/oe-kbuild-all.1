Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A565747C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695145023; x=1726681023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3gtIgs2nkCrnMeEe7PnkMp8yCVslyABLVYvv/JCSCHY=;
  b=J9Ir6vs3bY0RxnIPlM6Pys6MAjRMON5JWqXJF38Fu1rDEdKzyUsJ7yft
   zzDa1HBcFt1mQ2d1uqN7OG7XuH1POwnJhotflIW3zDY4bFTewq7cKyWt1
   OhwNMLpGG32yNhtoJg8vlbsnBrOfcg50fs88s6sXhWn135SobovYGDth+
   LgymjixyE3a9L7/9fI7y9Vlly7FSDILiqACCKHbmKlkjRcipEfuMdKXXD
   0XFQEnJXgD0SAKXCJblI8WnPF6UlP3Sa78b6O9n5sagj/G0hFILq2ixoL
   hXGRkpjnKnWn6xX/uBSRsI+GhdnsPQhAJ3v8eLqslZnkhcMtdjoj+9eEl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444096905"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="444096905"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 10:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749571195"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="749571195"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 10:37:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qieeg-0007ki-2F;
	Tue, 19 Sep 2023 17:36:58 +0000
Date: Wed, 20 Sep 2023 01:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4236/6333]
 fs/bcachefs/journal_seq_blacklist.c:176:64: warning: array subscript
 '(unsigned int) _33 + 4294967295' is outside the bounds of an interior
 zero-length array 'struct journal_seq_blacklist_entry[0]'
Message-ID: <202309200103.grXWDKTx-lkp@intel.com>
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
commit: 9a3dedfe50c12acbbea714a7e88dde7ede69290f [4236/6333] bcachefs: Array bounds fixes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200103.grXWDKTx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200103.grXWDKTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200103.grXWDKTx-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from fs/bcachefs/bcachefs.h:186:
   fs/bcachefs/journal_seq_blacklist.c:53:34: warning: array subscript 4294967294 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.c:54:34: warning: array subscript 4294967295 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.c:55:45: warning: array subscript 4294967295 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
      55 |                 bl->start[i].end = bl->start[i + 1].end;
         |                                    ~~~~~~~~~^~~~~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:55:26: warning: array subscript 4294967294 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.c:57:25: warning: array subscript 4294967294 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.c:58:25: warning: array subscript 4294967295 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_sb_journal_seq_blacklist_validate':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_sb_journal_seq_blacklist_to_text' at fs/bcachefs/journal_seq_blacklist.c:228:16:
   fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_sb_journal_seq_blacklist_to_text':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_blacklist_table_initialize' at fs/bcachefs/journal_seq_blacklist.c:163:19:
   fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_blacklist_table_initialize':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
>> fs/bcachefs/journal_seq_blacklist.c:176:64: warning: array subscript '(unsigned int) _33 + 4294967295' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.c:177:64: warning: array subscript '(unsigned int) _33 + 4294967295' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
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
   fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_journal_seq_blacklist_add':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
>> fs/bcachefs/journal_seq_blacklist.c:110:18: warning: array subscript 'i' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     110 |         bl->start[nr].start     = cpu_to_le64(start);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   fs/bcachefs/journal_seq_blacklist.c:111:18: warning: array subscript 'i' is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
     111 |         bl->start[nr].end       = cpu_to_le64(end);
         |         ~~~~~~~~~^~~~
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~
   In function 'blacklist_nr_entries',
       inlined from 'bch2_blacklist_entries_gc' at fs/bcachefs/journal_seq_blacklist.c:290:7:
   fs/bcachefs/journal_seq_blacklist.h:9:56: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct journal_seq_blacklist_entry[0]' [-Wzero-length-bounds]
       9 |                 ? ((vstruct_end(&bl->field) - (void *) &bl->start[0]) /
         |                                                        ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_blacklist_entries_gc':
   fs/bcachefs/bcachefs_format.h:1566:44: note: while referencing 'start'
    1566 |         struct journal_seq_blacklist_entry start[0];
         |                                            ^~~~~


vim +176 fs/bcachefs/journal_seq_blacklist.c

51249d03060513 Kent Overstreet 2022-01-04   74  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   75  int bch2_journal_seq_blacklist_add(struct bch_fs *c, u64 start, u64 end)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   76  {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   77  	struct bch_sb_field_journal_seq_blacklist *bl;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   78  	unsigned i, nr;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   79  	int ret = 0;
e0750d9473522d Kent Overstreet 2017-03-16   80  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   81  	mutex_lock(&c->sb_lock);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   82  	bl = bch2_sb_get_journal_seq_blacklist(c->disk_sb.sb);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  @83  	nr = blacklist_nr_entries(bl);
e0750d9473522d Kent Overstreet 2017-03-16   84  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   85  	for (i = 0; i < nr; i++) {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   86  		struct journal_seq_blacklist_entry *e =
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   87  			bl->start + i;
e0750d9473522d Kent Overstreet 2017-03-16   88  
51249d03060513 Kent Overstreet 2022-01-04   89  		if (bl_entry_contig_or_overlaps(e, start, end)) {
51249d03060513 Kent Overstreet 2022-01-04   90  			e->start = cpu_to_le64(min(start, le64_to_cpu(e->start)));
51249d03060513 Kent Overstreet 2022-01-04   91  			e->end	= cpu_to_le64(max(end, le64_to_cpu(e->end)));
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   92  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   93  			if (i + 1 < nr)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   94  				bl = blacklist_entry_try_merge(c,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   95  							bl, i);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   96  			if (i)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   97  				bl = blacklist_entry_try_merge(c,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   98  							bl, i - 1);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04   99  			goto out_write_sb;
e0750d9473522d Kent Overstreet 2017-03-16  100  		}
e0750d9473522d Kent Overstreet 2017-03-16  101  	}
e0750d9473522d Kent Overstreet 2017-03-16  102  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  103  	bl = bch2_sb_resize_journal_seq_blacklist(&c->disk_sb,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  104  					sb_blacklist_u64s(nr + 1));
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  105  	if (!bl) {
dd5ce1e55fc983 Kent Overstreet 2023-03-14  106  		ret = -BCH_ERR_ENOSPC_sb_journal_seq_blacklist;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  107  		goto out;
e0750d9473522d Kent Overstreet 2017-03-16  108  	}
e0750d9473522d Kent Overstreet 2017-03-16  109  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04 @110  	bl->start[nr].start	= cpu_to_le64(start);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  111  	bl->start[nr].end	= cpu_to_le64(end);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  112  out_write_sb:
539caa353e671b Kent Overstreet 2021-05-23  113  	c->disk_sb.sb->features[0] |= cpu_to_le64(1ULL << BCH_FEATURE_journal_seq_blacklist_v3);
e0750d9473522d Kent Overstreet 2017-03-16  114  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  115  	ret = bch2_write_super(c);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  116  out:
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  117  	mutex_unlock(&c->sb_lock);
e0750d9473522d Kent Overstreet 2017-03-16  118  
b3caa4f1f7ea8e Kent Overstreet 2020-11-14  119  	return ret ?: bch2_blacklist_table_initialize(c);
e0750d9473522d Kent Overstreet 2017-03-16  120  }
e0750d9473522d Kent Overstreet 2017-03-16  121  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  122  static int journal_seq_blacklist_table_cmp(const void *_l,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  123  					   const void *_r, size_t size)
e0750d9473522d Kent Overstreet 2017-03-16  124  {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  125  	const struct journal_seq_blacklist_table_entry *l = _l;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  126  	const struct journal_seq_blacklist_table_entry *r = _r;
e0750d9473522d Kent Overstreet 2017-03-16  127  
5049ecf31eb1f6 Kent Overstreet 2019-04-12  128  	return cmp_int(l->start, r->start);
e0750d9473522d Kent Overstreet 2017-03-16  129  }
e0750d9473522d Kent Overstreet 2017-03-16  130  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  131  bool bch2_journal_seq_is_blacklisted(struct bch_fs *c, u64 seq,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  132  				     bool dirty)
e0750d9473522d Kent Overstreet 2017-03-16  133  {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  134  	struct journal_seq_blacklist_table *t = c->journal_seq_blacklist_table;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  135  	struct journal_seq_blacklist_table_entry search = { .start = seq };
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  136  	int idx;
e0750d9473522d Kent Overstreet 2017-03-16  137  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  138  	if (!t)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  139  		return false;
e0750d9473522d Kent Overstreet 2017-03-16  140  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  141  	idx = eytzinger0_find_le(t->entries, t->nr,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  142  				 sizeof(t->entries[0]),
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  143  				 journal_seq_blacklist_table_cmp,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  144  				 &search);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  145  	if (idx < 0)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  146  		return false;
e0750d9473522d Kent Overstreet 2017-03-16  147  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  148  	BUG_ON(t->entries[idx].start > seq);
e0750d9473522d Kent Overstreet 2017-03-16  149  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  150  	if (seq >= t->entries[idx].end)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  151  		return false;
e0750d9473522d Kent Overstreet 2017-03-16  152  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  153  	if (dirty)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  154  		t->entries[idx].dirty = true;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  155  	return true;
e0750d9473522d Kent Overstreet 2017-03-16  156  }
e0750d9473522d Kent Overstreet 2017-03-16  157  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  158  int bch2_blacklist_table_initialize(struct bch_fs *c)
e0750d9473522d Kent Overstreet 2017-03-16  159  {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  160  	struct bch_sb_field_journal_seq_blacklist *bl =
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  161  		bch2_sb_get_journal_seq_blacklist(c->disk_sb.sb);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  162  	struct journal_seq_blacklist_table *t;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04 @163  	unsigned i, nr = blacklist_nr_entries(bl);
e0750d9473522d Kent Overstreet 2017-03-16  164  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  165  	if (!bl)
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  166  		return 0;
e0750d9473522d Kent Overstreet 2017-03-16  167  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  168  	t = kzalloc(sizeof(*t) + sizeof(t->entries[0]) * nr,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  169  		    GFP_KERNEL);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  170  	if (!t)
dd5ce1e55fc983 Kent Overstreet 2023-03-14  171  		return -BCH_ERR_ENOMEM_blacklist_table_init;
e0750d9473522d Kent Overstreet 2017-03-16  172  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  173  	t->nr = nr;
e0750d9473522d Kent Overstreet 2017-03-16  174  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  175  	for (i = 0; i < nr; i++) {
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04 @176  		t->entries[i].start	= le64_to_cpu(bl->start[i].start);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  177  		t->entries[i].end	= le64_to_cpu(bl->start[i].end);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  178  	}
e0750d9473522d Kent Overstreet 2017-03-16  179  
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  180  	eytzinger0_sort(t->entries,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  181  			t->nr,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  182  			sizeof(t->entries[0]),
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  183  			journal_seq_blacklist_table_cmp,
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  184  			NULL);
e0750d9473522d Kent Overstreet 2017-03-16  185  
b3caa4f1f7ea8e Kent Overstreet 2020-11-14  186  	kfree(c->journal_seq_blacklist_table);
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  187  	c->journal_seq_blacklist_table = t;
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  188  	return 0;
e0750d9473522d Kent Overstreet 2017-03-16  189  }
8b35d6a1e1f2a9 Kent Overstreet 2019-04-04  190  

:::::: The code at line 176 was first introduced by commit
:::::: 8b35d6a1e1f2a9b790744db7883cfc04814a73fb bcachefs: Rewrite journal_seq_blacklist machinery

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
