Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91F234964
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742926092; cv=none; b=A51VutIbz+0roB93yD5Z0aIL6lbMo4kxZJAU3Fy2frYGBR1mVmlY8p0172rAcMxUNcl39HJdNVuOMZHzzt/GOyA4gWEU+9+EDp1wL6IxJfNiHeiCjO/62lgxYc2Lzy47Suv0G0/kIIatDacUsySi8PYamIOiC3wAc+cbCLZB9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742926092; c=relaxed/simple;
	bh=ICx+0SgxyqIi5nXdsHWnbbvdNvgBtLaR1o9223L6rI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAzj7nFHULbhSMo+0lEQqqeKhD033FF8roRN6MOworBOsLIwR4gwUljIXIuKod42jXu4+NKlQaTFzENL0oR7krWxNdPa+nkW9hxf0Ki4z5ZUfhiClqy3arB1d7cOMgwN9s6zN2NTajlivh3mchjF1O4XGWJWENpVsS/KqrsoDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcn4c4+J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcn4c4+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742926090; x=1774462090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICx+0SgxyqIi5nXdsHWnbbvdNvgBtLaR1o9223L6rI8=;
  b=Zcn4c4+JxQvaMJOK2ReTKnigQkFj/ZTBj2BbK1/ZyGb2RyP9VN4sPewH
   45Mh9jAvLqQbZiJTcQHGq4T2Db8JQFq5sFrU/UmDrnhBTChRxKsLxGjbd
   yiJRfNnXy6Rf+/9d1D9gRJC/kA6owxi1t1Z1qPtaeY6E4NqfJ71QSi7m1
   VqwIcmfFUk/wWUmxl7AFIsTTTU3pxzlIPknN19kdafXXQ7Le8YfCbrK/b
   cya/4W0JLLaLb5ZQ9uIdJfMI+emrbx5XfRSPwSmbysIttD+pfPGEtbQ1S
   yDK0yjP79Lwpd5CYK9MYqha0HDU+srhtDo9n7pObxkE8wEiWi1xhiA1gh
   A==;
X-CSE-ConnectionGUID: f00s3Tt/TGmR2ts0hEGtMg==
X-CSE-MsgGUID: +LFIhSqLR6yNUoZX20Z+og==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43425223"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="43425223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 11:08:10 -0700
X-CSE-ConnectionGUID: 1gaNQMG8Sx6ohqBVzYZ2qQ==
X-CSE-MsgGUID: aIPJ8BWoRCWy0IwYQCQh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124261611"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2025 11:08:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx8h4-000551-1k;
	Tue, 25 Mar 2025 18:08:06 +0000
Date: Wed, 26 Mar 2025 02:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2821/2821] kernel/rcu/tree.o: warning: objtool:
 rcu_iw_handler()+0x9e: unreachable instruction
Message-ID: <202503260202.467f83vo-lkp@intel.com>
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
commit: 44a47613c5cbb589453938cf7bf355d8043fa53f [2821/2821] irq_work: Cleanup
config: x86_64-buildonly-randconfig-005-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260202.467f83vo-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260202.467f83vo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260202.467f83vo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.o: warning: objtool: rcu_iw_handler()+0x9e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
