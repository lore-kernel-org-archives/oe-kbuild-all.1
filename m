Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64B20307
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htK3Rr13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702639446; x=1734175446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUPQLrT4TneN7gHXQ4Vasom2t7nx/uMKf576EfmJk7w=;
  b=htK3Rr13bpsGLQy6rpWkJ0AS8u98gPHmcJI32ALYefKVrx20N7Mk98Es
   CWJ33fKUeNmrDJHO5pttuFLvU6o+jdtZRuJCdnXFDMleRKlIcAz3x04Ta
   9uRFtewDrZcAWcrfd90oUUsZ4r/BDyfZzXeT5WF3cgy4+rhi3dTnMnhVZ
   OrZk0aKEICAjWfWWgxYr7/Lb63oO3AnMPYuHcwTkqtdDGBgqIjD/hrKAv
   t/8ZZgvL4ap7hIcjn7knfX4vFxZgllKV8yt1b6PlXAik5OH7X7p2Lzx9l
   qRThgkfw+mNIGjAKn7WQPGoZ3y19AFuLe64oVd7hOUOODaDovIJWfbUvG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380259049"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="380259049"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 03:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="845093491"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="845093491"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2023 03:24:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE6IV-00005i-0q;
	Fri, 15 Dec 2023 11:24:03 +0000
Date: Fri, 15 Dec 2023 19:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider-bnxt 11/54] net/ipv4/tcp.c:2348:57:
 error: 'SO_DEVMEM_HEADER' undeclared
Message-ID: <202312151907.hILmyBBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider-bnxt
head:   07705cd570dcaaab11924a24695cd7f2b8f95f72
commit: 87693749a0b8c76a61d475e6a3603e80932c750e [11/54] tcp: RX path for devmem TCP
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312151907.hILmyBBh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151907.hILmyBBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151907.hILmyBBh-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_recvmsg_devmem':
>> net/ipv4/tcp.c:2348:57: error: 'SO_DEVMEM_HEADER' undeclared (first use in this function)
    2348 |                         err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_HEADER,
         |                                                         ^~~~~~~~~~~~~~~~
   net/ipv4/tcp.c:2348:57: note: each undeclared identifier is reported only once for each function it appears in
>> net/ipv4/tcp.c:2410:48: error: 'SO_DEVMEM_OFFSET' undeclared (first use in this function)
    2410 |                                                SO_DEVMEM_OFFSET,
         |                                                ^~~~~~~~~~~~~~~~


vim +/SO_DEVMEM_HEADER +2348 net/ipv4/tcp.c

  2306	
  2307	/* On error, returns the -errno. On success, returns number of bytes sent to the
  2308	 * user. May not consume all of @remaining_len.
  2309	 */
  2310	static int tcp_recvmsg_devmem(const struct sock *sk, const struct sk_buff *skb,
  2311				      unsigned int offset, struct msghdr *msg,
  2312				      int remaining_len)
  2313	{
  2314		struct cmsg_devmem cmsg_devmem = { 0 };
  2315		unsigned int start;
  2316		int i, copy, n;
  2317		int sent = 0;
  2318		int err = 0;
  2319	
  2320		do {
  2321			start = skb_headlen(skb);
  2322	
  2323			if (!skb_frags_not_readable(skb)) {
  2324				err = -ENODEV;
  2325				goto out;
  2326			}
  2327	
  2328			/* Copy header. */
  2329			copy = start - offset;
  2330			if (copy > 0) {
  2331				copy = min(copy, remaining_len);
  2332	
  2333				n = copy_to_iter(skb->data + offset, copy,
  2334						 &msg->msg_iter);
  2335				if (n != copy) {
  2336					err = -EFAULT;
  2337					goto out;
  2338				}
  2339	
  2340				offset += copy;
  2341				remaining_len -= copy;
  2342	
  2343				/* First a cmsg_devmem for # bytes copied to user
  2344				 * buffer.
  2345				 */
  2346				memset(&cmsg_devmem, 0, sizeof(cmsg_devmem));
  2347				cmsg_devmem.frag_size = copy;
> 2348				err = put_cmsg(msg, SOL_SOCKET, SO_DEVMEM_HEADER,
  2349					       sizeof(cmsg_devmem), &cmsg_devmem);
  2350				if (err || msg->msg_flags & MSG_CTRUNC) {
  2351					msg->msg_flags &= ~MSG_CTRUNC;
  2352					if (!err)
  2353						err = -ETOOSMALL;
  2354					goto out;
  2355				}
  2356	
  2357				sent += copy;
  2358	
  2359				if (remaining_len == 0)
  2360					goto out;
  2361			}
  2362	
  2363			/* after that, send information of devmem pages through a
  2364			 * sequence of cmsg
  2365			 */
  2366			for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2367				const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2368				struct page_pool_iov *ppiov;
  2369				u64 frag_offset;
  2370				u32 user_token;
  2371				int end;
  2372	
  2373				/* skb_frags_not_readable() should indicate that ALL the
  2374				 * frags in this skb are unreadable page_pool_iovs.
  2375				 * We're checking for that flag above, but also check
  2376				 * individual pages here. If the tcp stack is not
  2377				 * setting skb->devmem correctly, we still don't want to
  2378				 * crash here when accessing pgmap or priv below.
  2379				 */
  2380				if (!skb_frag_page_pool_iov(frag)) {
  2381					net_err_ratelimited("Found non-devmem skb with page_pool_iov");
  2382					err = -ENODEV;
  2383					goto out;
  2384				}
  2385	
  2386				ppiov = skb_frag_page_pool_iov(frag);
  2387				end = start + skb_frag_size(frag);
  2388				copy = end - offset;
  2389	
  2390				if (copy > 0) {
  2391					copy = min(copy, remaining_len);
  2392	
  2393					frag_offset = page_pool_iov_virtual_addr(ppiov) +
  2394						      skb_frag_off(frag) + offset -
  2395						      start;
  2396					cmsg_devmem.frag_offset = frag_offset;
  2397					cmsg_devmem.frag_size = copy;
  2398					err = xa_alloc((struct xarray *)&sk->sk_user_pages,
  2399						       &user_token, frag->bv_page,
  2400						       xa_limit_31b, GFP_KERNEL);
  2401					if (err)
  2402						goto out;
  2403	
  2404					cmsg_devmem.frag_token = user_token;
  2405	
  2406					offset += copy;
  2407					remaining_len -= copy;
  2408	
  2409					err = put_cmsg(msg, SOL_SOCKET,
> 2410						       SO_DEVMEM_OFFSET,
  2411						       sizeof(cmsg_devmem),
  2412						       &cmsg_devmem);
  2413					if (err || msg->msg_flags & MSG_CTRUNC) {
  2414						msg->msg_flags &= ~MSG_CTRUNC;
  2415						xa_erase((struct xarray *)&sk->sk_user_pages,
  2416							 user_token);
  2417						if (!err)
  2418							err = -ETOOSMALL;
  2419						goto out;
  2420					}
  2421	
  2422					page_pool_iov_get_many(ppiov, 1);
  2423	
  2424					sent += copy;
  2425	
  2426					if (remaining_len == 0)
  2427						goto out;
  2428				}
  2429				start = end;
  2430			}
  2431	
  2432			if (!remaining_len)
  2433				goto out;
  2434	
  2435			/* if remaining_len is not satisfied yet, we need to go to the
  2436			 * next frag in the frag_list to satisfy remaining_len.
  2437			 */
  2438			skb = skb_shinfo(skb)->frag_list ?: skb->next;
  2439	
  2440			offset = offset - start;
  2441		} while (skb);
  2442	
  2443		if (remaining_len) {
  2444			err = -EFAULT;
  2445			goto out;
  2446		}
  2447	
  2448	out:
  2449		if (!sent)
  2450			sent = err;
  2451	
  2452		return sent;
  2453	}
  2454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
