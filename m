Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CDC1684B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766251128; cv=none; b=tYyqXaYDbWdcTyXDo/QOMto8Lb/bKwsCjONHccD2+QpWtis1vRRW6e6zUOjVb5gLB5w7DDqESzC1ZNrsePlKyUI0Zes1n2SbwQGQPyFjDeNc6aKQxGZKPkNOC/TRMjqFF6IOTan1j5zmoQsDAGrKgastCqNck/jWENffTvlm998=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766251128; c=relaxed/simple;
	bh=33NRlw9u+vRkXp44lphFQx/3fvYYYOBVEaX83ex2sx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoDuXaKuRPvH1Hefn1Q9m9G+UiU27koR2MJbuu6ccYVOnshqtH6iKeNV6dIPjJmvsyzBEnhb0AOf9U7dcr4kGH31Z6Bpbsjtx9OMD8A6NI9Kd9HNowhs54BM5+TLaAplzObrnqb+F6PoLlC4JQWPoycLmSMxRSNPZXgQ1hOwf+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cr+hBZkB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr+hBZkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766251126; x=1797787126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33NRlw9u+vRkXp44lphFQx/3fvYYYOBVEaX83ex2sx0=;
  b=Cr+hBZkBFInwHy9+DGtw7h/6IK/gIT3PSrGectsFnCo5S8jPte6/2m1x
   /rz4BixVIu6qPypT+Jz/nH+25C5tqFhCoTS75XB6nmce8yNsPSiMiz3U2
   ZjXt+7JPMAye5//H+5U810IJlrGqEJlAHIE+1xn0s0bD5t3HBGE6iyduD
   6CTpSDypf9ovedMYFGJ6zCu0GxREf7QD70poiMDM0Ix78ROXAac3bXdBG
   bvYLXnjkA9uP3IBbLerzNSZI+llj9LcHMQpFE/J1XvQqh49r8kTrZKw/q
   xrOCIjkdleO2bGPdQcDuGz4uRBDPyoFTjUTWZfxfn6dJrOPdkKuTFnanf
   g==;
X-CSE-ConnectionGUID: InaUY53IReSQJ6Ga3zq03w==
X-CSE-MsgGUID: CbT2apLwTkeFiwHEcDtdQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68226501"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68226501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:18:45 -0800
X-CSE-ConnectionGUID: JHsIiRGsSfKyfwf1irgzew==
X-CSE-MsgGUID: nkqIpAhJRYmCw5d+TsAGoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199385833"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 09:18:44 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0bK-000000004ie-1ANM;
	Sat, 20 Dec 2025 17:18:42 +0000
Date: Sat, 20 Dec 2025 18:18:17 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
Message-ID: <202512201850.48kGCnic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1/1] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-kismet-CONFIG_PGP_KEY_PARSER-CONFIG_PGP_PRELOAD-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201850.48kGCnic-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201850.48kGCnic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201850.48kGCnic-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PGP_KEY_PARSER when selected by PGP_PRELOAD
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
