Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903210979
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723387872; cv=none; b=NknRt08IRVJUVrtPMdU8MhyXqchCm3FFPH6mNJE+zZ9rfn1vxMKwmHLN4R0FxxCNsRvd9wohjTt2Kd8vKysKw3ewP1Bzjxt963rWZ9PRTPjr28ThQH5zuZ5HYUOoMc+p1NPNyUZqQygU4ueahFo3tybS01sHb9L+ITD1c7E6dwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723387872; c=relaxed/simple;
	bh=4rdJvRAIBv+lOr05U1BFaBJfLJuRH4X10XQzlVsjuUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Po+IboHYf4f7mD2dfMVuuAePWbq9WRiIglmPSWoBoimK33ySmHmPxU2ggvUKTKLqlYzRPIOJATd2zX/v7qR3gkMHcxizsM6+kArbr9qgSh1eoWh3AHsXKVPc03uEPNaiPZBzCoGn/qgE/MKAAp+2lyx+zwhsuruPRfbfhLZVckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIxfAeT3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIxfAeT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723387871; x=1754923871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rdJvRAIBv+lOr05U1BFaBJfLJuRH4X10XQzlVsjuUc=;
  b=CIxfAeT3R/oMB/S1M3jhvrEa3DsS20V9kbVgHjJzI6gWjiGlkT4zOmyh
   wgfIeNYGA2Jl3Wazjp260jhd6oxzOihpY1Lnhug5iU89KF9u20/jykNBC
   DbUikr0sLHnQYU96Wj5zRtXDmDqGxthRWZjOyxSIefsbKgqMzxTifpFVM
   qyMqiXYQ+ECVG0xc6fiWwMJRqS2nmfFLsnCQy0EHymFgDLl3oBgoEZfMB
   k9cAg9AxGdBz6V5mBEldFhbSatXW1IxaNFTAMiRLkmcfQ5lJn5L+3NTot
   Fe2d4xVnE/jWVZqktf3YTYaf3EBziredgzg3MsNQFZDadZbLmkVTRPjQW
   g==;
X-CSE-ConnectionGUID: Cv1YCoGwQ1u0t5MDfBYGIQ==
X-CSE-MsgGUID: MHGIzOWpTUGwTFthUIFgdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21474864"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21474864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 07:51:10 -0700
X-CSE-ConnectionGUID: /gRHFrsyRXeeRtthtMVTJg==
X-CSE-MsgGUID: LWX/8tY1Scque8hVmu/1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62968636"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Aug 2024 07:51:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd9uU-000Atn-2T;
	Sun, 11 Aug 2024 14:51:06 +0000
Date: Sun, 11 Aug 2024 22:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 100/104]
 drivers/thermal/uniphier_thermal.c:258:1: warning: non-void function does
 not return a value
Message-ID: <202408112234.JOeK699m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   bc327c57c8cf8f309b5edbb8959cc81d8b29daba
commit: b50e72c5be8665e008cf9a97d68d5dea0d95e09c [100/104] thermal: uniphier: Use thermal_zone_for_each_trip() for walking trip points
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408112234.JOeK699m-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112234.JOeK699m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112234.JOeK699m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/uniphier_thermal.c:258:1: warning: non-void function does not return a value [-Wreturn-type]
     258 | }
         | ^
   drivers/thermal/uniphier_thermal.c:267:6: warning: unused variable 'i' [-Wunused-variable]
     267 |         int i, ret, irq;
         |             ^
   2 warnings generated.


vim +258 drivers/thermal/uniphier_thermal.c

   247	
   248	static int uniphier_tm_trip_walk_cb(struct thermal_trip *trip, void *arg)
   249	{
   250		struct trip_walk_data *twd = arg;
   251	
   252		if (trip->type == THERMAL_TRIP_CRITICAL &&
   253		    trip->temperature < twd->crit_temp)
   254			twd->crit_temp = trip->temperature;
   255	
   256		uniphier_tm_set_alert(twd->tdev, twd->index, trip->temperature);
   257		twd->tdev->alert_en[twd->index++] = true;
 > 258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
