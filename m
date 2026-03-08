Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789A7262F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772937460; cv=none; b=UfVLpherwbl7/OQuUTQ4fuxmrpwYo+Px/XXy5vcmyQKWFgT96iy8rR4BJ8ldEiUlRJ6bGLErXJ75uA8z5LFOQ0F7KMZIzBIedCYK2uxlnGK7yzG6dd/4+m6L6X4Bg2k4TBqn6yU9cYhUqQZAy33EPzraoPWuAiA0xHJ5c3GRrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772937460; c=relaxed/simple;
	bh=BtLKeu1HLsZ5FLJOakM0RhNYVRPZOsPvRIcEzKHoea0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I49AMLR3NXCGaj9raiVabb1czr7te3t0HEoy9oGHa7K5QhOPJVFcJOkg8JzMmBGpsAEaqLKqUssTI5eC+lZgoczKmnZH0qRkjnhQgowS+XsZvAYHd7iMf+xxiVJGeoSWcwIULeGqjjM/pI+l7G71DDgmFSq913IcNPQCnSGjGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgmvrEEQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgmvrEEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772937458; x=1804473458;
  h=date:from:to:cc:subject:message-id;
  bh=BtLKeu1HLsZ5FLJOakM0RhNYVRPZOsPvRIcEzKHoea0=;
  b=NgmvrEEQVKalnbbifK2j2wpmBOm4QIuz23Rm4zNy0rxkB2Hrkhnauwxe
   /O1PTLHXT9MKzOQ8GzAuYDiLmygkzEDY+hBQjl9oLL7Y352bzx2KsALWA
   gBkdCG3MJOfGneEqY6JEoABuQCTBA6Uc5u5UP+ofZ9UTMnVXv4/3odfhw
   L1TanJueGLYhpLlSx3Z+YAOL77n6bXb1IVMH0CiiAqJVBnsRRXN7nIfiw
   COV3JOtg6X7aknjyHCIiGvLf1Kwnab9TbqAu5V6LGISuBzO3+8WS2oltp
   ZE9UTVupfPDNEo6R20ewRY2wxV7UqHe9VLIpSogTRAtuLIRmVsTzLt5Vy
   g==;
X-CSE-ConnectionGUID: 1EanJEueTaaXV4O2Hu65bQ==
X-CSE-MsgGUID: I/vIVAk6Rd6te4GaD5IlQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="61572688"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="61572688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 18:37:37 -0800
X-CSE-ConnectionGUID: QQinbTKASrKZCMVjbPQRNw==
X-CSE-MsgGUID: 0dZhmCDOSXGAOO5Vsa8gUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="216421822"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2026 18:37:36 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz41N-000000002q9-1dmD;
	Sun, 08 Mar 2026 02:37:33 +0000
Date: Sun, 08 Mar 2026 10:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1571/1602] Warning:
 fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in
 'bch2_journal_flush_seq_async'
Message-ID: <202603081045.I1qlSPuv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c84c3bb0c47f4c7b194291beb8a399598b151e54
commit: a0168a474528cc64bf290cf20399e714161f4538 [1571/1602] bcachefs: Pass BCH_WATERMARK_reclaim when discards require journal flush
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603081045.I1qlSPuv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081045.I1qlSPuv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081045.I1qlSPuv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/journal/journal.c:736 function parameter 'flags' not described in 'bch2_journal_flush_seq_async'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
