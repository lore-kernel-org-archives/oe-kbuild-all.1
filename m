Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D11DEFDB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729337914; cv=none; b=kSNHKypBZIKOhspLwAhUlSlcVjkxMnutR2aS2oOz8D9FxVmGlG2D7Z3xCOtIs9Gnw3Ok9VA0mVWzt/L1EpI6eZ6F8Rdt7b9yb4NBZ5O2PbU02a0zmx7LAL9vlsnSRvvBt45r/FGWet0uBUqEwD+7XrM2gXFdpNFk4lW6/LogfKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729337914; c=relaxed/simple;
	bh=AonvIE1M7UjfNwiffI7tj1zHzAPgJc9dDiVFcE+v/6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ficfsKI+xW8LgY1SCEPtJMzH7VMaupZSjBUpDw2snBUIrcvyRzZesAf4kTvwEFYMJuojSyfdnO8GA6iFpONNrdc/o10pQuBpLKQiIKBfTajQulH62T/jUHezf8LJDdE9hmf22nYjumHuZJXgIq0vBO5/x5/wMeLOXBGRY1p5Bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOf0ykxy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOf0ykxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729337912; x=1760873912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AonvIE1M7UjfNwiffI7tj1zHzAPgJc9dDiVFcE+v/6g=;
  b=mOf0ykxyUPUL/+xVQD60UEH574nBZPdyACW3MBYI8+RLylxsqrq2YUXR
   3dHd8WXkOfOrMzfw7W50R2vcOJrNcD5KpBkQQ4ra6zp2rcoOY/8ZkJwFa
   M+EvdwWxm1qoYrU3byUaz16RHNiCxN5YjXd4q06tluQcAySeL1LwKpYd2
   nvccNBQ/ZsgvL9tL+oX1SlSAp1wy6OceXlpAXDkefhZxGIxmLhmYaEOjI
   rYzAzvN4ZLIEVhWZGCfr42ByPJfwhlkYXKsxsO3vOwF1rOFf0lB9cBcDP
   mxtDhwyY8EyB/InsfR7etvFMXbjLmvyOOU98+Vq4UEP100GYszQVZQ9Fr
   w==;
X-CSE-ConnectionGUID: xkI97ISCTEC2R4On0M/nlQ==
X-CSE-MsgGUID: /F9Cr7pITYyPLdcPjLdOhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46328532"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46328532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:38:31 -0700
X-CSE-ConnectionGUID: iEcWgobdQQClLlPNsKt6iw==
X-CSE-MsgGUID: 220ELwtuQBOtBH3l7GDWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79067263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2024 04:38:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27mu-000OwN-0c;
	Sat, 19 Oct 2024 11:38:28 +0000
Date: Sat, 19 Oct 2024 19:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kinglong Mee <kinglongmee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] SUNRPC: support get_srcaddr and get_srcport for
 rpcrdma
Message-ID: <202410191906.iaoM9uIW-lkp@intel.com>
References: <a25b8ee2-46c2-4468-8ebd-edbc40fc7417@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25b8ee2-46c2-4468-8ebd-edbc40fc7417@gmail.com>

Hi Kinglong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kinglong-Mee/SUNRPC-move-macro-for-resvport-to-address-header/20241016-195523
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/a25b8ee2-46c2-4468-8ebd-edbc40fc7417%40gmail.com
patch subject: [RFC PATCH 5/5] SUNRPC: support get_srcaddr and get_srcport for rpcrdma
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241019/202410191906.iaoM9uIW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191906.iaoM9uIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191906.iaoM9uIW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sunrpc/xprtrdma/transport.c:473: warning: expecting prototype for xprt_rdma_get_srcaddr(). Prototype was for xprt_rdma_get_srcport() instead


vim +473 net/sunrpc/xprtrdma/transport.c

   466	
   467	/**
   468	 * xprt_rdma_get_srcaddr - get the rdma local address, without port
   469	 * @xprt: controlling RPC transport
   470	 */
   471	static unsigned short
   472	xprt_rdma_get_srcport(struct rpc_xprt *xprt)
 > 473	{
   474		struct rpcrdma_xprt *r_xprt = rpcx_to_rdmax(xprt);
   475		struct rpcrdma_ep *ep = r_xprt->rx_ep;
   476		struct sockaddr *sap;
   477		unsigned short ret = 0;
   478	
   479		if (ep && ep->re_id && (ep->re_connect_status == 1)) {
   480			sap = (struct sockaddr *)&ep->re_id->route.addr.src_addr;
   481			switch (sap->sa_family) {
   482			case AF_INET6:
   483				ret = ntohs(((struct sockaddr_in6 *)sap)->sin6_port);
   484				break;
   485			case AF_INET:
   486				ret = ntohs(((struct sockaddr_in *)sap)->sin_port);
   487				break;
   488			}
   489		}
   490	
   491		return ret;
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
