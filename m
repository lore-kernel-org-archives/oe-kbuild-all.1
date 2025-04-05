Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F6224D7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743823543; cv=none; b=HUE7kmxk5ySi2OYOmwsDlf2znzCY68vOOAaq7r6WhIpW1WDWj0gDnlhsCIBb/vYVhC2ojZCZo7PCHYJVCjaVDuTCxd8LUI+E7QKcDvmTrEujHyBif5TIRVkCmHmkI3rehie9KuWDAacusO0VvinnKpXmP5In7OOKcNCxZZ/M6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743823543; c=relaxed/simple;
	bh=X01rqDU5Op3B89pGcWSLkKOSDzDTX/aGpUgeE5itfNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YNiHmWcKq8Z7a1JQzfw7J5VrLGAATIaUi9DeDVZIodNmVYBqvqpwqxGLap/niT4Eh59iQyRthr6fNKP+u/c4E2T+DDGjyq+xj250JXsCQBuijfNYaWUcu1wtOp63DVPdcrZ3dS+IckZeXGGdsHT3LEchYtMv5Oyx0i9OJZ/ov2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhla39YM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhla39YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743823539; x=1775359539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X01rqDU5Op3B89pGcWSLkKOSDzDTX/aGpUgeE5itfNc=;
  b=Lhla39YMYQNFGERbnAwvk5S/8iHV0sRjNx1d3dzOJzpYF3RB/q0bDkWC
   2EGy3Mrwc3lxW2ratXuHTgcKl07mDCFKupAyViBZcThpJZ2j1QoZkHwhg
   AtoaEvAScBbEAFqt8f4aaOSsMFRKhaOV9HqEU9Fvl0lFr5laU3KaO6cuJ
   yNoA+aduMRK6pHBQUNfz7RXUImToGnrUqGHFYcn3VGZN6EVsWpNMBYgP9
   4/qF/0CZ1PNQCBokYbSFJqd8x1hMC1mCe4KBgBqBBGyHgpF/dXTG8m0YX
   TZvbNNQOMz5YFPkpWe3SgsURRTxRm+vOa4xMy2PJ/S4i3edqpjj7ZFMn+
   A==;
X-CSE-ConnectionGUID: CBtOBe6dTFWemimoB1d8YQ==
X-CSE-MsgGUID: jkslBS1oQxS4XtZhm1XOUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67750621"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="67750621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:25:36 -0700
X-CSE-ConnectionGUID: xJR6rhzbT06w42Fo7qq+Mg==
X-CSE-MsgGUID: B4SVEAN6RPW54k/EaHWtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128317345"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 20:25:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uA0-0001mR-2x;
	Sat, 05 Apr 2025 03:25:32 +0000
Date: Sat, 5 Apr 2025 11:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: kismet: WARNING: unmet direct dependencies detected for G2_DMA when
 selected by SND_AICA
Message-ID: <202504051109.Z0c2GF9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f867ba24d3665d9ac9d9ef1f51844eb4479b291
commit: f477a538c14d07f8c45e554c8c5208d588514e98 sh: dma: fix kconfig dependency for G2_DMA
date:   4 years, 3 months ago
config: sh-kismet-CONFIG_G2_DMA-CONFIG_SND_AICA-0-0 (https://download.01.org/0day-ci/archive/20250405/202504051109.Z0c2GF9q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250405/202504051109.Z0c2GF9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051109.Z0c2GF9q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for G2_DMA when selected by SND_AICA
   WARNING: unmet direct dependencies detected for G2_DMA
     Depends on [n]: SH_DREAMCAST [=y] && SH_DMA_API [=n]
     Selected by [y]:
     - SND_AICA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SUPERH [=y] && SH_DREAMCAST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
