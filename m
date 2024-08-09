Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F051804E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 03:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723175774; cv=none; b=LgVj0wg/iky9icPQqQpLgV0+3sdmnD+GXLE2VCyjRx9LB9iofEBxIZPI3s/+fjz5OW58miUtdFsP/xRYoC5DXBMCV7+bixA9xhq4Lm8GYdNdmqtvEW/kKM+02pRqrm4SOjSc7JcHXcmSOosd0YLtcAok5iTPZJ2J0u8hEZgMwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723175774; c=relaxed/simple;
	bh=XDKX2RS6KpUldc8kYbSwkbW+SsJbXq6Kb8TUAEn89Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3K5a1gTj2GdKNmyLZMAAwkSKkYGboFyyCgYrWIkjFY+iGXLALy3TbCFD5AQv/7LF6shbvacQrYKxsqSfSpAjcSZ67dfuMwMmhQW72/+jiu/UVjJbGLCrfLawE4LaL98OAl+6eydAcFil4bHEM/Ouxl7yIKC+2I73bRsH8x7ZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF3geHZc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF3geHZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723175772; x=1754711772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDKX2RS6KpUldc8kYbSwkbW+SsJbXq6Kb8TUAEn89Q4=;
  b=OF3geHZc5tw7WNwss17/veAO4TYhPbf2i+vz+lMc4ecEY3PUlssmcm1C
   NFS0W/FWOxWe8TvkxEf8GUijP53tiMdwFlfYzzN3Aje/9tENKggmHIAUu
   9v5wDupB/cjGCV3iQLLIJ+PUQScc587JhgF7u8aAfZkJv2WO7xP8s963W
   HLMgey3HjdM9KHVqO8SHCL8idVFEBI0ygjaax/+JeVd0xnyPxX5gWfEO7
   apr6Gwh7QyrGlaThFxowwqvBM7I4X1CjBIbOuIgv4IaERmytG+N4Kk5du
   4hNb7spaSf1ZXcFvaMnRwHgLVjbcp/RFAfSsg/DU3a11dDm/6dyihpHAh
   Q==;
X-CSE-ConnectionGUID: 2u+F9HANRoGOoz666BFtAg==
X-CSE-MsgGUID: gPSx9m3fS9anhQ3Isv2Gqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25205787"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="25205787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 20:56:10 -0700
X-CSE-ConnectionGUID: a+Ba/oRoQL2dwKCvX6Ey3g==
X-CSE-MsgGUID: hTdORm2gRsm1mdwZsX/d4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="58154718"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2024 20:56:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scGjW-0006o8-0C;
	Fri, 09 Aug 2024 03:56:06 +0000
Date: Fri, 9 Aug 2024 11:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexandra Winter <wintera@linux.ibm.com>
Subject: [linux-next:pending-fixes 234/363] ERROR: modpost:
 "kobject_set_name_vargs" [net/iucv/iucv.ko] undefined!
Message-ID: <202408091131.ATGn6YSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   c37f029f02cd9ae0032271166c61ccc1b2fd5422
commit: 2dca436ca7e3d7280fb2a555d9acdda27c32f2c5 [234/363] s390/iucv: Fix vargs handling in iucv_alloc_device()
config: s390-randconfig-r062-20240808 (https://download.01.org/0day-ci/archive/20240809/202408091131.ATGn6YSh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091131.ATGn6YSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091131.ATGn6YSh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "kobject_set_name_vargs" [net/iucv/iucv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
