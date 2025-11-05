Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBD3126A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762350530; cv=none; b=kyQfN4IoUxl/jkbktYD+aIiOgQ2q9uuDDpqZNUbvJkmvHK6aBLcb6hCyfYe3AoaDrCh/UKTGCwf4iWLSmuu08UYhBxizolZo0I+v+JkBCMm70pTcdyN5fXIL0SWDQde29AWX8CRMS6LOtvL8gY9b49FPNtU3LXgt1Lrkp16GNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762350530; c=relaxed/simple;
	bh=udLE3B3JDRmNnR+H05vBBuUyv49l5u6pkBVKGqKtYV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9VydESK0a/cMdSuQkIH0wBjhz9f6QTOTaScFw6an9wWdLYoPz6HRA1n7sFL7AImlofU4/5xCKqcpgHV2Q4IsjrFrUBM5NVys+1T2L7qcfyJK4m/3VV1LD0oCZmqW21sfDWrra3g08OkcuwrQ3fmGt3jiwNsLuAiVd4kiPkitFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFKy7BvX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFKy7BvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762350530; x=1793886530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udLE3B3JDRmNnR+H05vBBuUyv49l5u6pkBVKGqKtYV0=;
  b=EFKy7BvXFU4dyWK0HbtQ0BIRFzvX63Amj9L2ToUKOAFsK4dJycMNK5as
   POloZMmtss9D+mBM0N8HPjwf8lAVQMv+4XBSXHFA/yEgQAbkld3+ZCGYy
   +Zb3lIYco0ADAc2ApIFhc2Wbbmdy/y9dqsOW99LBJ4IcaH8OD1M6kpW1S
   t0u2BNd5yLcInx8F5jXtsu9wSvCpODzR91woa5L2C/WmNstKxjDUdZDK0
   SugGSFU5Lov1lZZBSbtYdJRTmWAJP+QhAx6dvn7twthnQSl0yA/3IK1/c
   pcj/0TKp1AzC3PW1qsWza8PtMmzkjc/Xg0ULMo0AdKcaciWBUnIfIW1aj
   A==;
X-CSE-ConnectionGUID: Bw8KM2YsS9mhJPo6V1W0bA==
X-CSE-MsgGUID: /P3M0Ob1RFCEVQtM7kAD3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75579130"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="75579130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:48:49 -0800
X-CSE-ConnectionGUID: +6RuRSK4SOiLwJG/hggkmA==
X-CSE-MsgGUID: emr4s9MXTbK0iN2BNZuZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="191815122"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 05:48:48 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdsA-000SdY-2Y;
	Wed, 05 Nov 2025 13:48:42 +0000
Date: Wed, 5 Nov 2025 21:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [linux-next:master 5625/6507] tsm.c:undefined reference to
 `find_tsm_dev'
Message-ID: <202511052112.OWG4sAep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: 3225f52cde56f46789a4972d3c54df8a4d75f022 [5625/6507] PCI/TSM: Establish Secure Sessions and Link Encryption
config: sparc-randconfig-r113-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052112.OWG4sAep-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052112.OWG4sAep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052112.OWG4sAep-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/tsm.o: in function `connect_store':
>> tsm.c:(.text+0x88c): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
