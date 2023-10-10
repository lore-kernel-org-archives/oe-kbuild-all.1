Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933324C6D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkMm5hKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946495; x=1728482495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oB+ugzV/8PW1yBWOnqbnowfDG0/PbBPTUZUUBIJiixg=;
  b=CkMm5hKNGFyNhZlbzottv61zt2POM0BT7NmzB60PEfrAykQeYb5cKr+V
   l9fQSgXC5jLFupZyNcyUcWmt/1cdvLoEUdxaM0/MYMHHLMyM3VprZIJL2
   GnzI0T6bBkVNbWmws8i9J8L98jwD5XhE40B+FP06qyiIAjr5HUuC8OOQF
   4NiZ4R2wQPGqF2SQd/66oEOEXRVShq49SYpxJgyH+dsBVqARFT2/4xWjY
   6dRbyLCOD6QdgCj1iTpTrUbCZGRKFYqmP8nGL2ElP2MKHqGMW1VdRnctm
   XcA04RrmdnMrDrVmb9tn33A4wy0EasglEpPN8c0k6SPNEzREw/BXgOgAb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5964714"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5964714"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823791115"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823791115"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000XH-2U;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 26/38] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310102131.UeizbTmh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: 1e4275e30ad53c59e06fa088bc651a8a9cb682b0 [26/38] esp_wifi: add IPC transport
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102131.UeizbTmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102131.UeizbTmh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#48: FILE: drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:1:
+/*

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#78: FILE: drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:31:
+struct esp_wifi_shmem
+{

WARNING:BRACES: braces {} are not necessary for single statement blocks
#250: FILE: drivers/net/wireless/espressif/esp32-ng/esp_shmem.c:203:
+	if (esp_add_card(adapter)) {
+		pr_err("network iterface init failed\n");
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
