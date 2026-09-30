Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A43CE0B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794322; cv=none; b=Hu/EeyGE+qx+/hU8ykPuey7CAwHN9d6UWdnD4XrncAuIdgQIAW/BRcqkE8+1QMdR6YeQw6mIwQ8B8M6SNeH5wgcbxdjV+YkohCsy+sdZZddFs0dryRQLNijvIPXnDGIa9tcJRYTM8k8D3K7HXmIdrmcB56pGSVlCzLwd85G5cm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794322; c=relaxed/simple;
	bh=Tx+xKiQZJD4JgT0uwZfTo9bSD8Uj/wIl6rRxZOaN//A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rGSCmRrxc4ivJG7pLlcluHS60rnpPWZZtTA18Qxf8QaMYigkqQYyW/y833Q5SnRMbn9MEv1Xepu3vR2VrS1+mBi9d6aAsU/iNfvMX/BAjqF2yDLSyUptOVatnSdMewHiucAtdcW/TjL3QtlYv8yv4ky7ao1G9uNHlQmetY4T24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2lyDqdD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2lyDqdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790794321; x=1822330321;
  h=date:from:to:cc:subject:message-id;
  bh=Tx+xKiQZJD4JgT0uwZfTo9bSD8Uj/wIl6rRxZOaN//A=;
  b=n2lyDqdD1KPItQ4+be1g4tD3L02wO4Yk9KtDG4OYnpJt7LadkGCMZ9T0
   MDW+PeunQ9a91C6m2IoRK7BbQSR02tJaiHrIbNRlYiNXtTpzgm95hXdPs
   50uLH2Gw9mc4RfIbcQkBl7Caw/iCK1ZfKIHl+NukQ2p1i39TF03MIH1rs
   dLln4sNthPQePEFCd0fyK2pSVUpvJsjh/F4i7XXilNHG/i6rhsh33Vhkk
   fDmvIk1/scVtU90HyH0dVDL3iCQwuojttOlAZ/vwqHeZjXpRjlfqdTom7
   IKEE6yYZ9waIQBC7PRIGnCSJTIOa4W6a+eZ0FttAjLaHoL8lab9NUIc4l
   Q==;
X-CSE-ConnectionGUID: CSJ25TVZRrCjIQk45G2CBA==
X-CSE-MsgGUID: hhuPJxQAS5G6U4A8O7cILw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95352278"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="95352278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:52:00 -0700
X-CSE-ConnectionGUID: utBWv+7lSdiWdeS+N+wXrA==
X-CSE-MsgGUID: ks2L71a3RT+cSijxK/fV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275317838"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 11:51:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBzPI-000000001y5-3QxE;
	Wed, 30 Sep 2026 18:51:56 +0000
Date: Wed, 30 Sep 2026 20:51:07 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 13/26]
 drivers/ctlv/tests/metadata_kunit.c:17:10: error:
 'linux/ctlv_fixture_child_gen.h' file not found with <angled> include; use
 "quotes" instead
Message-ID: <202609302017.8Yj8zDOO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 7a94cd6833db466aa5cf2896495ef3692cd75429 [13/26] ctlv: Add the KUnit tests as their own module
config: hexagon-randconfig-r2103-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302017.8Yj8zDOO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302017.8Yj8zDOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302017.8Yj8zDOO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ctlv/tests/metadata_kunit.c:17:10: error: 'linux/ctlv_fixture_child_gen.h' file not found with <angled> include; use "quotes" instead
      17 | #include <linux/ctlv_fixture_child_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_child_gen.h"
   In file included from drivers/ctlv/tests/metadata_kunit.c:17:
>> drivers/ctlv/tests/linux/ctlv_fixture_child_gen.h:18:10: fatal error: 'linux/ctlv_fixture_gen.h' file not found
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/ctlv/tests/event_kunit.c:18:10: error: 'linux/ctlv_fixture_gen.h' file not found with <angled> include; use "quotes" instead
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_gen.h"
   1 error generated.
--
>> drivers/ctlv/tests/registration_kunit.c:25:10: error: 'linux/ctlv_fixture_child_gen.h' file not found with <angled> include; use "quotes" instead
      25 | #include <linux/ctlv_fixture_child_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_child_gen.h"
   In file included from drivers/ctlv/tests/registration_kunit.c:25:
>> drivers/ctlv/tests/linux/ctlv_fixture_child_gen.h:18:10: fatal error: 'linux/ctlv_fixture_gen.h' file not found
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/ctlv/tests/message_kunit.c:18:10: error: 'linux/ctlv_fixture_gen.h' file not found with <angled> include; use "quotes" instead
      18 | #include <linux/ctlv_fixture_gen.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |          "linux/ctlv_fixture_gen.h"
   1 error generated.


vim +17 drivers/ctlv/tests/metadata_kunit.c

  > 17	#include <linux/ctlv_fixture_child_gen.h>
    18	#include <linux/ctlv_fixture_gen.h>
    19	#include <linux/log2.h>
    20	#include <linux/minmax.h>
    21	#include <linux/string.h>
    22	#include <linux/types.h>
    23	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
