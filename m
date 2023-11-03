Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C317E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 03:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWFWUzKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698983078; x=1730519078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1LnlKVJS7fwOSgORnG7RfNAfvjKgrhG+c43Ivke1Zc=;
  b=KWFWUzKCYOj7hne/i3OR2W7MAYFYl02PLzPu5+DWa00LaXWEldjfw1hi
   xAFWonXZCvxgXJYC5NQx3Wc+m8+Llk8cj1LqzR2WdEeh0kLyq9PHjz5ni
   94lI+1oA2wq/TkoLMrIFC942ICcHe8GJLMxWj+rW/k/ktpTNIcTvHbI9P
   36JegvCe6b33ZfZCeza0MfKwLOYN+Y39zr2iLl+8gE5B7deJ6D75VRpXH
   LFSRyx6+tDVsXEcq9G8rzJmewGPkPFSU7HzhWzccRB7lZNMX2Zo7gympi
   pBFM+CeDUrBeTogS5NBRid2tmB6OfZlAfFTKQJWa8oG5X1qvanj/yj0pd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1746179"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1746179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 20:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="878495595"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="878495595"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2023 20:44:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyl6p-0002BM-0C;
	Fri, 03 Nov 2023 03:44:35 +0000
Date: Fri, 3 Nov 2023 11:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 766/14864]
 fs/incfs/data_mgmt.c:790:28: warning: variable 'mi' set but not used
Message-ID: <202311031124.Pl3hRlWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugene,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   131de563f6277046086249d812efa8cce7efb7ef
commit: c6819dd77861f22858a4371f755c7d5422920eeb [766/14864] ANDROID: Initial commit of Incremental FS
config: i386-buildonly-randconfig-001-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031124.Pl3hRlWg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031124.Pl3hRlWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031124.Pl3hRlWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/incfs/data_mgmt.c:14:
   fs/incfs/data_mgmt.h: In function 'get_incfs_node':
   fs/incfs/data_mgmt.h:263:34: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     263 |         if (inode->i_sb->s_magic != INCFS_MAGIC_NUMBER) {
         |                                  ^~
   fs/incfs/data_mgmt.c: In function 'incfs_process_new_hash_block':
>> fs/incfs/data_mgmt.c:790:28: warning: variable 'mi' set but not used [-Wunused-but-set-variable]
     790 |         struct mount_info *mi = NULL;
         |                            ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/mi +790 fs/incfs/data_mgmt.c

   785	
   786	int incfs_process_new_hash_block(struct data_file *df,
   787					 struct incfs_new_data_block *block, u8 *data)
   788	{
   789		struct backing_file_context *bfc = NULL;
 > 790		struct mount_info *mi = NULL;
   791		struct mtree *hash_tree = NULL;
   792		struct ondisk_signature *sig = NULL;
   793		loff_t hash_area_base = 0;
   794		loff_t hash_area_size = 0;
   795		int error = 0;
   796	
   797		if (!df || !block)
   798			return -EFAULT;
   799	
   800		if (!(block->flags & INCFS_BLOCK_FLAGS_HASH))
   801			return -EINVAL;
   802	
   803		bfc = df->df_backing_file_context;
   804		mi = df->df_mount_info;
   805	
   806		if (!df)
   807			return -ENOENT;
   808	
   809		hash_tree = df->df_hash_tree;
   810		sig = df->df_signature;
   811		if (!hash_tree || !sig || sig->mtree_offset == 0)
   812			return -ENOTSUPP;
   813	
   814		hash_area_base = sig->mtree_offset;
   815		hash_area_size = sig->mtree_size;
   816		if (hash_area_size < block->block_index * INCFS_DATA_FILE_BLOCK_SIZE
   817					+ block->data_len) {
   818			/* Hash block goes beyond dedicated hash area of this file. */
   819			return -ERANGE;
   820		}
   821	
   822		error = mutex_lock_interruptible(&bfc->bc_mutex);
   823		if (!error)
   824			error = incfs_write_hash_block_to_backing_file(
   825				bfc, range(data, block->data_len), block->block_index,
   826				hash_area_base);
   827		mutex_unlock(&bfc->bc_mutex);
   828		return error;
   829	}
   830	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
