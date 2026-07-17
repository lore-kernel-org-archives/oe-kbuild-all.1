Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94510388377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289576; cv=none; b=jB6vM95FCjc5/Gi3ECIeM7mh7WI7WlCES7TV5yBJwH+j+LzI/2eM0bcvepZqqfsTJIhdpDFAL+B2K4QvRUjkUQrpDw4jcOAVs/xe4uIwfBrt5ZouSrdR9R4VUbI25ep2jRbeTQmHefn+wObn1+LTbuCKGQrHezt910oCoO6kJWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289576; c=relaxed/simple;
	bh=vkO0D25BuurESSmBL1OBlM2Bqw3lVmgCTjK/1DH94D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fq1BhSR3jG1W4gQkvEazWCMs+GJGiPMvvZfGnIwkavAaqzXbr5M2cQEhDoad5s1GilDHeE808Q7o2Mn+6x/zihrQRAq8CoAQsYAlLZApltSNzrjWllPegv1GtVx8ihdAXZY1JI50NFCBG58TrbMCK29z7CM2wLx9qjWeo5pRa2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgSziyTl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgSziyTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784289575; x=1815825575;
  h=date:from:to:cc:subject:message-id;
  bh=vkO0D25BuurESSmBL1OBlM2Bqw3lVmgCTjK/1DH94D8=;
  b=XgSziyTlWKNiCSwUNmRZ+7T3pP+2NPaVW4nW6VnbXqOOZXof0uVEtX/0
   DWXlz/x0nh0lW363E8FYjh04XwLGvHKUVy6WnrJOHaDAFuAvrlK9VARuX
   pzCmltlSObY9vXitGUZgqTG+tRCmufm6RhzCNdG7rX9ZPjVNroexST5+o
   fQuGpPPDJgv/qxmClQCTmhykdIDzALP04VQT7oWzFN5N5E0a0NPskpeX8
   j1tjsQB6XjPesa14h9edQ7XDYhFtZlQXipXzzlpPXvgJh0jXMW2vkzIyP
   NoIiQPE000sAmNTlvpDOzRWiajUpFN7dCtVLaTqZARJjFehrhyInRHkD6
   g==;
X-CSE-ConnectionGUID: 2/etT4DCSQemZdMWLckRNw==
X-CSE-MsgGUID: xyJWAZHdSm6FqRLL58geig==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85158196"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="85158196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:59:35 -0700
X-CSE-ConnectionGUID: coG0HLpBQ3CeLe0URI/4ow==
X-CSE-MsgGUID: byVKbEqTQqmtCThpVHmjIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258759722"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jul 2026 04:59:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkhE3-00000000SiG-0Jo8;
	Fri, 17 Jul 2026 11:59:31 +0000
Date: Fri, 17 Jul 2026 19:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
Subject: [srini-nvmem:for-next 28/34]
 drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h: No such
 file or directory
Message-ID: <202607171922.uQxiA3uv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   2a3ed29b053137a91af7963038d437657065e57e
commit: b3c090960d86901bd4e41447744fd532d6e1d7f9 [28/34] nvmem: add mt6323 PMIC EFUSE driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607171922.uQxiA3uv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171922.uQxiA3uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171922.uQxiA3uv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h: No such file or directory
       6 | #include <linux/device-id/of.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +6 drivers/nvmem/mt6323-efuse.c

   > 6	#include <linux/device-id/of.h>
     7	#include <linux/err.h>
     8	#include <linux/module.h>
     9	#include <linux/nvmem-provider.h>
    10	#include <linux/platform_device.h>
    11	#include <linux/regmap.h>
    12	#include <linux/types.h>
    13	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
