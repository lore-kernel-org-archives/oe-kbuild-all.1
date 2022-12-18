Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFC333CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Dec 2022 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671379883; x=1702915883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xU9Q/nRK9eYvE3dsnuG4cvcKtpjrd00zVYhFIq+Tong=;
  b=KNjkgkvugv0PBix3dozG+Q3dtrL9WqFsf3o8sYGUJkC7ILNsmUwL9o0o
   ON8fC2HQPAss015NIaAE+OtSptHVBNonbXrb0ChGKgBm/Z/VZl69chbI+
   cHN05WrC19+V317afWKjRE4zGLjTFF+8eAY/AhIoNV14+bkyYuj8UjWrA
   NQCsLr6M7sWA1PG0vi00sQmjmzehd8m8NK1vq+6SZBUD+NoMOcVkTNXRd
   stih9cl3rUrHFr0Iid531UZmYIVp88M9KzzZ/QYkWFRdb7qxnIAo9kgKj
   dcaL4YyQD6hjm8pXHhUDKGfNIt0Gg5Dk/LJAX8/j4a2/8p6jqdV9h3hpp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="405466395"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="405466395"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2022 08:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="600437493"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="600437493"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Dec 2022 08:11:21 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6wG0-0008M4-2G;
	Sun, 18 Dec 2022 16:11:20 +0000
Date: Mon, 19 Dec 2022 00:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 398/556]
 fs/xfs/libxfs/xfs_rtbitmap.c:1261:1: warning: syntax error: keyword 'while'
 is not allowed in global scope [syntaxError]
Message-ID: <202212190037.ah1PqTxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   957abd6304af2759b5e5564977f40272364cf712
commit: d73839970a529fa279c0c55dfd45777b8aed3693 [398/556] xfs: refactor realtime inode locking
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d73839970a529fa279c0c55dfd45777b8aed3693
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/xfs_qm_syscalls.c:394:2: warning: Redundant assignment of 'dqp' to itself. [selfAssignment]
    xfs_qm_dqrele(dqp);
    ^
>> fs/xfs/scrub/refcount.c:194:13: warning: Uninitialized variable: frag->rm [uninitvar]
     if (frag->rm.rm_startblock < bno)
               ^
   fs/xfs/scrub/refcount.c:177:16: note: Assuming condition is false
    if (target_nr == 0)
                  ^
   fs/xfs/scrub/refcount.c:194:13: note: Uninitialized variable: frag->rm
     if (frag->rm.rm_startblock < bno)
               ^
--
>> fs/xfs/xfs_itable.c:82:8: warning: Redundant initialization for 'error'. The initialized value is overwritten before it is read. [redundantInitialization]
    error = xfs_iget(mp, tp, ino,
          ^
   fs/xfs/xfs_itable.c:78:14: note: error is initialized
    int   error = -EINVAL;
                ^
   fs/xfs/xfs_itable.c:82:8: note: error is overwritten
    error = xfs_iget(mp, tp, ino,
          ^
>> fs/xfs/libxfs/xfs_rtbitmap.c:1261:1: warning: syntax error: keyword 'while' is not allowed in global scope [syntaxError]
   xfs_rtbitmap_lock(
   ^
   fs/xfs/libxfs/xfs_format.h:450:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_format.h:450:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
--
>> fs/xfs/scrub/attr.c:304:11: warning: Parameter 'buf_end' can be declared as pointer to const [constParameter]
    char    *buf_end,
             ^
--
>> fs/xfs/scrub/ialloc.c:335:27: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     freemask_ok = irec_free ^ !!(dip->di_mode);
                             ^
>> fs/xfs/scrub/bmap.c:612:42: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if ((sbcri->whichfork == XFS_ATTR_FORK) ^
                                            ^
>> fs/xfs/scrub/xfile.c:201:10: warning: Parameter 'kaddr' can be declared as pointer to const [constParameter]
    void   *kaddr)
            ^

vim +/while +1261 fs/xfs/libxfs/xfs_rtbitmap.c

  1254	
  1255	/*
  1256	 * Lock both realtime free space metadata inodes for a freespace update.  If a
  1257	 * transaction is given, the inodes will be joined to the transaction and the
  1258	 * ILOCKs will be released on transaction commit.
  1259	 */
  1260	void
> 1261	xfs_rtbitmap_lock(
  1262		struct xfs_trans	*tp,
  1263		struct xfs_mount	*mp)
  1264	{
  1265		xfs_ilock(mp->m_rbmip, XFS_ILOCK_EXCL | XFS_ILOCK_RTBITMAP);
  1266		if (tp)
  1267			xfs_trans_ijoin(tp, mp->m_rbmip, XFS_ILOCK_EXCL);
  1268	
  1269		xfs_ilock(mp->m_rsumip, XFS_ILOCK_EXCL | XFS_ILOCK_RTSUM);
  1270		if (tp)
  1271			xfs_trans_ijoin(tp, mp->m_rsumip, XFS_ILOCK_EXCL);
  1272	}
  1273	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
