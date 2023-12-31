Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2936111
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIB3lVIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704029616; x=1735565616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTVbw1YCow0LZvBEj0Y4lhvHwsRoxEu2ZRFY5eYOXnI=;
  b=VIB3lVIlJf2qLjHbA5+oCIu3QOubQ27LX7v32h4btwuXiPKdF5kCUmDp
   bowbKDd02AuVSz/GhyWX1e/d917YPEx3Nl+EX0Oom6nLqXjOUFb/mDJ4T
   0dX/+MeFlqROO89MxIm+dMpT5Yvf9oM1SE8jvYXVgb8xV/2PfrRWzPYFt
   GZINoemOJSuO/KTw+1qR2ugTJJzb4fJZXzNXYvmUlFG1kD7/3JQBwtAAY
   2hIr9A+2azKZx3hAAEgtfnfv6I3vwuuDFCg+OIgQaMIfwa89JVeVcQ4VN
   +t8l93jFJvsXjm4MivUIJe9vuOEwXMfP78pYCBKjo8LFKo1tC9ldYpaLt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="3586246"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="3586246"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 05:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="755462849"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="755462849"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Dec 2023 05:33:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJvwY-000JSa-1d;
	Sun, 31 Dec 2023 13:33:30 +0000
Date: Sun, 31 Dec 2023 21:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 3785/10295] thp7312.c:undefined reference to
 `firmware_upload_unregister'
Message-ID: <202312312134.tnFH0uX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 7a52ab415b43f3b4680b69f6652ba2ec6716e55f [3785/10295] media: i2c: Add driver for THine THP7312
config: xtensa-randconfig-001-20231231 (https://download.01.org/0day-ci/archive/20231231/202312312134.tnFH0uX1-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312312134.tnFH0uX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312312134.tnFH0uX1-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/media/i2c/thp7312.o: in function `thp7312_parse_dt':
>> thp7312.c:(.text+0x3464): undefined reference to `firmware_upload_unregister'
   xtensa-linux-ld: drivers/media/i2c/thp7312.o: in function `thp7312_remove':
   thp7312.c:(.text+0x34cb): undefined reference to `firmware_upload_unregister'
   xtensa-linux-ld: drivers/media/i2c/thp7312.o: in function `thp7312_power_on':
>> thp7312.c:(.text+0x3a24): undefined reference to `firmware_upload_register'
   xtensa-linux-ld: drivers/media/i2c/thp7312.o: in function `thp7312_probe':
   thp7312.c:(.text+0x3da2): undefined reference to `firmware_upload_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
