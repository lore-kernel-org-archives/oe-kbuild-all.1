Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B838FA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713220206; cv=none; b=Dx9InzkXAvM2IEodbTAqIQ85MC1H1iwTEbiCR4UzD8KX0jfteROF7wQqOrH2T/rkcHFByXAe6+7+5/cMqPYutwAL3KQE29aD3PYz8/GMV9qLns/bzNnIm3M+xzI4Ktgeem5cUlhXd/gnuBKmb9zus+lL92V0euzCwHf5ggXJYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713220206; c=relaxed/simple;
	bh=5Zlh70YE4z/gravv5PYc7MCkUFSc64D7xMt8M0S4eRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeHJiceFaCCjeJSmrrrZI+0HezHZWEpEtC8tC7kNgQCFqdFONs9BCVMEh0zwr1RrXjHhM/79uTIxP3v5b3/JTGtV0maJ40QUWBSXpa6yVOpyYB9r5QVHJVrE3pHKFhMqbM92He8x6nMkvATL+4xR2hUvewmOM/+bjV7XEQprCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbxAJrdW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbxAJrdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713220204; x=1744756204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Zlh70YE4z/gravv5PYc7MCkUFSc64D7xMt8M0S4eRY=;
  b=bbxAJrdWhvUsX2W7S3wiNs1eBVOM9/ukFv9DY+EHHItgBaZqyH90q64q
   qunOkyH8i0xNgO86v+b23ux4zdWAmmtuN+/wjbc8LH1LXKV6ljiF2PLSm
   unsG0BrCrCSfmPriDIfIsaNvkrReBb8/E4JqCuUmqeUxBBOIwqSYv0syI
   1eedssoqFCNNubnuUimxJIuSr3gr7ZtpJu0EAsxZByWacqMYjwmFLcTaj
   1sIMGajaENOSM8Lnlm0JAZZQP7918svxwa9XvFkuFj2MVgYYXIVqkW3jO
   JhhngohE7e7DnS7rFYVC1oAXH26RA9HL+g+b6IFpiQevlfR+bwMwiuZCe
   Q==;
X-CSE-ConnectionGUID: i5PnGv5UQ8COr+BWkFZXyg==
X-CSE-MsgGUID: 4LgXk7KuSGS1j9X96HxEqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8801149"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8801149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 15:30:03 -0700
X-CSE-ConnectionGUID: 53fV3dDORlK4OK91TJHWyg==
X-CSE-MsgGUID: IMD+Vbe4TSe7zLr7jzkPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="21950973"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2024 15:30:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwUpr-0004gI-33;
	Mon, 15 Apr 2024 22:29:59 +0000
Date: Tue, 16 Apr 2024 06:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/fix-readable 15/31] net/ipv4/tcp.c:2392:26: error:
 'const struct sk_buff' has no member named 'readable'; did you mean
 'unreadable'?
Message-ID: <202404160647.zZOMCKBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/fix-readable
head:   985568fdf9e0b9d0599474824ff3c5fc48521e33
commit: 62c0ffa021fb62a08f148251059a140e801632d2 [15/31] tcp: RX path for devmem TCP
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240416/202404160647.zZOMCKBY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160647.zZOMCKBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160647.zZOMCKBY-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2392:26: error: 'const struct sk_buff' has no member named 'readable'; did you mean 'unreadable'?
    2392 |                 if (skb->readable) {
         |                          ^~~~~~~~
         |                          unreadable
   net/ipv4/tcp.c: In function 'tcp_recvmsg_locked':
>> net/ipv4/tcp.c:2719:57: error: 'struct sk_buff' has no member named 'readable'; did you mean 'unreadable'?
    2719 |                             last_copied_dmabuf != !skb->readable)
         |                                                         ^~~~~~~~
         |                                                         unreadable
   net/ipv4/tcp.c:2722:34: error: 'struct sk_buff' has no member named 'readable'; did you mean 'unreadable'?
    2722 |                         if (skb->readable) {
         |                                  ^~~~~~~~
         |                                  unreadable
   net/ipv4/tcp.c:2754:44: error: 'struct sk_buff' has no member named 'readable'; did you mean 'unreadable'?
    2754 |                 last_copied_dmabuf = !skb->readable;
         |                                            ^~~~~~~~
         |                                            unreadable


vim +2392 net/ipv4/tcp.c

  2372	
  2373	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2374	 * user. May not consume all of @remaining_len.
  2375	 */
  2376	static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
  2377				      unsigned int offset, struct msghdr *msg,
  2378				      int remaining_len)
  2379	{
  2380		struct dmabuf_cmsg dmabuf_cmsg = { 0 };
  2381		struct tcp_xa_pool tcp_xa_pool;
  2382		unsigned int start;
  2383		int i, copy, n;
  2384		int sent = 0;
  2385		int err = 0;
  2386	
  2387		tcp_xa_pool.max = 0;
  2388		tcp_xa_pool.idx = 0;
  2389		do {
  2390			start = skb_headlen(skb);
  2391	
> 2392			if (skb->readable) {
  2393				err = -ENODEV;
  2394				goto out;
  2395			}
  2396	
  2397			/* Copy header. */
  2398			copy = start - offset;
  2399			if (copy > 0) {
  2400				copy = min(copy, remaining_len);
  2401	
  2402				n = copy_to_iter(skb->data + offset, copy,
  2403						 &msg->msg_iter);
  2404				if (n != copy) {
  2405					err = -EFAULT;
  2406					goto out;
  2407				}
  2408	
  2409				offset += copy;
  2410				remaining_len -= copy;
  2411	
  2412				/* First a dmabuf_cmsg for # bytes copied to user
  2413				 * buffer.
  2414				 */
  2415				memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
  2416				dmabuf_cmsg.frag_size = copy;
  2417				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
  2418					       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
  2419				if (err || msg->msg_flags & MSG_CTRUNC) {
  2420					msg->msg_flags &= ~MSG_CTRUNC;
  2421					if (!err)
  2422						err = -ETOOSMALL;
  2423					goto out;
  2424				}
  2425	
  2426				sent += copy;
  2427	
  2428				if (remaining_len == 0)
  2429					goto out;
  2430			}
  2431	
  2432			/* after that, send information of dmabuf pages through a
  2433			 * sequence of cmsg
  2434			 */
  2435			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2436				skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2437				struct net_iov *niov;
  2438				u64 frag_offset;
  2439				int end;
  2440	
  2441				/* !skb->readable should indicate that ALL the frags in
  2442				 * this skb are dmabuf net_iovs. We're checking
  2443				 * for that flag above, but also check individual frags
  2444				 * here. If the tcp stack is not setting skb->readable
  2445				 * correctly, we still don't want to crash here when
  2446				 * accessing pgmap or priv below.
  2447				 */
  2448				if (!skb_frag_net_iov(frag)) {
  2449					net_err_ratelimited("Found non-dmabuf skb with net_iov");
  2450					err = -ENODEV;
  2451					goto out;
  2452				}
  2453	
  2454				niov = skb_frag_net_iov(frag);
  2455				end = start + skb_frag_size(frag);
  2456				copy = end - offset;
  2457	
  2458				if (copy > 0) {
  2459					copy = min(copy, remaining_len);
  2460	
  2461					frag_offset = net_iov_virtual_addr(niov) +
  2462						      skb_frag_off(frag) + offset -
  2463						      start;
  2464					dmabuf_cmsg.frag_offset = frag_offset;
  2465					dmabuf_cmsg.frag_size = copy;
  2466					err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
  2467								 skb_shinfo(skb)->nr_frags - i);
  2468					if (err)
  2469						goto out;
  2470	
  2471					/* Will perform the exchange later */
  2472					dmabuf_cmsg.frag_token = tcp_xa_pool.tokens[tcp_xa_pool.idx];
  2473					dmabuf_cmsg.dmabuf_id = net_iov_binding_id(niov);
  2474	
  2475					offset += copy;
  2476					remaining_len -= copy;
  2477	
  2478					err = put_cmsg(msg, SOL_SOCKET,
  2479						       SO_DEVMEM_DMABUF,
  2480						       sizeof(dmabuf_cmsg),
  2481						       &dmabuf_cmsg);
  2482					if (err || msg->msg_flags & MSG_CTRUNC) {
  2483						msg->msg_flags &= ~MSG_CTRUNC;
  2484						if (!err)
  2485							err = -ETOOSMALL;
  2486						goto out;
  2487					}
  2488	
  2489					atomic_long_inc(&niov->pp_ref_count);
  2490					tcp_xa_pool.netmems[tcp_xa_pool.idx++] = skb_frag_netmem(frag);
  2491	
  2492					sent += copy;
  2493	
  2494					if (remaining_len == 0)
  2495						goto out;
  2496				}
  2497				start = end;
  2498			}
  2499	
  2500			tcp_xa_pool_commit(sk, &tcp_xa_pool, true);
  2501			if (!remaining_len)
  2502				goto out;
  2503	
  2504			/* if remaining_len is not satisfied yet, we need to go to the
  2505			 * next frag in the frag_list to satisfy remaining_len.
  2506			 */
  2507			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2508	
  2509			offset = offset - start;
  2510		} while (skb);
  2511	
  2512		if (remaining_len) {
  2513			err = -EFAULT;
  2514			goto out;
  2515		}
  2516	
  2517	out:
  2518		tcp_xa_pool_commit(sk, &tcp_xa_pool, true);
  2519		if (!sent)
  2520			sent = err;
  2521	
  2522		return sent;
  2523	}
  2524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
