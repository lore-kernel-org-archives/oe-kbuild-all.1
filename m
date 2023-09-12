Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC68AD49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694535889; x=1726071889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QR/V7GMUhc6c0G3ndy3GeGm6HyftSnOFHkQqtr1F51M=;
  b=RsQjCCp5+q+2YQ+gsPiThfFuB1nOoAqzq+mXSAarIL/X9oYtS1F2jjIn
   MkRyy1VoNSE9ZUMezgFW4poD9+TpqjnccodykFUEfoGobOjyfPO2ba6Ko
   kSzHgbKPOzwcvUQrZV6lQEcBIEQKRrOWAbb77hGaeu63sUGC7tO+GId0p
   uc890lIP1tQ3QLz7a07GvQXSEcyH53P0ueGCPFDpHvpbu63CmgTKv9MHW
   jsSntHM4xGTW/jxonEDOGPo0doostCUP/Bzq63wU4+WGMTPpZDCSeT4MN
   ubJZKA50tklyDoc2g/O9xZC5Ci4j273js+DsP+B96c0+PTVJyq5+SHAir
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444860278"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444860278"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 09:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990543804"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="990543804"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 09:09:47 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg5xQ-0000AI-2O;
	Tue, 12 Sep 2023 16:09:44 +0000
Date: Wed, 13 Sep 2023 00:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1118/4552] fs/bcachefs/opts.h:194:30: warning:
 'bch2_opts_default' defined but not used
Message-ID: <202309122309.eJFuTLOL-lkp@intel.com>
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
commit: 5ec30115c06692f17b20e4f4c7bdcd62cf96e30d [1118/4552] bcachefs: Initial commit
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309122309.eJFuTLOL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122309.eJFuTLOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122309.eJFuTLOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/super-io.h:5,
                    from fs/bcachefs/checksum.h:7,
                    from fs/bcachefs/str_hash.h:7,
                    from fs/bcachefs/fs.h:6,
                    from fs/bcachefs/acl.c:13:
   fs/bcachefs/extents.h: In function 'bch2_extent_devs':
   fs/bcachefs/extents.h:403:40: warning: variable '_crc' set but not used [-Wunused-but-set-variable]
     403 |         struct bch_extent_crc_unpacked _crc;                            \
         |                                        ^~~~
   fs/bcachefs/extents.h:410:24: note: in expansion of macro 'extent_ptr_next'
     410 |              ((_ptr) = extent_ptr_next(_e, _ptr));                      \
         |                        ^~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:462:9: note: in expansion of macro 'extent_for_each_ptr'
     462 |         extent_for_each_ptr(e, ptr)
         |         ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h: In function 'bch2_extent_dirty_devs':
   fs/bcachefs/extents.h:403:40: warning: variable '_crc' set but not used [-Wunused-but-set-variable]
     403 |         struct bch_extent_crc_unpacked _crc;                            \
         |                                        ^~~~
   fs/bcachefs/extents.h:410:24: note: in expansion of macro 'extent_ptr_next'
     410 |              ((_ptr) = extent_ptr_next(_e, _ptr));                      \
         |                        ^~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:473:9: note: in expansion of macro 'extent_for_each_ptr'
     473 |         extent_for_each_ptr(e, ptr)
         |         ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/extents.h: In function 'bch2_extent_cached_devs':
   fs/bcachefs/extents.h:403:40: warning: variable '_crc' set but not used [-Wunused-but-set-variable]
     403 |         struct bch_extent_crc_unpacked _crc;                            \
         |                                        ^~~~
   fs/bcachefs/extents.h:410:24: note: in expansion of macro 'extent_ptr_next'
     410 |              ((_ptr) = extent_ptr_next(_e, _ptr));                      \
         |                        ^~~~~~~~~~~~~~~
   fs/bcachefs/extents.h:485:9: note: in expansion of macro 'extent_for_each_ptr'
     485 |         extent_for_each_ptr(e, ptr)
         |         ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/checksum.h: At top level:
   fs/bcachefs/checksum.h:95:23: warning: 'bch2_compression_opt_to_type' defined but not used [-Wunused-const-variable=]
      95 | static const unsigned bch2_compression_opt_to_type[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:201,
                    from fs/bcachefs/acl.c:4:
>> fs/bcachefs/opts.h:194:30: warning: 'bch2_opts_default' defined but not used [-Wunused-const-variable=]
     194 | static const struct bch_opts bch2_opts_default = {
         |                              ^~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/bcachefs.h:199:
   fs/bcachefs/opts.h:33:14: warning: 'NO_SB_OPT_MAX' defined but not used [-Wunused-const-variable=]
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/opts.h:33:1: note: in expansion of macro 'LE64_BITMASK'
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:33:14: warning: 'NO_SB_OPT_BITS' defined but not used [-Wunused-const-variable=]
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/opts.h:33:1: note: in expansion of macro 'LE64_BITMASK'
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
   fs/bcachefs/opts.h:33:14: warning: 'NO_SB_OPT_OFFSET' defined but not used [-Wunused-const-variable=]
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         |              ^~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/opts.h:33:1: note: in expansion of macro 'LE64_BITMASK'
      33 | LE64_BITMASK(NO_SB_OPT,         struct bch_sb, flags[0], 0, 0);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1482:14: warning: 'BTREE_NODE_SEQ_MAX' defined but not used [-Wunused-const-variable=]
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1482:1: note: in expansion of macro 'LE64_BITMASK'
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1482:14: warning: 'BTREE_NODE_SEQ_BITS' defined but not used [-Wunused-const-variable=]
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1482:1: note: in expansion of macro 'LE64_BITMASK'
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1482:14: warning: 'BTREE_NODE_SEQ_OFFSET' defined but not used [-Wunused-const-variable=]
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1482:1: note: in expansion of macro 'LE64_BITMASK'
    1482 | LE64_BITMASK(BTREE_NODE_SEQ,    struct btree_node, flags, 32, 64);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1480:14: warning: 'BTREE_NODE_LEVEL_MAX' defined but not used [-Wunused-const-variable=]
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1480:1: note: in expansion of macro 'LE64_BITMASK'
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1480:14: warning: 'BTREE_NODE_LEVEL_BITS' defined but not used [-Wunused-const-variable=]
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1480:1: note: in expansion of macro 'LE64_BITMASK'
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1480:14: warning: 'BTREE_NODE_LEVEL_OFFSET' defined but not used [-Wunused-const-variable=]
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1480:1: note: in expansion of macro 'LE64_BITMASK'
    1480 | LE64_BITMASK(BTREE_NODE_LEVEL,  struct btree_node, flags,  4,  8);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1479:14: warning: 'BTREE_NODE_ID_MAX' defined but not used [-Wunused-const-variable=]
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         |              ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1479:1: note: in expansion of macro 'LE64_BITMASK'
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1479:14: warning: 'BTREE_NODE_ID_BITS' defined but not used [-Wunused-const-variable=]
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         |              ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1479:1: note: in expansion of macro 'LE64_BITMASK'
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1479:14: warning: 'BTREE_NODE_ID_OFFSET' defined but not used [-Wunused-const-variable=]
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         |              ^~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1479:1: note: in expansion of macro 'LE64_BITMASK'
    1479 | LE64_BITMASK(BTREE_NODE_ID,     struct btree_node, flags,  0,  4);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1452:14: warning: 'BSET_SEPARATE_WHITEOUTS_MAX' defined but not used [-Wunused-const-variable=]
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1452:1: note: in expansion of macro 'LE32_BITMASK'
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1452:14: warning: 'BSET_SEPARATE_WHITEOUTS_BITS' defined but not used [-Wunused-const-variable=]
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1452:1: note: in expansion of macro 'LE32_BITMASK'
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1452:14: warning: 'BSET_SEPARATE_WHITEOUTS_OFFSET' defined but not used [-Wunused-const-variable=]
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1452:1: note: in expansion of macro 'LE32_BITMASK'
    1452 | LE32_BITMASK(BSET_SEPARATE_WHITEOUTS,
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1451:14: warning: 'BSET_BIG_ENDIAN_MAX' defined but not used [-Wunused-const-variable=]
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1451:1: note: in expansion of macro 'LE32_BITMASK'
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1451:14: warning: 'BSET_BIG_ENDIAN_BITS' defined but not used [-Wunused-const-variable=]
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1451:1: note: in expansion of macro 'LE32_BITMASK'
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1451:14: warning: 'BSET_BIG_ENDIAN_OFFSET' defined but not used [-Wunused-const-variable=]
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1451:1: note: in expansion of macro 'LE32_BITMASK'
    1451 | LE32_BITMASK(BSET_BIG_ENDIAN,   struct bset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1449:14: warning: 'BSET_CSUM_TYPE_MAX' defined but not used [-Wunused-const-variable=]
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1449:1: note: in expansion of macro 'LE32_BITMASK'
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1449:14: warning: 'BSET_CSUM_TYPE_BITS' defined but not used [-Wunused-const-variable=]
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1449:1: note: in expansion of macro 'LE32_BITMASK'
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1449:14: warning: 'BSET_CSUM_TYPE_OFFSET' defined but not used [-Wunused-const-variable=]
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1449:1: note: in expansion of macro 'LE32_BITMASK'
    1449 | LE32_BITMASK(BSET_CSUM_TYPE,    struct bset, flags, 0, 4);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1387:14: warning: 'JSET_BIG_ENDIAN_MAX' defined but not used [-Wunused-const-variable=]
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1387:1: note: in expansion of macro 'LE32_BITMASK'
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1387:14: warning: 'JSET_BIG_ENDIAN_BITS' defined but not used [-Wunused-const-variable=]
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1387:1: note: in expansion of macro 'LE32_BITMASK'
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1387:14: warning: 'JSET_BIG_ENDIAN_OFFSET' defined but not used [-Wunused-const-variable=]
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1387:1: note: in expansion of macro 'LE32_BITMASK'
    1387 | LE32_BITMASK(JSET_BIG_ENDIAN,   struct jset, flags, 4, 5);
         | ^~~~~~~~~~~~
>> fs/bcachefs/bcachefs_format.h:1386:14: warning: 'JSET_CSUM_TYPE_MAX' defined but not used [-Wunused-const-variable=]
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1386:1: note: in expansion of macro 'LE32_BITMASK'
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1386:14: warning: 'JSET_CSUM_TYPE_BITS' defined but not used [-Wunused-const-variable=]
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1386:1: note: in expansion of macro 'LE32_BITMASK'
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1386:14: warning: 'JSET_CSUM_TYPE_OFFSET' defined but not used [-Wunused-const-variable=]
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1386:1: note: in expansion of macro 'LE32_BITMASK'
    1386 | LE32_BITMASK(JSET_CSUM_TYPE,    struct jset, flags, 0, 4);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1222:14: warning: 'BCH_SB_BACKGROUND_COMPRESSION_TYPE_MAX' defined but not used [-Wunused-const-variable=]
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1222:1: note: in expansion of macro 'LE64_BITMASK'
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1222:14: warning: 'BCH_SB_BACKGROUND_COMPRESSION_TYPE_BITS' defined but not used [-Wunused-const-variable=]
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1222:1: note: in expansion of macro 'LE64_BITMASK'
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1222:14: warning: 'BCH_SB_BACKGROUND_COMPRESSION_TYPE_OFFSET' defined but not used [-Wunused-const-variable=]
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1222:1: note: in expansion of macro 'LE64_BITMASK'
    1222 | LE64_BITMASK(BCH_SB_BACKGROUND_COMPRESSION_TYPE,
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1220:14: warning: 'BCH_SB_BACKGROUND_TARGET_MAX' defined but not used [-Wunused-const-variable=]
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1220:1: note: in expansion of macro 'LE64_BITMASK'
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1220:14: warning: 'BCH_SB_BACKGROUND_TARGET_BITS' defined but not used [-Wunused-const-variable=]
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1220:1: note: in expansion of macro 'LE64_BITMASK'
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1220:14: warning: 'BCH_SB_BACKGROUND_TARGET_OFFSET' defined but not used [-Wunused-const-variable=]
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:84:25: note: in definition of macro 'LE_BITMASK'
      84 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1220:1: note: in expansion of macro 'LE64_BITMASK'
    1220 | LE64_BITMASK(BCH_SB_BACKGROUND_TARGET,  struct bch_sb, flags[1], 52, 64);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1219:14: warning: 'BCH_SB_FOREGROUND_TARGET_MAX' defined but not used [-Wunused-const-variable=]
    1219 | LE64_BITMASK(BCH_SB_FOREGROUND_TARGET,  struct bch_sb, flags[1], 40, 52);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1219:1: note: in expansion of macro 'LE64_BITMASK'
    1219 | LE64_BITMASK(BCH_SB_FOREGROUND_TARGET,  struct bch_sb, flags[1], 40, 52);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1219:14: warning: 'BCH_SB_FOREGROUND_TARGET_BITS' defined but not used [-Wunused-const-variable=]
    1219 | LE64_BITMASK(BCH_SB_FOREGROUND_TARGET,  struct bch_sb, flags[1], 40, 52);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:1219:1: note: in expansion of macro 'LE64_BITMASK'
    1219 | LE64_BITMASK(BCH_SB_FOREGROUND_TARGET,  struct bch_sb, flags[1], 40, 52);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:1219:14: warning: 'BCH_SB_FOREGROUND_TARGET_OFFSET' defined but not used [-Wunused-const-variable=]
    1219 | LE64_BITMASK(BCH_SB_FOREGROUND_TARGET,  struct bch_sb, flags[1], 40, 52);
..


vim +/bch2_opts_default +194 fs/bcachefs/opts.h

   193	
 > 194	static const struct bch_opts bch2_opts_default = {
   195	#define BCH_OPT(_name, _bits, _mode, _type, _sb_opt, _default)		\
   196		._name##_defined = true,					\
   197		._name = _default,						\
   198	
   199		BCH_OPTS()
   200	#undef BCH_OPT
   201	};
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
