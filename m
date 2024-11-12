Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8D1F669F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 00:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371711; cv=none; b=MrcAJth/2/1+lMaDX8j3sYpVIM91nsUKL6YB0lifNeCMQ3CU9K8kOMLXMfeUpCXKg+zQCvlSmaFSuYGaTG54sP4CDtYYvIT76j7UfEVvg/O/SBzPZv77LC6ul8zHhZO3U+zC0263NEOgSQno7lZju7TTLZGLARhfoBBEnLxR0PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371711; c=relaxed/simple;
	bh=7JkULZNGXEb5916m+PaSeVdiEvj0kGUZGAARHwletpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHBPfQvNXEMYuO3rGz04S6goCiXMiiY3JyHpx8OlahnR3SM/70oS3Lydzket/cUkQtDLMtPzT02Q7DGMpBNlSXiEpuklNxwrJ1Bbz4jVXVq7fl9jGOJHW1WOjRpf15bK55pURK2RDJ/gwBvpV54NRFyGKDqcMsDjCT2zi7FlI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcHnb3jp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcHnb3jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731371709; x=1762907709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JkULZNGXEb5916m+PaSeVdiEvj0kGUZGAARHwletpU=;
  b=OcHnb3jp1d50x1RxkVRXrEgCery/vlChl6nvDbW9UP0uqp+3fa7Cc6Qr
   ajDB8VbpmI3KjyJxNz6+Up9hixMEgT2lyuRjWBnzY+5dyTgz6Nl3AsB6d
   4Q+0GaDBeb5I2bga7aQUVYZuT+czLRGRTo4Hhse6bDrR1TUVpTT53OSag
   m2BSKJHgmC6/lNGRbG9l/rcmRQFs8EHx6N1ptGxM9BUZyKvbftIP6cWkK
   qMx0kHA8/7FDX9YFKMVcXKtkXRNm6N8szD4JhxQ7s6nQ7hXs5TFehENJ/
   2N3kjNKDzPnunLCIf1kZ5hLXhV7d5eNWLyX6P3x4KcdDQZHACsZAu/Up6
   w==;
X-CSE-ConnectionGUID: /2+zXeFkTUCzo7vwHM6sBQ==
X-CSE-MsgGUID: G9Lf1G1vRtSIGoe9FWXu/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48647982"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48647982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 16:35:07 -0800
X-CSE-ConnectionGUID: AKhpKvOFTsSFBLKXjZp8eA==
X-CSE-MsgGUID: c1IrfZ5ITfCrTimuThjOqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="92130253"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2024 16:35:06 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAes3-0000I0-2c;
	Tue, 12 Nov 2024 00:35:03 +0000
Date: Tue, 12 Nov 2024 08:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] ld.lld: error: undefined symbol:
 kernel_swap_enabled
Message-ID: <202411120810.GiSJ2Nae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liubo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf973836a0d3e07d47c4005e1c6d32a27f35b2b2
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [2417/2417] etmem: add original kernel swap enabled options
config: x86_64-buildonly-randconfig-004-20241112 (https://download.01.org/0day-ci/archive/20241112/202411120810.GiSJ2Nae-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120810.GiSJ2Nae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120810.GiSJ2Nae-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kernel_swap_enabled
   >>> referenced by vmscan.c
   >>>               vmscan.o:(try_to_free_pages) in archive mm/built-in.a
   >>> referenced by vmscan.c
   >>>               vmscan.o:(kswapd) in archive mm/built-in.a
   >>> referenced by vmscan.c
   >>>               vmscan.o:(node_reclaim) in archive mm/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
