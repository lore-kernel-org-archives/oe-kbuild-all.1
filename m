Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F33C8C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYnkhv0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422086; x=1730958086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTOpaH1ctbVXiPrcU0MaQuDDKkX11qwVZr6C+1V4iRI=;
  b=MYnkhv0JVoKYFljxEX5heovR/YxBzPbOmjA3jB5zhFD9OJL1IhF6gNw3
   2ObY1bIVQWL6x8LWOIpFg2KJu2f3xFSrlCjCjX5U0tVb7MwTtZ5tXVHvL
   2WdisJAkSklyJX/SSGUwm4s8+MQ2BZGhPVSpy7dy1BNmVC96ZqByWrFU7
   4KyJKT0g8qWAE9B2byIpcJ31Usxrm7ETbaDbAUkYg9+uyw9K9jlShYqlf
   Ff9YQ5cQJ+KbtKC3NdtgiRdsk8KCKGAWSy95IeEc/tKY3W5Au+FLWMjYS
   cW8DUv0KJSOW/o1/9COmgpyyr6CYaLbUGDMalodKj3EEYY2UtoHjg8nLE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8346363"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8346363"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880092201"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880092201"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2023 21:41:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bJU-0007hQ-0O;
	Wed, 08 Nov 2023 05:41:16 +0000
Date: Wed, 8 Nov 2023 13:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202311081143.reFP17SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: 7e94eeffe0e79a54e525ad05302eb454fb96affd bcachefs: Inline fastpath of bch2_disk_reservation_add()
date:   2 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231108/202311081143.reFP17SP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311081143.reFP17SP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081143.reFP17SP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/extent_update.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/extent_update.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
--
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_update_interior.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_update_interior.c:1810:6: sparse: sparse: symbol 'async_btree_node_rewrite_work' was not declared. Should it be static?
   fs/bcachefs/btree_update_interior.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
   fs/bcachefs/btree_update_interior.c: note: in included file:
   fs/bcachefs/btree_cache.h:45:54: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __le64 const [usertype] seq @@
   fs/bcachefs/btree_cache.h:45:54: sparse:     expected unsigned long long
   fs/bcachefs/btree_cache.h:45:54: sparse:     got restricted __le64 const [usertype] seq
   fs/bcachefs/btree_cache.h:45:54: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __le64 const [usertype] seq @@
   fs/bcachefs/btree_cache.h:45:54: sparse:     expected unsigned long long
   fs/bcachefs/btree_cache.h:45:54: sparse:     got restricted __le64 const [usertype] seq
--
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c:861:17: sparse: sparse: context imbalance in '__bch2_set_nr_journal_buckets' - different lock contexts for basic block
   fs/bcachefs/journal.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
--
   fs/bcachefs/move.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/move.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/move.c:928:42: sparse: sparse: invalid assignment: |=
   fs/bcachefs/move.c:928:42: sparse:    left side has type restricted __le64
   fs/bcachefs/move.c:928:42: sparse:    right side has type unsigned long long
   fs/bcachefs/move.c:929:42: sparse: sparse: invalid assignment: |=
   fs/bcachefs/move.c:929:42: sparse:    left side has type restricted __le64
   fs/bcachefs/move.c:929:42: sparse:    right side has type unsigned long long
   fs/bcachefs/move.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/move.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
   fs/bcachefs/move.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/move.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
   fs/bcachefs/move.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
--
   fs/bcachefs/ec.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:401:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:401:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:401:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:401:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:401:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:401:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:401:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:401:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:401:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:499:37: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:499:37: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:499:37: sparse:     got restricted blk_opf_t
   fs/bcachefs/ec.c:934:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:934:48: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:934:48: sparse:     got restricted blk_opf_t
   fs/bcachefs/ec.c:1243:23: sparse: sparse: symbol '__bch2_ec_stripe_head_get' was not declared. Should it be static?
   fs/bcachefs/ec.c:1423:9: sparse: sparse: restricted __le16 degrades to integer
   fs/bcachefs/ec.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
--
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/fs-io.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/fs-io.c:550:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/bcachefs/fs-io.c:550:13: sparse:     expected int ret
   fs/bcachefs/fs-io.c:550:13: sparse:     got restricted vm_fault_t
   fs/bcachefs/fs-io.c:553:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   fs/bcachefs/fs-io.c:553:16: sparse:     expected restricted vm_fault_t
   fs/bcachefs/fs-io.c:553:16: sparse:     got int ret
   fs/bcachefs/fs-io.c:566:19: sparse: sparse: incorrect type in initializer (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/bcachefs/fs-io.c:566:19: sparse:     expected int ret
   fs/bcachefs/fs-io.c:566:19: sparse:     got restricted vm_fault_t
   fs/bcachefs/fs-io.c:586:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/bcachefs/fs-io.c:586:21: sparse:     expected int ret
   fs/bcachefs/fs-io.c:586:21: sparse:     got restricted vm_fault_t
   fs/bcachefs/fs-io.c:594:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/bcachefs/fs-io.c:594:21: sparse:     expected int ret
   fs/bcachefs/fs-io.c:594:21: sparse:     got restricted vm_fault_t
   fs/bcachefs/fs-io.c:606:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   fs/bcachefs/fs-io.c:606:16: sparse:     expected restricted vm_fault_t
   fs/bcachefs/fs-io.c:606:16: sparse:     got int ret
   fs/bcachefs/fs-io.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/fs-io.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
--
   fs/bcachefs/io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1101:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1116:42: sparse: sparse: array of flexible structures
   fs/bcachefs/io.c: note: in included file:
   fs/bcachefs/bcachefs.h:786:9: sparse: sparse: array of flexible structures
   fs/bcachefs/io.c: note: in included file:
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *
>> fs/bcachefs/buckets.h:282:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] __percpu * @@
   fs/bcachefs/buckets.h:282:23: sparse:     expected void *ptr
   fs/bcachefs/buckets.h:282:23: sparse:     got unsigned long long [noderef] __percpu *

vim +282 fs/bcachefs/buckets.h

   271	
   272	int __bch2_disk_reservation_add(struct bch_fs *,
   273					struct disk_reservation *,
   274					u64, int);
   275	
   276	static inline int bch2_disk_reservation_add(struct bch_fs *c, struct disk_reservation *res,
   277						    u64 sectors, int flags)
   278	{
   279		u64 old, new;
   280	
   281		do {
 > 282			old = this_cpu_read(c->pcpu->sectors_available);
   283			if (sectors > old)
   284				return __bch2_disk_reservation_add(c, res, sectors, flags);
   285	
   286			new = old - sectors;
   287		} while (this_cpu_cmpxchg(c->pcpu->sectors_available, old, new) != old);
   288	
   289		this_cpu_add(*c->online_reserved, sectors);
   290		res->sectors			+= sectors;
   291		return 0;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
