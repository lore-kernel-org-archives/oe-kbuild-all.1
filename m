Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860C21A0C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711976222; cv=none; b=lxF9jD9oXBZ9VFYs4oF8UxFHfnFOkhdFHGpQNdSqHMBHIu7R1E3dBilLlQ//7htBC2xCaypOW414RxznrbleIJ6A0AVJmTFG/9fTQUxfbW8xJhoIH4MGBul4nLe8Qda1SzoNzcvwZ67VB3LKPYIfqj6QMdT0OLuKnyrsvFOKTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711976222; c=relaxed/simple;
	bh=Ni/JwStxjX9XZbHvm0Tv7AZ4TJfMB6rBay2VT+WzhAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASBsCXwH+SQu8HruPPU6kNSTREHFrIdaJzOZy79tyqWw4IhkQ9QEIpkRPkZhOjSkwhxGuaclmHj9OlcdZG1lsffvv3P5IybUUZk0N1OzmEBxm4/6Tqhe4vyuSI+ehmIZqjTbUa/aZW+a57jLdsx1pyaF2vJgYEIOlSEn0NtxSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQlrPwCn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQlrPwCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711976221; x=1743512221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ni/JwStxjX9XZbHvm0Tv7AZ4TJfMB6rBay2VT+WzhAw=;
  b=cQlrPwCneLRUifVwzKcu5JGIW7TK80OpLOlce0WDIy6bRXnn0SWqcIYx
   I9CMeQ7Qkg69EahX8DIFDSNYI0dWiUlvkNjb8LI8+yy+OHlukfRyNJxE7
   cApDkZVuAxMl0wHOd5ExXz5N3WuKarI0wD3GT04csA8Yj0UDNCKaibgOp
   KB9tuLemjPQiiv9GKEpwU4rdY6PK7oiKZRAdg+hxCPaWDpqeHRIKZ/Zkk
   /a9ws4scT/0ncF+HeyJ4WK8zZGTk8+3KkUdSlIMC7uppPNNNRJYcpEWLc
   M3AuB141nGVhT/8QrxuVEwCLIleoIqqN+SYwT27kJQ3Ma4pjstaIq/oBA
   Q==;
X-CSE-ConnectionGUID: 08yHKTWzTXGPG9YkzVvBcw==
X-CSE-MsgGUID: Bbb31xacQPaMzciLkSHO7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="24593818"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="24593818"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 05:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18107778"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2024 05:56:59 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrHDW-0000JX-1m;
	Mon, 01 Apr 2024 12:56:53 +0000
Date: Mon, 1 Apr 2024 20:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 43/44] fs/bcachefs/fsck.c:440:29: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202404012032.WZINavpG-lkp@intel.com>
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
config: sparc64-randconfig-r113-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012032.WZINavpG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404012032.WZINavpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404012032.WZINavpG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fsck.c: note: in included file:
   fs/bcachefs/bcachefs.h:1025:9: sparse: sparse: array of flexible structures
   fs/bcachefs/fsck.c:205:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] inode @@     got restricted __le32 [usertype] @@
   fs/bcachefs/fsck.c:205:33: sparse:     expected restricted __le64 [usertype] inode
   fs/bcachefs/fsck.c:205:33: sparse:     got restricted __le32 [usertype]
>> fs/bcachefs/fsck.c:440:29: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] tree @@
   fs/bcachefs/fsck.c:440:29: sparse:     expected unsigned int [usertype] val
   fs/bcachefs/fsck.c:440:29: sparse:     got restricted __le32 [usertype] tree
   fs/bcachefs/fsck.c:440:29: sparse: sparse: cast from restricted __le32
   fs/bcachefs/fsck.c:440:29: sparse: sparse: cast from restricted __le32
   fs/bcachefs/fsck.c:440:29: sparse: sparse: cast from restricted __le32
   fs/bcachefs/fsck.c:440:29: sparse: sparse: cast from restricted __le32
   fs/bcachefs/fsck.c:440:29: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] snapshot_tree @@     got restricted __le32 [usertype] @@
   fs/bcachefs/fsck.c:440:29: sparse:     expected unsigned int [usertype] snapshot_tree
   fs/bcachefs/fsck.c:440:29: sparse:     got restricted __le32 [usertype]
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:23: sparse: sparse: cast to restricted __le32
   fs/bcachefs/fsck.c:442:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] subvol @@     got unsigned int [usertype] @@
   fs/bcachefs/fsck.c:442:21: sparse:     expected restricted __le32 [usertype] subvol
   fs/bcachefs/fsck.c:442:21: sparse:     got unsigned int [usertype]

vim +440 fs/bcachefs/fsck.c

   382	
   383	static int reconstruct_subvol(struct btree_trans *trans, u32 snapshotid, u32 subvolid, u64 inum)
   384	{
   385		struct bch_fs *c = trans->c;
   386	
   387		if (!bch2_snapshot_is_leaf(c, snapshotid)) {
   388			bch_err(c, "need to reconstruct subvol, but have interior node snapshot");
   389			return -BCH_ERR_fsck_repair_unimplemented;
   390		}
   391	
   392		/*
   393		 * If inum isn't set, that means we're being called from check_dirents,
   394		 * not check_inodes - the root of this subvolume doesn't exist or we
   395		 * would have found it there:
   396		 */
   397		if (!inum) {
   398			struct btree_iter inode_iter = {};
   399			struct bch_inode_unpacked new_inode;
   400			u64 cpu = raw_smp_processor_id();
   401	
   402			bch2_inode_init_early(c, &new_inode);
   403			bch2_inode_init_late(&new_inode, bch2_current_time(c), 0, 0, S_IFDIR|0755, 0, NULL);
   404	
   405			new_inode.bi_subvol = subvolid;
   406	
   407			int ret = bch2_inode_create(trans, &inode_iter, &new_inode, snapshotid, cpu) ?:
   408				  bch2_btree_iter_traverse(&inode_iter) ?:
   409				  bch2_inode_write(trans, &inode_iter, &new_inode);
   410			bch2_trans_iter_exit(trans, &inode_iter);
   411			if (ret)
   412				return ret;
   413	
   414			inum = new_inode.bi_inum;
   415		}
   416	
   417		bch_info(c, "reconstructing subvol %u with root inode %llu", subvolid, inum);
   418	
   419		struct bkey_i_subvolume *new_subvol = bch2_trans_kmalloc(trans, sizeof(*new_subvol));
   420		int ret = PTR_ERR_OR_ZERO(new_subvol);
   421		if (ret)
   422			return ret;
   423	
   424		bkey_subvolume_init(&new_subvol->k_i);
   425		new_subvol->k.p.offset	= subvolid;
   426		new_subvol->v.snapshot	= cpu_to_le32(snapshotid);
   427		new_subvol->v.inode	= cpu_to_le64(inum);
   428		ret = bch2_btree_insert_trans(trans, BTREE_ID_subvolumes, &new_subvol->k_i, 0);
   429		if (ret)
   430			return ret;
   431	
   432		struct btree_iter iter;
   433		struct bkey_i_snapshot *s = bch2_bkey_get_mut_typed(trans, &iter,
   434				BTREE_ID_snapshots, POS(0, snapshotid),
   435				0, snapshot);
   436		ret = PTR_ERR_OR_ZERO(s);
   437		if (ret)
   438			return ret;
   439	
 > 440		u32 snapshot_tree = cpu_to_le32(s->v.tree);
   441	
   442		s->v.subvol = le32_to_cpu(subvolid);
   443		SET_BCH_SNAPSHOT_SUBVOL(&s->v, true);
   444		bch2_trans_iter_exit(trans, &iter);
   445	
   446		struct bkey_i_snapshot_tree *st = bch2_bkey_get_mut_typed(trans, &iter,
   447				BTREE_ID_snapshot_trees, POS(0, snapshot_tree),
   448				0, snapshot_tree);
   449		ret = PTR_ERR_OR_ZERO(st);
   450		if (ret)
   451			return ret;
   452	
   453		if (!st->v.master_subvol)
   454			st->v.master_subvol = cpu_to_le32(subvolid);
   455	
   456		bch2_trans_iter_exit(trans, &iter);
   457		return 0;
   458	}
   459	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
