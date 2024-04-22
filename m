Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E9515381C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804101; cv=none; b=Qw7ZscadGBPnB8T0fDGbyVagbC34BgdVSGDR3BJgTKmdr9FOhTuopbS5t3deB1NBQCbPAxBURYtDKQoWWhckY+u30rSCO9hHF1eisKL9UTmwF5S+fAy8mkZGeqPTSmHqZu/zf6RaaDRSPnrPSPigiP7yBm89rwjv8evp81hUkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804101; c=relaxed/simple;
	bh=KZkDYEg4KKjlYr0tlbhzbAZp5nctiB0sd71x/8WQUMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNOmYkyA05X4agFHAaC/WqDb8JX7GNH1eO5R2FVj8aS5PQyBYSSOMPMOzqbYT+WfDJqOv6q+lpoUhUNHUNELM2lgp6Fx9SX/Lo/RAt6W1ntu/5E2TENdkWzaZ42qpdJTgy6at2BMOBrM1mqRRB8vUenjgVpVOGxd1JcT8AmYMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWH4qzM1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWH4qzM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713804100; x=1745340100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZkDYEg4KKjlYr0tlbhzbAZp5nctiB0sd71x/8WQUMc=;
  b=kWH4qzM19fkborHEW3t3Pg1tF+eebEzuiQqeitZhj7Lmy5znoLWpXck1
   TvYer6viM4zs6xPAZy5rDS50QXRJN+EqVamDVSz5IdK+ckKQXABa6ABBK
   fEJuQmlEAtKBgzSdjtVO8qqPxtKQGjL5fsP6zh89kZwVX8+YSfNt3XJ3I
   DE9f5fH/raQxIXGD03KA5v6Bba45UnI/bZqlf/k0TfT3tgvLpGsz5wm5M
   61ZU3gXEqfvocDxt+nesm5tVQyRMfNV4MnXqzPfxS48CevYkF1fPPj24Q
   cOyUX3ioUXcOyrhiZEKEnHPeVANzncsnU+yFkRH6s5/qiMp5GaNctxubI
   A==;
X-CSE-ConnectionGUID: Qx4HRN7UQcW7y8VfA5AeLg==
X-CSE-MsgGUID: hH3Bm7eJQH6KPHNhFP+G+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20049028"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="20049028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 09:41:39 -0700
X-CSE-ConnectionGUID: /fSjH+rvQBiIK5aH1MsMgQ==
X-CSE-MsgGUID: m3hO3r4iRjOrVrvUBDfr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24143773"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Apr 2024 09:41:38 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rywjU-00007U-1G;
	Mon, 22 Apr 2024 16:41:32 +0000
Date: Tue, 23 Apr 2024 00:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7446/7483] ld.lld: error: undefined symbol:
 __memcpy_mc
Message-ID: <202404230016.B1zZMDXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e95a0071898084171841e9f3695a02fc5f58fd0f
commit: b991780c836ceb9a479c6c6e385e914b487e353a [7446/7483] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-002-20240422 (https://download.01.org/0day-ci/archive/20240423/202404230016.B1zZMDXC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404230016.B1zZMDXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230016.B1zZMDXC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __memcpy_mc
   >>> referenced by shadow.c
   >>>               mm/kasan/shadow.o:(memcpy_mc) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
