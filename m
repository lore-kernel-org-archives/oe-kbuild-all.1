Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4535AC3C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888179; cv=none; b=I7Z0ps/EpA3OK42Aael2tS9Zljhyisd5PA1YsPgx0c6VCVMMzsD8TyCDdsbKY1lndDKwD3c89PROuuNxRrbrkRFI964LP1OQ2Jro9PA4jNptXHIjCMpzQRf7TyD3cTBs7DZSiQhn4fV+JznSouSaN9PUwEJ2R/mtFcRPASJJGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888179; c=relaxed/simple;
	bh=WyM31ebfvZOiU3rZY1uE03qmvW19V3l0Yd5J54pPwNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Na42Lv/Z7x+7eqR+4Ig37J+3RrcPw+83VVdf20bB88GiKoPWLw/yJAKVeQ6FzzpUgnAYWi5KV/Vt7gx6dyJsfy0XPNhm9d4HcyRQ3T1AIoBZwePAA1zxvHlMb8QkrQTaSg3HXyXL6qS9XPqHDi1meJswqAR7SiBYTofgQfglb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZjU0SeM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZjU0SeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782888178; x=1814424178;
  h=date:from:to:cc:subject:message-id;
  bh=WyM31ebfvZOiU3rZY1uE03qmvW19V3l0Yd5J54pPwNY=;
  b=CZjU0SeMPMKGp+HeaG84RewXpkCtTNpbPpz9++LP/Bwl25/qlrU7RJ5U
   beZBcRuP19qctWK2QxUn2Skdg7uxk0pMpK8XeQyTUCzi0QMZK7+uBVUcG
   pyXwS7AhGYxABMKIu2ScfllRrSX7Pt4wVVt4716acDy9L5AHGtqsKTomh
   0Opf6ivNQpIVQGy4pQ1RucLxopMLuPuo1F/Hs+eZfV0zH/R+73akQlDdj
   fdpOKMEQ8/glX4h3QSx/1HEhHqGRBEmb/KcNBcJXt3DpeUTVQmdcam4Hi
   xqUEJqr/u61M7BQKrlv0+vEIvHAkLvWrREVFRHP8LBPlT5DSEMCQDATwO
   A==;
X-CSE-ConnectionGUID: nfcOjxw1T2a9I9X4OtrULg==
X-CSE-MsgGUID: FSMtwBS2RmC1XsSdJEpiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87523628"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87523628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 23:42:58 -0700
X-CSE-ConnectionGUID: dQVgIE8BRlm3M7PU8k402g==
X-CSE-MsgGUID: DLEE4gVlSiKwd+blFNLwQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="249831230"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jun 2026 23:42:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weocN-0000000090H-08V8;
	Wed, 01 Jul 2026 06:41:01 +0000
Date: Wed, 01 Jul 2026 14:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.3.iomap 3/3] fs/iomap/ioend.c:16:16:
 sparse: sparse: symbol 'iomap_ioend_split_bioset' was not declared. Should it
 be static?
Message-ID: <202607011411.SFoYmRJa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.3.iomap
head:   f2727952b21d187deeeb21cd4e84823b6410e650
commit: f2727952b21d187deeeb21cd4e84823b6410e650 [3/3] iomap: add a separate bio_set for iomap_split_ioend
config: m68k-randconfig-r131-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011411.SFoYmRJa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011411.SFoYmRJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011411.SFoYmRJa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/iomap/ioend.c:16:16: sparse: sparse: symbol 'iomap_ioend_split_bioset' was not declared. Should it be static?

vim +/iomap_ioend_split_bioset +16 fs/iomap/ioend.c

    13	
    14	struct bio_set iomap_ioend_bioset;
    15	EXPORT_SYMBOL_GPL(iomap_ioend_bioset);
  > 16	struct bio_set iomap_ioend_split_bioset;
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
