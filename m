Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2713790B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 02:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782181026; cv=none; b=nZ5Y+ip1msRIhEpfROdALqihaMhgtIk80rT6HiMGUQXql7YGsAVesmB+um6H4Eh/ASe7DnBpwaqPOtNSqjgJkXihViao1xL67H93JhvkMUOceSktp2ykQhuTGbq2yBEcqtf6kOaDkLUSftY8F0ujEV+DdTUzpFD6/pPniZb63Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782181026; c=relaxed/simple;
	bh=y3tO/XZsjYzxPvipIWS6IhM8qFT/6r7csVSjMbLU1D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BhJISsMGP403UySA2977+7p/d8qdIH2At+YXXfuajy/Ij/Wpxge8d84SsTBxJD15qMBSxQyexxn3i8VP3M6e4RvdFohXA41GhK+Weenjt09+jhG9j6wKdrvE5UDzrVZ0veD+ToepcnxmDLhrKW+sCITnslGfiWxHRC8taNW+7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4QolADO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4QolADO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782181026; x=1813717026;
  h=date:from:to:cc:subject:message-id;
  bh=y3tO/XZsjYzxPvipIWS6IhM8qFT/6r7csVSjMbLU1D8=;
  b=l4QolADOF/V7S0p60C0MALxybNZYyUzCNjhlNAEEmmzo/iXL2hJ7FUHA
   XT8d0qO+JT5cDUP3rup9Q8aucPkAz6bk4GnHLMmUdC85tfTcxGIZwt3iP
   cKotZ7XPeKFChyAbmEGsYxebecgtvI1i5D/MchF4o2YLuFH+BBlBG6b9V
   jo4+Z+KqEpugv8ulecSvE0T0KyM9RpkqiBCkqgKy2bQStaXprgR8HguBb
   jCsNA34YC5/ndPlfx9Sq41Xe/u5fx/ndsKHjrHjxAXVbXYK382Ghcvzuz
   dxWSFUqhDbOqyF/tfrdPFKC+5FovFBm3d4E134mFeYueXfbjhPxlu8/Hu
   Q==;
X-CSE-ConnectionGUID: 9hdFx8FdQn67Cizlu+Fa2g==
X-CSE-MsgGUID: 4vfB7HcgRF2WQEM0eGU4cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108460616"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108460616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 19:17:05 -0700
X-CSE-ConnectionGUID: qRqMhciISy+7lJeo1SMX7g==
X-CSE-MsgGUID: SkaaYqjeTxSDu/5RdUidAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273445213"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 19:17:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbqhB-000000002Az-3WX4;
	Tue, 23 Jun 2026 02:17:01 +0000
Date: Tue, 23 Jun 2026 10:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 6/106] Warning:
 fs/bcachefs/btree/cache.c:1245 function parameter 'flags' not described in
 'bch2_btree_node_get'
Message-ID: <202606231008.2AcqZ9dF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: fac287274531b22eddb29ac7e9f45434660cc2f4 [6/106] bcachefs: BTREE_ITER_nofill
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606231008.2AcqZ9dF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231008.2AcqZ9dF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231008.2AcqZ9dF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/btree/cache.c:1245 function parameter 'flags' not described in 'bch2_btree_node_get'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
