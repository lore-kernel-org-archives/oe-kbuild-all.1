Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11F187872
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734811963; cv=none; b=N2vs/iMXf1sJrxBu8jUeeyY296CW/fizej56EWTbB8QEMb8vz4WbmODRyjSza0Yv294ZZD7XCfl0QnVgINkoZsuqH64wcwNAQjBtK/KBtCeu1/BopwMB+5JHnqb9jKoAse937JWfBNmkW3F1uJb7RJt3RLRU1Vc3BU6xK4T24PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734811963; c=relaxed/simple;
	bh=fOL59KSFMaVVghjHSd28GYRoYOttroY6VcATdOUAVAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kliunZIUhLW0KwthbG5xZcnXB+FnRJXaJ+8ZClSTfe65PRL5cnAFCJCOo9TmDilyaxROPd3Jb6f7hzAtCkHc7B4NEnRRBzvuIzvMgqs5/jVCsHIOf6Rouw5rmA5+g2VOmc7iNCkQTym4HA/lpUxqMEVIVN6WS/OopbK/WGBd0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiRj2Lkv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiRj2Lkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734811962; x=1766347962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOL59KSFMaVVghjHSd28GYRoYOttroY6VcATdOUAVAE=;
  b=EiRj2LkvoGWFeoFBf8Ky0bgR3IFAIvS4Z7rj5hj8kUiY7amqZp1Q9tkj
   k/1acXnELSmBG+NI7al58k8xW7D5LnUgZOMs+sZ98wEVK2Ni4YB278v76
   azWrI8CiOCwLVC2fM8tQ69eekYLJSQB5JdcdYYe1WmCkVAD0dv03vjN1S
   +Z0MgTFiDJchgHV8cL6bAwjEqi1KbttEC8+ylAaMmHWzxhKUjgqO9N81M
   c2N0ofg8VgEyfbeQiF+l2mVDc9PabQrJvp/6ZNkRuZxyFeZ2qLeAsivdh
   4ws9E6U++IH6bqNYNdFvetmQionlL1G5WDE9nAqWpwM/hwrTS5/Y+wA3q
   g==;
X-CSE-ConnectionGUID: Q0U+QrieT5WFhBHsuTbBRA==
X-CSE-MsgGUID: v3Ea9w1SSl+viw9rimIk+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46711437"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46711437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 12:12:42 -0800
X-CSE-ConnectionGUID: jCWxZLv4RLGzQHwndbV5lA==
X-CSE-MsgGUID: 5Q38vLu0Ta+CrKgWAIWMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122112940"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 12:12:42 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP5q2-0002SL-26;
	Sat, 21 Dec 2024 20:12:38 +0000
Date: Sun, 22 Dec 2024 04:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:cpuidle/polling-v2 3/6]
 include/asm-generic/cpuidle.h:5: Error: unrecognized opcode: `static'
Message-ID: <202412220431.tXZWHypL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git cpuidle/polling-v2
head:   dc1877bbcfb9d2a683783ff579e310d7e5f3a75f
commit: e1ecd926b8a44e5bd3f8dde2fba23217058ed53a [3/6] x86/cpuidle: Move buggy mwait implementations away from CPUIDLE_FLAG_MWAIT
config: powerpc64-randconfig-r131-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220431.tXZWHypL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241222/202412220431.tXZWHypL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220431.tXZWHypL-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/asm-generic/cpuidle.h: Assembler messages:
>> include/asm-generic/cpuidle.h:5: Error: unrecognized opcode: `static'
>> include/asm-generic/cpuidle.h:6: Error: junk at end of line, first unrecognized character is `{'
>> include/asm-generic/cpuidle.h:7: Error: unrecognized opcode: `return'
   include/asm-generic/cpuidle.h:8: Error: junk at end of line, first unrecognized character is `}'


vim +5 include/asm-generic/cpuidle.h

     4	
   > 5	static inline bool arch_cpuidle_mwait_needs_ipi(void)
   > 6	{
   > 7		return true;
     8	}
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
