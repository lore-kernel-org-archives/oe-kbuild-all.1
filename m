Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694291AF0D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739995778; cv=none; b=ABBpYmL6qDCRg0AhoqGEIzQtihyF7kRp09njnmbLlvf/Kc//rHoXhvbvP/fIQz+4qIaT/y9NM3AjZX3lbMLmebAB7PHkwaD48pkxGhWIahaokMCn/XWzlxeZdNC2WqTAivDvc4WMu4WDWtqGjtG4/SQfvBHL8YkL34QLExWnYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739995778; c=relaxed/simple;
	bh=PLqW0aXcVZF4KuL8ogH32YJ7Rd5So26fY3N5HOcumwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvBkHEvEkYEaDXv4AHpLOJ/GL+4wXZoUY8Egureb1+HidUM9h1/xLnCw5UjtL45SXx5TGn9gMxkJ3R7mfkyT7CtjQcfwztDgPkDtF7Iua0g5SUEKOGvHfmIbFlBhdQtqBxxOCNOvU/HoJsPy3Cf7EC371SHWeWgy1ZaMz1umtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGUcqe81; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGUcqe81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739995776; x=1771531776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLqW0aXcVZF4KuL8ogH32YJ7Rd5So26fY3N5HOcumwQ=;
  b=GGUcqe81ysUy+OWW64wO+D6Oru6qqp0Grf5SyXwo3gR8cUsXN9PdjVyd
   fs+mvQFog+NmFy2ZYKed7CFJXXIz7QmJ+jeITsjfXpsVVe5yKtycvzhhG
   AiIKPuSIP/GznCQtsj+jXFtRa2FmRKyom0eEz1GaTAT5z4l53B4LJEZDf
   f6/R7Vy3S0LB/fyov3KWYacxzm1GvRG3WcMjAxFxYcaH1sUrt/DxUw9KI
   qZOMQSPtQal1GrTuh0ZFTt0QMNRxwANBTP2UV3KqfDcGQVNWbnbp6yxCL
   91hvF2CAPUw/1myGC/+Uz/DR5q3qmfHgHjNhiPSKoOnrcHLhDqMzvyatj
   g==;
X-CSE-ConnectionGUID: xFhI34INQ4Wk4Wg5juirtA==
X-CSE-MsgGUID: Fxbljc+jTjuWUhZj44tczg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44523318"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44523318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 12:09:35 -0800
X-CSE-ConnectionGUID: p9g4c8kyQ8aPSoFdAfI0gw==
X-CSE-MsgGUID: Ux3R3wfkSaGQXj3fVP4y5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152023770"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2025 11:43:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkpy3-0003O7-0G;
	Wed, 19 Feb 2025 19:42:47 +0000
Date: Thu, 20 Feb 2025 03:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 1/2] fs/erofs/fscache.c:122:20: error:
 assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'}
 from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void
 (*)(void *, long int,  _Bool)'}
Message-ID: <202502200302.hGuSsM61-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-003-20250220 (https://download.01.org/0day-ci/archive/20250220/202502200302.hGuSsM61-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200302.hGuSsM61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200302.hGuSsM61-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/fscache.c: In function 'erofs_fscache_req_io_alloc':
>> fs/erofs/fscache.c:122:20: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, long int,  _Bool)'} [-Werror=incompatible-pointer-types]
     122 |         io->end_io = erofs_fscache_req_end_io;
         |                    ^
   fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
   fs/erofs/fscache.c:202:23: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, long int,  _Bool)'} [-Werror=incompatible-pointer-types]
     202 |         io->io.end_io = erofs_fscache_bio_endio;
         |                       ^
   cc1: some warnings being treated as errors


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
