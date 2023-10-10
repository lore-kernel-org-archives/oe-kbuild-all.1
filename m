Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0E424C62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHsrxH7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946499; x=1728482499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FqyFHlepKv7EkgsIMHFRhRb3/ifhbsFKs3xzVbI/bE=;
  b=WHsrxH7ZWPscp6I5Ylzp1zvZp7CFLM+laY6L//V2iMibXvm+gwOsy51j
   ZP8xqc2NZHBC3SxMxjMqHsI4xFVzzfVjIz4lb0ZzwLo00V4eM0+uAmhvI
   JhUDn4b4iotunileFttR7v3qhp/h2YkhQzzo5zmCebV11l6P42zS574zY
   +h1vhSAFlM/HtTyAKNajNcrzp43zvDKLRuiB2bxHk0ODDh4A6IqOkjQBo
   zjHaywIIby9aYJeHzimnLrF3PBblNNt25VzQnYsX8vLJR7crkDtvvm7mc
   3Htuhlxb3y0tznA4GcB872QWs3dm8agwEsMWsOGC1tqNrdatJ9RYoO8Er
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415414696"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="415414696"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844141088"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844141088"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000X6-29;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 31/38] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310102149.VOXrVqBS-lkp@intel.com>
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
commit: 8252afe4c361bc1fc7011825b45e3261d5ad0e84 [31/38] xtensa: add TRAX support
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102149.VOXrVqBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102149.VOXrVqBS-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#47: FILE: arch/xtensa/include/asm/trax.h:1:
+#ifndef _XTENSA_TRAX_H

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#94: FILE: arch/xtensa/kernel/trax.c:1:
+#include <linux/errno.h>

ERROR:SPACING: spaces required around that '>' (ctx:OxW)
#205: FILE: arch/xtensa/kernel/trax.c:112:
+		for (i = 100; i --> 0; ) {
 		                  ^

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#360: FILE: arch/xtensa/kernel/trax.c:267:
+#if 0

WARNING:BRACES: braces {} are not necessary for single statement blocks
#551: FILE: arch/xtensa/kernel/trax.c:458:
+		if (j % 8 && n - i > 8 - j % 8) {
+			b |= ctx->packet_buffer[j / 8 + 1] << (8 - j % 8);
+		}

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#602: FILE: arch/xtensa/kernel/trax.c:509:
+		return false;
+	} else {

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#602: FILE: arch/xtensa/kernel/trax.c:509:
+	} else {
+	    if (ctx->msg_packet < trax_decode[ctx->msg.type].max_packets &&

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (12, 20)
#603: FILE: arch/xtensa/kernel/trax.c:510:
+	    if (ctx->msg_packet < trax_decode[ctx->msg.type].max_packets &&
[...]
+		    ++ctx->msg_packet;

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (12, 20)
#607: FILE: arch/xtensa/kernel/trax.c:514:
+	    } else {
+		    ctx->msg.type = TRAX_MSG_TYPE_UNDEF;

WARNING:BRACES: braces {} are not necessary for single statement blocks
#912: FILE: arch/xtensa/kernel/trax.c:819:
+	if (pde) {
+		proc_set_size(pde, trax_state.memsz * 4);
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
