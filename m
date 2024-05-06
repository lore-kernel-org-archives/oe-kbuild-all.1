Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18D15B57D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032712; cv=none; b=iAZzZ4yjBtk2PHEHAPg7IbowS5iiYYH5Znw+2E+W9fk6/QwvC+MHD8S/Irh4Zmk6RsfEAx1hf9TyE1iAPiVFrZtwBqVIart1dtiLUQAARMcuRa9MWw5RuaanwIsI6LDs3gFCEayEapPEvmv/2NOIcoOvSjjHIf2KYoAb0AEeHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032712; c=relaxed/simple;
	bh=tO3UQXl/zQKH0gidQpE3yTKhcJ0TLTZONZqHNsgUKVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJEpa+TfYlo3Xc6vP591aNDE+p3oFWyAMHI8kPmiBIPZobDvF+KwoOiVBNei3C000TO2I280M3ScGg4TyU160pCThuK5J8f9hReCp3ooAgjoIdsLBWIORnTGbutXZUAwp3ozNF8fiUARDvH/xDlyeDoS5F6E9p5ToaTc3VuXTRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPMSwvPi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPMSwvPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715032710; x=1746568710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tO3UQXl/zQKH0gidQpE3yTKhcJ0TLTZONZqHNsgUKVI=;
  b=lPMSwvPi4A9uTFF+rVwgOM+Q+zd7/2ok2F09X8MVOInmdL4JXMQDQW4Z
   K8JFZqUCFLy+St63fo8d4xdae9ygQvPK6b/xMdILZuGaKw+jNESzXMVXi
   Id3WE+wwo/AWu+/mRLx1ytKz8K5RjW4GptjNnyTgB35d3jhDMNMfGl0eg
   M/4P4F+KbqolH/sfhxrgN45XiXB3XoIOYHWM0xySLkvhX2WPrbf6KQNXs
   dlTAPR2oIi3/CL6e3KzxUPA1UWr6RDyvCaSK5b5sR8PYY3gIzyorjuALN
   VeoghNh68KkwiQSrfNx5mazg1OcFnDhIy/7vIcsQCdp+S49ZBFxg9pezN
   w==;
X-CSE-ConnectionGUID: +udUTOLrTt+xBPt/gurS9Q==
X-CSE-MsgGUID: a7DXnVNuScaRXWp7/g4dAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10683332"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10683332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 14:58:30 -0700
X-CSE-ConnectionGUID: 12bpXB/1S6WHQBOvExUMvQ==
X-CSE-MsgGUID: Cvb1QIyCTi2KLnn98f+pcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28291132"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 14:58:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s46Lq-00014n-1L;
	Mon, 06 May 2024 21:58:26 +0000
Date: Tue, 7 May 2024 05:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test_0506 8/11]
 net/rxrpc/conn_object.c:345:35: error: incompatible type for argument 1 of
 'page_frag_cache_drain'
Message-ID: <202405070500.1HOSOdIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test_0506
head:   99acbf369a16aae2fe03c509c811029881a1ea4d
commit: 15e685b00ff333b0a5355b5617391bd9b029d953 [8/11] mm: page_frag: avoid caller accessing 'page_frag_cache' directly
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240507/202405070500.1HOSOdIZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070500.1HOSOdIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070500.1HOSOdIZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/rxrpc/conn_object.c: In function 'rxrpc_clean_up_connection':
>> net/rxrpc/conn_object.c:345:35: error: incompatible type for argument 1 of 'page_frag_cache_drain'
     345 |         page_frag_cache_drain(conn->tx_data_alloc);
         |                               ~~~~^~~~~~~~~~~~~~~
         |                                   |
         |                                   struct page_frag_cache
   In file included from include/linux/skbuff.h:34,
                    from net/rxrpc/conn_object.c:13:
   include/linux/page_frag_cache.h:36:52: note: expected 'struct page_frag_cache *' but argument is of type 'struct page_frag_cache'
      36 | void page_frag_cache_drain(struct page_frag_cache *nc);
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~^~


vim +/page_frag_cache_drain +345 net/rxrpc/conn_object.c

   305	
   306	/*
   307	 * Clean up a dead connection.
   308	 */
   309	static void rxrpc_clean_up_connection(struct work_struct *work)
   310	{
   311		struct rxrpc_connection *conn =
   312			container_of(work, struct rxrpc_connection, destructor);
   313		struct rxrpc_net *rxnet = conn->rxnet;
   314	
   315		ASSERT(!conn->channels[0].call &&
   316		       !conn->channels[1].call &&
   317		       !conn->channels[2].call &&
   318		       !conn->channels[3].call);
   319		ASSERT(list_empty(&conn->cache_link));
   320	
   321		del_timer_sync(&conn->timer);
   322		cancel_work_sync(&conn->processor); /* Processing may restart the timer */
   323		del_timer_sync(&conn->timer);
   324	
   325		write_lock(&rxnet->conn_lock);
   326		list_del_init(&conn->proc_link);
   327		write_unlock(&rxnet->conn_lock);
   328	
   329		rxrpc_purge_queue(&conn->rx_queue);
   330	
   331		rxrpc_kill_client_conn(conn);
   332	
   333		conn->security->clear(conn);
   334		key_put(conn->key);
   335		rxrpc_put_bundle(conn->bundle, rxrpc_bundle_put_conn);
   336		rxrpc_put_peer(conn->peer, rxrpc_peer_put_conn);
   337		rxrpc_put_local(conn->local, rxrpc_local_put_kill_conn);
   338	
   339		/* Drain the Rx queue.  Note that even though we've unpublished, an
   340		 * incoming packet could still be being added to our Rx queue, so we
   341		 * will need to drain it again in the RCU cleanup handler.
   342		 */
   343		rxrpc_purge_queue(&conn->rx_queue);
   344	
 > 345		page_frag_cache_drain(conn->tx_data_alloc);
   346		call_rcu(&conn->rcu, rxrpc_rcu_free_connection);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
