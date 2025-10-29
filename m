Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAF189F3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761717968; cv=none; b=lM7EbTCrr+UGXlz/J2QCLn1IN7lSKMEN/ZoZERLx6a851ir8wkNnXCh+xUgpmet4mRdf/MSfsmX+ngmDtGS9iShUwEs5tewHQxAq9J7kB5OmgXmVqLO8w51CRWzUw1D8Q6a1zaeXrN8loNmqI3/K5ex2ss7t0s2iCPiabWHJ1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761717968; c=relaxed/simple;
	bh=e6sL8CP4sH34DzbI1+QIIW59uiYUEM4MxlScAGJwGDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DG6fpLSVB1sjNOCTHCYZd5r2PnlguJgqyd8xwEinWkwNQqaOxS1D8BS//v85Hy2CmZWv3cag2WkCAwFiHmetjpdMfXq3NZoc8/A+WYiSyztQyAQHW3iCbaP7Qr4ixRDTT+WB6ABX37B0BPEe9M/hvem359Q3tyFzH5hxyKHE0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kh0Li3r0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh0Li3r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761717966; x=1793253966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6sL8CP4sH34DzbI1+QIIW59uiYUEM4MxlScAGJwGDc=;
  b=Kh0Li3r0YjSUx2xjU4H9GYq/zD2eZq+SDwtpuJSGwwzYkK9NfLTuWbDO
   976pNLSv1e8+h2n/OXMnwH7zFAJD7y/1w6WDx9lqOqdrlo9mpj9zaVbvW
   Cm40RfRR6plvUYf7W+RTWCIi3+/GpJZH/jvBI1t1z6l5TOJDZwExAwJ2Q
   0mHH59r0S3uQ1nwUT2h0022s3zFOCoWy8EKmkou4XIP7il8PQFQJ+hQAh
   FkSiwWJZzQsIJK7XpwY6z4OpxO5zHB7s5HUlgRbSHyphSYvfXqm550Vp4
   uW4h5iT8crhT21jOZuad+U7YqB+6Qwo03xFDCKWCIFvQHFgPmN7p+1u5n
   w==;
X-CSE-ConnectionGUID: YISs9+kWT0KRRIl53b3tYw==
X-CSE-MsgGUID: EQHJ4ZOKS0iH9vqWBspxEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63738392"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63738392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:06:04 -0700
X-CSE-ConnectionGUID: 9yvtRCW2QKOZdfJc/N+/oQ==
X-CSE-MsgGUID: etym1ebBSzKvG66RjQvfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185640987"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2025 23:06:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDzJ5-000KG9-2f;
	Wed, 29 Oct 2025 06:05:26 +0000
Date: Wed, 29 Oct 2025 14:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 60/85]
 fs/fuse/file_iomap.c:1789:31: warning: unused variable
 'fuse_iomap_swapfile_ops'
Message-ID: <202510291434.kOTzbLyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   93ddb4aaf9c5c308eac7d9682a0954648f3f73ab
commit: 7e188421220b7b8cd5302faffbd4b9865d71d222 [60/85] fuse: enable swapfile activation on iomap
config: loongarch-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291434.kOTzbLyF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291434.kOTzbLyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291434.kOTzbLyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file_iomap.c:1789:31: warning: unused variable 'fuse_iomap_swapfile_ops' [-Wunused-const-variable]
    1789 | static const struct iomap_ops fuse_iomap_swapfile_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/fuse_iomap_swapfile_ops +1789 fs/fuse/file_iomap.c

  1788	
> 1789	static const struct iomap_ops fuse_iomap_swapfile_ops = {
  1790		.iomap_begin		= fuse_iomap_swapfile_begin,
  1791	};
  1792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
