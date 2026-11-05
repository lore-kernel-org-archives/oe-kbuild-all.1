Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848880;
	b=20bIGd5M1vQc2Fccpkn84veGZRDRp5i8+ID2o3jUaU9UiQZ3T2lhp7MbSlrsUYdJ53Sv
	 f+/9D1CVmikve6oGgFizQEY4pLKnGJLSQWUacQc1nr5nXog8p91oGVsb1PNkYtMTAEnj6
	 yVnxhGYivzaquEYFXhMxGAo2Al+1U+7axpLyhUBImL1xHVc0Z4wSukUU6ZcMK33y5Zk4G
	 iI0zjBRpbzmYWOpEgsDvObo0UjbUuPR+JHyGrf/Nhw68B3bwm8D3vg4keuGWUXg/iVfRW
	 fnazhNLgQSHJd14HkEUQfRnQr0wE8DGvA21z+UEKCgC5XltK88G4urTmjF/HR4LKGbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848880;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vKJcU7/pSPFAtGqdSP+Lh0xEIrSyqEF3Cva8SET43/8=;
	b=c06EeobAkDFH97q1xJC0/30JexlQcqRPI9VGaKVAppS9B57i9IDuUmQY7EKCUKUdjdDT
	 9khuPkzPGkCviIij7GDH+mWT7H0GQ79/nvWHM6uq31akEAemx/GSUm09mS4Bq2C8zGdKq
	 S2RxwTd8VCmyR1y087HxKu5TKfBOwrCL85tI8zo3T86L3VcTMREjaQ5ssOggZRf6wQf85
	 6pRxD186nd1yhJTR//1wQ3Fr8TDCQhUWzonSLTJPY1A0WyaUvK5tfjMuMZgqHK0b0RqGC
	 RtKZLUwA5I7hC6CU7jBAyMacHpSfcPk0sDhaZ8cGwAjtLA8WcOUHx8FtnPeZQq/vwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BTYP1a5K;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168C606A32C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 03:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2168C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BTYP1a5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848879; x=1825384879;
  h=date:from:to:cc:subject:message-id;
  bh=UyLQMu81lo5RQjNvFdKqqQYAq4NhDPnVWlYcjWLkrXo=;
  b=BTYP1a5KhE1tbrUA9qcDtG5bkajubJpt5dw8UxIMv8X9InIWLPLTa45U
   2kype1ffxtUWUOKslGh8bieVQxY8CVrpen/RfDHuWo7QfiNpDtE8NchmU
   y9YUVkNyerREyGjpltzaIsiU/eCtVvh3dzN6HdOwFwjkF1BA5IcI57RA1
   826+QFIFpNAn6bPCl7Gm8qh77BGmQW/xyfKfUxy8rwQKErOuweXFtK+Z0
   HzxBriTGrU7vbzyTjbBCJfz/AaXCmx8vTRCgysIWaf40D1+BP6eRk0CLX
   qrVIiDGKvRaXZOGb6DiujZgDcPym2y0zibSGvuB/e2X6ijMhb76i813N8
   A==;
X-CSE-ConnectionGUID: wOfF5uB7TqCll1H4EJxsPg==
X-CSE-MsgGUID: bZ9Tz76DTw2q3QxFw3J0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2617922"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2617922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:21:18 -0800
X-CSE-ConnectionGUID: 0+LE+QEnTAefPfa55TpWdw==
X-CSE-MsgGUID: +hpTM/rVRLiXXt4kSqt7dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7236302"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2026 19:21:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOo2M-000000009Th-0Dr7;
	Thu, 05 Nov 2026 03:21:14 +0000
Date: Thu, 05 Nov 2026 04:20:52 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-nvhe-s1pie 2/2]
 arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: arm64/pgtable-hwdef.h:
 No such file or directory
Message-ID: <202611050404.8PUrQymb-lkp@intel.com>
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
config: s390-randconfig-r2307-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050404.8PUrQymb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050404.8PUrQymb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050404.8PUrQymb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/arm64/kvm_emulate.h:11,
                    from arch/s390/kvm/arm64/mmu.c:4:
>> arch/arm64/include/asm/kvm_arm.h:15:10: fatal error: arm64/pgtable-hwdef.h: No such file or directory
    #include <asm/pgtable-hwdef.h>
             ^~~~~~~~~~~~~~~~~~~~~  
   compilation terminated.


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
