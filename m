Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815F054673
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706890617; cv=none; b=dym8lKv48sjjtDTQ7f91wtw9TYDmELoIuNaDQg7xIuuIpYnyrDgW06bT7TZYU7kM7yinGKTD9TzW3Du//2L1gCDQfVLEhxBxoock/q3ZK13XqwXnpd6L2UClOFl5e8dfdrgrIWw3PIgZPHTz2TnzwMncmvHfJdIhVYAWQnI37mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706890617; c=relaxed/simple;
	bh=0j7R20o3E8nDc84vuW02BkGpy2Bxw3mzL9CBKshWIWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTt/WCmWdDo5chQq94crpUyEHhZ85Qpw+4NQ4to7M687MlHogZ5a8cP4dxaoE8puRmAAaR+oBIpLVUd7X0KN9yHS/uTc5JEEQiMCTlvqTxD9d0BmDEdITP4Y4kFX3lbWkG5uvl2XOx5i0I3iPk8AbZv0JZ2t/UZMBHDVtkUwf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gz9+wmSO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gz9+wmSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706890616; x=1738426616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0j7R20o3E8nDc84vuW02BkGpy2Bxw3mzL9CBKshWIWA=;
  b=Gz9+wmSO9L6W6yuVcehFjRKutLg0NS3D2JHxmxQWKnJkG9tEETSyhO7j
   z6NWmLKUfdleNy+82xV9knLp18+egGxCpC7rRPhUB/WI21tzTmZYztZ/x
   7gzgoDI4uT2lvPOUJJwjR54TMVf8kU4kZXxPZ2gVEk+XSGbKHDEUuzn2t
   zPPeIQA+bOLb/iMoDRzbA4BzokCp/z2g3ZzZ0WYLsVMd79TzTtY0YnO+L
   kGs3uKU3txYrtLIJf21VJ40VosMcLwjfeCJUQxsiMPgCavwZe7NP9rRCw
   Cm8XSdA9MJCLVOXHxQstWK5E9yuhmwoqWwpuFpcDUY4dOl0kHrvJ5asqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11285153"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11285153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 08:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4726684"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2024 08:16:45 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVwDb-00042O-26;
	Fri, 02 Feb 2024 16:16:43 +0000
Date: Sat, 3 Feb 2024 00:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Guillaume Nault <gnault@redhat.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [linux-next:master 1141/3789] net/ipv4/inet_diag.c:1511:17: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202402030006.2bwG9hee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   076d56d74f17e625b3d63cf4743b3d7d02180379
commit: 223f55196bbdb182a9b8de6108a0834b5e5e832e [1141/3789] inet_diag: allow concurrent operations
config: hexagon-randconfig-r122-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030006.2bwG9hee-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402030006.2bwG9hee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030006.2bwG9hee-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/inet_diag.c:1511:17: sparse: sparse: Using plain integer as NULL pointer

vim +1511 net/ipv4/inet_diag.c

  1503	
  1504	int inet_diag_register(const struct inet_diag_handler *h)
  1505	{
  1506		const __u16 type = h->idiag_type;
  1507	
  1508		if (type >= IPPROTO_MAX)
  1509			return -EINVAL;
  1510	
> 1511		return !cmpxchg((const struct inet_diag_handler **)&inet_diag_table[type],
  1512				NULL, h) ? 0 : -EEXIST;
  1513	}
  1514	EXPORT_SYMBOL_GPL(inet_diag_register);
  1515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
