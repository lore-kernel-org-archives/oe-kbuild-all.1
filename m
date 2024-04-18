Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BD63D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 02:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713407102; cv=none; b=r8nxc1SAQO1adFEcKvexP3GYU4B8TNWDOgnr4gEuR/1/REOxg02iWUFT0JiU1qS6ZNtgY58bMABm7IBioVxoxLF70wAEtdHs6Wke2dGIB3egPIBHb+DRfY1KXd37jAZWc/TIr0v7fk/oxPdApO+jwxLv2QPdPTUaxZMkm2pP5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713407102; c=relaxed/simple;
	bh=cJ7tg54n97tEJmCLbg4S++t7xI1HP/VCWNhiNYfXxkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nikf4v4CKPr9hxux25g86zzz5/1PoJc0PO6qrelKAhlCRpmdIFOIkFUa+354mWZCjRWQs5JBfVIg2GbfT4+YQhzSkcbr3PG0YiKOhrdz7jvEYJ6/9SXYnrKS5IHCC1gZGpPONh3WHTuh1qiE4a2LGpMXtlN+8B4ZmAQzBeUFPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5d0ryBg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5d0ryBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713407100; x=1744943100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cJ7tg54n97tEJmCLbg4S++t7xI1HP/VCWNhiNYfXxkg=;
  b=H5d0ryBgf+1R4fnRxJ7uTT6C8mIP7j6hnFa1sJCrzjoZicbmRCcbEzGt
   /go4StoYNJvoy0/23Yx5p/Sc9rSHZwDdAedFvx790sPkrTrSVJjW0GiYV
   5qQxFM2a0KuHCcscLkY7jYyOxpBBH3AMjEmsEI3MUFJAIOc747kn4OFub
   UQhdSzPAnNhY37upKEiy2A1DhLALk5R70lKMFdJ5OMejxtOXsxdTN1/ro
   wqoJA1ZBS9qd4lR1dWhHGmd8wmphKK6tWOEGE32gUZCHypLSNnCJ+/cFW
   3Z/NmI7PgdIqRpaAVh5fyxoPXbzV8eqVSZl7CCx+G2/qSpeYBhLkiOfvk
   g==;
X-CSE-ConnectionGUID: l9SgDMQ1SWKY8DFG0Aso+A==
X-CSE-MsgGUID: HhOcR+RZQfGGL9mW+Cpp5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20077867"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="20077867"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 19:24:59 -0700
X-CSE-ConnectionGUID: nJ6z/qB7Rsq2qiE3DAn4MA==
X-CSE-MsgGUID: 1oxg/8LuQTu0Y79Q8F7LAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="27247903"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2024 19:24:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxHSJ-0007DI-21;
	Thu, 18 Apr 2024 02:24:55 +0000
Date: Thu, 18 Apr 2024 10:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7446/7460] shadow.c:undefined reference to
 `__memcpy_mc'
Message-ID: <202404181005.qXZ1fy0q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03d68844d934c811c7becd178e1297db3a65ad2b
commit: b991780c836ceb9a479c6c6e385e914b487e353a [7446/7460] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-003-20240418 (https://download.01.org/0day-ci/archive/20240418/202404181005.qXZ1fy0q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181005.qXZ1fy0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181005.qXZ1fy0q-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
>> shadow.c:(.text+0x4f4): undefined reference to `__memcpy_mc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
