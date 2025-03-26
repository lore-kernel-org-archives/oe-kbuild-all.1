Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07055482EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953253; cv=none; b=OHb3lDRcHLwr6sNl/CY1LXlGYOlFQtKmw+pfoM+4CB7LaE9bFBlfRacwa4gxc1QJuClPhOjBTCtyOl/S0g2YHW86H8qeW8GX+MKskYbh2GmCSgF5RBrNKi4/ZUfCAsYK+Ydun6/dnp5CYVdUcZUj9zY61CVqx4uqw84KlFziDPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953253; c=relaxed/simple;
	bh=S0g35Fs2Y++pHvvMmhTworF+BpbZeNpFdRwZ9PJ99fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8V0S0bmwkddXX6Ckv682TRqo1mx8r45vmNfxadkW3feuyHUr/2e+/VZTMdSXdWOpBg/YRkbgPifx3WWeJKw8/0t4uXadehhyA9LglpAYcV6PDhcBfYH8cmNvNhDDAQYtNu5AwQBI7JUAdxAzLWfj4ao36Xaq4qmfY71ZMizGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdMepHbu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdMepHbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742953251; x=1774489251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0g35Fs2Y++pHvvMmhTworF+BpbZeNpFdRwZ9PJ99fM=;
  b=KdMepHbugXPSUakr4xcnWzmIsaSsgkgU7YnfHpGfp+BdzpclQ6T5IGDX
   bNCNjIN0yuIhJg0dFSNS6k8/Fh/ZEu6c1ZDZ5A1eYjw4UWelAT+u6DOhK
   R4yKBRaRbIEq8P3gXaWrfZjFs1GScvYtn9sbPSyiwG1+GDvMjqhSmT2aB
   PUVFsnJPo+ScGBTiBHnu+QiSB8VFPOMwYmzes6iYFAdf5KwIOzpUjAMsG
   IgML1raNmndSEaOOhfHWDakXDHaNSVe9LRrSFaBjFQZoqrmzq4uhOVjGb
   eVUqqifq55Uu8hGpVBRfWXohTh44ZeuUolhDUgHNhuGCcCIkIDeRf0Tdy
   w==;
X-CSE-ConnectionGUID: /QcbHXPNSb2P5YYQqe7IqQ==
X-CSE-MsgGUID: TBbtVrTzTfa3C5B8e6KXEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46962805"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="46962805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:34:46 -0700
X-CSE-ConnectionGUID: I2Hk4hWGTsugNiSLQN2Qjg==
X-CSE-MsgGUID: P67GD3+hSEmbWqEbtGOlmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155479559"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2025 18:34:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txFfG-0005Mm-1J;
	Wed, 26 Mar 2025 01:34:42 +0000
Date: Wed, 26 Mar 2025 09:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Nan <linan122@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2821/2821] block/bio.o: warning: objtool:
 bvec_alloc()+0xf5: unreachable instruction
Message-ID: <202503260949.1ZCW1y7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0d616a77cb5f7198cca524a24f717f59ad51b41b
commit: 958384da6a734ebe7a49d0fafcea86968390e9d9 [2821/2821] block: use bi_max_vecs to find the bvec pool
config: x86_64-buildonly-randconfig-005-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260949.1ZCW1y7H-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260949.1ZCW1y7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260949.1ZCW1y7H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio.o: warning: objtool: bvec_alloc()+0xf5: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
