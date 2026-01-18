Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79E500944
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768718832; cv=none; b=DLNFpSIeGkd7xYLqKVZVrndwtjgR0yEqre4FodeJdVh/xok6re2mqWOBY5ZpXJL7JdmxsWaR1kjgXvQ4qSoPVQstc2yLhCMP7eK70A33rNK5FWoGCcalnPl+819/5XJ5bhduiudOHwNyZPHjiHLVOFL/+8tOJSpwHLC6M9HFcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768718832; c=relaxed/simple;
	bh=jMWnMuJWKCMsewIFt2DE/VRVMZM4Zdj/Nsa1eQToxKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vwc0vJdMcDv8PCo6YXKnapxCNowSiRP+SccyOzalQKkJJ6drPNs4ctNxC0+OcD0tPRoGOEn/drDTi+6gm/KCrEON2HVKI5OjqBDDRlrQVDY2t095CmIccKDzSgN6EIHyriArL1i/8brmy6kRsdNdxOYGR7/5uNdgziO5nC5ByMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpHfmV3m; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpHfmV3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768718830; x=1800254830;
  h=date:from:to:cc:subject:message-id;
  bh=jMWnMuJWKCMsewIFt2DE/VRVMZM4Zdj/Nsa1eQToxKo=;
  b=BpHfmV3mJWxL8QIGwzgXhSMtcRWgaONBrV4hKkwg6tteI2ca0Dd4OhJc
   91SyDAD1CZl4Pyzm8qfwGtfGaJMpN0Mv3W8dnMVl4V6N2al4DS31dXOud
   vhAIsqtaxJvoU4WysZt3ttJq+4vgrxKOq/MtbYxgQhpkmGtuCpf8BWJ3l
   WJfN0xy8HYuG6XMTua94DrTAvfMkbvTK6cZFeNAqq+OsPIBE7bkjR/S0s
   Pr0pnL8uozFDZDVDYjhv4JuvXluYm6fzPtKjVYmJBsKvDEk5ufnc31q+X
   dH40l8kiKK3X4cCDxcitQsXs8chgOmK+FV8VAx7/41mNYe4XoF6LJr25A
   g==;
X-CSE-ConnectionGUID: Uptv+R/QQtG8oW7ZDvfkRg==
X-CSE-MsgGUID: AG4GSxeUQ2GDCEzzecBuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70017693"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="70017693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:47:10 -0800
X-CSE-ConnectionGUID: pUQjQjPFQ7WZ/lmXkCR+wQ==
X-CSE-MsgGUID: 9eslF7JgSuKXQudFNowDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="228534559"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2026 22:47:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhMZ0-00000000Mk4-2Bjg;
	Sun, 18 Jan 2026 06:47:06 +0000
Date: Sun, 18 Jan 2026 14:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:xfs_defer_unlinked 4/6] fs/xfs/xfs_trans.h:245:17:
 warning: declaration of 'enum xfs_blft' will not be visible outside of this
 function
Message-ID: <202601181424.sInmm3MI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux xfs_defer_unlinked
head:   253cf31b448c0fbe81f61e6daec136a5ea576af7
commit: 6ee10cc8ff2ac949791cf8be928774c96b6ad833 [4/6] xfs: factor out unlinked inode list processing helpers
config: s390-randconfig-002-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181424.sInmm3MI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181424.sInmm3MI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181424.sInmm3MI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_iunlink.c:19:
>> fs/xfs/xfs_trans.h:245:17: warning: declaration of 'enum xfs_blft' will not be visible outside of this function [-Wvisibility]
     245 |                                        enum xfs_blft);
         |                                             ^
   1 warning generated.


vim +245 fs/xfs/xfs_trans.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  243  
a4fbe6ab1e7abe Dave Chinner   2013-10-23  244  void		xfs_trans_buf_set_type(struct xfs_trans *, struct xfs_buf *,
a4fbe6ab1e7abe Dave Chinner   2013-10-23 @245  				       enum xfs_blft);
a4fbe6ab1e7abe Dave Chinner   2013-10-23  246  void		xfs_trans_buf_copy_type(struct xfs_buf *dst_bp,
a4fbe6ab1e7abe Dave Chinner   2013-10-23  247  					struct xfs_buf *src_bp);
a4fbe6ab1e7abe Dave Chinner   2013-10-23  248  

:::::: The code at line 245 was first introduced by commit
:::::: a4fbe6ab1e7abecf42b75e9c73701ed33b4ab03b xfs: decouple inode and bmap btree header files

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
