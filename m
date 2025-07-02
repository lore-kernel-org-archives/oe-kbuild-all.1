Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82026D4E2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458451; cv=none; b=C7hDXvasjslYvymnKx1qhdMl4RzThZPpacohYqYbkPxESvlOVCEUNQmjJTeWkzSJZw2BzAGLfAp9Bt6iSIRTUbu4vlewxk2lFzwP77kpbMFCyVlgPotCow2YISeDeEN1HjcEytxOoE1ooE4AbNSqjYNVhC5Y34kYHM3LOZ37siU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458451; c=relaxed/simple;
	bh=jD4HM+fSz4cZj3uRiv/JNKlKMZdQJ26+vaR2WZuJ2Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XD3MK1CCjPYkYbPtQExK7RYUhpoe5bFW5I+ltgCyU8G6elgij9iBuDBMmNsmLEFGV3gaDPg5H9NQWE/YZTrxDqlIEp+091qgHQlaKg0QpnuhuPOe2DMQpp78IdCkjnxCBQnAFV6HgsN0mFayrqvYYDkX4R2dBPYKHA82nZJbr5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6hSax6K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6hSax6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751458449; x=1782994449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jD4HM+fSz4cZj3uRiv/JNKlKMZdQJ26+vaR2WZuJ2Pw=;
  b=I6hSax6KWjoJpJGDNK6cjYO13bcpouSJnWhrlSz3VLr/jvsnugBKNN+e
   hiuCPkmkfe2YUZtWM/f/yDC3rswkx6I3Rvoaamff8PLw7CexNTh2kXXx5
   +Eok+BlXoVnyf85ax1Q/Dsx3TH476Wx88c0AexH8SzDlaWv8cRr3q6q5o
   ahl2no3EuaLSefAkqs4YWTvuqTq3xm6vfi6rRNZbf6hS0otww98YTysxl
   BtIpZssirnZZ8Gg6J8Bxv2JShHzMziOi2Sbb3KAAaZJ1ROj9urOIBz+rO
   z1AOGOReT4yFDjaSUuQHMtTqsLGCnHm8Y3A5bXDMWxcj/Ntu0r5Am2/Fa
   g==;
X-CSE-ConnectionGUID: M48HIjPQTpmvH6lEEumY4g==
X-CSE-MsgGUID: F3JqqIuzRZKdimkK/MD+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76293961"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="76293961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:14:09 -0700
X-CSE-ConnectionGUID: n5uPaFmrQxmIpqrm+SL0cA==
X-CSE-MsgGUID: jpz86W5TT16hGlr8UpsDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153684425"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2025 05:14:07 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWwLl-0000bD-0r;
	Wed, 02 Jul 2025 12:14:05 +0000
Date: Wed, 2 Jul 2025 20:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1684/1684] drivers/acpi/acpi_adxl.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202507022042.Q1D7bRjT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: a275b25c978318513b28931cec91c4a10120748b [1684/1684] EDAC, skx_edac: Add address translation for non-volatile DIMMs
config: x86_64-buildonly-randconfig-003-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022042.Q1D7bRjT-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022042.Q1D7bRjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022042.Q1D7bRjT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_adxl.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
