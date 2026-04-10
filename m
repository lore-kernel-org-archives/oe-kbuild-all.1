Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8073612FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819015; cv=none; b=mygOgtJvFSXCQr6g6Rvelk9SQYam1yZkGY4yJoLdLdX7s4ixL+lTkq/twB1mSzlwB+qliYjC2oKFWTVLlPsL5w9mI487JWRPzTGY0lglljfihyLYxttxPmB5SexJ2pRh0sjZ3NkonKP5CETTh2wWBH0TlfXzdTA5qvTPxhlowIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819015; c=relaxed/simple;
	bh=ZTHVAA7ObKbLqDJAuHoA4TFbuieeo+CZrSHxDzgyyyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qczBBDOqPiDcbscZg7Qi0U2X1OZsMJ9c9VziwQ1Onn3OjDegq6TbZXdTpoX4toRHqbDVPqljlHaXxIWjSz5C9jXSzIUiZmQRD0/uhE07fhFX8jKPZ+n5BafHvoz+mfcSk+iJZx4jwi2bD2acP1AXMUQ7FGZsur0WrFC7UoyIdjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+XGnvl3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+XGnvl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775819013; x=1807355013;
  h=date:from:to:cc:subject:message-id;
  bh=ZTHVAA7ObKbLqDJAuHoA4TFbuieeo+CZrSHxDzgyyyo=;
  b=T+XGnvl39swUSM/+Z/0u+/uaTAPvs52mhlMWLKOaFwQZecw+PD0fjaxX
   BuRx/bVNR3+2m4dbiGDBKE24Rdl4ITWkcFq4yBqaKaOHEInPu+VI6SwVR
   fdWHTpjoqPhti/0wUNGLPuCL839r6exsNNp4T2O0gajX1dJOE3HZGAr3O
   JBwsIaUlxDr5acLzpWFWrXIS8YsP5JWZBVmUb3jLq0c7+5po9L9IKdVSH
   9tzHsMBM36gyPQF4bOnElldQTItQoWLpGX3xLYJr2z4Ei4un64k3vvrvE
   rmuVk64NYv8A2k0I5XSyhtUTh/FfaRqiks1a86TY0Pkh/9aMofxf3SxNp
   g==;
X-CSE-ConnectionGUID: +u8gFfmeSjuaCBaDF7OCMQ==
X-CSE-MsgGUID: MjBR7NnGRSCJRqKqaow94A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80696327"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80696327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:03:32 -0700
X-CSE-ConnectionGUID: MmtnxhhyTrqkdaNYdO3IGg==
X-CSE-MsgGUID: hJBtl6WTSfmk0TdkUPYwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="267021732"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Apr 2026 04:03:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9e3-000000003dN-3Qcd;
	Fri, 10 Apr 2026 11:03:27 +0000
Date: Fri, 10 Apr 2026 19:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Warning: sound/soc/sdca/sdca_interrupts.c:566 function
 parameter 'dev' not described in 'sdca_irq_cleanup'
Message-ID: <202604101859.wTZqXe84-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 0b8757b220f94421bd4ff50cce03886387c4e71c ASoC: SDCA: Unregister IRQ handlers on module remove
date:   2 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260410/202604101859.wTZqXe84-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101859.wTZqXe84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b8757b220f9 ("ASoC: SDCA: Unregister IRQ handlers on module remove")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101859.wTZqXe84-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/sdca/sdca_interrupts.c:566 function parameter 'dev' not described in 'sdca_irq_cleanup'
>> Warning: sound/soc/sdca/sdca_interrupts.c:566 function parameter 'dev' not described in 'sdca_irq_cleanup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
