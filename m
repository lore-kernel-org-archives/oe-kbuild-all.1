Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DB212F98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 18:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624077; cv=none; b=DnxRku2iGuFhZmfQcCmW8p0LlZ8ETZ5FLxWSiOQg6PhE0TGLkMrpS6Y2AT8yxjDW2SzqYF4IcFg6wQdX+0SNh/YbEBnxK94V8Re8fqYUfqv+awfvS8fTDxxukuwOU629E4XfxoUD3/28o7An6rME18rpSS6SB6La4TO2QFCLq8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624077; c=relaxed/simple;
	bh=5zl4G6JaD6BY8PsLIpUfJ7O/IiqaMSb3HRxS8lFnPHA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gZlN8hLDlR+9i6WswJGWpnM/V326dbpJS6tK5eo6jt1MrUiMHxJpqpLeJdoQ9y5iarc+GNvzcVjdzGGfM8ykNhMMDookjKqpVOuBU7rMVe3xtlczVV/09llxtQOC+ET+AARdQikCs4Qx/2Zk980Wb9RdlI0vrd1uAwra7Q6YJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiPa2lgW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiPa2lgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769624075; x=1801160075;
  h=date:from:to:cc:subject:message-id;
  bh=5zl4G6JaD6BY8PsLIpUfJ7O/IiqaMSb3HRxS8lFnPHA=;
  b=ZiPa2lgW3JnDoXO80lpFkkHCZIV3wCBWUfdMBx+U8OYKQYI6Li+HIV0j
   Q68DiBd8EP4NSH+RwLrBAGcl7Pc4d+BOvw+CKHaMQGTmwuKL91MJTyTY7
   l05VNk5We8X91Ce8crZQ79QPSPeZtrJ/yH9v8AcXX1r1iGdZ0XqXMCQa6
   u/HqaDhXY24l+KrfVYcr0mWbAGgphc+ff+MIj/P8KZzIzqD9p5Lz2u0lu
   3uwm4jBM1jcUVLTf2FXCQTbOYnVyWI1Uau7ttAi9AJfbFCzGdliwN56Qa
   0mRPdOh4wNmHe/ySuPOYa3qK8TxBb8iorghlGaOGMFG88VS/Tn0Q2adZl
   A==;
X-CSE-ConnectionGUID: bl8g8RxhT52Mtozvzpkc8g==
X-CSE-MsgGUID: BYc2fOx/R1+HaG8ULpmDaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70937359"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70937359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 10:14:35 -0800
X-CSE-ConnectionGUID: XHGAEYBdQga/nudaGt9t3w==
X-CSE-MsgGUID: QDWYxLw5TRK41QOba3Td4Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2026 10:14:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlA3i-00000000ag0-3Bt9;
	Wed, 28 Jan 2026 18:14:30 +0000
Date: Thu, 29 Jan 2026 02:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 27/27] fs/erofs/inode.c:182:24: error:
 'struct erofs_sb_info' has no member named 'available_compr_algs'
Message-ID: <202601290220.4nKd6hHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   713acdda5f818fb4f2286238a4f9f1f5f519b9da
commit: 713acdda5f818fb4f2286238a4f9f1f5f519b9da [27/27] erofs: separate plain and compressed filesystems formally
config: sparc64-randconfig-001-20260128 (https://download.01.org/0day-ci/archive/20260129/202601290220.4nKd6hHT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290220.4nKd6hHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290220.4nKd6hHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/div64.h:27,
                    from ./arch/sparc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/erofs/internal.h:10,
                    from fs/erofs/xattr.h:9,
                    from fs/erofs/inode.c:7:
   fs/erofs/inode.c: In function 'erofs_read_inode':
>> fs/erofs/inode.c:182:24: error: 'struct erofs_sb_info' has no member named 'available_compr_algs'
     182 |         } else if (!sbi->available_compr_algs) {
         |                        ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/erofs/inode.c:182:16: note: in expansion of macro 'if'
     182 |         } else if (!sbi->available_compr_algs) {
         |                ^~
>> fs/erofs/inode.c:182:24: error: 'struct erofs_sb_info' has no member named 'available_compr_algs'
     182 |         } else if (!sbi->available_compr_algs) {
         |                        ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/erofs/inode.c:182:16: note: in expansion of macro 'if'
     182 |         } else if (!sbi->available_compr_algs) {
         |                ^~
>> fs/erofs/inode.c:182:24: error: 'struct erofs_sb_info' has no member named 'available_compr_algs'
     182 |         } else if (!sbi->available_compr_algs) {
         |                        ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/erofs/inode.c:182:16: note: in expansion of macro 'if'
     182 |         } else if (!sbi->available_compr_algs) {
         |                ^~


vim +182 fs/erofs/inode.c

    29	
    30	static int erofs_read_inode(struct inode *inode)
    31	{
    32		struct super_block *sb = inode->i_sb;
    33		erofs_blk_t blkaddr = erofs_blknr(sb, erofs_iloc(inode));
    34		unsigned int ofs = erofs_blkoff(sb, erofs_iloc(inode));
    35		bool in_mbox = erofs_inode_in_metabox(inode);
    36		struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
    37		struct erofs_sb_info *sbi = EROFS_SB(sb);
    38		erofs_blk_t addrmask = BIT_ULL(48) - 1;
    39		struct erofs_inode *vi = EROFS_I(inode);
    40		struct erofs_inode_extended *die, copied;
    41		struct erofs_inode_compact *dic;
    42		unsigned int ifmt;
    43		void *ptr;
    44		int err = 0;
    45	
    46		ptr = erofs_read_metabuf(&buf, sb, erofs_pos(sb, blkaddr), in_mbox);
    47		if (IS_ERR(ptr)) {
    48			err = PTR_ERR(ptr);
    49			erofs_err(sb, "failed to read inode meta block (nid: %llu): %d",
    50				  vi->nid, err);
    51			goto err_out;
    52		}
    53	
    54		dic = ptr + ofs;
    55		ifmt = le16_to_cpu(dic->i_format);
    56		if (ifmt & ~EROFS_I_ALL) {
    57			erofs_err(sb, "unsupported i_format %u of nid %llu",
    58				  ifmt, vi->nid);
    59			err = -EOPNOTSUPP;
    60			goto err_out;
    61		}
    62	
    63		vi->datalayout = erofs_inode_datalayout(ifmt);
    64		if (vi->datalayout >= EROFS_INODE_DATALAYOUT_MAX) {
    65			erofs_err(sb, "unsupported datalayout %u of nid %llu",
    66				  vi->datalayout, vi->nid);
    67			err = -EOPNOTSUPP;
    68			goto err_out;
    69		}
    70	
    71		switch (erofs_inode_version(ifmt)) {
    72		case EROFS_INODE_LAYOUT_EXTENDED:
    73			vi->inode_isize = sizeof(struct erofs_inode_extended);
    74			/* check if the extended inode acrosses block boundary */
    75			if (ofs + vi->inode_isize <= sb->s_blocksize) {
    76				ofs += vi->inode_isize;
    77				die = (struct erofs_inode_extended *)dic;
    78				copied.i_u = die->i_u;
    79				copied.i_nb = die->i_nb;
    80			} else {
    81				const unsigned int gotten = sb->s_blocksize - ofs;
    82	
    83				memcpy(&copied, dic, gotten);
    84				ptr = erofs_read_metabuf(&buf, sb,
    85						erofs_pos(sb, blkaddr + 1), in_mbox);
    86				if (IS_ERR(ptr)) {
    87					err = PTR_ERR(ptr);
    88					erofs_err(sb, "failed to read inode payload block (nid: %llu): %d",
    89						  vi->nid, err);
    90					goto err_out;
    91				}
    92				ofs = vi->inode_isize - gotten;
    93				memcpy((u8 *)&copied + gotten, ptr, ofs);
    94				die = &copied;
    95			}
    96			vi->xattr_isize = erofs_xattr_ibody_size(die->i_xattr_icount);
    97	
    98			inode->i_mode = le16_to_cpu(die->i_mode);
    99			i_uid_write(inode, le32_to_cpu(die->i_uid));
   100			i_gid_write(inode, le32_to_cpu(die->i_gid));
   101			set_nlink(inode, le32_to_cpu(die->i_nlink));
   102			inode_set_mtime(inode, le64_to_cpu(die->i_mtime),
   103					le32_to_cpu(die->i_mtime_nsec));
   104	
   105			inode->i_size = le64_to_cpu(die->i_size);
   106			break;
   107		case EROFS_INODE_LAYOUT_COMPACT:
   108			vi->inode_isize = sizeof(struct erofs_inode_compact);
   109			ofs += vi->inode_isize;
   110			vi->xattr_isize = erofs_xattr_ibody_size(dic->i_xattr_icount);
   111	
   112			inode->i_mode = le16_to_cpu(dic->i_mode);
   113			copied.i_u = dic->i_u;
   114			i_uid_write(inode, le16_to_cpu(dic->i_uid));
   115			i_gid_write(inode, le16_to_cpu(dic->i_gid));
   116			if (!S_ISDIR(inode->i_mode) &&
   117			    ((ifmt >> EROFS_I_NLINK_1_BIT) & 1)) {
   118				set_nlink(inode, 1);
   119				copied.i_nb = dic->i_nb;
   120			} else {
   121				set_nlink(inode, le16_to_cpu(dic->i_nb.nlink));
   122				copied.i_nb.startblk_hi = 0;
   123				addrmask = BIT_ULL(32) - 1;
   124			}
   125			inode_set_mtime(inode, sbi->epoch + le32_to_cpu(dic->i_mtime),
   126					sbi->fixed_nsec);
   127	
   128			inode->i_size = le32_to_cpu(dic->i_size);
   129			break;
   130		default:
   131			erofs_err(sb, "unsupported on-disk inode version %u of nid %llu",
   132				  erofs_inode_version(ifmt), vi->nid);
   133			err = -EOPNOTSUPP;
   134			goto err_out;
   135		}
   136	
   137		if (unlikely(inode->i_size < 0)) {
   138			erofs_err(sb, "negative i_size @ nid %llu", vi->nid);
   139			err = -EFSCORRUPTED;
   140			goto err_out;
   141		}
   142	
   143		if (IS_ENABLED(CONFIG_EROFS_FS_POSIX_ACL) &&
   144		    erofs_inode_has_noacl(inode, ptr, ofs))
   145			cache_no_acl(inode);
   146	
   147		switch (inode->i_mode & S_IFMT) {
   148		case S_IFDIR:
   149			vi->dot_omitted = (ifmt >> EROFS_I_DOT_OMITTED_BIT) & 1;
   150			fallthrough;
   151		case S_IFREG:
   152		case S_IFLNK:
   153			vi->startblk = le32_to_cpu(copied.i_u.startblk_lo) |
   154				((u64)le16_to_cpu(copied.i_nb.startblk_hi) << 32);
   155			if (vi->datalayout == EROFS_INODE_FLAT_PLAIN &&
   156			    !((vi->startblk ^ EROFS_NULL_ADDR) & addrmask))
   157				vi->startblk = EROFS_NULL_ADDR;
   158	
   159			if(S_ISLNK(inode->i_mode)) {
   160				err = erofs_fill_symlink(inode, ptr, ofs);
   161				if (err)
   162					goto err_out;
   163			}
   164			break;
   165		case S_IFCHR:
   166		case S_IFBLK:
   167			inode->i_rdev = new_decode_dev(le32_to_cpu(copied.i_u.rdev));
   168			break;
   169		case S_IFIFO:
   170		case S_IFSOCK:
   171			inode->i_rdev = 0;
   172			break;
   173		default:
   174			erofs_err(sb, "bogus i_mode (%o) @ nid %llu", inode->i_mode,
   175				  vi->nid);
   176			err = -EFSCORRUPTED;
   177			goto err_out;
   178		}
   179	
   180		if (!erofs_inode_is_data_compressed(vi->datalayout)) {
   181			inode->i_blocks = round_up(inode->i_size, sb->s_blocksize) >> 9;
 > 182		} else if (!sbi->available_compr_algs) {
   183			erofs_err(sb, "compressed inode (nid %llu) is invalid in a plain filesystem",
   184				  vi->nid);
   185			err = -EFSCORRUPTED;
   186			goto err_out;
   187		} else {
   188			inode->i_blocks = le32_to_cpu(copied.i_u.blocks_lo) <<
   189					(sb->s_blocksize_bits - 9);
   190		}
   191	
   192		if (vi->datalayout == EROFS_INODE_CHUNK_BASED) {
   193			/* fill chunked inode summary info */
   194			vi->chunkformat = le16_to_cpu(copied.i_u.c.format);
   195			if (vi->chunkformat & ~EROFS_CHUNK_FORMAT_ALL) {
   196				erofs_err(sb, "unsupported chunk format %x of nid %llu",
   197					  vi->chunkformat, vi->nid);
   198				err = -EOPNOTSUPP;
   199				goto err_out;
   200			}
   201			vi->chunkbits = sb->s_blocksize_bits +
   202				(vi->chunkformat & EROFS_CHUNK_FORMAT_BLKBITS_MASK);
   203		}
   204		inode_set_atime_to_ts(inode,
   205				      inode_set_ctime_to_ts(inode, inode_get_mtime(inode)));
   206	
   207		inode->i_flags &= ~S_DAX;
   208		if (test_opt(&sbi->opt, DAX_ALWAYS) && S_ISREG(inode->i_mode) &&
   209		    (vi->datalayout == EROFS_INODE_FLAT_PLAIN ||
   210		     vi->datalayout == EROFS_INODE_CHUNK_BASED))
   211			inode->i_flags |= S_DAX;
   212	err_out:
   213		erofs_put_metabuf(&buf);
   214		return err;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
