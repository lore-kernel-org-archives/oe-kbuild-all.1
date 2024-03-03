Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949065A0FA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709475476; cv=none; b=H74UeuREXGg0EzZC7SPRJKGRyL9J5T3TZRimu2t2Z5IBOMmcsOnMFgefmbGtKjZ2YTh6qrQF2Egz3FRG1eQg9f0itT9GdeJVWTdXzJmQBEr7L4G5zJRNzmC4vQEUoohaWyqQgNnfyC7I0o/q6PLpvsXOQWsyzLOskKBWCPvCZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709475476; c=relaxed/simple;
	bh=VheHe+VY1A/5Wbz6nVWRpgsXfbOExvPDcpWCzsmoCY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gz32bgde+JG5mVeeQ1TzxtGYJtWTy4cMmibZufS/84xSCNmvAhWtq9fBdEQvk8RFDpGfGCJhq66xgm94Ws8lob9i5sAyEXJBq+B+iaNUpNc2jFDQyAGDRAwwqMaZiL1UCpRto7HkKQuUbmp/6w/Cvzxo08tJV8t7yp8oE9wFJK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0617k7X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0617k7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709475473; x=1741011473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VheHe+VY1A/5Wbz6nVWRpgsXfbOExvPDcpWCzsmoCY0=;
  b=P0617k7X2E5nHhooFQ2VEK5yPyOufLUy6u9BoJx8vfNFJe7t7ZaWMURC
   bbUviobXSP9v3A6IjBDr84N1T8LqJcP7TaZ0ZvDFGc8JEJdKDOj7nvPjX
   K1nwROJyC9y+MPLUs0cREVGQvj6H7hYHXUkPO3ThulpVcKH18Vqt1AQiD
   bR6CWDPFW9jTf9j/GkRPcp359Tp3ne6KTs7LkkS9EH39hBGrVstRVX6iO
   zrNV6/6OJCvSBv2+s+qoCqHSkftVtYLYoeZZkQCZJFrny6i4lr4xdDpEq
   el4bEDMzi3LkdsxRGNK/qbfdeU5AKAH1UDn8P7d5mbJe75Inv4UDRRQtH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="6920160"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="6920160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 06:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13286641"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 06:17:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgmex-0001p8-29;
	Sun, 03 Mar 2024 14:17:47 +0000
Date: Sun, 3 Mar 2024 22:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 23/23]
 fs/famfs/famfs_file.c:168:33: warning: variable 'sb' set but not used
Message-ID: <202403032204.CXUPpHrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: c8318dd2a63c230e5e731bc14750a466d7891ddc [23/23] famfs: Add Kconfig and Makefile plumbing
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403032204.CXUPpHrQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032204.CXUPpHrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032204.CXUPpHrQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/famfs/famfs_file.c: In function 'famfs_file_init_dax':
>> fs/famfs/famfs_file.c:168:33: warning: variable 'sb' set but not used [-Wunused-but-set-variable]
     168 |         struct super_block     *sb;
         |                                 ^~
>> fs/famfs/famfs_file.c:167:33: warning: variable 'fsi' set but not used [-Wunused-but-set-variable]
     167 |         struct famfs_fs_info   *fsi;
         |                                 ^~~
>> fs/famfs/famfs_file.c:163:33: warning: variable 'tfs_extents' set but not used [-Wunused-but-set-variable]
     163 |         struct famfs_extent    *tfs_extents = NULL;
         |                                 ^~~~~~~~~~~
--
>> fs/famfs/famfs_inode.c:203: warning: Function parameter or struct member 'm' not described in 'famfs_show_options'
>> fs/famfs/famfs_inode.c:203: warning: Function parameter or struct member 'root' not described in 'famfs_show_options'
>> fs/famfs/famfs_inode.c:249: warning: Function parameter or struct member 'sb' not described in 'famfs_open_char_device'
>> fs/famfs/famfs_inode.c:249: warning: Function parameter or struct member 'fc' not described in 'famfs_open_char_device'
>> fs/famfs/famfs_inode.c:336: warning: Function parameter or struct member 'sb' not described in 'famfs_open_device'
>> fs/famfs/famfs_inode.c:336: warning: Function parameter or struct member 'fc' not described in 'famfs_open_device'
--
>> fs/famfs/famfs_file.c:125: warning: Function parameter or struct member 'metap' not described in 'famfs_meta_alloc'
>> fs/famfs/famfs_file.c:125: warning: expecting prototype for famfs_map_meta_alloc(). Prototype was for famfs_meta_alloc() instead
>> fs/famfs/famfs_file.c:413: warning: Function parameter or struct member 'iocb' not described in 'famfs_dax_write_iter'
>> fs/famfs/famfs_file.c:413: warning: Function parameter or struct member 'from' not described in 'famfs_dax_write_iter'
>> fs/famfs/famfs_file.c:413: warning: expecting prototype for famfs_write_iter(). Prototype was for famfs_dax_write_iter() instead
>> fs/famfs/famfs_file.c:511: warning: Function parameter or struct member 'inode' not described in 'famfs_meta_to_dax_offset'
>> fs/famfs/famfs_file.c:511: warning: Function parameter or struct member 'iomap' not described in 'famfs_meta_to_dax_offset'
>> fs/famfs/famfs_file.c:511: warning: Function parameter or struct member 'offset' not described in 'famfs_meta_to_dax_offset'
>> fs/famfs/famfs_file.c:511: warning: Function parameter or struct member 'len' not described in 'famfs_meta_to_dax_offset'
>> fs/famfs/famfs_file.c:511: warning: Function parameter or struct member 'flags' not described in 'famfs_meta_to_dax_offset'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'inode' not described in 'famfs_iomap_begin'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'offset' not described in 'famfs_iomap_begin'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'length' not described in 'famfs_iomap_begin'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'flags' not described in 'famfs_iomap_begin'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'iomap' not described in 'famfs_iomap_begin'
>> fs/famfs/famfs_file.c:581: warning: Function parameter or struct member 'srcmap' not described in 'famfs_iomap_begin'


vim +/sb +168 fs/famfs/famfs_file.c

ab0d141a2f682f John Groves 2024-02-23  115  
43ff3380644d17 John Groves 2024-02-23  116  /**
43ff3380644d17 John Groves 2024-02-23  117   * famfs_map_meta_alloc() - Allocate famfs file metadata
43ff3380644d17 John Groves 2024-02-23  118   * @mapp:       Pointer to an mcache_map_meta pointer
43ff3380644d17 John Groves 2024-02-23  119   * @ext_count:  The number of extents needed
43ff3380644d17 John Groves 2024-02-23  120   */
43ff3380644d17 John Groves 2024-02-23  121  static int
43ff3380644d17 John Groves 2024-02-23  122  famfs_meta_alloc(
43ff3380644d17 John Groves 2024-02-23  123  	struct famfs_file_meta  **metap,
43ff3380644d17 John Groves 2024-02-23  124  	size_t                    ext_count)
43ff3380644d17 John Groves 2024-02-23 @125  {
43ff3380644d17 John Groves 2024-02-23  126  	struct famfs_file_meta *meta;
43ff3380644d17 John Groves 2024-02-23  127  	size_t                  metasz;
43ff3380644d17 John Groves 2024-02-23  128  
43ff3380644d17 John Groves 2024-02-23  129  	*metap = NULL;
43ff3380644d17 John Groves 2024-02-23  130  
43ff3380644d17 John Groves 2024-02-23  131  	metasz = sizeof(*meta) + sizeof(*(meta->tfs_extents)) * ext_count;
43ff3380644d17 John Groves 2024-02-23  132  
43ff3380644d17 John Groves 2024-02-23  133  	meta = kzalloc(metasz, GFP_KERNEL);
43ff3380644d17 John Groves 2024-02-23  134  	if (!meta)
43ff3380644d17 John Groves 2024-02-23  135  		return -ENOMEM;
43ff3380644d17 John Groves 2024-02-23  136  
43ff3380644d17 John Groves 2024-02-23  137  	meta->tfs_extent_ct = ext_count;
43ff3380644d17 John Groves 2024-02-23  138  	*metap = meta;
43ff3380644d17 John Groves 2024-02-23  139  
43ff3380644d17 John Groves 2024-02-23  140  	return 0;
43ff3380644d17 John Groves 2024-02-23  141  }
43ff3380644d17 John Groves 2024-02-23  142  
43ff3380644d17 John Groves 2024-02-23  143  static void
43ff3380644d17 John Groves 2024-02-23  144  famfs_meta_free(
43ff3380644d17 John Groves 2024-02-23  145  	struct famfs_file_meta *map)
43ff3380644d17 John Groves 2024-02-23  146  {
43ff3380644d17 John Groves 2024-02-23  147  	kfree(map);
43ff3380644d17 John Groves 2024-02-23  148  }
43ff3380644d17 John Groves 2024-02-23  149  
43ff3380644d17 John Groves 2024-02-23  150  /**
43ff3380644d17 John Groves 2024-02-23  151   * famfs_file_init_dax() - FAMFSIOC_MAP_CREATE ioctl handler
43ff3380644d17 John Groves 2024-02-23  152   * @file:
43ff3380644d17 John Groves 2024-02-23  153   * @arg:        ptr to struct mcioc_map in user space
43ff3380644d17 John Groves 2024-02-23  154   *
43ff3380644d17 John Groves 2024-02-23  155   * Setup the dax mapping for a file. Files are created empty, and then function is called
43ff3380644d17 John Groves 2024-02-23  156   * (by famfs_file_ioctl()) to setup the mapping and set the file size.
43ff3380644d17 John Groves 2024-02-23  157   */
43ff3380644d17 John Groves 2024-02-23  158  static int
43ff3380644d17 John Groves 2024-02-23  159  famfs_file_init_dax(
43ff3380644d17 John Groves 2024-02-23  160  	struct file    *file,
43ff3380644d17 John Groves 2024-02-23  161  	void __user    *arg)
43ff3380644d17 John Groves 2024-02-23  162  {
43ff3380644d17 John Groves 2024-02-23 @163  	struct famfs_extent    *tfs_extents = NULL;
43ff3380644d17 John Groves 2024-02-23  164  	struct famfs_file_meta *meta = NULL;
43ff3380644d17 John Groves 2024-02-23  165  	struct inode           *inode;
43ff3380644d17 John Groves 2024-02-23  166  	struct famfs_ioc_map    imap;
43ff3380644d17 John Groves 2024-02-23 @167  	struct famfs_fs_info   *fsi;
43ff3380644d17 John Groves 2024-02-23 @168  	struct super_block     *sb;
43ff3380644d17 John Groves 2024-02-23  169  	int    alignment_errs = 0;
43ff3380644d17 John Groves 2024-02-23  170  	size_t extent_total = 0;
43ff3380644d17 John Groves 2024-02-23  171  	size_t ext_count;
43ff3380644d17 John Groves 2024-02-23  172  	int    rc = 0;
43ff3380644d17 John Groves 2024-02-23  173  	int    i;
43ff3380644d17 John Groves 2024-02-23  174  
43ff3380644d17 John Groves 2024-02-23  175  	rc = copy_from_user(&imap, arg, sizeof(imap));
43ff3380644d17 John Groves 2024-02-23  176  	if (rc)
43ff3380644d17 John Groves 2024-02-23  177  		return -EFAULT;
43ff3380644d17 John Groves 2024-02-23  178  
43ff3380644d17 John Groves 2024-02-23  179  	ext_count = imap.ext_list_count;
43ff3380644d17 John Groves 2024-02-23  180  	if (ext_count < 1) {
43ff3380644d17 John Groves 2024-02-23  181  		rc = -ENOSPC;
43ff3380644d17 John Groves 2024-02-23  182  		goto errout;
43ff3380644d17 John Groves 2024-02-23  183  	}
43ff3380644d17 John Groves 2024-02-23  184  
43ff3380644d17 John Groves 2024-02-23  185  	if (ext_count > FAMFS_MAX_EXTENTS) {
43ff3380644d17 John Groves 2024-02-23  186  		rc = -E2BIG;
43ff3380644d17 John Groves 2024-02-23  187  		goto errout;
43ff3380644d17 John Groves 2024-02-23  188  	}
43ff3380644d17 John Groves 2024-02-23  189  
43ff3380644d17 John Groves 2024-02-23  190  	inode = file_inode(file);
43ff3380644d17 John Groves 2024-02-23  191  	if (!inode) {
43ff3380644d17 John Groves 2024-02-23  192  		rc = -EBADF;
43ff3380644d17 John Groves 2024-02-23  193  		goto errout;
43ff3380644d17 John Groves 2024-02-23  194  	}
43ff3380644d17 John Groves 2024-02-23  195  	sb  = inode->i_sb;
43ff3380644d17 John Groves 2024-02-23  196  	fsi = inode->i_sb->s_fs_info;
43ff3380644d17 John Groves 2024-02-23  197  
43ff3380644d17 John Groves 2024-02-23  198  	tfs_extents = &imap.ext_list[0];
43ff3380644d17 John Groves 2024-02-23  199  
43ff3380644d17 John Groves 2024-02-23  200  	rc = famfs_meta_alloc(&meta, ext_count);
43ff3380644d17 John Groves 2024-02-23  201  	if (rc)
43ff3380644d17 John Groves 2024-02-23  202  		goto errout;
43ff3380644d17 John Groves 2024-02-23  203  
43ff3380644d17 John Groves 2024-02-23  204  	meta->file_type = imap.file_type;
43ff3380644d17 John Groves 2024-02-23  205  	meta->file_size = imap.file_size;
43ff3380644d17 John Groves 2024-02-23  206  
43ff3380644d17 John Groves 2024-02-23  207  	/* Fill in the internal file metadata structure */
43ff3380644d17 John Groves 2024-02-23  208  	for (i = 0; i < imap.ext_list_count; i++) {
43ff3380644d17 John Groves 2024-02-23  209  		size_t len;
43ff3380644d17 John Groves 2024-02-23  210  		off_t  offset;
43ff3380644d17 John Groves 2024-02-23  211  
43ff3380644d17 John Groves 2024-02-23  212  		offset = imap.ext_list[i].offset;
43ff3380644d17 John Groves 2024-02-23  213  		len    = imap.ext_list[i].len;
43ff3380644d17 John Groves 2024-02-23  214  
43ff3380644d17 John Groves 2024-02-23  215  		extent_total += len;
43ff3380644d17 John Groves 2024-02-23  216  
43ff3380644d17 John Groves 2024-02-23  217  		if (WARN_ON(offset == 0 && meta->file_type != FAMFS_SUPERBLOCK)) {
43ff3380644d17 John Groves 2024-02-23  218  			rc = -EINVAL;
43ff3380644d17 John Groves 2024-02-23  219  			goto errout;
43ff3380644d17 John Groves 2024-02-23  220  		}
43ff3380644d17 John Groves 2024-02-23  221  
43ff3380644d17 John Groves 2024-02-23  222  		meta->tfs_extents[i].offset = offset;
43ff3380644d17 John Groves 2024-02-23  223  		meta->tfs_extents[i].len    = len;
43ff3380644d17 John Groves 2024-02-23  224  
43ff3380644d17 John Groves 2024-02-23  225  		/* All extent addresses/offsets must be 2MiB aligned,
43ff3380644d17 John Groves 2024-02-23  226  		 * and all but the last length must be a 2MiB multiple.
43ff3380644d17 John Groves 2024-02-23  227  		 */
43ff3380644d17 John Groves 2024-02-23  228  		if (!IS_ALIGNED(offset, PMD_SIZE)) {
43ff3380644d17 John Groves 2024-02-23  229  			pr_err("%s: error ext %d hpa %lx not aligned\n",
43ff3380644d17 John Groves 2024-02-23  230  			       __func__, i, offset);
43ff3380644d17 John Groves 2024-02-23  231  			alignment_errs++;
43ff3380644d17 John Groves 2024-02-23  232  		}
43ff3380644d17 John Groves 2024-02-23  233  		if (i < (imap.ext_list_count - 1) && !IS_ALIGNED(len, PMD_SIZE)) {
43ff3380644d17 John Groves 2024-02-23  234  			pr_err("%s: error ext %d length %ld not aligned\n",
43ff3380644d17 John Groves 2024-02-23  235  			       __func__, i, len);
43ff3380644d17 John Groves 2024-02-23  236  			alignment_errs++;
43ff3380644d17 John Groves 2024-02-23  237  		}
43ff3380644d17 John Groves 2024-02-23  238  	}
43ff3380644d17 John Groves 2024-02-23  239  
43ff3380644d17 John Groves 2024-02-23  240  	/*
43ff3380644d17 John Groves 2024-02-23  241  	 * File size can be <= ext list size, since extent sizes are constrained
43ff3380644d17 John Groves 2024-02-23  242  	 * to PMD multiples
43ff3380644d17 John Groves 2024-02-23  243  	 */
43ff3380644d17 John Groves 2024-02-23  244  	if (imap.file_size > extent_total) {
43ff3380644d17 John Groves 2024-02-23  245  		pr_err("%s: file size %lld larger than ext list size %lld\n",
43ff3380644d17 John Groves 2024-02-23  246  		       __func__, (u64)imap.file_size, (u64)extent_total);
43ff3380644d17 John Groves 2024-02-23  247  		rc = -EINVAL;
43ff3380644d17 John Groves 2024-02-23  248  		goto errout;
43ff3380644d17 John Groves 2024-02-23  249  	}
43ff3380644d17 John Groves 2024-02-23  250  
43ff3380644d17 John Groves 2024-02-23  251  	if (alignment_errs > 0) {
43ff3380644d17 John Groves 2024-02-23  252  		pr_err("%s: there were %d alignment errors in the extent list\n",
43ff3380644d17 John Groves 2024-02-23  253  		       __func__, alignment_errs);
43ff3380644d17 John Groves 2024-02-23  254  		rc = -EINVAL;
43ff3380644d17 John Groves 2024-02-23  255  		goto errout;
43ff3380644d17 John Groves 2024-02-23  256  	}
43ff3380644d17 John Groves 2024-02-23  257  
43ff3380644d17 John Groves 2024-02-23  258  	/* Publish the famfs metadata on inode->i_private */
43ff3380644d17 John Groves 2024-02-23  259  	inode_lock(inode);
43ff3380644d17 John Groves 2024-02-23  260  	if (inode->i_private) {
43ff3380644d17 John Groves 2024-02-23  261  		rc = -EEXIST; /* file already has famfs metadata */
43ff3380644d17 John Groves 2024-02-23  262  	} else {
43ff3380644d17 John Groves 2024-02-23  263  		inode->i_private = meta;
43ff3380644d17 John Groves 2024-02-23  264  		i_size_write(inode, imap.file_size);
43ff3380644d17 John Groves 2024-02-23  265  		inode->i_flags |= S_DAX;
43ff3380644d17 John Groves 2024-02-23  266  	}
43ff3380644d17 John Groves 2024-02-23  267  	inode_unlock(inode);
43ff3380644d17 John Groves 2024-02-23  268  
43ff3380644d17 John Groves 2024-02-23  269   errout:
43ff3380644d17 John Groves 2024-02-23  270  	if (rc)
43ff3380644d17 John Groves 2024-02-23  271  		famfs_meta_free(meta);
43ff3380644d17 John Groves 2024-02-23  272  
43ff3380644d17 John Groves 2024-02-23  273  	return rc;
43ff3380644d17 John Groves 2024-02-23  274  }
43ff3380644d17 John Groves 2024-02-23  275  

:::::: The code at line 168 was first introduced by commit
:::::: 43ff3380644d17479b4756f3008242135870d5e7 famfs: Add ioctl to file_operations

:::::: TO: John Groves <John@Groves.net>
:::::: CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
