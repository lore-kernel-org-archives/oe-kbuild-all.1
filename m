Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EB5D8F3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709716523; cv=none; b=Oyi22ZrF67Z+nFHqTk/sINu8j+ps5cMPYdjYOnIHq0+InVq6/HWT7g9c54KoJ4OQxeHPNPrZhWZWQG58Jo7T/eBhsnqrIsgCDD7p/sHa6Gd4udQWQ/aklMKbdn+jTHwc5JWC1FyQQp0GfauLmKlkRmDlp8xV8j9va6ccPMLFykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709716523; c=relaxed/simple;
	bh=U+Gp9g4rwuWbEqu5kQLZ/ZmVa9J6Yf8+eM1R2JYYl00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IoRWhtjFY8J/K0GmhOL4XsyKsOiPfxnJAcF9OnAKat4Tm0bWctfPfc8H5kjK5BtHWzvhcpYMcPu0v5weyMXLzb8Tz0aRO5wkW8EnOGKwjk04yS0uO92fXslbvCE4VTGWUNQm2cKNtTU1VN5mF6VwcUOo9/slGa2GOXDqFJv+hnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPJJG8un; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPJJG8un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709716521; x=1741252521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=U+Gp9g4rwuWbEqu5kQLZ/ZmVa9J6Yf8+eM1R2JYYl00=;
  b=nPJJG8untkblvHlQudME35e8rK55xMPv8kBlsmBojMrppFdclEJ5lVDX
   ZfSnmyzd1LuMOS9jILgjRyO7WIBioTiLAgAPY4OaDF0IF9in3mF7qfTev
   A14EvbVqbP9kwhfIutUinXD+TJz3S4Yq6OPg5Gs6NWiJW40OVp9QibVHJ
   XQ2rEdrKzb9dnerAUQXtYJHxgsj4JvXsBJCEpqrS/dpePf2yJnD/UAIy9
   VF7FXnnyLoICe4h2JhkgXHSIaUY1Wp/yyYExS0Bq4gKg5pOpHmsetF3l+
   u9Ns5HCmv0bHw0db3YB36MUWU1f8Csp9dw7AFXBJfgwn0/SXcbC0K9LRj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8080352"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8080352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="47219696"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2024 01:15:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhnMo-00045L-2O;
	Wed, 06 Mar 2024 09:15:14 +0000
Date: Wed, 6 Mar 2024 17:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.mount.api 2/3] fs/freevxfs/vxfs_super.c:186:
 warning: Function parameter or struct member 'fc' not described in
 'vxfs_fill_super'
Message-ID: <202403061733.YVyoeVPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount.api
head:   0540b5e5fc1fb89be71af08ddfc7c21a22828ec5
commit: f65b9daeb55bb95583d6fa90762887c22b190406 [2/3] freevxfs: Convert freevxfs to the new mount API.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240306/202403061733.YVyoeVPl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061733.YVyoeVPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061733.YVyoeVPl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/freevxfs/vxfs_super.c:186: warning: Function parameter or struct member 'fc' not described in 'vxfs_fill_super'
>> fs/freevxfs/vxfs_super.c:186: warning: Excess function parameter 'dp' description in 'vxfs_fill_super'
>> fs/freevxfs/vxfs_super.c:186: warning: Excess function parameter 'silent' description in 'vxfs_fill_super'


vim +186 fs/freevxfs/vxfs_super.c

0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  168  
^1da177e4c3f41 Linus Torvalds        2005-04-16  169  /**
d3fcf834b248b9 Randy Dunlap          2023-01-08  170   * vxfs_fill_super - read superblock into memory and initialize filesystem
^1da177e4c3f41 Linus Torvalds        2005-04-16  171   * @sbp:		VFS superblock (to fill)
^1da177e4c3f41 Linus Torvalds        2005-04-16  172   * @dp:			fs private mount data
^1da177e4c3f41 Linus Torvalds        2005-04-16  173   * @silent:		do not complain loudly when sth is wrong
^1da177e4c3f41 Linus Torvalds        2005-04-16  174   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  175   * Description:
^1da177e4c3f41 Linus Torvalds        2005-04-16  176   *   We are called on the first mount of a filesystem to read the
^1da177e4c3f41 Linus Torvalds        2005-04-16  177   *   superblock into memory and do some basic setup.
^1da177e4c3f41 Linus Torvalds        2005-04-16  178   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  179   * Returns:
^1da177e4c3f41 Linus Torvalds        2005-04-16  180   *   The superblock on success, else %NULL.
^1da177e4c3f41 Linus Torvalds        2005-04-16  181   *
^1da177e4c3f41 Linus Torvalds        2005-04-16  182   * Locking:
db71922217a214 Jan Blunck            2010-08-15  183   *   We are under @sbp->s_lock.
^1da177e4c3f41 Linus Torvalds        2005-04-16  184   */
f65b9daeb55bb9 Eric Sandeen          2024-03-01  185  static int vxfs_fill_super(struct super_block *sbp, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds        2005-04-16 @186  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  187  	struct vxfs_sb_info	*infp;
^1da177e4c3f41 Linus Torvalds        2005-04-16  188  	struct vxfs_sb		*rsbp;
^1da177e4c3f41 Linus Torvalds        2005-04-16  189  	u_long			bsize;
^1da177e4c3f41 Linus Torvalds        2005-04-16  190  	struct inode *root;
d0b079483dd4cf David Howells         2008-02-07  191  	int ret = -EINVAL;
f65b9daeb55bb9 Eric Sandeen          2024-03-01  192  	int silent = fc->sb_flags & SB_SILENT;
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  193  	u32 j;
^1da177e4c3f41 Linus Torvalds        2005-04-16  194  
1751e8a6cb935e Linus Torvalds        2017-11-27  195  	sbp->s_flags |= SB_RDONLY;
^1da177e4c3f41 Linus Torvalds        2005-04-16  196  
e915fc497a8da5 Pekka Enberg          2005-09-06  197  	infp = kzalloc(sizeof(*infp), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds        2005-04-16  198  	if (!infp) {
f65b9daeb55bb9 Eric Sandeen          2024-03-01  199  		warnf(fc, "vxfs: unable to allocate incore superblock");
^1da177e4c3f41 Linus Torvalds        2005-04-16  200  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  201  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  202  
^1da177e4c3f41 Linus Torvalds        2005-04-16  203  	bsize = sb_min_blocksize(sbp, BLOCK_SIZE);
^1da177e4c3f41 Linus Torvalds        2005-04-16  204  	if (!bsize) {
f65b9daeb55bb9 Eric Sandeen          2024-03-01  205  		warnf(fc, "vxfs: unable to set blocksize");
^1da177e4c3f41 Linus Torvalds        2005-04-16  206  		goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  207  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  208  
2f137e31e07118 Christoph Hellwig     2016-06-01  209  	sbp->s_op = &vxfs_super_ops;
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  210  	sbp->s_fs_info = infp;
22b139691f9eb8 Deepa Dinamani        2019-07-30  211  	sbp->s_time_min = 0;
22b139691f9eb8 Deepa Dinamani        2019-07-30  212  	sbp->s_time_max = U32_MAX;
^1da177e4c3f41 Linus Torvalds        2005-04-16  213  
f65b9daeb55bb9 Eric Sandeen          2024-03-01  214  	if (!vxfs_try_sb_magic(sbp, fc, 1,
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  215  			(__force __fs32)cpu_to_le32(VXFS_SUPER_MAGIC))) {
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  216  		/* Unixware, x86 */
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  217  		infp->byte_order = VXFS_BO_LE;
f65b9daeb55bb9 Eric Sandeen          2024-03-01  218  	} else if (!vxfs_try_sb_magic(sbp, fc, 8,
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  219  			(__force __fs32)cpu_to_be32(VXFS_SUPER_MAGIC))) {
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  220  		/* HP-UX, parisc */
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  221  		infp->byte_order = VXFS_BO_BE;
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  222  	} else {
^1da177e4c3f41 Linus Torvalds        2005-04-16  223  		if (!silent)
f65b9daeb55bb9 Eric Sandeen          2024-03-01  224  			infof(fc, "vxfs: can't find superblock.");
^1da177e4c3f41 Linus Torvalds        2005-04-16  225  		goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  226  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  227  
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  228  	rsbp = infp->vsi_raw;
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  229  	j = fs32_to_cpu(infp, rsbp->vs_version);
0d83f7fc83f77d Krzysztof Błaszkowski 2016-05-31  230  	if ((j < 2 || j > 4) && !silent) {
f65b9daeb55bb9 Eric Sandeen          2024-03-01  231  		infof(fc, "vxfs: unsupported VxFS version (%d)", j);
^1da177e4c3f41 Linus Torvalds        2005-04-16  232  		goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  233  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  234  

:::::: The code at line 186 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
