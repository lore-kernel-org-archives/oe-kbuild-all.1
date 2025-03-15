Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22A4A29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742033778; cv=none; b=SStiUN7V8h7JJpGwI4m4KnXVDgoI3mgBmOjF7wr+r/ENYhCpK3FouLeobJPuRQ6pNdw3JwRjf01cXh3+NU0btWsko4zKiu++U3EefCHT4rnAZRwzH6KOF5O2QShAqQ89nd6ENa9MU8gDLife0DxSTaUoVaq6kG+6wwTLdKJmrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742033778; c=relaxed/simple;
	bh=5Gdh9ibMjqkYogxA9h55wdoVCPnhf9M9CH7W3EvM6w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bu76+Tww7/RqOne8Iz4bds3Pjlp6ynLQSd8DIIKgiS2a6Tp4GTEImBrEsGXKoiXcZjYzyQ54V3ol7RS97Ofkiovb9aY2EGBrmfqAuGE/TwrQrXresAic8WdFDo89wuSnjAHOWbvR5sraoB2uu8CxORjuJgIqEptdmF72ptgFjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKVLGHLq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKVLGHLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742033777; x=1773569777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Gdh9ibMjqkYogxA9h55wdoVCPnhf9M9CH7W3EvM6w0=;
  b=AKVLGHLqucYoQL5lo22p/xg5zqsBVOgZMVQb8M23rWZnFDtILoSbnL3z
   6BP/rqTMn5z7M57tqsPkgHEcyzu3iZQrN8wIEYWM7aNdXgHLUqVGpQbZl
   VZpOAQEDOQSjsOMeNTMNkt7X5CbeDBxtX9J8CYGma7o00n98LBvBWWG6E
   ZE0/LcJEG0ey4bMkPSFQw+WIi3REDyl9yousX04YB0gJmO77AVBQ7qsLK
   J64mrU7A8giSMT2IjQtGX3cuFoyIy5VOWzjSYUSw3Ix+CBB//uPuD80Wr
   gwkRt6DaWKjo+saCX8jxoTJCeJFIKHjxOrxXLqwgo8ONYo/fwOSbrjwtv
   g==;
X-CSE-ConnectionGUID: Zga+PXUPTjih7Yk1/bJtlQ==
X-CSE-MsgGUID: 4SCEstnrS6ixyoXxpR803Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42360201"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="42360201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 03:16:16 -0700
X-CSE-ConnectionGUID: UNWIQxthTniGCTlwXYFhxQ==
X-CSE-MsgGUID: oha69ho6RF+U9xnk6kPutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121509517"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Mar 2025 03:16:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttOYv-000BEt-0J;
	Sat, 15 Mar 2025 10:16:13 +0000
Date: Sat, 15 Mar 2025 18:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 46/48] fs/ceph/rdwr.c:70:19: sparse: sparse:
 symbol 'ceph_io_request_cachep' was not declared. Should it be static?
Message-ID: <202503151825.fy3Dj9uT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   a180fb30da7877c68d3cd7fccfacc61447253fdf
commit: a49b2b15694e8f3827eca687359fba4b1f018ae3 [46/48] ceph: Use netfslib [INCOMPLETE]
config: arm-randconfig-r112-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151825.fy3Dj9uT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250315/202503151825.fy3Dj9uT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151825.fy3Dj9uT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/rdwr.c:70:19: sparse: sparse: symbol 'ceph_io_request_cachep' was not declared. Should it be static?
>> fs/ceph/rdwr.c:71:19: sparse: sparse: symbol 'ceph_io_subrequest_cachep' was not declared. Should it be static?
>> fs/ceph/rdwr.c:976:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   fs/ceph/rdwr.c:976:24: sparse:     expected restricted vm_fault_t
   fs/ceph/rdwr.c:976:24: sparse:     got int

vim +/ceph_io_request_cachep +70 fs/ceph/rdwr.c

    69	
  > 70	struct kmem_cache *ceph_io_request_cachep;
  > 71	struct kmem_cache *ceph_io_subrequest_cachep;
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
