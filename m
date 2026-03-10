Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58329BD88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159583; cv=none; b=mEvIE0s8uPW8gx+FP0x0eb0Ovb5PvP2US2T1PpQTG2PkVlfIe2IjNZq9wz3a9udM90ZCXXNcN9g286yvPwszPwdCHUigtOyNOeEdYwHqSmmBdOw71Dify5lHk8T5Xu1dsTKeOUBs23m6+6t/O730WQQ+lbMuwLWkSCkTjmsZX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159583; c=relaxed/simple;
	bh=SWvgi6xFshVxzLLhUJsr+0wTie6u+ZuYVDVgOHjUYsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZLNeeJ+IupLKtrSgwu7albZUQ6hPEt0agbk/p/q7V0/7CerfVo29Db8EXPofiG2jloktjb+rZhgZ/T54O1Xql6Mj8AzykxfF7p2qUgWZtB5MOCvl3G7KIQIT1dS2v8CR0zP3W3sPlJ3ZFqkiBNTggdLdYUFp/f/emnqT4hMvQYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHUwYvpR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHUwYvpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773159581; x=1804695581;
  h=date:from:to:cc:subject:message-id;
  bh=SWvgi6xFshVxzLLhUJsr+0wTie6u+ZuYVDVgOHjUYsk=;
  b=GHUwYvpRzdiaSHGcu/wDWAVUVu98K4f6rPHavJdvxwn4Ye9uH7Sgv8ea
   gJ6FbiAa029oAPKJMRV93p9uvJhUvn6dziJshJkp1DeIO5mKdZv0miQFY
   ycD3Q2GuxJHmbmcTe0qs5Fft9CVGJJl55CjjivJWQerOjqlomoSf1oljv
   ZxWGJC5RGFL74J8Tsv4UgL9RhKFACE9umUXsHdQUGQuH9LcSBDYvNEccF
   p8rn7WGfR2cM4Ep5W5P05tdtU1/qjSly/oDjs+Pi6OLFu8UAkkZ0JJXbl
   Y2PunUjFM/3xSXXHYW+lTsIY93wic2pzGTRzRWJVLf81O7S+WBUzXtCq1
   g==;
X-CSE-ConnectionGUID: Zpc+ZPxyTOmVRluEG0AVHA==
X-CSE-MsgGUID: OK1fVwzzR22NVVtbTVWdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77817059"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77817059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:19:41 -0700
X-CSE-ConnectionGUID: hXL+NALbReiFnLR76Q1FPg==
X-CSE-MsgGUID: m+jKTDcTRKOYAtAoqck74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="245899642"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2026 09:19:39 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzzo0-000000002Fk-2OLl;
	Tue, 10 Mar 2026 16:19:36 +0000
Date: Wed, 11 Mar 2026 00:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 24/76] fs/nfs/getroot.c:90:17: sparse:
 sparse: incompatible types in conditional expression (different base types):
Message-ID: <202603110038.P6d14oxa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   ab3a77c508e7f4484df05699b2209ac34f4721c4
commit: 5d44b75a53924f33acd6ad924c7b6a7999b36637 [24/76] sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op
config: x86_64-randconfig-121-20260310 (https://download.01.org/0day-ci/archive/20260311/202603110038.P6d14oxa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110038.P6d14oxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110038.P6d14oxa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/getroot.c:90:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:90:17: sparse:    void
   fs/nfs/getroot.c:90:17: sparse:    int
   fs/nfs/getroot.c:98:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:98:17: sparse:    void
   fs/nfs/getroot.c:98:17: sparse:    int
   fs/nfs/getroot.c:114:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/getroot.c:114:17: sparse:    void
   fs/nfs/getroot.c:114:17: sparse:    int
--
>> fs/nfs/namespace.c:304:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/namespace.c:304:17: sparse:    void
   fs/nfs/namespace.c:304:17: sparse:    int
--
>> fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:232:17: sparse:    void
   fs/nfs/nfs4super.c:232:17: sparse:    int
   fs/nfs/nfs4super.c:255:17: sparse: sparse: incompatible types in conditional expression (different base types):
   fs/nfs/nfs4super.c:255:17: sparse:    void
   fs/nfs/nfs4super.c:255:17: sparse:    int

vim +90 fs/nfs/getroot.c

b09b9417d074e01 Trond Myklebust 2007-10-25  63  
54ceac451598603 David Howells   2006-08-22  64  /*
6d26c5e4d83cd39 Li Lingfeng     2024-08-24  65   * get a root dentry from the root filehandle
54ceac451598603 David Howells   2006-08-22  66   */
62a55d088cd87d4 Scott Mayhew    2019-12-10  67  int nfs_get_root(struct super_block *s, struct fs_context *fc)
54ceac451598603 David Howells   2006-08-22  68  {
62a55d088cd87d4 Scott Mayhew    2019-12-10  69  	struct nfs_fs_context *ctx = nfs_fc2context(fc);
eae00c5d6e48ccb Scott Mayhew    2021-06-22  70  	struct nfs_server *server = NFS_SB(s), *clone_server;
54ceac451598603 David Howells   2006-08-22  71  	struct nfs_fsinfo fsinfo;
62a55d088cd87d4 Scott Mayhew    2019-12-10  72  	struct dentry *root;
54ceac451598603 David Howells   2006-08-22  73  	struct inode *inode;
62a55d088cd87d4 Scott Mayhew    2019-12-10  74  	char *name;
62a55d088cd87d4 Scott Mayhew    2019-12-10  75  	int error = -ENOMEM;
779df6a5480f130 Scott Mayhew    2020-03-03  76  	unsigned long kflags = 0, kflags_out = 0;
54ceac451598603 David Howells   2006-08-22  77  
62a55d088cd87d4 Scott Mayhew    2019-12-10  78  	name = kstrdup(fc->source, GFP_KERNEL);
b1942c5f8cf3bea Al Viro         2011-03-16  79  	if (!name)
62a55d088cd87d4 Scott Mayhew    2019-12-10  80  		goto out;
b1942c5f8cf3bea Al Viro         2011-03-16  81  
54ceac451598603 David Howells   2006-08-22  82  	/* get the actual root for this mount */
d755ad8dc752d44 Anna Schumaker  2021-10-22  83  	fsinfo.fattr = nfs_alloc_fattr_with_label(server);
62a55d088cd87d4 Scott Mayhew    2019-12-10  84  	if (fsinfo.fattr == NULL)
62a55d088cd87d4 Scott Mayhew    2019-12-10  85  		goto out_name;
54ceac451598603 David Howells   2006-08-22  86  
62a55d088cd87d4 Scott Mayhew    2019-12-10  87  	error = server->nfs_client->rpc_ops->getroot(server, ctx->mntfh, &fsinfo);
54ceac451598603 David Howells   2006-08-22  88  	if (error < 0) {
54ceac451598603 David Howells   2006-08-22  89  		dprintk("nfs_get_root: getattr error = %d\n", -error);
ce8866f0913ff15 Scott Mayhew    2019-12-10 @90  		nfs_errorf(fc, "NFS: Couldn't getattr on root");

:::::: The code at line 90 was first introduced by commit
:::::: ce8866f0913ff157edc098f06bad07763ad317e7 NFS: Attach supplementary error information to fs_context.

:::::: TO: Scott Mayhew <smayhew@redhat.com>
:::::: CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
