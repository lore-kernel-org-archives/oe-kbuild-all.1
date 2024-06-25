Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C931DFF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719288187; cv=none; b=Jyjnwhz8K9mwMVUKLYZaXUlokNewSjBpFcVxsP52nJR20Q8xyTYWGPka1uGzO1Tb44z36EEcDBgDz1vrDNn2MUErebC4nKHjJgUvUw7srYlIUZD4bdgiSKBerB93e/zV9GLP7QBFCPSuB3l1a9xE62xrrzE/ZNe67gsGFL0HY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719288187; c=relaxed/simple;
	bh=a1laPF6R25fpLoWyIQqEAzMUHwINlA2c6zXN/wAbPuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNiYsBGtfkrwh2WB9n0iNKnv+CCW+/DQL4BBC+25v9vbW6wcO2GLd67JAnUhVMAskfIggMQXA39O5iHTyLZgv12kGVZ2uCQRV9dfQroUjzFftCN+xOV/IN+4bpP6pLcny+ePZ+zGxLAM19du6Q5hQn/xazj3hNHssrRLrxY6VFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJzxZcV2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJzxZcV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719288185; x=1750824185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1laPF6R25fpLoWyIQqEAzMUHwINlA2c6zXN/wAbPuU=;
  b=YJzxZcV28GRdr3YJjD51sq8/7RmXYaS8C681VeDDjUhKIZ6QTQvv4S8b
   /DSiCaRroQ5LmVXDBnGeKD03VK9H9yDUJawnNRNmxIOQYLFx9lQJmskIb
   N6So8bL23uOzmr57XhOSp5yB3hqaQ5BvczB9b3YQTEV6vg9Hw0IXJCivJ
   NXc8pLNvbOlvKlnAMM900LZ5YHNcJoHMbgpIW+J92BMEfG2dXCH5MwB9b
   mLSRD9re2kTp+WvrCy2tq/mzOJBMJr2e7sbbfn4we1Ht3NcZZfEi5NbTb
   oiR5XW6kDLJ9T6ADwWk3v55j6kdwILpDD4Zk+W25DhEsHfvALv2utKbSt
   w==;
X-CSE-ConnectionGUID: g2B/9hurTT21hCpDKpUP5Q==
X-CSE-MsgGUID: b0lcXrv7R7CTj6cjSw03Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26973787"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="26973787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 21:03:05 -0700
X-CSE-ConnectionGUID: S1xo6wiHTxecPaQZC4xYiA==
X-CSE-MsgGUID: SQmD/gcYQpe5N2MbmgQlUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48470293"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2024 21:03:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLxOX-000E1i-0v;
	Tue, 25 Jun 2024 04:03:01 +0000
Date: Tue, 25 Jun 2024 12:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 19/35] net/ipv4/tcp.c:2472:29:
 error: use of undeclared identifier 'dmabuf_devmem_ops'
Message-ID: <202406251106.5Yybz2AA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: bab7f6a4065dd60dd4f88eab8dea93b24a426757 [19/35] tcp: devmem: ignore non-dmabuf net_iovs in tcp_recvmsg_dmabuf()
config: um-defconfig (https://download.01.org/0day-ci/archive/20240625/202406251106.5Yybz2AA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251106.5Yybz2AA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251106.5Yybz2AA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/ipv4/tcp.c:2472:29: error: use of undeclared identifier 'dmabuf_devmem_ops'
    2472 |                         if (niov->pp->mp_ops != &dmabuf_devmem_ops) {
         |                                                  ^
   13 warnings and 1 error generated.


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
