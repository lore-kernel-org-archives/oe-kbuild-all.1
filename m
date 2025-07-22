Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051592236E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175258; cv=none; b=pjonJ1uUvO1hWOjtfVKwXBf1mkl3tiR8glIVVLNpSOjJ5A9TNrHoocyvakibYKyZGq7jM2QZraerKQA0W4mVa9AJJmfrOXzCvES8LBWkFp6vdtzbE6QgMWv/ioksasCdzNYNUn6iB2zvCYhuqgURcPNqUnEyedei3XtUUQ0iiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175258; c=relaxed/simple;
	bh=NOzURWAKPVStmnQoq7qCw5XeoCrVnyzlEV6rsr2Uj4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2zy+x+3QSIC+pLZO4otUf+A6oj9AezGr3MzF8mRl942xBDpAJceQDf0ptPSQ8r15g1GeuiQwzhik/9yZwAWrANawyPGY4E/86uWFdYZPxULEEiLcXWBSyUWNCbuv1Mi8VevmJSVOO9auKyiCVJuKjqDr9PZZDIiv1VzUbtMjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E12dTrzu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E12dTrzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753175256; x=1784711256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOzURWAKPVStmnQoq7qCw5XeoCrVnyzlEV6rsr2Uj4I=;
  b=E12dTrzudOcLwgudPhdBC9/ePXa6bFPPqx20PaCv8kJ7EtdG35PEjM9Q
   csngYbkNZTwLr+IHaIy9vyfrrzWg+kpO8uTjoVyyfVbVubk2A3QRn2Hl1
   njIFwCEkJSGOS+dFAAcygIrqO0MD7jCK4PJHl2oQ2sDm2lBp3QeDEB2TS
   O2WW7wtLjoc6sGq9Btb5F5y8r3q+0vk8p49E+s1RpOfMKW0TBHoJy5XeE
   enMJYbzWm10AgZn2plT8/Fbr9UVD2aVZydSW0lYFLKEeA09IB9srESDFN
   XnpMi5xp2RvVDxXe/6jkw/Swp1y/HIpQvEuKALz+fKikCOZzEsYDUbMzK
   Q==;
X-CSE-ConnectionGUID: 7msWW/AASQOIszvXGHl6jA==
X-CSE-MsgGUID: SA+jwM4lQlawlxyd+DLi8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="43037983"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="43037983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 02:07:35 -0700
X-CSE-ConnectionGUID: 8Uh9hx0EQcKh0v1HL1Nbbw==
X-CSE-MsgGUID: 8UQBGl0MTFyUGQQy3rhK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="163635287"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Jul 2025 02:07:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue8yC-000HdP-1X;
	Tue, 22 Jul 2025 09:07:32 +0000
Date: Tue, 22 Jul 2025 17:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for 'memcg_reap_background_set'
Message-ID: <202507221753.jdLirslx-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: 67960246d7b8e4034d9a6ef1f75aaa35353ed21e [34/34] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250722/202507221753.jdLirslx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221753.jdLirslx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221753.jdLirslx-lkp@intel.com/

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
