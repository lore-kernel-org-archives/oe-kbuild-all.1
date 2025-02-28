Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAD1CCB40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778796; cv=none; b=LITXWsxsVc92HzGDeD5jvC4pnux1v3Bwy/9In34fhw/seNPOnMOYRGzQ3rEWypc/3E0eLuJpqrqkGJ7gq5mXLy4BI+ObrGpqD9o/JxsgtNe+EvBhYCB0r9L7PXxZOcreslmvWjxtM8Mqx/D+zOZAdN5sXMDdRSrVevBfpP4Z+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778796; c=relaxed/simple;
	bh=oPBs4XTTOGUp1tOl1SFPC5mGdJ/tokjN5w0U0rWUVXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qea8aj5+YVidgi33UTS6yHAhUMkD18Cne0CzCcaXTU3M39irg1HpeC46YSHobqnIZa0KpXYwHQr/hhXCCnlx9t/oP+SoWQX4SCadldCKZSd94vzfgcY4Xlt5zkTkk4K/mgAIXWDc9fZDxg2pmuat6DZPINTVo4Nz1poXo+6IAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIvxbR9p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIvxbR9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740778794; x=1772314794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPBs4XTTOGUp1tOl1SFPC5mGdJ/tokjN5w0U0rWUVXI=;
  b=GIvxbR9p4sdCpKfN9eZ9byAj5xPUTXjfJn3dM9oSj05/wsYWrWk3JxwT
   Y4UR90iROq6NocAtUbfO3gbLW697PfW7TMU1DiikCglyo/xZmONZOl1jz
   jr4A+sdcpe16JFMUZzJUV2zeSueLDbHFCWrsnw2JDQV1+xeEl4Fxx2Tx0
   rM+6qEw3kdHDAyYTxxnE9MAJirzm1EqPXwFdnbpsx3Zam9FMCwXi2d7NB
   M5A8MCIXlXfW+csc3Ji4ioI5ShqIuWRYnCWEJesQEF8vJcEPiNCb3HcP2
   B1qHurDeO2NuaKbWjOYL5v77bJODHLfGhFo8QJn2q2ouzTw5psurYpf/L
   A==;
X-CSE-ConnectionGUID: f1O/PVx3TauOJ4Z6pgwh1w==
X-CSE-MsgGUID: fRg9IGg0TCmv5Cp3itUmGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67094075"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="67094075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 13:39:54 -0800
X-CSE-ConnectionGUID: Chs8FUd6Ty+e8RZVp6b1WA==
X-CSE-MsgGUID: otAHktZjS+2fkdpx48yC9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="118125863"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Feb 2025 13:39:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to85H-000FXk-1A;
	Fri, 28 Feb 2025 21:39:51 +0000
Date: Sat, 1 Mar 2025 05:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 3/8] fs/erofs/fscache.c:122:20: error:
 assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, int)'} from
 incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void
 (*)(void *, int,  _Bool)'}
Message-ID: <202503010559.TgiNbLc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   b988444962f6ecb07d923fc585b24fe462bf7f27
commit: 7e07425561b1413ec202a01d1ccafc53f9017edb [3/8] netfs: Fix the request's work item to not require a ref
config: arm-randconfig-002-20250301 (https://download.01.org/0day-ci/archive/20250301/202503010559.TgiNbLc5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010559.TgiNbLc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010559.TgiNbLc5-lkp@intel.com/

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
