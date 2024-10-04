Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A2E1802E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728030674; cv=none; b=paVBRKjKsk1FUzU+8nv2FwVPPVjEisFVdzb9nsI5TldvlWlejN80df7Qjzo4+Tbt8EqBen2l6BSLC34Y9SkyoPx8r6ZfZFfpHzLZiHnR5p3Hr0tmGr3gGjuRUE2Mg1s+pEYfdiyU+E7aukAY/XM8wrV3lS1EiWlrMIu7tIKnQOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728030674; c=relaxed/simple;
	bh=kVAFaEGcz9ayfW1DakaHEVKsZ/50CU69WOtjAB8gbuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAVLWTaFpkz6fm25asbZCG2QqbxX38wnqgQi+jP+cNEJykX0IfIxOz3cWMBDiac4HKb05h8q4gKWBDglnlb5s0ZEd3CIwbzKurpsPqnSJJn6UEuXF0IzgaBkgBRdPv5wBAT8bl9IO7SMeOiOhEVNW1WbA6ut4PWqvSSEwJos/PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f48QNlTr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f48QNlTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728030672; x=1759566672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVAFaEGcz9ayfW1DakaHEVKsZ/50CU69WOtjAB8gbuA=;
  b=f48QNlTrmzbypjC5B63hiP4qTpALxTK2M11NaaVKwLqW9uuPK+KdVE6f
   qKOiy/2gANROOd8XL7rmiB05JMEV4ZCTK9uOBQwF5lySGBVfYOEdt0ByC
   1TdYNhUR1ZikgQTD22yLO2EAXaa51ugoGXuXm9Y13lPzSJGaNHmM1VLFE
   lPPFE8jDb0HqLS94VQ6XJ0ziahrFkJKhjf1D5SHI9KAL4UUnrph/aBU/1
   IRirfw9HgoaoC8l2AXLD2kaPIllIvygWK34SR7wefaQvEEoVIKooxp7l7
   TXt3dxzo8NgABST7Ipvl9YF97pO4vMxIxBS5lIp5nDjSgxunS/WKm+I36
   A==;
X-CSE-ConnectionGUID: bTg0lw1yTYC6AcVCHvB1Ww==
X-CSE-MsgGUID: QrRnjM24SfC9q7hGH08f4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38635956"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="38635956"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 01:31:12 -0700
X-CSE-ConnectionGUID: wFGUd8jfRuazfR/1qvlskw==
X-CSE-MsgGUID: unr77vRPS0u4E01FPlCymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79196062"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 01:31:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swdiN-0001O0-25;
	Fri, 04 Oct 2024 08:31:07 +0000
Date: Fri, 4 Oct 2024 16:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
Message-ID: <202410041649.HreQEkk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi NeilBrown,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   927731dfa8be3059636e928c62518d0fafd901f0
commit: be52a0b9d87298fb1c4006e2235c2089112c953b [1/8] sched: change wake_up_bit() and related function to expect unsigned long *
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410041649.HreQEkk8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041649.HreQEkk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041649.HreQEkk8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/bcachefs/bcachefs.h:188,
                    from fs/bcachefs/fs.c:4:
   fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
>> fs/bcachefs/fs.c:180:31: error: initialization of 'long unsigned int *' from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
     180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
         |                               ^
   include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KEY_INITIALIZER'
      22 |         { .flags = word, .bit_nr = bit, }
         |                    ^~~~
   fs/bcachefs/fs.c:180:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
     180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
         |         ^~~~~~~~~~~~~~~
   fs/bcachefs/fs.c:180:31: note: (near initialization for 'wait.key.flags')
     180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
         |                               ^
   include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT_KEY_INITIALIZER'
      22 |         { .flags = word, .bit_nr = bit, }
         |                    ^~~~
   fs/bcachefs/fs.c:180:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
     180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
         |         ^~~~~~~~~~~~~~~
>> fs/bcachefs/fs.c:181:28: error: passing argument 1 of 'bit_waitqueue' from incompatible pointer type [-Wincompatible-pointer-types]
     181 |         wq = bit_waitqueue(&inode->i_state, __I_NEW);
         |                            ^~~~~~~~~~~~~~~
         |                            |
         |                            u32 * {aka unsigned int *}
   include/linux/wait_bit.h:33:54: note: expected 'long unsigned int *' but argument is of type 'u32 *' {aka 'unsigned int *'}
      33 | struct wait_queue_head *bit_waitqueue(unsigned long *word, int bit);
         |                                       ~~~~~~~~~~~~~~~^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/bit_waitqueue +181 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet     2017-03-16    3  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   @4  #include "bcachefs.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16    5  #include "acl.h"
07a1006ae81580 Kent Overstreet     2020-12-17    6  #include "bkey_buf.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16    7  #include "btree_update.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16    8  #include "buckets.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16    9  #include "chardev.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   10  #include "dirent.h"
d4bf5eecd78a90 Kent Overstreet     2022-07-18   11  #include "errcode.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   12  #include "extents.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   13  #include "fs.h"
9638574229e3ae Kent Overstreet     2019-10-02   14  #include "fs-common.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   15  #include "fs-io.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   16  #include "fs-ioctl.h"
dbbfca9f41e869 Kent Overstreet     2023-08-03   17  #include "fs-io-buffered.h"
dbbfca9f41e869 Kent Overstreet     2023-08-03   18  #include "fs-io-direct.h"
dbbfca9f41e869 Kent Overstreet     2023-08-03   19  #include "fs-io-pagecache.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   20  #include "fsck.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   21  #include "inode.h"
1809b8cba756d3 Kent Overstreet     2023-09-10   22  #include "io_read.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   23  #include "journal.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   24  #include "keylist.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   25  #include "quota.h"
8e877caaad8185 Kent Overstreet     2023-08-16   26  #include "snapshot.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   27  #include "super.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   28  #include "xattr.h"
747d1d6c7efdfb Youling Tang        2024-05-31   29  #include "trace.h"
1c6fdbd8f2465d Kent Overstreet     2017-03-16   30  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   31  #include <linux/aio.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   32  #include <linux/backing-dev.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   33  #include <linux/exportfs.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   34  #include <linux/fiemap.h>
929d954330142a Thomas Bertschinger 2024-05-27   35  #include <linux/fs_context.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   36  #include <linux/module.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   37  #include <linux/pagemap.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   38  #include <linux/posix_acl.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   39  #include <linux/random.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   40  #include <linux/seq_file.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   41  #include <linux/statfs.h>
ffcf9ec78c133f Stijn Tintel        2021-05-13   42  #include <linux/string.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   43  #include <linux/xattr.h>
1c6fdbd8f2465d Kent Overstreet     2017-03-16   44  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   45  static struct kmem_cache *bch2_inode_cache;
1c6fdbd8f2465d Kent Overstreet     2017-03-16   46  
32b26e8c7f6418 Kent Overstreet     2021-11-06   47  static void bch2_vfs_inode_init(struct btree_trans *, subvol_inum,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   48  				struct bch_inode_info *,
9ca4853b98af5f Kent Overstreet     2021-10-27   49  				struct bch_inode_unpacked *,
9ca4853b98af5f Kent Overstreet     2021-10-27   50  				struct bch_subvolume *);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   51  
32b26e8c7f6418 Kent Overstreet     2021-11-06   52  void bch2_inode_update_after_write(struct btree_trans *trans,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   53  				   struct bch_inode_info *inode,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   54  				   struct bch_inode_unpacked *bi,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   55  				   unsigned fields)
1c6fdbd8f2465d Kent Overstreet     2017-03-16   56  {
32b26e8c7f6418 Kent Overstreet     2021-11-06   57  	struct bch_fs *c = trans->c;
32b26e8c7f6418 Kent Overstreet     2021-11-06   58  
32b26e8c7f6418 Kent Overstreet     2021-11-06   59  	BUG_ON(bi->bi_inum != inode->v.i_ino);
32b26e8c7f6418 Kent Overstreet     2021-11-06   60  
385f0c05d670a2 Kent Overstreet     2024-06-08   61  	bch2_assert_pos_locked(trans, BTREE_ID_inodes, POS(0, bi->bi_inum));
32b26e8c7f6418 Kent Overstreet     2021-11-06   62  
b43a0f60a61e8e Kent Overstreet     2019-09-25   63  	set_nlink(&inode->v, bch2_inode_nlink_get(bi));
1c6fdbd8f2465d Kent Overstreet     2017-03-16   64  	i_uid_write(&inode->v, bi->bi_uid);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   65  	i_gid_write(&inode->v, bi->bi_gid);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   66  	inode->v.i_mode	= bi->bi_mode;
1c6fdbd8f2465d Kent Overstreet     2017-03-16   67  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   68  	if (fields & ATTR_ATIME)
9e87705289667a Linus Torvalds      2023-10-30   69  		inode_set_atime_to_ts(&inode->v, bch2_time_to_timespec(c, bi->bi_atime));
1c6fdbd8f2465d Kent Overstreet     2017-03-16   70  	if (fields & ATTR_MTIME)
9e87705289667a Linus Torvalds      2023-10-30   71  		inode_set_mtime_to_ts(&inode->v, bch2_time_to_timespec(c, bi->bi_mtime));
1c6fdbd8f2465d Kent Overstreet     2017-03-16   72  	if (fields & ATTR_CTIME)
1c6fdbd8f2465d Kent Overstreet     2017-03-16   73  		inode_set_ctime_to_ts(&inode->v, bch2_time_to_timespec(c, bi->bi_ctime));
1c6fdbd8f2465d Kent Overstreet     2017-03-16   74  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   75  	inode->ei_inode		= *bi;
2ea9004864b918 Kent Overstreet     2018-07-17   76  
2ea9004864b918 Kent Overstreet     2018-07-17   77  	bch2_inode_flags_to_vfs(inode);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   78  }
1c6fdbd8f2465d Kent Overstreet     2017-03-16   79  
2ea9004864b918 Kent Overstreet     2018-07-17   80  int __must_check bch2_write_inode(struct bch_fs *c,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   81  				  struct bch_inode_info *inode,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   82  				  inode_set_fn set,
1c6fdbd8f2465d Kent Overstreet     2017-03-16   83  				  void *p, unsigned fields)
1c6fdbd8f2465d Kent Overstreet     2017-03-16   84  {
6bd68ec266ad71 Kent Overstreet     2023-09-12   85  	struct btree_trans *trans = bch2_trans_get(c);
67e0dd8f0d8b4b Kent Overstreet     2021-08-30   86  	struct btree_iter iter = { NULL };
1c6fdbd8f2465d Kent Overstreet     2017-03-16   87  	struct bch_inode_unpacked inode_u;
1c6fdbd8f2465d Kent Overstreet     2017-03-16   88  	int ret;
1c6fdbd8f2465d Kent Overstreet     2017-03-16   89  retry:
6bd68ec266ad71 Kent Overstreet     2023-09-12   90  	bch2_trans_begin(trans);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   91  
6bd68ec266ad71 Kent Overstreet     2023-09-12   92  	ret   = bch2_inode_peek(trans, &iter, &inode_u, inode_inum(inode),
5dd8c60e1e0448 Kent Overstreet     2024-04-07   93  				BTREE_ITER_intent) ?:
6bd68ec266ad71 Kent Overstreet     2023-09-12   94  		(set ? set(trans, inode, &inode_u, p) : 0) ?:
6bd68ec266ad71 Kent Overstreet     2023-09-12   95  		bch2_inode_write(trans, &iter, &inode_u) ?:
cb52d23e77a6e5 Kent Overstreet     2023-11-11   96  		bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
1c6fdbd8f2465d Kent Overstreet     2017-03-16   97  
1c6fdbd8f2465d Kent Overstreet     2017-03-16   98  	/*
1c6fdbd8f2465d Kent Overstreet     2017-03-16   99  	 * the btree node lock protects inode->ei_inode, not ei_update_lock;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  100  	 * this is important for inode updates via bchfs_write_index_update
1c6fdbd8f2465d Kent Overstreet     2017-03-16  101  	 */
1c6fdbd8f2465d Kent Overstreet     2017-03-16  102  	if (!ret)
6bd68ec266ad71 Kent Overstreet     2023-09-12  103  		bch2_inode_update_after_write(trans, inode, &inode_u, fields);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  104  
6bd68ec266ad71 Kent Overstreet     2023-09-12  105  	bch2_trans_iter_exit(trans, &iter);
47c46c95316390 Kent Overstreet     2020-04-01  106  
549d173c1bd9b5 Kent Overstreet     2022-07-17  107  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
47c46c95316390 Kent Overstreet     2020-04-01  108  		goto retry;
47c46c95316390 Kent Overstreet     2020-04-01  109  
e47a390aa5946e Kent Overstreet     2023-05-27  110  	bch2_fs_fatal_err_on(bch2_err_matches(ret, ENOENT), c,
112d21fd1a122f Kent Overstreet     2024-06-08  111  			     "%s: inode %llu:%llu not found when updating",
3ed94062e3801e Kent Overstreet     2024-03-17  112  			     bch2_err_str(ret),
711bf946d55d28 Kent Overstreet     2023-03-15  113  			     inode_inum(inode).subvol,
711bf946d55d28 Kent Overstreet     2023-03-15  114  			     inode_inum(inode).inum);
711bf946d55d28 Kent Overstreet     2023-03-15  115  
6bd68ec266ad71 Kent Overstreet     2023-09-12  116  	bch2_trans_put(trans);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  117  	return ret < 0 ? ret : 0;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  118  }
1c6fdbd8f2465d Kent Overstreet     2017-03-16  119  
0f5254aa98befa Kent Overstreet     2018-12-17  120  int bch2_fs_quota_transfer(struct bch_fs *c,
0f5254aa98befa Kent Overstreet     2018-12-17  121  			   struct bch_inode_info *inode,
0f5254aa98befa Kent Overstreet     2018-12-17  122  			   struct bch_qid new_qid,
0f5254aa98befa Kent Overstreet     2018-12-17  123  			   unsigned qtypes,
0f5254aa98befa Kent Overstreet     2018-12-17  124  			   enum quota_acct_mode mode)
0f5254aa98befa Kent Overstreet     2018-12-17  125  {
0f5254aa98befa Kent Overstreet     2018-12-17  126  	unsigned i;
0f5254aa98befa Kent Overstreet     2018-12-17  127  	int ret;
0f5254aa98befa Kent Overstreet     2018-12-17  128  
0f5254aa98befa Kent Overstreet     2018-12-17  129  	qtypes &= enabled_qtypes(c);
0f5254aa98befa Kent Overstreet     2018-12-17  130  
0f5254aa98befa Kent Overstreet     2018-12-17  131  	for (i = 0; i < QTYP_NR; i++)
0f5254aa98befa Kent Overstreet     2018-12-17  132  		if (new_qid.q[i] == inode->ei_qid.q[i])
0f5254aa98befa Kent Overstreet     2018-12-17  133  			qtypes &= ~(1U << i);
0f5254aa98befa Kent Overstreet     2018-12-17  134  
0f5254aa98befa Kent Overstreet     2018-12-17  135  	if (!qtypes)
0f5254aa98befa Kent Overstreet     2018-12-17  136  		return 0;
0f5254aa98befa Kent Overstreet     2018-12-17  137  
0f5254aa98befa Kent Overstreet     2018-12-17  138  	mutex_lock(&inode->ei_quota_lock);
0f5254aa98befa Kent Overstreet     2018-12-17  139  
0f5254aa98befa Kent Overstreet     2018-12-17  140  	ret = bch2_quota_transfer(c, qtypes, new_qid,
0f5254aa98befa Kent Overstreet     2018-12-17  141  				  inode->ei_qid,
0f5254aa98befa Kent Overstreet     2018-12-17  142  				  inode->v.i_blocks +
0f5254aa98befa Kent Overstreet     2018-12-17  143  				  inode->ei_quota_reserved,
0f5254aa98befa Kent Overstreet     2018-12-17  144  				  mode);
0f5254aa98befa Kent Overstreet     2018-12-17  145  	if (!ret)
0f5254aa98befa Kent Overstreet     2018-12-17  146  		for (i = 0; i < QTYP_NR; i++)
0f5254aa98befa Kent Overstreet     2018-12-17  147  			if (qtypes & (1 << i))
0f5254aa98befa Kent Overstreet     2018-12-17  148  				inode->ei_qid.q[i] = new_qid.q[i];
0f5254aa98befa Kent Overstreet     2018-12-17  149  
0f5254aa98befa Kent Overstreet     2018-12-17  150  	mutex_unlock(&inode->ei_quota_lock);
0f5254aa98befa Kent Overstreet     2018-12-17  151  
0f5254aa98befa Kent Overstreet     2018-12-17  152  	return ret;
0f5254aa98befa Kent Overstreet     2018-12-17  153  }
0f5254aa98befa Kent Overstreet     2018-12-17  154  
112d21fd1a122f Kent Overstreet     2024-06-08  155  static bool subvol_inum_eq(subvol_inum a, subvol_inum b)
284ae18c1d7aa4 Kent Overstreet     2021-03-16  156  {
112d21fd1a122f Kent Overstreet     2024-06-08  157  	return a.subvol == b.subvol && a.inum == b.inum;
284ae18c1d7aa4 Kent Overstreet     2021-03-16  158  }
284ae18c1d7aa4 Kent Overstreet     2021-03-16  159  
112d21fd1a122f Kent Overstreet     2024-06-08  160  static int bch2_vfs_inode_cmp_fn(struct rhashtable_compare_arg *arg,
112d21fd1a122f Kent Overstreet     2024-06-08  161  				 const void *obj)
284ae18c1d7aa4 Kent Overstreet     2021-03-16  162  {
112d21fd1a122f Kent Overstreet     2024-06-08  163  	const struct bch_inode_info *inode = obj;
112d21fd1a122f Kent Overstreet     2024-06-08  164  	const subvol_inum *v = arg->key;
284ae18c1d7aa4 Kent Overstreet     2021-03-16  165  
112d21fd1a122f Kent Overstreet     2024-06-08  166  	return !subvol_inum_eq(inode->ei_inum, *v);
284ae18c1d7aa4 Kent Overstreet     2021-03-16  167  }
284ae18c1d7aa4 Kent Overstreet     2021-03-16  168  
112d21fd1a122f Kent Overstreet     2024-06-08  169  static const struct rhashtable_params bch2_vfs_inodes_params = {
112d21fd1a122f Kent Overstreet     2024-06-08  170  	.head_offset		= offsetof(struct bch_inode_info, hash),
112d21fd1a122f Kent Overstreet     2024-06-08  171  	.key_offset		= offsetof(struct bch_inode_info, ei_inum),
112d21fd1a122f Kent Overstreet     2024-06-08  172  	.key_len		= sizeof(subvol_inum),
112d21fd1a122f Kent Overstreet     2024-06-08  173  	.obj_cmpfn		= bch2_vfs_inode_cmp_fn,
112d21fd1a122f Kent Overstreet     2024-06-08  174  	.automatic_shrinking	= true,
112d21fd1a122f Kent Overstreet     2024-06-08  175  };
112d21fd1a122f Kent Overstreet     2024-06-08  176  
112d21fd1a122f Kent Overstreet     2024-06-08  177  static void __wait_on_freeing_inode(struct inode *inode)
284ae18c1d7aa4 Kent Overstreet     2021-03-16  178  {
112d21fd1a122f Kent Overstreet     2024-06-08  179  	wait_queue_head_t *wq;
112d21fd1a122f Kent Overstreet     2024-06-08 @180  	DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
112d21fd1a122f Kent Overstreet     2024-06-08 @181  	wq = bit_waitqueue(&inode->i_state, __I_NEW);
112d21fd1a122f Kent Overstreet     2024-06-08  182  	prepare_to_wait(wq, &wait.wq_entry, TASK_UNINTERRUPTIBLE);
112d21fd1a122f Kent Overstreet     2024-06-08  183  	spin_unlock(&inode->i_lock);
112d21fd1a122f Kent Overstreet     2024-06-08  184  	schedule();
112d21fd1a122f Kent Overstreet     2024-06-08  185  	finish_wait(wq, &wait.wq_entry);
284ae18c1d7aa4 Kent Overstreet     2021-03-16  186  }
284ae18c1d7aa4 Kent Overstreet     2021-03-16  187  

:::::: The code at line 181 was first introduced by commit
:::::: 112d21fd1a122f778c383aa44d5448f4da9518c3 bcachefs: switch to rhashtable for vfs inodes hash

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
