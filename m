Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA725EF9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022623; cv=none; b=kzTPVssrYZZeFCHJgest95ovpWan6K04XJ+3jJiTQYh5g72m16dc0euSDIpwil325HQblLyJ5Cb9cD6ajHbNX0SDKCx0k+so8puANJa38J7xsCAM3ZJnXhxgvP79CZ4gNEII3LLCu4IO7OSj7qsPvuGqTB5s3GUsKWeWCuSbX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022623; c=relaxed/simple;
	bh=9S2EOs4pGnyWfM4KXQ1zPO3RCkiIuBinEGAWanatW9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X0quAnVfChjl1iazU1jvf7AW8/eRFaTv6Dn6bPAK1MnEzjbOX1yoRxWC+mJ0RK1GEyNwGZa8YJC7tGZrdnaoeuWFMSXwDKf972oE+pacT1LVjMGDhUilaOXOQKt7DbyCSI5fRHXYE58/hJ1j4FNRfXspvBMEdqdIlsgsbtlwxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1EnYMen; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1EnYMen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746022621; x=1777558621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9S2EOs4pGnyWfM4KXQ1zPO3RCkiIuBinEGAWanatW9U=;
  b=M1EnYMenEAhAp0D2oKs6lOR6rgC9mC8VHMq3bqmzgSPDX40xCLNJ5MPG
   Gs30Lx4GzCAczYzj2iPUpDLApYp5nakHIgNKRIeB9J+VC44Maw4uI6y+l
   TRSZICZwxnvu9aHznIVeZnkigrHDtQ95yNA3zmVn7O/hc78AGcwM3raS0
   ABCHBVOTpEXZckEOwLN/oZYnvHGpaMUboPYSN87qCZ34OxbNI8zOgb0lP
   a+ja9qG62kt4i3fwJsAZK0gj6QkDCpGW02fRptL1XUcK/kpkxxAmzF+Me
   Ki0WfW55UJ/dEpo7qVGnpGCMe7IVomCpFVZau77BEmuMNTpYEt/nCek/o
   Q==;
X-CSE-ConnectionGUID: XZ8ulz/xSuqGiyQaviERpA==
X-CSE-MsgGUID: uruaXFlwQjyPV11/V3JS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47696741"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47696741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:17:00 -0700
X-CSE-ConnectionGUID: lprOIe43TJWJ0heYTL8gYA==
X-CSE-MsgGUID: UafkIpCAQDCMPG1akaEKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134077106"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 07:16:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA8F6-0003WB-2d;
	Wed, 30 Apr 2025 14:16:56 +0000
Date: Wed, 30 Apr 2025 22:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2880/2880]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf.h: sxe_errno.h is included
 more than once.
Message-ID: <202504302232.oeU1VyOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2880/2880] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504302232.oeU1VyOU-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf.h: sxe_errno.h is included more than once.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c: sxevf_hw.h is included more than once.
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_hw.c: sxevf.h is included more than once.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_netdev.c: sxe_netdev.h is included more than once.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_sriov.c: sxe_ipsec.h is included more than once.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c: linux/moduleparam.h is included more than once.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_netdev.c: sxevf_hw.h is included more than once.

vim +25 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf.h

    18	
    19	#include "sxe_log.h"
    20	#include "sxevf_hw.h"
    21	#include "sxevf_ring.h"
    22	#include "sxevf_irq.h"
    23	#include "sxevf_monitor.h"
    24	#include "sxevf_ipsec.h"
  > 25	#include "sxe_errno.h"
    26	#include "sxe_compat.h"
  > 27	#include "sxe_errno.h"
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
