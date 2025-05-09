Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3A2CA6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 04:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746764846; cv=none; b=rnI2ceRoGxFVBZ0waqW2ZneZdG170NHT8uMbIdtgNQIXF44O6wCkulTOc9Ozho0gGfUrobR/YB08kPZTtgTF8v0Mu92RGcMz9mp8loeBn6cmGogpxJafmDCcgQacmjTQHL0HtKMFN4fiar5rVc0Q47aIr2Ho05dJB0kYZczU7Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746764846; c=relaxed/simple;
	bh=fBnd89C5T1VZmp93hiNHBo9P4htn3ELCYwHdtnTB3Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BN2om3arZG+6MrO6pOmvNOJrXNFtj0svbhVGWaLo50nDMkmQQzugu5Zrw8Mzp+LUWfdAgXJnekP9RadezE+cv4TArVCuJvWhoTOmX2jn6o/IfHLqkXkEfLIHw2LgYtcTh7HNPOHSEPzoVw2QSzobEeDCS8QKVpcY3lj4OcXv8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9xhfrSz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9xhfrSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746764844; x=1778300844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBnd89C5T1VZmp93hiNHBo9P4htn3ELCYwHdtnTB3Dg=;
  b=h9xhfrSzNf9ZY46QyQjHWAUkZ/AW932oAF5Hsfqh53Kl8ArxPFQW3XNf
   qXlaoSUD9CO+dsnTsHuw3dYpAvxfUWbOl7vmtK33AuAZ6l1YW5HZE5G78
   yZNSVlUJ5QYlBBZhZ1QHckLgVrnYMjTkJVHI8P7XYg6uu4qgir6eyZz0T
   ipT9Dgw6g59RYMmKqe1NRtY7Qr/n4F9bzaBTLHkWD6moeogR8fczPVMqB
   sI7iNiyn1o0Mf+kg2qiCy9381iwh/zKRjA1uNzWuqSGjmhxilrhiESSio
   Vm4wdb6PVMn0awbn/DrhUsFPqLIPtDpeY1NvyvMI00hnOkCX6HorMilsq
   w==;
X-CSE-ConnectionGUID: aPoaXBY/RG6yIFpx0lLWFg==
X-CSE-MsgGUID: Di01thwYSI2uKLmlMTjd5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71094174"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="71094174"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 21:27:24 -0700
X-CSE-ConnectionGUID: lOb1cDE4TYKCfh33D9fU6w==
X-CSE-MsgGUID: 6rWHVAHjRBK/nkQ+OjhmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136891987"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 May 2025 21:27:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDFKS-000Bf5-2P;
	Fri, 09 May 2025 04:27:20 +0000
Date: Fri, 9 May 2025 12:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 94/94]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10:
 fatal error: 'nbl_resource.h' file not found
Message-ID: <202505091239.5N3LPFw7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3e44eae7361a463faa2cab260363678a02c089f5
commit: 7a025ab026a1cbd5622c8b14875b9e990db7a2b3 [94/94] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505091239.5N3LPFw7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091239.5N3LPFw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091239.5N3LPFw7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: 'nbl_resource.h' file not found
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: 'nbl_resource.h' file not found
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: 'nbl_resource.h' file not found
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


vim +9 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h

   > 9	#include "nbl_resource.h"
    10	#include "nbl_core.h"
    11	#include "nbl_hw.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
