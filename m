Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D23D3309
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029423; cv=none; b=MHLd8//KoUT4C7lmHIoZ/K2mz/usCPH3tF9gHmIHrS2O9gHOVgu+X+NGfakb2utSYMudDZPu5IgF7Xmrom4J2AOSnPRMPW7dcGz5NuuNNFYMCC0Uf4X/+o+TjeLaOB1sGs9l1kCWMOrIhb67SDw8nwcmhC52iPJe8Vx6146AB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029423; c=relaxed/simple;
	bh=nCmKa7dRMBmF+QJhFEFe8lRvIV1ojOBAtmx3z/dswLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YM6zlClV4HdVGfq9ObqJB2kdIBYBfNhIBS8Z1CR1uuJiUJtzW5e/j1kAE/kDPYQzlLzEasaOVskN07rtzjejlAZeSyHzx0ayseNi3Engf/8fJZwhiRo9dPV22mktOvQsDATUB4ooNxha3nmYcUxyNJQr9fBZX7UiBoMVaa2vYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKCVV1bQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKCVV1bQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772029422; x=1803565422;
  h=date:from:to:cc:subject:message-id;
  bh=nCmKa7dRMBmF+QJhFEFe8lRvIV1ojOBAtmx3z/dswLM=;
  b=MKCVV1bQxRQNaf3AOM3IdEdGT3oyILZ0x64tiHhyz+31EQ0oy4RnbUTw
   y5M6tDYhZ3Y7u9teUKiH0/lnEmM3jLyXtRoQcXXi6bRCjWg3ao25frnYe
   LgkZoReHxgejdOkIeM3jwyp6gz1hUnc3LZAu6+ESSpz1+V74VZNGrZ3Wz
   uFbsTbw0cGfD9F3zWAq4qKz5Mlvo3dK2SNsyUsJfsHNcYHNNDbFX3yjcW
   cKwohtjZuWtbwyZQNtJOo80JGh22cbZSJn2sYX8+Oaj5EJk/2YJthSFnT
   pleFEZnY0tVhsKiPkV63wdJMRURy37uutHahlZ0SVH3BtYyI8wlsPoLRU
   A==;
X-CSE-ConnectionGUID: F3JAaOYzQzeC5SuJ2ya6ZQ==
X-CSE-MsgGUID: CEjcb+BpQ9Wp75uohou5MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83692522"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="83692522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 06:23:41 -0800
X-CSE-ConnectionGUID: tbi+L5JbQhS5Y9sJZ4VMFQ==
X-CSE-MsgGUID: DXiNN4F0RI670wJyV985kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="220851859"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 06:23:39 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvFnY-0000000061N-1wZk;
	Wed, 25 Feb 2026 14:23:33 +0000
Date: Wed, 25 Feb 2026 22:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/state-readout 16/28] Warning:
 drivers/gpu/drm/drm_atomic_state_helper.c:856 function parameter 'conn' not
 described in 'drm_atomic_helper_connector_compare_state'
Message-ID: <202602252259.AWH53Cxg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   c9f24e410ebb9f3bade012825d8cfd87915e9d4d
commit: 8cf1a809ee8f9b7f66df99cf563de462fde6504f [16/28] drm/atomic_state_helper: Provide atomic_compare_state helpers
config: s390-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252259.AWH53Cxg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252259.AWH53Cxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252259.AWH53Cxg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_atomic_state_helper.c:856 function parameter 'conn' not described in 'drm_atomic_helper_connector_compare_state'
>> Warning: drivers/gpu/drm/drm_atomic_state_helper.c:856 function parameter 'conn' not described in 'drm_atomic_helper_connector_compare_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
