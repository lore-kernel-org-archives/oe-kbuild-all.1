Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75FD274B4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774072396; cv=none; b=YhLBqlTNqL05VAezyS3ZQ5dsGi0103NQIWj0gjp6MKpla/IiFkyq3D/gVS/Iflm0oz+gLLPDvXk/jgRaXIopujW56pYa0IRDQMsdp9QooAEj6a8FK5wStMSfOAET5AJIIyRk2bmvMufZ9QmO/qJNpN2DgGvD92BrZz+UhOt+I/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774072396; c=relaxed/simple;
	bh=vN7VSh8RCHngvf6K31e3OAQagiXAI9GiuCJE7BuLr/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LMU2srs+DgeIDX088X8amMd9myOdAda3WPEQAOuKrY5hi5x6kYE1Udpll02tBx1YBSQ6DduL2kmJOlBovhz8bzLGMcu9M7/d4+Y3xAaiaCm/aFrZw2UUy72PtVnS7fkUYwgmhF1q4+OT1GpnKB4QOtoTaWDxodEnuJ3oj6BKyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIj9KJl4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIj9KJl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774072395; x=1805608395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vN7VSh8RCHngvf6K31e3OAQagiXAI9GiuCJE7BuLr/I=;
  b=QIj9KJl4oHKOeaDtwrKvJv6WftzIRovFxOY2CBSaL8UsJiNX4pZmeyyS
   UkLOa8AxMz2tKrp6d3UvJU9pUH2RgYrHH/SNZHoeBELx14FTZjF9cWcXO
   Dcujf91Fe4CpygLL0A5/LaTD1dUjAd4c2wSIXw/qzxsa6PDSa9DViyfWC
   kVWeV9nZZvcvKWZMVyrBXeEypoC8gfOzlWMEz/UnKF4wbq/hjwXyJOGr7
   VfFyeW8jAOIr5LGkFnzMTs6xvSEXRNsLSTR4EgEHko6SMjMS1iP5oAClw
   oEekShlekos4zrVPuvCcmBaO6qWs0DmAAc1VuG3gU4W9JckajoxARLD/v
   Q==;
X-CSE-ConnectionGUID: ueNVj66MTU24ayk5TAI0yw==
X-CSE-MsgGUID: 6PJg6tjNTQi8wp+3ivJTFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75227124"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75227124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 22:53:14 -0700
X-CSE-ConnectionGUID: g0CYixzBSdeMi4Dcp0dhjg==
X-CSE-MsgGUID: 3pVyvEtHTr20Q6egmDMsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="261400611"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Mar 2026 22:53:13 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3pGa-000000000NK-3Zcl;
	Sat, 21 Mar 2026 05:53:01 +0000
Date: Sat, 21 Mar 2026 13:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 kernel/time/benchmarks.c:38:22: warning: 'count' is used uninitialized
Message-ID: <202603211302.zKhBnqb2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   40e3ab4d08362c43874fd99e70d6ef6f57f086ef
commit: 7fe24e0ff2f96db84d1ce465aca76bd42c169ab7 [18/44] benchmarks
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260321/202603211302.zKhBnqb2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211302.zKhBnqb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211302.zKhBnqb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/benchmarks.c: In function 'benchmark_ktime_get_read':
>> kernel/time/benchmarks.c:38:22: warning: 'count' is used uninitialized [-Wuninitialized]
      38 |                 count++;
         |                 ~~~~~^~
   kernel/time/benchmarks.c:33:13: note: 'count' was declared here
      33 |         u64 count;
         |             ^~~~~


vim +/count +38 kernel/time/benchmarks.c

    29	
    30	static int benchmark_ktime_get_read(void *data, u64 *value)
    31	{
    32		ktime_t end;
    33		u64 count;
    34	
    35		end = ktime_get() + BENCHMARK_TIME;
    36	
    37		do {
  > 38			count++;
    39		} while (ktime_get() < end);
    40	
    41		*value = count;
    42		return 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
