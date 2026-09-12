Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58D5397922
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212389; cv=none; b=JiN1m4KlQCK9uDhfAtkrkZVlBDMBdvaMuIyJQuM+CL6CCw1rcZIX2+RripICP8sIJCFPek6m8PsYa0kRU7sDwAPfn9tRLDaNhrCVOos0w2PW9rG0KH74cRv/2ER9/A8CUfgWJjxSDS4cXdZSj/q4B1P5uMQdfuapSx+DGNtmRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212389; c=relaxed/simple;
	bh=nxWyNoEiBwSsImGbGoTokwLbASxzmCvtZ+ySDicv6GA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qd5/jmg53vBhSSjkBn5WPmirDit+z80B5Nir7HFgO/4GpVeRXioGt6pEKHTxhJM8Wu1yXsjYty/OapZmDZOXWX424Gkn5aMlOkMPD7uQsI5zRZ1OaEUArHBy87hhN9+p8IYykGpBF9FhQ7vtaV3uUnX2r+uYaqlL9wMnJ0C5go4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkYBAx1D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkYBAx1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789212384; x=1820748384;
  h=date:from:to:cc:subject:message-id;
  bh=nxWyNoEiBwSsImGbGoTokwLbASxzmCvtZ+ySDicv6GA=;
  b=FkYBAx1DIRL+XJcDXKdSECG6NFyqMtsDKI5wk7MmrjXOS02ZpRRzb4YU
   EIKmTxWUKhOFrrxRIpgFX7P138Q2Zf34zC0CU1VAjPnn5pYrk68mcpFA2
   Boscz/lNNmbuMvCe1IfpU3yWfFe3O3nlXTPgHhgFZQUDfdM+O5SCIbhHw
   ZbFLeRHZUZlcH5JrOxMjQeVuhff8sfJIt7+sjRCfpHJUhWbc+fw8iMXW7
   fjXYgpEmH0QnW5ShEoiwxqcbIMat1LIc7+xQR5uZqNB2sTwwjGbSGIB7H
   mDm1PG36L7cvB1TGVDjroWTP0dvkRVbrQsc6lFMybTMqzLyIwxeKhCkns
   g==;
X-CSE-ConnectionGUID: zqxWHG2mTlWRMJHqvtxJYw==
X-CSE-MsgGUID: fdGzqCOJQsuntoA8yVntbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89864821"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89864821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:26:23 -0700
X-CSE-ConnectionGUID: eOG9YZUpSASShcP7DFfpyQ==
X-CSE-MsgGUID: mG+04XrmSvKUypFGdFYFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275913927"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2026 04:26:22 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5LsB-0000000014N-2u3S;
	Sat, 12 Sep 2026 11:26:19 +0000
Date: Sat, 12 Sep 2026 13:25:29 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 3/3] kismet: WARNING:
 unmet direct dependencies detected for I2C_K1 when selected by
 MFD_SPACEMIT_P1
Message-ID: <202609121317.vn5aGfVa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   5f1f62fe597f49d26c02185b703da6b91bec3364
commit: 6fc5d415c10e98ac1b31dd1d5653443e691cdcff [3/3] mfd: simple-mfd-i2c: Add SpacemiT P1 support
config: i386-kismet-CONFIG_I2C_K1-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20260912/202609121317.vn5aGfVa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260912/202609121317.vn5aGfVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6fc5d415c10e ("mfd: simple-mfd-i2c: Add SpacemiT P1 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121317.vn5aGfVa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_K1 when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for I2C_K1
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
