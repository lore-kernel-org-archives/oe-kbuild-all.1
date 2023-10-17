Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC293D86
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+h8FSv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697518373; x=1729054373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1iNYkNw9gKeOYeYiRBbYVLunoudlhoWYiWfn+IDBHeU=;
  b=g+h8FSv8c3EV+dlI5lmn7/riW5THMFKnSmoM3ZZqqVAw5EjyaAn3HVjs
   iwz7PkYhzAdYlrqudqVp7M/PZmo6P1cgt+polJZHcH5V8CyuG/4OXGKvu
   MfY2d93A7SfkwAPH5/nI+d7RHijbd8YojWfVu+xjueLeizWOE1UB4lrGD
   QePIsHcC+K7WMVoRJJbFd7A9gC/9+glqd3+87AsOuqWDyhQc4SouCj++1
   8mfkXI8Kph+05F4Mt33WvFNzQz//IKfBeGILXixU4zoDhSNscLMBLGxFa
   OiwFKAoytO+GtDuJE0N3c1ye9sNS9/Go+VtQC3TV5zXvYpJRPVthdOPw2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376066150"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="376066150"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 21:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3926570"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2023 21:52:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsc4U-000921-2e;
	Tue, 17 Oct 2023 04:52:46 +0000
Date: Tue, 17 Oct 2023 12:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rt-unit-conversions-6.7 9/21] checkpatch:
 WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310171241.uyp1TjE9-lkp@intel.com>
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
commit: 615077bc8c1d4ab798aa90ed8dd872a652e13481 [9/21] xfs: move the xfs_rtbitmap.c declarations to xfs_rtbitmap.h
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171241.uyp1TjE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171241.uyp1TjE9-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#55: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING:LINE_SPACING: Missing a blank line after declarations
#122: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:68:
+	xfs_rtblock_t		bno,	/* starting block number to free */
+	xfs_extlen_t		len);	/* length of extent freed */

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#128: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:74:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:74:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:74:
+# define xfs_rtfree_extent(t,b,l)			(-ENOSYS)
                               ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#129: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:75:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#129: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:75:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#129: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:75:
+# define xfs_rtfree_blocks(t,rb,rl)			(-ENOSYS)
                                ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:76:
+# define xfs_rtalloc_query_range(m,t,l,h,f,p)		(-ENOSYS)
                                           ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#131: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:77:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#131: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:77:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#131: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:77:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#131: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:77:
+# define xfs_rtalloc_query_all(m,t,f,p)			(-ENOSYS)
                                     ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#132: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:78:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:78:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:78:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:78:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:78:
+# define xfs_rtbuf_get(m,t,b,i,p)			(-ENOSYS)
                               ^

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#133: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:79:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#133: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:79:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#133: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:79:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#133: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:79:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#133: FILE: fs/xfs/libxfs/xfs_rtbitmap.h:79:
+# define xfs_rtalloc_extent_is_free(m,t,s,l,i)		(-ENOSYS)
                                            ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
