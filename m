Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3388E1D5ACF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 03:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737688477; cv=none; b=FGQluO5bS8DK8a1QorlYzouI6wZ5eSQy3uH7RkGi3xZxqf7BIi8j6qJGQSHavzX2IeGwLreVcjE9nSMi9i03ApHbcT7NRY6diDrnNCx3/2XXYJBiMhypJmczwTyu3wMxs9dFvBy1Qz/VdfyyRj4se+k6DcY4lEXoKRRC+fk6Ghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737688477; c=relaxed/simple;
	bh=XNg9Y8h4jD8v3CB6nd8AB0H9z3Sj//OGVt7kNaP+edQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeWGJWWNmmwUaSm66H13WW5WbuUS6sQm91ryTuxm0xdNffitqEgcyc4ZqNEX2FcFtBrZ1rV8JFFOYWuNHxYvLPn/fQuNZ7Qm1/e1ETEsSwkNzxkscpN6X0KAAOTfZqhpLxU1741P6DYJvIxH5SXMG4lkSNaL0RiVURjp61BqVcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNkuKy9j; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNkuKy9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737688475; x=1769224475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNg9Y8h4jD8v3CB6nd8AB0H9z3Sj//OGVt7kNaP+edQ=;
  b=RNkuKy9j2ZlSM8e8pf5bBPjWFczh9b4SVzycg8W1duXE20kiT8Y7rlp1
   cF1fAzarC9QE+es8O9e7tKDHtIyBmHs8+9fefYVI9SgiVmsPgyetQB5xN
   DOQU+pwU/3Soa5Gcbss9D7mlUvWT0Iqc4sHmB/DxaTody+A8RbtLAsTxw
   1oUzX+TfC1ZapWTlBqtPKsxun7ET5Vl9niLw7rzWpgnC/StfVsQFgGSsx
   xMY3Ckfnni7axjC2QEFr/iwQsFaN8SbTFdcKqtBsWtRXnl48g1WYZhc93
   XqQBxzrApUFmzusTt9VYoui1XlxVUjIzgpPpENK6hCNV60O02dZszm0pB
   Q==;
X-CSE-ConnectionGUID: vcJeiYBUTzOki9FOYCx99A==
X-CSE-MsgGUID: Z/FhQoA0SS6GM8++H1w69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55630806"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="55630806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 19:14:35 -0800
X-CSE-ConnectionGUID: lHPm23DlRaqzhvPVNLQInw==
X-CSE-MsgGUID: lPl8Rc9YSZ+42guNji1RfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="108189947"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 19:14:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbA9P-000c4F-0m;
	Fri, 24 Jan 2025 03:14:31 +0000
Date: Fri, 24 Jan 2025 11:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1841/1841] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
Message-ID: <202501241145.0VszUKpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0d8e54dc50aa0f24251fa184377667c7678ae510
commit: c5a4bf91167c714de74c47f5cd6d888c66e9860d [1841/1841] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-kismet-CONFIG_RESCTRL_FS-CONFIG_ARM64_MPAM-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241145.0VszUKpr-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241145.0VszUKpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241145.0VszUKpr-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
