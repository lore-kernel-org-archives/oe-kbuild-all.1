Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270082C60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 05:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247684; cv=none; b=ugtcwNmJHXWrJMc5aD+xgP5RRxlYAAkE6+Nx9kEGWLiRrJqwb5LLVXeWMJskdfPV3A7g0hp2Zch4je61tU25KTvJl/ioxGoIpdqUTHj1g8SdrPaersySDDdSLuPUeuXbZVWBM85hkJWjQl7mCTJkY97uJaRTWuiko17a32x/uxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247684; c=relaxed/simple;
	bh=q85RfmuiA0djQA3zxqFiB5JuphIfaIewS2gdlf5bqWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRqEtgCOTfwLER8GgKqL0HXYiOyftNHtUL0Wmi00I28DctPmMezmaFns/ZCjvBDxP1fY6gJ1ZMhZiuJXo+S5/kDTC63wtixxWaO1UZuje95MaYTONu8LXHw9WzrnojXTXbdREbU/F82oYMwrWmOYBaSYVtSWgKkGuoLX11VVMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moXzBH+m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moXzBH+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753247683; x=1784783683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q85RfmuiA0djQA3zxqFiB5JuphIfaIewS2gdlf5bqWE=;
  b=moXzBH+m98Oj5sM0xMJ1wVhcgdPlHIx0Fk1P6Mg/ECnVkQdNYFxZyzW1
   WLvzqnuqqxHsyjUkBES+3GAw+KbTz46DBx/WJal4zkcnwzE0JaxStB92j
   NXTxa//nWGXqWHGC2L3m9wrSIMOP7+7X/IneFZq0jp4m9xOswunPUPLKI
   yM/11sgYzOXd/CoutB1TIv6avzodmk490OInKVot0AeO4VoLp0NfNJF1z
   dlqQxHzyx0WDtJ6oBJ1rnRCsUfdEEfWN23BeqiGnwkR4sCZisDsWwA1fQ
   GYozvY8e3JVba7qkJKpOakV0diFT1caAiBBRulqFOf2YZV7OuxOqw5sjw
   g==;
X-CSE-ConnectionGUID: FjVwUpSRRTuF94/gu7FSHg==
X-CSE-MsgGUID: djekig/mTMKXrnL/LHqSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66086775"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66086775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:14:43 -0700
X-CSE-ConnectionGUID: DxSUc74gSgSNMSmxPPli9w==
X-CSE-MsgGUID: Uk2Tu0PTQv2Nw+8xS1hIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159895391"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jul 2025 22:14:41 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueRoN-000Izx-1S;
	Wed, 23 Jul 2025 05:14:39 +0000
Date: Wed, 23 Jul 2025 13:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC mt76 v2 3/4] wifi: mt76: Introduce the NPU generic layer
Message-ID: <202507231259.selew941-lkp@intel.com>
References: <112fcef21bf490a2fa2c58ab1e4822756fe3c601.1753173330.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112fcef21bf490a2fa2c58ab1e4822756fe3c601.1753173330.git.lorenzo@kernel.org>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.16-rc7 next-20250723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/wifi-mt76-Move-Q_READ-Q_WRITE-definitions-in-dma-h/20250722-165253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/112fcef21bf490a2fa2c58ab1e4822756fe3c601.1753173330.git.lorenzo%40kernel.org
patch subject: [RFC mt76 v2 3/4] wifi: mt76: Introduce the NPU generic layer
config: x86_64-buildonly-randconfig-006-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231259.selew941-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231259.selew941-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231259.selew941-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt76x2/../mt76x02.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt76x2/mt76x2.h:23,
                    from drivers/net/wireless/mediatek/mt76/mt76x2/init.c:7:
>> drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:17:10: fatal error: linux/soc/airoha/airoha_offload.h: No such file or directory
      17 | #include <linux/soc/airoha/airoha_offload.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7615/../mt76_connac_mcu.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h:11,
                    from drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:9:
>> drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:17:10: fatal error: linux/soc/airoha/airoha_offload.h: No such file or directory
      17 | #include <linux/soc/airoha/airoha_offload.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h

     8	
     9	#include <linux/kernel.h>
    10	#include <linux/io.h>
    11	#include <linux/spinlock.h>
    12	#include <linux/skbuff.h>
    13	#include <linux/leds.h>
    14	#include <linux/usb.h>
    15	#include <linux/average.h>
    16	#include <linux/soc/mediatek/mtk_wed.h>
  > 17	#include <linux/soc/airoha/airoha_offload.h>
    18	#include <net/mac80211.h>
    19	#include <net/page_pool/helpers.h>
    20	#include "util.h"
    21	#include "testmode.h"
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
