Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D1A0BF6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726210423; cv=none; b=CQCaQQ8mzezPvTxxc6z9oZAP93O5y3RT6g/k27ygs3X3KfxVYj7ZAn0ZOMX85Vt7K6d3c4NJtp6aMzFOPDpxCtPLIVa5NvhjWc1pPlExmifEFbG0785D2RNQ1d8+PEJvuxf56C4ti/5z6lwy7GDtI2SZWcT44emKcpIOkn/hAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726210423; c=relaxed/simple;
	bh=COFN1xPQecy3qteIb9RMoPjvPFUUTd5hEecfUoPiYhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HvlA0AJk1rsvOetOpDUuv6t6B0ZF1yuUcVxGMI0tBqaa5CmvAdrb/d/7c3a02nZM/iY3aHhPWQbACUO1xjcOfzHmaOmtTWM/JYAle5hTFgm7YozQXsdGhfa1qw8fvWkpPqJw+nT8O70SWbx9QjYVFocTLlerNr9xtmGjYottZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EH1wcNdH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EH1wcNdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726210421; x=1757746421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COFN1xPQecy3qteIb9RMoPjvPFUUTd5hEecfUoPiYhM=;
  b=EH1wcNdHFoQ5hzp7CHou8LM6QAWXsE0SBoCqhCU01ecfNPnT/B0bS3mv
   okvHKvO/kqX8YoKPrahhmyQVkj5PPSFileIOtKtFxTkb5/rLAJOz7lfVb
   ALn97/ZgWKtk5EDQrslzmDH5QqfH21RvAISteR9nY8HygDuz+2JfTkM40
   +6CngYQm3THuxZ4gFIaKdqYid/uVV3+1sh1JoTGD/D42/2XySMQP3KwEK
   NSiiMYs5nnEyqQF5/8x/aq2rYsf825nu1cIzj+zi60JfWvlMeTZllXGu0
   3dN0urUNsXk47a4B+T1oVRU6AGlgL5jIjftyoFBj1YmrKL5aPEpD1CzId
   w==;
X-CSE-ConnectionGUID: P3QiyBZ7TICDVaOp9z4Vug==
X-CSE-MsgGUID: sDh/u6oSR0SiyBNr0s2Enw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28994328"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28994328"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 23:53:38 -0700
X-CSE-ConnectionGUID: eHLcOHI2R6SVSPbKY57aLQ==
X-CSE-MsgGUID: GHp1rFsDSkmie5Y0fA71nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67586528"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2024 23:53:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp0BT-000672-12;
	Fri, 13 Sep 2024 06:53:35 +0000
Date: Fri, 13 Sep 2024 14:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/35] net/ipv4/tcp.c:2473:50: error:
 'dmabuf_devmem_ops' undeclared
Message-ID: <202409131429.I8HwGAxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   4d31aa773b51854a28e098e1f4f74a4cf0701069
commit: 48fcdf1ae376f0ab7b3e606b2acd47e2ee56b62c [19/35] net: prepare to non devmem TCP memory providers
config: sparc64-randconfig-002-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131429.I8HwGAxq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131429.I8HwGAxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131429.I8HwGAxq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2473:50: error: 'dmabuf_devmem_ops' undeclared (first use in this function)
    2473 |                         if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
         |                                                  ^~~~~~~~~~~~~~~~~
   net/ipv4/tcp.c:2473:50: note: each undeclared identifier is reported only once for each function it appears in


vim +/dmabuf_devmem_ops +2473 net/ipv4/tcp.c

  2390	
  2391	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2392	 * user. May not consume all of @remaining_len.
  2393	 */
  2394	static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
  2395				      unsigned int offset, struct msghdr *msg,
  2396				      int remaining_len)
  2397	{
  2398		struct dmabuf_cmsg dmabuf_cmsg = { 0 };
  2399		struct tcp_xa_pool tcp_xa_pool;
  2400		unsigned int start;
  2401		int i, copy, n;
  2402		int sent = 0;
  2403		int err = 0;
  2404	
  2405		tcp_xa_pool.max = 0;
  2406		tcp_xa_pool.idx = 0;
  2407		do {
  2408			start = skb_headlen(skb);
  2409	
  2410			if (skb_frags_readable(skb)) {
  2411				err = -ENODEV;
  2412				goto out;
  2413			}
  2414	
  2415			/* Copy header. */
  2416			copy = start - offset;
  2417			if (copy > 0) {
  2418				copy = min(copy, remaining_len);
  2419	
  2420				n = copy_to_iter(skb->data + offset, copy,
  2421						 &msg->msg_iter);
  2422				if (n != copy) {
  2423					err = -EFAULT;
  2424					goto out;
  2425				}
  2426	
  2427				offset += copy;
  2428				remaining_len -= copy;
  2429	
  2430				/* First a dmabuf_cmsg for # bytes copied to user
  2431				 * buffer.
  2432				 */
  2433				memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
  2434				dmabuf_cmsg.frag_size = copy;
  2435				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
  2436					       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
  2437				if (err || msg->msg_flags & MSG_CTRUNC) {
  2438					msg->msg_flags &= ~MSG_CTRUNC;
  2439					if (!err)
  2440						err = -ETOOSMALL;
  2441					goto out;
  2442				}
  2443	
  2444				sent += copy;
  2445	
  2446				if (remaining_len == 0)
  2447					goto out;
  2448			}
  2449	
  2450			/* after that, send information of dmabuf pages through a
  2451			 * sequence of cmsg
  2452			 */
  2453			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2454				skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2455				struct net_iov *niov;
  2456				u64 frag_offset;
  2457				int end;
  2458	
  2459				/* !skb_frags_readable() should indicate that ALL the
  2460				 * frags in this skb are dmabuf net_iovs. We're checking
  2461				 * for that flag above, but also check individual frags
  2462				 * here. If the tcp stack is not setting
  2463				 * skb_frags_readable() correctly, we still don't want
  2464				 * to crash here.
  2465				 */
  2466				if (!skb_frag_net_iov(frag)) {
  2467					net_err_ratelimited("Found non-dmabuf skb with net_iov");
  2468					err = -ENODEV;
  2469					goto out;
  2470				}
  2471	
  2472				niov = skb_frag_net_iov(frag);
> 2473				if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
  2474					err = -ENODEV;
  2475					goto out;
  2476				}
  2477	
  2478				end = start + skb_frag_size(frag);
  2479				copy = end - offset;
  2480	
  2481				if (copy > 0) {
  2482					copy = min(copy, remaining_len);
  2483	
  2484					frag_offset = net_iov_virtual_addr(niov) +
  2485						      skb_frag_off(frag) + offset -
  2486						      start;
  2487					dmabuf_cmsg.frag_offset = frag_offset;
  2488					dmabuf_cmsg.frag_size = copy;
  2489					err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
  2490								 skb_shinfo(skb)->nr_frags - i);
  2491					if (err)
  2492						goto out;
  2493	
  2494					/* Will perform the exchange later */
  2495					dmabuf_cmsg.frag_token = tcp_xa_pool.tokens[tcp_xa_pool.idx];
  2496					dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
  2497	
  2498					offset += copy;
  2499					remaining_len -= copy;
  2500	
  2501					err = put_cmsg(msg, SOL_SOCKET,
  2502						       SO_DEVMEM_DMABUF,
  2503						       sizeof(dmabuf_cmsg),
  2504						       &dmabuf_cmsg);
  2505					if (err || msg->msg_flags & MSG_CTRUNC) {
  2506						msg->msg_flags &= ~MSG_CTRUNC;
  2507						if (!err)
  2508							err = -ETOOSMALL;
  2509						goto out;
  2510					}
  2511	
  2512					atomic_long_inc(&niov->pp_ref_count);
  2513					tcp_xa_pool.netmems[tcp_xa_pool.idx++] = skb_frag_netmem(frag);
  2514	
  2515					sent += copy;
  2516	
  2517					if (remaining_len == 0)
  2518						goto out;
  2519				}
  2520				start = end;
  2521			}
  2522	
  2523			tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2524			if (!remaining_len)
  2525				goto out;
  2526	
  2527			/* if remaining_len is not satisfied yet, we need to go to the
  2528			 * next frag in the frag_list to satisfy remaining_len.
  2529			 */
  2530			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2531	
  2532			offset = offset - start;
  2533		} while (skb);
  2534	
  2535		if (remaining_len) {
  2536			err = -EFAULT;
  2537			goto out;
  2538		}
  2539	
  2540	out:
  2541		tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2542		if (!sent)
  2543			sent = err;
  2544	
  2545		return sent;
  2546	}
  2547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
