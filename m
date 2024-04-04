Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8726DDA3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712196744; cv=none; b=CY6LWIJEp0kApg2GU+ArIU0mJq6JmiUG+mdKmNSTRLCmifJwshGlArvYbDzwckfkgjdL3iXnww+nfzyoYz8DfiTlFKgz7riiPW+WmnwZbvg84KrsOguLeXRERhn/eX2iW9nhP806c5qnOtKYauVts1MPyYiyeXYXJxs1o0zPb+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712196744; c=relaxed/simple;
	bh=O0i1ITn183ej9zcJfJhGSJW09g3JY8ZblIWYCdEa8XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnCC0+crirVrhRcgdvGZ6L6SQMhau4ijjNG+nOBMhWrNBb5VVxqGWUhwxXtce+ggdE2ZbmwR/MZ6qwIYARRN18/xbc/4mnL51RzdFsI96mYgD2NNtJdKKehAm7aMqPJegj4frGr8ksd7mVyxSR0m3DDFoCNewmHiiC6ZksAUem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvKHXrd1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvKHXrd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712196742; x=1743732742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0i1ITn183ej9zcJfJhGSJW09g3JY8ZblIWYCdEa8XU=;
  b=dvKHXrd1cnKtk4l3zX7IXwfX8wNIv/ANo7KigEMh60jwNfzRoXhdSTFQ
   QU3l2rW/qM/c4lEcTV4g6BByODd+Bi833IFu2cGdMlWMa2wnzNUFXOQ7R
   XSLPsNxksbdVSke3ql11Oj8XljzkIsWKIWgMUkwvwD4OT++SvgjVbpENZ
   xyYKooMcu0u7+MGJNbjzZdyjonqiJr8a+47Wgpl+2/JekXkVl69LDlVL8
   zvN+8w+6ibkjeF10KL0F59WyCHGt5PAG5e6I2mcFAFusd5GGhGP/p6i3z
   hcWieUlX5iBLeGbteKIEnNIdDoFcWPukc85tPUUgjktKWZVzbExxXcpHn
   Q==;
X-CSE-ConnectionGUID: nrJ28iM9R66y0NwyKbAnBw==
X-CSE-MsgGUID: V7gqxdWORS+3DpVn4A3iJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11290542"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="11290542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 19:12:22 -0700
X-CSE-ConnectionGUID: i0lxKGQzTWWpEaLu6aiMDg==
X-CSE-MsgGUID: 4Mm6XMdnS/ucGS7/1o/qWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18606808"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2024 19:12:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsCaR-0000Tw-10;
	Thu, 04 Apr 2024 02:12:19 +0000
Date: Thu, 4 Apr 2024 10:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/testing 6/6] timer.c:undefined reference
 to `__traceiter_tmigr_fetched'
Message-ID: <202404041032.1RSsViRj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/testing
head:   45406f6df1aa857434d206a1b0b9274b68ff5dc1
commit: 45406f6df1aa857434d206a1b0b9274b68ff5dc1 [6/6] tracing
config: csky-randconfig-001-20240404 (https://download.01.org/0day-ci/archive/20240404/202404041032.1RSsViRj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041032.1RSsViRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041032.1RSsViRj-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/time/timer.o: in function `__get_next_timer_interrupt':
>> timer.c:(.text+0x1cbc): undefined reference to `__traceiter_tmigr_fetched'
>> csky-linux-ld: timer.c:(.text+0x1db8): undefined reference to `__traceiter_tmigr_fetched'
>> csky-linux-ld: kernel/time/timer.o:(__jump_table+0x74): undefined reference to `__tracepoint_tmigr_fetched'
   csky-linux-ld: kernel/time/timer.o:(__jump_table+0x80): undefined reference to `__tracepoint_tmigr_fetched'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
