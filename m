Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B8A46EC84
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898780; cv=none; b=AOIU0I3g/mj4v5GUO65TsPVyf2yWtPnoahzpd0Et2lIzi/ILKFTSiiJ4msHFC3N7yWXjhPogvJs0q313g/0qFC0oFmLtA2HJp0MAgEahJQYZqejeazR4OqysBYiS3kQBsSu/EDqD5l6UcU9JKntOKuSYAy6lYpDro8VorDMtT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898780; c=relaxed/simple;
	bh=LGz/+xTGpBUCAKneu3+jOnUtpPOFt3t46FQXHxTyF1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=px3anAXdUryeDkhRMGWS4N+V0DQJZMqWt+Jo3Ilfiv5P8WQf0pu3/b1Lj/NobORSS2izwp8WooK89nGuCCy1wKm3Cnh8glpuGNu7BIueBil/apHHEGbJD76pHu1sQ5wa37KvgExWek+MB3R3MhMxDZ9wWUJLtASGQ2SYYIvTxG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkCTqWqA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkCTqWqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898779; x=1822434779;
  h=date:from:to:cc:subject:message-id;
  bh=LGz/+xTGpBUCAKneu3+jOnUtpPOFt3t46FQXHxTyF1g=;
  b=JkCTqWqAWbzW7Z7qf7HAdWFOnz3TNrQ44yZ+ymzlj/4LPQ5quzAAqti9
   0glKdg+83A4lkKzqLJraLyHTokuS7abtWR5zoHVSIA+ytnnDCa4rnVO30
   IVr/hRhj15lZtgxJuOAp/CIMVO0HCS4ai5DF1bUGSFLKOnEfpYoyxxIHo
   rmJprLwQrv2mw/ocxT674RjKOi/DQZXJBHpP0XaT/02F0B2eLGAvGj4az
   AYmxKxbjLnSu1QQA0Qf77qYPfy6DUKUbG6AkkQMQdzJPpTYnK03qcQ+yU
   CBCSqh8TMEX1p4Y/H+HB8J4hbpmvkL8vfNW7ewhZmmpThmjdNrDPhX9UV
   w==;
X-CSE-ConnectionGUID: QG8KGenFRrqvfWggfsTT3A==
X-CSE-MsgGUID: do1NGi9WTUK848x+9r59KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113454361"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="113454361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:52:56 -0700
X-CSE-ConnectionGUID: K2yLB0Q1ROq5mB7F8ZSWIQ==
X-CSE-MsgGUID: 8vNdf6cOQM2hp7LyUYKo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="272539346"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2026 16:52:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQa4-000000000HX-0tk7;
	Thu, 01 Oct 2026 23:52:52 +0000
Date: Fri, 02 Oct 2026 01:52:49 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Daniel Thompson <daniel@riscstar.com>
Subject: [char-misc:char-misc-testing 19/37] kismet: WARNING: unmet
 direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by
 TC9564_PCI
Message-ID: <202610020124.ieOiopjQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   04434a1d0f311d76b1f15fa987918b471a0b8c6a
commit: 1304b0c47ef81cbd21e51ea0645a98104393ba49 [19/37] misc: tc9564: introduce base PCI driver
config: m68k-kismet-CONFIG_PCI_DYNAMIC_OF_NODES-CONFIG_TC9564_PCI-0-0 (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261002/202610020124.ieOiopjQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020124.ieOiopjQ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES when selected by TC9564_PCI
   WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
     Depends on [n]: PCI [=y] && OF_IRQ [=n]
     Selected by [y]:
     - TC9564_PCI [=y] && OF [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
