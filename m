Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FC22FDEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001170; cv=none; b=ExAOVyJM6nk1JI6FfCy0IJ1hYl13FojaPkgt0fJR2dfbbku3uWWg4ztJXt3MyPooEwKqbh3U65jgi2Thj/gd9F2wVC1JeV+WOcmNF/4jWNxsDNBPHsCdhG0KLh581TrMgZeV8bLgX48RsbT4H7K+xrm3pvFGUWDFd1X4XeNHQ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001170; c=relaxed/simple;
	bh=ec5q2j6YoGon96SwauM791NIYLQVQHnYt1AhKcWCnPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BuFJSYUN1SRY+YgUmMMJUHxx+0K2nmR8clkRkmxONyWQ6gqyUC3Z6l6JUajyEE/Y9JtuTCF8Pa+UWe7G1v0NIf6/Ox13VOXa54ZwULm8YsbQP+G8ZTqVHvysBWcxSyMvskiXF+OZApTzGFHKA5SSYd3md5MeAZJwLaYJk2fiokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMWLO8ms; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMWLO8ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740001169; x=1771537169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ec5q2j6YoGon96SwauM791NIYLQVQHnYt1AhKcWCnPw=;
  b=LMWLO8ms5YCA8od/UuLd1IACm++MzJHgsB50TpNu5MEiISf66nbGVBS/
   ZG9ggH4QWVbF9xHaEH9gziLOUl7AVadqgUNlyEuEWnrGEke0O0zCKQdVC
   i0yQwwzlViiIselsA39O1Kl9+fAhLErd/qThk4QCFgQxQgr/4EyLYTxU4
   k890xG45S7Jca05gQdgE2RMTtDaWJobflDDXXCLRkx1DBh+id8UVt/RY1
   0a2kQbPEZtDUSVm2x6LZd5pZRTT+kqt67UukvNA7x7XgBgt8AWtFDU0q0
   4pK3cNXu7QbzW7WcEtJtHV4/XbEfwoddj+M3pX/43B021MpfbMXV81VEj
   Q==;
X-CSE-ConnectionGUID: q857YanPQLaYUfbB/GSg+A==
X-CSE-MsgGUID: FqV77HmRSkCAOPdir3cNCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39947368"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="39947368"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 13:39:28 -0800
X-CSE-ConnectionGUID: pZq3JJjqS1qkRNqE5lrAvA==
X-CSE-MsgGUID: XeGJwLDsTeuL2ie5EbNL5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145720069"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2025 13:38:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkrlf-0003VZ-3C;
	Wed, 19 Feb 2025 21:38:07 +0000
Date: Thu, 20 Feb 2025 05:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 1/2] fs/erofs/fscache.c:122:20: error:
 assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, int)'} from
 incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void
 (*)(void *, int,  _Bool)'}
Message-ID: <202502200514.AOFaBjkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   423353c292d881a53125bbe8aff5fcc329f3dbb7
commit: c313ce74e3946fcc6ae5c80187c8d576ac097a65 [1/2] netfs: Fix the request's work item to not require a ref
config: arm-randconfig-004-20250220 (https://download.01.org/0day-ci/archive/20250220/202502200514.AOFaBjkD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200514.AOFaBjkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200514.AOFaBjkD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/fscache.c: In function 'erofs_fscache_req_io_alloc':
>> fs/erofs/fscache.c:122:20: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, int,  _Bool)'} [-Wincompatible-pointer-types]
     122 |         io->end_io = erofs_fscache_req_end_io;
         |                    ^
   fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
   fs/erofs/fscache.c:202:23: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, int,  _Bool)'} [-Wincompatible-pointer-types]
     202 |         io->io.end_io = erofs_fscache_bio_endio;
         |                       ^


vim +122 fs/erofs/fscache.c

f2151df5743536 Jingbo Xu 2024-03-08  115  
f2151df5743536 Jingbo Xu 2024-03-08  116  static struct erofs_fscache_io *erofs_fscache_req_io_alloc(struct erofs_fscache_rq *req)
f2151df5743536 Jingbo Xu 2024-03-08  117  {
f2151df5743536 Jingbo Xu 2024-03-08  118  	struct erofs_fscache_io *io = kzalloc(sizeof(*io), GFP_KERNEL);
f2151df5743536 Jingbo Xu 2024-03-08  119  
f2151df5743536 Jingbo Xu 2024-03-08  120  	if (!io)
f2151df5743536 Jingbo Xu 2024-03-08  121  		return NULL;
f2151df5743536 Jingbo Xu 2024-03-08 @122  	io->end_io = erofs_fscache_req_end_io;
f2151df5743536 Jingbo Xu 2024-03-08  123  	io->private = req;
f2151df5743536 Jingbo Xu 2024-03-08  124  	refcount_inc(&req->ref);
f2151df5743536 Jingbo Xu 2024-03-08  125  	refcount_set(&io->ref, 1);
f2151df5743536 Jingbo Xu 2024-03-08  126  	return io;
d435d53228dd03 Xin Yin   2022-05-09  127  }
d435d53228dd03 Xin Yin   2022-05-09  128  

:::::: The code at line 122 was first introduced by commit
:::::: f2151df5743536e0b98a2094bd58b52d4e060016 erofs: make iov_iter describe target buffers over fscache

:::::: TO: Jingbo Xu <jefflexu@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
