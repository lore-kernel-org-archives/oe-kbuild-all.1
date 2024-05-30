Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB33207
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051695; cv=none; b=NyKb5RGARr3+3TTZVXg8a4oce3YRTwfFbOZQ9IsYg7Q/uWZsSls6yU0QRaL0RZaSVaHGcF2TTVTlreXsv7FkG0RXLZkexZPYl10Mn/DZDSsJSIPxiInuhj/V0NNb5t4Fv6Wsi8qES990iIp3VkcVlFdTV/NZKcZIlqvdBrWn4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051695; c=relaxed/simple;
	bh=Tv3YwP6os5UUYuISR7f+IjEUrOVVLIk3A6jIHI7UHI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKyp0kN/zOAPNqAhz7A1O6zmXNU14F0tijTPnT9CMxxu8oYLGv1ase3NlAdci9hLFAS6JnJ/QzI/sEai9m2vA5bHQW0D1ljHEQhNSI/UvuErLczxY7yhBDjbbffQTyJ+wTPKTzlUEPNSpr8pi0Sx0HIzhdQ6C/Ou5Tz+lrr11zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzN6xjfO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzN6xjfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717051694; x=1748587694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tv3YwP6os5UUYuISR7f+IjEUrOVVLIk3A6jIHI7UHI0=;
  b=mzN6xjfOztKase7zQ5YseZ0SpWhYFZ3RGILYxaEXsRkTRVfW9nKlUNXn
   8DEc23g7fqERnEVQ79SxD2RsI60PQYx1i+RN8SxCX7cKyBrTTA9xx14xP
   xepIKGPCMrVW+tlffUF4/Ept8lGCEdI2bYm3h3GfWoLsr1ccwHieTGzpE
   MxIpTmdWGreDJymFgYJ+iInxCvEYxrDg+bmxg3hfttcDWAIpQANmoPk2A
   JECmWnjkNCMvpr1FuUsVVgFKcB+mWfdJRWvigPUl8J7wGOYc8AArf9Uzq
   RJxBRcFJozZRHmmPO3ZrjdXyUxmz5RuWc7jz7EHTIscG5B+iQIgkIoQKN
   A==;
X-CSE-ConnectionGUID: 8p7GU8BPSdKEmWUl+j0JLQ==
X-CSE-MsgGUID: 99mT6dGMQ82tqNA+3Swmdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16459264"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="16459264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 23:48:13 -0700
X-CSE-ConnectionGUID: VckoTnuwSg6YEREO4arq1w==
X-CSE-MsgGUID: 4WfGreJ0SMOEWV4AtZW+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35764435"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2024 23:48:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZa5-000Euf-1a;
	Thu, 30 May 2024 06:48:09 +0000
Date: Thu, 30 May 2024 14:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:fault-injection-statickeys 3/3] mm/failslab.c:12:10: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202405301437.m8lllsi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git fault-injection-statickeys
head:   98bfa5b94172a6af29ace2821c17a0dd8043da79
commit: 98bfa5b94172a6af29ace2821c17a0dd8043da79 [3/3] add should_failslab key
config: i386-randconfig-061-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301437.m8lllsi3-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301437.m8lllsi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301437.m8lllsi3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/failslab.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
>> mm/failslab.c:12:10: sparse: sparse: Initializer entry defined twice
   mm/failslab.c:13:10: sparse:   also defined here

vim +12 mm/failslab.c

773ff60e841461 Akinobu Mita    2008-12-23   6  
773ff60e841461 Akinobu Mita    2008-12-23   7  static struct {
773ff60e841461 Akinobu Mita    2008-12-23   8  	struct fault_attr attr;
71baba4b92dc1f Mel Gorman      2015-11-06   9  	bool ignore_gfp_reclaim;
621a5f7ad9cd1c Viresh Kumar    2015-09-26  10  	bool cache_filter;
773ff60e841461 Akinobu Mita    2008-12-23  11  } failslab = {
773ff60e841461 Akinobu Mita    2008-12-23 @12  	.attr = FAULT_ATTR_INITIALIZER,
98bfa5b94172a6 Vlastimil Babka 2024-05-28  13  	.attr.active = &should_failslab_active.key,
71baba4b92dc1f Mel Gorman      2015-11-06  14  	.ignore_gfp_reclaim = true,
621a5f7ad9cd1c Viresh Kumar    2015-09-26  15  	.cache_filter = false,
773ff60e841461 Akinobu Mita    2008-12-23  16  };
773ff60e841461 Akinobu Mita    2008-12-23  17  

:::::: The code at line 12 was first introduced by commit
:::::: 773ff60e841461cb1f9374a713ffcda029b8c317 SLUB: failslab support

:::::: TO: Akinobu Mita <akinobu.mita@gmail.com>
:::::: CC: Pekka Enberg <penberg@cs.helsinki.fi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
