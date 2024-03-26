Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D984D29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711437954; cv=none; b=EzkUv88ee1UBaDDomtz2EJl4j1OCdUKPYQ7XNZat6QOcpQf3Oq29ChrOCEE3J0kEhVza1zB8NkIxZ8KBIUd1xzoLO5qyLe4inqyh23PF0+g2niZ3VQioqmj/hN07nhpgoh1QCXk5jVQfJNVv9mhnxFERItx6iH6WPqcLOfHINuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711437954; c=relaxed/simple;
	bh=5mydzolM18RdCV+s83rH/JIZbNq2cGomY6VG4TyR7s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fo2KeydDOTZXAsRmmlVcuWSEqTC5ak/NGl157rwRHHkVvZSZ5wiLrynZltTo18agSSAp2nJa3XvBgYXiTMLHzAAlctjYc9W4A5fLKN4/wtL890EW4Nkk9kUTjCHfOiE2XlHef/RIe6tB1FSRlz5cWwEDvBDkMHm5nqzho1hrosk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FK4dkN4b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FK4dkN4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711437953; x=1742973953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mydzolM18RdCV+s83rH/JIZbNq2cGomY6VG4TyR7s8=;
  b=FK4dkN4bkR5cPhnSICEZLd/wvMDJCt5BRjcXpLepky0syonkKFLSqR0V
   LE8I7OE11YbuX6zl8e0dXHeOQBgugVMXKTBtEw2xSWZ8YKdC6imFnjWsx
   u/1FNpzTmQAzyvh0Fdnl0/lpzW57xxQTxWk+ZZbOyGXDJtynLiOVpOWMY
   Zxr/v+20tIr0caMBwcSMN/K1jbYMz9wqF0USFDzGp7MkgCCmyrXbbHNkG
   VTOaKXF7yl8jD+KvMtNFYbivj7om1n7g6gU+zufkE9Hrwzy1/lWK4rmSj
   bHyD4tgAmBJ1qQ83O1MN7fE9Jsao0XWhWoVItVgVenKajHl5E421qwrRV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17105989"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="17105989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 00:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="15909064"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2024 00:25:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp1Bs-000NCk-2c;
	Tue, 26 Mar 2024 07:25:48 +0000
Date: Tue, 26 Mar 2024 15:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 8/9] fs/f2fs/segment.c:183 f2fs_need_SSR() warn:
 inconsistent indenting
Message-ID: <202403261525.n8x5NgUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   ffa2225cad631419f3944c962518291a7df50367
commit: f7b3653af1ec5c696f389e36eff671bbcbcae440 [8/9] f2fs: zone: allow SSR allocation in regular block device
config: xtensa-randconfig-r081-20240325 (https://download.01.org/0day-ci/archive/20240326/202403261525.n8x5NgUj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261525.n8x5NgUj-lkp@intel.com/

New smatch warnings:
fs/f2fs/segment.c:183 f2fs_need_SSR() warn: inconsistent indenting

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +183 fs/f2fs/segment.c

9a7f143ab52935 Changman Lee     2013-11-15  170  
4d57b86dd86404 Chao Yu          2018-05-30  171  bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  172  {
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  173  	int node_secs = get_blocktype_secs(sbi, F2FS_DIRTY_NODES);
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  174  	int dent_secs = get_blocktype_secs(sbi, F2FS_DIRTY_DENTS);
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  175  	int imeta_secs = get_blocktype_secs(sbi, F2FS_DIRTY_IMETA);
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  176  
f7b3653af1ec5c Chao Yu          2024-03-23  177  	if (f2fs_lfs_mode(sbi)) {
f7b3653af1ec5c Chao Yu          2024-03-23  178  		if (!f2fs_sb_has_blkzoned(sbi))
f7b3653af1ec5c Chao Yu          2024-03-23  179  			return false;
f7b3653af1ec5c Chao Yu          2024-03-23  180  		if (!sbi->first_zoned_segno)
f7b3653af1ec5c Chao Yu          2024-03-23  181  			return false;
f7b3653af1ec5c Chao Yu          2024-03-23  182  	}
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09 @183  		return false;
0e5e81114de1c4 Daeho Jeong      2020-07-02  184  	if (sbi->gc_mode == GC_URGENT_HIGH)
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  185  		return true;
4354994f097d06 Daniel Rosenberg 2018-08-20  186  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
4354994f097d06 Daniel Rosenberg 2018-08-20  187  		return true;
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  188  
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  189  	return free_sections(sbi) <= (node_secs + 2 * dent_secs + imeta_secs +
a2a12b679f3670 Chao Yu          2017-10-28  190  			SM_I(sbi)->min_ssr_sections + reserved_sections(sbi));
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  191  }
b3a97a2a9a7b2d Jaegeuk Kim      2017-09-09  192  

:::::: The code at line 183 was first introduced by commit
:::::: b3a97a2a9a7b2d50bcf13d32857cd6f5695c6b65 f2fs: speed up gc_urgent mode with SSR

:::::: TO: Jaegeuk Kim <jaegeuk@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
