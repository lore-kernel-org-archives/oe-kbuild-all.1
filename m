Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960970821
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733065748; cv=none; b=MgnVe1AHkd334gKyy5/ev/KAxj9o4Hw85op/NkIQVhgCt1EMlq3EcGLxOiPerIyXtdaJjHZLGQav5mDE+Vv3kePi1HCHMMX7gJd7mj1SzWvIxdPoNotu5uzJceOOOoCPyYhdfBwyON4yYDF9NJ1Um01k7yO91pt9rRfj/6lOHEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733065748; c=relaxed/simple;
	bh=l1uhY0DcodVpm5u7GXbDMzFR2AM58uT2dOZCsIoWzlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVGt6KuiNyeXZOBlIL8fDDrxxUX3n8BGNVAGkBrnRr8bdLlZibnoYcz3qamLv+XVffTW/G4xEmd8PCmlrCod+FxbBRqSYlp1izkeaxHW7p2NXyE6LQq418Jy4DmGQdJAsSJ+iqLsMxMFMvEnUHPVGrtd/uJvthT6Slld/nJX5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UajVsKTA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UajVsKTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733065746; x=1764601746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l1uhY0DcodVpm5u7GXbDMzFR2AM58uT2dOZCsIoWzlY=;
  b=UajVsKTA667KQhxaCQQ7Kf+R4w6ecQRcz0Paec4NwqTTfEe2hBr7zIvT
   O0EQshvyX+36HTK03fa0SNmizz8r2O7Ec1rKAkshtpfoouXtJmiD2i2h5
   kWpuBRqKcTEWtVvLJkxl3HS19yVOqTxeaHxCU2Cddlrd9h1XjuzoIBvT8
   z9zrmglaYv9oVU24z79YDbEJVavQSZrR8EaCTbv3jmJlCyQgK/mv6xRBn
   6K10QGsS3nyFWQWK0tggPLjqBRkTbpBKVHoPVsVAjqrTuVk5o/9akWega
   DmVwIIGa3mkaSFYt0hvAQuDmYWKMXpy+Etu15t24gmbUWx7KcVkezOR14
   A==;
X-CSE-ConnectionGUID: xykjtrYkQRCDEwsGQC5D5w==
X-CSE-MsgGUID: 2EZiF4q3QZSi+l+DU6QLFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33290156"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33290156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 07:09:05 -0800
X-CSE-ConnectionGUID: ezDO5Be/QqGbuCDz/BxsAw==
X-CSE-MsgGUID: cVQebvjjTRSkssohwJCK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97653318"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 07:09:04 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHlZ4-0001cD-09;
	Sun, 01 Dec 2024 15:08:54 +0000
Date: Sun, 1 Dec 2024 23:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-attr 69/71]
 drivers/cpufreq/intel_pstate.c:822:1: sparse: sparse: Initializer entry
 defined twice
Message-ID: <202412012312.O9jgUbPI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-attr
head:   894533cd9290280e8b523fcaa2232662ceccd57b
commit: a0965582e0a49944224cef0b8ea6dd3f961630fd [69/71] _Generic
config: x86_64-randconfig-123-20241201 (https://download.01.org/0day-ci/archive/20241201/202412012312.O9jgUbPI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012312.O9jgUbPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012312.O9jgUbPI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/intel_pstate.c:822:1: sparse: sparse: Initializer entry defined twice
   drivers/cpufreq/intel_pstate.c:822:1: sparse:   also defined here
   drivers/cpufreq/intel_pstate.c:910:1: sparse: sparse: Initializer entry defined twice
   drivers/cpufreq/intel_pstate.c:910:1: sparse:   also defined here
   drivers/cpufreq/intel_pstate.c:932:1: sparse: sparse: Initializer entry defined twice
   drivers/cpufreq/intel_pstate.c:932:1: sparse:   also defined here
--
>> fs/smb/server/server.c:523:8: sparse: sparse: Initializer entry defined twice
   fs/smb/server/server.c:523:8: sparse:   also defined here
   fs/smb/server/server.c:524:8: sparse: sparse: Initializer entry defined twice
   fs/smb/server/server.c:524:8: sparse:   also defined here
   fs/smb/server/server.c:525:8: sparse: sparse: Initializer entry defined twice
   fs/smb/server/server.c:525:8: sparse:   also defined here
--
>> drivers/infiniband/core/sysfs.c:418:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:418:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:419:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:419:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:420:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:420:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:421:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:421:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:422:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:422:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:423:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:423:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:424:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:424:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:425:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:425:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:426:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:426:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:643:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:643:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:644:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:644:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:645:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:645:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:646:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:646:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:647:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:647:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:648:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:648:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:649:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:649:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:650:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:650:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:651:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:651:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:652:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:652:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:653:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:653:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:654:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:654:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:655:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:655:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:656:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:656:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:657:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:657:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:658:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:658:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:659:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:659:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:664:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:664:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:665:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:665:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:666:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:666:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:667:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:667:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:668:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:668:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:669:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:669:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:670:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:670:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c:671:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/sysfs.c:671:8: sparse:   also defined here
   drivers/infiniband/core/sysfs.c: note: in included file (through drivers/infiniband/core/core_priv.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   drivers/infiniband/core/cm.c:1296:20: sparse: sparse: cast from restricted __be32
   drivers/infiniband/core/cm.c: note: in included file (through include/linux/swait.h, include/linux/completion.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
>> drivers/infiniband/core/cm.c:4346:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4346:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4347:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4347:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4348:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4348:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   drivers/infiniband/core/cm.c:4349:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/cm.c:4349:1: sparse:   also defined here
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> drivers/infiniband/hw/qib/qib_sysfs.c:86:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:86:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:102:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:102:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:122:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:122:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:135:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:135:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:191:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:191:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:325:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:325:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:326:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:326:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:327:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:327:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:328:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:328:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:329:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:329:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:330:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:330:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:331:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:331:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:332:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:332:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:333:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:333:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:334:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:334:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:335:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:335:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:336:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:336:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:337:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:337:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:338:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:338:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:339:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:339:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:340:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:340:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:413:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:413:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:414:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:414:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:415:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:415:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:416:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:416:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:417:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:417:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:418:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:418:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:419:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:419:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:420:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:420:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:421:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:421:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:422:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:422:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:423:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:423:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:424:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:424:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:425:1: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:425:1: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:475:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:475:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:498:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:498:8: sparse:   also defined here
   drivers/infiniband/hw/qib/qib_sysfs.c:521:8: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/hw/qib/qib_sysfs.c:521:8: sparse:   also defined here

vim +822 drivers/cpufreq/intel_pstate.c

984edbdccc6ff0 Srinivas Pandruvada 2016-12-06  821  
984edbdccc6ff0 Srinivas Pandruvada 2016-12-06 @822  cpufreq_freq_attr_ro(energy_performance_available_preferences);
984edbdccc6ff0 Srinivas Pandruvada 2016-12-06  823  

:::::: The code at line 822 was first introduced by commit
:::::: 984edbdccc6ff01b953492f72296685ce3ea2497 cpufreq: intel_pstate: Support for energy performance hints with HWP

:::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
