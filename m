Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE64A0EE4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381248; cv=none; b=uSMeT0BuZf9ugfE1rsROPsFmMG3PosTERBaBKOAWIOVCktxgPnEvJjSwsPclkdI4FV8+wW4PWKjLKMB2YKUdPZI09vz94j/vZQX5HCtL7kFoBQAegj3aGN5wLU86fbPq9p0XTRadSqsLhtRgNVTJvwW6tYGjpePjicptNe0ofNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381248; c=relaxed/simple;
	bh=EEIHqC9yZETD79YvDgBQON5T3/ppA7NK+XikhpOJXYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q1NaB+w/e3qhnGXhbJQ0SspU3dnuLdOcirPQtHAuM+iefkX5dnixnumlSO+2dMsdUVYHyw0zlehrnQTnkEUIUByM4ZxCmR1Prh7XIVJZEN9qyuyFCiU7VP+0uJBRcT/hcBLFTm5SCKa6TpOlJVdt07i2DNwexVBUIGwCFKF19n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrWvFnfb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrWvFnfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788381246; x=1819917246;
  h=date:from:to:cc:subject:message-id;
  bh=EEIHqC9yZETD79YvDgBQON5T3/ppA7NK+XikhpOJXYg=;
  b=OrWvFnfbZjwPRFKl6XLpt4m4rFtCYCmXyILXoznIyehcANvsEtWeOZI7
   vTya4h+GuBankrLYKdgPfkpKHjxtbwQ99/+pyxrB7ZFJn6a2DhWS4t1X+
   hSOpBJFU0NQ5vB82uebjiviU1Ts13eMq17LHxGn/+uLO24rNRsNEGIuzn
   HwoTbpLzuGD34RQRaFaui/w49biMRNNEs/a8SuKYCSnytGbAyhFKTjgTH
   TEvcVbu4g1kENd8OQWKShHKDqMmdVVRjqS4t0mf4yKAsNEHMsb4Zwq+sz
   UY9398kflMTujN/HMo4lt2KZsLnGq7Dikmz1Aig1yE9M8ddgY+BiQOAHf
   w==;
X-CSE-ConnectionGUID: DU+lw2vRQQqNqAVjoKgEBQ==
X-CSE-MsgGUID: dQ0F9s14SSyQs48Rn4fGCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99450187"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99450187"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 13:34:05 -0700
X-CSE-ConnectionGUID: 2346o9/LRmmi5KcTqYSHXA==
X-CSE-MsgGUID: 6vYc+QWdQiamqvEuAbtJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268190728"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2026 13:34:04 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1rej-000000000UR-3RuR;
	Wed, 02 Sep 2026 20:34:01 +0000
Date: Wed, 02 Sep 2026 22:33:55 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>
Subject: [cel:nfsd-testing 106/120] fs/nfsd/nfsctl.c:2253:4: warning:
 'snprintf' will always be truncated; specified size is 80, but format string
 expands to at least 94
Message-ID: <202609022220.wDXxnGAz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   ac579868af0c900d8fd9c8cfe9e10db46ccc5a75
commit: ce39bbabbe205b50b66ac935bd54036d86d86ba3 [106/120] NFSD: stop registering with rpcbind after a failure in listener_set
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260902/202609022220.wDXxnGAz-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022220.wDXxnGAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022220.wDXxnGAz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfsctl.c:2253:4: warning: 'snprintf' will always be truncated; specified size is 80, but format string expands to at least 94 [-Wformat-truncation]
    2253 |                         NL_SET_ERR_MSG_FMT(info->extack,
         |                         ^
   include/linux/netlink.h:116:6: note: expanded from macro 'NL_SET_ERR_MSG_FMT'
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^
   1 warning generated.


vim +/snprintf +2253 fs/nfsd/nfsctl.c

  2081	
  2082	/**
  2083	 * nfsd_nl_listener_set_doit - set the nfs running sockets
  2084	 * @skb: reply buffer
  2085	 * @info: netlink metadata and command arguments
  2086	 *
  2087	 * Return 0 on success or a negative errno.
  2088	 */
  2089	int nfsd_nl_listener_set_doit(struct sk_buff *skb, struct genl_info *info)
  2090	{
  2091		struct net *net = genl_info_net(info);
  2092		const struct nlattr *bad_attr = NULL;
  2093		struct svc_xprt *xprt, *tmp;
  2094		const char *bad_xprt = NULL;
  2095		unsigned int rpcb_failures;
  2096		const struct nlattr *attr;
  2097		bool skipped_rpcb = false;
  2098		bool bad_rpcb = false;
  2099		struct svc_serv *serv;
  2100		LIST_HEAD(permsocks);
  2101		struct nfsd_net *nn;
  2102		bool delete = false;
  2103		int err, rem;
  2104	
  2105		/*
  2106		 * Validate the entire listener list before making any changes, so a
  2107		 * malformed request fails cleanly without creating a serv or touching
  2108		 * the existing listeners.
  2109		 */
  2110		err = nfsd_nl_validate_listeners(info);
  2111		if (err)
  2112			return err;
  2113	
  2114		mutex_lock(&nfsd_mutex);
  2115	
  2116		err = nfsd_create_serv(net);
  2117		if (err) {
  2118			mutex_unlock(&nfsd_mutex);
  2119			return err;
  2120		}
  2121	
  2122		nn = net_generic(net, nfsd_net_id);
  2123		serv = nn->nfsd_serv;
  2124	
  2125		spin_lock_bh(&serv->sv_lock);
  2126	
  2127		/* Move all of the old listener sockets to a temp list */
  2128		list_splice_init(&serv->sv_permsocks, &permsocks);
  2129	
  2130		/*
  2131		 * Walk the list of server_socks from userland and move any that match
  2132		 * back to sv_permsocks
  2133		 */
  2134		nlmsg_for_each_attr_type(attr, NFSD_A_SERVER_SOCK_ADDR, info->nlhdr,
  2135					 GENL_HDRLEN, rem) {
  2136			struct nlattr *tb[NFSD_A_SOCK_MAX + 1];
  2137			const char *xcl_name;
  2138			struct sockaddr *sa;
  2139	
  2140			/* validated up front in nfsd_nl_validate_listeners() */
  2141			if (nla_parse_nested(tb, NFSD_A_SOCK_MAX, attr,
  2142					     nfsd_sock_nl_policy, info->extack) < 0)
  2143				continue;
  2144	
  2145			xcl_name = nla_data(tb[NFSD_A_SOCK_TRANSPORT_NAME]);
  2146			sa = nla_data(tb[NFSD_A_SOCK_ADDR]);
  2147	
  2148			/* Put back any matching sockets */
  2149			list_for_each_entry_safe(xprt, tmp, &permsocks, xpt_list) {
  2150				/* This shouldn't be possible */
  2151				if (WARN_ON_ONCE(xprt->xpt_net != net)) {
  2152					list_move(&xprt->xpt_list, &serv->sv_permsocks);
  2153					continue;
  2154				}
  2155	
  2156				/* If everything matches, put it back */
  2157				if (!strcmp(xprt->xpt_class->xcl_name, xcl_name) &&
  2158				    rpc_cmp_addr_port(sa, (struct sockaddr *)&xprt->xpt_local)) {
  2159					list_move(&xprt->xpt_list, &serv->sv_permsocks);
  2160					break;
  2161				}
  2162			}
  2163		}
  2164	
  2165		/*
  2166		 * If there are listener transports remaining on the permsocks list,
  2167		 * it means we were asked to remove a listener.
  2168		 */
  2169		if (!list_empty(&permsocks)) {
  2170			list_splice_init(&permsocks, &serv->sv_permsocks);
  2171			delete = true;
  2172		}
  2173		spin_unlock_bh(&serv->sv_lock);
  2174	
  2175		/* Do not remove listeners while there are active threads. */
  2176		if (serv->sv_nrthreads) {
  2177			err = -EBUSY;
  2178			goto out_unlock_mtx;
  2179		}
  2180	
  2181		/*
  2182		 * Since we can't delete an arbitrary llist entry, destroy the
  2183		 * remaining listeners and recreate the list.
  2184		 */
  2185		if (delete)
  2186			svc_xprt_destroy_all(serv, net, false);
  2187	
  2188		rpcb_failures = svc_rpcb_failure_count(serv);
  2189	
  2190		/* walk list of addrs again, open any that still don't exist */
  2191		nlmsg_for_each_attr_type(attr, NFSD_A_SERVER_SOCK_ADDR, info->nlhdr,
  2192					 GENL_HDRLEN, rem) {
  2193			struct nlattr *tb[NFSD_A_SOCK_MAX + 1];
  2194			const char *xcl_name;
  2195			struct sockaddr *sa;
  2196			bool hit_rpcb;
  2197			int flags, ret;
  2198	
  2199			/* validated up front in nfsd_nl_validate_listeners() */
  2200			if (nla_parse_nested(tb, NFSD_A_SOCK_MAX, attr,
  2201					     nfsd_sock_nl_policy, info->extack) < 0)
  2202				continue;
  2203	
  2204			xcl_name = nla_data(tb[NFSD_A_SOCK_TRANSPORT_NAME]);
  2205			sa = nla_data(tb[NFSD_A_SOCK_ADDR]);
  2206	
  2207			xprt = svc_find_listener(serv, xcl_name, net, sa);
  2208			if (xprt) {
  2209				if (delete)
  2210					WARN_ONCE(1, "Transport type=%s already exists\n",
  2211						  xcl_name);
  2212				svc_xprt_put(xprt);
  2213				continue;
  2214			}
  2215	
  2216			flags = skipped_rpcb ? SVC_SOCK_ANONYMOUS : 0;
  2217			ret = svc_xprt_create_from_sa(serv, xcl_name, net, sa, flags,
  2218						      current_cred());
  2219	
  2220			hit_rpcb = false;
  2221			if (!skipped_rpcb &&
  2222			    svc_rpcb_failure_count(serv) != rpcb_failures) {
  2223				skipped_rpcb = true;
  2224				hit_rpcb = true;
  2225				if (ret < 0)
  2226					ret = svc_xprt_create_from_sa(serv, xcl_name,
  2227								      net, sa,
  2228								      SVC_SOCK_ANONYMOUS,
  2229								      current_cred());
  2230			}
  2231	
  2232			/* always save the latest error */
  2233			if (ret < 0) {
  2234				bad_attr = attr;
  2235				bad_xprt = xcl_name;
  2236				bad_rpcb = hit_rpcb;
  2237				err = ret;
  2238			}
  2239		}
  2240	
  2241		/*
  2242		 * The ack carries the errno of the last entry that failed. Point at
  2243		 * that entry as well, since several entries can share a transport
  2244		 * name and the errno alone cannot tell them apart.
  2245		 */
  2246		if (err) {
  2247			NL_SET_BAD_ATTR(info->extack, bad_attr);
  2248			if (bad_rpcb)
  2249				NL_SET_ERR_MSG_FMT(info->extack,
  2250						   "cannot create %s listener; rpcbind did not answer",
  2251						   bad_xprt);
  2252			else if (skipped_rpcb)
> 2253				NL_SET_ERR_MSG_FMT(info->extack,
  2254						   "cannot create %s listener; rpcbind did not answer earlier, so some listeners are not registered",
  2255						   bad_xprt);
  2256			else
  2257				NL_SET_ERR_MSG_FMT(info->extack,
  2258						   "cannot create %s listener",
  2259						   bad_xprt);
  2260		} else if (skipped_rpcb) {
  2261			NL_SET_ERR_MSG(info->extack,
  2262				       "rpcbind did not answer, some listeners are not registered");
  2263		}
  2264	
  2265		if (!serv->sv_nrthreads && list_empty(&nn->nfsd_serv->sv_permsocks))
  2266			nfsd_destroy_serv(net);
  2267	
  2268	out_unlock_mtx:
  2269		mutex_unlock(&nfsd_mutex);
  2270	
  2271		return err;
  2272	}
  2273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
