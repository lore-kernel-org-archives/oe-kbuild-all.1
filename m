Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A77B3F8F4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711979360; cv=none; b=iit9jXpGR7Kk9cE7fhbLdlqrMNMmI3KX9RZEwTRm85QvuVjd89G6BmnM9lg2PPPBxejj4HEWnFBCbv9WMbU06pdIXX0MAb7va8lbkcNUisY4z/H7+cnWh/U7y+/a83KaNblAP98gwL/chjansKKRZ6s/iD8eSZhRzW2LiYCopD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711979360; c=relaxed/simple;
	bh=1GWKkSIfZTcwvmchlO/LvhtuAgwqhjDVzCIxnrL36bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GK82PO96BbR/2xu9DvaY/oE/SVTCfCHqQ2zjVqJLZKH1hE/yZ13XBY8Illnm3TxKvolYhWc1z744vMpivQMAWz5awrUAf2dwaKwurUDRMc2lPvdjjrwzg1Kvfgy6fP/h/rWwSP7RNyZowqn7VApVRuDsUkMdwTkXORCI/TkQWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2LcWf9G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2LcWf9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711979358; x=1743515358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GWKkSIfZTcwvmchlO/LvhtuAgwqhjDVzCIxnrL36bg=;
  b=J2LcWf9G/FTQ1O9A5bUNmQWNKEcdNS3To2e1EcDqwoXQtx9LtbgizPhd
   0uWV74asX0uQ7MYzLCFZWRRtQBla+YXtmc435SzEgeIAxDqI2p3D9qorG
   iPFH1XhDnnaLa/5WLvzqoNOdjwnnxQ3dhYbpWpraASYKrVg0IMEBln09R
   Jo4Gug8YnEOLiQd0VP2wMYTtbmVIjN4xZeApVfISGMnbGsGyHqCbF8Qly
   MFwkdDCzjsqWhKIIy6z+p1DHA+D2ZQComlQkp0uz6j1ChhSyKzTtv/Qgr
   7cptclfg8cWEXy540s2NPKIlJA0fdz94VDNQY6Ifo4QeIylI/2cam53WS
   g==;
X-CSE-ConnectionGUID: SVT0K4d4SL2Eey1ePyy0rQ==
X-CSE-MsgGUID: i97jBQFmQr6Dn0LisPIaQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="32510273"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="32510273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 06:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="48914308"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 06:49:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrI2B-0000LJ-0y;
	Mon, 01 Apr 2024 13:49:11 +0000
Date: Mon, 1 Apr 2024 21:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 43/44] fs/bcachefs/fsck.c:205:33: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202404012158.0J5gVpst-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   2247fc9001fd980979d65726fa87ccabc9ecf8f8
commit: 3b7937f4231b53da25877808b1b3157cedd08be7 [43/44] bcachefs: Subvolume reconstruction
config: x86_64-randconfig-123-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012158.0J5gVpst-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404012158.0J5gVpst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404012158.0J5gVpst-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fsck.c: note: in included file:
   fs/bcachefs/bcachefs.h:1025:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/fsck.c:205:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] inode @@     got restricted __le32 [usertype] @@
   fs/bcachefs/fsck.c:205:33: sparse:     expected restricted __le64 [usertype] inode
   fs/bcachefs/fsck.c:205:33: sparse:     got restricted __le32 [usertype]
>> fs/bcachefs/fsck.c:440:29: sparse: sparse: cast from restricted __le32
>> fs/bcachefs/fsck.c:440:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] snapshot_tree @@     got restricted __le32 [usertype] @@
   fs/bcachefs/fsck.c:440:29: sparse:     expected unsigned int [usertype] snapshot_tree
   fs/bcachefs/fsck.c:440:29: sparse:     got restricted __le32 [usertype]
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/fsck.c:442:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] subvol @@     got unsigned int [usertype] @@
   fs/bcachefs/fsck.c:442:21: sparse:     expected restricted __le32 [usertype] subvol
   fs/bcachefs/fsck.c:442:21: sparse:     got unsigned int [usertype]

vim +205 fs/bcachefs/fsck.c

   168	
   169	/* Get lost+found, create if it doesn't exist: */
   170	static int lookup_lostfound(struct btree_trans *trans, u32 snapshot,
   171				    struct bch_inode_unpacked *lostfound,
   172				    u64 reattaching_inum)
   173	{
   174		struct bch_fs *c = trans->c;
   175		struct qstr lostfound_str = QSTR("lost+found");
   176		u64 inum = 0;
   177		unsigned d_type = 0;
   178		int ret;
   179	
   180		struct bch_snapshot_tree st;
   181		ret = bch2_snapshot_tree_lookup(trans,
   182				bch2_snapshot_tree(c, snapshot), &st);
   183		if (ret)
   184			return ret;
   185	
   186		subvol_inum root_inum = { .subvol = le32_to_cpu(st.master_subvol) };
   187	
   188		struct bch_subvolume subvol;
   189		ret = bch2_subvolume_get(trans, le32_to_cpu(st.master_subvol),
   190					 false, 0, &subvol);
   191		bch_err_msg(c, ret, "looking up root subvol %u for snapshot %u",
   192			    le32_to_cpu(st.master_subvol), snapshot);
   193		if (ret)
   194			return ret;
   195	
   196		if (!subvol.inode) {
   197			struct btree_iter iter;
   198			struct bkey_i_subvolume *subvol = bch2_bkey_get_mut_typed(trans, &iter,
   199					BTREE_ID_subvolumes, POS(0, le32_to_cpu(st.master_subvol)),
   200					0, subvolume);
   201			ret = PTR_ERR_OR_ZERO(subvol);
   202			if (ret)
   203				return ret;
   204	
 > 205			subvol->v.inode = cpu_to_le32(reattaching_inum);
   206			bch2_trans_iter_exit(trans, &iter);
   207		}
   208	
   209		root_inum.inum = le64_to_cpu(subvol.inode);
   210	
   211		struct bch_inode_unpacked root_inode;
   212		struct bch_hash_info root_hash_info;
   213		u32 root_inode_snapshot = snapshot;
   214		ret = lookup_inode(trans, root_inum.inum, &root_inode, &root_inode_snapshot);
   215		bch_err_msg(c, ret, "looking up root inode %llu for subvol %u",
   216			    root_inum.inum, le32_to_cpu(st.master_subvol));
   217		if (ret)
   218			return ret;
   219	
   220		root_hash_info = bch2_hash_info_init(c, &root_inode);
   221	
   222		ret = lookup_dirent_in_snapshot(trans, root_hash_info, root_inum,
   223				      &lostfound_str, &inum, &d_type, snapshot);
   224		if (bch2_err_matches(ret, ENOENT))
   225			goto create_lostfound;
   226	
   227		bch_err_fn(c, ret);
   228		if (ret)
   229			return ret;
   230	
   231		if (d_type != DT_DIR) {
   232			bch_err(c, "error looking up lost+found: not a directory");
   233			return -BCH_ERR_ENOENT_not_directory;
   234		}
   235	
   236		/*
   237		 * The bch2_check_dirents pass has already run, dangling dirents
   238		 * shouldn't exist here:
   239		 */
   240		ret = lookup_inode(trans, inum, lostfound, &snapshot);
   241		bch_err_msg(c, ret, "looking up lost+found %llu:%u in (root inode %llu, snapshot root %u)",
   242			    inum, snapshot, root_inum.inum, bch2_snapshot_root(c, snapshot));
   243		return ret;
   244	
   245	create_lostfound:
   246		/*
   247		 * XXX: we could have a nicer log message here  if we had a nice way to
   248		 * walk backpointers to print a path
   249		 */
   250		bch_notice(c, "creating lost+found in snapshot %u", le32_to_cpu(st.root_snapshot));
   251	
   252		u64 now = bch2_current_time(c);
   253		struct btree_iter lostfound_iter = { NULL };
   254		u64 cpu = raw_smp_processor_id();
   255	
   256		bch2_inode_init_early(c, lostfound);
   257		bch2_inode_init_late(lostfound, now, 0, 0, S_IFDIR|0700, 0, &root_inode);
   258		lostfound->bi_dir = root_inode.bi_inum;
   259	
   260		root_inode.bi_nlink++;
   261	
   262		ret = bch2_inode_create(trans, &lostfound_iter, lostfound, snapshot, cpu);
   263		if (ret)
   264			goto err;
   265	
   266		bch2_btree_iter_set_snapshot(&lostfound_iter, snapshot);
   267		ret = bch2_btree_iter_traverse(&lostfound_iter);
   268		if (ret)
   269			goto err;
   270	
   271		ret =   bch2_dirent_create_snapshot(trans,
   272					0, root_inode.bi_inum, snapshot, &root_hash_info,
   273					mode_to_type(lostfound->bi_mode),
   274					&lostfound_str,
   275					lostfound->bi_inum,
   276					&lostfound->bi_dir_offset,
   277					BCH_HASH_SET_MUST_CREATE) ?:
   278			bch2_inode_write_flags(trans, &lostfound_iter, lostfound,
   279					       BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE);
   280	err:
   281		bch_err_msg(c, ret, "creating lost+found");
   282		bch2_trans_iter_exit(trans, &lostfound_iter);
   283		return ret;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
