Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E1136E3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636082; cv=none; b=Ow5Lqn8aDhHRhxZjBqVf7kuAiI7zNjyntozb5CUG/qBk+39Or1+EdLvUwO5yOHa6/pShAd7Ug1LHqqGbH2qPZ1UEPaGoH7vVKwBBNAObKzRf5sm3lEOBdBbw1PmRtcwPFMHYOZiM/QSJDRq+vD+hFVYQaM7ZPAAvOAoT4HqTP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636082; c=relaxed/simple;
	bh=hK4MSDbcbO5Y5ISQxEQTIHAqK9Qq6pXTEQby4rDv+lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSyQ8oCgQt+FgC3SOhZcjtcoc+wkMKylQOVAeESnxR/eiYMPtbHHeePGhizZ0V2c8qs3Dq40PTo3hDKmRUJEmpX3EkeF/n3VQsmPuAen76Ykq4tqICecyqFkvXQrTfFsQGo0MQiEVK+5mgjhoHEpGqVzOxWTFiORjs2Yswmm/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwdiBk4g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwdiBk4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737636081; x=1769172081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hK4MSDbcbO5Y5ISQxEQTIHAqK9Qq6pXTEQby4rDv+lc=;
  b=PwdiBk4gJibJs76z/n1XhMJwXYERDSkGYGMtwTnFKnq24M1IfIzl0uja
   wniCfb4fTOGORRialkTrPIimfifyMRqRK2VvvSyA6US2JBUicAD5+5SOl
   7wA++zDUJgN7klELwWlR3tN4LIYMXKchK9dwNSWSVFw8kJlMT8szUbJOV
   WK1TMecG1EjnrS1isiE4lm6Hy6z4bTPiFmoU9rExMEIKYoGGH8Qmc4V+B
   WSUKlx9wMm24qd3hE13c7XFX/z6rxI46ZITPL4oe8ZVivzswH6eg1P/it
   n0+iDlrobcJ/JaKltoHYRnua6YGCwsXrDJpCd1j4toHAuBke0jQxQxA8H
   g==;
X-CSE-ConnectionGUID: Tti8Mjg8TsCaiSMhLA3HqQ==
X-CSE-MsgGUID: O4AXdLwoTweWAbpn4MuJWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41886279"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="41886279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 04:41:20 -0800
X-CSE-ConnectionGUID: k/zuajrPQGWfaUmzsJiuNg==
X-CSE-MsgGUID: m1l/Jdd4T7idtHsSD1eOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138318815"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2025 04:41:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tawWK-000bAd-1u;
	Thu, 23 Jan 2025 12:41:16 +0000
Date: Thu, 23 Jan 2025 20:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [bcachefs:bcachefs-testing 302/305] ERROR: modpost:
 "time_stats_reset" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202501232019.czbq81HY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9f73221be57f43a312dec7cdbd8ae087006f8676
commit: 9763acc0c6a67f5a2b642a79d0fa5bb25ab08223 [302/305] time_stats: Promote to lib/
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250123/202501232019.czbq81HY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232019.czbq81HY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501232019.czbq81HY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/mean_and_variance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/time_stats.o
>> ERROR: modpost: "time_stats_reset" [fs/bcachefs/bcachefs.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
