Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC8171C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753607602; cv=none; b=VUKgpWnwLU0OAzzg9nQHb5v8xapbYLzsUO5vAYZMfVxwzAG87UsR1JnEdVGTccHpYXrn6v95dsp+vqTnz964TUPtfaZAHW8bG2kbmmyBxx+WFPehBRjWr/IRtz2xhiMUqAgdQdfjAqsmera8slE86JuoNX/6QOr4FUpYLbwsm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753607602; c=relaxed/simple;
	bh=HoMeoELNbG06nwUrNjJIMyReIO+PGmuHgFFcFhsD73g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTT9o+jp5aTNFAdn/d0uIdC61h4xNfJtrkIFCzq4k8n/H7EVExxl7ZH+rb5zRLB9BMad4y1uWXIb04c7k720EziMKBjhejNrbSRbmlp/vTx/PEZzjSDJpj3kjLefDgQgLlhx27Lpt7tRQz2DJNP59eB+7aTRWm4OYfXCQje0G6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6SxcOGj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6SxcOGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753607601; x=1785143601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HoMeoELNbG06nwUrNjJIMyReIO+PGmuHgFFcFhsD73g=;
  b=a6SxcOGjMJzAkMvxevv7XcF+I6htCxOiqPsuGbi6LuEcBwwuaH7TS/jY
   sszU3Es4y/1wlP+/Y662KsRQLfWYNRibK/Dm0WXMJQsFvOgQpu6uu1ZsA
   8IRYxjQ2kdfeDYnNx5F3V89rDBtpo7TrXN7V98imASGH12nRyUb3zpHhD
   wSWODuiitawLKQDThQeWCj81Mfd3tGJhf/7A4cfDiQbFSvILm0/YS3xIE
   cOH1E9MRSHH9JETHvDROemxiVhzyHovSpTp4/RAaptDMx8w3dnQIYvgbf
   Wt8nWe+re24JIWparyGAz/xWImLt+/AGVsxTg/tMuy5RaAG2SnwKzrmUu
   A==;
X-CSE-ConnectionGUID: dxQRBPZMR+K6w1r2fptN1w==
X-CSE-MsgGUID: fi9PZjBOSCS44JwHL8nfiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54958439"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="54958439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 02:13:20 -0700
X-CSE-ConnectionGUID: VzcvDKE9R4WSinopJHqeDw==
X-CSE-MsgGUID: xZV0H8e0SdCHKfIuCNHaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162416323"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jul 2025 02:13:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufxRV-000MZD-1g;
	Sun, 27 Jul 2025 09:13:17 +0000
Date: Sun, 27 Jul 2025 17:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 35/53] fs/fuse/file_iomap.c:109:10-13:
 Unneeded variable: "ret". Return "0" on line 123
Message-ID: <202507271716.DwjtGIEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   5f2ce218df2abd94f83d30f83e104ba57ec0d583
commit: a8fccfa83529816f5fab36601adb9150662160d0 [35/53] fuse: implement the basic iomap mechanisms
config: m68k-randconfig-r063-20250727 (https://download.01.org/0day-ci/archive/20250727/202507271716.DwjtGIEk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271716.DwjtGIEk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/fuse/file_iomap.c:109:10-13: Unneeded variable: "ret". Return "0" on line 123
   fs/fuse/file_iomap.c:137:10-13: Unneeded variable: "ret". Return "0" on line 148
   fs/fuse/file_iomap.c:159:10-13: Unneeded variable: "ret". Return "0" on line 173

vim +109 fs/fuse/file_iomap.c

    99	
   100	/* Convert IOMAP_F_* mapping state flags to FUSE_IOMAP_F_* */
   101	#define XMAP(word) \
   102		if (iomap_f_flags & IOMAP_F_##word) \
   103			ret |= FUSE_IOMAP_F_##word
   104	#define YMAP(iword, oword) \
   105		if (iomap_f_flags & IOMAP_F_##iword) \
   106			ret |= FUSE_IOMAP_F_##oword
   107	static inline uint16_t fuse_iomap_flags_to_server(uint16_t iomap_f_flags)
   108	{
 > 109		uint16_t ret = 0;
   110	
   111		XMAP(NEW);
   112		XMAP(DIRTY);
   113		XMAP(SHARED);
   114		XMAP(MERGED);
   115		XMAP(BOUNDARY);
   116		XMAP(ANON_WRITE);
   117		XMAP(ATOMIC_BIO);
   118		YMAP(PRIVATE, WANT_IOMAP_END);
   119	
   120		XMAP(SIZE_CHANGED);
   121		XMAP(STALE);
   122	
 > 123		return ret;
   124	}
   125	#undef YMAP
   126	#undef XMAP
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
