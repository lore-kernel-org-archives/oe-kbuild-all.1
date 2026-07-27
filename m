Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFF42B728
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187536; cv=none; b=T1W4KOIHWcC2Glm2BuPWKOFdQ7t2ANWvEUG2knnppnlDLW9JW/u6NxbvCdPV3sg3gUdVfv2kxAxqJk2A2EvYcY+Pod0OxEFwoUlsBA5O79NOAYeb/U5rm+UZoNGSzJNE9lNl2IpkKDU4Ray8ptMfb5uihhpN9BCbzA5IAjbWIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187536; c=relaxed/simple;
	bh=saVyeFEVDpNrRWJpopW4NMzp/Qd8MFjAhLZYH4i0uCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnfFWHd7IpP9sdgTaCIIO6Om7IWwassvUdn7wJd+Ij1Nq6jqCJydo/c1zX0BJbZYjbM97zJxK6SX1g20ikzOaZfbnvctmCF6lRUi46hD+4xVWgA0wNlDS+Mc2jXZPUwowATnHbfpqIQjtKgBbpBysZOqtmV0KWPDF9A2rKOdSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SApNWMeC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SApNWMeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785187534; x=1816723534;
  h=date:from:to:cc:subject:message-id;
  bh=saVyeFEVDpNrRWJpopW4NMzp/Qd8MFjAhLZYH4i0uCw=;
  b=SApNWMeCi88E4t2huYZegSM23APCzu5H1jpW9ZQV0KSiGcZK5q4KRK4d
   1EgEDYbDv3e+BJ5/eBAebmKyYGvUB9D0JE3GjP8cQ+Uwo/lRpEnaoM+Ii
   e9kLgN03V2e8oh1yANBv4L0l/rECqJQFSplfHrRsYlCWax9ZTzGDWvp3c
   TRcG+iNWRvpd4jsGa3VGwOudr7Dt++u8biTrk3SQvO3tzWyYDLik6nlFX
   Gwl+hZum9VWG0yLXMd4ZDdTXK7EXI/siHiNnE0w2u6dEy2jg0+6BBqwWI
   s9ucvKV4o5m62vkQqAX/0UIxdrbBEE2lsX9AeofYyDbTlOX063A+qJ9yH
   g==;
X-CSE-ConnectionGUID: oqgpBM58RZqqv7PDTzQXNw==
X-CSE-MsgGUID: oKK3vQ0jTSOjXDBL0N9W7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89654779"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="89654779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:25:34 -0700
X-CSE-ConnectionGUID: KF/Ht4KoTWKL2dLjEZwQ2A==
X-CSE-MsgGUID: xaaWxtHwRkCsdPdqs5BTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263014961"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2026 14:25:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woSpG-00000000dcB-3u9w;
	Mon, 27 Jul 2026 21:25:30 +0000
Date: Tue, 28 Jul 2026 05:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:fix-p2p-acs-v1 121/121] ERROR: modpost: module
 pci_acs_test uses symbol calc_map_type_and_dist from namespace
 EXPORTED_FOR_KUNIT_TESTING, but does not import it.
Message-ID: <202607280536.9MqWDmee-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git fix-p2p-acs-v1
head:   034d02e984825bf85e76d4ee7b483b97cc530a1d
commit: 034d02e984825bf85e76d4ee7b483b97cc530a1d [121/121] PCI/P2PDMA: Add KUnit coverage for the ACS P2P routing walk
config: x86_64-buildonly-randconfig-002-20260727 (https://download.01.org/0day-ci/archive/20260728/202607280536.9MqWDmee-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280536.9MqWDmee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280536.9MqWDmee-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module pci_acs_test uses symbol calc_map_type_and_dist from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
ERROR: modpost: module pci_acs_test uses symbol pci_acs_egress_port_valid from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
ERROR: modpost: module pci_acs_test uses symbol pci_acs_p2pdma_decision from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
ERROR: modpost: module pci_acs_test uses symbol pci_acs_egress_ctrl_set from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
