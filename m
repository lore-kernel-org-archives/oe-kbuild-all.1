Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B43F2BAF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbY9oSyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701342053; x=1732878053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JD67fMvDp5yTunKBji2Rp6opHSBd1WLQZqmd3iBnpDw=;
  b=QbY9oSyyHOeDAiDcPzpuqtmFHDRGCTcQgrbj0F1T3txOnKZMKPb9Bjr/
   E3afApTUCM+pY0vgCaN0nQAxJbCNbwXVtszdoT1KvsRKNCviKsI8fABd2
   /eEc5NTy2FC0LrEVHuxVvEYiEUSZ9Oi3PK7vEI99sni/TqVAxffJ+ptp0
   HEiGPjNougvXbPCIPEJJwcNzI0YlLDOKqm+41KC1u2nr1M0M0caPftv+l
   FBVeWwdV1+VwIRaQVEaOfIo/PIV7ZjaqdHmfiGd0wp79CAK7y4/LUNu1s
   NpqHTDPsWvPqcgFe/r5O9Gc1P+dBRrCUiOXNJDt2HppWY6cKHeAe3NtKC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="207303"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="207303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17352578"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 03:00:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8emm-0001jd-1x;
	Thu, 30 Nov 2023 11:00:48 +0000
Date: Thu, 30 Nov 2023 19:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 60/61] fs/9p/vfs_inode.c:379:9: error:
 implicit declaration of function 'fscache_clear_inode_writeback'; did you
 mean 'sb_clear_inode_writeback'?
Message-ID: <202311301802.vQN6VFbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   ed72c33e807046e9a09965dba2d3524f5bc90ae9
commit: 0455c3240d311ab544e4669de9392af791fb6ee1 [60/61] netfs: Move pinning-for-writeback from fscache to netfs
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301802.vQN6VFbh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301802.vQN6VFbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301802.vQN6VFbh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/9p/vfs_inode.c: In function 'v9fs_evict_inode':
>> fs/9p/vfs_inode.c:379:9: error: implicit declaration of function 'fscache_clear_inode_writeback'; did you mean 'sb_clear_inode_writeback'? [-Werror=implicit-function-declaration]
     379 |         fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         sb_clear_inode_writeback
   cc1: some warnings being treated as errors
--
   fs/9p/vfs_addr.c: In function 'v9fs_dirty_folio':
>> fs/9p/vfs_addr.c:300:16: error: implicit declaration of function 'fscache_dirty_folio'; did you mean 'filemap_dirty_folio'? [-Werror=implicit-function-declaration]
     300 |         return fscache_dirty_folio(mapping, folio, v9fs_inode_cookie(v9inode));
         |                ^~~~~~~~~~~~~~~~~~~
         |                filemap_dirty_folio
   cc1: some warnings being treated as errors


vim +379 fs/9p/vfs_inode.c

2bad8471511ce5 Eric Van Hensbergen 2005-09-09  364  
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  365  /**
bc868036569e1d David Howells       2021-10-04  366   * v9fs_evict_inode - Remove an inode from the inode cache
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  367   * @inode: inode to release
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  368   *
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  369   */
b57922d97fd6f7 Al Viro             2010-06-07  370  void v9fs_evict_inode(struct inode *inode)
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  371  {
4eb3117888a923 Eric Van Hensbergen 2023-03-27  372  	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  373  	__le32 __maybe_unused version;
6b39f6d22fbf67 Aneesh Kumar K.V    2011-02-28  374  
4ad78628445d26 Al Viro             2015-12-08  375  	truncate_inode_pages_final(&inode->i_data);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  376  
4eb3117888a923 Eric Van Hensbergen 2023-03-27  377  #ifdef CONFIG_9P_FSCACHE
93c846143d8630 David Howells       2020-11-18  378  	version = cpu_to_le32(v9inode->qid.version);
93c846143d8630 David Howells       2020-11-18 @379  	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
93c846143d8630 David Howells       2020-11-18  380  				      &version);
4eb3117888a923 Eric Van Hensbergen 2023-03-27  381  #endif
4eb3117888a923 Eric Van Hensbergen 2023-03-27  382  
dbd5768f87ff6f Jan Kara            2012-05-03  383  	clear_inode(inode);
4ad78628445d26 Al Viro             2015-12-08  384  	filemap_fdatawrite(&inode->i_data);
60e78d2c993e58 Abhishek Kulkarni   2009-09-23  385  

:::::: The code at line 379 was first introduced by commit
:::::: 93c846143d8630d1fd465b69703b0f0021a543dc 9p: Copy local writes to the cache when writing to the server

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
