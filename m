Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9121CA87
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 01:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719278379; cv=none; b=G8CpE0acYYFct2Bq/D/9T0SE/iCHhr6FiZroNCEfq9NNE8tQ6EACcW49w+IQbYMJ6dUc5aptsKDhbJiWda05RmNL3htjp0ZqQjFsQy2panUV5fVNX1ICDHzrrGyx4KxsMrSPe445GqMI0ByTb1jFXHuGnSMJjaKtmDLEwcuTCuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719278379; c=relaxed/simple;
	bh=u7rQjPWiERu/ePf93j/sZxfcrACjL1icAJotk0b6SSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLKw3QwfeJV77/P6D0MO8sY+fHd5Ch4l0c8RDFbvbQBk2i1V4cnRYRi0hZltFtkdbvHkxYwB5FrKe3LEtsyaewH4jZ6P8nmxnbxMu5J20u/yeTioB6m/2N2pRmp2Ys/Bn8fbslfIpg2R65sN3wrYWM/Q7l8jpATmiVzp9Q59EDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djFAJRUF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djFAJRUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719278378; x=1750814378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u7rQjPWiERu/ePf93j/sZxfcrACjL1icAJotk0b6SSY=;
  b=djFAJRUFbpyTuiSeJJo5XutaiYPbqvVtNTrmA4WjTqffzrOyAfxPR6lZ
   U+bM6fT0k0YbcwxwAUxbbXb7tbVQiHq8O5+De1HARjVF9o/Zyf6Zz6aa9
   TOGyOpId7iEwZj6D+uuYn+vfWWTczJc39j3UX4KiqTNf4jGrwoPiwVwCs
   2K2HxfFgUJcKUKnjTF4CFJHutW6ZAJ3ziU2lCEjK4ulgF71B8k+2oHCI4
   uDb+fU2OToADkLTHIWNziynMvLFcvcqTGbEAYvYOnqrw3zF+LFHjJSIJQ
   LqLcNvBNT4/ZHCEkha8fFYkjaaCverLXfX+JIjjBU/qrdqUyJRQqpEAZF
   g==;
X-CSE-ConnectionGUID: 4tIRxhAmQHKOwmQNv917yw==
X-CSE-MsgGUID: FfPGszAOTRqT+/Ie8o67xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33812855"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="33812855"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 18:19:37 -0700
X-CSE-ConnectionGUID: JDkr4tM1QqOTt3f5+VevRg==
X-CSE-MsgGUID: Q6wk2S5ASbixFTUkiUcg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48019198"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2024 18:19:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLuqL-000DtV-31;
	Tue, 25 Jun 2024 01:19:33 +0000
Date: Tue, 25 Jun 2024 09:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 19/35] net/ipv4/tcp.c:2472:50:
 error: 'dmabuf_devmem_ops' undeclared
Message-ID: <202406250945.RenC6fAu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   51bbeb6c2f8313a909a0656680163260194e6c61
commit: bab7f6a4065dd60dd4f88eab8dea93b24a426757 [19/35] tcp: devmem: ignore non-dmabuf net_iovs in tcp_recvmsg_dmabuf()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240625/202406250945.RenC6fAu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250945.RenC6fAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250945.RenC6fAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2472:50: error: 'dmabuf_devmem_ops' undeclared (first use in this function)
    2472 |                         if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
         |                                                  ^~~~~~~~~~~~~~~~~
   net/ipv4/tcp.c:2472:50: note: each undeclared identifier is reported only once for each function it appears in


vim +/dmabuf_devmem_ops +2472 net/ipv4/tcp.c

  2389	
  2390	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2391	 * user. May not consume all of @remaining_len.
  2392	 */
  2393	static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
  2394				      unsigned int offset, struct msghdr *msg,
  2395				      int remaining_len)
  2396	{
  2397		struct dmabuf_cmsg dmabuf_cmsg = { 0 };
  2398		struct tcp_xa_pool tcp_xa_pool;
  2399		unsigned int start;
  2400		int i, copy, n;
  2401		int sent = 0;
  2402		int err = 0;
  2403	
  2404		tcp_xa_pool.max = 0;
  2405		tcp_xa_pool.idx = 0;
  2406		do {
  2407			start = skb_headlen(skb);
  2408	
  2409			if (skb_frags_readable(skb)) {
  2410				err = -ENODEV;
  2411				goto out;
  2412			}
  2413	
  2414			/* Copy header. */
  2415			copy = start - offset;
  2416			if (copy > 0) {
  2417				copy = min(copy, remaining_len);
  2418	
  2419				n = copy_to_iter(skb->data + offset, copy,
  2420						 &msg->msg_iter);
  2421				if (n != copy) {
  2422					err = -EFAULT;
  2423					goto out;
  2424				}
  2425	
  2426				offset += copy;
  2427				remaining_len -= copy;
  2428	
  2429				/* First a dmabuf_cmsg for # bytes copied to user
  2430				 * buffer.
  2431				 */
  2432				memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
  2433				dmabuf_cmsg.frag_size = copy;
  2434				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
  2435					       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
  2436				if (err || msg->msg_flags & MSG_CTRUNC) {
  2437					msg->msg_flags &= ~MSG_CTRUNC;
  2438					if (!err)
  2439						err = -ETOOSMALL;
  2440					goto out;
  2441				}
  2442	
  2443				sent += copy;
  2444	
  2445				if (remaining_len == 0)
  2446					goto out;
  2447			}
  2448	
  2449			/* after that, send information of dmabuf pages through a
  2450			 * sequence of cmsg
  2451			 */
  2452			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2453				skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2454				struct net_iov *niov;
  2455				u64 frag_offset;
  2456				int end;
  2457	
  2458				/* !skb_frags_readable() should indicate that ALL the
  2459				 * frags in this skb are dmabuf net_iovs. We're checking
  2460				 * for that flag above, but also check individual frags
  2461				 * here. If the tcp stack is not setting
  2462				 * skb_frags_readable() correctly, we still don't want
  2463				 * to crash here.
  2464				 */
  2465				if (!skb_frag_net_iov(frag)) {
  2466					net_err_ratelimited("Found non-dmabuf skb with net_iov");
  2467					err = -ENODEV;
  2468					goto out;
  2469				}
  2470	
  2471				niov = skb_frag_net_iov(frag);
> 2472				if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
  2473					err = -ENODEV;
  2474					goto out;
  2475				}
  2476	
  2477				end = start + skb_frag_size(frag);
  2478				copy = end - offset;
  2479	
  2480				if (copy > 0) {
  2481					copy = min(copy, remaining_len);
  2482	
  2483					frag_offset = net_iov_virtual_addr(niov) +
  2484						      skb_frag_off(frag) + offset -
  2485						      start;
  2486					dmabuf_cmsg.frag_offset = frag_offset;
  2487					dmabuf_cmsg.frag_size = copy;
  2488					err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
  2489								 skb_shinfo(skb)->nr_frags - i);
  2490					if (err)
  2491						goto out;
  2492	
  2493					/* Will perform the exchange later */
  2494					dmabuf_cmsg.frag_token = tcp_xa_pool.tokens[tcp_xa_pool.idx];
  2495					dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
  2496	
  2497					offset += copy;
  2498					remaining_len -= copy;
  2499	
  2500					err = put_cmsg(msg, SOL_SOCKET,
  2501						       SO_DEVMEM_DMABUF,
  2502						       sizeof(dmabuf_cmsg),
  2503						       &dmabuf_cmsg);
  2504					if (err || msg->msg_flags & MSG_CTRUNC) {
  2505						msg->msg_flags &= ~MSG_CTRUNC;
  2506						if (!err)
  2507							err = -ETOOSMALL;
  2508						goto out;
  2509					}
  2510	
  2511					atomic_long_inc(&niov->pp_ref_count);
  2512					tcp_xa_pool.netmems[tcp_xa_pool.idx++] = skb_frag_netmem(frag);
  2513	
  2514					sent += copy;
  2515	
  2516					if (remaining_len == 0)
  2517						goto out;
  2518				}
  2519				start = end;
  2520			}
  2521	
  2522			tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2523			if (!remaining_len)
  2524				goto out;
  2525	
  2526			/* if remaining_len is not satisfied yet, we need to go to the
  2527			 * next frag in the frag_list to satisfy remaining_len.
  2528			 */
  2529			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2530	
  2531			offset = offset - start;
  2532		} while (skb);
  2533	
  2534		if (remaining_len) {
  2535			err = -EFAULT;
  2536			goto out;
  2537		}
  2538	
  2539	out:
  2540		tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2541		if (!sent)
  2542			sent = err;
  2543	
  2544		return sent;
  2545	}
  2546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
