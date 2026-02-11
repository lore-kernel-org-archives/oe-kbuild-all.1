Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1701514F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 01:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770772584; cv=none; b=evfIx/9gWdAcHZ5PqCkWm+FB7cYgcZce5ORUod2ZJwVI+JQ5dMVQC6KdhMl20YxluZIWcpMs/JfBM099VGncph8UXM2sw/tMFcGWBmU4n+0skWzTxzrnHltkgOH1OfaX2q/XM9pcu/12W5Vwp8J26BMzuv0wZhI0uMLt6vaXpIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770772584; c=relaxed/simple;
	bh=zQfK1duHSKt4nuIm0o2EbL0gFCGXcTeC5skyfDPlcFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O+QmhB6Y/O59ma0VIzCZB9SXU2LNdo/jT90hEzMxff97Bo7As2JU/kgplrwUs8vviG+8xssHPmDnYHv73ND4V7u5XW86h6VGIuhscM1z7EgQjmt2rLORn9r5tgfilZS9ovkyDDDv+DDTK+Iea6LSJ9LY22aSwF0Hj3nHtQUMjsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEO+NKgu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEO+NKgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770772582; x=1802308582;
  h=date:from:to:cc:subject:message-id;
  bh=zQfK1duHSKt4nuIm0o2EbL0gFCGXcTeC5skyfDPlcFY=;
  b=fEO+NKgutnNvZ200++WrkFRIEh/FKkeT25XwSwGP/l+30we+D+hsEtL7
   hXQyCuuzadDZxwe5QycG7RGHzq5DQyT5w6FiAuXJ6DMJJ5SOgltknhtyP
   BziWsuIap5+10OSgxfa4Dtaisy921Rf00bY4lDlam6hHkOGNy9k6rP/hz
   8QdppbM+pnwtWdx52z7FI6/qlUYJmq07OPidhVS6PCJn1jR4kPgC2LMUl
   heag+peYeSEVeASgcdkO/Vpuh/jN+cBoD4AUV0mkJrhwxTqYhKy5DYBzL
   MelWYjjVofAniVp9V+YAXTDniZTbGyEw7mENyjcNUrzAEBwfXs11NyKeu
   w==;
X-CSE-ConnectionGUID: 6VqiRsJTTTeSAwh/ARnYzQ==
X-CSE-MsgGUID: 2CLID/HVR/uSdtF1cnEGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75759779"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75759779"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:16:22 -0800
X-CSE-ConnectionGUID: Ysdbb5FcTRCihb8qmfrONA==
X-CSE-MsgGUID: /jjnfcydSM6MWRRkHqr7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211414687"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2026 17:16:21 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpyq2-000000000y1-2xPi;
	Wed, 11 Feb 2026 01:16:18 +0000
Date: Wed, 11 Feb 2026 02:15:21 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `dsa_ops'
Message-ID: <202602110256.FEDk8DOe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ce4825ea1b7d8aa49dd3412ab07579e13abdb22e
commit: 35b05bd96204bc40a2ca8620bad1a5d139c20060 [1/1] vfio: selftests: Add driver for Intel DSA
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110256.FEDk8DOe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110256.FEDk8DOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110256.FEDk8DOe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `dsa_ops'
   /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x8): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
