Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ACE4A15
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CovPmAK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697848364; x=1729384364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=94EgkYMPiLNrLVTrCiXS8fsFcW4zXm2GtR0EuanuDeQ=;
  b=CovPmAK4PBC5ll0O8O1GozqF9QTJFhoJ3QLFjANnqWdbJh9H9FIFTSTY
   5DO+Lbn+xIWodB3VlomjUx3YtM4g4dEzyZU50cA3tAGF3jb3ACn5SA3f3
   J9rzvXBsNCncpkNvkpK3LJYNbrutxXFABi8+JXv2Viq2ATJ20t9PwfqUu
   1M/ox8hVuFjAyWpd9tQrPVOblRAAr11Ro5O+4no3JpCiSTuYxOIOcfpU8
   9KZi1zR6OjCIgzhjGy7MnwSXyamIAHUQA7N/7gFNzwh1kdRJzqU7D+PrK
   dbDoU/DAsnAv7lTxqLqfXMfaORShryt2W4RlNUjguWIcZ1nyFabou9i1u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="365935396"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="365935396"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931155843"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931155843"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2023 17:32:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzut-0004A4-1G;
	Sat, 21 Oct 2023 00:32:35 +0000
Date: Sat, 21 Oct 2023 08:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 30/43] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310210829.pLSXsvj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: 757b30d129364f0d6b02cadf0f4d3a16693792e3 [30/43] xtensa: esp32: add platform
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210829.pLSXsvj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210829.pLSXsvj9-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#749: FILE: arch/xtensa/platforms/esp32/include/platform/serial.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#782: FILE: arch/xtensa/platforms/esp32/setup.c:20:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
