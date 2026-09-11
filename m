Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D477BEADC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 00:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087327; cv=none; b=oJVzhE2YuqddoU8D0/j+MaDCQYe6nxa1hwvHS+JCzYBZ/2011pbQLqiMKu3dyr3dUzw/JwCdv63+/rHpdMkoTigw3blO2Z29H+Gagi/pPvzsduSDmjpDJrqij/f8AAP00tu0eicFCoyDHLl984w7ZYP/oOPC2Xeq/6tZNZQmDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087327; c=relaxed/simple;
	bh=X5cfJGkmXCIwf58wNaR56N8yskMsGXwnw/dUDr8OqRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCMKMUtOzcRFglqpDufx44Z9fLsa7hPc7w8hlW1AjOzvarS+cS90Jvz/GGvRK9ojfbe5v3jazcrRgKqabto6KsZG4SqZ6ytSDvoH53hdp2gg47cfSYdvCgj1O8SZltHRKjDDPl8Ct6kgKUTBCWcu4ykNzRsQSvLsMoYTq6zSq8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzBxGdrl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzBxGdrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789087326; x=1820623326;
  h=date:from:to:cc:subject:message-id;
  bh=X5cfJGkmXCIwf58wNaR56N8yskMsGXwnw/dUDr8OqRY=;
  b=SzBxGdrl51sc2QmcUH133mgsrCP8Wecwb4ITNMOJRAKzSBMNt9IW/Gb6
   PPGpQ38WxXOhPjDaaygQmvLd/1bRQm1r+B9hASIFPW1UCmtxTjakH/b4X
   eLW6pelhoVlgFbbhxms1SSFsdCTTs4S4nt/d3dX/LHM9AdQP2P5twsVti
   BT2eLOclEMv4t7F7Mz3GMViUxAeqF7a66vHPazdxCo3XJj70igMgxr6QG
   sqvUsSeSxeZAVjIcYWAn0nxwg/R5lIg4bBpYhC31A6nvNoRugn8itnxS9
   0vm/7X1azEfIZNmvgYkS5cnVUyi5DXNEgWGLWlsHsS8Ofyc3BDJfgREr4
   w==;
X-CSE-ConnectionGUID: /rZC1cj5RiWqVk1vPET/Kw==
X-CSE-MsgGUID: 3sDWlfHFQyi85RITIjceEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89390454"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89390454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 17:42:06 -0700
X-CSE-ConnectionGUID: sDTSSJmHRo6sCHOUdZBuFQ==
X-CSE-MsgGUID: 4UKUokoCTiivhOSe8E4Cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="271309307"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2026 17:42:03 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4pKS-000000000ig-3j6H;
	Fri, 11 Sep 2026 00:41:29 +0000
Date: Fri, 11 Sep 2026 08:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Bradley Morgan <brads@mainlining.org>
Subject: [brauner-vfs:namespace-7.4.misc 6/7]
 fs/btrfs/tests/inode-tests.c:16:13: error: conflicting types for
 'insert_extent'; have 'void(struct btrfs_root *, u64,  u64,  u64,  u64,  u64,
  u64,  u32,  u8,  int)' {aka 'void(struct btrfs_root *, long long unsigned
 int,  long long unsigned int,  long l...
Message-ID: <202609110843.okbPe7GM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git namespace-7.4.misc
head:   34a496d638705dc227cc6dd2aaaa9e450893502f
commit: f6f1a2496ba5dcc076d7fb7aa329887cd6ae55fa [6/7] userns: Add KUnit test suite for uid_gid_map
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260911/202609110843.okbPe7GM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110843.okbPe7GM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110843.okbPe7GM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/tests/inode-tests.c:16:13: error: conflicting types for 'insert_extent'; have 'void(struct btrfs_root *, u64,  u64,  u64,  u64,  u64,  u64,  u32,  u8,  int)' {aka 'void(struct btrfs_root *, long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  unsigned int,  unsigned char,  int)'}
      16 | static void insert_extent(struct btrfs_root *root, u64 start, u64 len,
         |             ^~~~~~~~~~~~~
   In file included from include/linux/cgroup.h:25,
                    from include/linux/writeback.h:201,
                    from include/trace/events/btrfs.h:8,
                    from fs/btrfs/tests/../btrfs_inode.h:20,
                    from fs/btrfs/tests/inode-tests.c:9:
   include/linux/user_namespace.h:212:12: note: previous declaration of 'insert_extent' with type 'int(struct uid_gid_map *, struct uid_gid_extent *)'
     212 | extern int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent);
         |            ^~~~~~~~~~~~~


vim +16 fs/btrfs/tests/inode-tests.c

aaedb55bc08f38 Josef Bacik   2013-10-11  15  
aaedb55bc08f38 Josef Bacik   2013-10-11 @16  static void insert_extent(struct btrfs_root *root, u64 start, u64 len,
aaedb55bc08f38 Josef Bacik   2013-10-11  17  			  u64 ram_bytes, u64 offset, u64 disk_bytenr,
aaedb55bc08f38 Josef Bacik   2013-10-11  18  			  u64 disk_len, u32 type, u8 compression, int slot)
aaedb55bc08f38 Josef Bacik   2013-10-11  19  {
aaedb55bc08f38 Josef Bacik   2013-10-11  20  	struct btrfs_path path;
aaedb55bc08f38 Josef Bacik   2013-10-11  21  	struct btrfs_file_extent_item *fi;
aaedb55bc08f38 Josef Bacik   2013-10-11  22  	struct extent_buffer *leaf = root->node;
aaedb55bc08f38 Josef Bacik   2013-10-11  23  	struct btrfs_key key;
aaedb55bc08f38 Josef Bacik   2013-10-11  24  	u32 value_len = sizeof(struct btrfs_file_extent_item);
aaedb55bc08f38 Josef Bacik   2013-10-11  25  
aaedb55bc08f38 Josef Bacik   2013-10-11  26  	if (type == BTRFS_FILE_EXTENT_INLINE)
aaedb55bc08f38 Josef Bacik   2013-10-11  27  		value_len += len;
aaedb55bc08f38 Josef Bacik   2013-10-11  28  	memset(&path, 0, sizeof(path));
aaedb55bc08f38 Josef Bacik   2013-10-11  29  
aaedb55bc08f38 Josef Bacik   2013-10-11  30  	path.nodes[0] = leaf;
aaedb55bc08f38 Josef Bacik   2013-10-11  31  	path.slots[0] = slot;
aaedb55bc08f38 Josef Bacik   2013-10-11  32  
aaedb55bc08f38 Josef Bacik   2013-10-11  33  	key.objectid = BTRFS_FIRST_FREE_OBJECTID;
aaedb55bc08f38 Josef Bacik   2013-10-11  34  	key.type = BTRFS_EXTENT_DATA_KEY;
aaedb55bc08f38 Josef Bacik   2013-10-11  35  	key.offset = start;
aaedb55bc08f38 Josef Bacik   2013-10-11  36  
50564b651d01c1 Filipe Manana 2023-09-12  37  	/*
50564b651d01c1 Filipe Manana 2023-09-12  38  	 * Passing a NULL trans handle is fine here, we have a dummy root eb
50564b651d01c1 Filipe Manana 2023-09-12  39  	 * and the tree is a single node (level 0).
50564b651d01c1 Filipe Manana 2023-09-12  40  	 */
50564b651d01c1 Filipe Manana 2023-09-12  41  	btrfs_setup_item_for_insert(NULL, root, &path, &key, value_len);
aaedb55bc08f38 Josef Bacik   2013-10-11  42  	fi = btrfs_item_ptr(leaf, slot, struct btrfs_file_extent_item);
aaedb55bc08f38 Josef Bacik   2013-10-11  43  	btrfs_set_file_extent_generation(leaf, fi, 1);
aaedb55bc08f38 Josef Bacik   2013-10-11  44  	btrfs_set_file_extent_type(leaf, fi, type);
aaedb55bc08f38 Josef Bacik   2013-10-11  45  	btrfs_set_file_extent_disk_bytenr(leaf, fi, disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  46  	btrfs_set_file_extent_disk_num_bytes(leaf, fi, disk_len);
aaedb55bc08f38 Josef Bacik   2013-10-11  47  	btrfs_set_file_extent_offset(leaf, fi, offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  48  	btrfs_set_file_extent_num_bytes(leaf, fi, len);
aaedb55bc08f38 Josef Bacik   2013-10-11  49  	btrfs_set_file_extent_ram_bytes(leaf, fi, ram_bytes);
aaedb55bc08f38 Josef Bacik   2013-10-11  50  	btrfs_set_file_extent_compression(leaf, fi, compression);
aaedb55bc08f38 Josef Bacik   2013-10-11  51  	btrfs_set_file_extent_encryption(leaf, fi, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11  52  	btrfs_set_file_extent_other_encoding(leaf, fi, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11  53  }
aaedb55bc08f38 Josef Bacik   2013-10-11  54  

:::::: The code at line 16 was first introduced by commit
:::::: aaedb55bc08f384b7f57dbb3222a511baed4decf Btrfs: add tests for btrfs_get_extent

:::::: TO: Josef Bacik <jbacik@fusionio.com>
:::::: CC: Chris Mason <chris.mason@fusionio.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
