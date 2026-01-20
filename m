Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817B3D669C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901633; cv=none; b=MfvKlrISPMYFpDHNJOZF8PigF5/b0TmvFrm/PIcppqRFSZuYsoHcW7sgmNlwAbXr16rG/P7SZW0OGy9qrT+Kbf97kqEgMFQlUF8uHcN2BpHR3cXdMLi1uMgfbGSFEOqGEii4ZtRQ98Yt3CcN1YP0iVd8STtrUighABpyAwYoj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901633; c=relaxed/simple;
	bh=RakD14F9aegHSxiAbWEP1WZZ0ofD/UuqMXyyZMNpcwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEHnYW5cDpiN4WYBneuY9sw3Gg7HQ/HC+qKwCpAUdc87QwVpjVNuZAY7PA1glU17CbOF78pHe5nQPKEYGpTiDhwXmBonW765eZnlQl7QoA7purz9VAr0D8XUhBwE+dARb/z6K+O+C8wfJaQy3dOK5yvvQnkZgTiS9pEuzPKnA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcSQ+jXk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcSQ+jXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768901633; x=1800437633;
  h=date:from:to:cc:subject:message-id;
  bh=RakD14F9aegHSxiAbWEP1WZZ0ofD/UuqMXyyZMNpcwU=;
  b=BcSQ+jXk5Fdc+QTPASqo8rufPpaO8GzEMNiyxuyx9l/Gf2mLCWB5Bj/I
   XUAItUcx63gt2wq0+fVDdhWOI3gNpbYR9RUSigi/pUmfIn2vkTRoeSOyY
   AKeMxHFPfetsxLeKC7t5bYP7B0zpBIkz6uHXW2KWFDnnTbOFNDnhzAwE+
   Y+Yc8sin6uFp9z49axbyy5OYa0IvQS0xKHFQ5J1RAYunWse4SeGCDwRwH
   Ug+YO0W8ZDp2+OhGuN+FmmjWfm2cDF4wZ437AVir+pv2dEmTfY/kpRltx
   JZSOrK+4x2q72hBKgEdUmCbd9thv07I0urqfdynoBmuMkO2WXup0biVAg
   g==;
X-CSE-ConnectionGUID: v8lmjFuVT0qxXunoOXoelA==
X-CSE-MsgGUID: abVcvnj3RfOguLOlbdLcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70077052"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70077052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:33:52 -0800
X-CSE-ConnectionGUID: r3TOIQdKTQ2AQtvacIOjEg==
X-CSE-MsgGUID: u/hqTYQdSWmx4Y7noeoBuQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 01:33:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi87P-00000000Olr-3kpu;
	Tue, 20 Jan 2026 09:33:47 +0000
Date: Tue, 20 Jan 2026 17:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-debug 231/231] undefined
 reference to `bch2_account_sched_blocked'
Message-ID: <202601201749.D6FjUtsp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-debug
head:   7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062
commit: 7cd4e8f9f8f13d9c5a2bbc98b80ca164430d6062 [231/231] BCH_SB_COUNTER_blocked_with_btree_locks_held
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260120/202601201749.D6FjUtsp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201749.D6FjUtsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201749.D6FjUtsp-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/core.o: in function `schedule':
>> (.sched.text+0x604): undefined reference to `bch2_account_sched_blocked'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
