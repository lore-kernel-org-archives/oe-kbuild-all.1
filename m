Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C62567E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcQJO7VG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697601399; x=1729137399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k30NqwCQCHcX3ez5duxIQYgL0Rk3CkEHEm59M4i7mG0=;
  b=DcQJO7VGz2wkp8uy3cKLsYpP0YbacW2fBIQtaMnqwKVzxXgV5NuW0MdL
   scXrG2kZMoDB4FLcAYCzP72CjqFfqP99qWpgBlRZomg9/Ps1B2SjGPKAM
   oF4uCwCqrKMsEFhu3bKMT3SvudDQrsrzpPvAe12rAIeC0BIQkYj+ZMvmp
   MGoWDNggvUOmIJJXg42/MQvlF8LOe+XbDOpT976x7To/8p5g3sQhJhO22
   CMyHKxMGnaeGepHEvURCYF4k4bsh5m89508wO9rZA7GkUoZDmWKd+VD97
   dsTF3ECUoNIqK5EmCNYo0HsF1SWm1yfU0ac/MO/5QoM7OnoSOf3kmwCSv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452403078"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452403078"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756399744"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="756399744"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Oct 2023 20:56:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsxfe-000ATr-2A;
	Wed, 18 Oct 2023 03:56:34 +0000
Date: Wed, 18 Oct 2023 11:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rtbitmap-accessors-6.7 4/28] checkpatch:
 WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Message-ID: <202310181116.NWisZvUG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rtbitmap-accessors-6.7
head:   bbfd98d868d78ca1a2e579e8a141932302fb8503
commit: c2988eb5cff75c02bc57e02c323154aa08f55b78 [4/28] xfs: rt stubs should return negative errnos when rt disabled
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181116.NWisZvUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181116.NWisZvUG-lkp@intel.com/

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
