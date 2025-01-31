Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196E4A24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328531; cv=none; b=Pl1pWOZgFcQP0HjobeSllOaOMXmA0E1bYHc+KeJHYf1rz58ftLKqvPxBvS8e3nMcXu2ppHsWwVx//mbAELiJvb7qsALiYla6qreIZzxqqoOA2DK7vqwDZagw8CmvCw2njS1H1CEF2csFgcF+IIi9qK50A03cSrogqssQykOYlh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328531; c=relaxed/simple;
	bh=cHVUWmPBFB2cudduSg+hpn1rxkGvhZs2mVwWx/qlnEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cznuXChJz9NC4g10/Z0hUVo49u78PsTrcpUL0r7nJ2t+fJaPqmlJug15ZM0h6xgn80itDQxpCJyvytQMtPjqLlHFSUX/5ywGyScLgSqiqnQmtNHy/W1Fa430oBFIvy3QCe1LOOIiuvyIW2VyEbEjPLE0mirlN0x/am2VEVYp0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDQWts2w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDQWts2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738328530; x=1769864530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHVUWmPBFB2cudduSg+hpn1rxkGvhZs2mVwWx/qlnEs=;
  b=BDQWts2wktv8uvmvSA0N1KAL0KHz+Hn07kKOZlkunthki5JoADTod6aI
   +ULv8EV1zpbpYIRyg+3wAowj8dCcVCdPD4uBDEjigDOpbEzIME9ckSPve
   r91IJ5HTl7Wi/95feMZ5LLTv+fi2RcwBpV4POC24qb2NChLyiOaKrzaeq
   x19FNYdqRFGjAzw3ZHuFV8aBG9zlTR6JmJ4RmAxZF/GEstz37f1wERbhB
   MWT+kRaGZXLCxA4Rfk4Y/rDV3oj50M277Vn7H/tx+DBPrNcrDMnYAYZQE
   YOQmslD3iO/exobX5+0NiXbJNbN2gbdkZh/PjKT/Z/xM1oL88QjbIQzk2
   w==;
X-CSE-ConnectionGUID: 895hMzDdQEy24OsoJmrOxQ==
X-CSE-MsgGUID: ZVWl9UlQQ1aCnrtB8YZUJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39034466"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39034466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 05:02:10 -0800
X-CSE-ConnectionGUID: 69QA4N5HQMq4VRgqfInJgw==
X-CSE-MsgGUID: 2oZdl8IDQx+/ZpyFfhdi8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146810483"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2025 05:02:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdqer-000mOB-2j;
	Fri, 31 Jan 2025 13:02:05 +0000
Date: Fri, 31 Jan 2025 21:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 52/52] bch.c:undefined reference to
 `__paritydi2'
Message-ID: <202501312051.0vJPrrIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: use __builtin_parity() when available
config: loongarch-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501312051.0vJPrrIL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501312051.0vJPrrIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501312051.0vJPrrIL-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: lib/bch.o: in function `solve_linear_system.constprop.0.isra.0':
>> bch.c:(.text+0xd18): undefined reference to `__paritydi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
