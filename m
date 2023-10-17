Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0615B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 04:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXsq5S3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697518370; x=1729054370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VtwMXTyoLVVzH6JcIOheDjTl9BCyvRAGAnC46L7t1Jk=;
  b=TXsq5S3y+oeoBMiq26j/f0ynDzltDsMkV9S0CcrkiedlIs2m6mxsktd2
   jeTeRqzH/FVD5nI9QjvqkRALpiPtdA0AIRgxClmxhaBPJ8BIKUtAmyhZH
   BRciOR9u2Yx64THcmTJW5gz/OMYFbrPmffmKWK6a0LFYsRTgbQqqj+0VH
   JnFvTWSVN2nVluxQOqw04qldbsMJGz0l9ohEozUO7UZAmKZzUkYFswsy2
   i1mqBXNODLYjyEWjaAExcVyUSm67k8xEXzivoKcE8f1VOhaB7FUpakvv4
   8ADZV556kfaeQjbDbTHRbO7HFODUiqhAagKMTIde+1GSC8VzzvPB3ygpz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376066149"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="376066149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 21:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3926569"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2023 21:52:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsc4U-00091z-2a;
	Tue, 17 Oct 2023 04:52:46 +0000
Date: Tue, 17 Oct 2023 12:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rt-unit-conversions-6.7 6/21] checkpatch:
 WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Message-ID: <202310171209.DY2nkJRv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rt-unit-conversions-6.7
head:   f60b96941aa23f71e50fb4d64e9a789e93146d9b
commit: d37145ff1fc195172fdf7e3d7acc5417bdf5fa8c [6/21] xfs: rt stubs should return negative errnos when rt disabled
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171209.DY2nkJRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171209.DY2nkJRv-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#35: FILE: fs/xfs/xfs_rtalloc.h:144:
+# define xfs_rtallocate_extent(t,b,min,max,l,f,p,rb)	(-ENOSYS)
                                                 ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#36: FILE: fs/xfs/xfs_rtalloc.h:145:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#36: FILE: fs/xfs/xfs_rtalloc.h:145:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#36: FILE: fs/xfs/xfs_rtalloc.h:145:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)
                               ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#37: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#37: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#37: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)
                                ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#38: FILE: fs/xfs/xfs_rtalloc.h:147:
+# define xfs_rtpick_extent(m,t,l,rb)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/xfs/xfs_rtalloc.h:147:
+# define xfs_rtpick_extent(m,t,l,rb)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/xfs/xfs_rtalloc.h:147:
+# define xfs_rtpick_extent(m,t,l,rb)			(-ENOSYS)
                               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/xfs/xfs_rtalloc.h:147:
+# define xfs_rtpick_extent(m,t,l,rb)			(-ENOSYS)
                                 ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#39: FILE: fs/xfs/xfs_rtalloc.h:148:
+# define xfs_growfs_rt(mp,in)				(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#39: FILE: fs/xfs/xfs_rtalloc.h:148:
+# define xfs_growfs_rt(mp,in)				(-ENOSYS)
                          ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#40: FILE: fs/xfs/xfs_rtalloc.h:149:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                           ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#41: FILE: fs/xfs/xfs_rtalloc.h:150:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#41: FILE: fs/xfs/xfs_rtalloc.h:150:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#41: FILE: fs/xfs/xfs_rtalloc.h:150:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#41: FILE: fs/xfs/xfs_rtalloc.h:150:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                     ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#42: FILE: fs/xfs/xfs_rtalloc.h:151:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#42: FILE: fs/xfs/xfs_rtalloc.h:151:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#42: FILE: fs/xfs/xfs_rtalloc.h:151:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#42: FILE: fs/xfs/xfs_rtalloc.h:151:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#42: FILE: fs/xfs/xfs_rtalloc.h:151:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                               ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#44: FILE: fs/xfs/xfs_rtalloc.h:153:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#44: FILE: fs/xfs/xfs_rtalloc.h:153:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#44: FILE: fs/xfs/xfs_rtalloc.h:153:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#44: FILE: fs/xfs/xfs_rtalloc.h:153:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#44: FILE: fs/xfs/xfs_rtalloc.h:153:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                            ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#54: FILE: fs/xfs/xfs_rtalloc.h:165:
+# define xfs_rtmount_inodes(m)  (((mp)->m_sb.sb_rblocks == 0)? 0 : (-ENOSYS))

ERROR:SPACING: spaces required around that '?' (ctx:VxW)
#54: FILE: fs/xfs/xfs_rtalloc.h:165:
+# define xfs_rtmount_inodes(m)  (((mp)->m_sb.sb_rblocks == 0)? 0 : (-ENOSYS))
                                                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
