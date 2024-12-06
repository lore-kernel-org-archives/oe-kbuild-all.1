Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CBE1BE23F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733470624; cv=none; b=AoQ1EyM6IQ1/mcnrBlnYPdG0KwxTNhvHmZHW8rcZqUHoNHKZ0Ee1/pruPx9929ArjQoRhtr8bw4eAGFtRNzPR/N/TaXlTGVmEEl2E5eu8iA+++t3NBtTPa0gi7yCtX3URRR8pOKf0cfCiHAY/sxi9Wr2H+HsgeJ85B3cZ3jAL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733470624; c=relaxed/simple;
	bh=rW1zGLV6GTd/TuyA7CJ5ZhgHBXyrglW4LXqh85Cy7Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWG5Bp9h2gErTAL9i816f5HWm90l0S/pWMfHSeVyAW4+u0Z/7v9dMC58qTZyURjXPaLun+4PN/0qXLSUW+7TqlOqRflb0ajWGPiJZRjc6C2iGXUZEMsWRozF0wb1PjRSSk3MjGPcb2yAAJNBbTmxlJPw7ChDtP02h0Y77MPjYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFBOPxkM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFBOPxkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733470623; x=1765006623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rW1zGLV6GTd/TuyA7CJ5ZhgHBXyrglW4LXqh85Cy7Ms=;
  b=oFBOPxkM95OETLi43BE6QxvVEuWhnphBsJkq8O4eut8b07F5juNvTMVH
   xKD7iX9yz/Th632Bny6I4fz0NZ6ZnoA7lzdvVEn5JZVU/sMZ1M3XcMUtq
   iNudtKtTudPBQ2lOE7Ug8cO59tzGdOO4vg3QgG0Cv0OQSg1q8MqUr3Vys
   /3ALZ6ZNSxzQKhjRW/mEoY28Z96OmKBypdUNhEcERCmInVHCZ30cI3R+K
   liJdZcPwJiQ+Nng1Ov+/VN/uegzjSsdl5aUp/RXHNwNVZv+XX3E4SY9pq
   4qqFryPd/rwn3TQwEyoZlM8RJ5BFcBRyA70xF7MvQnulfEJnjCNc5RUnN
   g==;
X-CSE-ConnectionGUID: dqnavm2DQsedL6L2Z6u5KQ==
X-CSE-MsgGUID: tR9dIZEkTYeapXZVX2AsVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51349830"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="51349830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:37:02 -0800
X-CSE-ConnectionGUID: 89jERL4lS0CfN0d7LhvzVA==
X-CSE-MsgGUID: gxST0mFARj+y9oflYWhSpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94526314"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2024 23:37:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJStW-0000od-27;
	Fri, 06 Dec 2024 07:36:58 +0000
Date: Fri, 6 Dec 2024 15:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/pic32_uart.c:904:34: warning:
 'pic32_serial_dt_ids' defined but not used
Message-ID: <202412061528.c3mAs1pi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: e3e7b13bffae85e2806c73e3ccacd4447bcb19ed serial: allow COMPILE_TEST for some drivers
date:   2 years, 8 months ago
config: mips-randconfig-r111-20241114 (https://download.01.org/0day-ci/archive/20241206/202412061528.c3mAs1pi-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241206/202412061528.c3mAs1pi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061528.c3mAs1pi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/pic32_uart.c:904:34: warning: 'pic32_serial_dt_ids' defined but not used [-Wunused-const-variable=]
     904 | static const struct of_device_id pic32_serial_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/pic32_serial_dt_ids +904 drivers/tty/serial/pic32_uart.c

157b9394709ed52 Andrei Pistirica 2016-01-13  903  
157b9394709ed52 Andrei Pistirica 2016-01-13 @904  static const struct of_device_id pic32_serial_dt_ids[] = {
157b9394709ed52 Andrei Pistirica 2016-01-13  905  	{ .compatible = "microchip,pic32mzda-uart" },
157b9394709ed52 Andrei Pistirica 2016-01-13  906  	{ /* sentinel */ }
157b9394709ed52 Andrei Pistirica 2016-01-13  907  };
157b9394709ed52 Andrei Pistirica 2016-01-13  908  MODULE_DEVICE_TABLE(of, pic32_serial_dt_ids);
157b9394709ed52 Andrei Pistirica 2016-01-13  909  

:::::: The code at line 904 was first introduced by commit
:::::: 157b9394709ed5233288986a293405def22792ed serial: pic32_uart: Add PIC32 UART driver

:::::: TO: Andrei Pistirica <andrei.pistirica@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
