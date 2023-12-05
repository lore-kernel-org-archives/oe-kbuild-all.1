Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000BB4D5A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSl5xU10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701778720; x=1733314720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5WN3ivpWAFzOxw/1UNoAdkoH79/mRn5U5fxsmOTcWk=;
  b=eSl5xU10eqwdUgZytDjOXidcHdvP6kCewFVOqRtTI6HvrlZYgNduHkUb
   Y+77LwV/oAe01Gx4xOlh5ygIKJwZHIU+/teWpKiUQ/b+/FQjMYNhbNmvE
   ePs5DjvXMpF5NOCNrIYIsVsBXpQMFkhHaNzTA0QXJvyWR2iK9o93iz/Or
   IlNmmA6kue7yxqYKC7BHiNVGab+B3kDgAIPLUybW++zktO7T68nXDBjcO
   Rj6SE+AZ3SkOxyEciku6WhDSbUSpOErGIO8+3omflPodvFb0lRfoC2Dn8
   PPyKaidIvINAykxdex+804dBYpSc9JYTVs7UvAttVXOlnmKl8kyo3r6/n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378911157"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="378911157"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="894361728"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="894361728"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 04:18:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUNo-0008xC-39;
	Tue, 05 Dec 2023 12:18:36 +0000
Date: Tue, 5 Dec 2023 20:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 43/64]
 intel_ace2x.c:undefined reference to `hda_sdw_bpt_wait'
Message-ID: <202312052058.tcMLOLcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   397fa61fc8605656143d539ebd1b1fa11c274ed4
commit: 9036aad8cde37ea883e7689366dbb48f2825aa34 [43/64] soundwire: intel_ace2x: add BPT open/close/send_async/wait
config: arm64-randconfig-003-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052058.tcMLOLcY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052058.tcMLOLcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052058.tcMLOLcY-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_wait':
>> intel_ace2x.c:(.text+0x2fc): undefined reference to `hda_sdw_bpt_wait'
   aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_send_async':
>> intel_ace2x.c:(.text+0x4dc): undefined reference to `hda_sdw_bpt_send_async'
   aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_close_stream':
>> intel_ace2x.c:(.text+0x62c): undefined reference to `hda_sdw_bpt_close'
   aarch64-linux-ld: drivers/soundwire/intel_ace2x.o: in function `intel_ace2x_bpt_open_stream':
>> intel_ace2x.c:(.text+0xec0): undefined reference to `hda_sdw_bpt_open'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
