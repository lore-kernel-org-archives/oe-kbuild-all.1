Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9B71BCA15
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766785; cv=none; b=sLJp6NTv4hnfJlNPk0b7Lz1JXh4Y5Ym6ZjVwPj2QT6Q/5NXu1OnFYTVbI3QAT0XLkUIZKY3ofehgJ8tQEJ3JWYvFhU22I2DZrFjcnLhS7DzYUQTwKtiWX1rpE1BIjewzM5LSXqygoQMtT+n7XfaEwvvapP9ZxdQPY8puKtizGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766785; c=relaxed/simple;
	bh=wDo7wN3k44fKSywPcvpBuZmY7pJsNHq1DRojUzuzyqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h00vtXLmFlOxHNt+x+wuGnLaF0W4pGL80nsXpj3xiUI63BO9+Qo8v1QU9HjB4ROA8F8E79IQE8PD6brbXBPCJbnC4rEMJqgXUlezPPHZ7oMDdjyIK3hSl9IwQOftXUClYNW446ZU0lukaweJoXGWuDfpdXA6pfFDb2lfuPy8Vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvPbThDp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvPbThDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766784; x=1759302784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDo7wN3k44fKSywPcvpBuZmY7pJsNHq1DRojUzuzyqg=;
  b=EvPbThDpjZew+kosJ6/npLm7rHSP1xyC9O4OHzVf9OflO9okwFAES54J
   i/cUMz/zjySpHRvvWPgDqHwPEQ1IFYnSrkIvY/Q6QOqLW1kxnZqlhKbbP
   C3gonm3MQ6L9q1/IqxgBNQDHzx9H7Saxfveaph3fNNdcWzZ109u6Z5xvq
   f1CFLy6ZNeLZbPcVooHor8goKrhQBaR1T+Tf0SRiYh2l+MP8dmIgsFMDw
   YEVlzAsolnZ8znp4zd5oLKdQuw+IRggDzaklchY5mB053pWdgaTLERx5x
   77uWYGhYBLB7KWxh0BJ72bEFHAvttTUNgUkS/dfhy+hVDGT1cUrwnlVL7
   Q==;
X-CSE-ConnectionGUID: ijJPRU7wSTOuX91QeGh2kA==
X-CSE-MsgGUID: lIimGMQnSCSeakeAKtH05g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30584189"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30584189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:13:01 -0700
X-CSE-ConnectionGUID: dd3ou3UZTiiv36tisUZrBw==
X-CSE-MsgGUID: ctE8uTpFRO6Pb1tXFhWMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78532286"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2024 00:13:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svX45-000QMu-1A;
	Tue, 01 Oct 2024 07:12:57 +0000
Date: Tue, 1 Oct 2024 15:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1015/1347] fs/jfs/super.c:392 jfs_reconfigure()
 warn: inconsistent indenting
Message-ID: <202410011512.W2ftUq9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 384011cabd9778cccac6c834e6164b4cb3b6f8f3 [1015/1347] jfs: convert jfs to use the new mount api
config: x86_64-randconfig-161-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011512.W2ftUq9U-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011512.W2ftUq9U-lkp@intel.com/

smatch warnings:
fs/jfs/super.c:392 jfs_reconfigure() warn: inconsistent indenting

vim +392 fs/jfs/super.c

   360	
   361	static int jfs_reconfigure(struct fs_context *fc)
   362	{
   363		struct jfs_context *ctx = fc->fs_private;
   364		struct super_block *sb = fc->root->d_sb;
   365		int readonly = fc->sb_flags & SB_RDONLY;
   366		int rc = 0;
   367		int flag = ctx->flag;
   368		int ret;
   369	
   370		sync_filesystem(sb);
   371	
   372		/* Transfer results of parsing to the sbi */
   373		JFS_SBI(sb)->flag = ctx->flag;
   374		JFS_SBI(sb)->uid = ctx->uid;
   375		JFS_SBI(sb)->gid = ctx->gid;
   376		JFS_SBI(sb)->umask = ctx->umask;
   377		JFS_SBI(sb)->minblks_trim = ctx->minblks_trim;
   378		if (ctx->nls_map != (void *) -1) {
   379			unload_nls(JFS_SBI(sb)->nls_tab);
   380			JFS_SBI(sb)->nls_tab = ctx->nls_map;
   381		}
   382		ctx->nls_map = NULL;
   383	
   384		if (ctx->resize) {
   385			if (sb_rdonly(sb)) {
   386				pr_err("JFS: resize requires volume to be mounted read-write\n");
   387				return -EROFS;
   388			}
   389	
   390			if (!ctx->newLVSize) {
   391				ctx->newLVSize = sb_bdev_nr_blocks(sb);
 > 392					if (ctx->newLVSize == 0)
   393						pr_err("JFS: Cannot determine volume size\n");
   394			}
   395	
   396			rc = jfs_extendfs(sb, ctx->newLVSize, 0);
   397			if (rc)
   398				return rc;
   399		}
   400	
   401		if (sb_rdonly(sb) && !readonly) {
   402			/*
   403			 * Invalidate any previously read metadata.  fsck may have
   404			 * changed the on-disk data since we mounted r/o
   405			 */
   406			truncate_inode_pages(JFS_SBI(sb)->direct_inode->i_mapping, 0);
   407	
   408			JFS_SBI(sb)->flag = flag;
   409			ret = jfs_mount_rw(sb, 1);
   410	
   411			/* mark the fs r/w for quota activity */
   412			sb->s_flags &= ~SB_RDONLY;
   413	
   414			dquot_resume(sb, -1);
   415			return ret;
   416		}
   417		if (!sb_rdonly(sb) && readonly) {
   418			rc = dquot_suspend(sb, -1);
   419			if (rc < 0)
   420				return rc;
   421			rc = jfs_umount_rw(sb);
   422			JFS_SBI(sb)->flag = flag;
   423			return rc;
   424		}
   425		if ((JFS_SBI(sb)->flag & JFS_NOINTEGRITY) != (flag & JFS_NOINTEGRITY)) {
   426			if (!sb_rdonly(sb)) {
   427				rc = jfs_umount_rw(sb);
   428				if (rc)
   429					return rc;
   430	
   431				JFS_SBI(sb)->flag = flag;
   432				ret = jfs_mount_rw(sb, 1);
   433				return ret;
   434			}
   435		}
   436		JFS_SBI(sb)->flag = flag;
   437	
   438		return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
