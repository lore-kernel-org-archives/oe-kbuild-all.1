Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04501E32C5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736514831; cv=none; b=WnTd/FVDnkaWOxuB3m4MifO5BYaOpJCtGDAlFRyD7Yf/J5IVvULuoTxVM/J7QSIsoR+kVfyQDJQ2aTHfUav1hxSQ4V6EGKwVfUCVI0cKMAGyJAKdGsudprsens++To9qd6HNKCemU1lIVlmt8RPjwY09QttZBoGLWVimuvhxgOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736514831; c=relaxed/simple;
	bh=uVqFlZ/v/H8EPP03k2VMZSMhFq2n8CJJJDDgRHfRarM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTZ6MSZx9/FVJkLUFm58Ha4FEhdad6grSL2ZioNKxP0FU3l1mTzEiBLW7QDEPSb16b7Xo4MlGBZfFRCZtr8j0wdrVpAjlybi42Pi7JPNuG+BhnkC+iVbLKC6eVGb7v5xHuufGRPnglQS/EUoWcp9nvgY6CO6e8DCPT3nngBWw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eI5KIJ5I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eI5KIJ5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736514829; x=1768050829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVqFlZ/v/H8EPP03k2VMZSMhFq2n8CJJJDDgRHfRarM=;
  b=eI5KIJ5I6h32dY7wCyj+GTvU8CAdmQJpe3WCE6c6dm73kLAXWWEU4m8S
   QH0mf9kp41oP7+WE5w7Re430iIDvpzDeETDsftz75labZGs7LCGUTbF95
   ACUh2hoXqm8ZW0Jvcr5hEHlkSsKrgK7AjpKcYrzCUoyARS59cSolVwhOQ
   8iQnX9FzbqkNKCYiq452StHA0lJyR6FvgyZcPT4qWM7tpAvUDOgPE4Sjc
   Spy6GKnGYIK7inWBmdSd1/SI6iB2mReLh9QJQAvu61oOuRxtm4Q97+9uE
   Yfnup31nBPgtSfeCuyWsS0a2UAah4RqPo/6PkLWBeCIgDJgx1LOVUTqq6
   Q==;
X-CSE-ConnectionGUID: 3T7z19cuTL2vtQmTI09DaA==
X-CSE-MsgGUID: 4ottBNmnRT2DYF0EeqRgSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40748518"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40748518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 05:13:48 -0800
X-CSE-ConnectionGUID: VoLqX/MHT4G/w7gu0X7SxA==
X-CSE-MsgGUID: n8MQESMiSzaUG8glpE16Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108833543"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 05:13:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWEpc-000JG7-12;
	Fri, 10 Jan 2025 13:13:44 +0000
Date: Fri, 10 Jan 2025 21:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2697/2697] kernel/dma/map_benchmark.o: warning:
 objtool: map_benchmark_thread()+0x2a1: unreachable instruction
Message-ID: <202501102124.mb3xJ7Vt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Barry,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6aa478cf2617c987fcc37cdc8281a4cd310d86d9
commit: a61bf6dd77b6030e05a0caf5cd18ec98f5499d9a [2697/2697] dma-mapping: add benchmark support for streaming DMA APIs
config: x86_64-buildonly-randconfig-003-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102124.mb3xJ7Vt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102124.mb3xJ7Vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102124.mb3xJ7Vt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/map_benchmark.o: warning: objtool: map_benchmark_thread()+0x2a1: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
