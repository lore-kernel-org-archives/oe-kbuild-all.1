Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370321E25F7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741469294; cv=none; b=lBzRlHHbxYp/PqztigoSB8C1Z/yRXUQ+tLXF0nVzuiqh8fZGbePseSO7NFopS1gTSrdrwD6I5T7dwwPci06x1s080O3DBirqnrw+6ykqAYNolWow4x/kQ+bPlhQe4Brl2G6NHUjkc1NICnk6pMTJLVTq+sNTWAg22EMvKBsEQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741469294; c=relaxed/simple;
	bh=3xHubNXjfuRR3o9klGIVWUu2Iya5Kq7P9eRzrAo/WMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3wHbrv44Z1TS1ngrxzxuvDkGU9G7KvNO2rwHgrijZ2SZWG07SaReW/NdOBbrbyP8E9Kt6cxH5q+ZcUud5Kb0GItVhMovYXOVykweuchPCZCdWkwh18I9x1pqOflP2ekzmBKHzHz6ZMvp1ECNcpkoPQEJ0Eyjlz/PD6o+0E6/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lo30/JYl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lo30/JYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741469294; x=1773005294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xHubNXjfuRR3o9klGIVWUu2Iya5Kq7P9eRzrAo/WMA=;
  b=lo30/JYlWw8XAV4zlda2vZPkPWLOzl3M2h31YAJ1LbZsD6stM6aUlsb5
   olM4HD7XpB2C1nfE6WXKDFIch0PxERQX5+E73PgmcmbMN+bu23+WBGCiv
   8nyO4e+tthLf2vfxKuROVu7s3oRV9Gv5aKWm5XT0iNYbb+YPszaim+6PU
   CGHIqOy7q62RzZS8Qxq2o3m4+KGLQmWKEgNJKckwuI47miS7ACMOt9NYa
   E0Ey17WmlnZ3myG5bdgZ2OxY5EVaZpzU5eAsQxw9/uOveCe1eIGLc3P1B
   AqTjaRIYjVI+AqbhUPT6VX5GsAiQ+4aF0K7MWqvULVotHAX5pbXUejwcE
   w==;
X-CSE-ConnectionGUID: lsxaTV5KS96bM+2Zhzr0Yg==
X-CSE-MsgGUID: aLa2fhpgQz6M25e+KDztXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="52706492"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="52706492"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 13:28:09 -0800
X-CSE-ConnectionGUID: Pqtdhlx8SsW+kIiMv+bZ/w==
X-CSE-MsgGUID: Ayfindk6QTukk2IMkNOZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="124226434"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2025 13:28:07 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr1iH-0002Ks-0r;
	Sat, 08 Mar 2025 21:28:05 +0000
Date: Sun, 9 Mar 2025 05:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1461/1461]
 drivers/infiniband/core/.tmp_uverbs_uapi.o: warning: objtool: missing symbol
 for section .text
Message-ID: <202503090527.cCPBJlcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1584a68cf2ef23ac87ba506e8ab8ca7e261813c1
commit: 0a3173a5f09bc58a3638ecfd0a80bdbae55e123c [1461/1461] Merge branch 'linus/master' into rdma.git for-next
config: x86_64-buildonly-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090527.cCPBJlcO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090527.cCPBJlcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090527.cCPBJlcO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/.tmp_uverbs_uapi.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
