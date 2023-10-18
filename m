Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AC28F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbL/Jlpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697602788; x=1729138788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ss7/bwtI43Ct/0hBtG2OI+cr+vm//JmgYeY4b5fNXzY=;
  b=IbL/JlpvY7QsqKbmCA5eT+0ey7JD8olJOuJqEQ503Q40Xv9scl+R35gW
   NtC3k8jt9PseLSR3Hwn+Y6vEl+UND5tFI7UPKEjuGEgh/DLVJUSkEkZbB
   KIZ8edWfjB07fIGhzjm7RUmHeihfbMOo05OpliZg7zhJH/1vA+t2ZFkdv
   /8x3DRe6BzD+P2XVOG8bxj+WUXDhSVb1jqAZWbR6BzhrDAiQZppnq3JB5
   9XKlCmmHXEndwkd7D+kHTpYWadq10iGRt2pZLUF1sIT38Edt82vf98Qcd
   Ec9MhDZDuEy/t5k8kjT6A7viv0BtjvkAsOtoOPt2t1eopMw3D9qJAwCBB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="4530577"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4530577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 21:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="930008808"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="930008808"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 21:19:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsy23-000AUh-29;
	Wed, 18 Oct 2023 04:19:43 +0000
Date: Wed, 18 Oct 2023 12:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rtbitmap-accessors-6.7 12/28] checkpatch:
 WARNING: Missing a blank line after declarations
Message-ID: <202310181234.5Q4nj3NB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rtbitmap-accessors-6.7
head:   bbfd98d868d78ca1a2e579e8a141932302fb8503
commit: 2d5f216b77e33f9b503bd42998271da35d4b7055 [12/28] xfs: convert rt extent numbers to xfs_rtxnum_t
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181234.5Q4nj3NB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181234.5Q4nj3NB-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#36: FILE: fs/xfs/libxfs/xfs_rtbitmap.c:100:
+	xfs_rtxnum_t	limit,		/* last rtext to look at */
+	xfs_rtxnum_t	*rtx)		/* out: start rtext found */

WARNING:LINE_SPACING: Missing a blank line after declarations
#98: FILE: fs/xfs/libxfs/xfs_rtbitmap.c:275:
+	xfs_rtxnum_t	limit,		/* last rtext to look at */
+	xfs_rtxnum_t	*rtx)		/* out: start rtext found */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
