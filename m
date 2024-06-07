Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D015ADA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717747874; cv=none; b=TINlX2OLuqYenxR1lTUCOnOs9nlRwnsoo14tcze3P4kHPz10HVjOF8Q3pnIxEc6XSwQ6VT+EtVN0bLvp5FciVIMv1bo8LYSeAaZZ/SE2rbddmHeEc+8i56bQ85XEBcKbsDo//1yjbc0Tf9fizdFmGACSbG7YusV076ZBePvsh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717747874; c=relaxed/simple;
	bh=F42ZswI3mMUXmHbNPsKhEX6CG891tEgsCO8HNTer96U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvWa//uPY/1u1ty1+OxRV9DuuDZ4obV+zYCdc418qoQUyuqGeID0QFxMEpBJlV3x8n5dXaIIDSvL4Sdz1iDLmid9MarS648Yh1x+A5tihSxNT/ejViE76498s0Fhj6+O0P+aIAtFvyjTt+6cWIhFO1o/7+/lTpopZCAhirxz/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeLTXBmU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeLTXBmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717747871; x=1749283871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F42ZswI3mMUXmHbNPsKhEX6CG891tEgsCO8HNTer96U=;
  b=jeLTXBmULF2L//BO+imO6PxG87Bfv7OtmTqe4eHP0ndfhFWXjl2qF2Mf
   7qftojyavrrztXSihbNRFP9caYO5ZgUhyQbZxsmzFssnaBonOOtyp1S8W
   hPwJpLndcsVULFkbyq+Z5qiESsTRf3eKyFle/hft4x8oyAeuO0cE90H4U
   Sa9uIuc3q3uuY866UCGTrkNMHM5d5O/lrffVKD00Dm1cYWd3d7SSZiHAs
   fMiPUskgV/OC7gjH1LDFdWZyktwUk1dzA3we8Pv8hJ424iblU36e5CTgT
   SW2SyeR2r8rEonRPImnD9F7JrCztuVKzVkwDGtkx0cFj1kYiUBE1oRuUS
   g==;
X-CSE-ConnectionGUID: 3JgrfCRsQHagkokbjIrbkw==
X-CSE-MsgGUID: 1Mkr0HGqQquV9/6eH669Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39858646"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="39858646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 01:11:11 -0700
X-CSE-ConnectionGUID: XUF+j23gRJGpXtvh+Zt7aQ==
X-CSE-MsgGUID: peWT9ITGTAeI7W/Porz1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="43358203"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Jun 2024 01:11:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFUgm-0004F6-0D;
	Fri, 07 Jun 2024 08:11:08 +0000
Date: Fri, 7 Jun 2024 16:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4304/4582] drivers/hwmon/pmbus/mp2975.c:1069:34:
 warning: 'mp2975_of_match' defined but not used
Message-ID: <202406071658.Sq9UXHmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: d62e74bcb173cab374d582014dc1183a09efd25d [4304/4582] hwmon: (pmbus/mp2975) Use i2c_get_match_data() [take 2]
config: x86_64-buildonly-randconfig-002-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071658.Sq9UXHmz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071658.Sq9UXHmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071658.Sq9UXHmz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp2975.c:1069:34: warning: 'mp2975_of_match' defined but not used [-Wunused-const-variable=]
    1069 | static const struct of_device_id mp2975_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/mp2975_of_match +1069 drivers/hwmon/pmbus/mp2975.c

  1068	
> 1069	static const struct of_device_id mp2975_of_match[] = {
  1070		{.compatible = "mps,mp2971", .data = (void *)mp2971},
  1071		{.compatible = "mps,mp2973", .data = (void *)mp2973},
  1072		{.compatible = "mps,mp2975", .data = (void *)mp2975},
  1073		{}
  1074	};
  1075	MODULE_DEVICE_TABLE(of, mp2975_of_match);
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
