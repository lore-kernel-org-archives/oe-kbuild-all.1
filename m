Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6A33EAF2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905598; cv=none; b=tmirK36IONKLzyJCPbnCiVujbUPcJtsqW1x5XdkollQ5HwvcplixOadsG1845OIYWh0R/J7XHhswk2Q1FzorGLGCgH5fXcuS/nmXbIGlJjmADmaxb5QRiiyRfJMrxDaFWasZsaefjxfyMOlQkCtMH0WZqSiPgcMN2WL53v+HkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905598; c=relaxed/simple;
	bh=M8+SUok+67UCr8pcZKGnq7pTxTdl2LnHTHeHoqfKSaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSe8ofrxKszjFUse//fbk+VlTj5pwQYcv5KeYBJ0KZsEwqTCxLWLSet0fHnuegl71wNafLUy8vNRFMXX5S5ZH7k2gxaNY3JJTGFC91lgAyCX6eiMq+uHiIrJ6ys8E3JgGg8HNV+68Dlx3GWThaVsj14u84luaRysrnmfQHKrRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsCsxWAB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsCsxWAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768905597; x=1800441597;
  h=date:from:to:cc:subject:message-id;
  bh=M8+SUok+67UCr8pcZKGnq7pTxTdl2LnHTHeHoqfKSaQ=;
  b=lsCsxWABnUu6cETBYJuONFNz083t+arNGGXCvkoE3uguy0vbIcsTlILv
   qYRFj1ShekTOVQ524b6S06mckvpzzUhbkwShuYIClOnbO9Iwv1A4Q+POy
   382tB/+zGrv7h6EVDGWcei0+jI0FEU1XLuTVX4Pj9WVLYqngkhhFmLvPL
   eT0tlFwybZmEtoeTB2jLxtgD8hW+iuL0BE3y/lYnSSQUF44U77QZ/7BWR
   HHfwl2aDwS+HGbWz5vDbYtDJC6F6zxv2LBVHG9vtDMRB9r93sAWq0H7lT
   rbboTkfYZ8BkFu2XutdRgO/qfIVuDxWv25o7F9ODaHj5hRiQHn8r8kdOh
   g==;
X-CSE-ConnectionGUID: 8eQYJO0LQWWiw2NcLqjhZg==
X-CSE-MsgGUID: 04Px2rIVQ7CH+z87c/vBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81550013"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81550013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 02:39:56 -0800
X-CSE-ConnectionGUID: kPd7ttAqRLKGwdHIwszQcw==
X-CSE-MsgGUID: F5modbLZTSuUcVKWnOCPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206348482"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2026 02:39:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi99M-00000000Opd-0hO7;
	Tue, 20 Jan 2026 10:39:52 +0000
Date: Tue, 20 Jan 2026 18:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-debug 231/231]
 fs/bcachefs/btree/locking.c:957:6: warning: no previous prototype for
 'bch2_account_sched_blocked'
Message-ID: <202601201853.pbX2xazZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-debug
head:   7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062
commit: 7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062 [231/231] BCH_SB_COUNTER_blocked_with_btree_locks_held
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601201853.pbX2xazZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201853.pbX2xazZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201853.pbX2xazZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree/locking.c:957:6: warning: no previous prototype for 'bch2_account_sched_blocked' [-Wmissing-prototypes]
     957 | void bch2_account_sched_blocked(u64 start_time)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bch2_account_sched_blocked +957 fs/bcachefs/btree/locking.c

   956	
 > 957	void bch2_account_sched_blocked(u64 start_time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
