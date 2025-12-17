Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C052E0902
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999753; cv=none; b=mWlYkbt7QlwoeUs8OK7RXkyFA/Oskx9L7IM8b/YisbozjN7DVeQ/VfqtpviENjQ1ymODThogAYask/mngeSpF4izTViEK60EUyKlpruYBO1SnJelCBp5lz0PaBwGI/w8F+AT5DroX25+YY01I9joiKqypqmR4Rx8eNGs9Cr7jIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999753; c=relaxed/simple;
	bh=l4vrm+VX9yol2HEfCB55JuOYG7+fqze2X6262AcZnWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2nNrfGuhkzWNw84Wm2Awpre2xu0UUHdRon53JVIxJXNqhwX6umcTN6xSndPbpmtfD3M9Gf0LqaTWNlKwEpW7x2U2LpL8hlB88872FCyoVHS6L5VH/YprJoTrvZwd1Gc07Lz8IDpyCv77GUqOVlGi+Ujlbh9aVWgeklT9Ptd5FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF6lnvCf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF6lnvCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765999751; x=1797535751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4vrm+VX9yol2HEfCB55JuOYG7+fqze2X6262AcZnWM=;
  b=MF6lnvCf26R0VsyK0wK4HTld0RdVNyuW8057sWcaxjmjgbtXU8jxlI9z
   9L5GHI4wpxmXm9+W5gwSrh3bRsI//8wEODQmIC8DCWe02rJnBZD89lLRv
   axmBKX5XjgauIlpXbPjVxkoV/PBcc9xwTHod35g1mX8qITw1vpLyCqLSE
   Hz2UC2foW7245G8SO4YhRQQeXPzsVWd/niEGvaHFQW5h6rBmq01vncFNg
   GkFIZxisq1WBsh0kwlVLiIQcqarh02Ocv98SSxCR9XEuJH1CHJnFqFifE
   959m3KqzH2J8euspVxCvU7tLiiSoXibTqfHwBct26lsSRIwm6dkIP6I20
   Q==;
X-CSE-ConnectionGUID: rzmEyD2zSPST6rGe00+MGw==
X-CSE-MsgGUID: PxB1XISQRhyWuCjJnCSfow==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67987429"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67987429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 11:29:09 -0800
X-CSE-ConnectionGUID: G1k7WxpERqO1ohxEPklx1g==
X-CSE-MsgGUID: 4uCJsPUSRk6JfahzvocJWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198285114"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2025 11:29:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVxCs-000000001AX-2Jae;
	Wed, 17 Dec 2025 19:29:06 +0000
Date: Thu, 18 Dec 2025 03:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/tty/serial/qcom_geni_serial.c:1592:9: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202512180323.qmaPzod3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 710fd74d1dbb72c237548032941e84771551546a [2/2] FROMGIT: tty: serial: qcom-geni-serial: Add support for Hibernation feature
config: arm64-randconfig-r132-20251216 (https://download.01.org/0day-ci/archive/20251218/202512180323.qmaPzod3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180323.qmaPzod3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180323.qmaPzod3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/qcom_geni_serial.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   drivers/tty/serial/qcom_geni_serial.c:479:13: sparse: sparse: context imbalance in 'qcom_geni_serial_console_write' - different lock contexts for basic block
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> drivers/tty/serial/qcom_geni_serial.c:1592:9: sparse: sparse: Initializer entry defined twice
   drivers/tty/serial/qcom_geni_serial.c:1595:10: sparse:   also defined here

vim +1592 drivers/tty/serial/qcom_geni_serial.c

710fd74d1dbb72 Aniket Randive              2022-09-27  1590  
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1591  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
b1f84dd321667d Mukesh Kumar Savaliya       2018-10-16 @1592  	SET_SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
b1f84dd321667d Mukesh Kumar Savaliya       2018-10-16  1593  					qcom_geni_serial_sys_resume)
710fd74d1dbb72 Aniket Randive              2022-09-27  1594  	.restore = qcom_geni_serial_sys_hib_resume,
710fd74d1dbb72 Aniket Randive              2022-09-27  1595  	.thaw = qcom_geni_serial_sys_hib_resume,
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1596  };
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  1597  

:::::: The code at line 1592 was first introduced by commit
:::::: b1f84dd321667d07f08fab99d042f1e39e9ee5bb tty: serial: qcom_geni_serial: Rectify UART suspend mechanism

:::::: TO: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
