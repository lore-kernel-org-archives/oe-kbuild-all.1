Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0638E134
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095273; cv=none; b=IaM3D7K8Ncm3m1107MkOYy2CON2owHlUL3H6+Q8Ixc6R8vYgeIGZDw+mTgHzOCizqtuHX2u3gK5H/eY9F+Gma3EVGHDfAUVWDOGGdXISxqMhj84yLwBjYeWAFbhro2lY8NW9xzvl6/nX46krEJxGEwgEqcH6pFIvuBi0aeqfqmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095273; c=relaxed/simple;
	bh=DAuH5fipi5kRQ4OokH6cSklyzM4fL6RL2wQKQHqgNds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cE4PjzJOGQXEz9rHCiGwTAbbK9cWvV5WvoIEesMmBoE2fI4O00KsMYLtHZozNsyfxiVLsBrnQZrqNyNA7gJA0dfell5V3SnisJLA3x7MJcqiJe9mBUJTaicm1gQdo2F/SXWEmG7A5MngvEWUsP4RtypOL6Wixbd5iyLW+NN6a5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFyPxk+6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFyPxk+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773095271; x=1804631271;
  h=date:from:to:cc:subject:message-id;
  bh=DAuH5fipi5kRQ4OokH6cSklyzM4fL6RL2wQKQHqgNds=;
  b=eFyPxk+67YKfMr/z1385gg+Y9hCv+d3PgNWbtmdCdlYWoYYgUyrg3/JU
   rpgE8jNn+JwUvjscjz7UXUKNCUHGmoUpcKVoDEEs/+qR+0VX+YCrIuqMf
   XaFWJ5HkWIFBK+y+cn37mreXDkIT/pMPZQV8CL+vOFe01r9TwYzp3BkYI
   frjRuvK1qKJ9RqOiWT4kuJGf0QTFpZOSjqWQpnogCl6bQ61hbWkfltke0
   TQw9vARdG8OOv6roMLo/KaNSUaTM1MI9VHI1LJ/usIrGfgg/CAFHHf8ns
   5yufYPiueojmZ5g95uQl9iYnyhQHPVa3R3507Kre2hopaNTFQjEnJB6bf
   g==;
X-CSE-ConnectionGUID: XchBsAypRKGgu+8tSuPZbw==
X-CSE-MsgGUID: 0NamQkrGS02pV6bv/txm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73331910"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73331910"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 15:27:48 -0700
X-CSE-ConnectionGUID: lfOPHRyaRl+Prl1BlvEbqw==
X-CSE-MsgGUID: UN+fk/zvQoqGSp1JkTmC2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224594755"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 15:27:47 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzj4j-000000000uS-1Dna;
	Mon, 09 Mar 2026 22:27:45 +0000
Date: Tue, 10 Mar 2026 06:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3575/4750] fs/ntfs/namei.c:813:22:
 warning: cast from pointer to integer of different size
Message-ID: <202603100641.8gfpBfkC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea4134533224d500b2985d30cde106aa3680905d
commit: d9038d99fb5c623f43bcd8b726bfbbe8562648c2 [3575/4750] ntfs: change mft_no type to u64
config: parisc-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603100641.8gfpBfkC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100641.8gfpBfkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100641.8gfpBfkC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ntfs/namei.c: In function 'ntfs_test_inode_attr':
>> fs/ntfs/namei.c:813:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     813 |         u64 mft_no = (u64)data;
         |                      ^
   fs/ntfs/namei.c: In function 'ntfs_delete':
>> fs/ntfs/namei.c:993:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     993 |                                            (void *)ni->mft_no)) != NULL) {
         |                                            ^


vim +813 fs/ntfs/namei.c

   809	
   810	static int ntfs_test_inode_attr(struct inode *vi, void *data)
   811	{
   812		struct ntfs_inode *ni = NTFS_I(vi);
 > 813		u64 mft_no = (u64)data;
   814	
   815		if (ni->mft_no != mft_no)
   816			return 0;
   817		if (NInoAttr(ni) || ni->nr_extents == -1)
   818			return 1;
   819		else
   820			return 0;
   821	}
   822	
   823	/*
   824	 * ntfs_delete - delete file or directory from ntfs volume
   825	 * @ni:         ntfs inode for object to delte
   826	 * @dir_ni:     ntfs inode for directory in which delete object
   827	 * @name:       unicode name of the object to delete
   828	 * @name_len:   length of the name in unicode characters
   829	 * @need_lock:  whether mrec lock is needed or not
   830	 *
   831	 * Delete the specified name from the directory index @dir_ni and decrement
   832	 * the link count of the target inode @ni.
   833	 *
   834	 * Return 0 on success and -errno on error.
   835	 */
   836	static int ntfs_delete(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
   837			__le16 *name, u8 name_len, bool need_lock)
   838	{
   839		struct ntfs_attr_search_ctx *actx = NULL;
   840		struct file_name_attr *fn = NULL;
   841		bool looking_for_dos_name = false, looking_for_win32_name = false;
   842		bool case_sensitive_match = true;
   843		int err = 0;
   844		struct mft_record *ni_mrec;
   845		struct super_block *sb;
   846		bool link_count_zero = false;
   847	
   848		ntfs_debug("Entering.\n");
   849	
   850		if (need_lock == true) {
   851			mutex_lock_nested(&ni->mrec_lock, NTFS_INODE_MUTEX_NORMAL);
   852			mutex_lock_nested(&dir_ni->mrec_lock, NTFS_INODE_MUTEX_PARENT);
   853		}
   854	
   855		sb = dir_ni->vol->sb;
   856	
   857		if (ni->nr_extents == -1)
   858			ni = ni->ext.base_ntfs_ino;
   859		if (dir_ni->nr_extents == -1)
   860			dir_ni = dir_ni->ext.base_ntfs_ino;
   861		/*
   862		 * Search for FILE_NAME attribute with such name. If it's in POSIX or
   863		 * WIN32_AND_DOS namespace, then simply remove it from index and inode.
   864		 * If filename in DOS or in WIN32 namespace, then remove DOS name first,
   865		 * only then remove WIN32 name.
   866		 */
   867		actx = ntfs_attr_get_search_ctx(ni, NULL);
   868		if (!actx) {
   869			ntfs_error(sb, "%s, Failed to get search context", __func__);
   870			if (need_lock) {
   871				mutex_unlock(&dir_ni->mrec_lock);
   872				mutex_unlock(&ni->mrec_lock);
   873			}
   874			return -ENOMEM;
   875		}
   876	search:
   877		while ((err = ntfs_attr_lookup(AT_FILE_NAME, AT_UNNAMED, 0, CASE_SENSITIVE,
   878					0, NULL, 0, actx)) == 0) {
   879	#ifdef DEBUG
   880			unsigned char *s;
   881	#endif
   882			bool case_sensitive = IGNORE_CASE;
   883	
   884			fn = (struct file_name_attr *)((u8 *)actx->attr +
   885					le16_to_cpu(actx->attr->data.resident.value_offset));
   886	#ifdef DEBUG
   887			s = ntfs_attr_name_get(ni->vol, fn->file_name, fn->file_name_length);
   888			ntfs_debug("name: '%s'  type: %d  dos: %d  win32: %d case: %d\n",
   889					s, fn->file_name_type,
   890					looking_for_dos_name, looking_for_win32_name,
   891					case_sensitive_match);
   892			ntfs_attr_name_free(&s);
   893	#endif
   894			if (looking_for_dos_name) {
   895				if (fn->file_name_type == FILE_NAME_DOS)
   896					break;
   897				continue;
   898			}
   899			if (looking_for_win32_name) {
   900				if  (fn->file_name_type == FILE_NAME_WIN32)
   901					break;
   902				continue;
   903			}
   904	
   905			/* Ignore hard links from other directories */
   906			if (dir_ni->mft_no != MREF_LE(fn->parent_directory)) {
   907				ntfs_debug("MFT record numbers don't match (%llu != %lu)\n",
   908						dir_ni->mft_no,
   909						MREF_LE(fn->parent_directory));
   910				continue;
   911			}
   912	
   913			if (fn->file_name_type == FILE_NAME_POSIX || case_sensitive_match)
   914				case_sensitive = CASE_SENSITIVE;
   915	
   916			if (ntfs_names_are_equal(fn->file_name, fn->file_name_length,
   917						name, name_len, case_sensitive,
   918						ni->vol->upcase, ni->vol->upcase_len)) {
   919				if (fn->file_name_type == FILE_NAME_WIN32) {
   920					looking_for_dos_name = true;
   921					ntfs_attr_reinit_search_ctx(actx);
   922					continue;
   923				}
   924				if (fn->file_name_type == FILE_NAME_DOS)
   925					looking_for_dos_name = true;
   926				break;
   927			}
   928		}
   929		if (err) {
   930			/*
   931			 * If case sensitive search failed, then try once again
   932			 * ignoring case.
   933			 */
   934			if (err == -ENOENT && case_sensitive_match) {
   935				case_sensitive_match = false;
   936				ntfs_attr_reinit_search_ctx(actx);
   937				goto search;
   938			}
   939			goto err_out;
   940		}
   941	
   942		err = ntfs_check_unlinkable_dir(actx, fn);
   943		if (err)
   944			goto err_out;
   945	
   946		err = ntfs_index_remove(dir_ni, fn, le32_to_cpu(actx->attr->data.resident.value_length));
   947		if (err)
   948			goto err_out;
   949	
   950		err = ntfs_attr_record_rm(actx);
   951		if (err)
   952			goto err_out;
   953	
   954		ni_mrec = actx->base_mrec ? actx->base_mrec : actx->mrec;
   955		ni_mrec->link_count = cpu_to_le16(le16_to_cpu(ni_mrec->link_count) - 1);
   956		drop_nlink(VFS_I(ni));
   957	
   958		mark_mft_record_dirty(ni);
   959		if (looking_for_dos_name) {
   960			looking_for_dos_name = false;
   961			looking_for_win32_name = true;
   962			ntfs_attr_reinit_search_ctx(actx);
   963			goto search;
   964		}
   965	
   966		/*
   967		 * If hard link count is not equal to zero then we are done. In other
   968		 * case there are no reference to this inode left, so we should free all
   969		 * non-resident attributes and mark all MFT record as not in use.
   970		 */
   971		if (ni_mrec->link_count == 0) {
   972			NInoSetBeingDeleted(ni);
   973			ntfs_delete_reparse_index(ni);
   974			ntfs_delete_object_id_index(ni);
   975			link_count_zero = true;
   976		}
   977	
   978		ntfs_attr_put_search_ctx(actx);
   979		if (need_lock == true) {
   980			mutex_unlock(&dir_ni->mrec_lock);
   981			mutex_unlock(&ni->mrec_lock);
   982		}
   983	
   984		/*
   985		 * If hard link count is not equal to zero then we are done. In other
   986		 * case there are no reference to this inode left, so we should free all
   987		 * non-resident attributes and mark all MFT record as not in use.
   988		 */
   989		if (link_count_zero == true) {
   990			struct inode *attr_vi;
   991	
   992			while ((attr_vi = ilookup5(sb, ni->mft_no, ntfs_test_inode_attr,
 > 993						   (void *)ni->mft_no)) != NULL) {
   994				clear_nlink(attr_vi);
   995				iput(attr_vi);
   996			}
   997		}
   998		ntfs_debug("Done.\n");
   999		return 0;
  1000	err_out:
  1001		ntfs_attr_put_search_ctx(actx);
  1002		if (need_lock) {
  1003			mutex_unlock(&dir_ni->mrec_lock);
  1004			mutex_unlock(&ni->mrec_lock);
  1005		}
  1006		return err;
  1007	}
  1008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
