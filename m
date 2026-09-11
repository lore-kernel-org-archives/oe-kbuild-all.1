Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3B2FFDEA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092900; cv=none; b=ACyfeq46b7qr9DWgcHCReYkxvne0Llax9aGeuQyjnj0U271t6yvbv98biPXxKG1l3GBv/7/5tewu6xeuq3PnIbEb8eqj/RvnxTeAi4VtLz4Q2db9doQycOtPsPSe7avyKNoueyLes9L/2sRFJ2z1Ylm4MQX7NHYg93gP2lOX5/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092900; c=relaxed/simple;
	bh=Ykjv38CGtiYxUXKVyisn387zfr+Cq+gXcpIxevwa3T8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PcqTg87UH7vEo3gAOicOxyzX3ISBsP3X3sNHtOVKkd1lhBWqHMBuOavIJHw/ZvS0mE6ouPXAVQ/IxgkgDqkz2B5vu1jOOguFJIvDCBQkzb6/IYjAq63WSID9u11g6QIY/eyKygzDi9cLxFJgnTpSSCOF+np10BouY+ZiXgTTAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQgGgDXJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQgGgDXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789092896; x=1820628896;
  h=date:from:to:cc:subject:message-id;
  bh=Ykjv38CGtiYxUXKVyisn387zfr+Cq+gXcpIxevwa3T8=;
  b=QQgGgDXJyRef28ZzJKXjHnpGfU4hm0KB9GW4c9xV65HxfJ+feuItvY3e
   QKEX1YOK5q2mIorCci0kWLJbm26STvn8/pkk9+D7JU4nrgjHCbgbvcjDe
   8ilEt0UzEhFY0ZZoedIfm9tQscXj+4AG4WjvNgZfn5Flf5WaiS98eVymw
   27R/xl5B9zTJisxVem3mtuNxzR9LfEQPQ5QdwbX21dq07z15cs0quDKVK
   5Udbje5QQ5d9irJVQOTDuAFr/i1ShKvoid9zyBhaZFWErLTpzDmUBYeWy
   N6vBpYP5h94H/2Oe6gpNXpCl0XOMHx7UKPEus74tVOksN9Y13WqqbBEWz
   g==;
X-CSE-ConnectionGUID: ByMJOaLWQEmEQubg+lNsAA==
X-CSE-MsgGUID: 4ohi7hKYSEy27nAF30X+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100717298"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="100717298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 19:14:56 -0700
X-CSE-ConnectionGUID: wZxDCW8YSJCWwOzDv9y97Q==
X-CSE-MsgGUID: ORd2V0oGSW+I38BC3Nau1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="269201943"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 19:14:45 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4qmd-000000000qQ-3iXT;
	Fri, 11 Sep 2026 02:14:35 +0000
Date: Fri, 11 Sep 2026 10:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Bradley Morgan <brads@mainlining.org>
Subject: [brauner-vfs:namespace-7.4.misc 6/7]
 fs/btrfs/tests/inode-tests.c:16:13: error: conflicting types for
 'insert_extent'
Message-ID: <202609110937.zHKPPXJk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git namespace-7.4.misc
head:   34a496d638705dc227cc6dd2aaaa9e450893502f
commit: f6f1a2496ba5dcc076d7fb7aa329887cd6ae55fa [6/7] userns: Add KUnit test suite for uid_gid_map
config: powerpc64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110937.zHKPPXJk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110937.zHKPPXJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110937.zHKPPXJk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/tests/inode-tests.c:16:13: error: conflicting types for 'insert_extent'
      16 | static void insert_extent(struct btrfs_root *root, u64 start, u64 len,
         |             ^
   include/linux/user_namespace.h:212:12: note: previous declaration is here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^
>> fs/btrfs/tests/inode-tests.c:112:30: error: too many arguments to function call, expected 2, have 10
     112 |         insert_extent(root, offset, 6, 6, 0, 0, 0, BTRFS_FILE_EXTENT_INLINE, 0,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                       slot);
         |                       ~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:118:30: error: too many arguments to function call, expected 2, have 10
     118 |         insert_extent(root, offset, sectorsize, sectorsize, 0,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~
     119 |                       disk_bytenr, sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:132:30: error: too many arguments to function call, expected 2, have 10
     132 |         insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     133 |                       4 * sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:138:30: error: too many arguments to function call, expected 2, have 10
     138 |         insert_extent(root, offset, sectorsize, sectorsize, 0, 0, 0,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     139 |                       BTRFS_FILE_EXTENT_REG, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:144:30: error: too many arguments to function call, expected 2, have 10
     144 |         insert_extent(root, offset, 2 * sectorsize, 4 * sectorsize,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     145 |                       2 * sectorsize, disk_bytenr, 4 * sectorsize,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     146 |                       BTRFS_FILE_EXTENT_REG, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:152:30: error: too many arguments to function call, expected 2, have 10
     152 |         insert_extent(root, offset, sectorsize, sectorsize, 0, disk_bytenr,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     153 |                 sectorsize, BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:170:30: error: too many arguments to function call, expected 2, have 10
     170 |         insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     171 |                       4 * sectorsize, BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:176:30: error: too many arguments to function call, expected 2, have 10
     176 |         insert_extent(root, offset, sectorsize, 4 * sectorsize, sectorsize,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     177 |                       disk_bytenr, 4 * sectorsize, BTRFS_FILE_EXTENT_REG, 0,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     178 |                       slot);
         |                       ~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:183:30: error: too many arguments to function call, expected 2, have 10
     183 |         insert_extent(root, offset, 2 * sectorsize, 4 * sectorsize,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                       2 * sectorsize, disk_bytenr, 4 * sectorsize,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |                       BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:191:30: error: too many arguments to function call, expected 2, have 10
     191 |         insert_extent(root, offset, 2 * sectorsize, 2 * sectorsize, 0,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     192 |                       disk_bytenr, sectorsize, BTRFS_FILE_EXTENT_REG,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     193 |                       BTRFS_COMPRESS_ZLIB, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:200:30: error: too many arguments to function call, expected 2, have 10
     200 |         insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     201 |                       sectorsize, BTRFS_FILE_EXTENT_REG,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     202 |                       BTRFS_COMPRESS_ZLIB, slot);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/user_namespace.h:212:12: note: 'insert_extent' declared here
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/tests/inode-tests.c:207:30: error: too many arguments to function call, expected 2, have 10
     207 |         insert_extent(root, offset, sectorsize, sectorsize, 0,
         |         ~~~~~~~~~~~~~               ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/insert_extent +16 fs/btrfs/tests/inode-tests.c

aaedb55bc08f38 Josef Bacik   2013-10-11   15  
aaedb55bc08f38 Josef Bacik   2013-10-11  @16  static void insert_extent(struct btrfs_root *root, u64 start, u64 len,
aaedb55bc08f38 Josef Bacik   2013-10-11   17  			  u64 ram_bytes, u64 offset, u64 disk_bytenr,
aaedb55bc08f38 Josef Bacik   2013-10-11   18  			  u64 disk_len, u32 type, u8 compression, int slot)
aaedb55bc08f38 Josef Bacik   2013-10-11   19  {
aaedb55bc08f38 Josef Bacik   2013-10-11   20  	struct btrfs_path path;
aaedb55bc08f38 Josef Bacik   2013-10-11   21  	struct btrfs_file_extent_item *fi;
aaedb55bc08f38 Josef Bacik   2013-10-11   22  	struct extent_buffer *leaf = root->node;
aaedb55bc08f38 Josef Bacik   2013-10-11   23  	struct btrfs_key key;
aaedb55bc08f38 Josef Bacik   2013-10-11   24  	u32 value_len = sizeof(struct btrfs_file_extent_item);
aaedb55bc08f38 Josef Bacik   2013-10-11   25  
aaedb55bc08f38 Josef Bacik   2013-10-11   26  	if (type == BTRFS_FILE_EXTENT_INLINE)
aaedb55bc08f38 Josef Bacik   2013-10-11   27  		value_len += len;
aaedb55bc08f38 Josef Bacik   2013-10-11   28  	memset(&path, 0, sizeof(path));
aaedb55bc08f38 Josef Bacik   2013-10-11   29  
aaedb55bc08f38 Josef Bacik   2013-10-11   30  	path.nodes[0] = leaf;
aaedb55bc08f38 Josef Bacik   2013-10-11   31  	path.slots[0] = slot;
aaedb55bc08f38 Josef Bacik   2013-10-11   32  
aaedb55bc08f38 Josef Bacik   2013-10-11   33  	key.objectid = BTRFS_FIRST_FREE_OBJECTID;
aaedb55bc08f38 Josef Bacik   2013-10-11   34  	key.type = BTRFS_EXTENT_DATA_KEY;
aaedb55bc08f38 Josef Bacik   2013-10-11   35  	key.offset = start;
aaedb55bc08f38 Josef Bacik   2013-10-11   36  
50564b651d01c1 Filipe Manana 2023-09-12   37  	/*
50564b651d01c1 Filipe Manana 2023-09-12   38  	 * Passing a NULL trans handle is fine here, we have a dummy root eb
50564b651d01c1 Filipe Manana 2023-09-12   39  	 * and the tree is a single node (level 0).
50564b651d01c1 Filipe Manana 2023-09-12   40  	 */
50564b651d01c1 Filipe Manana 2023-09-12   41  	btrfs_setup_item_for_insert(NULL, root, &path, &key, value_len);
aaedb55bc08f38 Josef Bacik   2013-10-11   42  	fi = btrfs_item_ptr(leaf, slot, struct btrfs_file_extent_item);
aaedb55bc08f38 Josef Bacik   2013-10-11   43  	btrfs_set_file_extent_generation(leaf, fi, 1);
aaedb55bc08f38 Josef Bacik   2013-10-11   44  	btrfs_set_file_extent_type(leaf, fi, type);
aaedb55bc08f38 Josef Bacik   2013-10-11   45  	btrfs_set_file_extent_disk_bytenr(leaf, fi, disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11   46  	btrfs_set_file_extent_disk_num_bytes(leaf, fi, disk_len);
aaedb55bc08f38 Josef Bacik   2013-10-11   47  	btrfs_set_file_extent_offset(leaf, fi, offset);
aaedb55bc08f38 Josef Bacik   2013-10-11   48  	btrfs_set_file_extent_num_bytes(leaf, fi, len);
aaedb55bc08f38 Josef Bacik   2013-10-11   49  	btrfs_set_file_extent_ram_bytes(leaf, fi, ram_bytes);
aaedb55bc08f38 Josef Bacik   2013-10-11   50  	btrfs_set_file_extent_compression(leaf, fi, compression);
aaedb55bc08f38 Josef Bacik   2013-10-11   51  	btrfs_set_file_extent_encryption(leaf, fi, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11   52  	btrfs_set_file_extent_other_encoding(leaf, fi, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11   53  }
aaedb55bc08f38 Josef Bacik   2013-10-11   54  
0e30db86a4524f Josef Bacik   2013-10-14   55  static void insert_inode_item_key(struct btrfs_root *root)
0e30db86a4524f Josef Bacik   2013-10-14   56  {
0e30db86a4524f Josef Bacik   2013-10-14   57  	struct btrfs_path path;
0e30db86a4524f Josef Bacik   2013-10-14   58  	struct extent_buffer *leaf = root->node;
0e30db86a4524f Josef Bacik   2013-10-14   59  	struct btrfs_key key;
0e30db86a4524f Josef Bacik   2013-10-14   60  	u32 value_len = 0;
0e30db86a4524f Josef Bacik   2013-10-14   61  
0e30db86a4524f Josef Bacik   2013-10-14   62  	memset(&path, 0, sizeof(path));
0e30db86a4524f Josef Bacik   2013-10-14   63  
0e30db86a4524f Josef Bacik   2013-10-14   64  	path.nodes[0] = leaf;
0e30db86a4524f Josef Bacik   2013-10-14   65  	path.slots[0] = 0;
0e30db86a4524f Josef Bacik   2013-10-14   66  
0e30db86a4524f Josef Bacik   2013-10-14   67  	key.objectid = BTRFS_INODE_ITEM_KEY;
0e30db86a4524f Josef Bacik   2013-10-14   68  	key.type = BTRFS_INODE_ITEM_KEY;
0e30db86a4524f Josef Bacik   2013-10-14   69  	key.offset = 0;
0e30db86a4524f Josef Bacik   2013-10-14   70  
50564b651d01c1 Filipe Manana 2023-09-12   71  	/*
50564b651d01c1 Filipe Manana 2023-09-12   72  	 * Passing a NULL trans handle is fine here, we have a dummy root eb
50564b651d01c1 Filipe Manana 2023-09-12   73  	 * and the tree is a single node (level 0).
50564b651d01c1 Filipe Manana 2023-09-12   74  	 */
50564b651d01c1 Filipe Manana 2023-09-12   75  	btrfs_setup_item_for_insert(NULL, root, &path, &key, value_len);
0e30db86a4524f Josef Bacik   2013-10-14   76  }
0e30db86a4524f Josef Bacik   2013-10-14   77  
aaedb55bc08f38 Josef Bacik   2013-10-11   78  /*
aaedb55bc08f38 Josef Bacik   2013-10-11   79   * Build the most complicated map of extents the earth has ever seen.  We want
aaedb55bc08f38 Josef Bacik   2013-10-11   80   * this so we can test all of the corner cases of btrfs_get_extent.  Here is a
aaedb55bc08f38 Josef Bacik   2013-10-11   81   * diagram of how the extents will look though this may not be possible we still
aaedb55bc08f38 Josef Bacik   2013-10-11   82   * want to make sure everything acts normally (the last number is not inclusive)
aaedb55bc08f38 Josef Bacik   2013-10-11   83   *
d77b90cfe08f4c Qu Wenruo     2026-01-22   84   * The numbers are using 4K fs block size as an example, the real test will scale
d77b90cfe08f4c Qu Wenruo     2026-01-22   85   * all the extent maps (except the inlined one) according to the block size.
aaedb55bc08f38 Josef Bacik   2013-10-11   86   *
d77b90cfe08f4c Qu Wenruo     2026-01-22   87   * [ 0  - 6 ][ 6 - 4K       ][ 4K - 8K ][ 8K -  12K      ]
d77b90cfe08f4c Qu Wenruo     2026-01-22   88   * [ inline ][ implied hole ][ regular ][ regular1 split ]
d77b90cfe08f4c Qu Wenruo     2026-01-22   89   *
d77b90cfe08f4c Qu Wenruo     2026-01-22   90   * [ 12K - 16K ][ 16K - 24K      ][ 24K - 28K ][ 28K - 32K ][ 32K - 36K         ]
b9ef22dedde08a Feifei Xu     2016-06-01   91   * [ hole      ][ regular1 split ][ prealloc  ][ prealloc1 ][ prealloc1 written ]
aaedb55bc08f38 Josef Bacik   2013-10-11   92   *
d77b90cfe08f4c Qu Wenruo     2026-01-22   93   * [ 36K - 44K ][ 44K - 52K  ][ 52K - 56K   ][ 56K - 60K ][ 60K - 68 K  ]
b9ef22dedde08a Feifei Xu     2016-06-01   94   * [ prealloc1 ][ compressed ][ compressed1 ][ regular   ][ compressed1 ]
aaedb55bc08f38 Josef Bacik   2013-10-11   95   *
d77b90cfe08f4c Qu Wenruo     2026-01-22   96   * [ 68K - 72K ][ 72K - 84K          ][ 84K - 88K ]
b9ef22dedde08a Feifei Xu     2016-06-01   97   * [  regular  ][ hole but no extent ][ regular   ]
aaedb55bc08f38 Josef Bacik   2013-10-11   98   */
b9ef22dedde08a Feifei Xu     2016-06-01   99  static void setup_file_extents(struct btrfs_root *root, u32 sectorsize)
aaedb55bc08f38 Josef Bacik   2013-10-11  100  {
aaedb55bc08f38 Josef Bacik   2013-10-11  101  	int slot = 0;
ee22184b53c823 Byongho Lee   2015-12-15  102  	u64 disk_bytenr = SZ_1M;
aaedb55bc08f38 Josef Bacik   2013-10-11  103  	u64 offset = 0;
aaedb55bc08f38 Josef Bacik   2013-10-11  104  
aaedb55bc08f38 Josef Bacik   2013-10-11  105  	/*
d77b90cfe08f4c Qu Wenruo     2026-01-22  106  	 * Start 0, length 6, inlined.
d77b90cfe08f4c Qu Wenruo     2026-01-22  107  	 *
d52a1365258b57 Qu Wenruo     2022-09-16  108  	 * Tree-checker has strict limits on inline extents that they can only
d52a1365258b57 Qu Wenruo     2022-09-16  109  	 * exist at file offset 0, thus we can only have one inline file extent
d52a1365258b57 Qu Wenruo     2022-09-16  110  	 * at most.
aaedb55bc08f38 Josef Bacik   2013-10-11  111  	 */
d52a1365258b57 Qu Wenruo     2022-09-16 @112  	insert_extent(root, offset, 6, 6, 0, 0, 0, BTRFS_FILE_EXTENT_INLINE, 0,
aaedb55bc08f38 Josef Bacik   2013-10-11  113  		      slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  114  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  115  	offset = sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  116  
d77b90cfe08f4c Qu Wenruo     2026-01-22  117  	/* Start 1 * blocksize, length 1 * blocksize, regular. */
d77b90cfe08f4c Qu Wenruo     2026-01-22  118  	insert_extent(root, offset, sectorsize, sectorsize, 0,
d77b90cfe08f4c Qu Wenruo     2026-01-22  119  		      disk_bytenr, sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  120  	slot++;
aaedb55bc08f38 Josef Bacik   2013-10-11  121  
d77b90cfe08f4c Qu Wenruo     2026-01-22  122  	/* We don't want the regular em merged with the next one. */
d77b90cfe08f4c Qu Wenruo     2026-01-22  123  	disk_bytenr += 2 * sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  124  	offset += sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  125  
aaedb55bc08f38 Josef Bacik   2013-10-11  126  	/*
d77b90cfe08f4c Qu Wenruo     2026-01-22  127  	 * Start 2 * blocksize, length 1 * blocksize, regular.
d77b90cfe08f4c Qu Wenruo     2026-01-22  128  	 *
aaedb55bc08f38 Josef Bacik   2013-10-11  129  	 * Now for 3 extents that were split from a hole punch so we test
aaedb55bc08f38 Josef Bacik   2013-10-11  130  	 * offsets properly.
aaedb55bc08f38 Josef Bacik   2013-10-11  131  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  132  	insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  133  		      4 * sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  134  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  135  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  136  
d77b90cfe08f4c Qu Wenruo     2026-01-22  137  	/* Start 3 * blocksize, length 1 * blocksize, regular, explicit hole. */
b9ef22dedde08a Feifei Xu     2016-06-01  138  	insert_extent(root, offset, sectorsize, sectorsize, 0, 0, 0,
b9ef22dedde08a Feifei Xu     2016-06-01  139  		      BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  140  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  141  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  142  
d77b90cfe08f4c Qu Wenruo     2026-01-22  143  	/* Start 4 * blocksize, length 2 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  144  	insert_extent(root, offset, 2 * sectorsize, 4 * sectorsize,
b9ef22dedde08a Feifei Xu     2016-06-01  145  		      2 * sectorsize, disk_bytenr, 4 * sectorsize,
aaedb55bc08f38 Josef Bacik   2013-10-11  146  		      BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  147  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  148  	offset += 2 * sectorsize;
b9ef22dedde08a Feifei Xu     2016-06-01  149  	disk_bytenr += 4 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  150  
d77b90cfe08f4c Qu Wenruo     2026-01-22  151  	/* Start 6 * blocksize, length 1 * blocksize, preallocated. */
b9ef22dedde08a Feifei Xu     2016-06-01  152  	insert_extent(root, offset, sectorsize, sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  153  		sectorsize, BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  154  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  155  	offset += sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  156  
aaedb55bc08f38 Josef Bacik   2013-10-11  157  	/*
aaedb55bc08f38 Josef Bacik   2013-10-11  158  	 * We want to jack up disk_bytenr a little more so the em stuff doesn't
aaedb55bc08f38 Josef Bacik   2013-10-11  159  	 * merge our records.
aaedb55bc08f38 Josef Bacik   2013-10-11  160  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  161  	disk_bytenr += 2 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  162  
aaedb55bc08f38 Josef Bacik   2013-10-11  163  	/*
d77b90cfe08f4c Qu Wenruo     2026-01-22  164  	 * Start 7 * blocksize, length 1 * blocksize, prealloc.
d77b90cfe08f4c Qu Wenruo     2026-01-22  165  	 *
aaedb55bc08f38 Josef Bacik   2013-10-11  166  	 * Now for a partially written prealloc extent, basically the same as
aaedb55bc08f38 Josef Bacik   2013-10-11  167  	 * the hole punch example above.  Ram_bytes never changes when you mark
aaedb55bc08f38 Josef Bacik   2013-10-11  168  	 * extents written btw.
aaedb55bc08f38 Josef Bacik   2013-10-11  169  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  170  	insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  171  		      4 * sectorsize, BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  172  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  173  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  174  
d77b90cfe08f4c Qu Wenruo     2026-01-22  175  	/* Start 8 * blocksize, length 1 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  176  	insert_extent(root, offset, sectorsize, 4 * sectorsize, sectorsize,
b9ef22dedde08a Feifei Xu     2016-06-01  177  		      disk_bytenr, 4 * sectorsize, BTRFS_FILE_EXTENT_REG, 0,
b9ef22dedde08a Feifei Xu     2016-06-01  178  		      slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  179  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  180  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  181  
d77b90cfe08f4c Qu Wenruo     2026-01-22  182  	/* Start 9 * blocksize, length 2 * blocksize, prealloc. */
b9ef22dedde08a Feifei Xu     2016-06-01  183  	insert_extent(root, offset, 2 * sectorsize, 4 * sectorsize,
b9ef22dedde08a Feifei Xu     2016-06-01  184  		      2 * sectorsize, disk_bytenr, 4 * sectorsize,
aaedb55bc08f38 Josef Bacik   2013-10-11  185  		      BTRFS_FILE_EXTENT_PREALLOC, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  186  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  187  	offset += 2 * sectorsize;
b9ef22dedde08a Feifei Xu     2016-06-01  188  	disk_bytenr += 4 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  189  
d77b90cfe08f4c Qu Wenruo     2026-01-22  190  	/* Start 11 * blocksize, length 2 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  191  	insert_extent(root, offset, 2 * sectorsize, 2 * sectorsize, 0,
b9ef22dedde08a Feifei Xu     2016-06-01  192  		      disk_bytenr, sectorsize, BTRFS_FILE_EXTENT_REG,
b9ef22dedde08a Feifei Xu     2016-06-01  193  		      BTRFS_COMPRESS_ZLIB, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  194  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  195  	offset += 2 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  196  	/* No merges */
b9ef22dedde08a Feifei Xu     2016-06-01  197  	disk_bytenr += 2 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  198  
d77b90cfe08f4c Qu Wenruo     2026-01-22  199  	/* Start 13 * blocksize, length 1 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  200  	insert_extent(root, offset, sectorsize, 4 * sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  201  		      sectorsize, BTRFS_FILE_EXTENT_REG,
b9ef22dedde08a Feifei Xu     2016-06-01  202  		      BTRFS_COMPRESS_ZLIB, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  203  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  204  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  205  
d77b90cfe08f4c Qu Wenruo     2026-01-22  206  	/* Start 14 * blocksize, length 1 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  207  	insert_extent(root, offset, sectorsize, sectorsize, 0,
b9ef22dedde08a Feifei Xu     2016-06-01  208  		      disk_bytenr + sectorsize, sectorsize,
aaedb55bc08f38 Josef Bacik   2013-10-11  209  		      BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  210  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  211  	offset += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  212  
d77b90cfe08f4c Qu Wenruo     2026-01-22  213  	/* Start 15 * blocksize, length 2 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  214  	insert_extent(root, offset, 2 * sectorsize, 4 * sectorsize,
b9ef22dedde08a Feifei Xu     2016-06-01  215  		      2 * sectorsize, disk_bytenr, sectorsize,
aaedb55bc08f38 Josef Bacik   2013-10-11  216  		      BTRFS_FILE_EXTENT_REG, BTRFS_COMPRESS_ZLIB, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  217  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  218  	offset += 2 * sectorsize;
b9ef22dedde08a Feifei Xu     2016-06-01  219  	disk_bytenr += 2 * sectorsize;
aaedb55bc08f38 Josef Bacik   2013-10-11  220  
d77b90cfe08f4c Qu Wenruo     2026-01-22  221  	/* Start 17 * blocksize, length 1 * blocksize, regular. */
b9ef22dedde08a Feifei Xu     2016-06-01  222  	insert_extent(root, offset, sectorsize, sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  223  		      sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  224  	slot++;
b9ef22dedde08a Feifei Xu     2016-06-01  225  	offset += 4 * sectorsize;
b9ef22dedde08a Feifei Xu     2016-06-01  226  	disk_bytenr += sectorsize;
d77b90cfe08f4c Qu Wenruo     2026-01-22  227  
d77b90cfe08f4c Qu Wenruo     2026-01-22  228  	/*
d77b90cfe08f4c Qu Wenruo     2026-01-22  229  	 * Start 18 * blocksize, length 3 * blocksize, implied hole (aka no
d77b90cfe08f4c Qu Wenruo     2026-01-22  230  	 * file extent item).
d77b90cfe08f4c Qu Wenruo     2026-01-22  231  	 *
d77b90cfe08f4c Qu Wenruo     2026-01-22  232  	 * Start 21 * blocksize, length 1 * blocksize, regular.
d77b90cfe08f4c Qu Wenruo     2026-01-22  233  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  234  	insert_extent(root, offset, sectorsize, sectorsize, 0, disk_bytenr,
b9ef22dedde08a Feifei Xu     2016-06-01  235  		      sectorsize, BTRFS_FILE_EXTENT_REG, 0, slot);
aaedb55bc08f38 Josef Bacik   2013-10-11  236  }
aaedb55bc08f38 Josef Bacik   2013-10-11  237  

:::::: The code at line 16 was first introduced by commit
:::::: aaedb55bc08f384b7f57dbb3222a511baed4decf Btrfs: add tests for btrfs_get_extent

:::::: TO: Josef Bacik <jbacik@fusionio.com>
:::::: CC: Chris Mason <chris.mason@fusionio.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
