Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4E21770B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504386; cv=none; b=I0yJuJi3qKPrJWaxkFKOqL5QBU71+7CZtEZVnQPx2g65bi4t+X7UINCRHlHNGk5mv/QCJreAtgpagbTlkGSaz0MHKm7ApJjTuLa2SPGknDlrYVu+BO7I9QNayyxL7QYLkni09OeEG+tEjdGtFZYmsSBBm0tBbnLZNqbF41zrcs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504386; c=relaxed/simple;
	bh=EygT+BSyYUkZlu5jqUj0OoG7IlOcJ1/hP3l9DhXJq2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKSl9xMTi1GaplA2u0Pwgnhx+1ErJ/9LEj5qOfk5bmdQkjHJTeLjaSGJUn3n3rJbSsTciCmpdI8A13kVQav7HJQjMI5aTfHLI8snkkXVahBu8q9LWVoRg788YNRqyvDBq1DMuJHB6XABiPGgvI2op4Mp6PyxRDVcGSRAg4PS2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do59i09a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do59i09a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748504385; x=1780040385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EygT+BSyYUkZlu5jqUj0OoG7IlOcJ1/hP3l9DhXJq2w=;
  b=Do59i09a0BNuw80kAfImzXHWqfqYF+UogP7Nz0XYSsJFT3X/OXgmj4aV
   ciLrEjU/yIJnrRvteGTRdsWcyEHzKeKy9Bvy2OxP9L/nAQqKmfGIOVATF
   vVhwxpfuNfysUyzvRFFtBhc6PVkCYXjdUnJrHe7tjG/qF4zWc8c9zkAU4
   MQpCHi5J3X6M2G7V/x3E9dGM2tcNo/RPBwmrJUbVTlqLRgqvr5+Y882Lu
   bfyuK/6PYxKCPrLyT1ODcujcLVyULlc+vU5pnGLpOhoxmmMWdfnathUbW
   rUQPKfVOMyf1xCvE2mUiX+E7IDIH3e7E6h1IzsexNABrtlh2iqSaSdvF6
   w==;
X-CSE-ConnectionGUID: hvNt20WtQk6/AjH6PZmD6g==
X-CSE-MsgGUID: xsWOWtSUT0KAfbFUjV0IXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54350233"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="54350233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 00:39:44 -0700
X-CSE-ConnectionGUID: li4Sss6XQDmMTxkAofNIKA==
X-CSE-MsgGUID: qTNHg7snSbGujGqw+1uJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="143952702"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2025 00:39:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKXrZ-000WRw-1X;
	Thu, 29 May 2025 07:39:41 +0000
Date: Thu, 29 May 2025 15:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331] net/sunrpc/clnt.c:1588:15: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202505291525.OYGJaX7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d6c09e6ce9d7651c2136ae254cbc3c9845fd0317
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2331/2331] add enfs feature
config: x86_64-randconfig-123-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291525.OYGJaX7H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291525.OYGJaX7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291525.OYGJaX7H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/clnt.c:1588:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sunrpc/clnt.c:1588:15: sparse:    struct rpc_xprt [noderef] __rcu *
   net/sunrpc/clnt.c:1588:15: sparse:    struct rpc_xprt *
--
>> fs/nfs/dir.c:1498:6: sparse: sparse: symbol 'nfs_check_have_lookup_cache_flag' was not declared. Should it be static?

vim +1588 net/sunrpc/clnt.c

  1577	
  1578	int rpc_localalladdr(struct rpc_xprt *xprt, struct sockaddr *buf, size_t buflen)
  1579	{
  1580		struct sockaddr_storage address;
  1581		struct sockaddr *sap = (struct sockaddr *)&address;
  1582		struct rpc_xprt *xpr;
  1583		struct net *net;
  1584		size_t salen;
  1585		int err;
  1586	
  1587		rcu_read_lock();
> 1588		xpr = rcu_dereference(xprt);
  1589		salen = xpr->addrlen;
  1590		memcpy(sap, &xpr->addr, salen);
  1591		net = get_net(xpr->xprt_net);
  1592		dprintk("NFS:net:%p\n", xpr->xprt_net);
  1593		rcu_read_unlock();
  1594	
  1595		rpc_set_port(sap, 0);
  1596		err = rpc_sockname(net, sap, salen, buf);
  1597		put_net(net);
  1598		if (err != 0)
  1599			/* Couldn't discover local address, return ANYADDR */
  1600			return rpc_anyaddr(sap->sa_family, buf, buflen);
  1601		return 0;
  1602	}
  1603	EXPORT_SYMBOL_GPL(rpc_localalladdr);
  1604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
