Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2F13D4109
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772649203; cv=none; b=iCzf0w2L7Ve2FVcZGvQ/E+NrGq9SiAsx+AuxSjOr+DuEwAykz8hjkalKmNDDqD9e+f+DYaCmI8C6VpAlLkgVb6GaQguKWkiczGiz3JOgjIBx0Jf3ZDzRHKIx4u0gnJ++u+Gg51Cd50jHFwgiqpHIIR6NKvRQkIYzJvAk6Bp/jAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772649203; c=relaxed/simple;
	bh=g7b5btNUziqJdmSx+2yVBYzart4gl0Lp5q4pmgWtCno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HFLK0m4SOgeqPaH5LVYG4dKJ2nv0fgImXWWZ71Rnbhb5fDvdSyTZ8INl3/Ks9YKLn9hFeMIFaEgi+5/lCtROCNnQ/EPfmTwjXyxb5Qug32xzYrEXbbXs6FYzeJHgfMWOeT9jTlQaJsGuiDjZGnfQ1n6lqNRIO4BVlIkbNS3pO1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KP5RsPTL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KP5RsPTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772649203; x=1804185203;
  h=date:from:to:cc:subject:message-id;
  bh=g7b5btNUziqJdmSx+2yVBYzart4gl0Lp5q4pmgWtCno=;
  b=KP5RsPTLmmTEHirylw2wHfhVvExZL5e8ZOnS6WEokkciynyPWA1d4l5c
   u15dFK36Tsj8OcumpMIEBGlaKeawOIEKd2dhvoDrAuAP59oyZZzAl4p4B
   jD2ZQ0yWXg7wSTXY4tY4LKsI8gIbTFaQvn6zxjhn/CgWm/3gwk0YepYCh
   MuO6Q4oqMHNn3aCoyTNKJVDeZMKLy7UVWKvkBrPoGatIQUMnjnpwh/Yk+
   OkhRgJf9heXuci77uf7c1MjOWzvSHP+LNA5egZnfjoRFBUIUCRgIjePN0
   Unp3PMZdZhHA3xipNCDhRjCsISYU64vRW5ad9h1sCli5kR0ymsJIUTAq6
   g==;
X-CSE-ConnectionGUID: Rv9SbjKPRkiP7BZeZK+Euw==
X-CSE-MsgGUID: fD2qN6zAT9eS2/iW24oBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77564402"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77564402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:33:22 -0800
X-CSE-ConnectionGUID: nzsqubI8R1iio7e0onSvQw==
X-CSE-MsgGUID: Uog931oKRz6UHvIiBnFlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222916127"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2026 10:33:20 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxr25-000000004K3-3xLs;
	Wed, 04 Mar 2026 18:33:17 +0000
Date: Thu, 05 Mar 2026 02:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c:196:30: sparse:
 sparse: symbol 'gaokun_ucsi_ops' was not declared. Should it be static?
Message-ID: <202603050203.KD4RWA00-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
commit: 00327d7f2c8c512c9b168daae02c8b989f79ec71 usb: typec: ucsi: add Huawei Matebook E Go ucsi driver
date:   11 months ago
config: mips-randconfig-r112-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050203.KD4RWA00-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050203.KD4RWA00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050203.KD4RWA00-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c:196:30: sparse: sparse: symbol 'gaokun_ucsi_ops' was not declared. Should it be static?

vim +/gaokun_ucsi_ops +196 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c

   195	
 > 196	const struct ucsi_operations gaokun_ucsi_ops = {
   197		.read_version = gaokun_ucsi_read_version,
   198		.read_cci = gaokun_ucsi_read_cci,
   199		.read_message_in = gaokun_ucsi_read_message_in,
   200		.sync_control = ucsi_sync_control_common,
   201		.async_control = gaokun_ucsi_async_control,
   202		.update_connector = gaokun_ucsi_update_connector,
   203		.connector_status = gaokun_ucsi_connector_status,
   204	};
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
