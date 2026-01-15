Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64841E5B9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494799; cv=none; b=NBNjXDKeJWFoLa6ohGlIp+b4TmhMJCeWPP8t4Z9VHGvcCOriIx0xZR3emFFQrNiR0asPQQAQtLoRuSmhDyni3Wq54HtOzcbFy8X1U70wkqyw/UCbmOE2gn96znVx2lGx4m3NF2qd/v+TXHwYpc6WkjxrIrE5edUMQ4KUDjoS5q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494799; c=relaxed/simple;
	bh=hnEEHtRJMoHHzuEN49az/CwfvTfGbvym1gr6Ffr4K10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eAAavuDM9LQ9mrX40vbhKnf95MNy53FcF1N59G9gIzKtIY75PTdPkRU3zHINi9TudUgSvt94/JWAAAB9HPkyNGc+LWj3ZupqcPZz6lm44vMuJitZDNObyTpIumv4m92ljbPds3jflEZgPs7NgHU4WNkeeG+Td+9aWNWzVIPBTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5J+s6kj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5J+s6kj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768494798; x=1800030798;
  h=date:from:to:cc:subject:message-id;
  bh=hnEEHtRJMoHHzuEN49az/CwfvTfGbvym1gr6Ffr4K10=;
  b=n5J+s6kjoyvHvGEOrCyk67STeA1Hsj3eznuluyEt+NaU2zNOqdv37TYF
   6pIHoKtaHEEPX0/kykReJmSgxBV6hF7zNZBCWU/2xhzoFpSJO7Qn0uUOT
   V8nOgOG6QZEsXD9IqIlzmcITK0UgBhIemX8vonGLxT6/2H7u1fMIvxIBb
   MAxxQyGgoNyMUPVRNftACz/hAs9HazXbH4tN49I9I5XuScdS5ctmzvZIQ
   k1AkVKn39VVGnvlbs890Qios2RY/NEzXVt+DYijcEPhEcGuCRPF0SIsEv
   vBRk36rHHMgVqQeEa/V8EVyFqA4OHRj++1rd80ssli9ypUOsOAyOUHlnn
   A==;
X-CSE-ConnectionGUID: JOgQF2R2Tgi3VLoaQxUL0A==
X-CSE-MsgGUID: LKfyHeA1R4yFeKxicJRVBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69784450"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69784450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:33:18 -0800
X-CSE-ConnectionGUID: qSB/cnwwQ+iWJiIDlheSCA==
X-CSE-MsgGUID: poQUPP80RxiejVT97fpk/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205273602"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jan 2026 08:33:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgQHZ-00000000IDs-43fv;
	Thu, 15 Jan 2026 16:33:13 +0000
Date: Fri, 16 Jan 2026 00:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 207/208]
 fs/bcachefs/btree/update.h:320:57: warning: implicit conversion from 'enum
 bch_watermark' to 'enum bch_trans_commit_flags'
Message-ID: <202601160026.r1W5Zmm2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   46ff86c77400703f3be9b0a578adb99b8f83e89c
commit: 644d4b725f94a38c81f77402106fa7899edfcbd3 [207/208] bcachefs: Fix bch2_trans_mark_metadata_bucket()
config: x86_64-randconfig-012-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160026.r1W5Zmm2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160026.r1W5Zmm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160026.r1W5Zmm2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree/update.h:5,
                    from fs/bcachefs/alloc/accounting.h:5,
                    from fs/bcachefs/alloc/buckets.c:10:
   fs/bcachefs/alloc/buckets.c: In function 'bch2_trans_mark_metadata_bucket':
>> fs/bcachefs/btree/update.h:320:57: warning: implicit conversion from 'enum bch_watermark' to 'enum bch_trans_commit_flags' [-Wenum-conversion]
     320 |                                         (_journal_seq), (_flags)))
         |                                                         ^~~~~~~~
   fs/bcachefs/btree/iter.h:869:18: note: in definition of macro 'lockrestart_do'
     869 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/alloc/buckets.c:964:24: note: in expansion of macro 'commit_do'
     964 |                 return commit_do(trans, NULL, NULL, BCH_WATERMARK_btree,
         |                        ^~~~~~~~~


vim +320 fs/bcachefs/btree/update.h

92ace4444d6647f fs/bcachefs/btree/update.h Kent Overstreet 2025-10-09  317  
e68914ca849fa51 fs/bcachefs/btree_update.h Kent Overstreet 2022-07-13  318  #define commit_do(_trans, _disk_res, _journal_seq, _flags, _do)	\
d3ff7fec9c604e2 fs/bcachefs/btree_update.h Kent Overstreet 2021-04-07  319  	lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
d3ff7fec9c604e2 fs/bcachefs/btree_update.h Kent Overstreet 2021-04-07 @320  					(_journal_seq), (_flags)))
d3ff7fec9c604e2 fs/bcachefs/btree_update.h Kent Overstreet 2021-04-07  321  

:::::: The code at line 320 was first introduced by commit
:::::: d3ff7fec9c604e2cac3d0126f6764c5c0392a271 bcachefs: Improved check_directory_structure()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
