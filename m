Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E512BF24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 04:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274351; cv=none; b=Lo5KJKJd17Jax94hCyZQLrXxt0hk/B80lNYzYwrCd5rKbpu1PzE5WBCRSLx2p6G2jpmQ2iwv18fK5hhWOuSckq+nm5/6DS0RXVZXXnPnM4W/RYSmcp57EwATf0rr1WPnyLz4bkFo4KJgW9tIIl7Mjaovsj3Hu8qmHpZAByzErxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274351; c=relaxed/simple;
	bh=HkLr2/LEjh39YQPnbvHRXcrxUscaO37EEHtc1aVwzw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuEcRNToeO14L8MMjxfV2UHP/4WQo6+Cplkyn0C8sJsd0AmAKPKmOHsWr6BGrLN/C1HvovXtJ3v79TY3+3gqJLlzfyg2wA/4MeGXnTt6V8euqjwHm5ZQGT71G/1NZZI4HhojW3LBhLwcAkcwM6qCz1q1Fl7Kn2NEK0RYhOIs+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBQM1i4M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBQM1i4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735274349; x=1766810349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkLr2/LEjh39YQPnbvHRXcrxUscaO37EEHtc1aVwzw0=;
  b=QBQM1i4MJ6bdUwhjGBtb8grdDZtlYEVUsbPpoVJeYUGN3jKMbpQSYxOD
   7YUpfYTWkTeKzL+efW0v1GHLT1v6t/LqptnTLYji4WYt/ikX9R1UCDHqn
   rROkN8leV2D1NZMHvg6+9fHnLNvXO2W+MoyfA1rnHY39peOD+Es0iVF/K
   RgC7KlUTEi/fUzg5Va2hq50c9fGbDneDr9Ub6y5u/ahPyK3GIjB+v9L/O
   Udyp+DxEY76dB/BAONU4NEOMgFC5ABJbp1YYm3sgGj7A5FjMGi4/+Zf++
   tY9eidMH3YxsCeFn0kUl1YCo4/kA5W18VVnNK8BsbP0TbueeQJI/WlBW+
   A==;
X-CSE-ConnectionGUID: 3Gdaj0fIRYWy4B1qOwHa1Q==
X-CSE-MsgGUID: pFYH2MOKQ+aWc6AMRGSCNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="35397069"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="35397069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 20:39:08 -0800
X-CSE-ConnectionGUID: F8ZELWHSTlCl6jZbM6crdQ==
X-CSE-MsgGUID: rlZ90Z2fSzOj0gXoU/3ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100912574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2024 20:39:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR27t-0002yR-06;
	Fri, 27 Dec 2024 04:39:05 +0000
Date: Fri, 27 Dec 2024 12:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jian Zhang <zhangjian210@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2600/2600] arch/arm64/mm/init.c:730:6: sparse:
 sparse: symbol 'ascend_enable_all_features' was not declared. Should it be
 static?
Message-ID: <202412271224.evPeUzDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: 66ae8ddda388386daea0623a65ea2ac85c24ca00 [2600/2600] ascend/arm64: Add ascend_enable_all kernel parameter
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271224.evPeUzDD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412271224.evPeUzDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271224.evPeUzDD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/mm/init.c:746:9: sparse: sparse: mixing declarations and code
>> arch/arm64/mm/init.c:730:6: sparse: sparse: symbol 'ascend_enable_all_features' was not declared. Should it be static?

vim +/ascend_enable_all_features +730 arch/arm64/mm/init.c

   729	
 > 730	void ascend_enable_all_features(void)
   731	{
   732		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   733			enable_mmap_dvpp = 1;
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
