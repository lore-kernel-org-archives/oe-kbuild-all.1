Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D71B26D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U78FdHJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091272; x=1729627272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQLu3hSWNv8Ft60600kkHoaewoYCIZ3H7I7LEcOO4lg=;
  b=U78FdHJTHmxkJQ52asFxvkua3CzDl5VvLRvPOrIRmJxegUGahyXknWSH
   SjZ3j1Ntw/yzLuRFSQRSXnvLaxEEQM11eu/Lh7PMxMTzYfcChaWVmUtJE
   QAqbXSVW3grJqH37ArFhTZKor5YOux8y0jUE1G0DJ++wClVCk7+py2iBM
   EFNqQwx5VxsHOm8vcqhh6550Ypm/BqksjN8nZJ4ySkyj/LBcTbIrRsXBT
   80MMmE0BFCwQbo/Duc4GwKAmjL93iHi9YfkVlJKlmbe8tWxwm0VIOceNN
   2wNgqiReKoE7fq6EYxNhQCLqp4stFBWG1RR5dxlQvIaOS85cxox68Y390
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814134"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814134"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089603449"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089603449"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:01:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv16p-0007DX-2S;
	Mon, 23 Oct 2023 20:01:07 +0000
Date: Tue, 24 Oct 2023 04:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 35/61] checkpatch: WARNING: Comparisons
 should place the constant on the right side of the test
Message-ID: <202310240315.KujBh3Qb-lkp@intel.com>
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
commit: a9126e21109025edddcedc1704df5a00ec7ceb75 [35/61] arm64: pgtable: Decouple PGDIR size macros from PGD/PUD/PMD levels
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240315.KujBh3Qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240315.KujBh3Qb-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#85: FILE: arch/arm64/include/asm/kernel-pgtable.h:52:
+	(SWAPPER_PGTABLE_LEVELS > l ? EARLY_ENTRIES(vstart, vend, SWAPPER_BLOCK_SHIFT + l * (PAGE_SHIFT - 3), add) : 0)

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#97: FILE: arch/arm64/include/asm/kernel-pgtable.h:54:
+#define EARLY_PAGES(vstart, vend, add) (1 ^I/* PGDIR page */^I^I^I^I\$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
