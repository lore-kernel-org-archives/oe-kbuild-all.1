Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF338347FE1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 19:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155419; cv=none; b=a7Y/WuQ5qmf6PCUyrDfkCYhYuyxRb3r+KamiXYwx0gn0Y6T96rqhdOJb6CUb78mGj01QSbDcRhqfKs/IGn+MAq0PgONOkZLoqFaiWqFc2HGjysN3AQ2vSCF6cI13vvlE84XQ9yrKeFR5nuMMh6lejEgfGpdOmgVIpoRVTfDMSQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155419; c=relaxed/simple;
	bh=bnDrI1JJS+7LEIhbSo/rvJUeXIS5qq/h9ypY94veRys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RurWMqc4pQ/jfKrTGwXc9c8i9SbejkkmN/IhsyGW/dRfm1+K3cQrgiGeK1UyCazt5YUCZpVqiIW+VeKw1I3WV9zNo0pMzW9NSrn81kKaof8y6kKdJltOzQM2vWClGlDlWhcZw5NFxN1pg69w97eafRcWJKoNrDqql+9IUFDGT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0rw9mcb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0rw9mcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782155419; x=1813691419;
  h=date:from:to:cc:subject:message-id;
  bh=bnDrI1JJS+7LEIhbSo/rvJUeXIS5qq/h9ypY94veRys=;
  b=f0rw9mcbyXWFVhZlLv1Wty7282SwwW+L81/WrgV12XCMc9yRoewGRhCP
   Megx/RYg42Xe3LMnkArEk59YLUDHCUt8v+pEiy1eOoN0Pv2/V/ZDUOiS0
   1dLU6C5pKzJXqWdVS5mBU4xKNg8rwXoAhC2m0htpiWrBipq5wQdBG9h/j
   V9lt4WRM66UfCWJe3zdKsAcOREFS74JRgouirdduzMSVpnhEqyE9wy1gi
   +t/yYdxcqR1EajYmyyXveci0+q50qDzYydLAOAQr4HI9ClRvh+4ZTVA9z
   KIc7HdMp353Wk1TXTqF6xadULnkQTGx1SQmKH5L64cGLwip947FZCHdTn
   w==;
X-CSE-ConnectionGUID: PJ7L7IeOQimXwau0lXD8Pg==
X-CSE-MsgGUID: zvaEKoSASue/dikiYbBEQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82986141"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82986141"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 12:10:18 -0700
X-CSE-ConnectionGUID: LBztkmbRS2mnCvjU9BzTKg==
X-CSE-MsgGUID: BRcWtQnBQFqbWP4PbCjYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249347431"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2026 12:10:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbk1A-000000001l7-0FNe;
	Mon, 22 Jun 2026 19:09:59 +0000
Date: Tue, 23 Jun 2026 03:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1161 1571/2006] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202606230306.hMuRIgs3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs pr/1161
head:   ed136b8085171be593cbe3628c085c274e4a4d51
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/2006] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230306.hMuRIgs3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230306.hMuRIgs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230306.hMuRIgs3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
