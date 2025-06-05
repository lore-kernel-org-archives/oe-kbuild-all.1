Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2222EF5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 01:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088502; cv=none; b=UR9m9BC7Gs5ev+1G6mBr55OxLCZhzvvPRXGq0durdSZVgIcmUdgOsCYV2oGKzGYLWt07vyKBJl8gE8hYFk+0kpDjKl8QgpiqqOMc/TT1BTIdZSjXtFPuOzDOhWxybl/tB0Cf/cJ/umTLXp+Ck+fyIOmbDv63vlVgXf7AWRhP3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088502; c=relaxed/simple;
	bh=MeHhNTIHQxykM+s5btp55evNhJvtg+q4i6rFxvBZOCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJVHebGR/e6A7SyqGpZhJ+frfB1qZwjuinkKrSClwdYg833RLO4WCESCNIj0AgqwzoglmZwy+G4StPWS/ekHYKyJ9XP/c51aGykTTsPDpbM3OmBgDfXHTjU+nrP2mNoJQxmF8zpAaD8fL05cjdrCFW9zehk/o6aLTAwD5O8pUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh5rXYRJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh5rXYRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749088500; x=1780624500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeHhNTIHQxykM+s5btp55evNhJvtg+q4i6rFxvBZOCc=;
  b=bh5rXYRJLDHUHbcijy6jGtfQfkIjJy/3DgBbW3o5+tOhfBTbO1D33MMp
   yX00iAHgQlsFyC2U3cVdtdbOyYrEaTO3QzNV+ol1gl9GmMLjEIvhSPb3q
   4rZWDwCIpHEL4CdxXSb8YV0mMH7UUTm6n1x491EQ2AeROS7Trtkr+KmuD
   zJi7evBu+mNHQRjinqk9f21votama+8kzcYox1eao/GtECQNCe6dGTqvz
   AJD9QxySisu/WyHon62wBrudnfpwD6se5UxpDcXGIMlHgqMRBJLzzJkoQ
   A/QSaySusdZKJIBL8+OvGWPrkrU3IJkwYirfbXKKoQCzW4LHRHLe+2UB1
   A==;
X-CSE-ConnectionGUID: yABOKyrKRrKAfeTpzi8Yqw==
X-CSE-MsgGUID: pOF/zpg+QFyRCn2e83BvKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50308591"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="50308591"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:54:59 -0700
X-CSE-ConnectionGUID: YN19013wTxis1qxvP78s/A==
X-CSE-MsgGUID: cY2PgH7cQyOZAGDzNwYgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150156111"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 18:54:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzol-0003bx-3C;
	Thu, 05 Jun 2025 01:54:55 +0000
Date: Thu, 5 Jun 2025 09:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 150/150]
 drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb.c: gpueb_common.h is
 included more than once.
Message-ID: <202506050922.iWDp7qVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449
commit: 8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449 [150/150] CHROMIUM: gpu/mediatek: move mtk_proprietary out of mali
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050922.iWDp7qVi-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb.c: gpueb_common.h is included more than once.
--
>> drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: ged_log.h is included more than once.
>> drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: ged_dvfs.h is included more than once.
--
>> drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_eb.c: linux/module.h is included more than once.
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm_swwa.c: linux/of_address.h is included more than once.
--
>> drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_dvfs.c: linux/sched.h is included more than once.

vim +30 drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb.c

  > 30	#include "gpueb_common.h"
    31	#include "gpueb_helper.h"
    32	#include "gpueb_ipi.h"
    33	#include "gpueb_logger.h"
    34	#include "gpueb_reserved_mem.h"
    35	#include "gpueb_plat_service.h"
    36	#include "gpueb_hwvoter_dbg.h"
    37	#include "gpueb_debug.h"
    38	#include "gpueb_timesync.h"
  > 39	#include "gpueb_common.h"
    40	#include "ghpm_wrapper.h"
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
