Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550A4A2F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722684341; cv=none; b=GDofMLRB1lccSkd1WRkHjLz06FOeMliW+rpGWlwq+ljaIFaaQE28foG29JDCe+awxWuvaz8IbIq1FemxAgIZJfwNFJ00RfaRgZLGmqnlmBrU++/v/teIj3tOLh5xGSQYqPFWX6iSoOY06liwVE+Eu3E4+owUOg6H8uUXtsnI+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722684341; c=relaxed/simple;
	bh=Q9oscxgXE8GnhKAbTVX96BFrKMHdYl1gqQLeZLtiS0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IuRWviOJbbF4aNfx/fUycA116lJBGITeDp3eq4eSIGH2DxdyoxyNBv2Gza4UB4HpSsrMksRMQykDP2+DXk/3x1YGjvmLwngfIwm/b/plziUTKMVDZ4EGYISqAgQdM3vtgZzrJ7TLBDP67dK4OLKt3J8Od/L9/Yp26hbBURieG0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6SPRCNC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6SPRCNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722684340; x=1754220340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9oscxgXE8GnhKAbTVX96BFrKMHdYl1gqQLeZLtiS0U=;
  b=P6SPRCNCP2/THdMS3xrUg8AcSc/MWHTEg02JGM7iGA05w6eIPeZVrAdj
   m+jQ9nAINSAxpvycplbWHqk4l5jexSBQz51j5b+/B/a9cwkEEwZgfeJLM
   Ub15NskYzeivh3l3Dt5SHR4ZnehSMttWgVjKSDVwihqwBognjVK6jMqzH
   MicvSfOr04R//1lwg9lYm9d/77lISjGzo4bhEmWgHB3QjkqNDXCKKt6yK
   G8UTm6oXkae20+qDXtB8xvLU95Ku0HmUHtfBW13z6cWjoCy/4C4oUA8qO
   804uacmodqROJ49otANYJOd1WBM1OO6m2kzhmd5ZD+O5i3zyfGs52zE2s
   g==;
X-CSE-ConnectionGUID: ldiJJyFDSRymB72DmgBAcg==
X-CSE-MsgGUID: 6e02jmbMTD+qtDlUrLcdCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20816454"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20816454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 04:25:39 -0700
X-CSE-ConnectionGUID: 1h8oJ4DTSwa4M7+8RSfALg==
X-CSE-MsgGUID: aUAKU9AOSoyxdEfxfeLdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86275233"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2024 04:25:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saCtE-0000Pd-0G;
	Sat, 03 Aug 2024 11:25:36 +0000
Date: Sat, 3 Aug 2024 19:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 8/36] include/trace/events/page_pool.h:68:
 undefined reference to `__tracepoint_page_pool_state_hold'
Message-ID: <202408031954.fECUSfxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   c5e494e528ec5659c10faca8a4a9227e0aa7fe5a
commit: 8306bf316a4d3928d670f98e9e6a3b3218e8c73a [8/36] memory-provider: dmabuf devmem memory provider
config: i386-randconfig-012-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031954.fECUSfxJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031954.fECUSfxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031954.fECUSfxJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/devmem.o: in function `trace_page_pool_state_hold':
>> include/trace/events/page_pool.h:68: undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: include/trace/events/page_pool.h:68: undefined reference to `__SCT__tp_func_page_pool_state_hold'
   ld: net/core/devmem.o:(__jump_table+0x8): undefined reference to `__tracepoint_page_pool_state_hold'


vim +68 include/trace/events/page_pool.h

32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  67  
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18 @68  TRACE_EVENT(page_pool_state_hold,
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  69  
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  70  	TP_PROTO(const struct page_pool *pool,
5d14a8712ceeac Mina Almasry           2024-06-13  71  		 netmem_ref netmem, u32 hold),
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  72  
5d14a8712ceeac Mina Almasry           2024-06-13  73  	TP_ARGS(pool, netmem, hold),
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  74  
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  75  	TP_STRUCT__entry(
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  76  		__field(const struct page_pool *,	pool)
5d14a8712ceeac Mina Almasry           2024-06-13  77  		__field(unsigned long,			netmem)
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  78  		__field(u32,				hold)
832ccf6f80cda0 Jesper Dangaard Brouer 2019-11-16  79  		__field(unsigned long,			pfn)
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  80  	),
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  81  
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  82  	TP_fast_assign(
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  83  		__entry->pool	= pool;
5d14a8712ceeac Mina Almasry           2024-06-13  84  		__entry->netmem	= (__force unsigned long)netmem;
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  85  		__entry->hold	= hold;
5d14a8712ceeac Mina Almasry           2024-06-13  86  		__entry->pfn	= netmem_to_pfn(netmem);
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  87  	),
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  88  
5d14a8712ceeac Mina Almasry           2024-06-13  89  	TP_printk("page_pool=%p netmem=%p is_net_iov=%lu, pfn=0x%lx hold=%u",
5d14a8712ceeac Mina Almasry           2024-06-13  90  		  __entry->pool, (void *)__entry->netmem,
5d14a8712ceeac Mina Almasry           2024-06-13  91  		  __entry->netmem & NET_IOV, __entry->pfn, __entry->hold)
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  92  );
32c28f7e413981 Jesper Dangaard Brouer 2019-06-18  93  

:::::: The code at line 68 was first introduced by commit
:::::: 32c28f7e413981c7dd4a3ad9bbb1151e4b654261 page_pool: add tracepoints for page_pool with details need by XDP

:::::: TO: Jesper Dangaard Brouer <brouer@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
