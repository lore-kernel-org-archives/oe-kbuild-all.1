Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8F15D1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 04:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749272113; cv=none; b=XzpZR7p3yskmaWiLPlwp2qi2uyjMAGBV86qSn/0yqA9FiuaB90C3svslWbFYrWnV0rTCwm3hZboa04lIfoH8k1XQArOWbU9is1AHtoZPKldnoch3+BWurgdIYrV9zcgsBrh/eX8E6/M56qY+OWkiNgxmbV5vahgrm3jRydqP508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749272113; c=relaxed/simple;
	bh=MG3icsE171sz23PPRx4VVV/CWlkskBNiCve+kFOBg9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ahru0k5k7kmqvI6Edv20+vgTs9fl99CR/xG4zBqWjaR3orsrJZYoAYBj6KlbAFIvF2AgUYJ1A3T11y4p3XN/DPeZF6JQjZyEKU5kOhK6n8gZM69h+mrtkJeaYdc/VjqfUlMueu80Dw59shJCoDPdoA+V2I2dJQzfNFSoevLZajc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPenBI8A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPenBI8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749272111; x=1780808111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MG3icsE171sz23PPRx4VVV/CWlkskBNiCve+kFOBg9Y=;
  b=NPenBI8ArECAbqMFVyrx0pJPFMnqxRtNWgcP+59Ac2ehbAd4v952WRC8
   376C+lNUU/kpxJ/dWzkqmEypScU6Nfxdv0xL1OR4UE3oLi+0NsLfYKEuI
   aT0HTdS/kdymFpiGwr5SGYdbTV/5IrrmYYaIyyazHrPZoJ/qFc/OHnh4m
   6otxfoTqM9c2G1YncmMZzmWCx1jyEQotl7Shz5Vmxbj6t6KZ70oj5Hq0l
   Vz9l2HSWnrij0TGr2BzJTQMxHGXa9LeRQjPliavZwUQdhqXYgOh5pVD/5
   GLu0JFtJPpge5ebCxY4tShfx8R3uY57I1/ZCIWZjq0K63gFrnfwpvz+b/
   A==;
X-CSE-ConnectionGUID: 7/mUkQnWR6aYYViCffH9Ag==
X-CSE-MsgGUID: ugiBmvkkQ+6E9tNX2sTWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51521898"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="51521898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 21:55:09 -0700
X-CSE-ConnectionGUID: c7Dc64AoSwSAohCAdYmgNg==
X-CSE-MsgGUID: FWekfVokRYCNVdegIm74PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; 
   d="scan'208";a="150836544"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jun 2025 21:55:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNlaD-0005TN-33;
	Sat, 07 Jun 2025 04:55:05 +0000
Date: Sat, 7 Jun 2025 12:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [linux-next:master 8776/14505] kismet: WARNING: unmet direct
 dependencies detected for REGMAP_I2C when selected by EXTCON_MAX14526
Message-ID: <202506071244.tYPJVwXh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   475c850a7fdd0915b856173186d5922899d65686
commit: c2aeb8647e53c49874429bdb0bf132ce25bd8c63 [8776/14505] extcon: Add basic support for Maxim MAX14526 MUIC
config: i386-kismet-CONFIG_REGMAP_I2C-CONFIG_EXTCON_MAX14526-0-0 (https://download.01.org/0day-ci/archive/20250607/202506071244.tYPJVwXh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506071244.tYPJVwXh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071244.tYPJVwXh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGMAP_I2C when selected by EXTCON_MAX14526
   WARNING: unmet direct dependencies detected for REGMAP_I2C
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - EXTCON_MAX14526 [=y] && EXTCON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
