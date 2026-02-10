Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C333D4E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712176; cv=none; b=Jf5m1rInF4DyY4YBQBAhCvqR0lHBVfunCn/FkAhpsPfCVBwCh1Rf6noBltKkKNuVqa99Gc0krbh8Czc3JRxnu78mTtRuYUc9DycDSAevxup9SC/uoSL56QDpzspDVYW5O69/zvhkoAoHSK19G/FNeKF8uChuATtFhQtfaiR/IHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712176; c=relaxed/simple;
	bh=1btXaCth1OE2AmY8/hMhZiaKwyS7lIBjPaRpdFEXmas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZdeAUqeJ89KlumcH35XmY1/zcxNzxZdkJXkI0kvDVvep2cgBfL+kRE9+Btz/VCO9r3pkQDhtNuXcFebVl0hk+lcRb2UZ3jwXmUHtVkGmfycuMkOZQmHT4O3TtkXIHxjDYoGj2ytlVbUfdqIqkYXy3A3cRb7m4Tv1NoWTXveq9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMIKr84S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMIKr84S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770712175; x=1802248175;
  h=date:from:to:cc:subject:message-id;
  bh=1btXaCth1OE2AmY8/hMhZiaKwyS7lIBjPaRpdFEXmas=;
  b=TMIKr84S4xpUh9DsACrWNMhCQTonptdj54hAVk63b6hJQo2e0sopKTmq
   Qh+Zg5N2Mj80wzqFOjLd7xoKvp/OoWodg/jfz4o+zBZzt2K18Bh3BLnRz
   HVGQHRxm3fSa7/fSt1SE+/ry0tOWE4fEbZF1q8wX5QjWIiTGUqUe2HTaO
   z7X0/n8HDTtARV3Cv3vu3QB4lYwBq290ycJmYeEtEy1Id4gJEld0+14Gs
   FlQJVhl8CtwATxDN2Rx5ZOFmsn+8v3DX3/Ff1/ZNmagzqOnJ/1BJvUlBo
   qzSkkTR7C55t/mPlXP8/9iWDROY/pnoE+yv4r4X1WF8OtQt9XVdfq/geN
   w==;
X-CSE-ConnectionGUID: e7kpMheZQdWy6p3Xh8JRSw==
X-CSE-MsgGUID: zYmw3JgwRiugX3vSyLkC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82157419"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82157419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:29:33 -0800
X-CSE-ConnectionGUID: I42EezecTI6wWZ0gLjWfqw==
X-CSE-MsgGUID: omhd2Ji0RhGUmCe8s7l2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211380530"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 00:29:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpj7g-00000000ooi-1z8L;
	Tue, 10 Feb 2026 08:29:28 +0000
Date: Tue, 10 Feb 2026 16:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 5/16] error:
 include/uapi/linux/container.h: missing "WITH Linux-syscall-note" for
 SPDX-License-Identifier
Message-ID: <202602101647.7r91a0N0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   f62d2a134716e021cfca8d7860048f9c71bd53c4
commit: 3f76c2a24020e9099737233f81d0444a6a0c5b1c [5/16] containers: Introduce a container type
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101647.7r91a0N0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101647.7r91a0N0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101647.7r91a0N0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/container.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/container.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1412: headers] Error 2
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
