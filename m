Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373765;
	b=nnNp12RKrUENZRye1/OGUC305E/szEZQsEODAzvK+k+nxqwDcbaMPkBsmOavo43JU4jO
	 9wFEtGJbeY4yCQD9MbbY6alfJHsyCgJ1BsmTaHZ1K/9vuixAYcLypFfuEs37LO5iSmpcs
	 zjAovL3lq6fYBfxmutEgxaEjAgjH2hxfCNddiO411SvB1FFZ/1SV6HC5KG4S/Csb5CwXn
	 UDjkedwrHhzQIuu7cIRUocWbAfraLNtRy6oTl6aarWiUDC1hk/29q/axTjbnJzKKTm0bj
	 M6zIw9/g+heTHtHFxgI9AvLuS9KLlij08VWWe17yN71Vv1GjaL3ZIWxPYrLEEzMLLjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373765;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OyUcyaK9EpFJmj/FAXl7LIfeIa5zdxVhzXJFDa0pkXA=;
	b=yMbaocqRwHTWR7sX+nAYbUfdJsNOgWPBgVUJhK6qOGYVeIOM7ZxyIN1WQrxsBdvxPco3
	 xJcMfiakGuhMPhtblj83FPe3W+PiJcd68++gxCOVFnnZtfOjcV89vK5ZcMgPCpUKwueFo
	 bAxjnyZcXm3MzQhcwZVE0/kYcGKMTti1WPWgshWJIstr3cmVm88sGwGfdBT8O9Kr8SSFQ
	 wp6oFFve09ZHWhEwodzrdPXQg/HdynuMwaDCZofMe+oywWOnaBA4EgFdqg3MVSwAj132r
	 aEF8pjxgqSrwEctGMPNUXVQ+1YSExnSlNnQol9yJaUon7P0ICGIpIq5mOLmxSXbnbTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KmbhOz5V;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB0606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 18:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EB0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KmbhOz5V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795373765; x=1826909765;
  h=date:from:to:cc:subject:message-id;
  bh=QC8rCAn7H8lfrsruZ49VBL1e/9tjO1d/84+SowEmrlc=;
  b=KmbhOz5VQbKhpSnIonuVLEfpZBWgxyfBVAl8S07gPQHTWhZzfqESMsbZ
   RwCQd0YVlwlSQQ36Pi/xkBP6ztii50dcBRYP1+nXvyF2BgMmcTkzcp8qu
   mHz8/9nlPHdixZTBzho6tWJLbCG8uALQTrpMtP2MF6qAHTsiTuq9DrsVU
   iq5XnOtJC+kTBMNmqcsNtbIkv2puYDxzQ/JlxIyQfAWrlZlS/tCxMAbRJ
   KcCymAVYE3MD+YQYIBeKQnZBgT1QrOtDpT1J3U0eXeEJKSBeVW1ohw1JM
   CAuiScQ2/HHFZ8PRz/sB/B0BBYS/JwQtaJfSVKVuNo7qKgBJIwkiNshvY
   g==;
X-CSE-ConnectionGUID: DFfBzNa8QLu3y0NuIVlSrA==
X-CSE-MsgGUID: gVpxYSC0QqeUPDfxO85tMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4079143"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4079143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 10:56:05 -0800
X-CSE-ConnectionGUID: yWnnNokhRQCS3Wx/7ru5/w==
X-CSE-MsgGUID: 7a86fHZySJqhta4ShJtSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11130942"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 10:56:04 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVCjJ-000000004aq-1Tvw;
	Sun, 22 Nov 2026 18:56:01 +0000
Date: Sun, 22 Nov 2026 19:55:04 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/qcom-kconfig-unify-interconnect 6/15]
 drivers/soc/qcom/kryo-l2-accessors.c:8:10: fatal error: 'asm/sysreg.h' file
 not found
Message-ID: <20261122194534.KqfwDUFt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/krzk/linux b4/qcom-kconfig-unify-interconnect
head:   bbcb5f4d2545aa663011b1a5e4d21ea9ba744b64
commit: 4430e8bec5c893c5a325e041b9b1a98d640bfdcc [6/15] clk: qcom: Consistently handle MSM8996 and SAR2130P
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261122/20261122194534.KqfwDUFt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122194534.KqfwDUFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122194534.KqfwDUFt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/kryo-l2-accessors.c:8:10: fatal error: 'asm/sysreg.h' file not found
       8 | #include <asm/sysreg.h>
         |          ^~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/clk/qcom/clk-cpu-8996.c:64:10: fatal error: 'asm/cputype.h' file not found
      64 | #include <asm/cputype.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_KRYO_L2_ACCESSORS
   Depends on [n]: ARM64
   Selected by [y]:
   - QCOM_CLK_APCC_MSM8996 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]


vim +8 drivers/soc/qcom/kryo-l2-accessors.c

6d0efeb14bbe23 Ilia Lin 2020-07-03  @8  #include <asm/sysreg.h>
6d0efeb14bbe23 Ilia Lin 2020-07-03   9  #include <soc/qcom/kryo-l2-accessors.h>
6d0efeb14bbe23 Ilia Lin 2020-07-03  10  

:::::: The code at line 8 was first introduced by commit
:::::: 6d0efeb14bbe2350a94ba07b403a686d731c5179 soc: qcom: Separate kryo l2 accessors from PMU driver

:::::: TO: Ilia Lin <ilialin@codeaurora.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
