Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49112E339B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 04:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742619373; cv=none; b=oloNiBaN/guaCtCN1eMam8STfKeFtUQqu6gYQdFUwy8upf4lmMsVIH+b+2JfDZudhw2TUWHcAHdPDUHCX6W/FricxtdIhMnuJPKyq1mfGDfTjhohaEUCUSyNpzh4FxdvwcgbYiomZe1za3r5lIbMUSAdeo/hbweTpMxiBQYYHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742619373; c=relaxed/simple;
	bh=tlmp8mb2YCDhS4yYtI3J8W4bfGISWiteJHWda3QcAO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOgc2FfskO8IjRx7ulr1hA3jl8R6akVnIUMCC7Nwz4cndxU5QVSYRVN2P4xI3oVQShMIi5PWazndBEb8XIAAGYJVADQDRtoWxflM5f+z5oE6XEsdQCzh0++ZFF8siBBjZVTPr0RSd0l0iip4Yg/kFyhisHNVhkSFtza4zDa0OtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NILSAkix; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NILSAkix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742619372; x=1774155372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlmp8mb2YCDhS4yYtI3J8W4bfGISWiteJHWda3QcAO8=;
  b=NILSAkixBStVNi7u5swPJvJxhLzknq6u4NYk5OEJjvr4a1Wp0q8dW6Q3
   ACJZOvyI48QZeoBLoPz5DmrIIzMRA55MQzhxGknuSO2NkpkyZ+GMdBIs4
   iSNaKz2MZqxu/si5HhpHiPLRtdtwNxUkevxN91xE+jrse9ILrn0PA8IhO
   P+CS+QuNjYTVepIMjnO625F0nZgqidKaDIs4u/ncyyjEuVS7rQOcGKAct
   cxkMUhyp+UuyMNsvN7cij/tZ3Ld8EDnM9rGkSV5KoyEqZatCV5Qv4vUuT
   HHyPB3qrvoXrS/QOxZUuxQwPUyxaVXP4MQc8ONhx+xhsnKR8TNCl/21DP
   g==;
X-CSE-ConnectionGUID: ksg+TNa4TKSgu+bRjcFNBQ==
X-CSE-MsgGUID: Zn04iw+ERUSnWVGjgvUX3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43902198"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43902198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 21:56:11 -0700
X-CSE-ConnectionGUID: RUN2ZUZ8TFGA9744U5VQcg==
X-CSE-MsgGUID: cVeLO9CSQne05ZGBUe4tOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="127722690"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Mar 2025 21:56:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvqtz-0001wR-3B;
	Sat, 22 Mar 2025 04:56:07 +0000
Date: Sat, 22 Mar 2025 12:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:nfs-netdown 6/6] net/sunrpc/clnt.c:2074:18: error: unknown
 type name 'rpc_task'; did you mean 'rpc_call'?
Message-ID: <202503221231.RxhOjmmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfs-netdown
head:   80864ce87d5678a278000ff4f0714dfc66f18ef9
commit: 80864ce87d5678a278000ff4f0714dfc66f18ef9 [6/6] sunrpc: shutdown the rpc_clnt on fatal ENETUNREACH
config: riscv-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221231.RxhOjmmK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221231.RxhOjmmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221231.RxhOjmmK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/clnt.c:2074:18: error: unknown type name 'rpc_task'; did you mean 'rpc_call'?
    netunreach_fatal(rpc_task *task)
                     ^~~~~~~~
                     rpc_call
   net/sunrpc/clnt.c: In function 'call_bind_status':
>> net/sunrpc/clnt.c:2134:7: error: implicit declaration of function 'netunreach_fatak'; did you mean 'kthread_data'? [-Werror=implicit-function-declaration]
      if (netunreach_fatak(task))
          ^~~~~~~~~~~~~~~~
          kthread_data
   cc1: some warnings being treated as errors


vim +2074 net/sunrpc/clnt.c

  2072	
  2073	static bool
> 2074	netunreach_fatal(rpc_task *task)
  2075	{
  2076		if (task->tk_flags & RPC_TASK_NETUNREACH_FATAL) {
  2077			rpc_clnt_shutdown(task->tk_client);
  2078			return true;
  2079		}
  2080		return false;
  2081	}
  2082	
  2083	/*
  2084	 * 4a.	Sort out bind result
  2085	 */
  2086	static void
  2087	call_bind_status(struct rpc_task *task)
  2088	{
  2089		struct rpc_xprt *xprt = task->tk_rqstp->rq_xprt;
  2090		int status = -EIO;
  2091	
  2092		if (rpc_task_transmitted(task)) {
  2093			rpc_task_handle_transmitted(task);
  2094			return;
  2095		}
  2096	
  2097		if (task->tk_status >= 0)
  2098			goto out_next;
  2099		if (xprt_bound(xprt)) {
  2100			task->tk_status = 0;
  2101			goto out_next;
  2102		}
  2103	
  2104		switch (task->tk_status) {
  2105		case -ENOMEM:
  2106			rpc_delay(task, HZ >> 2);
  2107			goto retry_timeout;
  2108		case -EACCES:
  2109			trace_rpcb_prog_unavail_err(task);
  2110			/* fail immediately if this is an RPC ping */
  2111			if (task->tk_msg.rpc_proc->p_proc == 0) {
  2112				status = -EOPNOTSUPP;
  2113				break;
  2114			}
  2115			rpc_delay(task, 3*HZ);
  2116			goto retry_timeout;
  2117		case -ENOBUFS:
  2118			rpc_delay(task, HZ >> 2);
  2119			goto retry_timeout;
  2120		case -EAGAIN:
  2121			goto retry_timeout;
  2122		case -ETIMEDOUT:
  2123			trace_rpcb_timeout_err(task);
  2124			goto retry_timeout;
  2125		case -EPFNOSUPPORT:
  2126			/* server doesn't support any rpcbind version we know of */
  2127			trace_rpcb_bind_version_err(task);
  2128			break;
  2129		case -EPROTONOSUPPORT:
  2130			trace_rpcb_bind_version_err(task);
  2131			goto retry_timeout;
  2132		case -ENETDOWN:
  2133		case -ENETUNREACH:
> 2134			if (netunreach_fatak(task))
  2135				break;
  2136			fallthrough;
  2137		case -ECONNREFUSED:		/* connection problems */
  2138		case -ECONNRESET:
  2139		case -ECONNABORTED:
  2140		case -ENOTCONN:
  2141		case -EHOSTDOWN:
  2142		case -EHOSTUNREACH:
  2143		case -EPIPE:
  2144			trace_rpcb_unreachable_err(task);
  2145			if (!RPC_IS_SOFTCONN(task)) {
  2146				rpc_delay(task, 5*HZ);
  2147				goto retry_timeout;
  2148			}
  2149			status = task->tk_status;
  2150			break;
  2151		default:
  2152			trace_rpcb_unrecognized_err(task);
  2153		}
  2154	
  2155		rpc_call_rpcerror(task, status);
  2156		return;
  2157	out_next:
  2158		task->tk_action = call_connect;
  2159		return;
  2160	retry_timeout:
  2161		task->tk_status = 0;
  2162		task->tk_action = call_bind;
  2163		rpc_check_timeout(task);
  2164	}
  2165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
