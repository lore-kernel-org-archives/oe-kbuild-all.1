Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E639FD9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732551805; cv=none; b=k/l3dskbQOvt/ooj+z6LpMmESfzfdNkawunU+KoqxXx4dmh3U9N2IGIoHlKKpUJ2tQTZJ6TClkptDkF3zaEU0xWI54ceH4q7k5Q/Q+Hy1Cji/9zGDKInUG3cSQTrrvpK338U0oyDjQt/xc0EsLvVyIGZ3FuuVxnIwtENirPyWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732551805; c=relaxed/simple;
	bh=sxyINQhNAS+DuQP2Ca/e4Ts0NZEAgnv3o6ShsFZ2MZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bhgas6i6E+ywsNrkLxFKZ5Te9MlGxjMzs7mPGvI8CCd7NaCpRvbvpk/M2r38LWy3scvnEj5HYwkxTo3V4tPlcHEU3l17xWnJSp0ZPtqdxP/8Su7UPGb05wkgT5GI2vL/XBqO68QScNS42QkCkzO2/TM1sPs6LU6ECimRhF/bj9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8hQJdM1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8hQJdM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732551802; x=1764087802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxyINQhNAS+DuQP2Ca/e4Ts0NZEAgnv3o6ShsFZ2MZY=;
  b=k8hQJdM18Vt4Ezuw3bdl6firKTeK0B5uPm6JjoNETEfpgv9W71WfJY35
   MblKcFnycLJ/Jbo77CyzpqyaD3FYfam+QQoH5mTLuNXlnV21OGrIcg+zb
   j/5KHa/tgf9c65DhVPA0X5JXtH8JomYPf5BHFdWXd1WpOErgoWqAzjaPv
   wIJTRSLmL4eQiP6Ju+gCPttAqX3BKnUCR32LlAZNzkm4hzG2kKJXynSBI
   bpeUy+Dk/Div72qsPuj1XCE/jETGv5sGnEN/aVNYycr4AsaBr4nDEJezH
   syFSskpga6Ug2HEle6VFirJPR8xEO7aX57ZPmeN4I4mU3Ghri3Ac/bz7I
   Q==;
X-CSE-ConnectionGUID: VCB8RtUbRaCMRbww4YmbEQ==
X-CSE-MsgGUID: 0MQ6D3MwSDyXXF9/OC+L0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32528069"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32528069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:23:22 -0800
X-CSE-ConnectionGUID: 1U69BhHKT8yktKA9mOfCQA==
X-CSE-MsgGUID: uWDq3UTWQ3S6IitIZy1KNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="92113697"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 08:23:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFbrr-0006av-0G;
	Mon, 25 Nov 2024 16:23:19 +0000
Date: Tue, 26 Nov 2024 00:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Chen Ziqiang <chenziqiang1686@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match'
 defined but not used
Message-ID: <202411260043.JceIGmYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   48fd60600c1344806a27e3bb33ab33ec5a9fea7c
commit: 1ae9436b02e93f1f2b9cfc10226812197fbfcd04 [1291/1291] mailbox: add phytium mailbox driver
config: arm64-randconfig-004-20241113 (https://download.01.org/0day-ci/archive/20241126/202411260043.JceIGmYJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260043.JceIGmYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260043.JceIGmYJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match' defined but not used [-Wunused-const-variable=]
     116 | static const struct acpi_device_id phytium_mbox_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/phytium_mbox_acpi_match +116 drivers/mailbox/phytium_mailbox.c

   115	
 > 116	static const struct acpi_device_id phytium_mbox_acpi_match[] = {
   117		{ "PHYT0009", 0 },
   118		{ },
   119	};
   120	MODULE_DEVICE_TABLE(acpi, phytium_mbox_acpi_match);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
