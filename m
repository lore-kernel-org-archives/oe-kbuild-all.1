Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09627B353
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 01:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770083439; cv=none; b=qONOQobMOq8PEfmnPrfwRqUszRHG2Dwz6IBd4gE67eSg/bOM7yOkh+3RdGoGudOKp2P1qS8xOynfWShKZVtF4nZSLDq8O7S/MmtB6DcVP2rtG1McQQ0URpnirmyqLIfWdZSqX2bK88WK3UECbrnd0NmWaN0WojiTOvhqty76TuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770083439; c=relaxed/simple;
	bh=0JVgXH0JjJMgAXaeWJ9eB1U6t8TXejIpdihJraDWmJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lk5oPerr8m9D1ILZpcw8BsHku+7gmC7jFqEFXJr4xqNdkU18z6hROo/OdDeZ8z/BXB4RXN3mTDMPoskSNWh+TyECjx8EiScHnIUkgnIsqj3HTqtXCaN2q0WoxNfDOxU7IO4DhIvzbJS032cU9n7v8KwOaTvJIUKYj0Qb8DaB0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xkc3fw+y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xkc3fw+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770083437; x=1801619437;
  h=date:from:to:cc:subject:message-id;
  bh=0JVgXH0JjJMgAXaeWJ9eB1U6t8TXejIpdihJraDWmJc=;
  b=Xkc3fw+ywMNreJReVCzJON4Oh1l/TYcGJR1a/l19yyoScTWq/68Su4Tf
   aXTzPJ0LRZcWU9a72bnbL/F/gOOw2PzQR05T6V6OAZRdOMg8tV1mJSmxb
   ys3xhVWSke5hMUwEcaZO+QnmH4rRyQVkt7LQF9zVn+92oN8/t+I87zT92
   Gu7Sp4aZbl11wLUDWdybAY1vic9Ga7rcJQY1HZvbdUT2XaqddrMO6UfCy
   4iwUzu59gjLu24Gn0UgnP1Jy7HhXfRGeGA8oHasWb+qRmpyMzb6yXCZVK
   WWr1rSu6kCtnv0gBam1ZJROlPPZE28lzWtuO8I/urtktoCZJZ4+sOWW6r
   Q==;
X-CSE-ConnectionGUID: n++GBQLiSheK3B3/fdXpbw==
X-CSE-MsgGUID: pHEEEO2PTRaxtoeIXR0POg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70972307"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="70972307"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:50:36 -0800
X-CSE-ConnectionGUID: zTzWFbi5SwGE8KdgnDh0wQ==
X-CSE-MsgGUID: zbJVYEe0S0OxJ3aaezCh7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="214468310"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Feb 2026 17:50:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn5Ym-00000000g7w-1LJw;
	Tue, 03 Feb 2026 01:50:32 +0000
Date: Tue, 03 Feb 2026 09:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 15/16] fs/ntfs/mft.c:2889:1:
 warning: the frame size of 2192 bytes is larger than 2048 bytes
Message-ID: <202602030912.Ed0XABcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   fa25a4cfebdf4edefd48fa36bdd71f6b1886ced3
commit: a9769422dcfc76cf0834755d75b2535ff95948dd [15/16] ntfs: add Kconfig and Makefile
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602030912.Ed0XABcN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030912.Ed0XABcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030912.Ed0XABcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ntfs/mft.c: In function 'ntfs_write_mft_block.isra':
>> fs/ntfs/mft.c:2889:1: warning: the frame size of 2192 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    2889 | }
         | ^


vim +2889 fs/ntfs/mft.c

6e95d0998f454e9 Namjae Jeon 2026-02-02  2685  
c093359b6a6994b Namjae Jeon 2025-12-30  2686  /*
6e95d0998f454e9 Namjae Jeon 2026-02-02  2687   * ntfs_write_mft_block - Write back a folio containing MFT records
6e95d0998f454e9 Namjae Jeon 2026-02-02  2688   * @folio:	The folio to write back (contains one or more MFT records)
6e95d0998f454e9 Namjae Jeon 2026-02-02  2689   * @wbc:	Writeback control structure
6e95d0998f454e9 Namjae Jeon 2026-02-02  2690   *
6e95d0998f454e9 Namjae Jeon 2026-02-02  2691   * This function is called as part of the address_space_operations
6e95d0998f454e9 Namjae Jeon 2026-02-02  2692   * .writepages implementation for the $MFT inode (or $MFTMirr).
6e95d0998f454e9 Namjae Jeon 2026-02-02  2693   * It handles writing one folio (normally 4KiB page) worth of MFT records
6e95d0998f454e9 Namjae Jeon 2026-02-02  2694   * to the underlying block device.
6e95d0998f454e9 Namjae Jeon 2026-02-02  2695   *
6e95d0998f454e9 Namjae Jeon 2026-02-02  2696   * Return: 0 on success, or -errno on error.
c093359b6a6994b Namjae Jeon 2025-12-30  2697   */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2698  static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *wbc)
6e95d0998f454e9 Namjae Jeon 2026-02-02  2699  {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2700  	struct address_space *mapping = folio->mapping;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2701  	struct inode *vi = mapping->host;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2702  	struct ntfs_inode *ni = NTFS_I(vi);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2703  	struct ntfs_volume *vol = ni->vol;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2704  	u8 *kaddr;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2705  	struct ntfs_inode *locked_nis[PAGE_SIZE / NTFS_BLOCK_SIZE];
6e95d0998f454e9 Namjae Jeon 2026-02-02  2706  	int nr_locked_nis = 0, err = 0, mft_ofs, prev_mft_ofs;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2707  	struct inode *ref_inos[PAGE_SIZE / NTFS_BLOCK_SIZE];
6e95d0998f454e9 Namjae Jeon 2026-02-02  2708  	int nr_ref_inos = 0;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2709  	struct bio *bio = NULL;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2710  	unsigned long mft_no;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2711  	struct ntfs_inode *tni;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2712  	s64 lcn;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2713  	s64 vcn = ntfs_pidx_to_cluster(vol, folio->index);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2714  	s64 end_vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2715  	unsigned int folio_sz;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2716  	struct runlist_element *rl;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2717  	loff_t i_size = i_size_read(vi);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2718  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2719  	ntfs_debug("Entering for inode 0x%lx, attribute type 0x%x, folio index 0x%lx.",
6e95d0998f454e9 Namjae Jeon 2026-02-02  2720  			vi->i_ino, ni->type, folio->index);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2721  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2722  	/* We have to zero every time due to mmap-at-end-of-file. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2723  	if (folio->index >= (i_size >> folio_shift(folio)))
6e95d0998f454e9 Namjae Jeon 2026-02-02  2724  		/* The page straddles i_size. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2725  		folio_zero_segment(folio,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2726  				   offset_in_folio(folio, i_size),
6e95d0998f454e9 Namjae Jeon 2026-02-02  2727  				   folio_size(folio));
6e95d0998f454e9 Namjae Jeon 2026-02-02  2728  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2729  	lcn = lcn_from_index(vol, ni, folio->index);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2730  	if (lcn <= LCN_HOLE) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2731  		folio_start_writeback(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2732  		folio_unlock(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2733  		folio_end_writeback(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2734  		return -EIO;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2735  	}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2736  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2737  	/* Map folio so we can access its contents. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2738  	kaddr = kmap_local_folio(folio, 0);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2739  	/* Clear the page uptodate flag whilst the mst fixups are applied. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2740  	folio_clear_uptodate(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2741  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2742  	for (mft_ofs = 0; mft_ofs < PAGE_SIZE && vcn < end_vcn;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2743  	     mft_ofs += vol->mft_record_size) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2744  		/* Get the mft record number. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2745  		mft_no = (((s64)folio->index << PAGE_SHIFT) + mft_ofs) >>
6e95d0998f454e9 Namjae Jeon 2026-02-02  2746  			vol->mft_record_size_bits;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2747  		vcn = ntfs_mft_no_to_cluster(vol, mft_no);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2748  		/* Check whether to write this mft record. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2749  		tni = NULL;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2750  		if (ntfs_may_write_mft_record(vol, mft_no,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2751  					(struct mft_record *)(kaddr + mft_ofs),
6e95d0998f454e9 Namjae Jeon 2026-02-02  2752  					&tni, &ref_inos[nr_ref_inos])) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2753  			unsigned int mft_record_off = 0;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2754  			s64 vcn_off = vcn;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2755  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2756  			/*
6e95d0998f454e9 Namjae Jeon 2026-02-02  2757  			 * Skip $MFT extent mft records and let them being written
6e95d0998f454e9 Namjae Jeon 2026-02-02  2758  			 * by writeback to avioid deadlocks. the $MFT runlist
6e95d0998f454e9 Namjae Jeon 2026-02-02  2759  			 * lock must be taken before $MFT extent mrec_lock is taken.
6e95d0998f454e9 Namjae Jeon 2026-02-02  2760  			 */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2761  			if (tni && tni->nr_extents < 0 &&
6e95d0998f454e9 Namjae Jeon 2026-02-02  2762  				tni->ext.base_ntfs_ino == NTFS_I(vol->mft_ino)) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2763  				mutex_unlock(&tni->mrec_lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2764  				atomic_dec(&tni->count);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2765  				iput(vol->mft_ino);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2766  				continue;
c093359b6a6994b Namjae Jeon 2025-12-30  2767  			}
c093359b6a6994b Namjae Jeon 2025-12-30  2768  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2769  			/*
6e95d0998f454e9 Namjae Jeon 2026-02-02  2770  			 * The record should be written.  If a locked ntfs
6e95d0998f454e9 Namjae Jeon 2026-02-02  2771  			 * inode was returned, add it to the array of locked
6e95d0998f454e9 Namjae Jeon 2026-02-02  2772  			 * ntfs inodes.
6e95d0998f454e9 Namjae Jeon 2026-02-02  2773  			 */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2774  			if (tni)
6e95d0998f454e9 Namjae Jeon 2026-02-02  2775  				locked_nis[nr_locked_nis++] = tni;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2776  			else if (ref_inos[nr_ref_inos])
6e95d0998f454e9 Namjae Jeon 2026-02-02  2777  				nr_ref_inos++;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2778  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2779  			if (bio && (mft_ofs != prev_mft_ofs + vol->mft_record_size)) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2780  flush_bio:
6e95d0998f454e9 Namjae Jeon 2026-02-02  2781  				bio->bi_end_io = ntfs_bio_end_io;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2782  				submit_bio(bio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2783  				bio = NULL;
c093359b6a6994b Namjae Jeon 2025-12-30  2784  			}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2785  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2786  			if (vol->cluster_size < folio_size(folio)) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2787  				down_write(&ni->runlist.lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2788  				rl = ntfs_attr_vcn_to_rl(ni, vcn_off, &lcn);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2789  				up_write(&ni->runlist.lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2790  				if (IS_ERR(rl) || lcn < 0) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2791  					err = -EIO;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2792  					goto unm_done;
c093359b6a6994b Namjae Jeon 2025-12-30  2793  				}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2794  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2795  				if (bio &&
6e95d0998f454e9 Namjae Jeon 2026-02-02  2796  				   (bio_end_sector(bio) >> (vol->cluster_size_bits - 9)) !=
6e95d0998f454e9 Namjae Jeon 2026-02-02  2797  				    lcn) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2798  					bio->bi_end_io = ntfs_bio_end_io;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2799  					submit_bio(bio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2800  					bio = NULL;
c093359b6a6994b Namjae Jeon 2025-12-30  2801  				}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2802  			}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2803  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2804  			if (!bio) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2805  				unsigned int off;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2806  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2807  				off = ((mft_no << vol->mft_record_size_bits) +
6e95d0998f454e9 Namjae Jeon 2026-02-02  2808  				       mft_record_off) & vol->cluster_size_mask;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2809  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2810  				bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2811  						GFP_NOIO);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2812  				bio->bi_iter.bi_sector =
6e95d0998f454e9 Namjae Jeon 2026-02-02  2813  					ntfs_bytes_to_sector(vol,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2814  							ntfs_cluster_to_bytes(vol, lcn) + off);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2815  			}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2816  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2817  			if (vol->cluster_size == NTFS_BLOCK_SIZE &&
6e95d0998f454e9 Namjae Jeon 2026-02-02  2818  			    (mft_record_off ||
6e95d0998f454e9 Namjae Jeon 2026-02-02  2819  			     rl->length - (vcn_off - rl->vcn) == 1 ||
6e95d0998f454e9 Namjae Jeon 2026-02-02  2820  			     mft_ofs + NTFS_BLOCK_SIZE >= PAGE_SIZE))
6e95d0998f454e9 Namjae Jeon 2026-02-02  2821  				folio_sz = NTFS_BLOCK_SIZE;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2822  			else
6e95d0998f454e9 Namjae Jeon 2026-02-02  2823  				folio_sz = vol->mft_record_size;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2824  			if (!bio_add_folio(bio, folio, folio_sz,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2825  					   mft_ofs + mft_record_off)) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2826  				err = -EIO;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2827  				bio_put(bio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2828  				goto unm_done;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2829  			}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2830  			mft_record_off += folio_sz;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2831  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2832  			if (mft_record_off != vol->mft_record_size) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2833  				vcn_off++;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2834  				goto flush_bio;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2835  			}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2836  			prev_mft_ofs = mft_ofs;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2837  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2838  			if (mft_no < vol->mftmirr_size)
6e95d0998f454e9 Namjae Jeon 2026-02-02  2839  				ntfs_sync_mft_mirror(vol, mft_no,
6e95d0998f454e9 Namjae Jeon 2026-02-02  2840  						(struct mft_record *)(kaddr + mft_ofs));
6e95d0998f454e9 Namjae Jeon 2026-02-02  2841  		} else if (ref_inos[nr_ref_inos])
6e95d0998f454e9 Namjae Jeon 2026-02-02  2842  			nr_ref_inos++;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2843  	}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2844  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2845  	if (bio) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2846  		bio->bi_end_io = ntfs_bio_end_io;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2847  		submit_bio(bio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2848  	}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2849  unm_done:
6e95d0998f454e9 Namjae Jeon 2026-02-02  2850  	folio_mark_uptodate(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2851  	kunmap_local(kaddr);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2852  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2853  	folio_start_writeback(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2854  	folio_unlock(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2855  	folio_end_writeback(folio);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2856  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2857  	/* Unlock any locked inodes. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2858  	while (nr_locked_nis-- > 0) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2859  		struct ntfs_inode *base_tni;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2860  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2861  		tni = locked_nis[nr_locked_nis];
6e95d0998f454e9 Namjae Jeon 2026-02-02  2862  		mutex_unlock(&tni->mrec_lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2863  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2864  		/* Get the base inode. */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2865  		mutex_lock(&tni->extent_lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2866  		if (tni->nr_extents >= 0)
6e95d0998f454e9 Namjae Jeon 2026-02-02  2867  			base_tni = tni;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2868  		else
6e95d0998f454e9 Namjae Jeon 2026-02-02  2869  			base_tni = tni->ext.base_ntfs_ino;
6e95d0998f454e9 Namjae Jeon 2026-02-02  2870  		mutex_unlock(&tni->extent_lock);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2871  		ntfs_debug("Unlocking %s inode 0x%lx.",
6e95d0998f454e9 Namjae Jeon 2026-02-02  2872  				tni == base_tni ? "base" : "extent",
6e95d0998f454e9 Namjae Jeon 2026-02-02  2873  				tni->mft_no);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2874  		atomic_dec(&tni->count);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2875  		iput(VFS_I(base_tni));
6e95d0998f454e9 Namjae Jeon 2026-02-02  2876  	}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2877  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2878  	/* Dropping deferred references */
6e95d0998f454e9 Namjae Jeon 2026-02-02  2879  	while (nr_ref_inos-- > 0) {
6e95d0998f454e9 Namjae Jeon 2026-02-02  2880  		if (ref_inos[nr_ref_inos])
6e95d0998f454e9 Namjae Jeon 2026-02-02  2881  			iput(ref_inos[nr_ref_inos]);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2882  	}
6e95d0998f454e9 Namjae Jeon 2026-02-02  2883  
6e95d0998f454e9 Namjae Jeon 2026-02-02  2884  	if (unlikely(err && err != -ENOMEM))
6e95d0998f454e9 Namjae Jeon 2026-02-02  2885  		NVolSetErrors(vol);
6e95d0998f454e9 Namjae Jeon 2026-02-02  2886  	if (likely(!err))
6e95d0998f454e9 Namjae Jeon 2026-02-02  2887  		ntfs_debug("Done.");
c093359b6a6994b Namjae Jeon 2025-12-30  2888  	return err;
c093359b6a6994b Namjae Jeon 2025-12-30 @2889  }
6e95d0998f454e9 Namjae Jeon 2026-02-02  2890  

:::::: The code at line 2889 was first introduced by commit
:::::: c093359b6a6994b38d32680e64674aeb21bbe9ef Revert "fs: Remove NTFS classic"

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
