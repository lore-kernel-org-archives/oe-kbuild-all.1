Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F422EFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8cQpbpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091364; x=1729627364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ymqHkExWbqq8H+4YxWS0098fcM4kGFAbDYOIxnAkNs=;
  b=W8cQpbpXQm4fbga1/8MWS4F67kc9zYmgXwbyUT+H4wBsAUuGCFY/hejQ
   GUrscijZktKCDp2vDu96tDHB6GjGTCOI+ZBRTMkvINPkjA1TrtefrDDfc
   bmU9J6YTDkmyYQd94bUNncjHPGC6Crq5qdDwCee7v6qZ4SBDaWr4kCjoi
   fhvaQ5yQI4OMqM0i6haLxO2Y8sUOXlGhU4Pw37p6Iee1a/zgZzqbOSz1A
   4oBp/MyS+oaGiFBq/EdIjveCZ4txxENQlKnbqG9tArxFIWxY03/uBx1s1
   C7uQBpojXhWvE7WU/Pem4Oell4Om7x6UTpNfRXTQmR5c/MldvdSKXAEBa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814567"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089604281"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089604281"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:02:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv17n-0007Dh-2X;
	Mon, 23 Oct 2023 20:02:07 +0000
Date: Tue, 24 Oct 2023 04:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 43/61] checkpatch: WARNING: Comparisons
 should place the constant on the right side of the test
Message-ID: <202310240333.s1XHhlEr-lkp@intel.com>
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
commit: 24c29be11d7f112b410b43386acedb53182a175d [43/61] arm64: mm: Handle LVA support as a CPU feature
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240333.s1XHhlEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240333.s1XHhlEr-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#216: FILE: arch/arm64/kernel/pi/map_kernel.c:169:
+	if (VA_BITS > VA_BITS_MIN && cpu_has_lva())

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
