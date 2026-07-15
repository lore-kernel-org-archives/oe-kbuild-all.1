Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018D92931D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784085655; cv=none; b=lCQlUfKv5D5BAU/uiZcVRgB/rrYz5BLOrVN+xHq4W+v6NIVuwMqkSic+e78mLhTrTfr5424/ftp6L6ZWS4Fmsel+qZCEVyHYMQJ0lcMbyOPEJ9NLlruTJb5dnBkIE6ANhLwm0J6nssXncIWYQjx72Ox6XiHakyqaTUDAl+/8kIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784085655; c=relaxed/simple;
	bh=6kx4dZINQj2G3tBMB81EP8wpjoytJQ508TrY6HcruEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bGtwLDTA1eM/8f3BOYIGLzN/iQt29Fw04Buyz97LbF2uKkoKjQTRzUyTX/T8dweoeO51bqiAPsAY+D90D8zLEGISOzW3r82fsNagGu1xpCGwuT75L3hSpy91r867/EQdLrmLxalNPQN0nS2iDaUCAfZeFQV7fNtahl71/Nz6vQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFgye8xR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFgye8xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784085653; x=1815621653;
  h=date:from:to:cc:subject:message-id;
  bh=6kx4dZINQj2G3tBMB81EP8wpjoytJQ508TrY6HcruEk=;
  b=TFgye8xRxKqOhDj19XqWd9oRq2ePsb+wxn+vfdRw0+2YEet9H/eJHqwp
   DvAR6pxonetbC43ViBj3VDzF1LRRVIpsQl7CEcQjNSJBoneDqKUG09dub
   aZindGXD4sJG+iMUeqiSzMGj5AnbdkoFxnfykRZm45VZjyYe/q+vDDSNm
   p54UIkLE805PadmxmT5K3OBhmfiVKSpiA0++G9feubYpMKL0dxhWqKkbD
   rH50gRvRsE9KQ1WP4MTwPGvdXXzvsAOmuC8fXKO+umlWlrWLg3H0jAXY1
   SNPnHyonk+tN1IlIFY17M7rY7oWDtOO5orxD09ad74vsueSo9xGedLEbq
   A==;
X-CSE-ConnectionGUID: 7XBmyaJVRPGR9QBcDPAe1A==
X-CSE-MsgGUID: U02NNeRgSMuVx0D0PtHtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84674782"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="84674782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 20:20:52 -0700
X-CSE-ConnectionGUID: pf71QAclQVC+b03GZ6omLA==
X-CSE-MsgGUID: jZ5Xe/laQJCueiPwOwndZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="252073156"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2026 20:20:51 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjqAy-0000000049h-391k;
	Wed, 15 Jul 2026 03:20:48 +0000
Date: Wed, 15 Jul 2026 05:20:03 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:btrfs-enomem 2/4] fs/btrfs/dir-item.c:108:12:
 error: static declaration of '__btrfs_insert_dir_item' follows non-static
 declaration
Message-ID: <202607150522.cdKYAZae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git btrfs-enomem
head:   746fbc9ddb34e692540b3700e9c96edb73788460
commit: cc25c3e12a57d763b9d88429f09d28547d5eff68 [2/4] btrfs: pre-allocate delayed dir index before btree modification
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607150522.cdKYAZae-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607150522.cdKYAZae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607150522.cdKYAZae-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/dir-item.c:108:12: error: static declaration of '__btrfs_insert_dir_item' follows non-static declaration
     108 | static int __btrfs_insert_dir_item(struct btrfs_trans_handle *trans,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/btrfs/dir-item.c:11:
   fs/btrfs/dir-item.h:20:5: note: previous declaration of '__btrfs_insert_dir_item' with type 'int(struct btrfs_trans_handle *, const struct fscrypt_str *, struct btrfs_inode *, const struct btrfs_key *, u8,  u64,  struct btrfs_dir_index_prealloc *)' {aka 'int(struct btrfs_trans_handle *, const struct fscrypt_str *, struct btrfs_inode *, const struct btrfs_key *, unsigned char,  long long unsigned int,  struct btrfs_dir_index_prealloc *)'}
      20 | int __btrfs_insert_dir_item(struct btrfs_trans_handle *trans,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__btrfs_insert_dir_item +108 fs/btrfs/dir-item.c

    99	
   100	/*
   101	 * insert a directory item in the tree, doing all the magic for
   102	 * both indexes. 'dir' indicates which objectid to insert it into,
   103	 * 'location' is the key to stuff into the directory item, 'type' is the
   104	 * type of the inode we're pointing to, and 'index' is the sequence number
   105	 * to use for the second index (if one is created).
   106	 * Will return 0 or -ENOMEM
   107	 */
 > 108	static int __btrfs_insert_dir_item(struct btrfs_trans_handle *trans,
   109					   const struct fscrypt_str *name,
   110					   struct btrfs_inode *dir,
   111					   const struct btrfs_key *location, u8 type,
   112					   u64 index,
   113					   struct btrfs_dir_index_prealloc *prealloc)
   114	{
   115		int ret = 0;
   116		int ret2 = 0;
   117		struct btrfs_root *root = dir->root;
   118		BTRFS_PATH_AUTO_FREE(path);
   119		struct btrfs_dir_item *dir_item;
   120		struct extent_buffer *leaf;
   121		unsigned long name_ptr;
   122		struct btrfs_key key;
   123		struct btrfs_disk_key disk_key;
   124		u32 data_size;
   125		const bool need_delayed_index = (root != root->fs_info->tree_root);
   126		struct btrfs_dir_index_prealloc local_prealloc;
   127	
   128		key.objectid = btrfs_ino(dir);
   129		key.type = BTRFS_DIR_ITEM_KEY;
   130		key.offset = btrfs_name_hash(name->name, name->len);
   131	
   132		path = btrfs_alloc_path();
   133		if (!path)
   134			return -ENOMEM;
   135	
   136		btrfs_cpu_key_to_disk(&disk_key, location);
   137	
   138		/*
   139		 * Pre-allocate the delayed dir index before modifying the btree so
   140		 * that ENOMEM is returned before any on-disk state changes, allowing
   141		 * the caller to handle it gracefully instead of aborting.
   142		 */
   143		if (need_delayed_index && !prealloc) {
   144			ret = btrfs_prealloc_delayed_dir_index(dir, name->name,
   145							       name->len,
   146							       &local_prealloc);
   147			if (ret)
   148				return ret;
   149			memcpy(local_prealloc.item->data + sizeof(struct btrfs_dir_item),
   150			       name->name, name->len);
   151			prealloc = &local_prealloc;
   152		}
   153	
   154		data_size = sizeof(*dir_item) + name->len;
   155		dir_item = insert_with_overflow(trans, root, path, &key, data_size,
   156						name->name, name->len);
   157		if (IS_ERR(dir_item)) {
   158			ret = PTR_ERR(dir_item);
   159			if (ret == -EEXIST)
   160				goto second_insert;
   161			if (need_delayed_index)
   162				btrfs_free_delayed_dir_index_prealloc(trans, prealloc);
   163			goto out_free;
   164		}
   165	
   166		if (IS_ENCRYPTED(&dir->vfs_inode))
   167			type |= BTRFS_FT_ENCRYPTED;
   168	
   169		leaf = path->nodes[0];
   170		btrfs_set_dir_item_key(leaf, dir_item, &disk_key);
   171		btrfs_set_dir_flags(leaf, dir_item, type);
   172		btrfs_set_dir_data_len(leaf, dir_item, 0);
   173		btrfs_set_dir_name_len(leaf, dir_item, name->len);
   174		btrfs_set_dir_transid(leaf, dir_item, trans->transid);
   175		name_ptr = (unsigned long)(dir_item + 1);
   176	
   177		write_extent_buffer(leaf, name->name, name_ptr, name->len);
   178	
   179	second_insert:
   180		if (!need_delayed_index) {
   181			ret = 0;
   182			goto out_free;
   183		}
   184		btrfs_release_path(path);
   185	
   186		ret2 = btrfs_insert_delayed_dir_index_prealloc(trans, dir, prealloc,
   187							       &disk_key, type, index);
   188	out_free:
   189		if (ret)
   190			return ret;
   191		if (ret2)
   192			return ret2;
   193		return 0;
   194	}
   195	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
