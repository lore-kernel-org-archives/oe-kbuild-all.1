Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848879;
	b=Pjl88iC68iiS3yDrJiCx33YHQ/551PrCGR0meWOeE9ZLak4KYyDmVpPHi+3Syd3xlRQi
	 0mgHSq3AJILmzmIgXhXKe0fkf8DH4MSpsBI1YExQqtGpTEn7KXPeCzKS1/gsrUVTi9yMw
	 ikmVu7WXRxjhTF1OwMZUI8rZpYaHdkct7xSBwVVf/jXzkH6wIACz8PFU9DqvMjsHeO9H2
	 MvE0/GT55pkcHi4vcH57ZGB5YVoWf1yV9A9Ui9fvVkJyJ/PfBPleohniui0YhCKnYHk/1
	 F2yBKkVPhnG1jw1Qc7uX5wOlFowt6UhMY7J4lxdPTJJgvZSebXRALe2cSicn6qTDnWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848879;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7bS2sITx+gPQbd7EG3mp8vWDdBTuhKMdolGNRuLdmos=;
	b=W5r0QWwripcowPv9OGzs9FtJl88C7CU9iQ39IKzyFmVlU+HttHlh7QGx7Mm4cVm+fwUR
	 QDh+/QiuFwsyfiZIpmUNu+rYE18P8YWQpFrprIWXy0LCBofxjOJjtjF6Njd8bvwHXS/dA
	 KFBvyw1mDih1qvdK2EYi3tqie0WvzC/JSTm7WECjYUlcSzBsRmQv0hIvf1MtgBV/agiS2
	 yqNueIl0Fvjc27jZk8HoJ9K+whgfSjOgZ8PuStM4ZJmi5i3VdKP9voVWqSprqW9aoIrKj
	 3S3X5pHQmll6O99cJ+LFF9Qd5rHkfT5vrGhsSP21RFfjKwr6AJqe7ScMVKvtrfMUzQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BaSmhBKC;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCF606A329
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 03:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FCF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BaSmhBKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848879; x=1825384879;
  h=date:from:to:cc:subject:message-id;
  bh=IK0HnY2vu6zEnP1jKPxlOljCXq7bhsD3uGNXrYg7GV0=;
  b=BaSmhBKC6oRr/VCXy+pvfgH77JFx1D0G9aUl/eDXe3LzWBphxpIpLwvR
   Pe6HOrcpwPLH1we5AYT6ZGWAc2rKn/wanjpDbju1J+2dtpspGrePvgQ7m
   JUg1tvk+wE5shza/mlOk0PddatnAq4XWE6Ugt0mdjc37HqWHa964GWUMo
   y80QdX3yntqj+c9cy1XHyV2UX4e1RljfVtRbpmNfbeukjKkOUz1lDmP1M
   DqMPclgEAOjzuiaCGtvvybis+AtQ2FyrBr2fMLJWwhvAL3ANPBy7gO3zX
   zLXPLgl+UL+cXCC+VsjWK+h8dm7Ehh+tXG9XzLfQDuwch9w/Vf+zEEmfH
   Q==;
X-CSE-ConnectionGUID: S4aKxFC9TCmC1nXD8KI/ZQ==
X-CSE-MsgGUID: 0DI8IP2NSQawvmwjuIcfdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2630477"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2630477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:21:18 -0800
X-CSE-ConnectionGUID: 1Hw/IvRIRw21VuQTG2XbSw==
X-CSE-MsgGUID: hWIDk1T+Ream2tbpc+gBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7296690"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2026 19:21:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOo2M-000000009Tj-0R5e;
	Thu, 05 Nov 2026 03:21:14 +0000
Date: Thu, 05 Nov 2026 04:20:53 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-nvhe-s1pie 2/2]
 arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: 'arm64/pgtable-hwdef.h'
 file not found
Message-ID: <202611050413.Lw4Ikcg5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-nvhe-s1pie
head:   321d8d9bb036f451a784d12db6eea0c1ed701194
commit: 321d8d9bb036f451a784d12db6eea0c1ed701194 [2/2] KVM: arm64: Enable S1PIE for hVHE
config: s390-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050413.Lw4Ikcg5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050413.Lw4Ikcg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050413.Lw4Ikcg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/arm64/mmu.c:4:
   In file included from arch/s390/include/arm64/kvm_emulate.h:11:
>> arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: 'arm64/pgtable-hwdef.h' file not found
      15 | #include <arm64/pgtable-hwdef.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 arch/arm64/include/asm/kvm_arm.h

    10	
    11	#include <linux/const.h>
    12	#include <linux/bits.h>
    13	#include <linux/types.h>
    14	#include <asm/esr.h>
  > 15	#include <asm/pgtable-hwdef.h>
    16	#include <asm/sysreg.h>
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
