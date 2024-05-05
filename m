Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911056EB58
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 20:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940209; cv=none; b=VSNthLDBdySnsKb1ycVSHaflaBC77yiA7JcWVcQZGDyLrOTjfbZ2ctgT5jVvonahbloWR1+M4fu8Any+MUGf7NnMn4s2W2q1QVKuTtOkUHY08YzPMTKnoFxKvqQ36r4piHQZAMF+lHHCiAV2B7OT1utzybOZoU9QBs621FJLEjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940209; c=relaxed/simple;
	bh=fXmPhqsSLLF7qd9Qvwn4Z5TBDzjInCzP8g1m0QgaYr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oxq84O/g75aKCV5koCFJrza61LDV6nbrTqZ551pITLtJbfE+P/UlZPW1HFp5V7BL8kBMwOt1xB62MrxwRBFAO0UfM79PROlMDfvb+8pO/GcrLIRv9rKivbTlVylrJGdqk5mQ8ggX7MpUW3twfcuNgLEaibnDRmazHX3ssBt1wzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EehVgSpM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EehVgSpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714940203; x=1746476203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXmPhqsSLLF7qd9Qvwn4Z5TBDzjInCzP8g1m0QgaYr8=;
  b=EehVgSpMYjrcJOOnce4dA/f1dZF+JzsD7m2I61H5shVD1usR+FgLslB4
   D1M9ZE1MNKYc7SOr9JwQ/SDRj3Gf70Q/0wbnTg9F94nM7A2DZF7VIXxci
   Ffk8MvbECXdI+Vm3lraiWaXWPasbT0+LUwNjt5tW4uLzodgeiqC+FSSiM
   ImLsI23igE7E79v0Ja3lfZc0ZCsS4mYNFR9eXBi2EFqPjjeq8eBxGHJAn
   gpKJOiAN1xPuwTMRlT0+ZxnN9m2K0ANo3I+D05Njy/cWm8dFdq/Yb7CmD
   Jcp8+FCYD0Vbv06VdVTQg8aYu4xYqxYloknxIS7YMQFFqjCJ+x6qMxm6h
   A==;
X-CSE-ConnectionGUID: Bf0kfujDQ3mHGOzOxigzug==
X-CSE-MsgGUID: V3gYdvfuSmm55ItiXDoOBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="36066453"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="36066453"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 13:16:43 -0700
X-CSE-ConnectionGUID: nNZ/JytgTQygyMLu7Ocuzg==
X-CSE-MsgGUID: BJaTAIB/QDumRcAlt17Z0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="28080186"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2024 13:16:42 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3iHn-0000Am-2a;
	Sun, 05 May 2024 20:16:39 +0000
Date: Mon, 6 May 2024 04:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test 9/9]
 net/rxrpc/conn_object.c:345:32: error: 'struct page_frag_cache' has no
 member named 'va'
Message-ID: <202405060409.krCZgnvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test
head:   128485e995fc7e92dfb438c15e97da66fc1d5240
commit: 128485e995fc7e92dfb438c15e97da66fc1d5240 [9/9] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060409.krCZgnvT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060409.krCZgnvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060409.krCZgnvT-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/rxrpc/conn_object.c: In function 'rxrpc_clean_up_connection':
>> net/rxrpc/conn_object.c:345:32: error: 'struct page_frag_cache' has no member named 'va'
     345 |         if (conn->tx_data_alloc.va)
         |                                ^
   In file included from arch/sh/include/asm/page.h:163,
                    from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from net/rxrpc/conn_object.c:10:
   net/rxrpc/conn_object.c:346:73: error: 'struct page_frag_cache' has no member named 'va'
     346 |                 __page_frag_cache_drain(virt_to_page(conn->tx_data_alloc.va),
         |                                                                         ^
   include/asm-generic/memory_model.h:52:32: note: in definition of macro '__pfn_to_page'
      52 | ({      unsigned long __pfn = (pfn);                    \
         |                                ^~~
   arch/sh/include/asm/page.h:132:25: note: in expansion of macro '___pa'
     132 | #define __pa(x)         ___pa((unsigned long)x)
         |                         ^~~~~
   arch/sh/include/asm/page.h:160:45: note: in expansion of macro '__pa'
     160 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   net/rxrpc/conn_object.c:346:41: note: in expansion of macro 'virt_to_page'
     346 |                 __page_frag_cache_drain(virt_to_page(conn->tx_data_alloc.va),
         |                                         ^~~~~~~~~~~~


vim +345 net/rxrpc/conn_object.c

3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  305  
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  306  /*
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  307   * Clean up a dead connection.
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  308   */
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  309  static void rxrpc_clean_up_connection(struct work_struct *work)
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  310  {
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  311  	struct rxrpc_connection *conn =
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  312  		container_of(work, struct rxrpc_connection, destructor);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  313  	struct rxrpc_net *rxnet = conn->rxnet;
7fa25105b2d32fc net/rxrpc/conn_object.c   David Howells 2022-10-21  314  
9d35d880e0e4a3a net/rxrpc/conn_object.c   David Howells 2022-10-19  315  	ASSERT(!conn->channels[0].call &&
9d35d880e0e4a3a net/rxrpc/conn_object.c   David Howells 2022-10-19  316  	       !conn->channels[1].call &&
9d35d880e0e4a3a net/rxrpc/conn_object.c   David Howells 2022-10-19  317  	       !conn->channels[2].call &&
9d35d880e0e4a3a net/rxrpc/conn_object.c   David Howells 2022-10-19  318  	       !conn->channels[3].call);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  319  	ASSERT(list_empty(&conn->cache_link));
17926a79320afa9 net/rxrpc/ar-connection.c David Howells 2007-04-26  320  
3136ef49a14ccc1 net/rxrpc/conn_object.c   David Howells 2017-11-24  321  	del_timer_sync(&conn->timer);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  322  	cancel_work_sync(&conn->processor); /* Processing may restart the timer */
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  323  	del_timer_sync(&conn->timer);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  324  
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  325  	write_lock(&rxnet->conn_lock);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  326  	list_del_init(&conn->proc_link);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  327  	write_unlock(&rxnet->conn_lock);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  328  
17926a79320afa9 net/rxrpc/ar-connection.c David Howells 2007-04-26  329  	rxrpc_purge_queue(&conn->rx_queue);
17926a79320afa9 net/rxrpc/ar-connection.c David Howells 2007-04-26  330  
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  331  	rxrpc_kill_client_conn(conn);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  332  
e0e4d82f3be60cf net/rxrpc/ar-connection.c David Howells 2016-04-07  333  	conn->security->clear(conn);
2cc800863c49a1f net/rxrpc/conn_object.c   David Howells 2022-10-19  334  	key_put(conn->key);
fa3492abb64b93b net/rxrpc/conn_object.c   David Howells 2022-11-02  335  	rxrpc_put_bundle(conn->bundle, rxrpc_bundle_put_conn);
47c810a79844462 net/rxrpc/conn_object.c   David Howells 2022-10-21  336  	rxrpc_put_peer(conn->peer, rxrpc_peer_put_conn);
0fde882fc9ee9cc net/rxrpc/conn_object.c   David Howells 2022-10-21  337  	rxrpc_put_local(conn->local, rxrpc_local_put_kill_conn);
e0e4d82f3be60cf net/rxrpc/ar-connection.c David Howells 2016-04-07  338  
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  339  	/* Drain the Rx queue.  Note that even though we've unpublished, an
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  340  	 * incoming packet could still be being added to our Rx queue, so we
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  341  	 * will need to drain it again in the RCU cleanup handler.
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  342  	 */
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  343  	rxrpc_purge_queue(&conn->rx_queue);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  344  
49489bb03a50154 net/rxrpc/conn_object.c   David Howells 2024-01-29 @345  	if (conn->tx_data_alloc.va)
49489bb03a50154 net/rxrpc/conn_object.c   David Howells 2024-01-29  346  		__page_frag_cache_drain(virt_to_page(conn->tx_data_alloc.va),
49489bb03a50154 net/rxrpc/conn_object.c   David Howells 2024-01-29  347  					conn->tx_data_alloc.pagecnt_bias);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  348  	call_rcu(&conn->rcu, rxrpc_rcu_free_connection);
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  349  }
3cec055c56958c5 net/rxrpc/conn_object.c   David Howells 2022-11-25  350  

:::::: The code at line 345 was first introduced by commit
:::::: 49489bb03a501547450e8fdc6d85d023d8a3b2c4 rxrpc: Do zerocopy using MSG_SPLICE_PAGES and page frags

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
