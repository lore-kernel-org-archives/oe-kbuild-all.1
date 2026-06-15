Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344563E9287
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526370; cv=none; b=NEXuP3HdAX5jY0tCBeusXzd/3BQOyx2b3HRPiyBavRdYcppTjKD5U28XfB3wGZ2sS6/6dy44FEMArTTSfS5EiiRvg6Huja7Jla+1/hdU6Y/MWUZtQEmzSjW7wogJliLsRNiX4FnnA7ng99SOz4hZeTvvUgvD2UtTFJRmqf4vZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526370; c=relaxed/simple;
	bh=yUd/iM11MFYlaIHtfGzuJU4noQAwF2/98wvX7qiBRXk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sF2i8mMS66HDMMjPB6LrK5lUwG2VIo0cRDJf+Ye/6i9vyGx5MZs3TVkZgkYhTpx+775Fh0EJ+huMzjB2SXcVxwJ09xJssABtgMolcPDzuaDxddNxP6/a6Qu0iNErgbiy4ti9Nc2i1sTKqfEcWgxk2z4S7rnFWKSZG4CHAtQm7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIryqW7k; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIryqW7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781526368; x=1813062368;
  h=date:from:to:cc:subject:message-id;
  bh=yUd/iM11MFYlaIHtfGzuJU4noQAwF2/98wvX7qiBRXk=;
  b=FIryqW7klGGGwzlofmrcyltOUgzITTjqCL4xITIYBnmAYcs0yKAaSyVM
   pjmfNIC+akoGdUHaTbEkV4dwPlU3CwxnAemGHsPv+QK6cKyyEy5WoKTqC
   8YC7YZJ6QGgutm2lNbYnGzmBfa9m11KNd5cMFbuBUPK3EUCpjBufPCwM4
   qAEZNNM65WJR+tDT+u4vLT8wfjqhTjJ1YNyFEQq0NifHsjBNsUZ5epjKV
   fx62JLmqYhX84J9jKzMAfBQwRaUGqTR1KPDzOCnZQjWXhjTKB1odA99mj
   E5WnWnM/O1Z8+LpAt1oY59F7hp14I9k+7M+gDEqYusBObADI1++kyIuNo
   Q==;
X-CSE-ConnectionGUID: yoyLE/C3RaSNHhFoDu8tvw==
X-CSE-MsgGUID: rkaZyCR5SPGiu04nUXaCsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82454841"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82454841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 05:26:07 -0700
X-CSE-ConnectionGUID: cIasmdmST0KGkGT3pCtenQ==
X-CSE-MsgGUID: E8ZuO5zxRFKtKE+VPxWmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="245059791"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jun 2026 05:26:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZ6OB-00000000RqA-1jbZ;
	Mon, 15 Jun 2026 12:26:03 +0000
Date: Mon, 15 Jun 2026 20:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: {standard input}:325: Warning: macro instruction expanded
 into multiple instructions
Message-ID: <202606152039.Iqxo4Cdh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: 0c7d530a04b4cada1042ecaf49e12dafe90ce30e hwmon: Add TSC1641 I2C power monitor driver
date:   7 months ago
config: mips-randconfig-r111-20260615 (https://download.01.org/0day-ci/archive/20260615/202606152039.Iqxo4Cdh-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152039.Iqxo4Cdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0c7d530a04b4 ("hwmon: Add TSC1641 I2C power monitor driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152039.Iqxo4Cdh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:325: Warning: macro instruction expanded into multiple instructions

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
