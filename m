Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9047F57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7vtrmWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703703667; x=1735239667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ORMfCsSn2YwL/jb9gp3a1OCwxr+zaIa/uLiyoyOcMM=;
  b=P7vtrmWv3u50uuF4s381C2q6YWkGKoaZJX1OjiuC/36Vk4f51+TE3Iqo
   5pmDj6/1pdW1kxv8RC5vuaob6cl3QStmd5jCQ9r8ypld6iGwnPJMQNk3v
   K60+9U4XIEcsNL0+esCnaAv/qQvsGHrU6DxDRLlsQUgEH8GIXRkgYQczF
   D7nIbNeBGXU37TsXjl9HgMiG7LfQyoNMiEdobRFDit22CwLvk11w75wab
   q/cbX63T+SQpvccLco8tHm6Pr/qrJuY33m8yeM7Rr6+UMYeHSXbhDLgbL
   3pv0SMK7E6erksZYUM6tWTyMtE0v8VU09+PW9Wlh+cciGUj1b7gtyt8Yr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="375965672"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="375965672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 11:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="12785000"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2023 11:01:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIZ9L-000Fgd-1Q;
	Wed, 27 Dec 2023 19:01:03 +0000
Date: Thu, 28 Dec 2023 03:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.0 9/24]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202312280208.uezj9pKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.0
head:   1f42080421213a7819e069d5b6d22cef0b6c9c61
commit: 9c0ce4ec5da1325b5ac4b9eba3f48114673dc1eb [9/24] dyndbg: move flags field to a new structure
config: mips-randconfig-r111-20231227 (https://download.01.org/0day-ci/archive/20231228/202312280208.uezj9pKO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231228/202312280208.uezj9pKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280208.uezj9pKO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:462:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:468:17: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:220:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse:   also defined here
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse: sparse: Initializer entry defined twice
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:485:9: sparse:   also defined here

vim +220 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c

71bad7f086419d popcornmix    2013-07-02  216  
71bad7f086419d popcornmix    2013-07-02  217  static inline void
69838a4e0c4a02 Stefan Wahren 2022-01-23  218  set_service_state(struct vchiq_service *service, int newstate)
71bad7f086419d popcornmix    2013-07-02  219  {
f67af5940d6d2e Umang Jain    2023-10-24 @220  	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: srv:%d %s->%s",
71bad7f086419d popcornmix    2013-07-02  221  			service->state->id, service->localport,
71bad7f086419d popcornmix    2013-07-02  222  			srvstate_names[service->srvstate],
71bad7f086419d popcornmix    2013-07-02  223  			srvstate_names[newstate]);
71bad7f086419d popcornmix    2013-07-02  224  	service->srvstate = newstate;
71bad7f086419d popcornmix    2013-07-02  225  }
71bad7f086419d popcornmix    2013-07-02  226  

:::::: The code at line 220 was first introduced by commit
:::::: f67af5940d6d2e9a9fbc5893cf1e16bae166d9ff staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug

:::::: TO: Umang Jain <umang.jain@ideasonboard.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
