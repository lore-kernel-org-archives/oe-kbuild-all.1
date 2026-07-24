Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82C1C5D7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 02:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784859442; cv=none; b=tEq6eeo7VFsCsQqSCnE3O3Gp1fosjzxZS1e1Ywu/7Qr5tEnE/rOq9LvPgy2MirkEgfG79WSVuzkwSfNTBnHg3BvZ7kVilb91VxpKcQd/VdEbVSplvmpavwU8qx4zXTq8qDCYzxLUNBAllBOn9Nok4Qvk55/irOduMCsLsaw2xFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784859442; c=relaxed/simple;
	bh=8FMgIArldnsENiegdldW48QgLFXhHw88HzMUJG5JRvQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UAPXgy+Lnaq03rH+2F/Ka4bULKcglrXEpkZ46YRTiYZSGHD0OkoKiLJEaETUnLUXfX37PzSabtcFcArLKoZlerEm1mai55Bk+HFknYpW/qx/YSmmU/5BYe1tAdj5bHSN8zxSQooX3TTkBeOtLYOZ+MCf7ipfq+MDHDce+UghKLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZKRrgl3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZKRrgl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784859440; x=1816395440;
  h=date:from:to:cc:subject:message-id;
  bh=8FMgIArldnsENiegdldW48QgLFXhHw88HzMUJG5JRvQ=;
  b=eZKRrgl3+Us3bcxqpkPeGHdQvWs0p0s7zCcU7o9vftOYDkph/GQL6r+O
   5V3u47FQPnG2seECqwSs4IIlT/Sknz2qaIqU/b2kURZkYvDBogpC0oo29
   WS/3Lpse8CQMBjGjwi4gFifRBO+xHmxw/DrWcbd1bnw+GPWxMdYVT3sHU
   kMErXg15AzxK9cDzXe4GVQTLjEM4swOJEsCpnfzT9KHrGrkti71n2svpx
   Lajo3bPNnhHcIDZ9qnDHN6vsaigLGv8C8W9sM0ip+ul7Ui10RDSdfw1xC
   Q7fzeszu+/s6WPvVrpTPo7eOqPqodOZZRDT8XKeKR4lAQX/FXtijz60ZE
   Q==;
X-CSE-ConnectionGUID: M2MKC9JwT2mts+nSt/vwSQ==
X-CSE-MsgGUID: hAUVc8VRRwSpXT8aVmSBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96896897"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="96896897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 19:17:19 -0700
X-CSE-ConnectionGUID: g6DFCVRsR4uTJLATiLOSDA==
X-CSE-MsgGUID: SywgIKo9SguKe1L7H4jE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="254642579"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2026 19:17:18 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn5TP-000000000ug-3cwD;
	Fri, 24 Jul 2026 02:17:15 +0000
Date: Fri, 24 Jul 2026 04:16:52 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Brian Daniels <briandaniels@google.com>
Subject: error: include/uapi/linux/virtio_media.h: missing "WITH
 Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202607240448.uNeUEtPY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Brian-Daniels/media-virtio-Add-skeleton-virtio-media-driver/20260724-064923
head:   01fceb70ec03eeb7712d0fd675a33df84773f422
commit: 45b06018b2667afacb4b2a036dd9717d09d16cd6 media: virtio: Add skeleton virtio-media driver
date:   3 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260724/202607240448.uNeUEtPY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607240448.uNeUEtPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607240448.uNeUEtPY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/virtio_media.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/virtio_media.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1471: headers] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
