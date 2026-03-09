Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEDE3BED06
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062238; cv=none; b=JpGokx1rxr7ienwXe8p41Sya60GaTwx9Dp1/rXValtocd/q4SI3ZNkldEmtPfe7yN++KXgVwSYSg3CoFHMLMPOPwjIV7rQHtHy6Dq/3Xw/vlDbTeUz4llV4ord2+Jd9lN7wr5aMZlUtyP8RhXlLt/sldhdr4uKVGZnrPlT762w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062238; c=relaxed/simple;
	bh=0g468KY8jsGWt58+U7kUrv2wkhTEVNkrzG0Qu+t3W5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvfIBDimA5sZNoDAJzMEiyMgq+QHM8W1rMG5Q6sv5aCqxELKVPpAB6UP0B7GxVOrfRs/Fb2IkhehyzfDGx3ce7g5QCrABkxoR9VvKEYDyaUiRZ7Aw9Y0TTvPHuLWkn1yuMdeaUn4mScXFEsWL+NeMB3FjqK5BK9B5+6j62nbVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZJpHaNh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZJpHaNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773062236; x=1804598236;
  h=date:from:to:cc:subject:message-id;
  bh=0g468KY8jsGWt58+U7kUrv2wkhTEVNkrzG0Qu+t3W5w=;
  b=nZJpHaNh4TM0xSziOhOklatSGuIpAfDaMjHo/R2lG+6g6QzgYOeaEVNE
   M/xlfiQ757zIdu5ab7le50m9Qwv3I0Cmadslb9AZRtaqjX3df4HoFvbxi
   wimbGmRd33YfgokHtjDQKo0aJzfYGg2MAnkeX9iYc3TFzNP4BpreacEnj
   uDZe32kOuaPf+ycirQPTvV1pzl20LVexNtqjSN1T7uUB72g0Iq8Vq5ZTQ
   4zzQh92LU9XBoTwcNXKpA+hC2SYcDABOHMngQ+wMHL4qjBOXaG9ZwE3wE
   tDjXlunR9EqmWA0bSkxMIiCK0XV8mPrTSc6/VU05DYpS969Ao1cXP/EhJ
   A==;
X-CSE-ConnectionGUID: C5CKLhguQ2+9Ne0DgW9Tdw==
X-CSE-MsgGUID: xklmZNUpQ6qFmPEDTl5kpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74194581"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74194581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:17:16 -0700
X-CSE-ConnectionGUID: H4aJQOrDR1aMB1OEc6dlkg==
X-CSE-MsgGUID: R2qMJY96QxSW/uGde/5XYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="223853402"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2026 06:17:14 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzaTv-000000000G8-05rL;
	Mon, 09 Mar 2026 13:17:11 +0000
Date: Mon, 09 Mar 2026 21:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Winkler <rwinkler@antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
 Filip Kokosinski <fkokosinski@antmicro.com>
Subject: [litex-hub:litex-rebase 13/16]
 drivers/gpu/drm/litevideo/litevideo.c:290:3-8: No need to set .owner here.
 The core will do it.
Message-ID: <202603092134.JCkShZD1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   70b59031ec17b4e6041cebf8534ecd29da9f7bd0
commit: 1b116054c9d34fb08547d39e522d0d4b4b89c39d [13/16] LiteX: driver for LiteVideo
config: sh-randconfig-r061-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092134.JCkShZD1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603092134.JCkShZD1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/litevideo/litevideo.c:290:3-8: No need to set .owner here. The core will do it.

vim +290 drivers/gpu/drm/litevideo/litevideo.c

   285	
   286	static struct platform_driver litevideo_platform_driver = {
   287		.probe = litevideo_probe,
   288		.driver = {
   289			.name = DRIVER_NAME,
 > 290			.owner = THIS_MODULE,
   291			.of_match_table = litevideo_of_match,
   292		},
   293	};
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
