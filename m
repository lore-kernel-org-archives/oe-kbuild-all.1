Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D81B6547
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111876; cv=none; b=ZKKdPd3HOV3MiQCdYTMor08KPKN/UJOgAjm5b4mOVpsdP5j318G5yf+9iChoctySHEzyzqBS9oaFexyZYpwltAqZLwbtb+AeifhwG+oR/VEgGIpnt/D72Kd0oxGbjnP2lNysbH6AU19G0CGw/LHhDiyJJvAENlLg9sUX2dkRLiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111876; c=relaxed/simple;
	bh=xu3xKxqHPcfIUcrO2X25oGoKjyu070YkKd6bmvGAnmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zsalxv6/JvPNpCOleOdM9oVgF6cZBH6MrQwPl9GCN8swsY26Rdg6qlP1SkudhKUgV+84uCf4nlERNI0jYzpUMjrq4w/tHE0Q5qi2RX1A9OduwIt0qitw91bs8OGWGi3sdFmGl5iFWawHyzfBFmdwJIsincwn8Bn2VKtRPq7hB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjiRQIgG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjiRQIgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730111874; x=1761647874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xu3xKxqHPcfIUcrO2X25oGoKjyu070YkKd6bmvGAnmI=;
  b=hjiRQIgG9ZPD1tjEqGEG4JWSuNjDRupjyv6jb2JhhnSDhwGIG2evVd+L
   fUJmmbC6e4MxJb0ZbtRJiwDeTYTSWdiheDIMxeeIqX5mVyCaYTxvH0zgW
   JfsGmCtk6ZYG8P1ycArOXICMgPrjD7FBEI891RQbE9ZEtXjz5QO+p3+Nr
   maDdpM/cWhgdhKyU+B02HJSTfFww5Vd0a0Mpz5ukBxVT+hGSYEs7GVbq7
   LhAYzOWNYuToGVgo4HtikqzRqLLannk0oJQxY8vV2Ugmwt/k81e7GUHMu
   xWGc1kQmS4FyvBHZoUxA0Gguw6fyNfZtBmnP69b2g7Yl/vZ/A2/uWTHUE
   w==;
X-CSE-ConnectionGUID: rM6sVAFfQHy2ThH+62ZgAw==
X-CSE-MsgGUID: /D6TxjqeTOegANok/RimJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="47186775"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="47186775"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:37:54 -0700
X-CSE-ConnectionGUID: j8kuA+eMTsGG8MEkAOHEJg==
X-CSE-MsgGUID: n88HFQ7uQKi5j+jeDt0tQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82394471"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 03:37:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5N89-000cJi-2z;
	Mon, 28 Oct 2024 10:37:49 +0000
Date: Mon, 28 Oct 2024 18:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 15/16] fs/nfs/fscache.c:178:54: error:
 'struct nfs_inode' has no member named 'fh'; did you mean 'nfh'?
Message-ID: <202410281811.NLZA6Nkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   3cbc13ea704a0dfdaf3fc7e26eb251b50c416e5a
commit: a35a309f28531455cb28a7df34885fb9bf0cd815 [15/16] nfs: cache open nfsd_file(s) in client
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241028/202410281811.NLZA6Nkj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281811.NLZA6Nkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281811.NLZA6Nkj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/fscache.c: In function 'nfs_fscache_init_inode':
>> fs/nfs/fscache.c:178:54: error: 'struct nfs_inode' has no member named 'fh'; did you mean 'nfh'?
     178 |                                                nfsi->fh.data, /* index_key */
         |                                                      ^~
         |                                                      nfh
   fs/nfs/fscache.c:179:54: error: 'struct nfs_inode' has no member named 'fh'; did you mean 'nfh'?
     179 |                                                nfsi->fh.size,
         |                                                      ^~
         |                                                      nfh

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +178 fs/nfs/fscache.c

50eaa652b54df1 Dave Wysochanski 2020-04-16  159  
ef79c097bbe972 David Howells    2009-04-03  160  /*
ef79c097bbe972 David Howells    2009-04-03  161   * Initialise the per-inode cache cookie pointer for an NFS inode.
ef79c097bbe972 David Howells    2009-04-03  162   */
f1fe29b4a02d08 David Howells    2013-09-27  163  void nfs_fscache_init_inode(struct inode *inode)
ef79c097bbe972 David Howells    2009-04-03  164  {
402cb8dda949d9 David Howells    2018-04-04  165  	struct nfs_fscache_inode_auxdata auxdata;
dea1bb35c5f35e Trond Myklebust  2019-08-03  166  	struct nfs_server *nfss = NFS_SERVER(inode);
ef79c097bbe972 David Howells    2009-04-03  167  	struct nfs_inode *nfsi = NFS_I(inode);
ef79c097bbe972 David Howells    2009-04-03  168  
88a4d7bdeec978 Dave Wysochanski 2023-02-20  169  	netfs_inode(inode)->cache = NULL;
dea1bb35c5f35e Trond Myklebust  2019-08-03  170  	if (!(nfss->fscache && S_ISREG(inode->i_mode)))
ef79c097bbe972 David Howells    2009-04-03  171  		return;
402cb8dda949d9 David Howells    2018-04-04  172  
45f3a70ba68e1f Dave Wysochanski 2022-03-01  173  	nfs_fscache_update_auxdata(&auxdata, inode);
402cb8dda949d9 David Howells    2018-04-04  174  
88a4d7bdeec978 Dave Wysochanski 2023-02-20  175  	netfs_inode(inode)->cache = fscache_acquire_cookie(
88a4d7bdeec978 Dave Wysochanski 2023-02-20  176  					       nfss->fscache,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  177  					       0,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14 @178  					       nfsi->fh.data, /* index_key */
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  179  					       nfsi->fh.size,
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  180  					       &auxdata,      /* aux_data */
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  181  					       sizeof(auxdata),
45f3a70ba68e1f Dave Wysochanski 2022-03-01  182  					       i_size_read(inode));
b4fa966f03b740 David Howells    2023-06-28  183  
b4fa966f03b740 David Howells    2023-06-28  184  	if (netfs_inode(inode)->cache)
b4fa966f03b740 David Howells    2023-06-28  185  		mapping_set_release_always(inode->i_mapping);
ef79c097bbe972 David Howells    2009-04-03  186  }
ef79c097bbe972 David Howells    2009-04-03  187  

:::::: The code at line 178 was first introduced by commit
:::::: a6b5a28eb56c3f4988f7ff5290b954ba296e309a nfs: Convert to new fscache volume/cookie API

:::::: TO: Dave Wysochanski <dwysocha@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
