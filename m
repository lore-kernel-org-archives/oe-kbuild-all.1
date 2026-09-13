Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830D3B42F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338132; cv=none; b=RVLuG6BfeN7rqw/CD0QXV/74ez7vwwJ1NmUTenNxT642p3hJ+kUstVh8k2njy0CFIXtIG8n436SUU2x2gEQgiJjZ0CxdseE7rxmzVaILqkZgKBuoHcGKP0mVRhRLtVv5+dgCKyqCXEHWbfntwtmB1TiISP3IpX0XIVmLIYDuGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338132; c=relaxed/simple;
	bh=F5cX/unMvTm2bQgObRtV5r4C/bHXplSThFQhM7OaOgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/FeaaRcAOSVKkqTQMEbHs95UikCHybcDhCpD0e+9Ss4slM9DHPC/4+GKw57OfVhzhbud5Y7MfX+XjhyObtLlYGVqb1/9jRiX0pbVQ3qRDy5qbNnkgoWGxfOLCu5EEvc2IyaUSdYsfRFbVZrdyeYi3MXdlVPgYjViFbvaEsIQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTargUXh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTargUXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789338130; x=1820874130;
  h=date:from:to:cc:subject:message-id;
  bh=F5cX/unMvTm2bQgObRtV5r4C/bHXplSThFQhM7OaOgg=;
  b=GTargUXhccKs8QGDtu4Tv8Z/CZSBkUzDDTNv42otqUu0LtWNE4DkkRWx
   5s8wRd8YKQwG/ievq+/xnlJ7VVW02KSfgAvjehb8t8+RwYbUDKFIhj4AB
   9hl2ttMkocPSKeiIy7JCCtJ3/lerYkAlYZYKrmeMJAttPTElLvIpB7iz1
   rXht3X8hjNOB23kPRzvXEcLnFit6QdBZZ/MKiQMhM0hR8kc/bMujswT8d
   tiAmjfqiacFhPzOx/EVufMTlfleuHQ5+JyuZsNFh4WG6tAhFhBbGN2ta6
   0Hd/OLO1CoKwkokkZsUKf9gN4j6FVVeX1zrP1N++0YJd+zBiiNSP0Qlgu
   Q==;
X-CSE-ConnectionGUID: 6bsp5MLOQjCDOdkT5sbjYg==
X-CSE-MsgGUID: uC4Q3TifSXun7Ty36nJUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89540942"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89540942"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 15:22:08 -0700
X-CSE-ConnectionGUID: 2xwprsikRbGqZzB46QxuWA==
X-CSE-MsgGUID: KlyIqu55TEOCmTMxdtbXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="695892"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 13 Sep 2026 15:22:07 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5saK-000000001jr-4Arr;
	Sun, 13 Sep 2026 22:22:04 +0000
Date: Mon, 14 Sep 2026 00:21:47 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for VFIO_MDEV when selected by
 CRYPTO_DEV_HCT
Message-ID: <202609140056.YbGBIiKt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: d73bf468fe927f96ef15330377aede9344b031b5 [164/164] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20260914/202609140056.YbGBIiKt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260914/202609140056.YbGBIiKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140056.YbGBIiKt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
