Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B561AB50D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740689230; cv=none; b=RHlpce+UpzcnJPIhZrvWg0m67Yq1kidknbS+b5WVQhUvuuyZJkfNhngd7jJk83NpzntKcnfAROjQnntcmm07cR4FArn8lV/EcS/j/BKkaDRIHc2pj3nrSAoqsVxn6r/Fl2LP0zNiFJjGBUfjkKIS3gMieZRMxRy6bDJWt1afHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740689230; c=relaxed/simple;
	bh=/E0e6xL3yU9N+M3ou+BnIiw9641IvadhdqOuK4X1BE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5fC08Ak0SfUXW207+xrsgAoSzxcbUnKyRlHZvpLoGaZvy2YAojgq3zx5T+PWlWpISMSRaX3xVNqh5q8VvJeD2kFUaccOxiaPtwINFtWbj2z+NeXrVP4OtxthmWOGYHHgKj/IMv2Q1mS4K4ptNmtRf1Q4C1GXTuAbAoHZn3uRGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIqevep0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIqevep0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740689228; x=1772225228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/E0e6xL3yU9N+M3ou+BnIiw9641IvadhdqOuK4X1BE4=;
  b=TIqevep06ik6eIj/Gcw2EqU0hdZZsbfkq98xGGd9aNWJFuN1iz3SzK87
   99nZ8Chx2lS5cF1/CRNk8rKU3nZ1juWPu5yBDCJeGc8LKkY0xUya3hsbo
   3nv9KoiOdsUNwBjkQA1Lh6w7aZjpfqy6njEanuFP7vSQS2MK5xCkKUWy8
   soW7MzqG3CMEy+0KocoZZIexzuUFTfsMBsc87lICvANvHWIljFqnMf1/J
   AuHlJaCVPHrh2CHMy2tpsN4WLpgAsRNXQvRh89wWxnXxq/X2tmfDsSsdq
   o+p8LWehBftMqeZEdC1XDxy3KjMpxIikveTiQeOyxCGVZlu7ONbZgJz+5
   Q==;
X-CSE-ConnectionGUID: Qehaw+zgRdipDhTqXKMlnw==
X-CSE-MsgGUID: WLeX5yjjSh+BxQQhk72Npw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52589500"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="52589500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 12:47:08 -0800
X-CSE-ConnectionGUID: FSurXt5VRFqG64nyKU+Lug==
X-CSE-MsgGUID: LcKdiWySTciq9BIJmuS/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="140355870"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 12:47:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnkmY-000E16-27;
	Thu, 27 Feb 2025 20:47:00 +0000
Date: Fri, 28 Feb 2025 04:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for 'memcg_reap_background_set'
Message-ID: <202502280420.HFTXiopr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   bc3571ad32fc024bf5e172669551e68754a5acbc
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [1/1] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250228/202502280420.HFTXiopr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280420.HFTXiopr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280420.HFTXiopr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
