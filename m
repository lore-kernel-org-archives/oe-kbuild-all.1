Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EA35F60A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474443; cv=none; b=K3QE8VCC9I0pi6Ei6IpaURCeHuPxvSS+9RGSzFlhdpO7+LeDg/lLIX1qJtPSBsNuRSU2s9R7c2LfvfShZpTaNLTuVa6EiL7Dwrm6X1c1S+BMu4B6wCeWcTBUkEXwuxwPLZyCVEPdH8ATyQ+oIpoBQ82Ogu+FnWtU7AajtffZaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474443; c=relaxed/simple;
	bh=Sx5uHCrZFPNX5yvYm8oROhZshBsdiIqU752CifUUvdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHVzJzDCH7DXX348GEJNbfvcInMwWuzlaJ2Qi2T5h89aF1vMV6QXjgRLkPMEyTs+RGB6/E6dpQfQ7CjoAYA+EG0sHJKYCt3tICXF9gcdXnC03Sq8kpkzMABqoO8RPnDIuhUTGVk/sEiSDD4YsxVzreLf6pWuTTjjpm2IHu/Pp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYT/UJhv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYT/UJhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786474441; x=1818010441;
  h=date:from:to:cc:subject:message-id;
  bh=Sx5uHCrZFPNX5yvYm8oROhZshBsdiIqU752CifUUvdA=;
  b=cYT/UJhvLRSyiJnY12dYPhnzb9qwciegfWP1JKv1eCoo6xkXOEmJmdqn
   dK/uMReX50yAsRJACHEmeH1gskeM3MbdSJeSaXJ2uWY3emZNCRPXgnLqc
   zQReKj3TFETDEWj98rcB1pcPfABMg0odn/ElxSbv+hNEuDS/K354iAkcI
   DgK22S//nzkRFjBgp5U6ZcDZVbA+luI9xX4m+5/ukHRTHdDArt7ahPAAH
   iT8RxtjvyZMB0JTwfdqvz74h1JWU3VKp6ZfWWskzje4n19pMSqvFpGpvi
   D0IAsknlRHnHptJhFlDoO3eWprYgFHCkaTGy5H5fsj2H6pQurt3O7oNFV
   A==;
X-CSE-ConnectionGUID: I7z2dRpAS2+scV3Oz7OJCA==
X-CSE-MsgGUID: Sx/ILIsvTtebDVjkkOA0dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86946692"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86946692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 11:54:01 -0700
X-CSE-ConnectionGUID: auL5ED/vT2qcusRRXuZaVg==
X-CSE-MsgGUID: pR35G3OJTfqITsnpMKB7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="261672206"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Aug 2026 11:53:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtrbo-00000000PAo-2BWw;
	Tue, 11 Aug 2026 18:53:56 +0000
Date: Wed, 12 Aug 2026 02:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 30/30] fs/f2fs/inode.c:1065:13:
 error: implicit declaration of function 'current_is_kswapd'
Message-ID: <202608120225.emwHea9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   7451b3cd93b30f714efc83f6571abf8c50541839
commit: 7451b3cd93b30f714efc83f6571abf8c50541839 [30/30] f2fs: call __add_ino_entry out of the eviction path
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608120225.emwHea9z-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120225.emwHea9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120225.emwHea9z-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/inode.c: In function 'f2fs_post_evict_inode':
>> fs/f2fs/inode.c:1065:13: error: implicit declaration of function 'current_is_kswapd' [-Wimplicit-function-declaration]
    1065 |         if (current_is_kswapd()) {
         |             ^~~~~~~~~~~~~~~~~


vim +/current_is_kswapd +1065 fs/f2fs/inode.c

  1019	
  1020	static void f2fs_post_evict_inode(struct inode *inode)
  1021	{
  1022		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  1023		struct f2fs_inode_info *fi = F2FS_I(inode);
  1024		nid_t xnid = fi->i_xattr_nid;
  1025		unsigned int record_bits = 0;
  1026	
  1027		dquot_drop(inode);
  1028	
  1029		stat_dec_inline_xattr(inode);
  1030		stat_dec_inline_dir(inode);
  1031		stat_dec_inline_inode(inode);
  1032		stat_dec_compr_inode(inode);
  1033		stat_sub_compr_blocks(inode,
  1034				atomic_read(&fi->i_compr_blocks));
  1035	
  1036		if (likely(!f2fs_cp_error(sbi) &&
  1037					!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
  1038			f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
  1039	
  1040		/*
  1041		 * anyway, it needs to remove the inode from sbi->inode_list[DIRTY_META]
  1042		 * list to avoid UAF in f2fs_sync_inode_meta() during checkpoint.
  1043		 */
  1044		f2fs_inode_synced(inode);
  1045	
  1046		/* for the case f2fs_new_inode() was failed, .i_ino is zero, skip it */
  1047		if (inode->i_ino)
  1048			invalidate_mapping_pages(NODE_MAPPING(sbi), inode->i_ino,
  1049								inode->i_ino);
  1050		if (xnid)
  1051			invalidate_mapping_pages(NODE_MAPPING(sbi), xnid, xnid);
  1052	
  1053		if (!inode->i_nlink)
  1054			goto skip_record;
  1055	
  1056		if (is_inode_flag_set(inode, FI_APPEND_WRITE))
  1057			record_bits = BIT(APPEND_INO);
  1058		if (is_inode_flag_set(inode, FI_UPDATE_WRITE))
  1059			record_bits = BIT(UPDATE_INO);
  1060	
  1061		if (!record_bits)
  1062			goto skip_record;
  1063	
  1064		/* Let's do this in workqueue out of the direct reclaim path. */
> 1065		if (current_is_kswapd()) {
  1066			f2fs_record_inode_state(sbi, inode->i_ino, record_bits);
  1067		} else {
  1068			struct evict_inode_work *ew =
  1069				mempool_alloc(evict_inode_work_pool, GFP_NOFS);
  1070	
  1071			ew->sbi = sbi;
  1072			ew->ino = inode->i_ino;
  1073			ew->add_ino_entry_bits = record_bits;
  1074			INIT_WORK(&ew->work, f2fs_evict_inode_work);
  1075			queue_work(sbi->evict_wq, &ew->work);
  1076		}
  1077	skip_record:
  1078		if (is_inode_flag_set(inode, FI_FREE_NID)) {
  1079			f2fs_alloc_nid_failed(sbi, inode->i_ino);
  1080			clear_inode_flag(inode, FI_FREE_NID);
  1081		} else {
  1082			/*
  1083			 * If xattr nid is corrupted, we can reach out error condition,
  1084			 * err & !f2fs_exist_written_data(sbi, inode->i_ino, ORPHAN_INO)).
  1085			 * In that case, f2fs_check_nid_range() is enough to give a clue.
  1086			 */
  1087		}
  1088	}
  1089	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
