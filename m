Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2A1FFC59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777261; cv=none; b=FczExD3t+10yZ0kBeGHHE5sUeG7bcbUnfY5etU7K2cGsHW9ItRP3pZQIEVOYQqIaDokRf4VuCn+WRgtY6Z+I/bTRubMhjm+n5WIfCTeXrPHM5jAPJlaizomZC9SNF1U5DxfR5m1ajOg2H6dUGieph6u3U2FSE9yL0FxQZnzzxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777261; c=relaxed/simple;
	bh=A6U26It4OUYxiXXRaJIIz1VHDVftpsY8JUZeRLRjBmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kSHW3axIFPyjWpCDqakkStjKChU+H8FhHvMqnA4wpOirVXTA4sUVsoSKGwoHnlKn+QsGTLOCE39KkZyaRJvcf4021VmtBZkPs0tXgaBEClfhEQ6PFkAh2Pr8GvrA6BRksn0HXOqwmNDPOl93CVTPBmf1GCPg5FbcY65cmNSfy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1Q4a5mI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1Q4a5mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785777259; x=1817313259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6U26It4OUYxiXXRaJIIz1VHDVftpsY8JUZeRLRjBmo=;
  b=m1Q4a5mIdl/RC3WFaR9R+2Hnv6lJPqSQTX5Adyv8XqesUqERvDCpdvYF
   tFCg5AvEr7aF51NAl/c9EvJViYsTM6J5qygLIs230jEFZYZX2RuaUYb66
   TST2W5MtqK0HH8kw/GzsB1J212NYhepRI7vlQZFsu2K9AtqQECVgw8QbE
   dOQyran8yUhEeG1QzFhmp1W9ou12/vU97C7Sym+fUhBBjDpNibIFCmq0V
   ah8dtI+VVgxiKbIyF79VyJAGnytx6UMYDa/ljdPbMwnPIBxQUi48NuETf
   RH4bK0aJpwvwbyInCtMeHNn2zV/tGLXLw+FUcVxv0w+ebhJLpGVt6GGN6
   w==;
X-CSE-ConnectionGUID: phkhbSiWRKuMKOEsSWnb1g==
X-CSE-MsgGUID: ZCVo91bUQKKIucBuatWn8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90131963"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="90131963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 10:14:18 -0700
X-CSE-ConnectionGUID: /OJpylS5QCuJG7P9rzCSCQ==
X-CSE-MsgGUID: wpU1UHlaRHGfphJmmhHiYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="260681375"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Aug 2026 10:14:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqwEx-000000007Re-1KNd;
	Mon, 03 Aug 2026 17:14:15 +0000
Date: Tue, 04 Aug 2026 01:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/55] ERROR:
 modpost: "__divdi3" [kernel/time/time_test.ko] undefined!
Message-ID: <202608040152.bAXmEGvC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   60f852175b99dee11b414f69b62ce55ccc72fa20
commit: f9e58884873c10cac3de20f1c51911350553a35e [32/55] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608040152.bAXmEGvC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040152.bAXmEGvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040152.bAXmEGvC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "ktime_mono_to_aux" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "ktime_aux_to_mono" [kernel/time/time_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
