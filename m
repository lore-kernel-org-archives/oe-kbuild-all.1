Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978E13E03A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736714619; cv=none; b=DHwbPzPz11S4VI+XmBvKL/ntgU+xjEPr6WkpYzSV9t9wwRGC4Y7IQeuFTRcM7IHFly/n+2x+dRpq1pnJksRBsVyUP2CVloJhLXmnHj8o+KLc5EImReKzoUcdh0iDdAIyxcBGrMYxTIP/MLR198zTDZeOi1gxKyOfA3KfD4SpcPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736714619; c=relaxed/simple;
	bh=pvT/U12F6N5BIhfSsdb58Qwxq/f1uwoOIdC1l2iOza4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKJKN9gEjLFf8bj8/Ga06VUW2Bf43OCMcPcTXc9EL+V3UYKuWwaovDw5uwZghoeeuaTUOP3Vr7NLmxGEdkcRsBLEyCMfZtxJ9oQhRbe1T3Dd1cifEeF2jxAp37zYvaJtVyy0rQj0+YFaDHszZLu/jZGGXsFFqvhWn6PbZzCHclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl8Lco+Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl8Lco+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736714617; x=1768250617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvT/U12F6N5BIhfSsdb58Qwxq/f1uwoOIdC1l2iOza4=;
  b=Fl8Lco+ZrmFfqOCgGqKI2I9lsZ6DhHq984ar4l4I5n9kG/t37pI4IxDF
   G0wbHfhoBnEFiJQaQcyU23dEBVtalJ7LpQbzMfJwPk85ZuY8s7ElgSJfX
   jIWN8yfWUR+YcdkGJFPPcujd2hLyOWhbURIm7NsIbEGWc18+bpa5BaWu9
   BJJ1d7SZGF2tfZhzI8lQJE3IjEGWg1iBdz4ni5RmZ4ymY9LZ3FBME7PDx
   5pjjswEER994k3bhE34tpuB9WWjzvArzdfqcnrzV1cDM+4v4HC0J4PuzQ
   LtwSWWWfr45wMOxwhJ2mrpnTbQ0dU2BopvNIX0Of2I8kfov4nmhUdo6ab
   Q==;
X-CSE-ConnectionGUID: a4yY0LXKSeW40agsZbwCUA==
X-CSE-MsgGUID: vwsY6csWRMGszp4GF33jiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36823833"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36823833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 12:43:36 -0800
X-CSE-ConnectionGUID: 1RxTANcdRHKx8PGi4fB5tg==
X-CSE-MsgGUID: QNik3SO1SQ690Qou3l4drQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135122345"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2025 12:43:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX4o0-000MN1-2n;
	Sun, 12 Jan 2025 20:43:32 +0000
Date: Mon, 13 Jan 2025 04:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1367/1367]
 drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202501130418.3jlucwx1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: 81ceed41d0c2b2c9300de7bc30c1451680257f52 [1367/1367] watchdog: add driver for the MEN 16z069 IP-Core
config: x86_64-buildonly-randconfig-006-20250103 (https://download.01.org/0day-ci/archive/20250113/202501130418.3jlucwx1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130418.3jlucwx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130418.3jlucwx1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
