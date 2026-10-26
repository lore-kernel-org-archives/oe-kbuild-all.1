Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028850;
	b=wCXepwX3+SX2O148SGoysYVuMc88Kh2ggs9GNdCtnVfhsWt2tw4XNuhE+XhI0ezmjkyT
	 EEKUx0YsqJMBqLHtxGb2Gp7hG6exCywvPw4DaMXfcHt7jDknLJCHp1nahifzfVWYAbOAk
	 wVZsaRwWqhrr6P/w0FPOTBCDyRDrN+MyadPFk1sLGYkO54a29GFCzRJ9vTTdMcXcu+93X
	 jSWqWykdL1TOIlVPkIl4p959yjaktEF6v18Sa8sgQOkJmBv7HIv9hIqTSVRUcy1WYzT6Y
	 chWlQLpQocgXgt3EZZEFK1pw68PYu/nZSrIrI1p5W8E6F04RjAja2V3EqDCcqcIJaXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uEqNg8e98Uabf/iYFE0+qTo5qqjZtuYcwFCWCiOYhrU=;
	b=f/cmFWUqgVrDqv2EvvLuwosjGjvyf/1+z/kSo1yLtMBZ2rKzCNdWDcImyrxSwwZQ0M4M
	 AY77XNhonjlnWfAUH4tja4IyMiK0Pf6jE1lugEPmCVIC1ffpo/Q0jtCYoM4/mxbnI2aYT
	 +OCKZDCizfZONKAJ3grOwV7wcbgMFgoTClCLRjQgZxhapvAX5ntkXC6KRBu7iywplz2mE
	 Xu2oJxV3vtMIM/lu3TT0pfNEI9OHKj8aUX/yMog6JBwqTkLN5dH0lg6B4BYUmA+FlTr3c
	 QVhrtHucNCEv+7UgCVyzdFm7WZEYT0hkc34hiS1JTe+LfO9uxMLVd3Scgipx4a+O6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Iob/airu";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CAC606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 15:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iob/airu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793028849; x=1824564849;
  h=date:from:to:cc:subject:message-id;
  bh=hUMxhCzy1CNcYXO0Kc6xKk2cA60Kbeg1k7l/nnUntsE=;
  b=Iob/airuPGKiNb4jDKlLgM3G6ypJ0qvEC21HIEK50dqLwP9+rN3MqUNn
   MWidjaKzKEz2d0OPKDmJAeNjTaF1zIuGKb7+xGWtN03NxCSR8OpzzleM6
   DXKyh+W1Xx8vs6v4qZPYl1xh2k4fvWndr0CF9Oz033Kuz8qwCjJo1TPhk
   TqgaXkIX7giF06FdaHFUY0FQtDvvwSB6QG2AtzB3rJZEzPjUi5AoCOEmw
   Pv9ik4rwPH9ItBlQ8irgZB1GB2JqjdLT+UWN9E4VFRVjMhFlTrDXt1VTS
   35nS3tQxBp14wK9bjqD9L/TUYtXkQsDGclLH5U3nFOUun2IpwNSBafM6/
   w==;
X-CSE-ConnectionGUID: wcyNfy7oRMWB99vWqlWwWQ==
X-CSE-MsgGUID: soScPUFORkuN6Ns7WPp0eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1593630"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1593630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:34:08 -0700
X-CSE-ConnectionGUID: E2TdKCuZSfymXtHAOhEiqg==
X-CSE-MsgGUID: q0aa3ygKQ9iUVihMJmvAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4682857"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 08:34:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLMi4-0000000049V-4069;
	Mon, 26 Oct 2026 15:34:04 +0000
Date: Mon, 26 Oct 2026 16:33:38 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 89/133] net/core/devmem.c:77:9:
 warning: ignoring return value of 'dma_resv_lock' declared with attribute
 'warn_unused_result'
Message-ID: <202610261652.YXL74g5k-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   09aab91c2fcb166bfe35c0f9c2c5b6b960722087
commit: 138228c4404c30f42ca28639aeab8f8a1f92d07a [89/133] dma-resv: Make checking the dma_resv_lock() return value mandatory
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261026/202610261652.YXL74g5k-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261652.YXL74g5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261652.YXL74g5k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/devmem.c: In function '__net_devmem_dmabuf_binding_free':
>> net/core/devmem.c:77:9: warning: ignoring return value of 'dma_resv_lock' declared with attribute 'warn_unused_result' [-Wunused-result]
      77 |         dma_resv_lock(binding->dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/devmem.c: In function 'net_devmem_bind_dmabuf':
   net/core/devmem.c:246:9: warning: ignoring return value of 'dma_resv_lock' declared with attribute 'warn_unused_result' [-Wunused-result]
     246 |         dma_resv_lock(dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/devmem.c:359:9: warning: ignoring return value of 'dma_resv_lock' declared with attribute 'warn_unused_result' [-Wunused-result]
     359 |         dma_resv_lock(dmabuf->resv, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +77 net/core/devmem.c

5c024716f52bb8 Bobby Eshleman     2026-01-07  66  
bd61848900bff5 Mina Almasry       2025-05-08  67  void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
170aafe35cb98e Mina Almasry       2024-09-10  68  {
bd61848900bff5 Mina Almasry       2025-05-08  69  	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
bd61848900bff5 Mina Almasry       2025-05-08  70  
083e64a3af7717 Stanislav Fomichev 2026-09-17  71  	if (binding->freelist)
13648ba787223c Stanislav Fomichev 2026-09-17  72  		WARN(binding->free_count != binding->area.num_niovs,
1cf2f913b3dd93 Stanislav Fomichev 2026-09-25  73  		     "destroying dmabuf binding with outstanding net_iovs: total=%zu, free=%u",
13648ba787223c Stanislav Fomichev 2026-09-17  74  		     binding->area.num_niovs, binding->free_count);
170aafe35cb98e Mina Almasry       2024-09-10  75  
13648ba787223c Stanislav Fomichev 2026-09-17  76  	kvfree(binding->area.niovs);
69ab87acc614cb Erfan Sharafzadeh  2026-10-13 @77  	dma_resv_lock(binding->dmabuf->resv, NULL);
69ab87acc614cb Erfan Sharafzadeh  2026-10-13  78  	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
fa516c0d8bf90d Jakub Kicinski     2025-07-31  79  				 binding->direction);
69ab87acc614cb Erfan Sharafzadeh  2026-10-13  80  	dma_buf_unpin(binding->attachment);
69ab87acc614cb Erfan Sharafzadeh  2026-10-13  81  	dma_resv_unlock(binding->dmabuf->resv);
170aafe35cb98e Mina Almasry       2024-09-10  82  	dma_buf_detach(binding->dmabuf, binding->attachment);
170aafe35cb98e Mina Almasry       2024-09-10  83  	dma_buf_put(binding->dmabuf);
170aafe35cb98e Mina Almasry       2024-09-10  84  	xa_destroy(&binding->bound_rxqs);
5c024716f52bb8 Bobby Eshleman     2026-01-07  85  	percpu_ref_exit(&binding->ref);
083e64a3af7717 Stanislav Fomichev 2026-09-17  86  	kvfree(binding->freelist);
bd61848900bff5 Mina Almasry       2025-05-08  87  	kvfree(binding->tx_vec);
170aafe35cb98e Mina Almasry       2024-09-10  88  	kfree(binding);
170aafe35cb98e Mina Almasry       2024-09-10  89  }
170aafe35cb98e Mina Almasry       2024-09-10  90  

:::::: The code at line 77 was first introduced by commit
:::::: 69ab87acc614cbe0bd08a65ece6e1aabee805106 net: devmem: allow peer-to-peer dma-buf attach for bindings

:::::: TO: Erfan Sharafzadeh <erfansh@meta.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
