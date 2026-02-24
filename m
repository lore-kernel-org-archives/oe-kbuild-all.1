Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13812226D00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771969886; cv=none; b=uWehscOh6EXPBIaxhLaV7LkwZzbhLpbxb38D1SuwFN/fcZNxc4PhJ7fbBBDRXF5XKnhnmogfWnjhS+5xxQnjhZfpIzZwVokvritxJ85AIy1CDEcREGi1OoOJWuWSG6qG8/0oTyFla61+8uURMDVLHqZULFCI4Nc77z9B2VkUCZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771969886; c=relaxed/simple;
	bh=8J0QKuf5jOT6QlMuEZN2i4Bw6/viDbRfTF7v6kOQjbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PW1nJ0aMFo7sXoQSmYhhaTOXm/3Cp6/TcFal2dknZ5WRXc5U27rbzGzehIFP3XhA2fSuylxcatoxa/ustzf0q0mMnBEigdPvH2J+kLp78uWkiJTosNmsntBsnxaEPh6Cyg+DzRfwKND8S4VrCO5D8IBGRXkKTaFBX7jpEDGfeq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS6vEYyf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS6vEYyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771969885; x=1803505885;
  h=date:from:to:cc:subject:message-id;
  bh=8J0QKuf5jOT6QlMuEZN2i4Bw6/viDbRfTF7v6kOQjbw=;
  b=GS6vEYyf2Trt/ZORD69e8kVrE+wwZ3320ag8I9EIKcOPTd8NIvPmtZ9+
   JV/rUa+5pwEYvRN6TKBYYYrbYDxl4YWvReCOhdvA4KdT33G3M3WFDtdOG
   XQxhSSpNzU9n2M2tVUQ7d2FDGdbTjktdis+2Fo7Y022M6ZYPwa0YnNOHC
   rDJRlLo85ssSrsv9tCu7qdLKpx3lkgqwgGxbD3JXVM/zJF5R6S5rodKnA
   n5kJ1utdN51KHk2Nnkwn8PsNa6P6j/RzYGK7eoYa4sahaEeYWbZPw/4e0
   X9YvQfJ93o8Kk9hEGJlw4RPc2F/DlvsIP7azPCERVyWkvxpxJeIMJb7oM
   Q==;
X-CSE-ConnectionGUID: eN1Fao8pSu+AhYhB0UPTrA==
X-CSE-MsgGUID: y+Gr3QpyRGmhqrV2E3idUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73104101"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="73104101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 13:51:24 -0800
X-CSE-ConnectionGUID: 1w6Z4FkhSb+si4gfAjxevw==
X-CSE-MsgGUID: 3wcshrL9SYWrpXbxx/Ti4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="216043219"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2026 13:51:23 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv0JM-000000002Tx-2Tcc;
	Tue, 24 Feb 2026 21:51:20 +0000
Date: Wed, 25 Feb 2026 05:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h:
 No such file or directory
Message-ID: <202602250543.OnYbyo2K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   2bd5d76830953093f5bd0634e552f71092aa743d
commit: 2bd5d76830953093f5bd0634e552f71092aa743d [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602250543.OnYbyo2K-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250543.OnYbyo2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250543.OnYbyo2K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
