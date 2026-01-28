Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA842DECBD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621453; cv=none; b=P6ETkNxjQ7YwWHkHt+1YLwZE8Kem56kWlr42nC2wQ/CHHtr2VDdcc8q+BUq44n7ExkZikXtN2thYo0yx6Op8kdKSXXaUSp5YFfZxaRYKClKSfOZ0LbryWd9MUE7FdM1yMSZsAH2enL8xXvwSd6gbOyQ6o8S7OLYO7R4JtWbv6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621453; c=relaxed/simple;
	bh=QrQs3cB7Wg8kx08OqCgwgAz9od+EJZuP/P9WmGznWtM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HiPKAI67g+CXCse1qnlcigYgb4QZ+DqHpcksHDFiPHF56IfCboMU8nSD9qrJFvoVw17/shCFe/yhAjW1WxLb/GxAE15YmLNSWDqAvvjIN0JqtNPwQYkM3xVJRPTObM7/EL595A7OhykceTcj8ALEwO8TxlVJuPOixCPCkw8A3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjvseSuL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjvseSuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769621450; x=1801157450;
  h=date:from:to:cc:subject:message-id;
  bh=QrQs3cB7Wg8kx08OqCgwgAz9od+EJZuP/P9WmGznWtM=;
  b=MjvseSuLXU+S55YewPlJbb/2aAP6RkgEILjv3NIKHTUBh2sOvHAo+S3U
   n4Uv+42xNVW+4YKFxirPcOgJcrL5XdchAgAptLtiZwQoDRIW+MTqL0ZYn
   VnP1lHnnWrbuUw0jS+Xdq+H6ISZpfJGMAVqOBH/dJ4US+KYZCkBrtpIX5
   iYQNdgWrxsaOP6tEfPDUwPqCCzvH6BnnV4qGirJOTFk6BwVpMOCXpMMH8
   UG3YZjRgiqCLTo10hvp0kzAxgaJ6Yp9fExRcMIHrhQNdD3/Dk6+Tjqz3W
   dljCWdUgwXatvo5qOPq/JVSOvqrC6ai7pU6mlm2/Yjny9MI+SnM23vcPf
   w==;
X-CSE-ConnectionGUID: wD3oTE36TFOBy2ego0pL2w==
X-CSE-MsgGUID: /LpbFDFoT1GP6Jpbwc6nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81476352"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81476352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:30:50 -0800
X-CSE-ConnectionGUID: DGALJgXcRTeCDRQuy2vwdg==
X-CSE-MsgGUID: Uu7S0wd1RF+QDk4OZFdvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208123983"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 09:30:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl9NN-0000000025V-2PFq;
	Wed, 28 Jan 2026 17:30:45 +0000
Date: Wed, 28 Jan 2026 18:30:10 +0100
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: fs/erofs/inode.c:175:24: error: 'struct erofs_sb_info' has
 no member named 'available_compr_algs'
Message-ID: <202601281839.VDzUsP1Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-separate-plain-and-compressed-filesystems-formally/20260128-194653
head:   b2757ae7b3de5804273782ca74ce2f0d4fdc39fb
commit: b2757ae7b3de5804273782ca74ce2f0d4fdc39fb erofs: separate plain and compressed filesystems formally
date:   6 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260128/202601281839.VDzUsP1Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281839.VDzUsP1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281839.VDzUsP1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/inode.c: In function 'erofs_read_inode':
>> fs/erofs/inode.c:175:24: error: 'struct erofs_sb_info' has no member named 'available_compr_algs'
     175 |         } else if (!sbi->available_compr_algs) {
         |                        ^~


vim +175 fs/erofs/inode.c

    27	
    28	static int erofs_read_inode(struct inode *inode)
    29	{
    30		struct super_block *sb = inode->i_sb;
    31		erofs_blk_t blkaddr = erofs_blknr(sb, erofs_iloc(inode));
    32		unsigned int ofs = erofs_blkoff(sb, erofs_iloc(inode));
    33		bool in_mbox = erofs_inode_in_metabox(inode);
    34		struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
    35		struct erofs_sb_info *sbi = EROFS_SB(sb);
    36		erofs_blk_t addrmask = BIT_ULL(48) - 1;
    37		struct erofs_inode *vi = EROFS_I(inode);
    38		struct erofs_inode_extended *die, copied;
    39		struct erofs_inode_compact *dic;
    40		unsigned int ifmt;
    41		void *ptr;
    42		int err = 0;
    43	
    44		ptr = erofs_read_metabuf(&buf, sb, erofs_pos(sb, blkaddr), in_mbox);
    45		if (IS_ERR(ptr)) {
    46			err = PTR_ERR(ptr);
    47			erofs_err(sb, "failed to read inode meta block (nid: %llu): %d",
    48				  vi->nid, err);
    49			goto err_out;
    50		}
    51	
    52		dic = ptr + ofs;
    53		ifmt = le16_to_cpu(dic->i_format);
    54		if (ifmt & ~EROFS_I_ALL) {
    55			erofs_err(sb, "unsupported i_format %u of nid %llu",
    56				  ifmt, vi->nid);
    57			err = -EOPNOTSUPP;
    58			goto err_out;
    59		}
    60	
    61		vi->datalayout = erofs_inode_datalayout(ifmt);
    62		if (vi->datalayout >= EROFS_INODE_DATALAYOUT_MAX) {
    63			erofs_err(sb, "unsupported datalayout %u of nid %llu",
    64				  vi->datalayout, vi->nid);
    65			err = -EOPNOTSUPP;
    66			goto err_out;
    67		}
    68	
    69		switch (erofs_inode_version(ifmt)) {
    70		case EROFS_INODE_LAYOUT_EXTENDED:
    71			vi->inode_isize = sizeof(struct erofs_inode_extended);
    72			/* check if the extended inode acrosses block boundary */
    73			if (ofs + vi->inode_isize <= sb->s_blocksize) {
    74				ofs += vi->inode_isize;
    75				die = (struct erofs_inode_extended *)dic;
    76				copied.i_u = die->i_u;
    77				copied.i_nb = die->i_nb;
    78			} else {
    79				const unsigned int gotten = sb->s_blocksize - ofs;
    80	
    81				memcpy(&copied, dic, gotten);
    82				ptr = erofs_read_metabuf(&buf, sb,
    83						erofs_pos(sb, blkaddr + 1), in_mbox);
    84				if (IS_ERR(ptr)) {
    85					err = PTR_ERR(ptr);
    86					erofs_err(sb, "failed to read inode payload block (nid: %llu): %d",
    87						  vi->nid, err);
    88					goto err_out;
    89				}
    90				ofs = vi->inode_isize - gotten;
    91				memcpy((u8 *)&copied + gotten, ptr, ofs);
    92				die = &copied;
    93			}
    94			vi->xattr_isize = erofs_xattr_ibody_size(die->i_xattr_icount);
    95	
    96			inode->i_mode = le16_to_cpu(die->i_mode);
    97			i_uid_write(inode, le32_to_cpu(die->i_uid));
    98			i_gid_write(inode, le32_to_cpu(die->i_gid));
    99			set_nlink(inode, le32_to_cpu(die->i_nlink));
   100			inode_set_mtime(inode, le64_to_cpu(die->i_mtime),
   101					le32_to_cpu(die->i_mtime_nsec));
   102	
   103			inode->i_size = le64_to_cpu(die->i_size);
   104			break;
   105		case EROFS_INODE_LAYOUT_COMPACT:
   106			vi->inode_isize = sizeof(struct erofs_inode_compact);
   107			ofs += vi->inode_isize;
   108			vi->xattr_isize = erofs_xattr_ibody_size(dic->i_xattr_icount);
   109	
   110			inode->i_mode = le16_to_cpu(dic->i_mode);
   111			copied.i_u = dic->i_u;
   112			i_uid_write(inode, le16_to_cpu(dic->i_uid));
   113			i_gid_write(inode, le16_to_cpu(dic->i_gid));
   114			if (!S_ISDIR(inode->i_mode) &&
   115			    ((ifmt >> EROFS_I_NLINK_1_BIT) & 1)) {
   116				set_nlink(inode, 1);
   117				copied.i_nb = dic->i_nb;
   118			} else {
   119				set_nlink(inode, le16_to_cpu(dic->i_nb.nlink));
   120				copied.i_nb.startblk_hi = 0;
   121				addrmask = BIT_ULL(32) - 1;
   122			}
   123			inode_set_mtime(inode, sbi->epoch + le32_to_cpu(dic->i_mtime),
   124					sbi->fixed_nsec);
   125	
   126			inode->i_size = le32_to_cpu(dic->i_size);
   127			break;
   128		default:
   129			erofs_err(sb, "unsupported on-disk inode version %u of nid %llu",
   130				  erofs_inode_version(ifmt), vi->nid);
   131			err = -EOPNOTSUPP;
   132			goto err_out;
   133		}
   134	
   135		if (unlikely(inode->i_size < 0)) {
   136			erofs_err(sb, "negative i_size @ nid %llu", vi->nid);
   137			err = -EFSCORRUPTED;
   138			goto err_out;
   139		}
   140		switch (inode->i_mode & S_IFMT) {
   141		case S_IFDIR:
   142			vi->dot_omitted = (ifmt >> EROFS_I_DOT_OMITTED_BIT) & 1;
   143			fallthrough;
   144		case S_IFREG:
   145		case S_IFLNK:
   146			vi->startblk = le32_to_cpu(copied.i_u.startblk_lo) |
   147				((u64)le16_to_cpu(copied.i_nb.startblk_hi) << 32);
   148			if (vi->datalayout == EROFS_INODE_FLAT_PLAIN &&
   149			    !((vi->startblk ^ EROFS_NULL_ADDR) & addrmask))
   150				vi->startblk = EROFS_NULL_ADDR;
   151	
   152			if(S_ISLNK(inode->i_mode)) {
   153				err = erofs_fill_symlink(inode, ptr, ofs);
   154				if (err)
   155					goto err_out;
   156			}
   157			break;
   158		case S_IFCHR:
   159		case S_IFBLK:
   160			inode->i_rdev = new_decode_dev(le32_to_cpu(copied.i_u.rdev));
   161			break;
   162		case S_IFIFO:
   163		case S_IFSOCK:
   164			inode->i_rdev = 0;
   165			break;
   166		default:
   167			erofs_err(sb, "bogus i_mode (%o) @ nid %llu", inode->i_mode,
   168				  vi->nid);
   169			err = -EFSCORRUPTED;
   170			goto err_out;
   171		}
   172	
   173		if (!erofs_inode_is_data_compressed(vi->datalayout)) {
   174			inode->i_blocks = round_up(inode->i_size, sb->s_blocksize) >> 9;
 > 175		} else if (!sbi->available_compr_algs) {
   176			erofs_err(sb, "compressed inode (nid %llu) is invalid in a plain filesystem",
   177				  vi->nid);
   178			err = -EFSCORRUPTED;
   179			goto err_out;
   180		} else {
   181			inode->i_blocks = le32_to_cpu(copied.i_u.blocks_lo) <<
   182					(sb->s_blocksize_bits - 9);
   183		}
   184	
   185		if (vi->datalayout == EROFS_INODE_CHUNK_BASED) {
   186			/* fill chunked inode summary info */
   187			vi->chunkformat = le16_to_cpu(copied.i_u.c.format);
   188			if (vi->chunkformat & ~EROFS_CHUNK_FORMAT_ALL) {
   189				erofs_err(sb, "unsupported chunk format %x of nid %llu",
   190					  vi->chunkformat, vi->nid);
   191				err = -EOPNOTSUPP;
   192				goto err_out;
   193			}
   194			vi->chunkbits = sb->s_blocksize_bits +
   195				(vi->chunkformat & EROFS_CHUNK_FORMAT_BLKBITS_MASK);
   196		}
   197		inode_set_atime_to_ts(inode,
   198				      inode_set_ctime_to_ts(inode, inode_get_mtime(inode)));
   199	
   200		inode->i_flags &= ~S_DAX;
   201		if (test_opt(&sbi->opt, DAX_ALWAYS) && S_ISREG(inode->i_mode) &&
   202		    (vi->datalayout == EROFS_INODE_FLAT_PLAIN ||
   203		     vi->datalayout == EROFS_INODE_CHUNK_BASED))
   204			inode->i_flags |= S_DAX;
   205	err_out:
   206		erofs_put_metabuf(&buf);
   207		return err;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
