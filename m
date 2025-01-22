Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7B158862
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 04:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737519270; cv=none; b=Zhan84E+XQc0S0nkK4BIhALxhiyqOQhZSPQa7LKovIQC3AXk0wAvitFihpYY6WuOAiOUlwSYOY2vfYo1Q1BW0af2cGRg3dHpDlm2jG+WpWJyuANgZxSdZxkxdozDq0oE5FRb7CRbvEo85gxACNH4uafS0kv/jJ7Ju/2xU1m0fCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737519270; c=relaxed/simple;
	bh=EIiKJWYK6rW0DfD2MTpUCaQWjJn+6cH2VDwr5ri6QH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mESog0HjtQh3crBF6V/vqzQd/4QvmAVhLjO51xcb7M7XQX4tqhMNXS5lGgRNgsipsr1bD4+Sz+uzOGYHtlFXboVOT+XHMrjJENe2c/BNZMvI3gupID8bd62tvKSaag54UQkkE9cS2sRS6j9OWDLayz2o6+jSKhxqSd33E4g881M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni2mcuJD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni2mcuJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737519269; x=1769055269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIiKJWYK6rW0DfD2MTpUCaQWjJn+6cH2VDwr5ri6QH8=;
  b=ni2mcuJDuybFt3JNCNvEWVK7/vsvCdtJ+FSTJ7NbtjtmW81LQ7SacxZk
   /pbJr0XTmv68oRwkDk0hlEWRiQwQkXMwXK5maJ3Q8mnWSSIAPQtLRvtx4
   ZVx+y1gDPiO7cy0REc+wuWz7TBy6+y0C9sHQwD0fh9xIv1a+4Vkk6D/I9
   EUx9foaxc0DEz5/f3nNM5logpvV1id+sb69cO2ntWoN8V4qC1ZppWFoYN
   3UHcur+9yE/ARCcjS1cMexpeZtNg62ocSmDmSAEPSze4SaK4gosN5s8Hu
   /Zu4rlqcGlQXCOb/e8IiBO43xBPjYP98lZ9j2rv0ViiLW+JU7EhEJ65tN
   Q==;
X-CSE-ConnectionGUID: HjU8GaBqRiW/tZ2qqioIwg==
X-CSE-MsgGUID: eF0JYpXvSSCvLYqGCJDR8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37836382"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="37836382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 20:14:26 -0800
X-CSE-ConnectionGUID: a/QLqIkxRaOqtEQjE7sglA==
X-CSE-MsgGUID: DQAXiJ1nRHOsxCHPJGTSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111034985"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2025 20:14:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taS8D-000ZRH-1k;
	Wed, 22 Jan 2025 04:14:21 +0000
Date: Wed, 22 Jan 2025 12:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/28] ./usr/include/cxl/features.h:44:9: error:
 unknown type name 'uuid_t'
Message-ID: <202501221201.aGZ0R6Ay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   d5a7d3fe1f2f85a6f799a85620577feff4fdc4b3
commit: da7751c0fca053470750ad657618355d678a609b [22/28] cxl: Move cxl feature command structs to user header
config: x86_64-buildonly-randconfig-005-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221201.aGZ0R6Ay-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221201.aGZ0R6Ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221201.aGZ0R6Ay-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/cxl/features.h:44:9: error: unknown type name 'uuid_t'
      44 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/cxl/features.h:78:9: error: unknown type name 'uuid_t'
      78 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/cxl/features.h:106:9: error: unknown type name 'uuid_t'
     106 |         uuid_t uuid;
         |         ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
