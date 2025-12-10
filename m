Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DCC72623
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393550; cv=none; b=BJ7OA0acka5pEg2GfRO3JniRbKphRYTrLxqWZcmCl+ZXIeW1P0vYN60o6oPXKl2MJfkJyS3/kO7eeN76VfE8zzz8Y/PgjgK6gzYhxmmmDgTVK4VsveqvSWQgO19j5r3SsBUtFJDHTiYj7wLI7srEd2ZhlX4GsiTZ5bJPe0Hlrpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393550; c=relaxed/simple;
	bh=IRLSRWLWtIcUhkS2gO85JDvIQIeW7cRwC9aBd5EssvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sLeEnRu/Eb1aSLRVjFCCEicCmfu8eLDNrNpUfTArMfgWeJuQCDphlTO1wJqn7Uh2fny0+EooklUcem5XZmkECYy+lk3Y71T68MRwiS49fqt8zKvxLlrEEgOo+98p1PY2gC3EJ+XY3X78ednrFeGbzW6QdDTWcc1p9xXfmWwYkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jA9kbw+8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jA9kbw+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765393549; x=1796929549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IRLSRWLWtIcUhkS2gO85JDvIQIeW7cRwC9aBd5EssvU=;
  b=jA9kbw+8R182QS89bI8UlVChv0c3ffYgTEfv1FWCU2W9gnQ3r+pENgnN
   mDwz1kA2dZ5eKH8BS94P39q7gnsOsrMXs91FsdSc7bpWah1dUVh6pBt8C
   Mby3FdU+J3lv56A2LKqU+BTU5drBk+T9QqES93roQb0tVUTiXWq+uv5IK
   YwgHAGScXl5pS3ccKhKMeDlREc0ZSJpd7GKoGPFCehFF6YjFyKU/5g0dk
   q7RnRtoRqqKxmIt4RHr4Zwuc4O4zHCiAnvCovyQID6xLWdFKmf8IS0GcI
   bkQQ+BwwCGza6uAqbQJ/uaHYO9H0UP4i7AIsZbJOAXY32A2Ppx/7ZZW76
   A==;
X-CSE-ConnectionGUID: lr1/4m1KTuGaP1nADCh2UQ==
X-CSE-MsgGUID: jSQA/BSdS9aUYRIYR2COIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54917253"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="54917253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:05:48 -0800
X-CSE-ConnectionGUID: fv5FgG2lQZ2XBnF4FLXmxA==
X-CSE-MsgGUID: lwFUQ5C6STSd09ymxGQHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201029659"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2025 11:05:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPVR-000000003fL-2e1o;
	Wed, 10 Dec 2025 19:05:45 +0000
Date: Thu, 11 Dec 2025 03:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202512110249.iAijaqde-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   cc7f65cd38b29f29c6af5e49bcd7037d10de13e9
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.2
config: arm-randconfig-r122-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110249.iAijaqde-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110249.iAijaqde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110249.iAijaqde-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:314:16: sparse: sparse: Using plain integer as NULL pointer
>> fs/fuse/backing.c:861:48: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:861:48: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:861:48: sparse:     got int
   fs/fuse/backing.c:949:59: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:949:59: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:949:59: sparse:     got int
>> fs/fuse/backing.c:2097:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2098:18: sparse:   also defined here

vim +156 fs/fuse/backing.c

   145	
   146	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   147			       struct inode *inode, struct file *file, bool isdir)
   148	{
   149		struct fuse_file *ff = file->private_data;
   150		struct fuse_open_out *foo = fa->out_args[0].value;
   151	
   152		if (ff) {
   153			ff->fh = foo->fh;
   154			ff->nodeid = get_fuse_inode(inode)->nodeid;
   155		}
 > 156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
