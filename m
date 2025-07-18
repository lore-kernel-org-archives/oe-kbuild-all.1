Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B42E36EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752798416; cv=none; b=K0JQdfAPsCPlL24A4CLc2+1wPP7VRHq+Q2TgqLQPjPUBtaCCd5l2nB4SWNAMtnZgVLWU3Cl5cohTB07Dw6hkwfWY69iuTbc/wwY4nt1QS1CDJZjIJ8lW6j16yUjoi12sJLVgCMUyfLAxPO0lIXG9iNNilYPNXwLp5HpURRp25ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752798416; c=relaxed/simple;
	bh=wY/XceH3V0RI1WN6/+9yUeSkLlDs30zmQXSs9Adiyw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T5oCN7l8uJkr0Fo78vKsNX2jJYK1uMDC3z6Bv0/YxnE4WuLLJ0nzAbY1MSy8TuoP0QMKUqQP8aPmkofRe0HrK8q+gx0nqbeASznUNyZw/vG4hefoe8QCnsP2so3W7lMknBOhB7+vnYF1a7vct1cBrjJb7nTtpAD6uZqbTqCttb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwYEWyka; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwYEWyka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752798415; x=1784334415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wY/XceH3V0RI1WN6/+9yUeSkLlDs30zmQXSs9Adiyw8=;
  b=kwYEWykatb5JIgBUYVk39n3Fhk6GGI9QNLGsLbIypX8Rch74k2YfIrMw
   ymDbs77ufcteloNS1NVN7YEv3T+z7tLNtiub7SX3s1d6suZxVUoVLk9Ub
   yBmFf7pNJ1UcI6w8FAPrgEE8aul8WhUF8txMOd7Iyu+6DOX+ptAfFw/C1
   u65T6JQwh+qrrB/hAbxRL/gMkGXA5VUnJfWQdVU4CO/A9ok89ieDwKfBR
   tIj1craAWZD7cqyB9uMkVHjCmtQTwAq8bnBCVx2xZzgOssMxR67zuMHV/
   ahXFg/qxB2Utce5te45WdKhJiDGOJUFjaodRsxmPhYP+Y7pul1iKRWVBW
   Q==;
X-CSE-ConnectionGUID: m/t95jl3Qx6B1UeVn9UFtw==
X-CSE-MsgGUID: yvV8iuFjRPSOaQhridLrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55175111"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="55175111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 17:26:54 -0700
X-CSE-ConnectionGUID: 2z8B/H9DTV6KjhKMVQoJ+g==
X-CSE-MsgGUID: nNAcUI1nSOOOcfDvsos7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162225289"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2025 17:26:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucYw7-000E9x-0B;
	Fri, 18 Jul 2025 00:26:51 +0000
Date: Fri, 18 Jul 2025 08:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 block/blk-io-hierarchy/stats.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202507180811.hvccAQ89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: 17e60c04404d52f58c2233ea5b72014f0d834e75 [1732/1732] block-io-hierarchy: core hierarchy stats implementation
config: x86_64-buildonly-randconfig-006-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180811.hvccAQ89-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180811.hvccAQ89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180811.hvccAQ89-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-io-hierarchy/stats.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
