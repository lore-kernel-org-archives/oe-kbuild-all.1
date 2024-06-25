Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE555EE97
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 23:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719358747; cv=none; b=g7kMEeeIwU+YArMvCVWhQKKrEa2g51oxFh4mCJJjdxaKuyQIcrsHpr/PCEmogFlDnQ5amKO/rTbidOl+DyaTjmTZPXmfPh2P6rT73xWxjzfMMe/oMWpWfkPtVc6mOcOqOaWig9Rm83Y/5tX0HgiN4Q57teURoGTfKK+xzxS3xRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719358747; c=relaxed/simple;
	bh=qkCSU+fAWToaM5toH3Z1dVvcXgLCkTN+jp87yYc5P9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4tMXlFrqWEUzl4G2VHq/vfNwWb2BLwkOuxFUyTfC46RPZhTDP56sn8wt6AFhaGvpgGL6nJxpskll6HXivObsmtnY7FF9j/JOSmyTXyYJ4xNt0es53BFRDNi5kuQPm2qvLc0umC5wBW47ldUgO4Lol85voCfGgCN+tspGSwFv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMduBZeT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMduBZeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719358746; x=1750894746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkCSU+fAWToaM5toH3Z1dVvcXgLCkTN+jp87yYc5P9Q=;
  b=LMduBZeTiK0HjltHKA2QrAWMZ7mMOOz5Rq2N8/nOsVOuPqmnDaL6Xxv4
   skkjqx/LpJDHNaS5b73KcawwV6mwCWpRrnote3Wi7Kj0kqBAgl+jovI58
   cj7LeMK/EEJ1i47eDDjunFvRgBXWJmwBg6/lup1SapURnumCTaf3cvaxL
   uw+hbbaZomxUHFtsKJBpIC09e6UdgQvkIh5q2okwUObTawjwApkCMgG3c
   ZdQH/dRd2ndK2WaGBY4YQhi41TEwyELf+cdaUkqESkA4BdmNR4pg7DSZ7
   TnCiey+ImdqFexkKMQvMEqd+LSSkh82dOlqEUzfPgD3FLP5AcuOiuyCB7
   w==;
X-CSE-ConnectionGUID: UIh8MUfITyKt06af9ee2WQ==
X-CSE-MsgGUID: sLwj1SeVS7OCH/OSpGhe9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16634590"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16634590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 16:39:05 -0700
X-CSE-ConnectionGUID: yF/N3tHdQFyJfBNL+D5D9Q==
X-CSE-MsgGUID: 6KdCSTnaTGupbGkdda2NTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="44523720"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2024 16:39:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMFkb-000EoM-19;
	Tue, 25 Jun 2024 23:39:01 +0000
Date: Wed, 26 Jun 2024 07:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 7437/8232] lenovo-yoga-c630.c:undefined reference
 to `auxiliary_device_init'
Message-ID: <202406260704.roVRkyPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 13bbe1c83bc401c2538c758228d27b4042b08341 [7437/8232] platform/arm64: build drivers even on non-ARM64 platforms
config: sh-randconfig-001-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260704.roVRkyPi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260704.roVRkyPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260704.roVRkyPi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/platform/arm64/lenovo-yoga-c630.o: in function `yoga_c630_aux_init':
>> lenovo-yoga-c630.c:(.text+0x2c4): undefined reference to `auxiliary_device_init'
>> sh4-linux-ld: lenovo-yoga-c630.c:(.text+0x2cc): undefined reference to `__auxiliary_device_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
