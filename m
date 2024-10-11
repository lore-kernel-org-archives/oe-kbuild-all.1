Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3361CB50C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 03:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616795; cv=none; b=MAQUkeZjeWU+RP3aBihowq3EBdMxce6JorD+9PMJ2wwRXHBFApNd6G6i5A8ORA3SNZsxtT/7qQcux32neI5RwEo4sJw7PZ2PfLYfMv4kc4Gpr6K8K0sjRHg+dq+O4F8tnd+uF7PTv3luW2yyjXwDSjBahryxg/Gew66yn2z9rrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616795; c=relaxed/simple;
	bh=Vc97G5aHWA5dhs7iAgIs6fVwhD7LYK2sBq8/2Mvvxz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwAaYvPorT6GageixYoPrN8ev7Z7/MR6iCcvtYtjsfiCxycXElHGZkAu5fdpIoduhEWqEVfia0uw/0XTPrZURdyfj+0P+Tl9Q77KbcG0g2/VCJqCVn9Vvrm2mkMTc/p+QPLYLCD8kzaV//ShQ0CjvPt1dcqibIqdITxR1cntk4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iO/1sOZx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iO/1sOZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728616793; x=1760152793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vc97G5aHWA5dhs7iAgIs6fVwhD7LYK2sBq8/2Mvvxz8=;
  b=iO/1sOZxc8oZ5jnvJ797+/DU8Y4QnkEwwYPPT2Ylyjw3aD8j2Qa1Tro2
   x9ddulM08XX4ALKfixTUmFHZwVfkfnlh9BOTCXc54ikPlScmYueF5sbpc
   ONubpz7SzjlYowDrwNEz/dOeS3WMV2yJqV+RvzzkCC4d63omImOksr/mU
   khdHqgZj4aw9DJSWDXsRtgV11bVpjp0+KW3nXRPbmG7I4I/Kc/8Ve0icR
   lAxgjqmvF8i2QpzMJJoAYkmLkeZW/hkKY6Gr1gHcYODaBkxz2BP/i5G/M
   JFnfihiLcYTn4rnV3DphqGWajLZ+ZPf1EI19N78COp3C6g3YoEpNr3u3/
   w==;
X-CSE-ConnectionGUID: uo1d7R10QUu+H1tBQ8ua+A==
X-CSE-MsgGUID: rvCHj5lDSoOkOIKwgyFsFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39137041"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39137041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 20:19:51 -0700
X-CSE-ConnectionGUID: A1Zywl/GRLa2ni5LYlG6VA==
X-CSE-MsgGUID: qXCCdElGRG2Kh5B79P/WWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="77099202"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2024 20:19:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz6Bu-000Bfl-2u;
	Fri, 11 Oct 2024 03:19:46 +0000
Date: Fri, 11 Oct 2024 11:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v5 6/17] net/ipv4/tcp.c:2479:50: error:
 'dmabuf_devmem_ops' undeclared
Message-ID: <202410111131.hj9PoVFl-lkp@intel.com>
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
config: i386-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111131.hj9PoVFl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111131.hj9PoVFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111131.hj9PoVFl-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_dmabuf':
>> net/ipv4/tcp.c:2479:50: error: 'dmabuf_devmem_ops' undeclared (first use in this function)
    2479 |                         if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
         |                                                  ^~~~~~~~~~~~~~~~~
   net/ipv4/tcp.c:2479:50: note: each undeclared identifier is reported only once for each function it appears in


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
