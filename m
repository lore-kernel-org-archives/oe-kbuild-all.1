Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1553199FAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867819; cv=none; b=H3eDolQlXctaYuFTDCunY5Idg8mxglOdmiv3LZBmrZkLe7ulnhuaNFTdUkKoX6W7qwKjknl3c2+mWeT28VqNWuwLRc1UgU86r1jU4ujU57d5QzLxa64Z5+B3SlibJA6KixEeYTw2dETR+IkQTbyadIlxODnOiv7Q9JMaaaFLhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867819; c=relaxed/simple;
	bh=T0dJUuyTERuYjJTPAKmtB3duowFkljPn3A+2vb7ido4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsp3MTk1uC1/jfDPNeyhHpYyeQHka5vYrsdo9wMSmasbB10Hl5m8BScxFvhUu74AXSYfvI+r1d8Iwkf1xxit7Om8eOMtl1sIrLKxN8ynEt5nFGGUSZC19Yx3yYw2bu/r75AHt8Dx9vK3ewTT2KYmhGLc82ks+ZRz7U4M6lOG6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaPGBSvl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaPGBSvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755867817; x=1787403817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T0dJUuyTERuYjJTPAKmtB3duowFkljPn3A+2vb7ido4=;
  b=HaPGBSvlby+V8cbChPx6h1XTK1e6ho7tZ1sSPb7jrQyw+RPanZVz74Pj
   BuYNKOEJujeu+ClbNuL9tlNr3aC7qdVmX/rsacQLHBNd1Dr6YFlqz+BA3
   7xpjM06frdjAGiMWKh72HaABaK/m3EVVuhoN30/Hwr+ilEmJzIBAqcPAu
   dUBpJk2zMahuK5Bj8KQMjpq6fnhD3JfEvLMBkgIg1bUaYTk2M0fJkkT2A
   uJlvLyKzQIVBUWIr+DyprbCtgKg0NPRUmzbA5ZIRWM8s5mf65Fipczfhr
   K8p1rNWppLFbN7s71A3mMqv03rtnvLdoRn6rWDDlZ9sAKbn8I+d96nKjV
   w==;
X-CSE-ConnectionGUID: L+DgNy2LQ3+GG86esHHthg==
X-CSE-MsgGUID: Xx8Fz+zhShuBTxPPE1hDdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75754896"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75754896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 06:03:37 -0700
X-CSE-ConnectionGUID: QD3krVaDRKWg/cKlVaIhUw==
X-CSE-MsgGUID: eWmbhZXESvqG3+99S7at3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173974859"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2025 06:03:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upRQb-000LIX-1l;
	Fri, 22 Aug 2025 13:03:33 +0000
Date: Fri, 22 Aug 2025 21:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 2/2] fs/f2fs/recovery.c:551:45: error: type of
 formal parameter 3 is incomplete
Message-ID: <202508222011.JmRHhDW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   6f04e51431a05791d78d488be6ac2b9077607d05
commit: 6f04e51431a05791d78d488be6ac2b9077607d05 [2/2] f2fs: introduce NODE_TYPE_NON_INODE
config: arc-randconfig-002-20250822 (https://download.01.org/0day-ci/archive/20250822/202508222011.JmRHhDW2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508222011.JmRHhDW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508222011.JmRHhDW2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/sysfs.c:17:
>> fs/f2fs/f2fs.h:3835:12: warning: 'enum node_type' declared inside parameter list will not be visible outside of this definition or declaration
          enum node_type node_type);
               ^~~~~~~~~
--
   In file included from fs/f2fs/recovery.c:12:
>> fs/f2fs/f2fs.h:3835:12: warning: 'enum node_type' declared inside parameter list will not be visible outside of this definition or declaration
          enum node_type node_type);
               ^~~~~~~~~
   fs/f2fs/recovery.c: In function 'check_index_in_prev_nodes':
>> fs/f2fs/recovery.c:551:45: error: type of formal parameter 3 is incomplete
     node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
                                                ^~~~~~~~~~~~~~~~~
--
   In file included from fs/f2fs/gc.c:19:
>> fs/f2fs/f2fs.h:3835:12: warning: 'enum node_type' declared inside parameter list will not be visible outside of this definition or declaration
          enum node_type node_type);
               ^~~~~~~~~
   fs/f2fs/gc.c: In function 'gc_node_segment':
>> fs/f2fs/gc.c:1074:46: error: type of formal parameter 3 is incomplete
      node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
                                                 ^~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c: In function 'is_alive':
   fs/f2fs/gc.c:1148:45: error: type of formal parameter 3 is incomplete
     node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
                                                ^~~~~~~~~~~~~~~~~
--
   In file included from fs/f2fs/node.c:16:
>> fs/f2fs/f2fs.h:3835:12: warning: 'enum node_type' declared inside parameter list will not be visible outside of this definition or declaration
          enum node_type node_type);
               ^~~~~~~~~
   fs/f2fs/node.c: In function 'f2fs_get_dnode_of_data':
>> fs/f2fs/node.c:880:7: error: type of formal parameter 3 is incomplete
          NODE_TYPE_NON_INODE);
          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c: In function 'truncate_dnode':
   fs/f2fs/node.c:998:44: error: type of formal parameter 3 is incomplete
     folio = f2fs_get_node_folio(sbi, dn->nid, NODE_TYPE_NON_INODE);
                                               ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c: In function 'truncate_nodes':
   fs/f2fs/node.c:1043:7: error: type of formal parameter 3 is incomplete
          NODE_TYPE_NON_INODE);
          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c: In function 'truncate_partial_nodes':
   fs/f2fs/node.c:1122:8: error: type of formal parameter 3 is incomplete
           NODE_TYPE_NON_INODE);
           ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c: In function 'sanity_check_node_footer':
>> fs/f2fs/node.c:1510:2: warning: enumeration value 'NODE_TYPE_REGULAR' not handled in switch [-Wswitch]
     switch (ntype) {
     ^~~~~~
   fs/f2fs/node.c: At top level:
>> fs/f2fs/node.c:1592:15: error: conflicting types for 'f2fs_get_node_folio'
    struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
                  ^~~~~~~~~~~~~~~~~~~
   In file included from fs/f2fs/node.c:16:
   fs/f2fs/f2fs.h:3834:15: note: previous declaration of 'f2fs_get_node_folio' was here
    struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
                  ^~~~~~~~~~~~~~~~~~~


vim +551 fs/f2fs/recovery.c

   488	
   489	static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
   490				block_t blkaddr, struct dnode_of_data *dn)
   491	{
   492		struct seg_entry *sentry;
   493		unsigned int segno = GET_SEGNO(sbi, blkaddr);
   494		unsigned short blkoff = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
   495		struct f2fs_summary_block *sum_node;
   496		struct f2fs_summary sum;
   497		struct folio *sum_folio, *node_folio;
   498		struct dnode_of_data tdn = *dn;
   499		nid_t ino, nid;
   500		struct inode *inode;
   501		unsigned int offset, ofs_in_node, max_addrs;
   502		block_t bidx;
   503		int i;
   504	
   505		sentry = get_seg_entry(sbi, segno);
   506		if (!f2fs_test_bit(blkoff, sentry->cur_valid_map))
   507			return 0;
   508	
   509		/* Get the previous summary */
   510		for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
   511			struct curseg_info *curseg = CURSEG_I(sbi, i);
   512	
   513			if (curseg->segno == segno) {
   514				sum = curseg->sum_blk->entries[blkoff];
   515				goto got_it;
   516			}
   517		}
   518	
   519		sum_folio = f2fs_get_sum_folio(sbi, segno);
   520		if (IS_ERR(sum_folio))
   521			return PTR_ERR(sum_folio);
   522		sum_node = folio_address(sum_folio);
   523		sum = sum_node->entries[blkoff];
   524		f2fs_folio_put(sum_folio, true);
   525	got_it:
   526		/* Use the locked dnode page and inode */
   527		nid = le32_to_cpu(sum.nid);
   528		ofs_in_node = le16_to_cpu(sum.ofs_in_node);
   529	
   530		max_addrs = ADDRS_PER_PAGE(dn->node_folio, dn->inode);
   531		if (ofs_in_node >= max_addrs) {
   532			f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%lu, nid:%u, max:%u",
   533				ofs_in_node, dn->inode->i_ino, nid, max_addrs);
   534			f2fs_handle_error(sbi, ERROR_INCONSISTENT_SUMMARY);
   535			return -EFSCORRUPTED;
   536		}
   537	
   538		if (dn->inode->i_ino == nid) {
   539			tdn.nid = nid;
   540			if (!dn->inode_folio_locked)
   541				folio_lock(dn->inode_folio);
   542			tdn.node_folio = dn->inode_folio;
   543			tdn.ofs_in_node = ofs_in_node;
   544			goto truncate_out;
   545		} else if (dn->nid == nid) {
   546			tdn.ofs_in_node = ofs_in_node;
   547			goto truncate_out;
   548		}
   549	
   550		/* Get the node page */
 > 551		node_folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_REGULAR);
   552		if (IS_ERR(node_folio))
   553			return PTR_ERR(node_folio);
   554	
   555		offset = ofs_of_node(node_folio);
   556		ino = ino_of_node(node_folio);
   557		f2fs_folio_put(node_folio, true);
   558	
   559		if (ino != dn->inode->i_ino) {
   560			int ret;
   561	
   562			/* Deallocate previous index in the node page */
   563			inode = f2fs_iget_retry(sbi->sb, ino);
   564			if (IS_ERR(inode))
   565				return PTR_ERR(inode);
   566	
   567			ret = f2fs_dquot_initialize(inode);
   568			if (ret) {
   569				iput(inode);
   570				return ret;
   571			}
   572		} else {
   573			inode = dn->inode;
   574		}
   575	
   576		bidx = f2fs_start_bidx_of_node(offset, inode) +
   577					le16_to_cpu(sum.ofs_in_node);
   578	
   579		/*
   580		 * if inode page is locked, unlock temporarily, but its reference
   581		 * count keeps alive.
   582		 */
   583		if (ino == dn->inode->i_ino && dn->inode_folio_locked)
   584			folio_unlock(dn->inode_folio);
   585	
   586		set_new_dnode(&tdn, inode, NULL, NULL, 0);
   587		if (f2fs_get_dnode_of_data(&tdn, bidx, LOOKUP_NODE))
   588			goto out;
   589	
   590		if (tdn.data_blkaddr == blkaddr)
   591			f2fs_truncate_data_blocks_range(&tdn, 1);
   592	
   593		f2fs_put_dnode(&tdn);
   594	out:
   595		if (ino != dn->inode->i_ino)
   596			iput(inode);
   597		else if (dn->inode_folio_locked)
   598			folio_lock(dn->inode_folio);
   599		return 0;
   600	
   601	truncate_out:
   602		if (f2fs_data_blkaddr(&tdn) == blkaddr)
   603			f2fs_truncate_data_blocks_range(&tdn, 1);
   604		if (dn->inode->i_ino == nid && !dn->inode_folio_locked)
   605			folio_unlock(dn->inode_folio);
   606		return 0;
   607	}
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
