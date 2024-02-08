Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00734F21E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707429845; cv=none; b=FLyZ3gaqcihFzyhL2ZtxweDDNXLVC1f2ZUQtUG2N9yju+Gaz3SideCKSsTldFn0qdQFrWQU0Ij7uAN/cBkSzkM67XitoaQ9wU5kfoi8rfXjFGhJRJwSvVJ5G01XyJ+MxW26cjl7f+pNOblIln7kgly07O0oY/uO0FfEz9T8Fw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707429845; c=relaxed/simple;
	bh=1MWYtE+o2pWwPZpmk/g4QkIcM79KqUQlLxOp1gKJQcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2P4T6xbZZ2wmmZ7aAykj3ftwv4mn93+ujR34PAa/Maosy2UcTqtY23VdTh09WMi0o+FJXhTyYDPGjmLRwDEUKBsuFyl/PCdcigOmexW4xVT7hdgn9IYhJvdcyygeUzfW9dwAE6ShRr8+/7hNwKlyj4pxrEFblsRMw9Wf2hqvLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqazAUFX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqazAUFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707429843; x=1738965843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MWYtE+o2pWwPZpmk/g4QkIcM79KqUQlLxOp1gKJQcM=;
  b=IqazAUFXzy8mWD8QMudprXI01u3Y/GPnqcyED8FzFv3qYdZJjfJ8JsZ5
   rXzoFpq7bIiF+KIKLFdcDsunjkUCk+j7bQBSMPE/R+pchtvKOm/1jQZWx
   DKH9YqkyR89p9ITobo7H9RJebm7uR/j9nAhoRtKtqyn8uyJQ+yK4vgfaX
   ARvtXrP1zj18WNNPKyoH56Are4ay9VT2oXqDsuD2MLfVP/SRLBlyYvWse
   nqj1l6iNYM0Tyc2Mz54cTUR/+8MLdPk3k/w+ADOn5p/b9/TKyhdeBGD5+
   9Lipa3sjLonLapDbiLJXMJCrUZfPuh+3YoeTuoxC/P7UVDivX+6MuJujJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1466323"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1466323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 14:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2070711"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 14:04:02 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYCUx-0004A0-1d;
	Thu, 08 Feb 2024 22:03:59 +0000
Date: Fri, 9 Feb 2024 06:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:dir-deleg 4/4] nfs4proc.c:undefined reference to
 `nfs4_proc_get_dir_delegation'
Message-ID: <202402090555.QAh5aCKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   7b60285292bdd8a4c76775a8eabde93e9dd5b8a2
commit: 861bf90064b2f2eaf6c0263f6bd5cbbbdc653169 [4/4] nfs: add an ioctl to fetch a directory delegation
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240209/202402090555.QAh5aCKD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090555.QAh5aCKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090555.QAh5aCKD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `nfs4_cachectl':
>> nfs4proc.c:(.text+0x406ec6): undefined reference to `nfs4_proc_get_dir_delegation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
