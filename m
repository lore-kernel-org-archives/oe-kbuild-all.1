Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE5B156F21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663797; cv=none; b=hG+Fa/XZv/eXfUp+eTSCAwIgzd8D2Z/cIr4wTbXwMNjzoCYioVEvpImhwl1qNS1ABb8RwZYC8YfZ+nlu/jcBMVOpi/682JM9HdiV0eMQfWme39mpH+gbBsHSdQX18EB3+CRiNF5Jo8KWGH5KuFku7culZXEVqAKfC9S6jBsDiHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663797; c=relaxed/simple;
	bh=5VcrUVj36TCRARytb1vvP/klcqPPcOotk1gXV2SqGIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4uWPSMOeVEkYAY5Zr54AxIoYf7hQbUSazypIvQPoXowT3xHvIowiKAwXQM1vXhD/KYCsgaTpOLzh8mahbn5IcmRHJSt2hwJBdXwx/Fw8NWbznidNKzXP5+6KUA82u1q282yS8nAtEl+Tezq24oSmaOX6IVYvm+MJS9YqXSFdbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns0WpSJ6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns0WpSJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737663794; x=1769199794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5VcrUVj36TCRARytb1vvP/klcqPPcOotk1gXV2SqGIw=;
  b=Ns0WpSJ6nn3kql0XKTUFlYQ0H6tLkrz1GMlDHtsgmcA+6+lW5OR0iAGN
   tuT3WZo+L3ZMkzPZM2w/KpzR+J7cXoaKkMoVDptyP1MA/NrBUp8LAPg5q
   k6S1J9rX7qEMX0jqbH0wCsLpSisqRNOSzB/EWsC7HyuoWGA8p868qfpOk
   cemKqvBsSZXKjgRnhcJgdO8XfCUpD2E+LnvO7hAvzwkE4NTKczb3A/Gsp
   eqm5vrhLkIaHfGoAJ/I8+AJNm7+fKkTfVeXWIZ3LqIW5eSR/E/azRZS3w
   vtLRfu7uWNoaTqFo4iuVgcri5sJh1PSSV/t3rmE0JaMLM+ydjiuNnwuTU
   A==;
X-CSE-ConnectionGUID: ZrKtVukMSeG8U8O4c7Pskw==
X-CSE-MsgGUID: Jv9GfEqAS2G2oSZooyaq+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38218160"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38218160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:23:13 -0800
X-CSE-ConnectionGUID: 1IcmkDMXTWW/BJMjsDdXmQ==
X-CSE-MsgGUID: yH91s57aRg6DAkgBVOvDfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107695977"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2025 12:23:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3jK-000be0-0j;
	Thu, 23 Jan 2025 20:23:10 +0000
Date: Fri, 24 Jan 2025 04:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: kismet: WARNING: unmet direct dependencies detected for G2_DMA when
 selected by SND_AICA
Message-ID: <202501240428.o1uNFRHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
commit: f477a538c14d07f8c45e554c8c5208d588514e98 sh: dma: fix kconfig dependency for G2_DMA
date:   4 years, 1 month ago
config: sh-kismet-CONFIG_G2_DMA-CONFIG_SND_AICA-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240428.o1uNFRHo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240428.o1uNFRHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240428.o1uNFRHo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for G2_DMA when selected by SND_AICA
   WARNING: unmet direct dependencies detected for G2_DMA
     Depends on [n]: SH_DREAMCAST [=y] && SH_DMA_API [=n]
     Selected by [y]:
     - SND_AICA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SUPERH [=y] && SH_DREAMCAST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
