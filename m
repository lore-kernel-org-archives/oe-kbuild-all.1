Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE91862
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720141047; cv=none; b=UpwnVcc71EvQM7b40CHwK/tvGZpTVag0SkQIQaBT+3I3jbjFnQRgK1zcR0SkxKOZXnXJcpWBuJ22W1VMd9fxuutZMGFqPX00UvqxPC8oCwQtL4k22fzmmHFYG81dQXSD9CNjkFGndMNLZ7wuy8bc5+VbEv9Dr54HQJqFJhXQVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720141047; c=relaxed/simple;
	bh=v9xemPO9fXmbFoXN3BL2XyzVESHyJcT618CbrlLCN8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NX9U+rN1oXv2KvKBYzNg7ekv+l6WkagIzqmSbBJxCPF8to5J6EoX549puv8pHjfWjbCrcHHsbSnCcjxjjeprFWkfv2TfWnQwdqOfj/MD2fRIrFaKtNJDylep8m5TyaSag7S1AuOF5VbR5cb5JcJYMxlF/0ymXeYkbtgA7nGjrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfuRGPyK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfuRGPyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720141044; x=1751677044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v9xemPO9fXmbFoXN3BL2XyzVESHyJcT618CbrlLCN8w=;
  b=BfuRGPyK+bgsFfuGtj0cWGhBBixGsZ1/JRquiliKWDVKRS7XGhXqu4vj
   2zh8gxI/m5hi9I2ySjM5kKfSVCyaEte5gS/sZtNkGh1M4wZhHM96yVvhG
   7lYgHzi/iK/myGpWmgTyWrQc2mbTi00KYbNVosbhSZaj+i9iE977QqXdo
   rqRpVZJy1WQat1a+5u3DH+ByeIqrQy/I1k0/QDLIumqkAeGKxoVStNzfG
   5Wr52cEn1QGfy02X1V+FSt5bJEG1nElrXb9F9jIIui4b9Vem9npaX7zyc
   VDdUY+7jZ1q+tl1zimDM2TSitrJWVHzNPfUP5xjxweYxadSG4rHu2iGK9
   A==;
X-CSE-ConnectionGUID: pLShbpJ6Su2ZFBiKEvmFRg==
X-CSE-MsgGUID: LUbxrGYtThqq9gTB/MkqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17558162"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17558162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 17:57:23 -0700
X-CSE-ConnectionGUID: nJYUzb7yQRqOgFRxor0RlQ==
X-CSE-MsgGUID: SBq8Y2wNQ0uACJNfgYMzng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46689332"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2024 17:57:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPXGK-000Rj2-31;
	Fri, 05 Jul 2024 00:57:20 +0000
Date: Fri, 5 Jul 2024 08:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13648/15088]
 drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error:
 'linux/hsr_main.h' file not found
Message-ID: <202407050830.6eGqTHUZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: c63f309bddd4b2e77469531d5a54eeb30cefbe18 [13648/15088] CHROMIUM: iwl7000: mvm: work around HSR stack skb handling issue
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240705/202407050830.6eGqTHUZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050830.6eGqTHUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050830.6eGqTHUZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c:10:10: fatal error: 'linux/hsr_main.h' file not found
      10 | #include <linux/hsr_main.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +10 drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c

  > 10	#include <linux/hsr_main.h>
    11	#endif
    12	#include "iwl-trans.h"
    13	#include "mvm.h"
    14	#include "fw-api.h"
    15	#include "time-sync.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
