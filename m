Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF035145B25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 23:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748301597; cv=none; b=QGcgg55Q2den2xL9p6+wnU477RcnS+7iKbMPhmwH3lIkW/goBzx4Q5PrO7i4/8m3hTvuizyXpkAIe581pLyy6fnvsZdSQGdXoJ4MHVHKjmQ0ZuaGkQ3k02iWwYH3tIZPrI3nE0POPN0zrI9tPaYyaXoLqfLlZOV5ydIQwo5nEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748301597; c=relaxed/simple;
	bh=OK5Hm5sBBRXM6th202eiTVUUVKEb60IJNquK8yuj7gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZIPTBXGhidgCx4wmm+Xb5dkYDWy5L+nnow8h7Hmu2eQYcviHcXOco/w5dqToqc3/rqTe7SOS3pc2OKpnQKDS/P6lIBbz74TUCy2uJ6zZKba5uMKr8addqNZ+olZFVbKNANY1vK5psCERlfqN8Q7ulB9YFWVlNdZaLxBoNgNZijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EabfL67u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EabfL67u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748301595; x=1779837595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OK5Hm5sBBRXM6th202eiTVUUVKEb60IJNquK8yuj7gg=;
  b=EabfL67uOD6Y4glas2cY/T3ZFQeC/6bV/GvNCN342zMCTwGOLgsn3OJG
   fMzyp4OWGHPnlz0tRjtiXZ98u2fXqYM+luv5MxoDXmqYAaM+okb0Pc0JC
   LcRVJ/WGqEJFXzXZa2gJVjA1tijtu0dERTrtkWWNTboyrC3PIwWqf/a12
   cJa9ygDog18PX0ikYms3e/NVoqdYOHr1Wef5ip7xPBIQdv8I8RgYgxeLN
   wHe9QiEQ7xnBDfuY7Ndqawn+BqADVJJbafF5NCX+AIYSCE/5bCI8nKRRv
   9wlMcSvPm9PxHNzgXMMi1Gh543A/bT3mmHuFPRAucxZ8JRBoIAyslU5kX
   A==;
X-CSE-ConnectionGUID: wMQKo3vhSO+hh1mNDIUJ4A==
X-CSE-MsgGUID: i1W6ik8MQX2nThBMqlME/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60906983"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="60906983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 16:19:54 -0700
X-CSE-ConnectionGUID: RLcm1BU2R7a4Hl1PYmmgdg==
X-CSE-MsgGUID: Id48GNU6QjihNC/56kOD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="142550546"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 May 2025 16:19:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJh6l-000SkK-0w;
	Mon, 26 May 2025 23:19:51 +0000
Date: Tue, 27 May 2025 07:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 104/104]
 arch/arm64/boot/dts/mediatek/mt8196.dtsi:7:10: fatal error:
 'dt-bindings/clock/mmdvfs-clk.h' file not found
Message-ID: <202505270753.F7I7aVZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: a44ecdcc67718b1e8736d6e99b3ae554df5a944b [104/104] CHROMIUM: arm64: dts: mediatek: mt8196: add mmdvfs node
config: arm64-randconfig-003-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270753.F7I7aVZL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270753.F7I7aVZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270753.F7I7aVZL-lkp@intel.com/

Note: the chrome-os/chromeos-6.6 HEAD 00e2b7e08c550ff321daba7b9956795d281bdd98 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dts:7:
   In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:7:
   In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:6:
>> arch/arm64/boot/dts/mediatek/mt8196.dtsi:7:10: fatal error: 'dt-bindings/clock/mmdvfs-clk.h' file not found
   #include <dt-bindings/clock/mmdvfs-clk.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dts:7:
>> In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia.dtsi:7:
>> In file included from arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:6:
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:7:10: fatal error: 'dt-bindings/clock/mmdvfs-clk.h' file not found
   #include <dt-bindings/clock/mmdvfs-clk.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

vim +7 arch/arm64/boot/dts/mediatek/mt8196.dtsi

   > 7	#include <dt-bindings/clock/mmdvfs-clk.h>
     8	#include <dt-bindings/clock/mt8196-clk.h>
     9	#include <dt-bindings/interconnect/mtk,emi.h>
    10	#include <dt-bindings/interrupt-controller/arm-gic.h>
    11	#include <dt-bindings/interrupt-controller/irq.h>
    12	#include <dt-bindings/mailbox/mediatek,mt8196-gce.h>
    13	#include <dt-bindings/memory/mtk-smi-user.h>
    14	#include <dt-bindings/memory/mt8196-larb-port.h>
    15	#include <dt-bindings/phy/phy.h>
    16	#include <dt-bindings/pinctrl/mt8196-pinfunc.h>
    17	#include <dt-bindings/power/mt8196-power.h>
    18	#include <dt-bindings/reset/ti-syscon.h>
    19	#include <dt-bindings/spmi/spmi.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
