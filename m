Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E124C62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPmgrcCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946496; x=1728482496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsqFX3v5bEyvwfFrog5BWw1BMrO0/bsjoiReiIEipZU=;
  b=BPmgrcCmMsOXdCXt0kTeV754vuO1Czn2j8LhKeh3JFADyTubG6/iwMO7
   0E/7A9+6Tx8nyKftCu34c+N5RLjeOBFxcOJGrTLgPBaHMBsGaCLZ43z3N
   eFMXxUowsRKEVADc7Tar4eZ0e34zhiS41HsLthtyMA1qxvVG+jRYat0C7
   5JAnEmQkVmp3f7Ao3L000BNb8WeTZdhzp6edERvbFvwGzut4ynLyOVPGr
   AQ47vyz1d92/+uHcIcGv8RHO9KueBLVxWOuwFZjAF5XvqItXtnQDReqde
   7Fb8YyqtHinLmhmHubS5MpohcIXCMYiT89Yl05VGAPGVH1U9EFC6spcMq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5964716"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5964716"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823791116"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823791116"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000XN-2c;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 27/38] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310102159.RiHqRDLu-lkp@intel.com>
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
commit: d62f561851d247f79c70df5df0ce3dde57db482d [27/38] xtensa: esp32: add platform
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102159.RiHqRDLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102159.RiHqRDLu-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#731: FILE: arch/xtensa/platforms/esp32/include/platform/serial.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#764: FILE: arch/xtensa/platforms/esp32/setup.c:20:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
