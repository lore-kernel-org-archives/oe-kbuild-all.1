Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E752FD7B3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762211665; cv=none; b=fcOdz/XPasV9WlyWwfUCF8PtbupHFk1dBtQMLxf4B2ymBx00LGzDniVRhafJJWs2GwqiwpD/+gaVSjjt4rD+Y0QIEC4ozOqX65xbEWoxGsmDwOCGtVCFWZGXh+aFsuqrkmxx8XNbR9Ggmgoy7q88TQDe/s4RpU7ljBlcCFm5qrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762211665; c=relaxed/simple;
	bh=JS7hq9JHs6znuse3M5O934RmK28v05vFtC4x8VhE93Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhIHdP0TF5z0HKd7ohczMawm6o7wEZI/FPYZzLJwX7CtREN4hxBbhe+OBq6pf132iPYgQ3LA9/fBDXtWSWDyZJk2C3WqJz8F/TeJ8C+t+uX6kMq2O2jg/dIXipfePjyKtK7cfVzHlw1bnIi10EGerTlqDgWVX/XO+0QjlbYbUTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJQkRt60; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJQkRt60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762211664; x=1793747664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JS7hq9JHs6znuse3M5O934RmK28v05vFtC4x8VhE93Q=;
  b=gJQkRt60YxuVyaHovIztFWGPhqeK95cmNcpab2LeEnExGi4Ik8PN0PNs
   65/wqW3iLUdlETCdRo9UI4qALwdtzzLTzXDa+rgRRlvmPSYzDwfgA1HOL
   aTFO7ky7e57QbfCUKlzfGI0iofbr3L8P82jPKzEjOUfazH1L+gO47VLyh
   oUdlFh1TD/nyKDVOcpwSF6qwiz/H9RZDqPA2HivwficrUuplcBqaujqiP
   9Hkct8pcsWam1LONMANe+GZIlKQu+Pr3+M+6VWcVp8lSwQFDufPJAFJIb
   HL4l4I7dH6u6GD6f3T7J1I6qWTkrUsIIOKjRbi4mcMSleyTKIboVixfdP
   Q==;
X-CSE-ConnectionGUID: uYeZVjvjQm6oM/UHVJQ1ew==
X-CSE-MsgGUID: 9O4e06l8SmSPSuY6h25cYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81927596"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="81927596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 15:14:23 -0800
X-CSE-ConnectionGUID: rFDAxurATtOqwCaWE3H1Lg==
X-CSE-MsgGUID: SHrtuQWETHOqgujxmiHeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="191342078"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2025 15:14:21 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG3kh-000Qbg-0n;
	Mon, 03 Nov 2025 23:14:19 +0000
Date: Tue, 4 Nov 2025 07:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 11/11] fs/ntfsplus/aops.c:44:45: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202511040721.LpPT7pFE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   823d97fda02f76457c2e14196ebe718b9601f40c
commit: 823d97fda02f76457c2e14196ebe718b9601f40c [11/11] ntfsplus: add Kconfig and Makefile
config: powerpc64-randconfig-r132-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040721.LpPT7pFE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040721.LpPT7pFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040721.LpPT7pFE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfsplus/aops.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/aops.c:44:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int opf @@
   fs/ntfsplus/aops.c:44:45: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/ntfsplus/aops.c:44:45: sparse:     got unsigned int opf
>> fs/ntfsplus/aops.c:219:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/aops.c:219:59: sparse:     expected unsigned int opf
   fs/ntfsplus/aops.c:219:59: sparse:     got restricted blk_opf_t
--
   fs/ntfsplus/mft.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/aops.h):
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/mft.c:40:15: sparse: sparse: restricted __le16 degrades to integer
>> fs/ntfsplus/mft.c:489:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/mft.c:489:35: sparse:     expected unsigned int opf
   fs/ntfsplus/mft.c:489:35: sparse:     got restricted blk_opf_t
   fs/ntfsplus/mft.c:626:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/mft.c:626:43: sparse:     expected unsigned int opf
   fs/ntfsplus/mft.c:626:43: sparse:     got restricted blk_opf_t
--
   fs/ntfsplus/namei.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h):
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/namei.c:688:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:688:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:688:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:948:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:948:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:948:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:992:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:992:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:992:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
   fs/ntfsplus/namei.c:1034:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1034:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1034:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
>> fs/ntfsplus/namei.c:1196:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname_new @@
   fs/ntfsplus/namei.c:1196:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1196:35: sparse:     got restricted __le16 [usertype] *[addressable] uname_new
>> fs/ntfsplus/namei.c:1342:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] usrc @@
   fs/ntfsplus/namei.c:1342:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1342:35: sparse:     got restricted __le16 [usertype] *[addressable] usrc
   fs/ntfsplus/namei.c:1398:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const *wc @@     got restricted __le16 [usertype] *[addressable] uname @@
   fs/ntfsplus/namei.c:1398:35: sparse:     expected unsigned short const *wc
   fs/ntfsplus/namei.c:1398:35: sparse:     got restricted __le16 [usertype] *[addressable] uname
--
   fs/ntfsplus/inode.c: note: in included file (through fs/ntfsplus/volume.h, fs/ntfsplus/ntfs.h, fs/ntfsplus/attrib.h, fs/ntfsplus/lcnalloc.h):
   fs/ntfsplus/layout.h:270:43: sparse: sparse: mixed bitwiseness
>> fs/ntfsplus/inode.c:3626:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int opf @@     got restricted blk_opf_t @@
   fs/ntfsplus/inode.c:3626:59: sparse:     expected unsigned int opf
   fs/ntfsplus/inode.c:3626:59: sparse:     got restricted blk_opf_t
   fs/ntfsplus/inode.c:392:43: sparse: sparse: context imbalance in 'ntfs_drop_big_inode' - unexpected unlock

vim +44 fs/ntfsplus/aops.c

f4f7087c9c4046b Namjae Jeon 2025-10-17   38  
f4f7087c9c4046b Namjae Jeon 2025-10-17   39  struct bio *ntfs_setup_bio(struct ntfs_volume *vol, unsigned int opf, s64 lcn,
f4f7087c9c4046b Namjae Jeon 2025-10-17   40  		unsigned int pg_ofs)
f4f7087c9c4046b Namjae Jeon 2025-10-17   41  {
f4f7087c9c4046b Namjae Jeon 2025-10-17   42  	struct bio *bio;
f4f7087c9c4046b Namjae Jeon 2025-10-17   43  
f4f7087c9c4046b Namjae Jeon 2025-10-17  @44  	bio = bio_alloc(vol->sb->s_bdev, 1, opf, GFP_NOIO);
f4f7087c9c4046b Namjae Jeon 2025-10-17   45  	if (!bio)
f4f7087c9c4046b Namjae Jeon 2025-10-17   46  		return NULL;
f4f7087c9c4046b Namjae Jeon 2025-10-17   47  	bio->bi_iter.bi_sector = ((lcn << vol->cluster_size_bits) + pg_ofs) >>
f4f7087c9c4046b Namjae Jeon 2025-10-17   48  		vol->sb->s_blocksize_bits;
f4f7087c9c4046b Namjae Jeon 2025-10-17   49  
f4f7087c9c4046b Namjae Jeon 2025-10-17   50  	return bio;
f4f7087c9c4046b Namjae Jeon 2025-10-17   51  }
f4f7087c9c4046b Namjae Jeon 2025-10-17   52  
f4f7087c9c4046b Namjae Jeon 2025-10-17   53  /**
f4f7087c9c4046b Namjae Jeon 2025-10-17   54   * ntfs_read_folio - fill a @folio of a @file with data from the device
f4f7087c9c4046b Namjae Jeon 2025-10-17   55   * @file:	open file to which the folio @folio belongs or NULL
f4f7087c9c4046b Namjae Jeon 2025-10-17   56   * @folio:	page cache folio to fill with data
f4f7087c9c4046b Namjae Jeon 2025-10-17   57   *
f4f7087c9c4046b Namjae Jeon 2025-10-17   58   * For non-resident attributes, ntfs_read_folio() fills the @folio of the open
f4f7087c9c4046b Namjae Jeon 2025-10-17   59   * file @file by calling the ntfs version of the generic block_read_full_folio()
f4f7087c9c4046b Namjae Jeon 2025-10-17   60   * function, which in turn creates and reads in the buffers associated with
f4f7087c9c4046b Namjae Jeon 2025-10-17   61   * the folio asynchronously.
f4f7087c9c4046b Namjae Jeon 2025-10-17   62   *
f4f7087c9c4046b Namjae Jeon 2025-10-17   63   * For resident attributes, OTOH, ntfs_read_folio() fills @folio by copying the
f4f7087c9c4046b Namjae Jeon 2025-10-17   64   * data from the mft record (which at this stage is most likely in memory) and
f4f7087c9c4046b Namjae Jeon 2025-10-17   65   * fills the remainder with zeroes. Thus, in this case, I/O is synchronous, as
f4f7087c9c4046b Namjae Jeon 2025-10-17   66   * even if the mft record is not cached at this point in time, we need to wait
f4f7087c9c4046b Namjae Jeon 2025-10-17   67   * for it to be read in before we can do the copy.
f4f7087c9c4046b Namjae Jeon 2025-10-17   68   *
f4f7087c9c4046b Namjae Jeon 2025-10-17   69   * Return 0 on success and -errno on error.
f4f7087c9c4046b Namjae Jeon 2025-10-17   70   */
f4f7087c9c4046b Namjae Jeon 2025-10-17   71  static int ntfs_read_folio(struct file *file, struct folio *folio)
f4f7087c9c4046b Namjae Jeon 2025-10-17   72  {
f4f7087c9c4046b Namjae Jeon 2025-10-17   73  	loff_t i_size;
f4f7087c9c4046b Namjae Jeon 2025-10-17   74  	struct inode *vi;
f4f7087c9c4046b Namjae Jeon 2025-10-17   75  	struct ntfs_inode *ni;
f4f7087c9c4046b Namjae Jeon 2025-10-17   76  
f4f7087c9c4046b Namjae Jeon 2025-10-17   77  	vi = folio->mapping->host;
f4f7087c9c4046b Namjae Jeon 2025-10-17   78  	i_size = i_size_read(vi);
f4f7087c9c4046b Namjae Jeon 2025-10-17   79  	/* Is the page fully outside i_size? (truncate in progress) */
f4f7087c9c4046b Namjae Jeon 2025-10-17   80  	if (unlikely(folio->index >= (i_size + PAGE_SIZE - 1) >>
f4f7087c9c4046b Namjae Jeon 2025-10-17   81  			PAGE_SHIFT)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17   82  		folio_zero_segment(folio, 0, PAGE_SIZE);
f4f7087c9c4046b Namjae Jeon 2025-10-17   83  		ntfs_debug("Read outside i_size - truncated?");
f4f7087c9c4046b Namjae Jeon 2025-10-17   84  		folio_mark_uptodate(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17   85  		folio_unlock(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17   86  		return 0;
f4f7087c9c4046b Namjae Jeon 2025-10-17   87  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17   88  	/*
f4f7087c9c4046b Namjae Jeon 2025-10-17   89  	 * This can potentially happen because we clear PageUptodate() during
f4f7087c9c4046b Namjae Jeon 2025-10-17   90  	 * ntfs_writepage() of MstProtected() attributes.
f4f7087c9c4046b Namjae Jeon 2025-10-17   91  	 */
f4f7087c9c4046b Namjae Jeon 2025-10-17   92  	if (folio_test_uptodate(folio)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17   93  		folio_unlock(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17   94  		return 0;
f4f7087c9c4046b Namjae Jeon 2025-10-17   95  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17   96  	ni = NTFS_I(vi);
f4f7087c9c4046b Namjae Jeon 2025-10-17   97  
f4f7087c9c4046b Namjae Jeon 2025-10-17   98  	/*
f4f7087c9c4046b Namjae Jeon 2025-10-17   99  	 * Only $DATA attributes can be encrypted and only unnamed $DATA
f4f7087c9c4046b Namjae Jeon 2025-10-17  100  	 * attributes can be compressed.  Index root can have the flags set but
f4f7087c9c4046b Namjae Jeon 2025-10-17  101  	 * this means to create compressed/encrypted files, not that the
f4f7087c9c4046b Namjae Jeon 2025-10-17  102  	 * attribute is compressed/encrypted.  Note we need to check for
f4f7087c9c4046b Namjae Jeon 2025-10-17  103  	 * AT_INDEX_ALLOCATION since this is the type of both directory and
f4f7087c9c4046b Namjae Jeon 2025-10-17  104  	 * index inodes.
f4f7087c9c4046b Namjae Jeon 2025-10-17  105  	 */
f4f7087c9c4046b Namjae Jeon 2025-10-17  106  	if (ni->type != AT_INDEX_ALLOCATION) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  107  		/* If attribute is encrypted, deny access, just like NT4. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  108  		if (NInoEncrypted(ni)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  109  			BUG_ON(ni->type != AT_DATA);
f4f7087c9c4046b Namjae Jeon 2025-10-17  110  			folio_unlock(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  111  			return -EACCES;
f4f7087c9c4046b Namjae Jeon 2025-10-17  112  		}
f4f7087c9c4046b Namjae Jeon 2025-10-17  113  		/* Compressed data streams are handled in compress.c. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  114  		if (NInoNonResident(ni) && NInoCompressed(ni)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  115  			BUG_ON(ni->type != AT_DATA);
f4f7087c9c4046b Namjae Jeon 2025-10-17  116  			BUG_ON(ni->name_len);
f4f7087c9c4046b Namjae Jeon 2025-10-17  117  			return ntfs_read_compressed_block(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  118  		}
f4f7087c9c4046b Namjae Jeon 2025-10-17  119  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  120  
f4f7087c9c4046b Namjae Jeon 2025-10-17  121  	return iomap_read_folio(folio, &ntfs_read_iomap_ops);
f4f7087c9c4046b Namjae Jeon 2025-10-17  122  }
f4f7087c9c4046b Namjae Jeon 2025-10-17  123  
f4f7087c9c4046b Namjae Jeon 2025-10-17  124  static int ntfs_write_mft_block(struct ntfs_inode *ni, struct folio *folio,
f4f7087c9c4046b Namjae Jeon 2025-10-17  125  		struct writeback_control *wbc)
f4f7087c9c4046b Namjae Jeon 2025-10-17  126  {
f4f7087c9c4046b Namjae Jeon 2025-10-17  127  	struct inode *vi = VFS_I(ni);
f4f7087c9c4046b Namjae Jeon 2025-10-17  128  	struct ntfs_volume *vol = ni->vol;
f4f7087c9c4046b Namjae Jeon 2025-10-17  129  	u8 *kaddr;
f4f7087c9c4046b Namjae Jeon 2025-10-17  130  	struct ntfs_inode *locked_nis[PAGE_SIZE / NTFS_BLOCK_SIZE];
f4f7087c9c4046b Namjae Jeon 2025-10-17  131  	int nr_locked_nis = 0, err = 0, mft_ofs, prev_mft_ofs;
f4f7087c9c4046b Namjae Jeon 2025-10-17  132  	struct bio *bio = NULL;
f4f7087c9c4046b Namjae Jeon 2025-10-17  133  	unsigned long mft_no;
f4f7087c9c4046b Namjae Jeon 2025-10-17  134  	struct ntfs_inode *tni;
f4f7087c9c4046b Namjae Jeon 2025-10-17  135  	s64 lcn;
f4f7087c9c4046b Namjae Jeon 2025-10-17  136  	unsigned int lcn_folio_off = 0;
f4f7087c9c4046b Namjae Jeon 2025-10-17  137  	s64 vcn = (s64)folio->index << PAGE_SHIFT >> vol->cluster_size_bits;
f4f7087c9c4046b Namjae Jeon 2025-10-17  138  	s64 end_vcn = ni->allocated_size >> vol->cluster_size_bits;
f4f7087c9c4046b Namjae Jeon 2025-10-17  139  	unsigned int folio_sz;
f4f7087c9c4046b Namjae Jeon 2025-10-17  140  	struct runlist_element *rl;
f4f7087c9c4046b Namjae Jeon 2025-10-17  141  
f4f7087c9c4046b Namjae Jeon 2025-10-17  142  	ntfs_debug("Entering for inode 0x%lx, attribute type 0x%x, folio index 0x%lx.",
f4f7087c9c4046b Namjae Jeon 2025-10-17  143  			vi->i_ino, ni->type, folio->index);
f4f7087c9c4046b Namjae Jeon 2025-10-17  144  	BUG_ON(!NInoNonResident(ni));
f4f7087c9c4046b Namjae Jeon 2025-10-17  145  	BUG_ON(!NInoMstProtected(ni));
f4f7087c9c4046b Namjae Jeon 2025-10-17  146  
f4f7087c9c4046b Namjae Jeon 2025-10-17  147  	/*
f4f7087c9c4046b Namjae Jeon 2025-10-17  148  	 * NOTE: ntfs_write_mft_block() would be called for $MFTMirr if a page
f4f7087c9c4046b Namjae Jeon 2025-10-17  149  	 * in its page cache were to be marked dirty.  However this should
f4f7087c9c4046b Namjae Jeon 2025-10-17  150  	 * never happen with the current driver and considering we do not
f4f7087c9c4046b Namjae Jeon 2025-10-17  151  	 * handle this case here we do want to BUG(), at least for now.
f4f7087c9c4046b Namjae Jeon 2025-10-17  152  	 */
f4f7087c9c4046b Namjae Jeon 2025-10-17  153  
f4f7087c9c4046b Namjae Jeon 2025-10-17  154  	BUG_ON(!((S_ISREG(vi->i_mode) && !vi->i_ino) || S_ISDIR(vi->i_mode) ||
f4f7087c9c4046b Namjae Jeon 2025-10-17  155  		(NInoAttr(ni) && ni->type == AT_INDEX_ALLOCATION)));
f4f7087c9c4046b Namjae Jeon 2025-10-17  156  
f4f7087c9c4046b Namjae Jeon 2025-10-17  157  	lcn = ntfs_convert_page_index_into_lcn(vol, ni, folio->index);
f4f7087c9c4046b Namjae Jeon 2025-10-17  158  	if (lcn <= LCN_HOLE) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  159  		folio_start_writeback(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  160  		folio_unlock(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  161  		folio_end_writeback(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  162  		return -EIO;
f4f7087c9c4046b Namjae Jeon 2025-10-17  163  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  164  
f4f7087c9c4046b Namjae Jeon 2025-10-17  165  	if (vol->cluster_size_bits > PAGE_SHIFT) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  166  		lcn_folio_off = folio->index << PAGE_SHIFT;
f4f7087c9c4046b Namjae Jeon 2025-10-17  167  		lcn_folio_off &= vol->cluster_size_mask;
f4f7087c9c4046b Namjae Jeon 2025-10-17  168  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  169  
f4f7087c9c4046b Namjae Jeon 2025-10-17  170  	/* Map folio so we can access its contents. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  171  	kaddr = kmap_local_folio(folio, 0);
f4f7087c9c4046b Namjae Jeon 2025-10-17  172  	/* Clear the page uptodate flag whilst the mst fixups are applied. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  173  	folio_clear_uptodate(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  174  
f4f7087c9c4046b Namjae Jeon 2025-10-17  175  	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
f4f7087c9c4046b Namjae Jeon 2025-10-17  176  	     mft_ofs += vol->mft_record_size) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  177  		/* Get the mft record number. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  178  		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
f4f7087c9c4046b Namjae Jeon 2025-10-17  179  			vol->mft_record_size_bits;
f4f7087c9c4046b Namjae Jeon 2025-10-17  180  		/* Check whether to write this mft record. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  181  		tni = NULL;
f4f7087c9c4046b Namjae Jeon 2025-10-17  182  		if (ntfs_may_write_mft_record(vol, mft_no,
f4f7087c9c4046b Namjae Jeon 2025-10-17  183  					(struct mft_record *)(kaddr + mft_ofs), &tni)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  184  			unsigned int mft_record_off = 0;
f4f7087c9c4046b Namjae Jeon 2025-10-17  185  			s64 vcn_off = vcn;
f4f7087c9c4046b Namjae Jeon 2025-10-17  186  
f4f7087c9c4046b Namjae Jeon 2025-10-17  187  			/*
f4f7087c9c4046b Namjae Jeon 2025-10-17  188  			 * The record should be written.  If a locked ntfs
f4f7087c9c4046b Namjae Jeon 2025-10-17  189  			 * inode was returned, add it to the array of locked
f4f7087c9c4046b Namjae Jeon 2025-10-17  190  			 * ntfs inodes.
f4f7087c9c4046b Namjae Jeon 2025-10-17  191  			 */
f4f7087c9c4046b Namjae Jeon 2025-10-17  192  			if (tni)
f4f7087c9c4046b Namjae Jeon 2025-10-17  193  				locked_nis[nr_locked_nis++] = tni;
f4f7087c9c4046b Namjae Jeon 2025-10-17  194  
f4f7087c9c4046b Namjae Jeon 2025-10-17  195  			if (bio && (mft_ofs != prev_mft_ofs + vol->mft_record_size)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  196  flush_bio:
f4f7087c9c4046b Namjae Jeon 2025-10-17  197  				flush_dcache_folio(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  198  				submit_bio_wait(bio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  199  				bio_put(bio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  200  				bio = NULL;
f4f7087c9c4046b Namjae Jeon 2025-10-17  201  			}
f4f7087c9c4046b Namjae Jeon 2025-10-17  202  
f4f7087c9c4046b Namjae Jeon 2025-10-17  203  			if (vol->cluster_size == NTFS_BLOCK_SIZE) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  204  				down_write(&ni->runlist.lock);
f4f7087c9c4046b Namjae Jeon 2025-10-17  205  				rl = ntfs_attr_vcn_to_rl(ni, vcn_off, &lcn);
f4f7087c9c4046b Namjae Jeon 2025-10-17  206  				up_write(&ni->runlist.lock);
f4f7087c9c4046b Namjae Jeon 2025-10-17  207  				if (IS_ERR(rl) || lcn < 0) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  208  					err = -EIO;
f4f7087c9c4046b Namjae Jeon 2025-10-17  209  					goto unm_done;
f4f7087c9c4046b Namjae Jeon 2025-10-17  210  				}
f4f7087c9c4046b Namjae Jeon 2025-10-17  211  			}
f4f7087c9c4046b Namjae Jeon 2025-10-17  212  
f4f7087c9c4046b Namjae Jeon 2025-10-17  213  			if (!bio) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  214  				unsigned int off = lcn_folio_off;
f4f7087c9c4046b Namjae Jeon 2025-10-17  215  
f4f7087c9c4046b Namjae Jeon 2025-10-17  216  				if (vol->cluster_size != NTFS_BLOCK_SIZE)
f4f7087c9c4046b Namjae Jeon 2025-10-17  217  					off += mft_ofs;
f4f7087c9c4046b Namjae Jeon 2025-10-17  218  
f4f7087c9c4046b Namjae Jeon 2025-10-17 @219  				bio = ntfs_setup_bio(vol, REQ_OP_WRITE, lcn, off);
f4f7087c9c4046b Namjae Jeon 2025-10-17  220  				if (!bio) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  221  					err = -ENOMEM;
f4f7087c9c4046b Namjae Jeon 2025-10-17  222  					goto unm_done;
f4f7087c9c4046b Namjae Jeon 2025-10-17  223  				}
f4f7087c9c4046b Namjae Jeon 2025-10-17  224  			}
f4f7087c9c4046b Namjae Jeon 2025-10-17  225  
f4f7087c9c4046b Namjae Jeon 2025-10-17  226  			if (vol->cluster_size == NTFS_BLOCK_SIZE && rl->length == 1)
f4f7087c9c4046b Namjae Jeon 2025-10-17  227  				folio_sz = NTFS_BLOCK_SIZE;
f4f7087c9c4046b Namjae Jeon 2025-10-17  228  			else
f4f7087c9c4046b Namjae Jeon 2025-10-17  229  				folio_sz = vol->mft_record_size;
f4f7087c9c4046b Namjae Jeon 2025-10-17  230  			if (!bio_add_folio(bio, folio, folio_sz,
f4f7087c9c4046b Namjae Jeon 2025-10-17  231  					   mft_ofs + mft_record_off)) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  232  				err = -EIO;
f4f7087c9c4046b Namjae Jeon 2025-10-17  233  				bio_put(bio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  234  				goto unm_done;
f4f7087c9c4046b Namjae Jeon 2025-10-17  235  			}
f4f7087c9c4046b Namjae Jeon 2025-10-17  236  			prev_mft_ofs = mft_ofs;
f4f7087c9c4046b Namjae Jeon 2025-10-17  237  			mft_record_off += folio_sz;
f4f7087c9c4046b Namjae Jeon 2025-10-17  238  
f4f7087c9c4046b Namjae Jeon 2025-10-17  239  			if (mft_record_off != vol->mft_record_size) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  240  				vcn_off++;
f4f7087c9c4046b Namjae Jeon 2025-10-17  241  				goto flush_bio;
f4f7087c9c4046b Namjae Jeon 2025-10-17  242  			}
f4f7087c9c4046b Namjae Jeon 2025-10-17  243  
f4f7087c9c4046b Namjae Jeon 2025-10-17  244  			if (mft_no < vol->mftmirr_size)
f4f7087c9c4046b Namjae Jeon 2025-10-17  245  				ntfs_sync_mft_mirror(vol, mft_no,
f4f7087c9c4046b Namjae Jeon 2025-10-17  246  						(struct mft_record *)(kaddr + mft_ofs));
f4f7087c9c4046b Namjae Jeon 2025-10-17  247  		}
f4f7087c9c4046b Namjae Jeon 2025-10-17  248  
f4f7087c9c4046b Namjae Jeon 2025-10-17  249  		vcn += vol->mft_record_size >> vol->cluster_size_bits;
f4f7087c9c4046b Namjae Jeon 2025-10-17  250  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  251  
f4f7087c9c4046b Namjae Jeon 2025-10-17  252  	if (bio) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  253  		flush_dcache_folio(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  254  		submit_bio_wait(bio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  255  		bio_put(bio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  256  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  257  	flush_dcache_folio(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  258  unm_done:
f4f7087c9c4046b Namjae Jeon 2025-10-17  259  	folio_mark_uptodate(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  260  	kunmap_local(kaddr);
f4f7087c9c4046b Namjae Jeon 2025-10-17  261  
f4f7087c9c4046b Namjae Jeon 2025-10-17  262  	folio_start_writeback(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  263  	folio_unlock(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  264  	folio_end_writeback(folio);
f4f7087c9c4046b Namjae Jeon 2025-10-17  265  
f4f7087c9c4046b Namjae Jeon 2025-10-17  266  	/* Unlock any locked inodes. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  267  	while (nr_locked_nis-- > 0) {
f4f7087c9c4046b Namjae Jeon 2025-10-17  268  		struct ntfs_inode *base_tni;
f4f7087c9c4046b Namjae Jeon 2025-10-17  269  
f4f7087c9c4046b Namjae Jeon 2025-10-17  270  		tni = locked_nis[nr_locked_nis];
f4f7087c9c4046b Namjae Jeon 2025-10-17  271  		mutex_unlock(&tni->mrec_lock);
f4f7087c9c4046b Namjae Jeon 2025-10-17  272  
f4f7087c9c4046b Namjae Jeon 2025-10-17  273  		/* Get the base inode. */
f4f7087c9c4046b Namjae Jeon 2025-10-17  274  		mutex_lock(&tni->extent_lock);
f4f7087c9c4046b Namjae Jeon 2025-10-17  275  		if (tni->nr_extents >= 0)
f4f7087c9c4046b Namjae Jeon 2025-10-17  276  			base_tni = tni;
f4f7087c9c4046b Namjae Jeon 2025-10-17  277  		else {
f4f7087c9c4046b Namjae Jeon 2025-10-17  278  			base_tni = tni->ext.base_ntfs_ino;
f4f7087c9c4046b Namjae Jeon 2025-10-17  279  			BUG_ON(!base_tni);
f4f7087c9c4046b Namjae Jeon 2025-10-17  280  		}
f4f7087c9c4046b Namjae Jeon 2025-10-17  281  		mutex_unlock(&tni->extent_lock);
f4f7087c9c4046b Namjae Jeon 2025-10-17  282  		ntfs_debug("Unlocking %s inode 0x%lx.",
f4f7087c9c4046b Namjae Jeon 2025-10-17  283  				tni == base_tni ? "base" : "extent",
f4f7087c9c4046b Namjae Jeon 2025-10-17  284  				tni->mft_no);
f4f7087c9c4046b Namjae Jeon 2025-10-17  285  		atomic_dec(&tni->count);
f4f7087c9c4046b Namjae Jeon 2025-10-17  286  		iput(VFS_I(base_tni));
f4f7087c9c4046b Namjae Jeon 2025-10-17  287  	}
f4f7087c9c4046b Namjae Jeon 2025-10-17  288  
f4f7087c9c4046b Namjae Jeon 2025-10-17  289  	if (unlikely(err && err != -ENOMEM))
f4f7087c9c4046b Namjae Jeon 2025-10-17  290  		NVolSetErrors(vol);
f4f7087c9c4046b Namjae Jeon 2025-10-17  291  	if (likely(!err))
f4f7087c9c4046b Namjae Jeon 2025-10-17  292  		ntfs_debug("Done.");
f4f7087c9c4046b Namjae Jeon 2025-10-17  293  	return err;
f4f7087c9c4046b Namjae Jeon 2025-10-17  294  }
f4f7087c9c4046b Namjae Jeon 2025-10-17  295  

:::::: The code at line 44 was first introduced by commit
:::::: f4f7087c9c4046b895595c4f684c38b75c929642 ntfsplus: add iomap and address space operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
