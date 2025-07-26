Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D531A08BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753543497; cv=none; b=uET1pMZVL4ZdJh33gMFry1yy9weIvAvdeeFx6G3EA/BIqBbToLtKIrV7R7hR4dw27zNSQsK7byLObm/9m4WegEa8XKgnFxwRddqWBuA2JnjstNV0TzW7lFGngi0kzcXKO5YZxdS7iDf7s/v+/PVgQ5hUShVqMvKI+0EJlOi8BFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753543497; c=relaxed/simple;
	bh=BaUDfgrkIxkKxl6XuU0tj2iMLaARMm4tMu18lTdVYp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXaMSvR0usEldbqtt9Hl8TRT7HWzn92yvURnER51T/taVrku2HU19a008XOGsDuVAlZyDi2F2nF+Bt26ieXmp1ZoqwXJvCi1Q1ZrH1x6a5LJaPg7t+lPvx0r6HxUlHNZ56q0ogrWx1t3W/x0Vbwdx64rV7kdgI9kKQP8aWOsgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQD2dglX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQD2dglX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753543496; x=1785079496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaUDfgrkIxkKxl6XuU0tj2iMLaARMm4tMu18lTdVYp8=;
  b=nQD2dglXpY5lGj44aHKq0Wkq2wHDn1jzEqwu5OWwPRPdb7l07itusItW
   +NBfBYg0R0z2Hhv+8VZyiy1LhMxgGVuqd7e5djmRawMNHVAeVPpmOx65H
   J3zIbTijQctrbVa83bD/Fvrd79Kcy7PY61cmVppRfQB2VpTHbL5Ag4z32
   Yuy5CKkVjcEwQ8b6TEJwBBrTvyJmHt1BvXLXK8Qi7hT84rVSchQOd2s/F
   njBn0Yc0sLCTwCn1WTjvW+Wg+6zt9FiYknV7KONZ4xkrifCwXwKmH0/QP
   5kqbp3TCIAgbrPKBHzHwuD6QnjYW3NR/QAbWKkJD+DYi34AsSEX5qIY1l
   Q==;
X-CSE-ConnectionGUID: TEp/h1mBTVyx/QxeU+mgGw==
X-CSE-MsgGUID: aUxAcQZjQSyOso+EMdNRdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58475563"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58475563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 08:24:55 -0700
X-CSE-ConnectionGUID: BqjgulljTY2WI7AQifORXg==
X-CSE-MsgGUID: tLfWHppqSqy1XeIZdBgzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="185280648"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jul 2025 08:24:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufglX-000M41-0Z;
	Sat, 26 Jul 2025 15:24:51 +0000
Date: Sat, 26 Jul 2025 23:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:convert-9p 3/4] fs/9p/v9fs.h:115:1: warning: control
 reaches end of non-void function
Message-ID: <202507262357.Fq3Q0AF9-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250726/202507262357.Fq3Q0AF9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262357.Fq3Q0AF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262357.Fq3Q0AF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/9p/cache.c:16:
   fs/9p/v9fs.h:108:64: warning: 'struct v9fs_session_info' declared inside parameter list will not be visible outside of this definition or declaration
     108 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                                ^~~~~~~~~~~~~~~~~
   fs/9p/v9fs.h: In function 'v9fs_session_cache':
   fs/9p/v9fs.h:111:21: error: invalid use of undefined type 'struct v9fs_session_info'
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
   fs/9p/v9fs.h:184:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Werror=incompatible-pointer-types]
     184 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 0);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:140:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     140 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h:186:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     186 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 0);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:133:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     133 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h: In function 'v9fs_get_new_inode_from_fid':
   fs/9p/v9fs.h:202:49: error: passing argument 1 of 'v9fs_inode_from_fid_dotl' from incompatible pointer type [-Werror=incompatible-pointer-types]
     202 |                 return v9fs_inode_from_fid_dotl(v9ses, fid, sb, 1);
         |                                                 ^~~~~
         |                                                 |
         |                                                 struct v9fs_session_info *
   fs/9p/v9fs.h:140:73: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     140 | extern struct inode *v9fs_inode_from_fid_dotl(struct v9fs_session_info *v9ses,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h:204:44: error: passing argument 1 of 'v9fs_inode_from_fid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     204 |                 return v9fs_inode_from_fid(v9ses, fid, sb, 1);
         |                                            ^~~~~
         |                                            |
         |                                            struct v9fs_session_info *
   fs/9p/v9fs.h:133:68: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     133 | extern struct inode *v9fs_inode_from_fid(struct v9fs_session_info *v9ses,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/cache.c: In function 'v9fs_cache_session_get_cookie':
   fs/9p/cache.c:26:41: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                         ^~
   fs/9p/cache.c:26:60: error: invalid use of undefined type 'struct v9fs_session_info'
      26 |                          dev_name, v9ses->cachetag ?: v9ses->aname);
         |                                                            ^~
   fs/9p/cache.c:45:14: error: invalid use of undefined type 'struct v9fs_session_info'
      45 |         v9ses->fscache = vcookie;
         |              ^~
   fs/9p/cache.c: In function 'v9fs_cache_inode_get_cookie':
   fs/9p/cache.c:66:59: error: passing argument 1 of 'v9fs_session_cache' from incompatible pointer type [-Werror=incompatible-pointer-types]
      66 |                 fscache_acquire_cookie(v9fs_session_cache(v9ses),
         |                                                           ^~~~~
         |                                                           |
         |                                                           struct v9fs_session_info *
   fs/9p/v9fs.h:108:83: note: expected 'struct v9fs_session_info *' but argument is of type 'struct v9fs_session_info *'
     108 | static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fs/9p/v9fs.h: In function 'v9fs_session_cache':
>> fs/9p/v9fs.h:115:1: warning: control reaches end of non-void function [-Wreturn-type]
     115 | }
         | ^
   cc1: some warnings being treated as errors


vim +115 fs/9p/v9fs.h

eb497943fa2158 David Howells 2021-11-02  107  
24e42e32d347f0 David Howells 2020-11-18  108  static inline struct fscache_volume *v9fs_session_cache(struct v9fs_session_info *v9ses)
24e42e32d347f0 David Howells 2020-11-18  109  {
24e42e32d347f0 David Howells 2020-11-18  110  #ifdef CONFIG_9P_FSCACHE
24e42e32d347f0 David Howells 2020-11-18  111  	return v9ses->fscache;
24e42e32d347f0 David Howells 2020-11-18  112  #else
24e42e32d347f0 David Howells 2020-11-18  113  	return NULL;
24e42e32d347f0 David Howells 2020-11-18  114  #endif
24e42e32d347f0 David Howells 2020-11-18 @115  }
24e42e32d347f0 David Howells 2020-11-18  116  

:::::: The code at line 115 was first introduced by commit
:::::: 24e42e32d347f0787a6f99aeb590f3aaa7221093 9p: Use fscache indexing rewrite and reenable caching

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
