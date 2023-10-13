Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB0B1D54C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPmEZ8RX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697225488; x=1728761488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiQnu3cAsfaNOoqv99j4/OFMHLDpECF7vtKlGzB7IOs=;
  b=gPmEZ8RXVCrubLJRxdIaftD7pKTYOr8v5PzKk2zOv3BskvAjIn3cylhh
   Ghfa9H9dF8l9Y/YizyQt7r/TSjyvYBdJNgCEWfPxUB53tOLWzrorGXTVJ
   rdoXPuNvgnBiZEBKA+D92e4pHPS1SPXAbFofSucO1BxFowBLjCAj97d6t
   jZaTMlz9MIsJCs1nDU2AVmBmkqw7gULjbjSwIqrw4g9TY7WCNUzYy8yDZ
   suBkplpffW6rJILvWXlbx6Zi1ZU34ubzJ7bdS+punZsDGTi1hA4AY1hNn
   VaNq++BtXW0vGQgQSPwL3JIL11JnLMYnTz99EJfXuUXsWfdZFIczSM1Hd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385087484"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="385087484"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871202136"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871202136"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 12:31:25 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNsZ-0005JV-0w;
	Fri, 13 Oct 2023 19:31:23 +0000
Date: Sat, 14 Oct 2023 03:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3438/12130] fs/bcachefs/extents.h:603:17:
 warning: writing 8 bytes into a region of size 0
Message-ID: <202310140301.H2JW530r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: 8e5a01b126198f3325cbb48efd8dd028beca0672 [3438/12130] bcachefs: Better inlining in core write path
config: powerpc64-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140301.H2JW530r-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140301.H2JW530r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140301.H2JW530r-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:812:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/buckets.h:12,
                    from fs/bcachefs/alloc_background.h:7,
                    from fs/bcachefs/io.c:10:
   In function 'bch2_bkey_append_ptr',
       inlined from 'bch2_alloc_sectors_append_ptrs_inlined' at fs/bcachefs/alloc_foreground.h:194:3,
       inlined from 'init_append_extent' at fs/bcachefs/io.c:835:2:
>> fs/bcachefs/extents.h:603:17: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
     603 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     604 |                        &ptr,
         |                        ~~~~~
     605 |                        sizeof(ptr));
         |                        ~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'init_append_extent':
   fs/bcachefs/bcachefs_format.h:304:33: note: destination object 'v' of size 0
     304 |                 struct bch_val  v;
         |                                 ^
   fs/bcachefs/io.c: In function 'bch2_write_data_inline':
   fs/bcachefs/io.c:1368:40: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    1368 |                 id->v.data[data_len++] = '\0';
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   fs/bcachefs/bcachefs_format.h:1029:33: note: at offset [1, 4294967295] into destination object 'data' of size 0
    1029 |         u8                      data[0];
         |                                 ^~~~
--
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:812:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/buckets.h:12,
                    from fs/bcachefs/alloc_background.h:7,
                    from fs/bcachefs/alloc_foreground.c:15:
   In function 'bch2_bkey_append_ptr',
       inlined from 'bch2_alloc_sectors_append_ptrs_inlined' at fs/bcachefs/alloc_foreground.h:194:3,
       inlined from 'bch2_alloc_sectors_append_ptrs' at fs/bcachefs/alloc_foreground.c:1251:2:
>> fs/bcachefs/extents.h:603:17: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
     603 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     604 |                        &ptr,
         |                        ~~~~~
     605 |                        sizeof(ptr));
         |                        ~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function 'bch2_alloc_sectors_append_ptrs':
   fs/bcachefs/bcachefs_format.h:304:33: note: destination object 'v' of size 0
     304 |                 struct bch_val  v;
         |                                 ^
--
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:812:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:812:1: note: in expansion of macro 'LE32_BITMASK'
     812 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:811:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:811:1: note: in expansion of macro 'LE32_BITMASK'
     811 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:810:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:810:1: note: in expansion of macro 'LE32_BITMASK'
     810 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:662:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:662:1: note: in expansion of macro 'LE16_BITMASK'
     662 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/buckets.h:12,
                    from fs/bcachefs/alloc_background.h:7,
                    from fs/bcachefs/journal_io.c:3:
   In function 'bch2_bkey_append_ptr',
       inlined from '__journal_write_alloc.part.0' at fs/bcachefs/journal_io.c:1347:3:
>> fs/bcachefs/extents.h:603:17: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
     603 |                 memcpy((void *) &k->v + bkey_val_bytes(&k->k),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     604 |                        &ptr,
         |                        ~~~~~
     605 |                        sizeof(ptr));
         |                        ~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h: In function '__journal_write_alloc.part.0':
   fs/bcachefs/bcachefs_format.h:304:33: note: destination object 'v' of size 0
     304 |                 struct bch_val  v;
         |                                 ^


vim +603 fs/bcachefs/extents.h

   590	
   591	static inline void bch2_bkey_append_ptr(struct bkey_i *k, struct bch_extent_ptr ptr)
   592	{
   593		EBUG_ON(bch2_bkey_has_device(bkey_i_to_s_c(k), ptr.dev));
   594	
   595		switch (k->k.type) {
   596		case KEY_TYPE_btree_ptr:
   597		case KEY_TYPE_btree_ptr_v2:
   598		case KEY_TYPE_extent:
   599			EBUG_ON(bkey_val_u64s(&k->k) >= BKEY_EXTENT_VAL_U64s_MAX);
   600	
   601			ptr.type = 1 << BCH_EXTENT_ENTRY_ptr;
   602	
 > 603			memcpy((void *) &k->v + bkey_val_bytes(&k->k),
   604			       &ptr,
   605			       sizeof(ptr));
   606			k->u64s++;
   607			break;
   608		default:
   609			BUG();
   610		}
   611	}
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
