Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC908A50
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431733; cv=none; b=UKlyj+rrmcqG2MmTZ4P19WA2k5auukUgtFe0VWB0O/V5jReJtQjwzSMJ7G32QQrBO30U+k6s7SRYp5d1Poenz2YTpOFwXIoepGBA6gvycAWQQ+SQnoFrbQ4wYeLdXIcPi/U4Ih00GpCVDwZ7KKSjVl98dJ9+vSJwEh1NDnrt8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431733; c=relaxed/simple;
	bh=xxI13GOtaAnqvobVmLd9etcNnetMPEwxd/DofUeT2hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1KHC17PFQqnDNDjocO44Sy+sPF5I4IM1YuH6XPHZGEgXFPv8LjuWqMMZTk5/0tzVHjnlYTbmnvGkVi1IWvh2JyK++ubmniwjkz6623Qf/rntdnuNPcpvbX19orMQm3n0kqFW4LkRRYiyyh61RLb3mb3Oxg2TBx8acz1/8rT+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZ2Hxs3Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZ2Hxs3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735431732; x=1766967732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxI13GOtaAnqvobVmLd9etcNnetMPEwxd/DofUeT2hI=;
  b=fZ2Hxs3Q0323IBfJG15duEHmLF6izm8AqvZSGQEfvb0AuEpfO1iYEgpy
   TAsT0z+13Eahvq25Gj/lKmu1pBLiinEVys/05cF+fFy1rj2gOFwEDXCJT
   cEEh9Wdjfxhb4wN6wNTteWgYITgpHiwxDIv1t/51OrVP39NS1OXUcjwYo
   XjgmBB3Lkyjli0I0ILwChSeKPOMHyr48+sR+OP+1xYT0uW6YEHkKXHY8M
   CEVc8415Xiv4hRLgqVnH8DzgLAaKjyJ3vY/4oGkWrsKKDt2GKqdmORgaI
   g0hAozG2aEY+VxlOy5ns6daYpP8YtPV/ztS6pMDRs2CGrwzeCoYGxBdR1
   g==;
X-CSE-ConnectionGUID: kJ3stmLAQR6euNVTVDX6Gw==
X-CSE-MsgGUID: 7JCGI4T9T1iZJ2BzhEfgTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35673949"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35673949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 16:22:11 -0800
X-CSE-ConnectionGUID: byHBlM5xSyiMB5IbaZd4Ow==
X-CSE-MsgGUID: 7ixuXZ3eRkC5JalkGzcR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100831795"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2024 16:22:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRh4K-0004Oi-1F;
	Sun, 29 Dec 2024 00:22:08 +0000
Date: Sun, 29 Dec 2024 08:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhihao Cheng <chengzhihao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/iomap/direct-io.o: warning:
 objtool: iomap_dio_actor()+0xde: unreachable instruction
Message-ID: <202412290825.A4xfCPjV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: adad6411399ac34c26ff8a07233e0ecd8cbb86f7 [2589/2589] iomap: pass a flags argument to iomap_dio_rw
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412290825.A4xfCPjV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290825.A4xfCPjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290825.A4xfCPjV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/direct-io.o: warning: objtool: iomap_dio_actor()+0xde: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
