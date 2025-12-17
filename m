Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3233B6EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765962868; cv=none; b=ItIk14I9wDraDuxo9jhL4dN1TqLN0TzXDC1Vfg5lnF5FIye/AipUJp+r/0r8erkUJzav9zsdDzIhK5jHa4BDbLeeKz9E8F7QGlWl6QnHujxb/Xy9ngUHQJbfyxHeJSZmwZrX2hKFswPpNizerUkizX0ONpMc4i86AXj4GM2ekqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765962868; c=relaxed/simple;
	bh=UMEw2NN+in6iPt+fCSG6+oKn0aMSMr7iD0vC3I6KozU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTPAcWuBiRC/opEzeAx8WylALWtEPjdTiXgxAPTc+n69hVyJgIDT9ZsuXkvqX6l20CtUjtDEl2bviN2HnSgo3By/tCVXGBpYnpfEEwKQn/2KuIVKvNMLF5vfkL30QFXwiB8O1g1rF1sufOK4BamOO2UafZz5MYT2g8ObktLqRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/pPh0rt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/pPh0rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765962867; x=1797498867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMEw2NN+in6iPt+fCSG6+oKn0aMSMr7iD0vC3I6KozU=;
  b=J/pPh0rtp1l0Ms+SZzZ+zY/ptSTba7XNmGIiRubJq/U8KLBYfBvtTjsa
   vGD6c1UvpZxbknOlg5DlosuWKH9Yk1YlkU219SREwNHhFuDjtlFjhLlyi
   tlwiXklWX5slamvqB68aVH3VtxwEM+7bI54FNjzKW/r0sBKbkc4eZKrVo
   WutjihlRnngHMclIYBpDwPM8lGZSB1HYrB36rzuRS4Hxhn0G32B202/qM
   K/emrMAAdQpApaMyKrf1P9rUByyBMkHtq27shIcljvjeHqhXk/sIkLk2s
   IRGq7cnBip+VvaFQtEQEKjB9TDAk6QKzOsoNnLcWXAV/GwHsxtLY13uj0
   w==;
X-CSE-ConnectionGUID: 1R4PyzQ0QJuKuM0M/5jupA==
X-CSE-MsgGUID: qDqdfOWKSmOznn60mGPwFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79350457"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="79350457"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:14:27 -0800
X-CSE-ConnectionGUID: oObDZRCEQ+yDim3arJMneg==
X-CSE-MsgGUID: xVj1yPgnQAiBP4BadA/aXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197536019"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2025 01:14:26 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVnby-000000000JN-3GJM;
	Wed, 17 Dec 2025 09:14:22 +0000
Date: Wed, 17 Dec 2025 17:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/tty/serial/qcom_geni_serial.c:1592:9: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202512171719.QE9RzNDG-lkp@intel.com>
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
config: arm64-randconfig-r132-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171719.QE9RzNDG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171719.QE9RzNDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171719.QE9RzNDG-lkp@intel.com/

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

710fd74d1dbb72c Aniket Randive              2022-09-27  1590  
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  1591  static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
b1f84dd321667d0 Mukesh Kumar Savaliya       2018-10-16 @1592  	SET_SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
b1f84dd321667d0 Mukesh Kumar Savaliya       2018-10-16  1593  					qcom_geni_serial_sys_resume)
710fd74d1dbb72c Aniket Randive              2022-09-27  1594  	.restore = qcom_geni_serial_sys_hib_resume,
710fd74d1dbb72c Aniket Randive              2022-09-27  1595  	.thaw = qcom_geni_serial_sys_hib_resume,
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  1596  };
c4f528795d1add8 Karthikeyan Ramasubramanian 2018-03-14  1597  

:::::: The code at line 1592 was first introduced by commit
:::::: b1f84dd321667d07f08fab99d042f1e39e9ee5bb tty: serial: qcom_geni_serial: Rectify UART suspend mechanism

:::::: TO: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
