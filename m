Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D54BA53
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735450734; cv=none; b=Wja0xliI+15STNx1cu+GRowxbfz1SoGtEJ7v1wC0l3lhRk0KuDuUjASOkYgDBEsiINYLGxEC4g1kqUb7OqBJf/eS75c34bc+44qZZm0JnkBoNzlEWujAWQ8vQ3uwifZ0xEmrDImmx6Ib1gU2ytmBmBhftnEYSzgD1tFQhpMoho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735450734; c=relaxed/simple;
	bh=U/12NGybEoVPHRoLg51lFQMJ4oNHEuMhjdngtJKTdEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKG23bxHL9Ycj7j0V6Ao7yljL7DBjPa2BLZ5EyEqYXmXlwDaHBowfJwjytTXtsTPesZgBKeUtrUQz0PEQhqTCW7nIe518jRu21pFuG9jMR6PMpqmsNp6enRMJPCLzUDPr+hxjBaP+672x5YsTBE6TKhoJ8CHIeIVZvpHjmic0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBc/9uMi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBc/9uMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735450732; x=1766986732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/12NGybEoVPHRoLg51lFQMJ4oNHEuMhjdngtJKTdEA=;
  b=kBc/9uMi57ZpxZPyyd9i61/ixEWyvo2GrF+d1FGAimpid1v7QXKd+EI2
   Pu/gfC0kJTOVNrNJLVfxHjb6Yg+JNSEAxXRFUdx4v2k+HnY5+Ji0nTtwY
   luUgXR6cpI555kaBk45dihiD0LFzDDIZGKjoa+L5MoTIRMV+U7NCmtbzO
   Ui4ihzqQyYqKvD7RU/wsh/Oy1BjVAZF85f/qufixN9prES3Lmf29NsQda
   KZ9lu37Ea1TnWLsKtFPSc4pkLdqaxk/2XOpxxaGmY54nnyMyd7QBxa7VW
   /DcTjIHrF8lJ4NnbNjRr3qM8GcSlCFgHeiiksdk6sL1FmubmmYqel2JaV
   A==;
X-CSE-ConnectionGUID: qQNmeP4gT6uNsbya5RXsYQ==
X-CSE-MsgGUID: FR+vZsbUSQ6sJvhIql926g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39714071"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="39714071"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 21:38:51 -0800
X-CSE-ConnectionGUID: FD2BEaUnRPuYg8XQDTfQyg==
X-CSE-MsgGUID: bT+3fhRHQt6JNh7YPV4Bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100868767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Dec 2024 21:38:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRm0m-0004V8-2b;
	Sun, 29 Dec 2024 05:38:48 +0000
Date: Sun, 29 Dec 2024 13:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/dcache.o: warning: objtool:
 dput()+0x7fe: unreachable instruction
Message-ID: <202412291332.ZZ1UpSAJ-lkp@intel.com>
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
commit: 54abad829e47a4429c491486bb2d8da79de8f5b9 [2589/2589] fast_dput(): handle underflows gracefully
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412291332.ZZ1UpSAJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291332.ZZ1UpSAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291332.ZZ1UpSAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/dcache.o: warning: objtool: dput()+0x7fe: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
