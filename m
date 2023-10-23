Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E431C28E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdvj2aEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698090611; x=1729626611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjDEhAeJ8cqrlFpf1d6fmOVgEdT45a2/JeZfKiUXO30=;
  b=Fdvj2aEeF7Zz9Nlys9AFAMZHKVcF4aHOCHB9GG5xrlKpkXLe3H6LjEgY
   Q4xcIQrwU25qLb6t/y5A3xLCYBL3jX1ZbN4DGtnqvVS+DKxtIMsEI4mt5
   1pvwE/cKTA/XmQ9RUTo1oRNddGxSSzcdWCdgEspvSZN+CbYUmHHjh9xTg
   ZFYTO3HZi2kQv0f2ILqOH6FC5XPdMzFGImPHa+dYkGlY55T23PL+pGhE2
   BbbToRjfCrya2RypSzhK39s7FigL9RVocZifLa7cJ5act+H76HyE6pGy+
   twCmOvtpkM5G47v12YzEthGxn1AFGWIp2Nsf135f7KdI2wcC5EcbHhk94
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389763861"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="389763861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 12:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708036307"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="708036307"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2023 12:50:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv0wB-0007Cw-0k;
	Mon, 23 Oct 2023 19:50:07 +0000
Date: Tue, 24 Oct 2023 03:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 11/61] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310240328.qqtjNUiq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: dcb2688ff8cf8c0227d454d8151fcf6ea77c681f [11/61] arm64: kernel: Manage absolute relocations in code built under pi/
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240328.qqtjNUiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240328.qqtjNUiq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#67: FILE: arch/arm64/kernel/pi/pi.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

WARNING:NEW_TYPEDEFS: do not add new typedefs
#73: FILE: arch/arm64/kernel/pi/pi.h:7:
+typedef volatile signed long prel64_t;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
