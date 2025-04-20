Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54319EED3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745159771; cv=none; b=aWJlAQNmrSjipo5orspyOUTOVY00dNj+dvAT1YwV8nyJ0jffeG6QUy2B+HdMM9n8+qNbJMk4333VsP0oSRihvRyr511a5AcUYUCyecII8f+3XQF2JKHGRTOx6Vmrw66i2sR05h8HZ8mLRmPHQ4gK1nfkB4uBqYqcaOSuqIe5ANg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745159771; c=relaxed/simple;
	bh=Dt2Bq15sNTRwrhyyDiFGZ0YRRbTc1zdf4t4NUyXlqXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owPrpCxSD2ZmjHW315ttjuKQB0kT73V+TqggZ3tP72zceslEg18qiiFsxu9glFwoL+EcI+s0bMkDj9b6AP/ivuVsrwMIju2qh4bnufOrMSWUNIWDO525yKkg+UrBDE/PFSDmTAUBn+SeBgH+agrb5qk3nNjjqvMk6fuQ32zlFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQY9m+Cz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQY9m+Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745159769; x=1776695769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dt2Bq15sNTRwrhyyDiFGZ0YRRbTc1zdf4t4NUyXlqXI=;
  b=cQY9m+Czufm0JQCoQnKzO0GNy0EWyHqKuboZMqE9ImbmuxrqZ9MPNOLt
   k7EwFjqrPCS+Vab57XHKviC9EC8/7AgRL5/nCFxxTJfoug/89sEADBdj7
   6ooI9qLMCZ9wPqTuD4s9gpYwppJLltY2jutBNPPhX+AZKnP2vuaemEtu6
   bQCv0Piy5P96J4OezlvzDKY6q4ztNNwwKYMhXRRSkCkx2A2BWDpIvdecr
   xW5nPq7UUs3E490ubZmtMZum5mbXGgyEZ5lehaW3o7Rx3o0tBUFx1x4MD
   RhPH4PqqAcGAcQtsd7T7lh8VqJwMeg3fItnpDABmyXZRqcFwqjo1zBjIx
   w==;
X-CSE-ConnectionGUID: 3zUWCPRSTECdWzLvME4iJw==
X-CSE-MsgGUID: vlbHIu3RRiyoeVzgYCH13Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46603690"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46603690"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 07:36:09 -0700
X-CSE-ConnectionGUID: BDNr4xUeSnOiK4k+Gg3l1g==
X-CSE-MsgGUID: HKSDcR/ySsaIydodr4hl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="154670499"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Apr 2025 07:36:07 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Vm8-0004hb-36;
	Sun, 20 Apr 2025 14:36:04 +0000
Date: Sun, 20 Apr 2025 22:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 6/6]
 drivers/net/vmxnet3/vmxnet3_drv.c:150:16: error: implicit declaration of
 function 'native_rdpmcq'
Message-ID: <202504202211.q7GyLTag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   2daa371015bd327aafaa0e7d9982d3060b1cae62
commit: 2daa371015bd327aafaa0e7d9982d3060b1cae62 [6/6] x86/msr: Use the alternatives mechanism to read PMC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504202211.q7GyLTag-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202211.q7GyLTag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202211.q7GyLTag-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/vmxnet3/vmxnet3_drv.c: In function 'vmxnet3_get_cycles':
>> drivers/net/vmxnet3/vmxnet3_drv.c:150:16: error: implicit declaration of function 'native_rdpmcq' [-Werror=implicit-function-declaration]
     150 |         return native_rdpmcq(pmc);
         |                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/native_rdpmcq +150 drivers/net/vmxnet3/vmxnet3_drv.c

   145	
   146	static u64
   147	vmxnet3_get_cycles(int pmc)
   148	{
   149	#ifdef CONFIG_X86
 > 150		return native_rdpmcq(pmc);
   151	#else
   152		return 0;
   153	#endif
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
