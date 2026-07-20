Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D158418DB35
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510614; cv=none; b=EDV6OEJWai/aQKHAOlB387Ns106vtF7KdJOU/5J57lhpuyot41irLmxtmhdjCYivOhkmx99FdSLfSIwwH2KSK1Cz23ZiwCtJc2Gy4/kYJdiJiFxi3WM0/nou3JK7Jhxcx3uF2tfrF+NcM2QIDdc1+HqJIU4i+oj6TXvfzhTlPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510614; c=relaxed/simple;
	bh=M8zEQB2KA+otWL4cgya30tZhAwNj9NfY5r7Ak+9Flm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lfNa93KKCWiB7ffej5OIJF0+B+NNkanJe4UfHSRxAFNq8naajjQXbtnXI6HrHXEribC6jV1yJVtt0Art2I6N15/0GQ94lzKU6nfQfT+2ouMLraABWlAq64rEATTJkplgmT7LD1qESKR8ODt+LW1xFY8Un8agSx+hseIMOzvKPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5ly2ah+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5ly2ah+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784510613; x=1816046613;
  h=date:from:to:cc:subject:message-id;
  bh=M8zEQB2KA+otWL4cgya30tZhAwNj9NfY5r7Ak+9Flm8=;
  b=N5ly2ah+gi2MXqaCqEIvoleIYVvao6rRIhXIbG/vN/YcH/WZnuIxOWAn
   b8N2ODlZ221iFKzlOHWH9mEGouw5oZuxag6ZiPBeCtpzV+P7zsbIEcgo3
   VKxFfbjWTLcFPuQft880BlLF6GKgrj3zpH14ogeB1aKMi9JxRPdQIGb2q
   qB5YbPmSbWOC2qwj2J8O31Q94gbyU1ohOIMdMYhW1IUmr+FyRiJ5tIowK
   xUN/vb1c9AW23rOgTocqDR0l7mOSZGDBHr1x54mmTzke8QrJwj6lwD5dn
   FJ5wq4Jym/2+8S5XIWOspStSh94+CFOVQNl3CnEhTy7lbRjoOnCn9vviP
   w==;
X-CSE-ConnectionGUID: I9r1sPqoR+qQy46erV4c8Q==
X-CSE-MsgGUID: ptvaSvX0TOybT19rhQiBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88986666"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="88986666"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 18:23:32 -0700
X-CSE-ConnectionGUID: 7gCQ9H8VT/mgiOqvcvBaNg==
X-CSE-MsgGUID: czIAmFOKSQGOW/2G+bl3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="295521716"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2026 18:23:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlcj5-00000000VrD-2104;
	Mon, 20 Jul 2026 01:23:24 +0000
Date: Mon, 20 Jul 2026 09:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 5174/7584] ld.lld: error: undefined
 symbol: devm_ioremap
Message-ID: <202607200814.svw2sCfQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 7bd52a0d456eef0243f508fc712e59c612ee7d45 [5174/7584] firmware: qcom: scm: Add minidump SRAM support
config: s390-randconfig-r061-20260720 (https://download.01.org/0day-ci/archive/20260720/202607200814.svw2sCfQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260720/202607200814.svw2sCfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607200814.svw2sCfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_ioremap
   >>> referenced by qcom_scm.c:2049 (drivers/firmware/qcom/qcom_scm.c:2049)
   >>>               drivers/firmware/qcom/qcom_scm.o:(qcom_scm_probe) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
