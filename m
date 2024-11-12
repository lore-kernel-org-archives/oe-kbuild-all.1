Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49F18BBA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731444973; cv=none; b=fygHjwREKfkZp0jWF0iHo9BVBzaRY7MkXsmNBBVemZPZ0n9awu1FeSj2KrldxdytEc4ijlfidmlFacAxGO3mWdMMJaF25Ob6FYcYHYyTmsvYLsUtlu+W3PR9aqizj4jBHDcX2YBSvus/22V0+oGB+VojzPj5HnM9doTHNJN1YJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731444973; c=relaxed/simple;
	bh=E6pjE9g2ibpdEZxhvT3j/Ng/6ct8uzbBXvlFc0qWcO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXhh6SD+CGEImx2M4xHBKAT7KpRPzOzqFJqTFGccDQbVpT7Tyj7pLTr/YJN35UwKcCUP9Y7OycS4vQ4SqhA3IuoKgmU1F+J9mFNMNwIU/9/abIuZXmvt/ypqmNE/z+ngrQcq3eZALw0O5sFOKdZJxGc5BnKMYamD8IovusNiXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDjqlkWK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDjqlkWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731444972; x=1762980972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6pjE9g2ibpdEZxhvT3j/Ng/6ct8uzbBXvlFc0qWcO8=;
  b=lDjqlkWKlRmwnWGed8mNutkreH6I8cAQW491de1x+DzESU3gIrjT+RWq
   4TOsJOhcLT6XlCfTOHsJXvioZpJd979dtW/bqiF36QeCrqf9yjKy+N7Ft
   G1ewkVoMCzZIsErYs0jIh9iFFtnJyKmF0ZJ98hUMHf0S0pYT0ZE92V14j
   0r1ZiGULlkcbXAH8Todz3z4iBJTVXLgRDFAHFMABd1KSakEfukygxVDmd
   /4P/nlUZoHzdp9Dp6+dLf9F4MN0fpqgkOSr61Q30UqG9zuzcvniiDaRM3
   Dg/V3/TN4UDIKfE518naDxQ8m7ReD1uXWX4wuLlyQZwgZMkTXq4KYR0i6
   w==;
X-CSE-ConnectionGUID: 8cKfsU/zROG3Szfzgx5vMQ==
X-CSE-MsgGUID: DcTqYwQwQeC6w+2ZUEhBdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34172488"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="34172488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 12:56:09 -0800
X-CSE-ConnectionGUID: axnzhLfPTFiNLLczlAclZg==
X-CSE-MsgGUID: L+oIMSEbRPqjAfJSjSVhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92576393"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2024 12:56:08 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAxvh-0001iz-1b;
	Tue, 12 Nov 2024 20:56:05 +0000
Date: Wed, 13 Nov 2024 04:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.12-fixes 3/5] ld.lld: error: undefined symbol:
 iomap_want_unshare_iter
Message-ID: <202411130736.azZYiqmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-6.12-fixes
head:   e1fe1a2fb5e5edaa601ba93fac7b6b13a3d815aa
commit: 0563ae67e983ab79f879e3a33c7cee6393ff1489 [3/5] iomap: share iomap_unshare_iter predicate code with fsdax
config: arm64-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130736.azZYiqmU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130736.azZYiqmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130736.azZYiqmU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: iomap_want_unshare_iter
   >>> referenced by dax.c
   >>>               fs/dax.o:(dax_file_unshare) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
