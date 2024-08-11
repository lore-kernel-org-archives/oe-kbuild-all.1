Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B241CAAF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723387272; cv=none; b=ihtoMw8SveXjlfW4NJ782O0xkNi+fYy1y8RMUUw7hngny9cNdDD3iuG9iqPp04MfbKVKRoylj+cy8QFkgn5RkLyi1jP5HRP4IJ1BphYcryTSoyl5nSocmDezDnqxyanS1alsS9+LfLMHcah3DKbsZHsclgINCSSiPI+DN2aVnp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723387272; c=relaxed/simple;
	bh=To01EwuQalDnk0QI92dbU/lmPHVCyfg9pjico9j2yOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qys4hSOfdtTs0V5YvNw3czYW9nb+QkHpS/z7K69jt9/ilUhJh+Ii1Yklfe7taykIrk6nmyWG+sSRTtpsejssdE9SHaRmVJQzSaCvViAK1qhUo1rIrTX5I1n0Q/dDqf+De9X+Zaa4X4bGWec3feYUpjesi8ZkM7IQ3N2esS3aYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbEsVXG+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbEsVXG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723387270; x=1754923270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=To01EwuQalDnk0QI92dbU/lmPHVCyfg9pjico9j2yOY=;
  b=hbEsVXG+zmKVzR5uJ3sEJrrJ1wclJTuEew6zPVU/zBoclQtJKbIi7X08
   ezuVtXocnRgy02YWP/KmGCHI/WRjT6uztQNbw+C+a/1jOTRKksS5p2y9u
   CAJUuB/29o2AZlnlUBX4XbJ7WF/E4zcGXTou3rfzNHCtoSdmpSZ0jKEkp
   iyMwljZCd+CLVM4N1539WPafy8wN6RHFWjXgLX8TtWLLObT/txeJMfnL3
   1qMMXe+zdZEo4J5Umc2JObiJctd5UctRxlE4k6NIxWp7jQRjtIGZ6EJR6
   /xFvChQLcA2XD/d3utHhHeu917BE11+CnVIdNHOtOvzWPuLfpVxkezUC8
   A==;
X-CSE-ConnectionGUID: Rt9gTrfCTo6ONba970oAnA==
X-CSE-MsgGUID: DQ8AeOCFR/OA+Q+YK197vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21312852"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21312852"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 07:41:09 -0700
X-CSE-ConnectionGUID: BvydYAO8SOCPhPpALXVTpA==
X-CSE-MsgGUID: l8pwtRHaRVSr7foKZuAANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="58747911"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2024 07:41:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd9ko-000AtB-1Y;
	Sun, 11 Aug 2024 14:41:06 +0000
Date: Sun, 11 Aug 2024 22:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 100/104]
 drivers/thermal/uniphier_thermal.c:258:1: warning: no return statement in
 function returning non-void
Message-ID: <202408112243.jYA84WnP-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408112243.jYA84WnP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112243.jYA84WnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112243.jYA84WnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/uniphier_thermal.c: In function 'uniphier_tm_trip_walk_cb':
>> drivers/thermal/uniphier_thermal.c:258:1: warning: no return statement in function returning non-void [-Wreturn-type]
     258 | }
         | ^
   drivers/thermal/uniphier_thermal.c: In function 'uniphier_tm_probe':
   drivers/thermal/uniphier_thermal.c:267:13: warning: unused variable 'i' [-Wunused-variable]
     267 |         int i, ret, irq;
         |             ^


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
