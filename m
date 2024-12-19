Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0A149DF4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599452; cv=none; b=r3GEqwEwPBNqa8ikizYWqEgsdls94nKNveF42Ogm1CGDIN1iQCqDloYoUKa67UaB7RTdEu1t4W2NDfc/7Gin2zbNQ3pkTcGf3S9WLNMefxQ4R4NAOtGW1BqkZYVeKCNaCXFGR0uGSQE2sOhgJT8ns9t29+FiZlM2ViQF1uMVimg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599452; c=relaxed/simple;
	bh=9/rGL9kh5ZCw2RrAuigac3ZDQRi32lMenMqDfTpXkdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R7Oph3qhBl+1MPF5ou2jvvRnsMnMFSw3n9vdgjl43jmrSt9bsIKCzY9kFoC9kFS74E4qpYJ6Ivr4RLF0HcjjmLaNaIgVYstr+PwL1/jFPt7Adrb66/QrtU1fodIIXNGUrUsLyyghkrFXGZUzoULex+7mgYjekgQQZXREc99TtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNe5f722; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNe5f722"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734599451; x=1766135451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/rGL9kh5ZCw2RrAuigac3ZDQRi32lMenMqDfTpXkdM=;
  b=fNe5f722PVkGOZhs5Aq20cuy65KFEFaGuR3G8DABHhiJKMYU7uSp7b9R
   hsVn/pOwwHYAAOMK1zCoueILZ9j0OHm+fZQ/olQ9zW4M8uLPjisHwERJL
   G92wtmRYF6Ci3PPNbHqdKaIIg3MctbDrJoM0Y1crpX2lJ39GfUZ5308m6
   3aM/eCvjhfdaR/+219QZ7vLM30PfHxwqQ5DmnuHEDJnL9eZh8F2eR0x3R
   pvXgAJncVgTP7nsgUcr2pkmMW8Sos4BHR3pFF52+pDOMHZqauSaP4OMQZ
   1prQi2STRJFthLrKxtY1YjY9HxicA1CBt1lJyoiIJ79T1DSC8UWyZHdj1
   A==;
X-CSE-ConnectionGUID: N3tEDMZKQHyOhaiIRnE8lQ==
X-CSE-MsgGUID: udiYastFTXyCjGYaDHA2Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38779282"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="38779282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 01:10:50 -0800
X-CSE-ConnectionGUID: vkVgVYbCTzKKFJKJzQxoWA==
X-CSE-MsgGUID: wgPmBUZ2Txuh4V4P+7oHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103140606"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2024 01:10:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOCYQ-000087-1T;
	Thu, 19 Dec 2024 09:10:46 +0000
Date: Thu, 19 Dec 2024 17:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, John Ogness <john.ogness@linutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 2209/4829] drm_log.c:undefined reference to
 `get_default_font'
Message-ID: <202412191602.ZxU3mrBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8503810115fbff903f626adc0788daa048302bc0
commit: f7b42442c4ac142ab5e261858cec48eb6c9c1567 [2209/4829] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: nios2-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191602.ZxU3mrBS-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191602.ZxU3mrBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191602.ZxU3mrBS-lkp@intel.com/

Note: the linux-next/master HEAD 8503810115fbff903f626adc0788daa048302bc0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/gpu/drm/clients/drm_log.o: in function `drm_log_init_client':
>> drm_log.c:(.text+0x2dc): undefined reference to `get_default_font'
>> drm_log.c:(.text+0x2dc): relocation truncated to fit: R_NIOS2_CALL26 against `get_default_font'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
