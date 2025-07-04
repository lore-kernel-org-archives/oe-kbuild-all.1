Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF42E36EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655332; cv=none; b=RKM/y1EFv+3RwCRT1tfr0P7oOfgKinomIhSOJW9EA0VXFNbL8/pAeqm0ZxW+tyvXdsuxSQWyTMcTqaGBO8zNaX3NUQO+I3ICyYu0CVHBgqdSC/EYf6yOKdQC7t8kw7VXv78xJMs8LqIVj6+V7FOafRIfBysIJ2QiZGWDaaJC7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655332; c=relaxed/simple;
	bh=JG3m5/u8itx4VUcZzssbb6IVm5+s9r5IKpC1PSJeJnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcFfja13lEq4oqfImg3xTjZh98d6fxrdXbeMsvseycZJLcMfPfplZyTE/T+Zph8kUyhUP+klfQPcr3unCCwn2Buk73JaP7THWp2Mz22iBML5MGisRaeHX4rjSafE2D966CQ+y9rBIbw6d7tmUftYPCkOagxQIMEEWd+XpR9np24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz/QCPDu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz/QCPDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751655330; x=1783191330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JG3m5/u8itx4VUcZzssbb6IVm5+s9r5IKpC1PSJeJnM=;
  b=Bz/QCPDuB5qCS3cuDouJosbK50gixVxk37mAqG7sOjgRpby634+xWkcW
   k4un6Cwp26FhSA/QoSbYlwnz+mG5iOOtDLIbX+tnaOHmAgf396YY2HQUr
   cjwa0mDIF4CAP53qR14aBt2wvkzq4rNCw0/CuvvBoZrcRxe9mB2VrUjiO
   Y1QBJNSu7x6X6l80uWGJulMDsJmuVOhVT9N+Y1SL+1BKQfbumFsmDr91d
   cjCUDHSeQCIxuiBYWHMCC+8WoYCrRAF4/DPr7RYLvCaQwKWZI6+vzZwVh
   Jm6aXkQcTA835BcrZ9c8+cI1NhSInT3VwFX5V298Obxe88J3XXye2CfWz
   w==;
X-CSE-ConnectionGUID: Ft8cl08CSRiQPV4WBwiInA==
X-CSE-MsgGUID: BC6vjIvFR2CTIjlpiWeT4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53911911"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53911911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:55:30 -0700
X-CSE-ConnectionGUID: devlf1uRQ22L2WWA9vc6tg==
X-CSE-MsgGUID: WU19/Z17TUm+xmnMh3h4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="178363684"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jul 2025 11:55:29 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXlZH-00040H-1G;
	Fri, 04 Jul 2025 18:55:27 +0000
Date: Sat, 5 Jul 2025 02:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:imx93-ethos-v2 27/31] ERROR: modpost: "gen_pool_free_owner"
 [drivers/accel/ethos/ethos.ko] undefined!
Message-ID: <202507050232.bqiYFx7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   652b6e3a8a3b0663143c380c080702c9e705be8d
commit: f7344a248d946409d9db929e1ac8fe6aca1ec824 [27/31] drm: ethos: Clean-up SRAM allocations on remove
config: i386-randconfig-002-20250702 (https://download.01.org/0day-ci/archive/20250705/202507050232.bqiYFx7Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050232.bqiYFx7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050232.bqiYFx7Y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gen_pool_free_owner" [drivers/accel/ethos/ethos.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
