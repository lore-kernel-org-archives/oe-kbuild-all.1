Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29CB249EB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745027561; cv=none; b=OGr3IjEB9hmPjJnNsjkP3TJTQBVH5VPSydNVWMvMMZcFl5F2K99qJTYvj9Ws3xCESXRuVxvZFQKneDDfRdHru5oarFigJjQzF2SjtMzxswTusfpptnt3AebR7AqPh8LRAJ9G6yIsm6WDTVz/oWD90h9mZeP0mKoakaP2eYQ5E7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745027561; c=relaxed/simple;
	bh=ZvMR76VzAgpIHdKAcaXNlr4ErI3XtSYJTIj4aEGdm2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSBOi7bMAY3abgkZH/1TeVTAhfnLG28jLR1sHK6ZZ6AWfZF7naYrpzIRC/l8rMdRb0dCLjYc4xxdfShemz8y276h1JeX40Z8/LrVjo1oeobgSAipFVwX0NtDzmoYRc/cDTTNOCBjG9h1l+A4rgkIDtcMUm8FXJSgTA99S5yy5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezQjqyas; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezQjqyas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745027559; x=1776563559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZvMR76VzAgpIHdKAcaXNlr4ErI3XtSYJTIj4aEGdm2Q=;
  b=ezQjqyas0qWEZy4EbwvJF5SX3ENrjCYW6r7utwAiK5tMUdOnFzul1tQ8
   2ueuNjPt9xCaGH+Gba3eqi3yKGvmMuaSdwQpCHBTB1BCoTdQdZivKwBwM
   CILOz/TOnSxXYN6M/qUbXGJD6FTWBfa8Hn2wvF/iQW1k5VQFV0/2PTXvv
   eNJxN2kWJVN0kMZc3LJNCFcpD0CKWK5IhjTkzxf3OUpLqiS5iT+x/Pud7
   VNtdWOh9jbPuWNdeC0k6oBEORIyiKBB92Zfdu3RGagT1ViZ3cAh08PpbJ
   qELrtbK40QmSpeoMSnDDSRVEZ+LJYUP/sFlA6nt3Ab8R/b29aG1DoXIOt
   w==;
X-CSE-ConnectionGUID: /KTmxjgcRzSsuNqzXqpy5w==
X-CSE-MsgGUID: wanc42t/SsO5xd/Gcyf0oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50488834"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="50488834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 18:52:38 -0700
X-CSE-ConnectionGUID: wXEIEZFyQ8iyXaeQ8M3U9A==
X-CSE-MsgGUID: 53G0fY5sSMmT2cDd0YFZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="131201334"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2025 18:52:36 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5xNh-0003Vx-25;
	Sat, 19 Apr 2025 01:52:33 +0000
Date: Sat, 19 Apr 2025 09:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	Kees Cook <keescook@chromium.org>, David Gow <davidgow@google.com>
Subject: [akpm-mm:mm-nonmm-unstable 26/67]
 fs/xfs/libxfs/xfs_group.h:142:undefined reference to `__moddi3'
Message-ID: <202504190918.JLNuRGVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   d1a9b961293d30be9a865d8685590635db282957
commit: 77b839c0f221fdd4e2226f14fbf3559b09e0976a [26/67] bug/kunit: core support for suppressing warning backtraces
config: riscv-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190918.JLNuRGVb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190918.JLNuRGVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190918.JLNuRGVb-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_fsb_to_gno':
>> fs/xfs/libxfs/xfs_group.h:142:(.text+0x15b2): undefined reference to `__moddi3'
   riscv32-linux-ld: fs/xfs/xfs_zone_gc.o: in function `xfs_rtb_to_daddr':
>> fs/xfs/libxfs/xfs_rtgroup.h:252:(.text+0x15c8): undefined reference to `__divdi3'
>> riscv32-linux-ld: fs/xfs/libxfs/xfs_rtgroup.h:252:(.text+0x15de): undefined reference to `__divdi3'


vim +142 fs/xfs/libxfs/xfs_group.h

759cc1989a5302 Christoph Hellwig 2024-11-03  133  
759cc1989a5302 Christoph Hellwig 2024-11-03  134  static inline uint32_t
759cc1989a5302 Christoph Hellwig 2024-11-03  135  xfs_fsb_to_gno(
759cc1989a5302 Christoph Hellwig 2024-11-03  136  	struct xfs_mount	*mp,
759cc1989a5302 Christoph Hellwig 2024-11-03  137  	xfs_fsblock_t		fsbno,
759cc1989a5302 Christoph Hellwig 2024-11-03  138  	enum xfs_group_type	type)
759cc1989a5302 Christoph Hellwig 2024-11-03  139  {
759cc1989a5302 Christoph Hellwig 2024-11-03  140  	if (!mp->m_groups[type].blklog)
759cc1989a5302 Christoph Hellwig 2024-11-03  141  		return 0;
759cc1989a5302 Christoph Hellwig 2024-11-03 @142  	return fsbno >> mp->m_groups[type].blklog;
759cc1989a5302 Christoph Hellwig 2024-11-03  143  }
759cc1989a5302 Christoph Hellwig 2024-11-03  144  

:::::: The code at line 142 was first introduced by commit
:::::: 759cc1989a53024066b0f2ea52c206b4ff8f522c xfs: add group based bno conversion helpers

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
