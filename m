Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79423FB02
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709565141; cv=none; b=WR0YVu/cToqdEGsOsUfhL3FpS8AAAu8D4Kw8ScGXGF0i30wq8+54lNDC+2s3hWI0+AqhwuEweMnXv7IMe/CXXF6iFlOUG0ZsyZAz2cboIdAf8vGt8k9mYUL2t32G7WKGApN4aROop0vvNjgnBesicrJa9PpdB6YU8ZXN02zK9Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709565141; c=relaxed/simple;
	bh=VmDiYuLk+ok8H++c1/abMIu96u78WhTmkz+1ym/XKdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNJdoy5c1jNwA7hrx1gtOrqoDOhh/ow9VljfnRQ1HGqRXpK7dyy/uIfo724+mPsSpDsEWDVYUe5X+MSGxWqzup+MO/oWRBhc/VF09vECTRwdDz55bXKdw9YCN4Kv8wKJI12Cz1zlQ502v7ANuyoofoMj12uZTqNVb3YeeoAYTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It1yydd0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It1yydd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709565140; x=1741101140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmDiYuLk+ok8H++c1/abMIu96u78WhTmkz+1ym/XKdY=;
  b=It1yydd0tjgwRAFTxDb6fvfT+et1Pwy9RnQiPN7Nl/mDlHAuO1A6IwC8
   DuE+LVEZFJ0vI2G62c1dTgaQzVcR3ytA2mENIZV4HA94oet03WtD7dHSp
   PGK1G4tllSfhnd3Ve3PNEANxJkC5KWKWnAJlgF2aFKob+PhNiKu7N1R+Z
   IpptZ88BuKGo86xec7uGGkNGY+s1ngb6CMpdmJNYs8zG/ZJE+TkEtpQwg
   UXZqI3e7cg/cHAoHN2oz1X0l/1IpZrdkZq4sTyOBTNCsGJcp1W8VYBX7T
   6DMaNjzr+dyidJvPZmG/PO99NMdcMnounotqPIswTwrX5OG1uo8WBs0FP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3916521"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3916521"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 07:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8971886"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2024 07:12:11 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rh9z7-0002ZB-0P;
	Mon, 04 Mar 2024 15:12:09 +0000
Date: Mon, 4 Mar 2024 23:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/tkernel/ttools/ttools_module.c:18:10: fatal error:
 asm/sync_core.h: No such file or directory
Message-ID: <202403042330.7790vS0Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: cbb60ee511380ef1ad4afd2a9f4bdabea19a8df9 x86/cpu: Relocate sync_core() to sync_core.h
date:   9 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240304/202403042330.7790vS0Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403042330.7790vS0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403042330.7790vS0Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/tkernel/ttools/ttools_module.c:18:10: fatal error: asm/sync_core.h: No such file or directory
      18 | #include <asm/sync_core.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 kernel/tkernel/ttools/ttools_module.c

  > 18	#include <asm/sync_core.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
