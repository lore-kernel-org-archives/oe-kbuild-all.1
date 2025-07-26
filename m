Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B421B1BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753530279; cv=none; b=bqQPuUmJ5aNbAer04jAu3X2vwJmLjqyjyntvC2SneVuE2kWZeOx4RIhzxFo3pWW+FsnpzHFPAk1WYxrzetT3GdMq+Crf+3mcJFjnZUr8300MyK4snFdHFHHcC9w5ciCqe0fdECfNsMpdoXI1M6VUs2BD7kaub7RHkfwbOZd8dIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753530279; c=relaxed/simple;
	bh=b1j2L7YN/i3cJcHDFQnlVpMyFAn+6868DMTd5My6hTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXgd4MWQBxsHdkV68KUSXPkxT89uEwwpH7sIarKeaSJGOA341oiLV2lU853Uai+wG3UUjixzNy3TZrxWhXtSlJD4eiSMOTYCX9yQQJnm2D3srMhSga0/wPBNT8pDKoCNwUV0tTCViB2O4hq2jtmv18I9pIjyJ/ScRNwTEPJWJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPPDV7pF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPPDV7pF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753530278; x=1785066278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b1j2L7YN/i3cJcHDFQnlVpMyFAn+6868DMTd5My6hTc=;
  b=YPPDV7pFhiGXlxR/i/bsY10ius+8DO3FlTfuC+A7ChA3Q5a1BBBGuACp
   NPlXU0dlBuP9hdNCoqvJsDWNjMccwR58YVLjC/aNhG13jSUCU4uRfIu9+
   pY7YLSPTzJTYPVkRJEHYKULUbkcM1xBUi/f8B3Mr14usoc7jcGiOZbjT3
   nOUgbfTTwX+mB1IPd4R56RFRU3h21wfAROuQIMIwKaQcIbT8/XDqHihyl
   N7IYykPmKNuNgpo6q7bN5d35wLNK6dR8sN79PWVDJe3dInUgoKqK7TEPz
   QHDkTIjroba1aU19cgxCuTEukVGyIAkG8vMem8TOaHBzKRDon7jHvdorp
   Q==;
X-CSE-ConnectionGUID: oYkyFiSmSIKRFFn9oX4RSw==
X-CSE-MsgGUID: Q/0A9/GJR+Kuk3hrC1WIdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="78399353"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="78399353"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:44:36 -0700
X-CSE-ConnectionGUID: 2wPJpWnfQ6SC99+AbGB9Ow==
X-CSE-MsgGUID: RUKRIWmcQNCWhfwD3hH7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161854316"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 04:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufdKK-000LwR-1u;
	Sat, 26 Jul 2025 11:44:32 +0000
Date: Sat, 26 Jul 2025 19:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:convert-9p 3/4] fs/9p/v9fs.h:111:21: error: invalid use of
 undefined type 'struct v9fs_session_info'
Message-ID: <202507261947.4en5Pxdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git convert-9p
head:   4a72a2292eafad1371bc73defec4fdea64ea6de7
commit: 169a645279f9f90fa48436e556fe2817db2896a4 [3/4] 9p: create a v9fs_context structure to hold parsed options
config: loongarch-randconfig-001-20250725 (https://download.01.org/0day-ci/archive/20250726/202507261947.4en5Pxdy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261947.4en5Pxdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261947.4en5Pxdy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/9p/cache.c:16:
>> fs/9p/v9fs.h:108:64: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     108 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                                ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h: In function 'v9fs_session_cache':
>> fs/9p/v9fs.h:111:21: error: invalid use of undefined type 'struct v9fs_session_info'
     111 |         return v9ses->fscache;
         |                     ^~
   fs/9p/v9fs.h: At top level:
   fs/9p/v9fs.h:120:41: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     120 | struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
         |                                         ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:122:39: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     122 | extern void v9fs_session_close(struct v9fs_session_info *v9ses);
         |                                       ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:123:40: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     123 | extern void v9fs_session_cancel(struct v9fs_session_info *v9ses);
         |                                        ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:124:46: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     124 | extern void v9fs_session_begin_cancel(struct v9fs_session_info *v9ses);
         |                                              ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:133:49: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     133 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                                 ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h:140:54: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     140 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                                      ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h: In function 'v9fs_proto_dotu':
   fs/9p/v9fs.h:163:21: error: invalid use of undefined type 'struct v9fs_session_info'
     163 |         return v9ses->flags & V9FS_PROTO_2000U;
         |                     ^~
   fs/9p/v9fs.h: In function 'v9fs_proto_dotl':
   fs/9p/v9fs.h:168:21: error: invalid use of undefined type 'struct v9fs_session_info'
     168 |         return v9ses->flags & V9FS_PROTO_2000L;
         |                     ^~
   fs/9p/v9fs.h: In function 'v9fs_get_inode_from_fid':
>> fs/9p/v9fs.h:184:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     184 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 0);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:140:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     140 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> fs/9p/v9fs.h:186:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     186 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 0);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:133:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     133 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h: In function 'v9fs_get_new_inode_from_fid':
   fs/9p/v9fs.h:202:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Wincompatible-pointer-types]
     202 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 1);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:140:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     140 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h:204:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Wincompatible-pointer-types]
     204 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 1);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:133:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     133 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/cache.c: In function 'v9fs_cache_session_get_cookie':
>> fs/9p/cache.c:26:41: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                         ^~
   fs/9p/cache.c:26:60: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                                            ^~
   fs/9p/cache.c:45:14: error: invalid use of undefined type 'struct v9fs_session_info'
      45 |         v9ses->fscache = vcookie;
         |              ^~
   fs/9p/cache.c: In function 'v9fs_cache_inode_get_cookie':
>> fs/9p/cache.c:66:59: error: passing argument 1 of 'v9fs_session_cache' from incompatible pointer type [-Wincompatible-pointer-types]
      66 |                 fscache_acquire_cookie(v9fs_session_cache(v9ses),
         |                                                           ^~~~~
         |                                                           |
         |                                                           struct v9fs_session_info *
   fs/9p/v9fs.h:108:83: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     108 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~


vim +111 fs/9p/v9fs.h

eb497943fa2158 David Howells       2021-11-02  107  
24e42e32d347f0 David Howells       2020-11-18 @108  static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
24e42e32d347f0 David Howells       2020-11-18  109  {
24e42e32d347f0 David Howells       2020-11-18  110  #ifdef CONFIG_9P_FSCACHE
24e42e32d347f0 David Howells       2020-11-18 @111  	return v9ses->fscache;
24e42e32d347f0 David Howells       2020-11-18  112  #else
24e42e32d347f0 David Howells       2020-11-18  113  	return NULL;
24e42e32d347f0 David Howells       2020-11-18  114  #endif
24e42e32d347f0 David Howells       2020-11-18  115  }
24e42e32d347f0 David Howells       2020-11-18  116  
24e42e32d347f0 David Howells       2020-11-18  117  
c4fac910045699 David Howells       2017-07-05  118  extern int v9fs_show_options(struct seq_file *m, struct dentry *root);
c4fac910045699 David Howells       2017-07-05  119  
772712c581e7ab Sohaib Mohamed      2021-10-01  120  struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
772712c581e7ab Sohaib Mohamed      2021-10-01  121  				 const char *dev_name, char *data);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  122  extern void v9fs_session_close(struct v9fs_session_info *v9ses);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  123  extern void v9fs_session_cancel(struct v9fs_session_info *v9ses);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  124  extern void v9fs_session_begin_cancel(struct v9fs_session_info *v9ses);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  125  extern struct dentry *v9fs_vfs_lookup(struct inode *dir, struct dentry *dentry,
00cd8dd3bf95f2 Al Viro             2012-06-10  126  				      unsigned int flags);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  127  extern int v9fs_vfs_unlink(struct inode *i, struct dentry *d);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  128  extern int v9fs_vfs_rmdir(struct inode *i, struct dentry *d);
e18275ae55e07a Christian Brauner   2023-01-13  129  extern int v9fs_vfs_rename(struct mnt_idmap *idmap,
549c7297717c32 Christian Brauner   2021-01-21  130  			   struct inode *old_dir, struct dentry *old_dentry,
1cd66c93ba8cdb Miklos Szeredi      2016-09-27  131  			   struct inode *new_dir, struct dentry *new_dentry,
1cd66c93ba8cdb Miklos Szeredi      2016-09-27  132  			   unsigned int flags);
be2ca382537208 Dominique Martinet  2024-10-24  133  extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
be2ca382537208 Dominique Martinet  2024-10-24  134  					 struct p9_fid *fid,
be2ca382537208 Dominique Martinet  2024-10-24  135  					 struct super_block *sb, int new);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  136  extern const struct inode_operations v9fs_dir_inode_operations_dotl;
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  137  extern const struct inode_operations v9fs_file_inode_operations_dotl;
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  138  extern const struct inode_operations v9fs_symlink_inode_operations_dotl;
bc899ee1c898e5 David Howells       2021-06-29  139  extern const struct netfs_request_ops v9fs_req_ops;
be2ca382537208 Dominique Martinet  2024-10-24  140  extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
be2ca382537208 Dominique Martinet  2024-10-24  141  					      struct p9_fid *fid,
be2ca382537208 Dominique Martinet  2024-10-24  142  					      struct super_block *sb, int new);
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  143  
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  144  /* other default globals */
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  145  #define V9FS_PORT	564
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  146  #define V9FS_DEFUSER	"nobody"
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  147  #define V9FS_DEFANAME	""
76ed23a5d703d9 Eric W. Biederman   2013-01-30  148  #define V9FS_DEFUID	KUIDT_INIT(-2)
76ed23a5d703d9 Eric W. Biederman   2013-01-30  149  #define V9FS_DEFGID	KGIDT_INIT(-2)
9e82cf6a802a72 Eric Van Hensbergen 2005-09-09  150  
bd238fb431f319 Latchesar Ionkov    2007-07-10  151  static inline struct v9fs_session_info *v9fs_inode2v9ses(struct inode *inode)
bd238fb431f319 Latchesar Ionkov    2007-07-10  152  {
772712c581e7ab Sohaib Mohamed      2021-10-01  153  	return inode->i_sb->s_fs_info;
bd238fb431f319 Latchesar Ionkov    2007-07-10  154  }
2405669b253670 Latchesar Ionkov    2007-10-17  155  
30d61efe118cad Al Viro             2025-01-05  156  static inline struct v9fs_session_info *v9fs_dentry2v9ses(const struct dentry *dentry)
42869c8adae723 Aneesh Kumar K.V    2011-03-08  157  {
42869c8adae723 Aneesh Kumar K.V    2011-03-08  158  	return dentry->d_sb->s_fs_info;
42869c8adae723 Aneesh Kumar K.V    2011-03-08  159  }
42869c8adae723 Aneesh Kumar K.V    2011-03-08  160  
dd6102fbd91788 Sripathi Kodi       2010-03-05  161  static inline int v9fs_proto_dotu(struct v9fs_session_info *v9ses)
2405669b253670 Latchesar Ionkov    2007-10-17  162  {
dd6102fbd91788 Sripathi Kodi       2010-03-05 @163  	return v9ses->flags & V9FS_PROTO_2000U;
dd6102fbd91788 Sripathi Kodi       2010-03-05  164  }
dd6102fbd91788 Sripathi Kodi       2010-03-05  165  
dd6102fbd91788 Sripathi Kodi       2010-03-05  166  static inline int v9fs_proto_dotl(struct v9fs_session_info *v9ses)
dd6102fbd91788 Sripathi Kodi       2010-03-05  167  {
45bc21edb52fa7 Sripathi Kodi       2010-03-08  168  	return v9ses->flags & V9FS_PROTO_2000L;
2405669b253670 Latchesar Ionkov    2007-10-17  169  }
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  170  
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  171  /**
a78ce05d5d3422 Aneesh Kumar K.V    2011-02-28  172   * v9fs_get_inode_from_fid - Helper routine to populate an inode by
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  173   * issuing a attribute request
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  174   * @v9ses: session information
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  175   * @fid: fid to issue attribute request for
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  176   * @sb: superblock on which to create inode
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  177   *
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  178   */
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  179  static inline struct inode *
a78ce05d5d3422 Aneesh Kumar K.V    2011-02-28  180  v9fs_get_inode_from_fid(struct v9fs_session_info *v9ses, struct p9_fid *fid,
f69999b5f9b444 Dominique Martinet  2024-10-24  181  			struct super_block *sb)
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  182  {
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  183  	if (v9fs_proto_dotl(v9ses))
be2ca382537208 Dominique Martinet  2024-10-24 @184  		return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 0);
53c06f4e0a4621 Aneesh Kumar K.V    2011-01-10  185  	else
be2ca382537208 Dominique Martinet  2024-10-24 @186  		return v9fs_inode_from_fid(v9ses, fid, sb, 0);
be2ca382537208 Dominique Martinet  2024-10-24  187  }
be2ca382537208 Dominique Martinet  2024-10-24  188  

:::::: The code at line 111 was first introduced by commit
:::::: 24e42e32d347f0787a6f99aeb590f3aaa7221093 9p: Use fscache indexing rewrite and reenable caching

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
