Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EE384254
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 00:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174817; cv=none; b=lkrOmvvmGW+KE3cmq/V4wybBZiK7AMl2gqJvL4xRAWdsiwYUk+vO3TC5Jutm7HJXV1x4hy/TrGOu1MewIsCxC7RJDwlpbkbjLrngG9oWUMmKuxZwbRH22WO/mIUu9svVWb11ldUCBT3fPakQtTieGPCENkRfBEGNMxDTvvSxnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174817; c=relaxed/simple;
	bh=QTm5HuyIl4jQZkaMaJp51n/e0eUKosjU3yIgds4gQI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QYZmmj6SwP/xSHTeB+QQcZhs3WSb+dQR58UEuemtR2iCwj6+te/k9ywExyZaulUpdY9E3EUvP0EcBqTOninKu6jrSdWLGwXCeEicpysB2m+wzrA1mzMr4UMX65wVmFlsIHu6yHM9YY0U18uhDS+cEWSFB5R/4bWmBaLNnpmZCag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glIIa5id; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glIIa5id"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782174816; x=1813710816;
  h=date:from:to:cc:subject:message-id;
  bh=QTm5HuyIl4jQZkaMaJp51n/e0eUKosjU3yIgds4gQI4=;
  b=glIIa5idjW3+Pzj7ioAvL9LoxN5k6T/LyZzmBfRF352JBQhW9f2Y1dl7
   4I3++Zebt/gHOms0jpKsQ6mNNZ3pvPD/nj0t0UxCHdxnDDX8de3C5JLg/
   xQhBw0sQN2/2keKUcRdLEzBbw0h55sJEljJw61EuU2bueLqpSRIRqUTMP
   KgInD9LJ/ZHw0pi4W2j6JYYsRriYRlBhHuis2+PpDf46i4N8KlgA7QMfU
   QQzaVnzZvU8zFzTLt9MUGLnxrQrYvLv81rTA0iW3EXqD9YFqCGRUOLZW7
   OhZXYVitKScQ9lMtWPtUMbGmWtc+CNpgCLY2nDqZ11EJcDc/B09TQGypy
   Q==;
X-CSE-ConnectionGUID: N5dZb7a5Qf+b8uV34I3Bbw==
X-CSE-MsgGUID: 7Oo201v/TueFJWki/igzyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105706444"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="105706444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 17:33:35 -0700
X-CSE-ConnectionGUID: qSLE1cgoTO6Gl969p/3iMw==
X-CSE-MsgGUID: azYBeIdsS8OwO8w3Yf1uYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="254349852"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Jun 2026 17:33:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbp51-0000000026p-1nsw;
	Tue, 23 Jun 2026 00:33:31 +0000
Date: Tue, 23 Jun 2026 08:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 26/95] Warning:
 fs/bcachefs/util/rcu_pending.c:636 function parameter 'pending' not described
 in 'rcu_pending_dequeue_from_all_where'
Message-ID: <202606230858.3eygkMzK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 3785435bb05ce2d63715d36de356b0c36a010463 [26/95] bcachefs: key_cache: reclaim only entries we can lock
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230858.3eygkMzK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230858.3eygkMzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230858.3eygkMzK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/util/rcu_pending.c:636 function parameter 'pending' not described in 'rcu_pending_dequeue_from_all_where'
>> Warning: fs/bcachefs/util/rcu_pending.c:636 function parameter 'try_claim' not described in 'rcu_pending_dequeue_from_all_where'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
