Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CEA283FC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925216; cv=none; b=lGqOdm8JrCrCrJzmg9Jg6nqfsaCiRXT3u2LSG7NQHFqhjuqU1230NuBMCjdE0i8+ZKiGaogy38OeKbGwkGqedihT7FbVhQ9K5LxN5XpV0c0pfkDGqwof5sUFGOZBaqVaAygXJjeYVp043Bgdek2ubf/CCsTAx9GUb+hdeb8pXfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925216; c=relaxed/simple;
	bh=lnvoY22JjaXXIb38MzUQiXqMquevpv7DOGl3q383UMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rqKVhZ1tXqE/FBVeg84b4gX+Igwxwfq7dPG5EEn0ql3rdQEDJRP9KOpzx+wNba3xRIUGccTMVn/vJEMF9kffU9IJMTwrh4l4TAP8EyB+AWVX88jEdpLt9Exsc/vfG116EQ5kuWIFCFLw3Bp0gy3Y52k6InC5MY3D4myyBJu8glE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVYt5WFB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVYt5WFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771925215; x=1803461215;
  h=date:from:to:cc:subject:message-id;
  bh=lnvoY22JjaXXIb38MzUQiXqMquevpv7DOGl3q383UMU=;
  b=aVYt5WFBbWLIgaKI6Hl9166SH9sJk8vjJyhLp0Pa5MV6iuBNbeM/zFca
   jaSS5t1sUIUT/ZkgjhHr5DYOugwfNXW71tM1apROJXtzZGEG5Ftwqeh+I
   SgS7ASdmpf3j72WhQTINwVdB0GyqXB/ohMNYL5TlpTXjBzYDwm3D8Ic++
   rXOh0nxOy2DMH/UYV3I3ZCfQEMB3It/x5eZQK0Fm72077/GaiVJGvbeVx
   XtDuOEiZEnf2Z7Q82vhN/S3am0naddzy/Ewv3adWrwoOprLN92SGNxF2j
   /Xn5rcPepr7zH++c1SO66pgIOcZuOJEU2nNH9m07qSxvzDTndWVUz5QAL
   w==;
X-CSE-ConnectionGUID: KoRz5Wp8SaKp56Lyw30E2w==
X-CSE-MsgGUID: tm9cR+f0RUugYucDcp9j9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72638648"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72638648"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:26:54 -0800
X-CSE-ConnectionGUID: Xj0Wt63AS+i705PsqlV8gQ==
X-CSE-MsgGUID: I1O0tZTKTx2sWsU5coClnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246427814"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 01:26:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuogi-000000001l1-2YdD;
	Tue, 24 Feb 2026 09:26:44 +0000
Date: Tue, 24 Feb 2026 17:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 20/78]
 fs/fuse/fuse_iomap.c:113:10-13: Unneeded variable: "ret". Return "0" on line
 127
Message-ID: <202602241747.8lk3GGhX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   103c12f21fcd268e61b60da187fc226f6ecb930e
commit: 74a8517315bb73d7112c286c07a1b3f18ca6898b [20/78] fuse: implement the basic iomap mechanisms
config: um-randconfig-r052-20260224 (https://download.01.org/0day-ci/archive/20260224/202602241747.8lk3GGhX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241747.8lk3GGhX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_iomap.c:113:10-13: Unneeded variable: "ret". Return "0" on line 127
   fs/fuse/fuse_iomap.c:141:10-13: Unneeded variable: "ret". Return "0" on line 152
   fs/fuse/fuse_iomap.c:163:10-13: Unneeded variable: "ret". Return "0" on line 177

vim +113 fs/fuse/fuse_iomap.c

   103	
   104	/* Convert IOMAP_F_* mapping state flags to FUSE_IOMAP_F_* */
   105	#define XMAP(word) \
   106		if (iomap_f_flags & IOMAP_F_##word) \
   107			ret |= FUSE_IOMAP_F_##word
   108	#define XMAP2(iword, oword) \
   109		if (iomap_f_flags & IOMAP_F_##iword) \
   110			ret |= FUSE_IOMAP_F_##oword
   111	static inline uint16_t fuse_iomap_flags_to_server(uint16_t iomap_f_flags)
   112	{
 > 113		uint16_t ret = 0;
   114	
   115		XMAP(NEW);
   116		XMAP(DIRTY);
   117		XMAP(SHARED);
   118		XMAP(MERGED);
   119		XMAP(BOUNDARY);
   120		XMAP(ANON_WRITE);
   121		XMAP(ATOMIC_BIO);
   122		XMAP2(PRIVATE, WANT_IOMAP_END);
   123	
   124		XMAP(SIZE_CHANGED);
   125		XMAP(STALE);
   126	
 > 127		return ret;
   128	}
   129	#undef XMAP2
   130	#undef XMAP
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
