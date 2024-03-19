Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E601E532
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710891476; cv=none; b=W9O5O/1wL0rpHPKWy6wk8m+ldatC+/+Y23yggLYufRJH+6ANSgcKlehghLpg5gv98yrBlQN7yLh8R5an7LHKxAV9zhNIdeq5XA2MRfQWbL33IWeVLLTiR7SlzSJYUOFc03/K8iq8nsjE/qoCM9JMj+6t6oECoQ8utPP/X9S9amk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710891476; c=relaxed/simple;
	bh=qcmheIwnM8SFGtfwpWo3gyGvZUDnTQlmIHuJt4HNOXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTTLNAhCdCY2EyaHBMqBdBinRWC2GugetUhut0RZu76ekYH75Nx3pMUhTRYWn2lk/ip/riTPV+Hw57fQ3uQ2okkL2rWuGKB3IJZQwgXVG+VnRZ08gWGBE1DYQY1YbSTAcYRcR2MFm10rRFviMyglhe2KDfP9OKC5N1y/ejvcggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtLEwl8m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtLEwl8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710891474; x=1742427474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qcmheIwnM8SFGtfwpWo3gyGvZUDnTQlmIHuJt4HNOXY=;
  b=BtLEwl8mP00WLTjXH+VkahgXMsBXZGLQ4KTpYsPuAwCICN8S7Pco4why
   GJWM/U3eSvvQ3Nu5RGJnE4kyD4FKnzo4RmTGcV5Oynpg+Jllu+lU7cxq2
   DySiIkzLSnewQKUth9KgxMtQ2ak2QuWpwt20oRw/6sx396Oj23vOIa9bK
   SXBoB4zjrL/h/lhZihdTusOsivgx61EN+AgVtdbJ5sQUHmDRbqyFOf+ms
   VTaaq03DLDQpIxFuIHHmDq2T7oPDx9bN+6gF/tFjuA3UszqG099DTbIFj
   BJ0b4my6IHgNw2L/9Gw1G58Oh+lDRTfDgHe5JRK8gSdZeW23snNXLByAf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="31228930"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="31228930"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 16:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="51420109"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2024 16:37:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmj1h-000IAJ-2d;
	Tue, 19 Mar 2024 23:37:49 +0000
Date: Wed, 20 Mar 2024 07:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_prototype 78/78]
 net/kcm/kcmsock.c:806:49: error: initialization of 'struct page_frag *' from
 incompatible pointer type 'struct page_frag_cache *'
Message-ID: <202403200730.191kPQQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_prototype
head:   7315604eb1d087836123bc9670d2be420a42d37f
commit: 7315604eb1d087836123bc9670d2be420a42d37f [78/78] net: replace page_frag with page_frag_cache
config: arm-randconfig-004-20240320 (https://download.01.org/0day-ci/archive/20240320/202403200730.191kPQQT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200730.191kPQQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200730.191kPQQT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/kcm/kcmsock.c: In function 'kcm_sendmsg':
>> net/kcm/kcmsock.c:806:49: error: initialization of 'struct page_frag *' from incompatible pointer type 'struct page_frag_cache *' [-Werror=incompatible-pointer-types]
     806 |                 struct page_frag *pfrag_cache = sk_page_frag(sk);
         |                                                 ^~~~~~~~~~~~
>> net/kcm/kcmsock.c:811:53: error: 'pfrag' undeclared (first use in this function)
     811 |                 va = sk_page_frag_alloc_prepare(sk, pfrag, &size, &offset);
         |                                                     ^~~~~
   net/kcm/kcmsock.c:811:53: note: each undeclared identifier is reported only once for each function it appears in
>> net/kcm/kcmsock.c:806:35: warning: unused variable 'pfrag_cache' [-Wunused-variable]
     806 |                 struct page_frag *pfrag_cache = sk_page_frag(sk);
         |                                   ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   net/mptcp/protocol.c: In function 'mptcp_sendmsg':
>> net/mptcp/protocol.c:1825:15: error: assignment to 'struct page_frag *' from incompatible pointer type 'struct page_frag_cache *' [-Werror=incompatible-pointer-types]
    1825 |         pfrag = sk_page_frag(sk);
         |               ^
   cc1: some warnings being treated as errors
--
   net/tls/tls_device.c: In function 'tls_do_allocation':
>> net/tls/tls_device.c:390:14: error: implicit declaration of function 'sk_page_frag_refill'; did you mean 'skb_page_frag_refill'? [-Werror=implicit-function-declaration]
     390 |         if (!sk_page_frag_refill(sk, pfrag))
         |              ^~~~~~~~~~~~~~~~~~~
         |              skb_page_frag_refill
   net/tls/tls_device.c: In function 'tls_push_data':
>> net/tls/tls_device.c:460:15: error: assignment to 'struct page_frag *' from incompatible pointer type 'struct page_frag_cache *' [-Werror=incompatible-pointer-types]
     460 |         pfrag = sk_page_frag(sk);
         |               ^
   cc1: some warnings being treated as errors


vim +806 net/kcm/kcmsock.c

   746	
   747	static int kcm_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
   748	{
   749		struct sock *sk = sock->sk;
   750		struct kcm_sock *kcm = kcm_sk(sk);
   751		struct sk_buff *skb = NULL, *head = NULL;
   752		size_t copy, copied = 0;
   753		long timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
   754		int eor = (sock->type == SOCK_DGRAM) ?
   755			  !(msg->msg_flags & MSG_MORE) : !!(msg->msg_flags & MSG_EOR);
   756		int err = -EPIPE;
   757	
   758		lock_sock(sk);
   759	
   760		/* Per tcp_sendmsg this should be in poll */
   761		sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
   762	
   763		if (sk->sk_err)
   764			goto out_error;
   765	
   766		if (kcm->seq_skb) {
   767			/* Previously opened message */
   768			head = kcm->seq_skb;
   769			skb = kcm_tx_msg(head)->last_skb;
   770			goto start;
   771		}
   772	
   773		/* Call the sk_stream functions to manage the sndbuf mem. */
   774		if (!sk_stream_memory_free(sk)) {
   775			kcm_push(kcm);
   776			set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
   777			err = sk_stream_wait_memory(sk, &timeo);
   778			if (err)
   779				goto out_error;
   780		}
   781	
   782		if (msg_data_left(msg)) {
   783			/* New message, alloc head skb */
   784			head = alloc_skb(0, sk->sk_allocation);
   785			while (!head) {
   786				kcm_push(kcm);
   787				err = sk_stream_wait_memory(sk, &timeo);
   788				if (err)
   789					goto out_error;
   790	
   791				head = alloc_skb(0, sk->sk_allocation);
   792			}
   793	
   794			skb = head;
   795	
   796			/* Set ip_summed to CHECKSUM_UNNECESSARY to avoid calling
   797			 * csum_and_copy_from_iter from skb_do_copy_data_nocache.
   798			 */
   799			skb->ip_summed = CHECKSUM_UNNECESSARY;
   800		}
   801	
   802	start:
   803		while (msg_data_left(msg)) {
   804			bool merge = true;
   805			int i = skb_shinfo(skb)->nr_frags;
 > 806			struct page_frag *pfrag_cache = sk_page_frag(sk);
   807			unsigned int offset, size;
   808			struct page *page;
   809			void *va;
   810	
 > 811			va = sk_page_frag_alloc_prepare(sk, pfrag, &size, &offset);
   812			if (!va)
   813				goto wait_for_memory;
   814	
   815			page = virt_to_page(va);
   816			if (!skb_can_coalesce(skb, i, page, offset)) {
   817				if (i == MAX_SKB_FRAGS) {
   818					struct sk_buff *tskb;
   819	
   820					tskb = alloc_skb(0, sk->sk_allocation);
   821					if (!tskb)
   822						goto wait_for_memory;
   823	
   824					if (head == skb)
   825						skb_shinfo(head)->frag_list = tskb;
   826					else
   827						skb->next = tskb;
   828	
   829					skb = tskb;
   830					skb->ip_summed = CHECKSUM_UNNECESSARY;
   831					continue;
   832				}
   833				merge = false;
   834			}
   835	
   836			if (msg->msg_flags & MSG_SPLICE_PAGES) {
   837				copy = msg_data_left(msg);
   838				if (!sk_wmem_schedule(sk, copy))
   839					goto wait_for_memory;
   840	
   841				err = skb_splice_from_iter(skb, &msg->msg_iter, copy,
   842							   sk->sk_allocation);
   843				if (err < 0) {
   844					if (err == -EMSGSIZE)
   845						goto wait_for_memory;
   846					goto out_error;
   847				}
   848	
   849				copy = err;
   850				skb_shinfo(skb)->flags |= SKBFL_SHARED_FRAG;
   851				sk_wmem_queued_add(sk, copy);
   852				sk_mem_charge(sk, copy);
   853	
   854				if (head != skb)
   855					head->truesize += copy;
   856			} else {
   857				copy = min_t(int, msg_data_left(msg), size);
   858				if (!sk_wmem_schedule(sk, copy))
   859					goto wait_for_memory;
   860	
   861				err = skb_copy_to_va_nocache(sk, &msg->msg_iter, skb,
   862							     va + offset, copy);
   863				if (err)
   864					goto out_error;
   865	
   866				/* Update the skb. */
   867				if (merge) {
   868					skb_frag_size_add(
   869						&skb_shinfo(skb)->frags[i - 1], copy);
   870					page_frag_alloc_commit_noref(pfrag, offset, copy);
   871				} else {
   872					skb_fill_page_desc(skb, i, page, offset, copy);
   873					page_frag_alloc_commit(pfrag, offset, copy);
   874				}
   875	
   876			}
   877	
   878			copied += copy;
   879			if (head != skb) {
   880				head->len += copy;
   881				head->data_len += copy;
   882			}
   883	
   884			continue;
   885	
   886	wait_for_memory:
   887			kcm_push(kcm);
   888			err = sk_stream_wait_memory(sk, &timeo);
   889			if (err)
   890				goto out_error;
   891		}
   892	
   893		if (eor) {
   894			bool not_busy = skb_queue_empty(&sk->sk_write_queue);
   895	
   896			if (head) {
   897				/* Message complete, queue it on send buffer */
   898				__skb_queue_tail(&sk->sk_write_queue, head);
   899				kcm->seq_skb = NULL;
   900				KCM_STATS_INCR(kcm->stats.tx_msgs);
   901			}
   902	
   903			if (msg->msg_flags & MSG_BATCH) {
   904				kcm->tx_wait_more = true;
   905			} else if (kcm->tx_wait_more || not_busy) {
   906				err = kcm_write_msgs(kcm);
   907				if (err < 0) {
   908					/* We got a hard error in write_msgs but have
   909					 * already queued this message. Report an error
   910					 * in the socket, but don't affect return value
   911					 * from sendmsg
   912					 */
   913					pr_warn("KCM: Hard failure on kcm_write_msgs\n");
   914					report_csk_error(&kcm->sk, -err);
   915				}
   916			}
   917		} else {
   918			/* Message not complete, save state */
   919	partial_message:
   920			if (head) {
   921				kcm->seq_skb = head;
   922				kcm_tx_msg(head)->last_skb = skb;
   923			}
   924		}
   925	
   926		KCM_STATS_ADD(kcm->stats.tx_bytes, copied);
   927	
   928		release_sock(sk);
   929		return copied;
   930	
   931	out_error:
   932		kcm_push(kcm);
   933	
   934		if (sock->type == SOCK_SEQPACKET) {
   935			/* Wrote some bytes before encountering an
   936			 * error, return partial success.
   937			 */
   938			if (copied)
   939				goto partial_message;
   940			if (head != kcm->seq_skb)
   941				kfree_skb(head);
   942		} else {
   943			kfree_skb(head);
   944			kcm->seq_skb = NULL;
   945		}
   946	
   947		err = sk_stream_error(sk, msg->msg_flags, err);
   948	
   949		/* make sure we wake any epoll edge trigger waiter */
   950		if (unlikely(skb_queue_len(&sk->sk_write_queue) == 0 && err == -EAGAIN))
   951			sk->sk_write_space(sk);
   952	
   953		release_sock(sk);
   954		return err;
   955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
