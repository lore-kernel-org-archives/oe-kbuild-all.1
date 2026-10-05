Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A1305688
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180246; cv=none; b=hlYoDxFgCLol5ulpW0ed6xVBkZvhNZ2NWcbox+YdNtE7ULPvdyfTM85bBFu+KP10kM3ZcGbHcTqtX2fbyRtMmLFAEjQHmGX5KGo4keEH3Q3AFNVQooZgSpSp2arfOlA8H/nNKz/7gFzO2/oM+h0DTFsmSAXLVJQDoCEjCguwRmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180246; c=relaxed/simple;
	bh=SvtkHulsSNaNOF4GJfGVCtY7yooLz2S8g8xnx5qu2+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eCEYrOV0VtNKiNaYGWIALjYPybuqIZipBX5QMOfsDr89J/WaTVWZv+wtPCtgnYCNrjWCgNxMJjMfS7eonUJiEYoe6szWVXk6TP15ax5Kb1z30x5tnTxwPVeDfDAVPNgjUa59u7ZN9sW1IHKd966srFeZ/12mpgGqjzGb/8gTv5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERUsVRi6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERUsVRi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791180244; x=1822716244;
  h=date:from:to:cc:subject:message-id;
  bh=SvtkHulsSNaNOF4GJfGVCtY7yooLz2S8g8xnx5qu2+M=;
  b=ERUsVRi6TkoP6gHiRsIMErqcjkAjOUOCcvOcTs78a3ldSTypBTTORzPw
   IrbYOSpmMvKuqJOcHj42gt11l5YZE+7+VuAY/EvPMH0uJbPUEAVj5o8be
   RbmPHrDX6Dd7PObDER2oRGUh3ZLiy4V63T18VbkZ7Gwf23CCbgsnEPjl1
   /DkWZPPmgO54xpT9MNBkcCYLG/XuwYEhYX5LMCwQwkCbQ6DYF1O2GpoQ4
   eiF9ry7rspQS7LsPx2CDZWJ9SWC+4ffeiT/d5pq8CgEBgJXNPIXoXOFo7
   +acMcNLS4TFpQxnoXIoWrbGKonRbjcNgsMvLDxkqH+SMFu4gpmA0elL8j
   g==;
X-CSE-ConnectionGUID: IfJieJ7sSB66xZY2tra/Vg==
X-CSE-MsgGUID: lHkAPhsbSgG7lX3jWaXyRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90875506"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90875506"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 23:04:03 -0700
X-CSE-ConnectionGUID: MONF0jN8RYircXUkVd1l7w==
X-CSE-MsgGUID: 1U/LfH98SMKvJvoSywNX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="275840534"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2026 23:04:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDbnr-00000000VOT-3kas;
	Mon, 05 Oct 2026 06:03:59 +0000
Date: Mon, 05 Oct 2026 14:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-p3-wip 8/8] Warning:
 kernel/time/ntp.c:105 struct member 'pps_late_pending' not described in
 'ntp_data'
Message-ID: <202610051347.OjzhDTIT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-p3-wip
head:   24b5bb6499c7dcc715bf50f768bc24b50f9cc631
commit: 24b5bb6499c7dcc715bf50f768bc24b50f9cc631 [8/8] ntp: Apply latency-direction PPS frequency innovations at reduced gain
config: sh-edosk7705_defconfig (https://download.01.org/0day-ci/archive/20261005/202610051347.OjzhDTIT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051347.OjzhDTIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051347.OjzhDTIT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:105 struct member 'pps_late_pending' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_rawring_n' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:105 struct member 'pps_late_pending' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_n' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sx' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxy' not described in 'ntp_data'
   Warning: kernel/time/ntp.c:105 struct member 'pps_fit_sxx' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
