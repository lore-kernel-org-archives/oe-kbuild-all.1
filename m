Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D2A3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687690961; x=1719226961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95l/qH7w9bWPn3JRwJA4vyrab/+IY0ek6sAT1hQC604=;
  b=TzbYVUkZzm6PvhnEQZKCPIncP48eAdLj6Z8qB0gvfKujNtYeXHK3U11F
   wWFflTnxSo8k9ijKVlybN+GQHCglUj2T1+EZXOcFkr8VxAaPmwZJT3zui
   kUk6LRKAmwZC0qHK5DvT366kDBFMP7hEmYLMhe+uCtIgFSOSFLAP0WacY
   Zk2hXhRLJiMzSUUqHgobP7XUscDYts2r70yXbfe0xk+G/fwd/1qnCYZru
   1K1EGkZ2lQA4jNfcwoLcgOlKaQkMz7B3pmiN2tabd9EHIXb/R4EbtVTFB
   soFwkzu9W3DtO4u30/1SzKup/EFLu38jlAUpRjtqQBBjlQ7TbvwaULkWf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="358543778"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="358543778"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 04:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="719028495"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="719028495"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2023 04:02:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDNVu-0009yv-21;
	Sun, 25 Jun 2023 11:02:38 +0000
Date: Sun, 25 Jun 2023 19:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [chao:dev-test 1/21] fs/f2fs/file.c:1941:37: warning: statement with
 no effect
Message-ID: <202306251856.GIweOxME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   e0494cc29d5285433cd8a5b0d79a84c1e57ca339
commit: ffda111162ddf40c7544c6412ddac9b8494ca3e7 [1/21] f2fs: fix to avoid mmap vs set_compress_option case
config: i386-randconfig-i003-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251856.GIweOxME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251856.GIweOxME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251856.GIweOxME-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/file.c: In function 'f2fs_setflags_common':
>> fs/f2fs/file.c:1941:37: warning: statement with no effect [-Wunused-value]
    1941 |                                 err -EOPNOTSUPP;


vim +1941 fs/f2fs/file.c

  1896	
  1897	static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
  1898	{
  1899		struct f2fs_inode_info *fi = F2FS_I(inode);
  1900		u32 masked_flags = fi->i_flags & mask;
  1901	
  1902		/* mask can be shrunk by flags_valid selector */
  1903		iflags &= mask;
  1904	
  1905		/* Is it quota file? Do not allow user to mess with it */
  1906		if (IS_NOQUOTA(inode))
  1907			return -EPERM;
  1908	
  1909		if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
  1910			if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
  1911				return -EOPNOTSUPP;
  1912			if (!f2fs_empty_dir(inode))
  1913				return -ENOTEMPTY;
  1914		}
  1915	
  1916		if (iflags & (F2FS_COMPR_FL | F2FS_NOCOMP_FL)) {
  1917			if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
  1918				return -EOPNOTSUPP;
  1919			if ((iflags & F2FS_COMPR_FL) && (iflags & F2FS_NOCOMP_FL))
  1920				return -EINVAL;
  1921		}
  1922	
  1923		if ((iflags ^ masked_flags) & F2FS_COMPR_FL) {
  1924			if (masked_flags & F2FS_COMPR_FL) {
  1925				if (!f2fs_disable_compressed_file(inode))
  1926					return -EINVAL;
  1927			} else {
  1928				/* try to convert inline_data to support compression */
  1929				int err = f2fs_convert_inline_inode(inode);
  1930				if (err)
  1931					return err;
  1932	
  1933				f2fs_down_write(&F2FS_I(inode)->i_sem);
  1934				if (!f2fs_may_compress(inode) ||
  1935						(S_ISREG(inode->i_mode) &&
  1936						F2FS_HAS_BLOCKS(inode))) {
  1937					f2fs_up_write(&F2FS_I(inode)->i_sem);
  1938					return -EINVAL;
  1939				}
  1940				if (set_compress_context(inode))
> 1941					err -EOPNOTSUPP;
  1942				f2fs_up_write(&F2FS_I(inode)->i_sem);
  1943	
  1944				if (err)
  1945					return err;
  1946			}
  1947		}
  1948	
  1949		fi->i_flags = iflags | (fi->i_flags & ~mask);
  1950		f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
  1951						(fi->i_flags & F2FS_NOCOMP_FL));
  1952	
  1953		if (fi->i_flags & F2FS_PROJINHERIT_FL)
  1954			set_inode_flag(inode, FI_PROJ_INHERIT);
  1955		else
  1956			clear_inode_flag(inode, FI_PROJ_INHERIT);
  1957	
  1958		inode->i_ctime = current_time(inode);
  1959		f2fs_set_inode_flags(inode);
  1960		f2fs_mark_inode_dirty_sync(inode, true);
  1961		return 0;
  1962	}
  1963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
