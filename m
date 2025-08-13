Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854252F49F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081608; cv=none; b=nA6BF/pUuNgV0+TqRgMZ4B0yxbQNKJ+uq4Ad/r5tLE9SGQ8tMFEcelZo+49H+57xd+xvVsjGe7pobxbO/p82ikX6wF/R7n/v5SVBOhJExgJt92cF+77WQM8TAIFX8Ync8jJ3o5JBFqQsU5q4Yvo3NeIuDLDTp+zkjvJ7xLIg7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081608; c=relaxed/simple;
	bh=HjJJ9f9RUP0HaiTHczd99IX+fXCoW0ZblcQFSDUxCqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQ8kyXhgPUlnW6+Fa6KY0qKaQ/Ivi11tJdUMLMoxOnR/7oI/V5VzXPNIEhRb2GsHgGaJTMupi/trJh9S3AFykZBSkDwunG+VKLiUkMQnOm+HzGCQOL0043O0mp0niIbIrSWlT4D9RQ4tWOGEWdiCKfMg7BgNsps/vXlVBFBDEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAjp8y0W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAjp8y0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755081606; x=1786617606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HjJJ9f9RUP0HaiTHczd99IX+fXCoW0ZblcQFSDUxCqE=;
  b=QAjp8y0WcOPDMj6CA8oa4yX+IStycX8lOAGVvwo+ievBfYCu2ZFEC3pD
   ghk7myMccpN7auYGAcEm8dWmjgudp7b06UvgC3VS66u6CPDNJKf75Ucs9
   nwALDMxMzmpMk2Q7OoHN535LF3P4GMt7OmHpQ6bzGkay+BkNPhYyHiNtk
   0R5756mqXgfl6lFfGTR55zAeeunst2DK6gK563XvFsbB471QrioW3vJz3
   0NpbyOB3JwAp9olDT2lqs1BEkJW3ZGXrrIgkh+Fw82A7Zp/6dwfIzY/yr
   mH/i9qGxirzEw5C0r2w+bl1L5GRp3vhd/qs5iqQBF9fzUpBM8xGIO6Tdb
   w==;
X-CSE-ConnectionGUID: I3E+2QBsRWayoDy/s8Q+YQ==
X-CSE-MsgGUID: MZKeYO7zRmCZUoZaqcKR4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44949086"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="44949086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:40:05 -0700
X-CSE-ConnectionGUID: YDrFtsWZSg6KehM9mnVkoQ==
X-CSE-MsgGUID: bJYD9ZCjTjiCr+qdGWZd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166705780"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2025 03:40:04 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um8tm-00002p-0V;
	Wed, 13 Aug 2025 10:40:02 +0000
Date: Wed, 13 Aug 2025 12:39:13 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2634/2634] arch/x86/kvm/kvm-amd.o: warning:
 objtool: .altinstr_replacement+0xa0: call without frame pointer save/setup
Message-ID: <202508041300.Amzn3wta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e46fbbc0ad301c3517340bf966d39b8493a2ebb0
commit: 80f33340fb84e12469bc46997edffe021aed7c67 [2634/2634] x86/bugs: Fix the SRSO mitigation on Zen3/4
config: x86_64-buildonly-randconfig-2003-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041300.Amzn3wta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041300.Amzn3wta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041300.Amzn3wta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm-amd.o: warning: objtool: .altinstr_replacement+0xa0: call without frame pointer save/setup
   arch/x86/kvm/kvm-amd.o: warning: objtool: .altinstr_replacement+0x102: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
