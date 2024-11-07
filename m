Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7DF193070
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982314; cv=none; b=nxo81Exz380nR6YrVdTlJbiIrlSBVabi4+jGmTrGR1sWH4t8f59b3RFpMHn0mNmRekdu8Yg4CZXAPg6KEVI+Ruk/UUR47rG15mo7fqjBM1Yr3CNDMfSeNZRM+rbLH1h5XP9oB9fm9UYqZLV7npNqKuWr9QN1yFQZGXeUnZRNrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982314; c=relaxed/simple;
	bh=Jw/+VYKxueCpSjrnpGur/T36cdMCu5adgFWISDtLTd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PO+MIhbOw18lrLXNIY4THt22tRWjnCahiiTl16lmCzKLivWAkz5X3gOHB1Aki76IcvOin+y7dthmN20PlApujqfPjv36V6FGkpIzAzUrwN6UMtfmNL2FLATHVExtBQRBe62fXPgF+3v6KOIyICjWNh1xAQl6ywG2aNyClnE35ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtaqkAxZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtaqkAxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730982312; x=1762518312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jw/+VYKxueCpSjrnpGur/T36cdMCu5adgFWISDtLTd0=;
  b=GtaqkAxZOPN0CzhtxnLZmj6oLqDJNFQ99RuckOkuDf5janmc6BBBo0mh
   A3awKMxtQHjBxxgW7aaE0MA5Q6esqwdOhCWA0sTihFzhbGIDSkV9lDWEL
   MxwkWzJnP7Af+NTTabaIfrUOzguqzR1barFo5/i/7mtPUo4KmByVjBYDO
   1kot8F4Kq5OCtZAr+E8I5AWgWPTGSdku7fuInzNVCeHmbPIBQhwsyNxMg
   MiHb/mHDvvATpGwpf71RbSXQQabHpvymLNXoXGXQX9dU9npU8xthW7t4T
   Y3cVFvBhxNjLRJWAIdhJuZBm8u9OQ0+Esywh1ALfWBQeS5vCpJoveFFWo
   g==;
X-CSE-ConnectionGUID: 36mzulOkTXCjPqIMCgLxSw==
X-CSE-MsgGUID: 5SpCQT5GSI2y5Q5AOFiUfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30936061"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="30936061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:25:12 -0800
X-CSE-ConnectionGUID: tjVrMBHyQfOtHO7uVDFlFA==
X-CSE-MsgGUID: 06ODLUzfSxGitZ9+7bOlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="89698866"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 04:25:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t91ZU-000qDa-1Q;
	Thu, 07 Nov 2024 12:25:08 +0000
Date: Thu, 7 Nov 2024 20:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219]
 drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202411072224.Ht1FxwCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: 81ceed41d0c2b2c9300de7bc30c1451680257f52 [1219/1219] watchdog: add driver for the MEN 16z069 IP-Core
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241107/202411072224.Ht1FxwCI-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411072224.Ht1FxwCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411072224.Ht1FxwCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/menz69_wdt.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
