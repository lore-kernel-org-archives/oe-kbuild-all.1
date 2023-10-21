Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1031D62B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neNFifcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697846619; x=1729382619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HMdwSGTTEj2rlelJlWBtCXRI55TvLvO7cynPT1siQkE=;
  b=neNFifcsZq0tGQwuhoZnoSN4VwrViR74bc0KKfdS+PEByuDPX9xdEXNH
   Hu3aB9yp4BlYTgQTbB7tCcGHOUcUOsiJPtTyJGOc2lNX75opCEAN+7n7f
   6TkEsANjnPyXQnTufJxbr4HkX+ILV85bM2S52cuaFU5KjcCjYWx6RLloE
   OKEwoXF5drjKXfruttkwNpLrEq23gsMO6XjTwq9dPQeOm8wOD2pX6HNoz
   +FGb4xdKx7dgVFpe3eIsNhjbxpkla4xs8gjvobJ36HMedv74KGR5qgj4w
   SN16fvL4lVgz9KrP+tLBO1uZ1BrdlinOeM/UMTuoz3cqrnAGX5gwARbit
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8154857"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8154857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="931151817"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="931151817"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Oct 2023 17:03:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzSn-00048W-38;
	Sat, 21 Oct 2023 00:03:33 +0000
Date: Sat, 21 Oct 2023 08:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 23/43] checkpatch: WARNING:
 suspect code indent for conditional statements (8, 15)
Message-ID: <202310210837.Kpose5NU-lkp@intel.com>
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
commit: 17fa79c6eaee8ca633215d96ec5740b479d899cf [23/43] drivers/net/wireless/espressif/esp32-ng: update
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210837.Kpose5NU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210837.Kpose5NU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#51: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:623:
+	if (test_bit(ESP_CLEANUP_IN_PROGRESS, &adapter->state_flags)) {
+               return;

WARNING:BRACES: braces {} are not necessary for single statement blocks
#51: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:623:
+	if (test_bit(ESP_CLEANUP_IN_PROGRESS, &adapter->state_flags)) {
+               return;
+	}

ERROR:CODE_INDENT: code indent should use tabs where possible
#52: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:624:
+               return;$

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#155: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_api.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#170: FILE: drivers/net/wireless/espressif/esp32-ng/esp_sdio_decl.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#198: FILE: drivers/net/wireless/espressif/esp32-ng/esp_spi.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
