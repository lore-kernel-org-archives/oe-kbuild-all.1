Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C312E5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616793; cv=none; b=IbmqIFGQWEx7JjCVawBDogzzlwVZOAu1HHMUSbYqKDlkjIFV9SGuID44km18tv8PCLTRIrofKGiVW4WCBjgdl0vz6QwFSuSh6+S29W0+XEtPR78vPVhkqh7KB1+Jak4qET14ooXEGXvuXcXm5pShHyy9f0kefC/et5lmpkD/hpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616793; c=relaxed/simple;
	bh=txaYUegfFab5WEb9d71ls+yKKoUSoAgtcW5erx1xGr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UksrzG9OF7Z6/emm45zR4y7rQqhx+DV55iPgU/KTBbo2F609QDYnaeIVL65p2/EfZfmPHZg27nU7kw6xOaM0day3dA/AQYISC7UYofx9ITplm8O0X1fxdj7A1/YvimYot35NwSMN1AEbeHWpwFa/tEmNA5UlG8uYUItvqqVHXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsrwUEmi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsrwUEmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728616791; x=1760152791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txaYUegfFab5WEb9d71ls+yKKoUSoAgtcW5erx1xGr0=;
  b=AsrwUEmi/XpztIzzZT4v07bPHSvX6FPvXMrOQtgqJM8TpsQjaeS6zgQP
   y4hkRy9AfG8pOQb25JZLgSrpZknCoktpbTMKCslxw5MGdABK8zbzlMaRR
   7QQEC2e5k8wbmONbKR3ynSq2ux+VZ+lsiJLidUmsxgzWKTnh4Orwr9zV1
   6feAL17xnhAU1vrNnqWoBSEOsqfslNODhrSdBX+9qmzSg1yaKgP0sDHa2
   P5dDjxUte6lSfvVIbCU8eu6k20knbekrFOzeaq1VxurHvfRavRrI0pL9M
   vMQxAxE8hEpHSzLj/D+gILc9c2FCF6tC15sU7WR90XM4fcsnk+DnrIXhM
   g==;
X-CSE-ConnectionGUID: CiuoH+C/R9aesVYs5EY6Jw==
X-CSE-MsgGUID: 1Xo+ycnFSHCE7ZHbVPmCfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39137039"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39137039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 20:19:50 -0700
X-CSE-ConnectionGUID: TZ7wj0OORsCqzEoMFGvzCQ==
X-CSE-MsgGUID: HZbc8NgBSFaQU3NO06MbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="77099201"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2024 20:19:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz6Bu-000Bfn-2x;
	Fri, 11 Oct 2024 03:19:46 +0000
Date: Fri, 11 Oct 2024 11:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v5 6/17] net/ipv4/tcp.c:2479:29: error: use of
 undeclared identifier 'dmabuf_devmem_ops'
Message-ID: <202410111147.mAa8ymox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v5
head:   d4e027e3d3f5ec0c2cf67a06df841fa6e0e8016f
commit: 7d14efdc8782b0359d840b3434d06415162da138 [6/17] net: prepare for non devmem TCP memory providers
config: i386-randconfig-002-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111147.mAa8ymox-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111147.mAa8ymox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111147.mAa8ymox-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/tcp.c:2479:29: error: use of undeclared identifier 'dmabuf_devmem_ops'
    2479 |                         if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
         |                                                  ^
   1 error generated.


vim +/dmabuf_devmem_ops +2479 net/ipv4/tcp.c

  2396	
  2397	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2398	 * user. May not consume all of @remaining_len.
  2399	 */
  2400	static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
  2401				      unsigned int offset, struct msghdr *msg,
  2402				      int remaining_len)
  2403	{
  2404		struct dmabuf_cmsg dmabuf_cmsg = { 0 };
  2405		struct tcp_xa_pool tcp_xa_pool;
  2406		unsigned int start;
  2407		int i, copy, n;
  2408		int sent = 0;
  2409		int err = 0;
  2410	
  2411		tcp_xa_pool.max = 0;
  2412		tcp_xa_pool.idx = 0;
  2413		do {
  2414			start = skb_headlen(skb);
  2415	
  2416			if (skb_frags_readable(skb)) {
  2417				err = -ENODEV;
  2418				goto out;
  2419			}
  2420	
  2421			/* Copy header. */
  2422			copy = start - offset;
  2423			if (copy > 0) {
  2424				copy = min(copy, remaining_len);
  2425	
  2426				n = copy_to_iter(skb->data + offset, copy,
  2427						 &msg->msg_iter);
  2428				if (n != copy) {
  2429					err = -EFAULT;
  2430					goto out;
  2431				}
  2432	
  2433				offset += copy;
  2434				remaining_len -= copy;
  2435	
  2436				/* First a dmabuf_cmsg for # bytes copied to user
  2437				 * buffer.
  2438				 */
  2439				memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
  2440				dmabuf_cmsg.frag_size = copy;
  2441				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
  2442					       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
  2443				if (err || msg->msg_flags & MSG_CTRUNC) {
  2444					msg->msg_flags &= ~MSG_CTRUNC;
  2445					if (!err)
  2446						err = -ETOOSMALL;
  2447					goto out;
  2448				}
  2449	
  2450				sent += copy;
  2451	
  2452				if (remaining_len == 0)
  2453					goto out;
  2454			}
  2455	
  2456			/* after that, send information of dmabuf pages through a
  2457			 * sequence of cmsg
  2458			 */
  2459			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2460				skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2461				struct net_iov *niov;
  2462				u64 frag_offset;
  2463				int end;
  2464	
  2465				/* !skb_frags_readable() should indicate that ALL the
  2466				 * frags in this skb are dmabuf net_iovs. We're checking
  2467				 * for that flag above, but also check individual frags
  2468				 * here. If the tcp stack is not setting
  2469				 * skb_frags_readable() correctly, we still don't want
  2470				 * to crash here.
  2471				 */
  2472				if (!skb_frag_net_iov(frag)) {
  2473					net_err_ratelimited("Found non-dmabuf skb with net_iov");
  2474					err = -ENODEV;
  2475					goto out;
  2476				}
  2477	
  2478				niov = skb_frag_net_iov(frag);
> 2479				if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
  2480					err = -ENODEV;
  2481					goto out;
  2482				}
  2483	
  2484				end = start + skb_frag_size(frag);
  2485				copy = end - offset;
  2486	
  2487				if (copy > 0) {
  2488					copy = min(copy, remaining_len);
  2489	
  2490					frag_offset = net_iov_virtual_addr(niov) +
  2491						      skb_frag_off(frag) + offset -
  2492						      start;
  2493					dmabuf_cmsg.frag_offset = frag_offset;
  2494					dmabuf_cmsg.frag_size = copy;
  2495					err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
  2496								 skb_shinfo(skb)->nr_frags - i);
  2497					if (err)
  2498						goto out;
  2499	
  2500					/* Will perform the exchange later */
  2501					dmabuf_cmsg.frag_token = tcp_xa_pool.tokens[tcp_xa_pool.idx];
  2502					dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
  2503	
  2504					offset += copy;
  2505					remaining_len -= copy;
  2506	
  2507					err = put_cmsg(msg, SOL_SOCKET,
  2508						       SO_DEVMEM_DMABUF,
  2509						       sizeof(dmabuf_cmsg),
  2510						       &dmabuf_cmsg);
  2511					if (err || msg->msg_flags & MSG_CTRUNC) {
  2512						msg->msg_flags &= ~MSG_CTRUNC;
  2513						if (!err)
  2514							err = -ETOOSMALL;
  2515						goto out;
  2516					}
  2517	
  2518					atomic_long_inc(&niov->pp_ref_count);
  2519					tcp_xa_pool.netmems[tcp_xa_pool.idx++] = skb_frag_netmem(frag);
  2520	
  2521					sent += copy;
  2522	
  2523					if (remaining_len == 0)
  2524						goto out;
  2525				}
  2526				start = end;
  2527			}
  2528	
  2529			tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2530			if (!remaining_len)
  2531				goto out;
  2532	
  2533			/* if remaining_len is not satisfied yet, we need to go to the
  2534			 * next frag in the frag_list to satisfy remaining_len.
  2535			 */
  2536			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2537	
  2538			offset = offset - start;
  2539		} while (skb);
  2540	
  2541		if (remaining_len) {
  2542			err = -EFAULT;
  2543			goto out;
  2544		}
  2545	
  2546	out:
  2547		tcp_xa_pool_commit(sk, &tcp_xa_pool);
  2548		if (!sent)
  2549			sent = err;
  2550	
  2551		return sent;
  2552	}
  2553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
