Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438617C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2rPi1zQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697692734; x=1729228734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4yt9kZjz/7b57gVp2B5mVIi4GR08QZprpvbwym78wuE=;
  b=e2rPi1zQOTMLQQs82PoSZBGKPZmsg50ByhCVFFjMhkwdYf9dnAnfZ1bY
   6Q2IeptmOW5YTtECQvYtSNsxAAhgCkxzAC9EBJY3l2x5bn7ddgUzf59WX
   cuLl/DaLtzc+aOHu0l94mAG+f5UmzFMaoBc72sbmff5OG79yrS+G7mbsS
   rPkKVanjh6zzOQogzaGycxVXBBwtYrk7qAGJ2xOJoG9G78FebSAg5yGPT
   4y0rsu784JsdQnAAuPkjIOaFRvzTSAZ4jTvHSDRYUjFSevlpzE8E8mv4K
   7/RXCVIW8V06wTs4K3CeVJgtt6qnePzxyx7bWw9ZqehqI0+yb4vYj0djl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452644694"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452644694"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 22:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756866214"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="756866214"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Oct 2023 22:18:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtLQn-0001fc-1F;
	Thu, 19 Oct 2023 05:18:49 +0000
Date: Thu, 19 Oct 2023 13:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3521/13299] fs/bcachefs/extents.h:54:26: warning:
 array subscript 'const union bch_extent_entry[0]' is partly outside array
 bounds of 'struct bch_extent_stripe_ptr[1]'
Message-ID: <202310191301.QrQ2ba0o-lkp@intel.com>
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
commit: 28ff311e7190d11fc629a558705f90720d8b562a [3521/13299] bcachefs: Fix buffer overrun in ec_stripe_update_extent()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231019/202310191301.QrQ2ba0o-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191301.QrQ2ba0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191301.QrQ2ba0o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:857:1: note: in expansion of macro 'LE32_BITMASK'
     857 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:857:14: warning: 'INODE_NEW_VARINT_OFFSET' defined but not used [-Wunused-const-variable=]
     857 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:857:1: note: in expansion of macro 'LE32_BITMASK'
     857 | LE32_BITMASK(INODE_NEW_VARINT,  struct bch_inode, bi_flags, 31, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:856:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:856:1: note: in expansion of macro 'LE32_BITMASK'
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:856:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:856:1: note: in expansion of macro 'LE32_BITMASK'
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:856:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:856:1: note: in expansion of macro 'LE32_BITMASK'
     856 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 31);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:855:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:855:1: note: in expansion of macro 'LE32_BITMASK'
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:855:14: warning: 'INODE_STR_HASH_BITS' defined but not used [-Wunused-const-variable=]
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:855:1: note: in expansion of macro 'LE32_BITMASK'
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:855:14: warning: 'INODE_STR_HASH_OFFSET' defined but not used [-Wunused-const-variable=]
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:855:1: note: in expansion of macro 'LE32_BITMASK'
     855 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:665:14: warning: 'BTREE_PTR_RANGE_UPDATED_MAX' defined but not used [-Wunused-const-variable=]
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:103:25: note: in definition of macro 'LE_BITMASK'
     103 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:665:1: note: in expansion of macro 'LE16_BITMASK'
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:665:14: warning: 'BTREE_PTR_RANGE_UPDATED_BITS' defined but not used [-Wunused-const-variable=]
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:102:25: note: in definition of macro 'LE_BITMASK'
     102 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:665:1: note: in expansion of macro 'LE16_BITMASK'
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:665:14: warning: 'BTREE_PTR_RANGE_UPDATED_OFFSET' defined but not used [-Wunused-const-variable=]
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:101:25: note: in definition of macro 'LE_BITMASK'
     101 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:665:1: note: in expansion of macro 'LE16_BITMASK'
     665 | LE16_BITMASK(BTREE_PTR_RANGE_UPDATED,   struct bch_btree_ptr_v2, flags, 0, 1);
         | ^~~~~~~~~~~~
   In file included from fs/bcachefs/alloc_foreground.h:7,
                    from fs/bcachefs/ec.c:6:
   In function 'extent_entry_type',
       inlined from 'extent_entry_bytes' at fs/bcachefs/extents.h:63:10,
       inlined from 'extent_entry_u64s' at fs/bcachefs/extents.h:76:9,
       inlined from '__extent_entry_insert' at fs/bcachefs/extents.h:85:38,
       inlined from 'ec_stripe_update_extent' at fs/bcachefs/ec.c:936:2:
>> fs/bcachefs/extents.h:54:26: warning: array subscript 'const union bch_extent_entry[0]' is partly outside array bounds of 'struct bch_extent_stripe_ptr[1]' [-Warray-bounds=]
      54 |         int ret = __ffs(e->type);
         |                         ~^~~~~~
   fs/bcachefs/ec.c: In function 'ec_stripe_update_extent':
   fs/bcachefs/ec.c:879:38: note: object 'stripe_ptr' of size 8
     879 |         struct bch_extent_stripe_ptr stripe_ptr;
         |                                      ^~~~~~~~~~
   In function 'extent_entry_type',
       inlined from 'extent_entry_bytes' at fs/bcachefs/extents.h:63:10,
       inlined from 'extent_entry_u64s' at fs/bcachefs/extents.h:76:9,
       inlined from '__extent_entry_insert' at fs/bcachefs/extents.h:87:15,
       inlined from 'ec_stripe_update_extent' at fs/bcachefs/ec.c:936:2:
>> fs/bcachefs/extents.h:54:26: warning: array subscript 'const union bch_extent_entry[0]' is partly outside array bounds of 'struct bch_extent_stripe_ptr[1]' [-Warray-bounds=]
      54 |         int ret = __ffs(e->type);
         |                         ~^~~~~~
   fs/bcachefs/ec.c: In function 'ec_stripe_update_extent':
   fs/bcachefs/ec.c:879:38: note: object 'stripe_ptr' of size 8
     879 |         struct bch_extent_stripe_ptr stripe_ptr;
         |                                      ^~~~~~~~~~
   In function 'extent_entry_type',
       inlined from 'extent_entry_bytes' at fs/bcachefs/extents.h:63:10,
       inlined from 'extent_entry_u64s' at fs/bcachefs/extents.h:76:9,
       inlined from '__extent_entry_insert' at fs/bcachefs/extents.h:88:2,
       inlined from 'ec_stripe_update_extent' at fs/bcachefs/ec.c:936:2:
>> fs/bcachefs/extents.h:54:26: warning: array subscript 'const union bch_extent_entry[0]' is partly outside array bounds of 'struct bch_extent_stripe_ptr[1]' [-Warray-bounds=]
      54 |         int ret = __ffs(e->type);
         |                         ~^~~~~~
   fs/bcachefs/ec.c: In function 'ec_stripe_update_extent':
   fs/bcachefs/ec.c:879:38: note: object 'stripe_ptr' of size 8
     879 |         struct bch_extent_stripe_ptr stripe_ptr;
         |                                      ^~~~~~~~~~
   fs/bcachefs/ec.c:893:13: note: parameter passing for argument of type 'struct bch_backpointer' changed in GCC 9.1
     893 |         k = bch2_backpointer_get_key(trans, &iter, bucket, *bp_offset, bp);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +54 fs/bcachefs/extents.h

e0750d9473522d Kent Overstreet 2017-03-16  50  
e0750d9473522d Kent Overstreet 2017-03-16  51  static inline enum bch_extent_entry_type
e0750d9473522d Kent Overstreet 2017-03-16  52  extent_entry_type(const union bch_extent_entry *e)
e0750d9473522d Kent Overstreet 2017-03-16  53  {
e0750d9473522d Kent Overstreet 2017-03-16 @54  	int ret = __ffs(e->type);
e0750d9473522d Kent Overstreet 2017-03-16  55  
e0750d9473522d Kent Overstreet 2017-03-16  56  	EBUG_ON(ret < 0 || ret >= BCH_EXTENT_ENTRY_MAX);
e0750d9473522d Kent Overstreet 2017-03-16  57  
e0750d9473522d Kent Overstreet 2017-03-16  58  	return ret;
e0750d9473522d Kent Overstreet 2017-03-16  59  }
e0750d9473522d Kent Overstreet 2017-03-16  60  

:::::: The code at line 54 was first introduced by commit
:::::: e0750d9473522d076b33ee257a21e27a5dd75031 bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
