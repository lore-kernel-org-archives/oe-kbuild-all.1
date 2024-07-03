Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9943717996
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720013462; cv=none; b=ccR7XDFyCsaCJLh9r9T9cEqMjxNtGp8Hr+sQpR+pLrJCTHDNiH3UmKXbVQz5kXryuuZfulhPOrBVg9BuGuJZOtMLfXIBIyQlfNpoGt7/keDvlcQaa2pVeUdu7qYs21DwOQiAVBJrqmhnyhreddmdy3ngXg/1gjU+O0W8JnbWD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720013462; c=relaxed/simple;
	bh=53yiSc0+kgVeqAgtEWODzSEbf2qkzLN9eRZFCCA7hd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tr+0M6qeGyb7DXd8SeANFz4MBvpVktUahH2Bcm9+6v9/yGMg33qQxR+9RR6HdvFtz5vbiX1Oc9TSlC7CFBTXvYjgqtFKDJ9YsI0YRMNGE5uxaWJPBYyGd84MA+dpBXTJsMmZF5V2ZYZzS2I3goSwFyfVahoZlQwQ3zf9JbUyvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es1Yr1es; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es1Yr1es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720013461; x=1751549461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53yiSc0+kgVeqAgtEWODzSEbf2qkzLN9eRZFCCA7hd8=;
  b=Es1Yr1esv0Qcl2Z/V3jb4gtOy4iqF2OGOiEd76MSSwAH2/vZnYrTUnkF
   g+2QXrKvY3+Pd57Fiy+/tC4oWaE+0JIrVQl5ATAOoo0EyjVwwJyN11uz9
   QVrnPf9CVWEcW9qlqPspbHHluNACGvYSszVPwYgwNYpgj3wLar3VUrEzM
   qAjbTVpMtioKalxeHsktuobFkH6bfdXYKWmiUqoNwGFrG0rtGKFL6qtQ2
   0DP0vA3GORW4zN7PvjzAlfrcmIJAIUA//vEdIvHUX3/Pkt5YyOPdYFqyu
   k7p9wYS7muzKajYhLpuyoNdv7zhaTBkMZM+f+Jdhx+kHjhlBG+TmuA6Xf
   g==;
X-CSE-ConnectionGUID: dqe9imAiQ8aEEo2TFaMdbw==
X-CSE-MsgGUID: uXUnH/oATRWszA7fXo+mgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21005432"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="21005432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:31:00 -0700
X-CSE-ConnectionGUID: BEi+nU80R0yy7ZdZkdeXsA==
X-CSE-MsgGUID: mBmdzeMoQ7WOoSpsMAE6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="77406872"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2024 06:30:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP04W-000PlW-01;
	Wed, 03 Jul 2024 13:30:56 +0000
Date: Wed, 3 Jul 2024 21:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 18/37] net/ipv4/tcp.c:2489:29: error: call to
 undeclared function 'net_devmem_iov_binding_id'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202407032124.P7PZHRJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   daa95af9ac26711b21e20be3c8d512d6de26bb11
commit: e1154ae207d2ef9599be621dbec9a702e73e7db8 [18/37] inverse deps
config: i386-randconfig-141-20240703 (https://download.01.org/0day-ci/archive/20240703/202407032124.P7PZHRJf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032124.P7PZHRJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032124.P7PZHRJf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/tcp.c:2489:29: error: call to undeclared function 'net_devmem_iov_binding_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2489 |                                 dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
         |                                                         ^
   1 error generated.


vim +/net_devmem_iov_binding_id +2489 net/ipv4/tcp.c

0bf6cf62c0e850 Mina Almasry   2024-06-13  2388  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2389  /* On error, returns the -errno. On success, returns number of bytes sent to the
0bf6cf62c0e850 Mina Almasry   2024-06-13  2390   * user. May not consume all of @remaining_len.
0bf6cf62c0e850 Mina Almasry   2024-06-13  2391   */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2392  static int tcp_recvmsg_dmabuf(struct sock *sk, const struct sk_buff *skb,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2393  			      unsigned int offset, struct msghdr *msg,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2394  			      int remaining_len)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2395  {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2396  	struct dmabuf_cmsg dmabuf_cmsg = { 0 };
0bf6cf62c0e850 Mina Almasry   2024-06-13  2397  	struct tcp_xa_pool tcp_xa_pool;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2398  	unsigned int start;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2399  	int i, copy, n;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2400  	int sent = 0;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2401  	int err = 0;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2402  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2403  	tcp_xa_pool.max = 0;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2404  	tcp_xa_pool.idx = 0;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2405  	do {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2406  		start = skb_headlen(skb);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2407  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2408  		if (skb_frags_readable(skb)) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2409  			err = -ENODEV;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2410  			goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2411  		}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2412  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2413  		/* Copy header. */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2414  		copy = start - offset;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2415  		if (copy > 0) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2416  			copy = min(copy, remaining_len);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2417  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2418  			n = copy_to_iter(skb->data + offset, copy,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2419  					 &msg->msg_iter);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2420  			if (n != copy) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2421  				err = -EFAULT;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2422  				goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2423  			}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2424  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2425  			offset += copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2426  			remaining_len -= copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2427  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2428  			/* First a dmabuf_cmsg for # bytes copied to user
0bf6cf62c0e850 Mina Almasry   2024-06-13  2429  			 * buffer.
0bf6cf62c0e850 Mina Almasry   2024-06-13  2430  			 */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2431  			memset(&dmabuf_cmsg, 0, sizeof(dmabuf_cmsg));
0bf6cf62c0e850 Mina Almasry   2024-06-13  2432  			dmabuf_cmsg.frag_size = copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2433  			err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_LINEAR,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2434  				       sizeof(dmabuf_cmsg), &dmabuf_cmsg);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2435  			if (err || msg->msg_flags & MSG_CTRUNC) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2436  				msg->msg_flags &= ~MSG_CTRUNC;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2437  				if (!err)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2438  					err = -ETOOSMALL;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2439  				goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2440  			}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2441  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2442  			sent += copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2443  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2444  			if (remaining_len == 0)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2445  				goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2446  		}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2447  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2448  		/* after that, send information of dmabuf pages through a
0bf6cf62c0e850 Mina Almasry   2024-06-13  2449  		 * sequence of cmsg
0bf6cf62c0e850 Mina Almasry   2024-06-13  2450  		 */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2451  		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2452  			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
0bf6cf62c0e850 Mina Almasry   2024-06-13  2453  			struct net_iov *niov;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2454  			u64 frag_offset;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2455  			int end;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2456  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2457  			/* !skb_frags_readable() should indicate that ALL the
0bf6cf62c0e850 Mina Almasry   2024-06-13  2458  			 * frags in this skb are dmabuf net_iovs. We're checking
0bf6cf62c0e850 Mina Almasry   2024-06-13  2459  			 * for that flag above, but also check individual frags
0bf6cf62c0e850 Mina Almasry   2024-06-13  2460  			 * here. If the tcp stack is not setting
0bf6cf62c0e850 Mina Almasry   2024-06-13  2461  			 * skb_frags_readable() correctly, we still don't want
0bf6cf62c0e850 Mina Almasry   2024-06-13  2462  			 * to crash here.
0bf6cf62c0e850 Mina Almasry   2024-06-13  2463  			 */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2464  			if (!skb_frag_net_iov(frag)) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2465  				net_err_ratelimited("Found non-dmabuf skb with net_iov");
0bf6cf62c0e850 Mina Almasry   2024-06-13  2466  				err = -ENODEV;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2467  				goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2468  			}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2469  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2470  			niov = skb_frag_net_iov(frag);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2471  			end = start + skb_frag_size(frag);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2472  			copy = end - offset;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2473  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2474  			if (copy > 0) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2475  				copy = min(copy, remaining_len);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2476  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2477  				frag_offset = net_iov_virtual_addr(niov) +
0bf6cf62c0e850 Mina Almasry   2024-06-13  2478  					      skb_frag_off(frag) + offset -
0bf6cf62c0e850 Mina Almasry   2024-06-13  2479  					      start;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2480  				dmabuf_cmsg.frag_offset = frag_offset;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2481  				dmabuf_cmsg.frag_size = copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2482  				err = tcp_xa_pool_refill(sk, &tcp_xa_pool,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2483  							 skb_shinfo(skb)->nr_frags - i);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2484  				if (err)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2485  					goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2486  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2487  				/* Will perform the exchange later */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2488  				dmabuf_cmsg.frag_token = tcp_xa_pool.tokens[tcp_xa_pool.idx];
a9069ffbd67ea1 Pavel Begunkov 2024-06-24 @2489  				dmabuf_cmsg.dmabuf_id = net_devmem_iov_binding_id(niov);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2490  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2491  				offset += copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2492  				remaining_len -= copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2493  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2494  				err = put_cmsg(msg, SOL_SOCKET,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2495  					       SO_DEVMEM_DMABUF,
0bf6cf62c0e850 Mina Almasry   2024-06-13  2496  					       sizeof(dmabuf_cmsg),
0bf6cf62c0e850 Mina Almasry   2024-06-13  2497  					       &dmabuf_cmsg);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2498  				if (err || msg->msg_flags & MSG_CTRUNC) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2499  					msg->msg_flags &= ~MSG_CTRUNC;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2500  					if (!err)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2501  						err = -ETOOSMALL;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2502  					goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2503  				}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2504  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2505  				atomic_long_inc(&niov->pp_ref_count);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2506  				tcp_xa_pool.netmems[tcp_xa_pool.idx++] = skb_frag_netmem(frag);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2507  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2508  				sent += copy;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2509  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2510  				if (remaining_len == 0)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2511  					goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2512  			}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2513  			start = end;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2514  		}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2515  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2516  		tcp_xa_pool_commit(sk, &tcp_xa_pool);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2517  		if (!remaining_len)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2518  			goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2519  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2520  		/* if remaining_len is not satisfied yet, we need to go to the
0bf6cf62c0e850 Mina Almasry   2024-06-13  2521  		 * next frag in the frag_list to satisfy remaining_len.
0bf6cf62c0e850 Mina Almasry   2024-06-13  2522  		 */
0bf6cf62c0e850 Mina Almasry   2024-06-13  2523  		skb = skb_shinfo(skb)->frag_list ?: skb->next;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2524  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2525  		offset = offset - start;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2526  	} while (skb);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2527  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2528  	if (remaining_len) {
0bf6cf62c0e850 Mina Almasry   2024-06-13  2529  		err = -EFAULT;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2530  		goto out;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2531  	}
0bf6cf62c0e850 Mina Almasry   2024-06-13  2532  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2533  out:
0bf6cf62c0e850 Mina Almasry   2024-06-13  2534  	tcp_xa_pool_commit(sk, &tcp_xa_pool);
0bf6cf62c0e850 Mina Almasry   2024-06-13  2535  	if (!sent)
0bf6cf62c0e850 Mina Almasry   2024-06-13  2536  		sent = err;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2537  
0bf6cf62c0e850 Mina Almasry   2024-06-13  2538  	return sent;
0bf6cf62c0e850 Mina Almasry   2024-06-13  2539  }
0bf6cf62c0e850 Mina Almasry   2024-06-13  2540  

:::::: The code at line 2489 was first introduced by commit
:::::: a9069ffbd67ea119a4e6b0a6efd994d60381e2cc net: name TCP devmem specific helpers as such

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Pavel Begunkov <asml.silence@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
