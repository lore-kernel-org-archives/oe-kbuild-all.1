Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CC8F6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716789549; cv=none; b=fwBQ/6OaMoXDfbZztGB7HTcO1MLWI8MVxDXeer3lk17w6wZZ++xHzp0AIn8gdxg4lGqqQfINOi76QBllNZoE/B8QRqyuld8XqTV1J9CGOP+G6tyDhd1Z10HcaxaviEwK9+f5uDqFJ0GiyAUmsgVQpkus4sS6DUzr2LJEapefXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716789549; c=relaxed/simple;
	bh=YXhzKRhwVQrzySfA5C2DlXXc+E8vDI+yJSUHB2dgCEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tmh5RwZLxl49YZ30XI1aAbZzO6zkLlwJE1R5NiD3GvCFpcwZKs4dTTubRM0nGCNb+CCJLtTfJ6MdYVWCuf5FiBTxCFDwtrMhiWi52iNtWZZYKNYhqqkPvASf3zJ8pggBkyRGrnmHtnGsiBVEsycZm/jzzSPDzTX4n8QqSNYJFsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msGS28SV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msGS28SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716789548; x=1748325548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YXhzKRhwVQrzySfA5C2DlXXc+E8vDI+yJSUHB2dgCEU=;
  b=msGS28SVIDd/0emx39En9yre2YQB9+ymu8DqgGrL/1SHkaLZGeQ4Yn2W
   WQ8l0RqSHswKE21EXRcd381KtG5A4E6bt74eqIrgcepmBMqGKWx8GcXib
   7uYwzK6PZpJKVjlxdoAWYU/Sz9w/EHTsPuW2dng2JNhkUiPkcfObdaa1Y
   aNyM3CcE8IUuHHChfstbZd5yS1Jha71Cj3MUQ4/MSIQfmMhqzwBM/Bukd
   5dWqomuBP4VO6qYPcS8k94RwzfS8mldmptBrBSU1pyqWWyIRhX9N0bXdP
   5M8josD2sE/bRgPQfStUnmFWvt8rThtfvrdIZg4KOjehSGH6TKyFaesb8
   Q==;
X-CSE-ConnectionGUID: MhFuvfg4RJaF7i4JFRzqmw==
X-CSE-MsgGUID: bguxEjM0TVmsi52Knt5tUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16916117"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="16916117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 22:59:08 -0700
X-CSE-ConnectionGUID: Js7n6RlkROetoYc7M8DacQ==
X-CSE-MsgGUID: yRSfmqTUSnqV+HFnBL9byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="34658306"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 May 2024 22:59:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBTNv-0009Uf-2m;
	Mon, 27 May 2024 05:59:03 +0000
Date: Mon, 27 May 2024 13:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 32/32] fs/bcachefs/fsck.c:466:3: error: a
 label can only be part of a statement and a declaration is not a statement
Message-ID: <202405271334.lWczYwxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   161718dc9ebbd6c0d588becd0409c5efcfa7ff9c
commit: 161718dc9ebbd6c0d588becd0409c5efcfa7ff9c [32/32] bcachefs: check_key_has_inode()
config: x86_64-buildonly-randconfig-002-20240527 (https://download.01.org/0day-ci/archive/20240527/202405271334.lWczYwxy-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271334.lWczYwxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271334.lWczYwxy-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fsck.c: In function 'reconstruct_inode':
>> fs/bcachefs/fsck.c:466:3: error: a label can only be part of a statement and a declaration is not a statement
      struct btree_iter iter = {};
      ^~~~~~


vim +466 fs/bcachefs/fsck.c

cc0532900bcf18 Kent Overstreet 2024-03-31  457  
161718dc9ebbd6 Kent Overstreet 2024-05-26  458  static int reconstruct_inode(struct btree_trans *trans, enum btree_id btree, u32 snapshot, u64 inum)
09d4c2acbf4c86 Kent Overstreet 2024-04-01  459  {
09d4c2acbf4c86 Kent Overstreet 2024-04-01  460  	struct bch_fs *c = trans->c;
161718dc9ebbd6 Kent Overstreet 2024-05-26  461  	unsigned i_mode = S_IFREG;
161718dc9ebbd6 Kent Overstreet 2024-05-26  462  	u64 i_size = 0;
09d4c2acbf4c86 Kent Overstreet 2024-04-01  463  
161718dc9ebbd6 Kent Overstreet 2024-05-26  464  	switch (btree) {
161718dc9ebbd6 Kent Overstreet 2024-05-26  465  	case BTREE_ID_extents:
09d4c2acbf4c86 Kent Overstreet 2024-04-01 @466  		struct btree_iter iter = {};
09d4c2acbf4c86 Kent Overstreet 2024-04-01  467  
09d4c2acbf4c86 Kent Overstreet 2024-04-01  468  		bch2_trans_iter_init(trans, &iter, BTREE_ID_extents, SPOS(inum, U64_MAX, snapshot), 0);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  469  		struct bkey_s_c k = bch2_btree_iter_peek_prev(&iter);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  470  		bch2_trans_iter_exit(trans, &iter);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  471  		int ret = bkey_err(k);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  472  		if (ret)
09d4c2acbf4c86 Kent Overstreet 2024-04-01  473  			return ret;
09d4c2acbf4c86 Kent Overstreet 2024-04-01  474  
161718dc9ebbd6 Kent Overstreet 2024-05-26  475  		i_size = k.k->p.offset << 9;
161718dc9ebbd6 Kent Overstreet 2024-05-26  476  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  477  	case BTREE_ID_dirents:
161718dc9ebbd6 Kent Overstreet 2024-05-26  478  		i_mode = S_IFDIR;
161718dc9ebbd6 Kent Overstreet 2024-05-26  479  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  480  	case BTREE_ID_xattrs:
161718dc9ebbd6 Kent Overstreet 2024-05-26  481  		break;
161718dc9ebbd6 Kent Overstreet 2024-05-26  482  	default:
161718dc9ebbd6 Kent Overstreet 2024-05-26  483  		BUG();
161718dc9ebbd6 Kent Overstreet 2024-05-26  484  	}
161718dc9ebbd6 Kent Overstreet 2024-05-26  485  
161718dc9ebbd6 Kent Overstreet 2024-05-26  486  	struct bch_inode_unpacked new_inode;
161718dc9ebbd6 Kent Overstreet 2024-05-26  487  	bch2_inode_init_early(c, &new_inode);
161718dc9ebbd6 Kent Overstreet 2024-05-26  488  	bch2_inode_init_late(&new_inode, bch2_current_time(c), 0, 0, i_mode|0600, 0, NULL);
161718dc9ebbd6 Kent Overstreet 2024-05-26  489  	new_inode.bi_size = i_size;
161718dc9ebbd6 Kent Overstreet 2024-05-26  490  	new_inode.bi_inum = inum;
161718dc9ebbd6 Kent Overstreet 2024-05-26  491  
161718dc9ebbd6 Kent Overstreet 2024-05-26  492  	return __bch2_fsck_write_inode(trans, &new_inode, snapshot);
09d4c2acbf4c86 Kent Overstreet 2024-04-01  493  }
09d4c2acbf4c86 Kent Overstreet 2024-04-01  494  

:::::: The code at line 466 was first introduced by commit
:::::: 09d4c2acbf4c864fef0f520bbcba256c9a19102e bcachefs: reconstruct_inode()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
