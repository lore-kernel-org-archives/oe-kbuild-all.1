Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C6621D3F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747591618; cv=none; b=YDOJ6ZKcMxTZyHc+AGgOyLAgHUPHAMHYBQNxBmQb4iVnZbItjO9NCnhzhcpEBwKXMBZtCfXJ3F+oaWj+I4UAd9AaCHBUrqP8LZS2GF4x3u5vXNnwL8y4JwdYPuqQOF+MWtQIudCynyfAfI66IhREfXsFmvyOYGxRT+C1DKnWmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747591618; c=relaxed/simple;
	bh=ttGQYBloj0CoC1/5y7KQia+rkjJ2ddx/y9RCzSACYjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+MU3C6jAN3MGfzhhg2oUnqXLfgKB4t4Qm71MipZwc1dX4TEKNyPLNCsuZcFCIp0xMXGY8ZCMlHN+kIMaUuH3YCMjyZ9zda64JqkImPXaHHNQsPtIqGoX12naqCddy/H48y3r/hziqFBooLiXOSaKN5oh9tLjl+rRQ3eHndo8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb3CFJM2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb3CFJM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747591617; x=1779127617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ttGQYBloj0CoC1/5y7KQia+rkjJ2ddx/y9RCzSACYjw=;
  b=Yb3CFJM2Yb0RfnRG0r8ORumxtb8hUfX9uHxzdbQ0o5oZISt2VJquemIV
   ZluOJ0HaoQ7Fu4roXvb1jWOFmvRxGbizSaH2tN7hAvE+RpAn2NSsJrCaL
   ScpJtojMjnBrOsRUs+g7JYs9a3mUxbxXlz/rfHTbyNULo3ih2Yl5sX9MT
   EFKUAUq426mPgE9EOLGRsYphkp9J9wp5neF9LBi9GVGmFWBfDsxCF2NlX
   dC3gmpLiE7ZSDnoX1wJoOXwT4trBemg9JuN65SefRJwTtvrWhBioYcEal
   T+xNhs7MslLsCxWAySji/H4X1+nYTw4pzy3CYGJYdqUs5EFBs4mnKM9mY
   Q==;
X-CSE-ConnectionGUID: TmBnTbd0TwaaQAJydvDZsw==
X-CSE-MsgGUID: fXB5QuUyQXaxOhjOYFL9lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53313032"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="53313032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 11:06:56 -0700
X-CSE-ConnectionGUID: KtMrLVZtQ7OEBDsyosuChQ==
X-CSE-MsgGUID: gJV9Pz4JQSG6ZcMEwg3VKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139217654"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2025 11:06:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGiPT-000Ky5-2v;
	Sun, 18 May 2025 18:06:51 +0000
Date: Mon, 19 May 2025 02:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sheng Yong <shengyong1@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>,
	linux-erofs@lists.ozlabs.org, Wang Shuai <wangshuai12@xiaomi.com>
Subject: [xiang-erofs:dev-test 5/5] fs/erofs/super.c:659:22: error: no member
 named 'off' in 'struct erofs_device_info'
Message-ID: <202505190150.4HUHevyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   7cd18799175c533c3f9b1c2b2cb6551e2a86c921
commit: 7cd18799175c533c3f9b1c2b2cb6551e2a86c921 [5/5] erofs: add 'fsoffset' mount option to specify filesystem offset
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505190150.4HUHevyn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/super.c:659:22: error: no member named 'off' in 'struct erofs_device_info'
     659 |                                        sbi->dif0.off, 1 << sbi->blkszbits);
         |                                        ~~~~~~~~~ ^
   include/linux/fs_context.h:239:52: note: expanded from macro 'invalfc'
     239 | #define invalfc(fc, fmt, ...) (errorfc(fc, fmt, ## __VA_ARGS__), -EINVAL)
         |                                                    ^~~~~~~~~~~
   include/linux/fs_context.h:227:65: note: expanded from macro 'errorfc'
     227 | #define errorfc(fc, fmt, ...) __plog((&(fc)->log), 'e', fmt, ## __VA_ARGS__)
         |                                                                 ^~~~~~~~~~~
   include/linux/fs_context.h:192:17: note: expanded from macro '__plog'
     192 |                                         l, fmt, ## __VA_ARGS__)
         |                                                    ^~~~~~~~~~~
   1 error generated.


vim +659 fs/erofs/super.c

   602	
   603	static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
   604	{
   605		struct inode *inode;
   606		struct erofs_sb_info *sbi = EROFS_SB(sb);
   607		int err;
   608	
   609		sb->s_magic = EROFS_SUPER_MAGIC;
   610		sb->s_flags |= SB_RDONLY | SB_NOATIME;
   611		sb->s_maxbytes = MAX_LFS_FILESIZE;
   612		sb->s_op = &erofs_sops;
   613	
   614		sbi->blkszbits = PAGE_SHIFT;
   615		if (!sb->s_bdev) {
   616			sb->s_blocksize = PAGE_SIZE;
   617			sb->s_blocksize_bits = PAGE_SHIFT;
   618	
   619			if (erofs_is_fscache_mode(sb)) {
   620				err = erofs_fscache_register_fs(sb);
   621				if (err)
   622					return err;
   623			}
   624			err = super_setup_bdi(sb);
   625			if (err)
   626				return err;
   627		} else {
   628			if (!sb_set_blocksize(sb, PAGE_SIZE)) {
   629				errorfc(fc, "failed to set initial blksize");
   630				return -EINVAL;
   631			}
   632	
   633			sbi->dif0.dax_dev = fs_dax_get_by_bdev(sb->s_bdev,
   634					&sbi->dif0.dax_part_off, NULL, NULL);
   635		}
   636	
   637		err = erofs_read_superblock(sb);
   638		if (err)
   639			return err;
   640	
   641		if (sb->s_blocksize_bits != sbi->blkszbits) {
   642			if (erofs_is_fscache_mode(sb)) {
   643				errorfc(fc, "unsupported blksize for fscache mode");
   644				return -EINVAL;
   645			}
   646	
   647			if (erofs_is_fileio_mode(sbi)) {
   648				sb->s_blocksize = 1 << sbi->blkszbits;
   649				sb->s_blocksize_bits = sbi->blkszbits;
   650			} else if (!sb_set_blocksize(sb, 1 << sbi->blkszbits)) {
   651				errorfc(fc, "failed to set erofs blksize");
   652				return -EINVAL;
   653			}
   654		}
   655	
   656		if (sbi->dif0.fsoff) {
   657			if (sbi->dif0.fsoff & (sb->s_blocksize - 1))
   658				return invalfc(fc, "fsoffset %llu is not aligned to block size %u",
 > 659					       sbi->dif0.off, 1 << sbi->blkszbits);
   660			if (erofs_is_fscache_mode(sb))
   661				return invalfc(fc, "cannot use fsoffset in fscache mode");
   662		}
   663	
   664		if (test_opt(&sbi->opt, DAX_ALWAYS)) {
   665			if (!sbi->dif0.dax_dev) {
   666				errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
   667				clear_opt(&sbi->opt, DAX_ALWAYS);
   668			} else if (sbi->blkszbits != PAGE_SHIFT) {
   669				errorfc(fc, "unsupported blocksize for DAX");
   670				clear_opt(&sbi->opt, DAX_ALWAYS);
   671			}
   672		}
   673	
   674		sb->s_time_gran = 1;
   675		sb->s_xattr = erofs_xattr_handlers;
   676		sb->s_export_op = &erofs_export_ops;
   677	
   678		if (test_opt(&sbi->opt, POSIX_ACL))
   679			sb->s_flags |= SB_POSIXACL;
   680		else
   681			sb->s_flags &= ~SB_POSIXACL;
   682	
   683		err = z_erofs_init_super(sb);
   684		if (err)
   685			return err;
   686	
   687		if (erofs_sb_has_fragments(sbi) && sbi->packed_nid) {
   688			inode = erofs_iget(sb, sbi->packed_nid);
   689			if (IS_ERR(inode))
   690				return PTR_ERR(inode);
   691			sbi->packed_inode = inode;
   692		}
   693	
   694		inode = erofs_iget(sb, sbi->root_nid);
   695		if (IS_ERR(inode))
   696			return PTR_ERR(inode);
   697	
   698		if (!S_ISDIR(inode->i_mode)) {
   699			erofs_err(sb, "rootino(nid %llu) is not a directory(i_mode %o)",
   700				  sbi->root_nid, inode->i_mode);
   701			iput(inode);
   702			return -EINVAL;
   703		}
   704		sb->s_root = d_make_root(inode);
   705		if (!sb->s_root)
   706			return -ENOMEM;
   707	
   708		erofs_shrinker_register(sb);
   709		err = erofs_xattr_prefixes_init(sb);
   710		if (err)
   711			return err;
   712	
   713		erofs_set_sysfs_name(sb);
   714		err = erofs_register_sysfs(sb);
   715		if (err)
   716			return err;
   717	
   718		erofs_info(sb, "mounted with root inode @ nid %llu.", sbi->root_nid);
   719		return 0;
   720	}
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
