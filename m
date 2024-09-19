Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04119E7E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726754163; cv=none; b=N7vdu/ZtAs+IDiq+2FiWc5b12SmPY950tdVZ2nXlBv/qKnzhA4TnPCQia5zqPdNm7Loujb8bg0tKba6aPOuDyVyyj9vO3dUbBe3x0AOJPzslMn2rFv8XHMU/AFGv3IxEOJWsN2/SaAa3hWdg8REwJIwgsMcQC07g011nT4mBHP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726754163; c=relaxed/simple;
	bh=LAlzYz+sjlNK5JEsr8DOqvVA0DDq53Gq5w3YT9BHI7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTBwFf4dx1dlUnZgTGC12lYKhPII6+r5ouX/7ZsLdNVprV9cHfOm3GHDGilC6r92VJ4IhzfygxRWednw1Nqq5Upxkh5zXI2Kpx46Fqt3t462Op9JZkYcjvY0DsH9xG5hrd/voS+ZUh/zgWKzusy4gzuWxluK2IIDs5TENsodp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B98XHTnF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B98XHTnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726754162; x=1758290162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LAlzYz+sjlNK5JEsr8DOqvVA0DDq53Gq5w3YT9BHI7E=;
  b=B98XHTnF5AYd8148V8xonlshNzxiDzJjA+oAQ9r/wQ7NRBTttl4Qdt03
   WF47nUfey1M2qnWbG1vYotBsY9H1ZLE6QjKLuk2/CNnce+8i+va6UuJav
   QO8v3We768oiVY2bWvs5tqw16Nd/p8x8UU8M3Wn4uMxemvK4kMQNSzrCl
   PKYk3p3wZ4qjsqR8jDZSwU9h2zR8v9zaxXHKifmv9QtVErrpoeYJ+Yxvg
   5ARbNCoPWGEV3+CAWHe8twLrXImZj8ufqpxCWiEOzDYi24EhxI2stINDu
   XfBJODfXnqPQMwXUSCg47Sksfur5dXrQsZc7b7YZ+SyWarLWbG4Xy4bTP
   Q==;
X-CSE-ConnectionGUID: mR+b01DjTTCXQUPOEI0qFg==
X-CSE-MsgGUID: YbASKqs7SUar3+JHt6YUCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36845603"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="36845603"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 06:56:01 -0700
X-CSE-ConnectionGUID: zyxLnI+ZTretna5D4cnVdQ==
X-CSE-MsgGUID: /vZvYVi2S5qSGfHAhoxaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="93234666"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2024 06:55:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srHdU-000DL2-3B;
	Thu, 19 Sep 2024 13:55:56 +0000
Date: Thu, 19 Sep 2024 21:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 8/13] kernel/time/timekeeping_debug.c:59:15:
 warning: no previous prototype for 'timekeeping_mg_get_floor_swaps'
Message-ID: <202409192105.DaLdoYKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   c276587422e7965813f945523c522b95b0f5ffcf
commit: 6f453b2b31051a046df355061b0bfcfe32198083 [8/13] timekeeping: add percpu counter for tracking floor swap events
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240919/202409192105.DaLdoYKW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409192105.DaLdoYKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192105.DaLdoYKW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping_debug.c:59:15: warning: no previous prototype for 'timekeeping_mg_get_floor_swaps' [-Wmissing-prototypes]
      59 | unsigned long timekeeping_mg_get_floor_swaps(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/timekeeping_mg_get_floor_swaps +59 kernel/time/timekeeping_debug.c

    58	
  > 59	unsigned long timekeeping_mg_get_floor_swaps(void)
    60	{
    61		int i;
    62		unsigned long sum = 0;
    63	
    64		for_each_possible_cpu(i)
    65			sum += per_cpu(timekeeping_mg_floor_swaps, i);
    66		return sum < 0 ? 0 : sum;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
