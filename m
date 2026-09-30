Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197A286D5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731208; cv=none; b=CQ7PSlH+u/bkD/Hj43WRW4A88H/VHMvusPUor6cpvRHqItvmosdeTaoC9200Cf+krUIzlw20a1qFLE2eweXH9diNTCWMnr3lIpOGBdt4UOSiLk4csxhPH5j38wx2nrjTIJ/WhYEE1p3BTI4iY01xkj1wNJhbQZrp1W0sEw34FU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731208; c=relaxed/simple;
	bh=6WCG7n4jBfYofTihOU4cJ4arO6o+YoGwJrYgl80r0Qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VpAg9k6OCBgN3fHgAEx8yYGO/RbG4cCa00ASzVYYXulS0Y1MKoGjDALnsqZ2vpjb3vh8tFob2Nxokn44+Ze334ZCnPcYcC1Ls37NRPDcUAhALHE8p1cOnImo6VhzupWNO7FiwmLqZzVFuD8KSnCQE1AQ0yopA8o43AXZANG5Mzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fP0JYwiF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fP0JYwiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790731207; x=1822267207;
  h=date:from:to:cc:subject:message-id;
  bh=6WCG7n4jBfYofTihOU4cJ4arO6o+YoGwJrYgl80r0Qw=;
  b=fP0JYwiFI86TztC2LRW+M85/LvnxS0ORr6+2Uobru6eOLYRzFzm9Mdg6
   sREyPYQU+goXSwOcKqYx0wdILzNoKSB9WRGgGNuf1XG5XdaSw9pGlqQgR
   XT7Bw5TI+DS7InehYQKBa9RId7x/ErmkbI0U8mL8Haxm9IB0Kl2bcrwKm
   jqAI/BI+1zPaSoVfbkJxCJrZWwEILevHzzc+779pfK7v7pjN4S37W46fS
   8V0hhr/lY+BYOoXG3/Xs+pxBrU7sbsSmcuJG9q/YpVA/1LqrTSRxrhODm
   A+XsVBFbmTAEsknnJrI07Ikxj+JpZI42d2kbj3rUAjM50/WuZaWj9BwCR
   A==;
X-CSE-ConnectionGUID: mlMll5prRumO8NJgGrsJfw==
X-CSE-MsgGUID: 4dI7W48PRxK1uj4ky4jSSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108948871"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="108948871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 18:20:06 -0700
X-CSE-ConnectionGUID: +NyqvIvNSTeh5uHZMPEKww==
X-CSE-MsgGUID: U7MlCt2VTHq3vtRKZaZwdg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2026 18:20:05 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBizL-000000001f5-1Xb6;
	Wed, 30 Sep 2026 01:20:03 +0000
Date: Wed, 30 Sep 2026 03:19:48 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 13/26]
 drivers/ctlv/tests/metadata_kunit.c:17:10: fatal error:
 linux/ctlv_fixture_child_gen.h: No such file or directory
Message-ID: <202609300302.suAqTdXM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 7a94cd6833db466aa5cf2896495ef3692cd75429 [13/26] ctlv: Add the KUnit tests as their own module
config: arm-randconfig-r2306-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300302.suAqTdXM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300302.suAqTdXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300302.suAqTdXM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> cc1: warning: kbuild/src/drivers/ctlv/tests: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: kbuild/src/drivers/ctlv/tests: No such file or directory [-Wmissing-include-dirs]
>> drivers/ctlv/tests/metadata_kunit.c:17:10: fatal error: linux/ctlv_fixture_child_gen.h: No such file or directory
    #include <linux/ctlv_fixture_child_gen.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: kbuild/src/drivers/ctlv/tests: No such file or directory [-Wmissing-include-dirs]
>> drivers/ctlv/tests/event_kunit.c:18:10: fatal error: linux/ctlv_fixture_gen.h: No such file or directory
    #include <linux/ctlv_fixture_gen.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: kbuild/src/drivers/ctlv/tests: No such file or directory [-Wmissing-include-dirs]
>> drivers/ctlv/tests/registration_kunit.c:25:10: fatal error: linux/ctlv_fixture_child_gen.h: No such file or directory
    #include <linux/ctlv_fixture_child_gen.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: kbuild/src/drivers/ctlv/tests: No such file or directory [-Wmissing-include-dirs]
>> drivers/ctlv/tests/message_kunit.c:18:10: fatal error: linux/ctlv_fixture_gen.h: No such file or directory
    #include <linux/ctlv_fixture_gen.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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
