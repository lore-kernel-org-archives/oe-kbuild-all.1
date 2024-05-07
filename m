Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2119E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715040213; cv=none; b=U0GWdAoqqhtfyY9xlIIQlEHG1WrHiTrwDGHUmVHlN/dJyseykhDUPWSkl9kdMQrHnyb4+GY8kXSvdK7R9ySDG+UenLV9rXMxv9m5QFo0f4/G9HRLshzPUMZpii9vdh5GsGKiT8V1Qy6uXIOHfXO8XIyT/yOz2P4SXrhG8hQIJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715040213; c=relaxed/simple;
	bh=VbNbVwXCs1U+XAmdmJlQEcUkk//chzafWUUpB+wFcbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFbil1JUuzdJjTNJu0P8Xyp0a9O3JLTjQFkoXDeRQ7eImBFI6SDIcsUQyEvWMIBwaJ2DZRYLsihEosGMxTugFHp+CJ7tfEXgv9QQh9mcIhX5XL7RSZ0FEcYgsDfaC7aixfuFXKtTsm8Hx6DI3EJ1YFB74F8TO0msmE8hRnZZWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQMKa9ov; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQMKa9ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715040211; x=1746576211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbNbVwXCs1U+XAmdmJlQEcUkk//chzafWUUpB+wFcbU=;
  b=HQMKa9ov3a++Jon69kA8g/qsUKeMartWpvCiKWv0BKLOZyb//GB9c+1u
   VgnupN8wva6eRfE/RPKBxdnhrIRw2PN6hVOS292wpRaDyOrAXF2cRH3jm
   jLN9YRq4XbsE5oOMYdhbzEqioxEnQgdTm3nRcywElzT9NMRgu4VPgWQYR
   2qY8Nt5GOnsBH3oiRnJ8PyR/wWQVGOKHISDjaq6ORO2HOBizFf+htjfiv
   oK2WhXxudfi8tVqKQx0pRRYHxeo+/+nOclWQfoqtUGlU1t7RURwFdTb8e
   36hzeZaakk1h+V9K2lCZv/85u0+UGm9RELv+ujWdmPGE9ia1ApeX+BlWl
   w==;
X-CSE-ConnectionGUID: am/y2iRDSxSeclRGf+DuQw==
X-CSE-MsgGUID: 7BFfexmYTP+PeP7YrflQmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14593552"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="14593552"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 17:03:28 -0700
X-CSE-ConnectionGUID: LZdIhq+NT3qHTvorS61xfg==
X-CSE-MsgGUID: ZmwZOlTUQCKwc+rqPpChHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="51522536"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2024 17:02:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s48HX-00018j-0U;
	Tue, 07 May 2024 00:02:07 +0000
Date: Tue, 7 May 2024 08:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 5/5] mm/internal.h:1584:22: error: array
 type has incomplete element type 'struct cftype'
Message-ID: <202405070805.tXeCBDxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   9b269ef160d984dc9ed844151a21384b4ad60fdc
commit: 9b269ef160d984dc9ed844151a21384b4ad60fdc [5/5] mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240507/202405070805.tXeCBDxg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070805.tXeCBDxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070805.tXeCBDxg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
>> mm/internal.h:1584:22: error: array type has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                      ^~~~~~~~~~~
   mm/internal.h:1585:22: error: array type has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/page-writeback.c:43:
>> mm/internal.h:1584:22: error: array type has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                      ^~~~~~~~~~~
   mm/internal.h:1585:22: error: array type has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c: In function 'cgwb_calc_thresh':
   mm/page-writeback.c:900:39: warning: variable 'gdtc' set but not used [-Wunused-but-set-variable]
     900 |         struct dirty_throttle_control gdtc = { GDTC_INIT_NO_WB };
         |                                       ^~~~
--
   In file included from mm/slub.c:49:
>> mm/internal.h:1584:22: error: array type has incomplete element type 'struct cftype'
    1584 | extern struct cftype memsw_files[];
         |                      ^~~~~~~~~~~
   mm/internal.h:1585:22: error: array type has incomplete element type 'struct cftype'
    1585 | extern struct cftype mem_cgroup_legacy_files[];
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3831:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~


vim +1584 mm/internal.h

  1583	
> 1584	extern struct cftype memsw_files[];
  1585	extern struct cftype mem_cgroup_legacy_files[];
  1586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
