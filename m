Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB151188596
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774587173; cv=none; b=spzvLXo8QxhqLHkB/fEPoxrfTRZmPXBfCD2tOc+bss3gi9KYfK/+n/J6Dl0U2geYWausnzVijBvwnfCREemwUrWsjyXujdoGvJv5I6AoKhjsj7KA5wIbtpGpFZx0CB315q4lr85lBecnB+Z/Wbif+ZDNzLkMFo1gJ9mn21b+lQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774587173; c=relaxed/simple;
	bh=HpP4dRUghxaM6xvYXbSXNFvQwQSTDuDAxJQDFlq3xnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mk/uY/0oeMzM3M0rEd9QlhEiW47kuL60Rvd456/ZWZIwfMQ2yfHYjfg55vXXvWiw4DKpTliqgusGZWuJ9Q1kgN8avARvBVPkVwB5/FR9XCOPmqMBRRxipvzcurxw6IipmnwREocgph2p0S774aEriCrRozwTIhyjj7zMbTUvtYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGVAvXQV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGVAvXQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774587172; x=1806123172;
  h=date:from:to:cc:subject:message-id;
  bh=HpP4dRUghxaM6xvYXbSXNFvQwQSTDuDAxJQDFlq3xnc=;
  b=MGVAvXQVpGcSgfoqRi0e9FFvS/O4ZgQlfbEGAVjy+EbtFv9mPev01/eb
   PeE7Mfpa7lM7T4DeHisa0cYHzV59Fd8Ee/qfxoSksZD1x4p/GhSXCvS6r
   KsR9oPX6WrWIirr7yk0VrFWUQIx7azuvmwNmRx9VieLcIElrQ30yLjeSz
   D/k7dVeF2M6JQGx7yi/0DZCaRuyvqnwNb8mD6RwCTX7N/2WMXAVfhtlRa
   WRMOe6xWBuraHTrsy922tPhHeuYnOsbn+BFrVaxr4Ead89pdjGBs0DcZ6
   JEa7kZPN7iUfMC2vfIEc7ArHJIIGTXiKe2+CTCcPiqSBlYPaMj2G6pXNe
   Q==;
X-CSE-ConnectionGUID: VQdaG04YRaOdPzX5/dMqXw==
X-CSE-MsgGUID: mlXtY+EVRb+9Nf9qwWBZqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86733384"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86733384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 21:52:52 -0700
X-CSE-ConnectionGUID: VvLqLytmQJmEIKqWWF2Kzg==
X-CSE-MsgGUID: ACHBrplGTxGETZvDiXCpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="226830976"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2026 21:52:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5zBf-000000009nJ-1lLq;
	Fri, 27 Mar 2026 04:52:47 +0000
Date: Fri, 27 Mar 2026 12:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Subject: [jack-fs:for_next 1/3] Warning: fs/mpage.c:661 function
 parameter 'write_folio' not described in '__mpage_writepages'
Message-ID: <202603271237.fYLJnhTP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   10b7ecccce237079075f95b5363e4195bc8effcf
commit: 90347d82e4d3fa1705e513f04066f7c9c2b34694 [1/3] mpage: Provide variant of mpage_writepages() with own optional folio handler
config: s390-randconfig-002-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271237.fYLJnhTP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271237.fYLJnhTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271237.fYLJnhTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/mpage.c:661 function parameter 'write_folio' not described in '__mpage_writepages'
>> Warning: fs/mpage.c:661 expecting prototype for mpage_writepages(). Prototype was for __mpage_writepages() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [m]:
   - REGULATOR_RT5133 [=m] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
