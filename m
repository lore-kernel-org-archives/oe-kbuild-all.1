Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235612F585
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782637367; cv=none; b=Ib22ePdF6see56BLMu1RI4oaKje1fFHC7RlSWPERuoU8t6JHEoj7rKf8514/wMJIm5+U6J8z7m8Lfp2LeMrRFNkX8ad0I710LxmOhsgn5ysTPN07QB8OmNdMXBbskfmCvxL8dLTjAT3um0N3JhVRDHYMhwaKWnXxdOO1ZbZs6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782637367; c=relaxed/simple;
	bh=zIbxKmELHyqQ1/U+vVX48OBGJv+i2j7nhqDRI/SF0J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QlyWTddZBPt/fVReIjezVXb+QhPZLhJ19gWxV/MhINyOKYEgj7qnEAvT86hpl3q454nCtVYECLrmKC4oRsxS+Xb+sN5hIHqbu0mSh6FMZEUle8waRicP1Izi/Ql/N4YMqhQTIDXhfqpW3oXYgRYUN6IoyHnshaDg5xpuMRBP3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBNSXsot; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBNSXsot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782637366; x=1814173366;
  h=date:from:to:cc:subject:message-id;
  bh=zIbxKmELHyqQ1/U+vVX48OBGJv+i2j7nhqDRI/SF0J0=;
  b=BBNSXsotkFddHSqebVUXB5Lhbia2gYrvYO+c0JVc4d7hGnj7oUtQ7+UA
   uJiy1m+HhNeRWuYJGrnxeXCcujLe7dGv3BQ5xaa6w/ccXDg63NwrcwGAV
   8b/zcHaBhFdST3aaXgiPANuA0M9KvPIFHdd2BrR3CrDVg/F90/hvFWmfb
   HCgkS1d0I9+ynjzA7Uj/SeTBiGp7KGmW7ERrJ25dEUwW9PsnvEW+VFiJf
   V8XiE8YBjYGfy1jityKv//bqTk2/FfC1l+xutBsJ2rn1CGSRfLt6OzglK
   h1pdlNYbKrYe+Gw7ldnS1eQwUpJz5Z/+OpLz4KPJ3yOTPoiBHsrv3bxKu
   A==;
X-CSE-ConnectionGUID: Ad730FnmR62dICJviV+Jhg==
X-CSE-MsgGUID: AUUQkKv8Qi+fwUY9o+SWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83389294"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="83389294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 02:02:45 -0700
X-CSE-ConnectionGUID: qR6G+YAXSEujWK3SKLisDg==
X-CSE-MsgGUID: s3SmjgphTf2pZBYPk8DdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="252334855"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2026 02:02:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdlPU-000000006Gf-3c22;
	Sun, 28 Jun 2026 09:02:40 +0000
Date: Sun, 28 Jun 2026 17:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4.rebased 11/29]
 net/ipv4/bpf_tcp_ops.c:88:29: sparse: sparse: symbol
 'bpf_tcp_ops_get_retval_proto' was not declared. Should it be static?
Message-ID: <202606281633.H5NmpCP7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4.rebased
head:   702dfd9ab6849d59d3521f7c6542c1cf6aac217c
commit: 53fe101e32114ef6e2540cf6d74f277d9bea1c87 [11/29] bpf: tcp: Support selected sock_ops callbacks as struct_ops
config: arm64-randconfig-r134-20260625 (https://download.01.org/0day-ci/archive/20260628/202606281633.H5NmpCP7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281633.H5NmpCP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281633.H5NmpCP7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/bpf_tcp_ops.c:88:29: sparse: sparse: symbol 'bpf_tcp_ops_get_retval_proto' was not declared. Should it be static?

vim +/bpf_tcp_ops_get_retval_proto +88 net/ipv4/bpf_tcp_ops.c

    87	
  > 88	const struct bpf_func_proto bpf_tcp_ops_get_retval_proto = {
    89		.func		= bpf_tcp_ops_get_retval,
    90		.gpl_only	= false,
    91		.ret_type	= RET_INTEGER,
    92	};
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
