Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80730BE6B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1HqJgRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704703730; x=1736239730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9d8TucL00x1fi9PzZRndM2p9cb8n1hYCBvJpHt6Fmc=;
  b=B1HqJgRq1AQrx0uyEu9mJvnWxk90u3hhsDB1sJDNVik4hF/UMLWGdwRF
   Q8LOi61Y991O4EWJjE8mjJm26JsmjkDbqYMporIOLR4RNpidbxf5ExDSY
   DxnodGFGyqd7Yd5U63bv41DWCzPuTja8VATWmTwmEaE1zJqEpHeOfmwVt
   pvGzR//hv4EHXYco98X3aguSQKLFDRhAKM2RyFXsHbR8yS6ISmHCWxHT0
   5c0wMx6OzDjAiRhuXzgkHmNh74n7euBfpyVI20qNRw4v8XXScU51H57es
   D3rH+tLt0wvhFA94sSMizPAYBInt3mAyfPgfN35/4nvn2o29y47l5GQ2/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="4585473"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="4585473"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 00:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="784795700"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="784795700"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jan 2024 00:48:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMlJO-0004Ym-1U;
	Mon, 08 Jan 2024 08:48:46 +0000
Date: Mon, 8 Jan 2024 16:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Van Hensbergen <ericvh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, v9fs-developer@lists.sourceforge.net
Subject: [ericvh-v9fs:b4/ericvh-fix-cache-dups 5/10]
 fs/9p/vfs_inode_dotl.c:695:35: warning: variable 'v9ses' set but not used
Message-ID: <202401081629.1NSWMlif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git b4/ericvh-fix-cache-dups
head:   d004f1a1a9d34c2e3e3a7c9affd746d7fc20988e
commit: a5e3c9447509ace29a29ed2cd49dda8ce79cadae [5/10] fs/9p: remove walk and inode allocation from symlink
config: m68k-virt_defconfig (https://download.01.org/0day-ci/archive/20240108/202401081629.1NSWMlif-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081629.1NSWMlif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081629.1NSWMlif-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/9p/vfs_inode_dotl.c: In function 'v9fs_vfs_symlink_dotl':
>> fs/9p/vfs_inode_dotl.c:695:35: warning: variable 'v9ses' set but not used [-Wunused-but-set-variable]
     695 |         struct v9fs_session_info *v9ses;
         |                                   ^~~~~


vim +/v9ses +695 fs/9p/vfs_inode_dotl.c

53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  684  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  685  static int
7a77db95511c39 Christian Brauner  2023-01-13  686  v9fs_vfs_symlink_dotl(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner  2021-01-21  687  		      struct dentry *dentry, const char *symname)
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  688  {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  689  	int err;
d4ef4e35810448 Eric W. Biederman  2013-01-30  690  	kgid_t gid;
7880b43bdfc958 Al Viro            2017-01-12  691  	const unsigned char *name;
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28  692  	struct p9_qid qid;
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28  693  	struct p9_fid *dfid;
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28  694  	struct p9_fid *fid = NULL;
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28 @695  	struct v9fs_session_info *v9ses;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  696  
7880b43bdfc958 Al Viro            2017-01-12  697  	name = dentry->d_name.name;
5d3851530d6d68 Joe Perches        2011-11-28  698  	p9_debug(P9_DEBUG_VFS, "%lu,%s,%s\n", dir->i_ino, name, symname);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  699  	v9ses = v9fs_inode2v9ses(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  700  
77d5a6b7d9924e Al Viro            2016-05-29  701  	dfid = v9fs_parent_fid(dentry);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  702  	if (IS_ERR(dfid)) {
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  703  		err = PTR_ERR(dfid);
5d3851530d6d68 Joe Perches        2011-11-28  704  		p9_debug(P9_DEBUG_VFS, "fid lookup failed %d\n", err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  705  		return err;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  706  	}
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  707  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  708  	gid = v9fs_get_fsgid_for_create(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  709  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  710  	/* Server doesn't alter fid on TSYMLINK. Hence no need to clone it. */
7880b43bdfc958 Al Viro            2017-01-12  711  	err = p9_client_symlink(dfid, name, symname, gid, &qid);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  712  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  713  	if (err < 0) {
5d3851530d6d68 Joe Perches        2011-11-28  714  		p9_debug(P9_DEBUG_VFS, "p9_client_symlink failed %d\n", err);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  715  		goto error;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  716  	}
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  717  
d28c61f0e08aab Aneesh Kumar K.V   2011-02-28  718  	v9fs_invalidate_inode_attr(dir);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  719  
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  720  error:
b48dbb998d70b7 Dominique Martinet 2022-06-12  721  	p9_fid_put(fid);
b48dbb998d70b7 Dominique Martinet 2022-06-12  722  	p9_fid_put(dfid);
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  723  	return err;
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  724  }
53c06f4e0a4621 Aneesh Kumar K.V   2011-01-10  725  

:::::: The code at line 695 was first introduced by commit
:::::: d28c61f0e08aab9e3a2d3430e75f97937c5fe5fd fs/9p: Mark directory inode invalid for many directory inode operations

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Eric Van Hensbergen <ericvh@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
