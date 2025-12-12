Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599430FF1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533288; cv=none; b=MV1FZ7UW8ZitZviZxSG1wSz0E8xQ8e9Hr2Mcx1dJXoOaVwn0Th++vbEtSCoGRioy++YqHqEudOKa7/Y7CpJRXecK9WmLrL7xg4+0MbKRZSzEG6Pjw4PqFrkXt8ACYdxjf79VFTCRZzNzlY4H9mFyhsOnbPo1vCrKxdZph2h1G94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533288; c=relaxed/simple;
	bh=pQgCbfLYf6cPK/V7qoWtSM9lQQLqkgsO5JMmcs6CZIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6Yi2XMATJBWKCkXg4HVi1Gi9cXNnnqdO/RiHO/embuIp5OVo9L20a/nTzvW6aFgBS1hUndMm9OH7sw//SKBHsO6HcXZ0mGsotwtNMxVNqnJTrstszjXZKnqD5zVuRIQkzK6mLrnAObTb9bHBQxfDbhKE5ETi6Hzm5Nf6LNapwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLQ4sLYy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLQ4sLYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765533286; x=1797069286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQgCbfLYf6cPK/V7qoWtSM9lQQLqkgsO5JMmcs6CZIo=;
  b=XLQ4sLYySnhjBc9aOiWxBIEghFEk9+1Uu7ZLCU2lYSqZbTchWhFZM7aY
   ttMxMZQ1cd6EF91IrkiXsLu9v+9ERBtWwMPODLQd4o6G8JrFO4NDu2Qs+
   K4UarfPnmpmvcM554awk7vqNefCJO2tzySNZKmJCUv3yi1DTUSrLawsL6
   ENJ4jbD0hMs7lOA6ro9njUjM02Y6hhngLyuW6jQwsfN9slsKerbq6O7E+
   Vy4RQjv6QksH4Y1JR2O+M/W4Rr1A9xvf55pVQVhz7yUbIVyP6f2onSJIl
   BXKGw6R8kleEU1BNW16R4BnQqMEtzXFH1BgBjq/OIHDFG5PEfqe83IjvP
   A==;
X-CSE-ConnectionGUID: J2xPCz13RlWdKsR2hXc+eA==
X-CSE-MsgGUID: 3AAwqISEQmOrEJ06yOcEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67562338"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67562338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:54:45 -0800
X-CSE-ConnectionGUID: QG7zAQiiRgeYn4t9rRTzuw==
X-CSE-MsgGUID: Stkj4sjLR8CGLkx/8URIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197524696"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 01:54:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzrG-000000005tZ-1unp;
	Fri, 12 Dec 2025 09:54:42 +0000
Date: Fri, 12 Dec 2025 17:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512121729.z8dg7l83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: 6d3faafa89dee569bd8376840a2f60114538f2a8 [11/11] anolis: net: supports linkdata ethernet controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251212/202512121729.z8dg7l83-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121729.z8dg7l83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121729.z8dg7l83-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_cli.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ipsec.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxe_dcb_nl.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	#include "sxe.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
