Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC301D5CFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229156; cv=none; b=KIQL7dz+yux3Y29tHrywL1/PVwmFYVpB4NfNSj0CuFia0Z09SKyg+jycQ4ZYqOp+lKJQnHYgvNxuXHSkgAiQz3CWlkf55pt0yTctEWkF1K4PDGCZ8i0Il/P90hRdfNOrYxktZvtKGwP0NG5e2tAs+EUA+HtZ+dCvBhuGbbyXw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229156; c=relaxed/simple;
	bh=7Cw8pfJQhJWRM1PyFvg8r3SG7gVUn8PAKaEM52zOlUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bk5lCTQAWai9gSMZVh7AESPHYcuXmo0XRo5tqEqmas3+qSjWL1PsBxfsy60eOE0jTwjKo7Q1+v0o7vKSn15KVJGEf7hS6srmpBOkx6cJBFXvP2c3liwEgMp5dKIn/1LoiLM5Uz3ie8m4vTNd3edlo8ey9ktXxZLhuBOA9fzCu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mk/GdGVJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mk/GdGVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744229155; x=1775765155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Cw8pfJQhJWRM1PyFvg8r3SG7gVUn8PAKaEM52zOlUo=;
  b=Mk/GdGVJuYLQqikNb4sF4BMSJfSM4MueipF4EQixdt2dcK+gEp/ZgDNt
   4IwhaiCnqb69yh8tJaSj8iA0R249qItdxUGz+Rb3SeI2MavveILglu+jI
   m/Np7dTF30A7QOsmlGxHGjq114H4zR5eN/TZgW5Mi1Hb4ji0ob0ZGaXPS
   G0ru+pg+WKwzv6MUl8ds/6XLxB3hDLLK933fVdntxBLhzMB7lNTx2V6Uz
   2hSfYAQqX/rIg2wYnMtC+ZHC92x1lmFR6SbkwOyT9BSvn0g0xJR7wVs/H
   xTHKohLy2mvW4x1/I9t58g6ZnVYdTzS1WOKia1QUUKSWEGh12ft6AsfsR
   w==;
X-CSE-ConnectionGUID: p6KRK7vORuC1DjiqMqyy+w==
X-CSE-MsgGUID: 6JwitnT0R/mu+FsIUtUxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49523689"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="49523689"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 13:05:53 -0700
X-CSE-ConnectionGUID: 4JOQ3579QqGkkhYdmlWqbw==
X-CSE-MsgGUID: q5NMLKuhQdu922VZH0KBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="129517202"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Apr 2025 13:05:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2bgA-0009Fz-0K;
	Wed, 09 Apr 2025 20:05:46 +0000
Date: Thu, 10 Apr 2025 04:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571] block/blk-lib.o: warning:
 objtool: __blkdev_issue_discard()+0x146: unreachable instruction
Message-ID: <202504100333.uIAnI5Io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   332043630ae1e3b726dde819c6cb60a99afb2ad6
commit: dadc407ba9ceb5887da2bd4e4eedcf332bf47151 [1571/1571] block: check queue's limits.discard_granularity in __blkdev_issue_discard()
config: x86_64-buildonly-randconfig-006-20250408 (https://download.01.org/0day-ci/archive/20250410/202504100333.uIAnI5Io-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100333.uIAnI5Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100333.uIAnI5Io-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-lib.o: warning: objtool: __blkdev_issue_discard()+0x146: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
