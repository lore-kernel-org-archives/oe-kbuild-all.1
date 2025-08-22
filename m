Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF01C8603
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852512; cv=none; b=UPRWzK1LlAOey+UxTCDODuNTNdEu0j+K1iYbXO3lsHGwmHM6m/AAJr7cebW8GIJBS1w7VNpRjILTVaZr4iJLlec0RtEWyPhpgW7AwRMmwvYEOSZvZl8UOHXjQVu5zTXtZy7v8hw07Rd3eBXHXodFtlBBK2Z+2fZpMy4lEJiYMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852512; c=relaxed/simple;
	bh=+c5NZkIDqWom6GkhgvnawYBPSckj48QZhtsIxo+3dh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcm6BhEmz1Cb7XYFjybgNwrmcGAAwHipac7mlKEB5NwMbodq4Z2M9u8dy+TsiSbu+VSZzyNjqpK6Asyx273vpLoupCQ4Q0e867JsacEO56OylkxUwXUlXrnv8k6lmEIuK7YXAd99gVfmftIhT6d9++YX+3tpsCQpjmi6wbZ3Cxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7ALKIB1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7ALKIB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755852511; x=1787388511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+c5NZkIDqWom6GkhgvnawYBPSckj48QZhtsIxo+3dh0=;
  b=n7ALKIB1Wa5nbXgpHZMpC2/av3+fBafKOs4uzGzeDzhHzhScF3KWLloA
   ry5ppwFw9DyrZZIbJjb1WjSudcgbzr49olNLc0QwQRaDPEes7/phmdN+i
   29/TVakLmV0QIC5jZvC3jMETNvt6DLAOaOmujDJWELB9zBXzXTpM8t4jq
   9LWJ8L5Si1i8V4K+6G2vD9A8rWWYxuBrdv6xx2o7PLvp1eH8J2nm8p/rh
   odRObECE43h7T1NyblgWQaEYMcEB0neRPjtf2/EJVwzpZFLG8XYRjX5y6
   tHloLsKbqzTsHHXu+spWsLEG8rDOqzC2t7NqocpVAv3g0JPaRkyE/LEo9
   Q==;
X-CSE-ConnectionGUID: 8mMNTzxIQvOqXo/jOBgrrA==
X-CSE-MsgGUID: ZBSR60byQhSkP4T5f8JbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69529089"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69529089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 01:48:30 -0700
X-CSE-ConnectionGUID: mGq68VPsQpuDlMNuxvK/rA==
X-CSE-MsgGUID: zVnaLOsqSLCIq6jXytsJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173074101"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2025 01:48:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upNRi-000L5F-1T;
	Fri, 22 Aug 2025 08:48:26 +0000
Date: Fri, 22 Aug 2025 16:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2701/2701] vmlinux.o: warning: objtool:
 kcsan_check_scoped_accesses+0x1dc: RET before UNTRAIN
Message-ID: <202508221633.ajaGncA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ad69d53d4feeb6e84341bcbf1feb8fd59fb6bcec
commit: b73666e1e9554c77a69a647427cf77782e0bd9aa [2701/2701] x86/xen: don't do PV iret hypercall through hypercall page
config: x86_64-buildonly-randconfig-004-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221633.ajaGncA2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221633.ajaGncA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221633.ajaGncA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kcsan_check_scoped_accesses+0x1dc: RET before UNTRAIN

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
