Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4325282E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715543593; cv=none; b=H9CR5HdhFq0yBDgtP+UdyWGMb+P7++SW0X5/x1uJA5ipKmJDeDgalnQtI1fiTFlY0Ge4M8VG8J51Gk1g35DaTIVdD8Sso9Jac4Kg1MA+CiI21PQVChfOXpkXaJ9tIXcKtvql1xq6CetpVrVt9hzEB/b1peXHajDui35Ncljzs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715543593; c=relaxed/simple;
	bh=ntVhxGXcjjr/wtL6q3ZMpmoYO97Y7urZkbMYhdjrmP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kofxGVIrq2uMT5N713fFIP8PBa4nrUWnGBKyW2EEw6848oD9Jd0PoMdoMbZbIVvixD+DJDdqgLF7mk5MOpZS79CYVdUzxOMDGR9FIkkqChbPN+gOHFUfvdIwuEB8pluV3AQpaXr1pMdfoXmqIlif3w3ZKoUegm59E8M9I3Hdizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm9oDcmg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm9oDcmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715543590; x=1747079590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntVhxGXcjjr/wtL6q3ZMpmoYO97Y7urZkbMYhdjrmP8=;
  b=gm9oDcmgnk4lQXNPOyTlRdHYsXoOvjcVX86T+ly/Y75pL4nOPBld6m5X
   KzY6//A9hFCM78Stg4SFeuWx1ed/YwQ5fElLipecT3v5gYOqJ5xRyoey3
   kLp38OOWc4ok+p3tg/jaPt8dCgDwO9kGbD4Zoub7nKOF3We/Qp6mWorhZ
   xGGoV02ap2ylAr/0krMzCz/cnEZxu5ClLAYllDMyux1oX96Fig0+ll0Ym
   yzhssP9/NsvAABzL9eqyrGXIdqnXExXB/5al+/idN9am4w81jM8+tSV+z
   45zpqTIAgcJHTZ49cgb+haFQ8sD5ZuIPmOLG2uu5HfFpmhy40NbJFNkkB
   A==;
X-CSE-ConnectionGUID: WuVjGjsSQIGf+sP3Xm/JhQ==
X-CSE-MsgGUID: xzv/njFSSV2qQ+UD00Nikg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="14420120"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="14420120"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 12:53:10 -0700
X-CSE-ConnectionGUID: 78hnvjm/Sm+/kCv9aTcAwQ==
X-CSE-MsgGUID: WmND/isTSHGWjQ+qINtP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="35006433"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2024 12:53:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6FFq-0008sN-2c;
	Sun, 12 May 2024 19:53:06 +0000
Date: Mon, 13 May 2024 03:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.6/linux 2/10] ld.lld: error: undefined symbol:
 mce_unregister_decode_chain
Message-ID: <202405130340.RTBL1WDm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   7fa1cff55e56fa36009a67fb0ea6445e84928b34
commit: 9f721ed885803cd46cb312f7253c60e4864ffab3 [2/10] EDAC/ieh: Add I/O device EDAC driver for Intel CPUs with IEH
config: x86_64-randconfig-003-20240513 (https://download.01.org/0day-ci/archive/20240513/202405130340.RTBL1WDm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130340.RTBL1WDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130340.RTBL1WDm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mce_unregister_decode_chain
   >>> referenced by ieh_edac.c:732 (drivers/edac/ieh_edac.c:732)
   >>>               drivers/edac/ieh_edac.o:(unregister_err_handler) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mce_register_decode_chain
   >>> referenced by ieh_edac.c:712 (drivers/edac/ieh_edac.c:712)
   >>>               drivers/edac/ieh_edac.o:(ieh_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
