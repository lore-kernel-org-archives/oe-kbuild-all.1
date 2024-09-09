Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB12189F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910073; cv=none; b=fJiikoD0TxTj+VKQDbFLJsiUdC4Pqo8eIMsrO6QDuTUepWS4p+iLY+CjUi6QEMnrpsa8B646NdeMFa0mEdu4OKEthsmU2QMtPrsZIJU0cqNTTse5F4yKn9ap06fEekJrCg9RW5O3Mh3p7lQ8vCYMRXC3SiQkWRQJ105qMKE4p3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910073; c=relaxed/simple;
	bh=8MVewgs6U60XrMWs3dd8D5YCXdPRF6+w4KxHzrrAp48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUmzbewvz/SUDj28HYB70jbSPzyzb69qKKkNHzziK9Pk6Z1JZdl0ngCAD3XRcQfo4Yq9O4Bv2GTrrxnGhNdDAQFoKtjxaN/q8PZZdm+QH5w2GK7OJkmkU+TGLGVqxmkFFngQXPqCmyMR4EMitxW/CbhuTHXLctEWSmCM/dmBlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhgBJ4J9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhgBJ4J9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725910071; x=1757446071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8MVewgs6U60XrMWs3dd8D5YCXdPRF6+w4KxHzrrAp48=;
  b=DhgBJ4J9PYAeA9a7W2whgmVF0NnSt9mf2lT2nTrMjBhS4zRjV0ZiW13p
   ZaIygcRITZdWwRpzpdkAs9aRdDN1fPQRK0biIRQ/NTdH+kCEe9iWb0xkO
   rn2nj3QNMdtmbc+YEGNiKZn91AHi9FAQo8EnB5CLEbCuIz80rSvu+AC/c
   mjuuPv7TWdJMM2iGcu/Otos6CTznzagBtAbXW7/XFpvsizPE5K+15eKrY
   ht3QLuB5J53tZfEIfpWq4OfFSWeX51GU73d0hu27GNup4DnOZVHSO1tPG
   1k7sargOww5V0VMGpsKYK1bL4POBU2+pFHq/A8biE93ePNlOzyfMsArJr
   w==;
X-CSE-ConnectionGUID: I8VfwPYxQqmCv+pJ6KAitA==
X-CSE-MsgGUID: LV/xStJ2Rx6h2TbG972Ehg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24819079"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24819079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 12:27:49 -0700
X-CSE-ConnectionGUID: Wft3DHHpRXia3vj4IuY5Ng==
X-CSE-MsgGUID: L2Dra97iS+mQYNCs5II8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67037998"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 12:27:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snk37-000F8a-35;
	Mon, 09 Sep 2024 19:27:45 +0000
Date: Tue, 10 Sep 2024 03:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 188/258]
 fs/bcachefs/fs-common.c:46:49: error: 'BTREE_ITER_with_updates' undeclared;
 did you mean 'BTREE_ITER_with_journal'?
Message-ID: <202409100357.VBtMBhOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 20e2d4702d10bcf4ca4a9bd027be2aaac631dfab [188/258] bcachefs: Kill BTREE_ITER_with_updates
config: x86_64-buildonly-randconfig-001-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100357.VBtMBhOT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100357.VBtMBhOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100357.VBtMBhOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fs-common.c: In function 'bch2_create_trans':
>> fs/bcachefs/fs-common.c:46:49: error: 'BTREE_ITER_with_updates' undeclared (first use in this function); did you mean 'BTREE_ITER_with_journal'?
      46 |                               BTREE_ITER_intent|BTREE_ITER_with_updates);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 BTREE_ITER_with_journal
   fs/bcachefs/fs-common.c:46:49: note: each undeclared identifier is reported only once for each function it appears in


vim +46 fs/bcachefs/fs-common.c

42d237320e9817 Kent Overstreet   2021-03-16   18  
6fed42bb7750e2 Kent Overstreet   2021-03-16   19  int bch2_create_trans(struct btree_trans *trans,
6fed42bb7750e2 Kent Overstreet   2021-03-16   20  		      subvol_inum dir,
9638574229e3ae Kent Overstreet   2019-10-02   21  		      struct bch_inode_unpacked *dir_u,
9638574229e3ae Kent Overstreet   2019-10-02   22  		      struct bch_inode_unpacked *new_inode,
9638574229e3ae Kent Overstreet   2019-10-02   23  		      const struct qstr *name,
9638574229e3ae Kent Overstreet   2019-10-02   24  		      uid_t uid, gid_t gid, umode_t mode, dev_t rdev,
9638574229e3ae Kent Overstreet   2019-10-02   25  		      struct posix_acl *default_acl,
6fed42bb7750e2 Kent Overstreet   2021-03-16   26  		      struct posix_acl *acl,
42d237320e9817 Kent Overstreet   2021-03-16   27  		      subvol_inum snapshot_src,
6fed42bb7750e2 Kent Overstreet   2021-03-16   28  		      unsigned flags)
9638574229e3ae Kent Overstreet   2019-10-02   29  {
9638574229e3ae Kent Overstreet   2019-10-02   30  	struct bch_fs *c = trans->c;
67e0dd8f0d8b4b Kent Overstreet   2021-08-30   31  	struct btree_iter dir_iter = { NULL };
67e0dd8f0d8b4b Kent Overstreet   2021-08-30   32  	struct btree_iter inode_iter = { NULL };
6fed42bb7750e2 Kent Overstreet   2021-03-16   33  	subvol_inum new_inum = dir;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02   34  	u64 now = bch2_current_time(c);
bff796ae6539b5 Kent Overstreet   2021-05-28   35  	u64 cpu = raw_smp_processor_id();
6fed42bb7750e2 Kent Overstreet   2021-03-16   36  	u64 dir_target;
6fed42bb7750e2 Kent Overstreet   2021-03-16   37  	u32 snapshot;
42d237320e9817 Kent Overstreet   2021-03-16   38  	unsigned dir_type = mode_to_type(mode);
9638574229e3ae Kent Overstreet   2019-10-02   39  	int ret;
9638574229e3ae Kent Overstreet   2019-10-02   40  
6fed42bb7750e2 Kent Overstreet   2021-03-16   41  	ret = bch2_subvolume_get_snapshot(trans, dir.subvol, &snapshot);
6fed42bb7750e2 Kent Overstreet   2021-03-16   42  	if (ret)
6fed42bb7750e2 Kent Overstreet   2021-03-16   43  		goto err;
6fed42bb7750e2 Kent Overstreet   2021-03-16   44  
ebcacf303ac177 Sasha Finkelstein 2024-08-18   45  	ret = bch2_inode_peek(trans, &dir_iter, dir_u, dir,
ebcacf303ac177 Sasha Finkelstein 2024-08-18  @46  			      BTREE_ITER_intent|BTREE_ITER_with_updates);
8b53852d0a80ec Kent Overstreet   2020-02-18   47  	if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18   48  		goto err;
9638574229e3ae Kent Overstreet   2019-10-02   49  
42d237320e9817 Kent Overstreet   2021-03-16   50  	if (!(flags & BCH_CREATE_SNAPSHOT)) {
42d237320e9817 Kent Overstreet   2021-03-16   51  		/* Normal create path - allocate a new inode: */
9638574229e3ae Kent Overstreet   2019-10-02   52  		bch2_inode_init_late(new_inode, now, uid, gid, mode, rdev, dir_u);
9638574229e3ae Kent Overstreet   2019-10-02   53  
42d237320e9817 Kent Overstreet   2021-03-16   54  		if (flags & BCH_CREATE_TMPFILE)
103ffe9aaf8566 Kent Overstreet   2023-11-02   55  			new_inode->bi_flags |= BCH_INODE_unlinked;
9638574229e3ae Kent Overstreet   2019-10-02   56  
6fed42bb7750e2 Kent Overstreet   2021-03-16   57  		ret = bch2_inode_create(trans, &inode_iter, new_inode, snapshot, cpu);
9638574229e3ae Kent Overstreet   2019-10-02   58  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18   59  			goto err;
9638574229e3ae Kent Overstreet   2019-10-02   60  
42d237320e9817 Kent Overstreet   2021-03-16   61  		snapshot_src = (subvol_inum) { 0 };
42d237320e9817 Kent Overstreet   2021-03-16   62  	} else {
42d237320e9817 Kent Overstreet   2021-03-16   63  		/*
42d237320e9817 Kent Overstreet   2021-03-16   64  		 * Creating a snapshot - we're not allocating a new inode, but
42d237320e9817 Kent Overstreet   2021-03-16   65  		 * we do have to lookup the root inode of the subvolume we're
42d237320e9817 Kent Overstreet   2021-03-16   66  		 * snapshotting and update it (in the new snapshot):
42d237320e9817 Kent Overstreet   2021-03-16   67  		 */
42d237320e9817 Kent Overstreet   2021-03-16   68  
42d237320e9817 Kent Overstreet   2021-03-16   69  		if (!snapshot_src.inum) {
42d237320e9817 Kent Overstreet   2021-03-16   70  			/* Inode wasn't specified, just snapshot: */
97996ddfdb9b0b Kent Overstreet   2021-09-30   71  			struct bch_subvolume s;
42d237320e9817 Kent Overstreet   2021-03-16   72  
97996ddfdb9b0b Kent Overstreet   2021-09-30   73  			ret = bch2_subvolume_get(trans, snapshot_src.subvol, true,
5dd8c60e1e0448 Kent Overstreet   2024-04-07   74  						 BTREE_ITER_cached, &s);
42d237320e9817 Kent Overstreet   2021-03-16   75  			if (ret)
42d237320e9817 Kent Overstreet   2021-03-16   76  				goto err;
97996ddfdb9b0b Kent Overstreet   2021-09-30   77  
97996ddfdb9b0b Kent Overstreet   2021-09-30   78  			snapshot_src.inum = le64_to_cpu(s.inode);
42d237320e9817 Kent Overstreet   2021-03-16   79  		}
42d237320e9817 Kent Overstreet   2021-03-16   80  
42d237320e9817 Kent Overstreet   2021-03-16   81  		ret = bch2_inode_peek(trans, &inode_iter, new_inode, snapshot_src,
5dd8c60e1e0448 Kent Overstreet   2024-04-07   82  				      BTREE_ITER_intent);
42d237320e9817 Kent Overstreet   2021-03-16   83  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16   84  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   85  
42d237320e9817 Kent Overstreet   2021-03-16   86  		if (new_inode->bi_subvol != snapshot_src.subvol) {
42d237320e9817 Kent Overstreet   2021-03-16   87  			/* Not a subvolume root: */
42d237320e9817 Kent Overstreet   2021-03-16   88  			ret = -EINVAL;
42d237320e9817 Kent Overstreet   2021-03-16   89  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   90  		}
42d237320e9817 Kent Overstreet   2021-03-16   91  
42d237320e9817 Kent Overstreet   2021-03-16   92  		/*
42d237320e9817 Kent Overstreet   2021-03-16   93  		 * If we're not root, we have to own the subvolume being
42d237320e9817 Kent Overstreet   2021-03-16   94  		 * snapshotted:
42d237320e9817 Kent Overstreet   2021-03-16   95  		 */
42d237320e9817 Kent Overstreet   2021-03-16   96  		if (uid && new_inode->bi_uid != uid) {
42d237320e9817 Kent Overstreet   2021-03-16   97  			ret = -EPERM;
42d237320e9817 Kent Overstreet   2021-03-16   98  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16   99  		}
42d237320e9817 Kent Overstreet   2021-03-16  100  
42d237320e9817 Kent Overstreet   2021-03-16  101  		flags |= BCH_CREATE_SUBVOL;
42d237320e9817 Kent Overstreet   2021-03-16  102  	}
42d237320e9817 Kent Overstreet   2021-03-16  103  
6fed42bb7750e2 Kent Overstreet   2021-03-16  104  	new_inum.inum	= new_inode->bi_inum;
6fed42bb7750e2 Kent Overstreet   2021-03-16  105  	dir_target	= new_inode->bi_inum;
6fed42bb7750e2 Kent Overstreet   2021-03-16  106  
42d237320e9817 Kent Overstreet   2021-03-16  107  	if (flags & BCH_CREATE_SUBVOL) {
42d237320e9817 Kent Overstreet   2021-03-16  108  		u32 new_subvol, dir_snapshot;
42d237320e9817 Kent Overstreet   2021-03-16  109  
42d237320e9817 Kent Overstreet   2021-03-16  110  		ret = bch2_subvolume_create(trans, new_inode->bi_inum,
b8628a2529e7d6 Kent Overstreet   2024-02-08  111  					    dir.subvol,
42d237320e9817 Kent Overstreet   2021-03-16  112  					    snapshot_src.subvol,
42d237320e9817 Kent Overstreet   2021-03-16  113  					    &new_subvol, &snapshot,
42d237320e9817 Kent Overstreet   2021-03-16  114  					    (flags & BCH_CREATE_SNAPSHOT_RO) != 0);
42d237320e9817 Kent Overstreet   2021-03-16  115  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  116  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  117  
42d237320e9817 Kent Overstreet   2021-03-16  118  		new_inode->bi_parent_subvol	= dir.subvol;
42d237320e9817 Kent Overstreet   2021-03-16  119  		new_inode->bi_subvol		= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  120  		new_inum.subvol			= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  121  		dir_target			= new_subvol;
42d237320e9817 Kent Overstreet   2021-03-16  122  		dir_type			= DT_SUBVOL;
42d237320e9817 Kent Overstreet   2021-03-16  123  
42d237320e9817 Kent Overstreet   2021-03-16  124  		ret = bch2_subvolume_get_snapshot(trans, dir.subvol, &dir_snapshot);
42d237320e9817 Kent Overstreet   2021-03-16  125  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  126  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  127  
42d237320e9817 Kent Overstreet   2021-03-16  128  		bch2_btree_iter_set_snapshot(&dir_iter, dir_snapshot);
42d237320e9817 Kent Overstreet   2021-03-16  129  		ret = bch2_btree_iter_traverse(&dir_iter);
42d237320e9817 Kent Overstreet   2021-03-16  130  		if (ret)
42d237320e9817 Kent Overstreet   2021-03-16  131  			goto err;
42d237320e9817 Kent Overstreet   2021-03-16  132  	}
42d237320e9817 Kent Overstreet   2021-03-16  133  
42d237320e9817 Kent Overstreet   2021-03-16  134  	if (!(flags & BCH_CREATE_SNAPSHOT)) {
9638574229e3ae Kent Overstreet   2019-10-02  135  		if (default_acl) {
6fed42bb7750e2 Kent Overstreet   2021-03-16  136  			ret = bch2_set_acl_trans(trans, new_inum, new_inode,
9638574229e3ae Kent Overstreet   2019-10-02  137  						 default_acl, ACL_TYPE_DEFAULT);
9638574229e3ae Kent Overstreet   2019-10-02  138  			if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  139  				goto err;
9638574229e3ae Kent Overstreet   2019-10-02  140  		}
9638574229e3ae Kent Overstreet   2019-10-02  141  
9638574229e3ae Kent Overstreet   2019-10-02  142  		if (acl) {
6fed42bb7750e2 Kent Overstreet   2021-03-16  143  			ret = bch2_set_acl_trans(trans, new_inum, new_inode,
9638574229e3ae Kent Overstreet   2019-10-02  144  						 acl, ACL_TYPE_ACCESS);
9638574229e3ae Kent Overstreet   2019-10-02  145  			if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  146  				goto err;
9638574229e3ae Kent Overstreet   2019-10-02  147  		}
42d237320e9817 Kent Overstreet   2021-03-16  148  	}
9638574229e3ae Kent Overstreet   2019-10-02  149  
42d237320e9817 Kent Overstreet   2021-03-16  150  	if (!(flags & BCH_CREATE_TMPFILE)) {
9638574229e3ae Kent Overstreet   2019-10-02  151  		struct bch_hash_info dir_hash = bch2_hash_info_init(c, dir_u);
42d237320e9817 Kent Overstreet   2021-03-16  152  		u64 dir_offset;
9638574229e3ae Kent Overstreet   2019-10-02  153  
42d237320e9817 Kent Overstreet   2021-03-16  154  		if (is_subdir_for_nlink(new_inode))
9638574229e3ae Kent Overstreet   2019-10-02  155  			dir_u->bi_nlink++;
6fed42bb7750e2 Kent Overstreet   2021-03-16  156  		dir_u->bi_mtime = dir_u->bi_ctime = now;
9638574229e3ae Kent Overstreet   2019-10-02  157  
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  158  		ret = bch2_inode_write(trans, &dir_iter, dir_u);
9638574229e3ae Kent Overstreet   2019-10-02  159  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  160  			goto err;
9638574229e3ae Kent Overstreet   2019-10-02  161  
6fed42bb7750e2 Kent Overstreet   2021-03-16  162  		ret = bch2_dirent_create(trans, dir, &dir_hash,
6fed42bb7750e2 Kent Overstreet   2021-03-16  163  					 dir_type,
6fed42bb7750e2 Kent Overstreet   2021-03-16  164  					 name,
6fed42bb7750e2 Kent Overstreet   2021-03-16  165  					 dir_target,
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  166  					 &dir_offset,
ebcacf303ac177 Sasha Finkelstein 2024-08-18  167  					 STR_HASH_must_create|BTREE_ITER_with_updates);
9638574229e3ae Kent Overstreet   2019-10-02  168  		if (ret)
8b53852d0a80ec Kent Overstreet   2020-02-18  169  			goto err;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  170  
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  171  		new_inode->bi_dir		= dir_u->bi_inum;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  172  		new_inode->bi_dir_offset	= dir_offset;
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  173  	}
ab2a29ccffd0e9 Kent Overstreet   2021-03-02  174  
5dd8c60e1e0448 Kent Overstreet   2024-04-07  175  	inode_iter.flags &= ~BTREE_ITER_all_snapshots;
6fed42bb7750e2 Kent Overstreet   2021-03-16  176  	bch2_btree_iter_set_snapshot(&inode_iter, snapshot);
e6ae27272491af Kent Overstreet   2021-03-15  177  
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  178  	ret   = bch2_btree_iter_traverse(&inode_iter) ?:
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  179  		bch2_inode_write(trans, &inode_iter, new_inode);
8b53852d0a80ec Kent Overstreet   2020-02-18  180  err:
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  181  	bch2_trans_iter_exit(trans, &inode_iter);
67e0dd8f0d8b4b Kent Overstreet   2021-08-30  182  	bch2_trans_iter_exit(trans, &dir_iter);
8b53852d0a80ec Kent Overstreet   2020-02-18  183  	return ret;
9638574229e3ae Kent Overstreet   2019-10-02  184  }
9638574229e3ae Kent Overstreet   2019-10-02  185  

:::::: The code at line 46 was first introduced by commit
:::::: ebcacf303ac1773a9927e482b8ee47a925718db4 bcachefs: Hook up RENAME_WHITEOUT in rename.

:::::: TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
