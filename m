Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0F320F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 05:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743313291; cv=none; b=mIG8yTpvlipeoNVbabCYm+ngoZ91KNpJhSrnMiRi2f85bNNkeaGFiqPxrtsMg7wpg6xktgKoUhu55sxuEqQXxlBalXuuphdRf/S3w+xdgDkJuKmnQnMziR41NPIL9rcXkNqBXs+LPpUHeJrz68/GlTFVDedG+q7Si4E0pf+4u8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743313291; c=relaxed/simple;
	bh=V8fr5dUip17RQZGhRWS11LCMHTXNxpP5hdisBses4y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hW2ziXbZWxu2/WNPO21SjZ4WEy19pITUOQ1myXgwAyhAlnrcAkAUOAWPWoF9W6WQE5LF0jftJR3lPdrdY2aktsa5VmLKRMtDzvrHpEzOtcwV5qasD8KblEg1pfWsTWreQi8YV6sDbrZpKacf5DPtwjPAVlRJnJ51DqaIAShsI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLSxTBdK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLSxTBdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743313289; x=1774849289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8fr5dUip17RQZGhRWS11LCMHTXNxpP5hdisBses4y0=;
  b=JLSxTBdKdW62BYdYEUgDm/rchOxaHVMe/MKb6O9YcLjIZQXDTW7ReiiH
   z3IQNJr8Rp3cnzJOpfHAT2ZPu5raUmTMlLAhzpEo9i89mTvq7+UwVg/85
   2Zkc9lB71VwaKJRZOtNWLAtAOAZUMAZfxBsSGL89VGGkxTg043VKed5qk
   XzoiGZxwttPQWcEas1L2vHmyibzLHFsTnqsMJB24DXUBYRn2oz72KslY9
   WUDWN0p8Jj1/vcExXbHljERsE+kmq1riwwQNl4/OcPSdjZZrPr/R49EdW
   2/sFLcezOzJVgj49SlzdIN8KRbu+/MBW2ftoWW2K5/OT311GYVGNfjoW7
   Q==;
X-CSE-ConnectionGUID: IIJ/AkRxTh6pRzEN1LYT0Q==
X-CSE-MsgGUID: xNO2lyxnSzOAmXAbB42pFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44345727"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44345727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 22:41:28 -0700
X-CSE-ConnectionGUID: NUOagltURi+P4tsFptPlIg==
X-CSE-MsgGUID: +QG9XRDpSTG+VqBCMv+fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="125622925"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2025 22:41:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tylQ8-0008X8-0b;
	Sun, 30 Mar 2025 05:41:21 +0000
Date: Sun, 30 Mar 2025 13:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 140/140] fs/erofs/data.c:245:47:
 warning: variable 'length' set but not used
Message-ID: <202503301316.22wYtpUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   cead3662bf284665fff11a4f7e429b457d2608ca
commit: 9f0f12ed9b779703b6331c943a405444ea2dcf7b [140/140] erofs: add 48-bit block addressing on-disk support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250330/202503301316.22wYtpUz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301316.22wYtpUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301316.22wYtpUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/data.c:49:7: warning: no previous prototype for '__erofs_bread' [-Wmissing-prototypes]
      49 | void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
         |       ^~~~~~~~~~~~~
   fs/erofs/data.c: In function 'erofs_map_dev':
>> fs/erofs/data.c:245:47: warning: variable 'length' set but not used [-Wunused-but-set-variable]
     245 |                         erofs_off_t startoff, length;
         |                                               ^~~~~~


vim +/length +245 fs/erofs/data.c

5af84129f73c55 Gao Xiang 2022-01-02   44  
168eb42949bd68 Jingbo Xu 2023-03-13   45  /*
168eb42949bd68 Jingbo Xu 2023-03-13   46   * Derive the block size from inode->i_blkbits to make compatible with
168eb42949bd68 Jingbo Xu 2023-03-13   47   * anonymous inode in fscache mode.
168eb42949bd68 Jingbo Xu 2023-03-13   48   */
37bc6e053254d5 Liu Bo    2023-06-14  @49  void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
37bc6e053254d5 Liu Bo    2023-06-14   50  		    struct inode *inode, erofs_blk_t blkaddr,
37bc6e053254d5 Liu Bo    2023-06-14   51  		    enum erofs_kmap_type type)
5af84129f73c55 Gao Xiang 2022-01-02   52  {
168eb42949bd68 Jingbo Xu 2023-03-13   53  	erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
f85d7620b323c3 Gao Xiang 2022-03-16   54  	struct address_space *const mapping = inode->i_mapping;
5af84129f73c55 Gao Xiang 2022-01-02   55  	pgoff_t index = offset >> PAGE_SHIFT;
5af84129f73c55 Gao Xiang 2022-01-02   56  	struct page *page = buf->page;
5af84129f73c55 Gao Xiang 2022-01-02   57  
5af84129f73c55 Gao Xiang 2022-01-02   58  	if (!page || page->index != index) {
5af84129f73c55 Gao Xiang 2022-01-02   59  		erofs_put_metabuf(buf);
537e3a93595e98 Gao Xiang 2023-11-27   60  #ifdef CONFIG_EROFS_FS_RAFS_V6
a8db834e1bb021 Jingbo Xu 2023-05-05   61  		if (sb && erofs_is_rafsv6_mode(sb)) {
37bc6e053254d5 Liu Bo    2023-06-14   62  			unsigned int nofs_flag;
37bc6e053254d5 Liu Bo    2023-06-14   63  
37bc6e053254d5 Liu Bo    2023-06-14   64  			nofs_flag = memalloc_nofs_save();
cc28d7800c8310 Liu Bo    2023-06-14   65  			if (IS_DAX(inode)) {
cc28d7800c8310 Liu Bo    2023-06-14   66  				page = mapping->a_ops->startpfn(mapping, index,
cc28d7800c8310 Liu Bo    2023-06-14   67  								&buf->iomap);
cc28d7800c8310 Liu Bo    2023-06-14   68  				if (!IS_ERR(page))
cc28d7800c8310 Liu Bo    2023-06-14   69  					buf->mapping = mapping;
cc28d7800c8310 Liu Bo    2023-06-14   70  			} else {
37bc6e053254d5 Liu Bo    2023-06-14   71  				page = read_cache_page(mapping, index,
37bc6e053254d5 Liu Bo    2023-06-14   72  					       (filler_t *)mapping->a_ops->readpage,
37bc6e053254d5 Liu Bo    2023-06-14   73  					       EROFS_SB(sb)->bootstrap);
cc28d7800c8310 Liu Bo    2023-06-14   74  			}
37bc6e053254d5 Liu Bo    2023-06-14   75  			memalloc_nofs_restore(nofs_flag);
537e3a93595e98 Gao Xiang 2023-11-27   76  		} else
537e3a93595e98 Gao Xiang 2023-11-27   77  #endif
537e3a93595e98 Gao Xiang 2023-11-27   78  		{
f85d7620b323c3 Gao Xiang 2022-03-16   79  			page = read_cache_page_gfp(mapping, index,
f85d7620b323c3 Gao Xiang 2022-03-16   80  				   mapping_gfp_constraint(mapping, ~__GFP_FS));
37bc6e053254d5 Liu Bo    2023-06-14   81  		}
537e3a93595e98 Gao Xiang 2023-11-27   82  
5af84129f73c55 Gao Xiang 2022-01-02   83  		if (IS_ERR(page))
5af84129f73c55 Gao Xiang 2022-01-02   84  			return page;
5af84129f73c55 Gao Xiang 2022-01-02   85  		/* should already be PageUptodate, no need to lock page */
5af84129f73c55 Gao Xiang 2022-01-02   86  		buf->page = page;
5af84129f73c55 Gao Xiang 2022-01-02   87  	}
5af84129f73c55 Gao Xiang 2022-01-02   88  	if (buf->kmap_type == EROFS_NO_KMAP) {
5af84129f73c55 Gao Xiang 2022-01-02   89  		if (type == EROFS_KMAP)
5af84129f73c55 Gao Xiang 2022-01-02   90  			buf->base = kmap(page);
5af84129f73c55 Gao Xiang 2022-01-02   91  		else if (type == EROFS_KMAP_ATOMIC)
5af84129f73c55 Gao Xiang 2022-01-02   92  			buf->base = kmap_atomic(page);
5af84129f73c55 Gao Xiang 2022-01-02   93  		buf->kmap_type = type;
5af84129f73c55 Gao Xiang 2022-01-02   94  	} else if (buf->kmap_type != type) {
5af84129f73c55 Gao Xiang 2022-01-02   95  		DBG_BUGON(1);
5af84129f73c55 Gao Xiang 2022-01-02   96  		return ERR_PTR(-EFAULT);
5af84129f73c55 Gao Xiang 2022-01-02   97  	}
5af84129f73c55 Gao Xiang 2022-01-02   98  	if (type == EROFS_NO_KMAP)
5af84129f73c55 Gao Xiang 2022-01-02   99  		return NULL;
5af84129f73c55 Gao Xiang 2022-01-02  100  	return buf->base + (offset & ~PAGE_MASK);
5af84129f73c55 Gao Xiang 2022-01-02  101  }
5af84129f73c55 Gao Xiang 2022-01-02  102  
37bc6e053254d5 Liu Bo    2023-06-14  103  void *erofs_bread(struct erofs_buf *buf, struct inode *inode,
37bc6e053254d5 Liu Bo    2023-06-14  104  		  erofs_blk_t blkaddr, enum erofs_kmap_type type)
37bc6e053254d5 Liu Bo    2023-06-14  105  {
37bc6e053254d5 Liu Bo    2023-06-14  106  	return __erofs_bread(NULL, buf, inode, blkaddr, type);
37bc6e053254d5 Liu Bo    2023-06-14  107  }
37bc6e053254d5 Liu Bo    2023-06-14  108  
f85d7620b323c3 Gao Xiang 2022-03-16  109  void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
f85d7620b323c3 Gao Xiang 2022-03-16  110  			 erofs_blk_t blkaddr, enum erofs_kmap_type type)
f85d7620b323c3 Gao Xiang 2022-03-16  111  {
537e3a93595e98 Gao Xiang 2023-11-27  112  #ifdef CONFIG_EROFS_FS_RAFS_V6
a8db834e1bb021 Jingbo Xu 2023-05-05  113  	if (erofs_is_rafsv6_mode(sb))
37bc6e053254d5 Liu Bo    2023-06-14  114  		return __erofs_bread(sb, buf, EROFS_SB(sb)->bootstrap->f_inode,
20af86836304d0 Liu Bo    2023-06-14  115  				     blkaddr, type);
537e3a93595e98 Gao Xiang 2023-11-27  116  #endif
f85d7620b323c3 Gao Xiang 2022-03-16  117  	if (erofs_is_fscache_mode(sb))
f85d7620b323c3 Gao Xiang 2022-03-16  118  		return erofs_bread(buf, EROFS_SB(sb)->s_fscache->inode,
f85d7620b323c3 Gao Xiang 2022-03-16  119  				   blkaddr, type);
f85d7620b323c3 Gao Xiang 2022-03-16  120  
f85d7620b323c3 Gao Xiang 2022-03-16  121  	return erofs_bread(buf, sb->s_bdev->bd_inode, blkaddr, type);
f85d7620b323c3 Gao Xiang 2022-03-16  122  }
f85d7620b323c3 Gao Xiang 2022-03-16  123  
4590e91946874c Jingbo Xu 2023-02-09  124  int erofs_map_blocks(struct inode *inode, struct erofs_map_blocks *map)
c5305cc0a9c206 Gao Xiang 2021-08-20  125  {
34bc2f0eb2de63 Gao Xiang 2025-03-10  126  	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
c5305cc0a9c206 Gao Xiang 2021-08-20  127  	struct super_block *sb = inode->i_sb;
34bc2f0eb2de63 Gao Xiang 2025-03-10  128  	unsigned int unit, blksz = sb->s_blocksize;
c5305cc0a9c206 Gao Xiang 2021-08-20  129  	struct erofs_inode *vi = EROFS_I(inode);
c5305cc0a9c206 Gao Xiang 2021-08-20  130  	struct erofs_inode_chunk_index *idx;
34bc2f0eb2de63 Gao Xiang 2025-03-10  131  	erofs_blk_t startblk;
34bc2f0eb2de63 Gao Xiang 2025-03-10  132  	bool tailpacking;
c5305cc0a9c206 Gao Xiang 2021-08-20  133  	erofs_off_t pos;
34bc2f0eb2de63 Gao Xiang 2025-03-10  134  	u64 chunknr;
5af84129f73c55 Gao Xiang 2022-01-02  135  	void *kaddr;
c5305cc0a9c206 Gao Xiang 2021-08-20  136  	int err = 0;
c5305cc0a9c206 Gao Xiang 2021-08-20  137  
4590e91946874c Jingbo Xu 2023-02-09  138  	trace_erofs_map_blocks_enter(inode, map, 0);
72920d6cd9da7f Gao Xiang 2021-10-14  139  	map->m_deviceid = 0;
34bc2f0eb2de63 Gao Xiang 2025-03-10  140  	if (map->m_la >= inode->i_size)
c5305cc0a9c206 Gao Xiang 2021-08-20  141  		goto out;
c5305cc0a9c206 Gao Xiang 2021-08-20  142  
d5953c04b593dc Gao Xiang 2021-12-09  143  	if (vi->datalayout != EROFS_INODE_CHUNK_BASED) {
34bc2f0eb2de63 Gao Xiang 2025-03-10  144  		tailpacking = (vi->datalayout == EROFS_INODE_FLAT_INLINE);
34bc2f0eb2de63 Gao Xiang 2025-03-10  145  		pos = erofs_pos(sb, erofs_iblks(inode) - tailpacking);
34bc2f0eb2de63 Gao Xiang 2025-03-10  146  
34bc2f0eb2de63 Gao Xiang 2025-03-10  147  		map->m_flags = EROFS_MAP_MAPPED;
34bc2f0eb2de63 Gao Xiang 2025-03-10  148  		if (map->m_la < pos) {
9f0f12ed9b7797 Gao Xiang 2025-03-10  149  			map->m_pa = erofs_pos(sb, vi->startblk) + map->m_la;
34bc2f0eb2de63 Gao Xiang 2025-03-10  150  			map->m_llen = pos - map->m_la;
34bc2f0eb2de63 Gao Xiang 2025-03-10  151  		} else {
34bc2f0eb2de63 Gao Xiang 2025-03-10  152  			map->m_pa = erofs_iloc(inode) + vi->inode_isize +
34bc2f0eb2de63 Gao Xiang 2025-03-10  153  				vi->xattr_isize + erofs_blkoff(sb, map->m_la);
34bc2f0eb2de63 Gao Xiang 2025-03-10  154  			map->m_llen = inode->i_size - map->m_la;
34bc2f0eb2de63 Gao Xiang 2025-03-10  155  			map->m_flags |= EROFS_MAP_META;
34bc2f0eb2de63 Gao Xiang 2025-03-10  156  		}
d5953c04b593dc Gao Xiang 2021-12-09  157  		goto out;
d5953c04b593dc Gao Xiang 2021-12-09  158  	}
c5305cc0a9c206 Gao Xiang 2021-08-20  159  
c5305cc0a9c206 Gao Xiang 2021-08-20  160  	if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
c5305cc0a9c206 Gao Xiang 2021-08-20  161  		unit = sizeof(*idx);			/* chunk index */
c5305cc0a9c206 Gao Xiang 2021-08-20  162  	else
c5305cc0a9c206 Gao Xiang 2021-08-20  163  		unit = EROFS_BLOCK_MAP_ENTRY_SIZE;	/* block map */
c5305cc0a9c206 Gao Xiang 2021-08-20  164  
c5305cc0a9c206 Gao Xiang 2021-08-20  165  	chunknr = map->m_la >> vi->chunkbits;
08200038bbdfed Gao Xiang 2023-04-03  166  	pos = ALIGN(erofs_iloc(inode) + vi->inode_isize +
c5305cc0a9c206 Gao Xiang 2021-08-20  167  		    vi->xattr_isize, unit) + unit * chunknr;
c5305cc0a9c206 Gao Xiang 2021-08-20  168  
168eb42949bd68 Jingbo Xu 2023-03-13  169  	kaddr = erofs_read_metabuf(&buf, sb, erofs_blknr(sb, pos), EROFS_KMAP);
5af84129f73c55 Gao Xiang 2022-01-02  170  	if (IS_ERR(kaddr)) {
5af84129f73c55 Gao Xiang 2022-01-02  171  		err = PTR_ERR(kaddr);
d5953c04b593dc Gao Xiang 2021-12-09  172  		goto out;
d5953c04b593dc Gao Xiang 2021-12-09  173  	}
c5305cc0a9c206 Gao Xiang 2021-08-20  174  
168eb42949bd68 Jingbo Xu 2023-03-13  175  	idx = kaddr + erofs_blkoff(sb, pos);
34bc2f0eb2de63 Gao Xiang 2025-03-10  176  	map->m_la = chunknr << vi->chunkbits;
34bc2f0eb2de63 Gao Xiang 2025-03-10  177  	map->m_llen = min_t(erofs_off_t, 1UL << vi->chunkbits,
34bc2f0eb2de63 Gao Xiang 2025-03-10  178  			    round_up(inode->i_size - map->m_la, blksz));
34bc2f0eb2de63 Gao Xiang 2025-03-10  179  	if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES) {
9f0f12ed9b7797 Gao Xiang 2025-03-10  180  		startblk = le32_to_cpu(idx->startblk_lo);
34bc2f0eb2de63 Gao Xiang 2025-03-10  181  		if (startblk != EROFS_NULL_ADDR) {
72920d6cd9da7f Gao Xiang 2021-10-14  182  			map->m_deviceid = le16_to_cpu(idx->device_id) &
72920d6cd9da7f Gao Xiang 2021-10-14  183  				EROFS_SB(sb)->device_id_mask;
34bc2f0eb2de63 Gao Xiang 2025-03-10  184  			map->m_pa = erofs_pos(sb, startblk);
34bc2f0eb2de63 Gao Xiang 2025-03-10  185  			map->m_flags = EROFS_MAP_MAPPED;
34bc2f0eb2de63 Gao Xiang 2025-03-10  186  		}
34bc2f0eb2de63 Gao Xiang 2025-03-10  187  	} else {
34bc2f0eb2de63 Gao Xiang 2025-03-10  188  		startblk = le32_to_cpu(*(__le32 *)idx);
34bc2f0eb2de63 Gao Xiang 2025-03-10  189  		if (startblk != EROFS_NULL_ADDR) {
34bc2f0eb2de63 Gao Xiang 2025-03-10  190  			map->m_pa = erofs_pos(sb, startblk);
c5305cc0a9c206 Gao Xiang 2021-08-20  191  			map->m_flags = EROFS_MAP_MAPPED;
c5305cc0a9c206 Gao Xiang 2021-08-20  192  		}
34bc2f0eb2de63 Gao Xiang 2025-03-10  193  	}
5af84129f73c55 Gao Xiang 2022-01-02  194  	erofs_put_metabuf(&buf);
c5305cc0a9c206 Gao Xiang 2021-08-20  195  out:
34bc2f0eb2de63 Gao Xiang 2025-03-10  196  	if (!err) {
34bc2f0eb2de63 Gao Xiang 2025-03-10  197  		map->m_plen = map->m_llen;
34bc2f0eb2de63 Gao Xiang 2025-03-10  198  		/* inline data should be located in the same meta block */
34bc2f0eb2de63 Gao Xiang 2025-03-10  199  		if ((map->m_flags & EROFS_MAP_META) &&
34bc2f0eb2de63 Gao Xiang 2025-03-10  200  		    erofs_blkoff(sb, map->m_pa) + map->m_plen > blksz) {
34bc2f0eb2de63 Gao Xiang 2025-03-10  201  			erofs_err(sb, "inline data across blocks @ nid %llu", vi->nid);
34bc2f0eb2de63 Gao Xiang 2025-03-10  202  			DBG_BUGON(1);
34bc2f0eb2de63 Gao Xiang 2025-03-10  203  			return -EFSCORRUPTED;
34bc2f0eb2de63 Gao Xiang 2025-03-10  204  		}
34bc2f0eb2de63 Gao Xiang 2025-03-10  205  	}
4590e91946874c Jingbo Xu 2023-02-09  206  	trace_erofs_map_blocks_exit(inode, map, 0, err);
c5305cc0a9c206 Gao Xiang 2021-08-20  207  	return err;
c5305cc0a9c206 Gao Xiang 2021-08-20  208  }
c5305cc0a9c206 Gao Xiang 2021-08-20  209  
72920d6cd9da7f Gao Xiang 2021-10-14  210  int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
72920d6cd9da7f Gao Xiang 2021-10-14  211  {
72920d6cd9da7f Gao Xiang 2021-10-14  212  	struct erofs_dev_context *devs = EROFS_SB(sb)->devs;
72920d6cd9da7f Gao Xiang 2021-10-14  213  	struct erofs_device_info *dif;
72920d6cd9da7f Gao Xiang 2021-10-14  214  	int id;
72920d6cd9da7f Gao Xiang 2021-10-14  215  
72920d6cd9da7f Gao Xiang 2021-10-14  216  	map->m_bdev = sb->s_bdev;
9ecb0b139c24c5 Gao Xiang 2021-08-05  217  	map->m_daxdev = EROFS_SB(sb)->dax_dev;
537e3a93595e98 Gao Xiang 2023-11-27  218  #ifdef CONFIG_EROFS_FS_RAFS_V6
20af86836304d0 Liu Bo    2023-06-14  219  	map->m_fp = EROFS_SB(sb)->bootstrap;
537e3a93595e98 Gao Xiang 2023-11-27  220  #endif
a0e45afbebb0e9 Gao Xiang 2022-06-13  221  	map->m_fscache = EROFS_SB(sb)->s_fscache;
72920d6cd9da7f Gao Xiang 2021-10-14  222  
72920d6cd9da7f Gao Xiang 2021-10-14  223  	if (map->m_deviceid) {
72920d6cd9da7f Gao Xiang 2021-10-14  224  		down_read(&devs->rwsem);
72920d6cd9da7f Gao Xiang 2021-10-14  225  		dif = idr_find(&devs->tree, map->m_deviceid - 1);
72920d6cd9da7f Gao Xiang 2021-10-14  226  		if (!dif) {
72920d6cd9da7f Gao Xiang 2021-10-14  227  			up_read(&devs->rwsem);
72920d6cd9da7f Gao Xiang 2021-10-14  228  			return -ENODEV;
72920d6cd9da7f Gao Xiang 2021-10-14  229  		}
d0a537dcdbea24 Jia Zhu   2023-03-02  230  		if (devs->flatdev) {
9f0f12ed9b7797 Gao Xiang 2025-03-10  231  			map->m_pa += erofs_pos(sb, dif->uniaddr);
d0a537dcdbea24 Jia Zhu   2023-03-02  232  			up_read(&devs->rwsem);
d0a537dcdbea24 Jia Zhu   2023-03-02  233  			return 0;
d0a537dcdbea24 Jia Zhu   2023-03-02  234  		}
72920d6cd9da7f Gao Xiang 2021-10-14  235  		map->m_bdev = dif->bdev;
9ecb0b139c24c5 Gao Xiang 2021-08-05  236  		map->m_daxdev = dif->dax_dev;
537e3a93595e98 Gao Xiang 2023-11-27  237  #ifdef CONFIG_EROFS_FS_RAFS_V6
95beeeb39d4f4d Liu Bo    2023-06-14  238  		map->m_fp = dif->blobfile;
537e3a93595e98 Gao Xiang 2023-11-27  239  #endif
a0e45afbebb0e9 Gao Xiang 2022-06-13  240  		map->m_fscache = dif->fscache;
72920d6cd9da7f Gao Xiang 2021-10-14  241  		up_read(&devs->rwsem);
d0a537dcdbea24 Jia Zhu   2023-03-02  242  	} else if (devs->extra_devices && !devs->flatdev) {
72920d6cd9da7f Gao Xiang 2021-10-14  243  		down_read(&devs->rwsem);
72920d6cd9da7f Gao Xiang 2021-10-14  244  		idr_for_each_entry(&devs->tree, dif, id) {
72920d6cd9da7f Gao Xiang 2021-10-14 @245  			erofs_off_t startoff, length;
72920d6cd9da7f Gao Xiang 2021-10-14  246  
9f0f12ed9b7797 Gao Xiang 2025-03-10  247  			if (!dif->uniaddr)
72920d6cd9da7f Gao Xiang 2021-10-14  248  				continue;
9f0f12ed9b7797 Gao Xiang 2025-03-10  249  			startoff = erofs_pos(sb, dif->uniaddr);
168eb42949bd68 Jingbo Xu 2023-03-13  250  			length = erofs_pos(sb, dif->blocks);
72920d6cd9da7f Gao Xiang 2021-10-14  251  
72920d6cd9da7f Gao Xiang 2021-10-14  252  			if (map->m_pa >= startoff &&
9f0f12ed9b7797 Gao Xiang 2025-03-10  253  			    map->m_pa < startoff + erofs_pos(sb, dif->blocks)) {
72920d6cd9da7f Gao Xiang 2021-10-14  254  				map->m_pa -= startoff;
72920d6cd9da7f Gao Xiang 2021-10-14  255  				map->m_bdev = dif->bdev;
9ecb0b139c24c5 Gao Xiang 2021-08-05  256  				map->m_daxdev = dif->dax_dev;
537e3a93595e98 Gao Xiang 2023-11-27  257  #ifdef CONFIG_EROFS_FS_RAFS_V6
95beeeb39d4f4d Liu Bo    2023-06-14  258  				map->m_fp = dif->blobfile;
537e3a93595e98 Gao Xiang 2023-11-27  259  #endif
a0e45afbebb0e9 Gao Xiang 2022-06-13  260  				map->m_fscache = dif->fscache;
72920d6cd9da7f Gao Xiang 2021-10-14  261  				break;
72920d6cd9da7f Gao Xiang 2021-10-14  262  			}
72920d6cd9da7f Gao Xiang 2021-10-14  263  		}
72920d6cd9da7f Gao Xiang 2021-10-14  264  		up_read(&devs->rwsem);
72920d6cd9da7f Gao Xiang 2021-10-14  265  	}
72920d6cd9da7f Gao Xiang 2021-10-14  266  	return 0;
72920d6cd9da7f Gao Xiang 2021-10-14  267  }
72920d6cd9da7f Gao Xiang 2021-10-14  268  

:::::: The code at line 245 was first introduced by commit
:::::: 72920d6cd9da7f1cdb45f1c21025a90b65a156ca erofs: add multiple device support

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Xunlei Pang <xlpang@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
