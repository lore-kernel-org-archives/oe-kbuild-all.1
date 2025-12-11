Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EED293C4E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765421855; cv=none; b=auOL4vWQQshDIFqb0Tp3ZcASSIQ6ErjxXSTsQhsvgMMhzREMN7t/LhwopJshq9hT7TPOW/C277q508p8splHQeU3xN3jI4vNVGB729OeiRwNxEkFLQX7T4gIJvDUnJgkIW29K+LIWJE/+HLQRDEUo/psgZGkjBRD3eHNS7TX1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765421855; c=relaxed/simple;
	bh=RJf6Ph4grvUoD0qFSnEekdb3Z/D6E3yA2OH7s89oAOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpEo7+cmqfAH0ehpVrcxpxgEiqnU6Qin9qlcdHOTDFSyPhHw7kT3bTIM9PVkEQR6du8YS5khcKGupH6hM76yetgqiaUUxi4O6MmyFAWNLdStgGezAneSjSfl7wlHp0bFq3PMr/DdVVK1oCfoYzjnqOf0sMTD4JOAmO5ytPIMOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hartOBhG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hartOBhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765421853; x=1796957853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJf6Ph4grvUoD0qFSnEekdb3Z/D6E3yA2OH7s89oAOI=;
  b=hartOBhGKgQyZALmC4pkMjMA+ryxoD/MQu44O0aaHhJx5bn/fbIiSnLg
   N4jMREMn9/kQyNuGmyxeEGibSyE4U+mo9NzlPrrPkVhlpWYEzTiEB/y6S
   ak4cuouTnZK3PbnG7GQtHz4wKz3pmR0zZbndPFgAGz4mjc1NBu13BoLdY
   be1QzrLyDqrSmUK5R7te2v8Uj8C6ob5WVzn/zpLpvzj2HdwmJFs7pnvun
   p6gq+ccuO8Po/dHNBO+JgvEUg5GRZdTBeIY/c56PScrRvJMVyp4bTmVaf
   30jZ1e4RSj7rcNJkbBG1C7mqOCAbMMhdtFI2u+wCvP5sI2+1hpyhsrJ+j
   A==;
X-CSE-ConnectionGUID: 9emExUDtQwW7o26RHga0Ww==
X-CSE-MsgGUID: nBPZHfgvT023cdmZtcNYEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71025030"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71025030"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:57:30 -0800
X-CSE-ConnectionGUID: mZ4YcrHzSVqzzgzfU4CicQ==
X-CSE-MsgGUID: jU0zqB8LR92dOE/Y2/11lg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 18:57:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWru-0000000044f-38Ie;
	Thu, 11 Dec 2025 02:57:26 +0000
Date: Thu, 11 Dec 2025 10:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:141:22: sparse: sparse: symbol
 'ubmad_create_rt_work' was not declared. Should it be static?
Message-ID: <202512111041.BvyrUXKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wen,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: ea9d81b3942d8f0336b9207b594a748e20ec16dd [3508/3508] ubcore: add ubcore_umem and ubcore_tp implementations
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111041.BvyrUXKy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111041.BvyrUXKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111041.BvyrUXKy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:141:22: sparse: sparse: symbol 'ubmad_create_rt_work' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:530:5: sparse: sparse: symbol 'ubmad_post_send_conn_ack' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:550:5: sparse: sparse: symbol 'ubmad_repost_send_conn_data' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:757:6: sparse: sparse: symbol 'ubmad_process_rx_msn' was not declared. Should it be static?

vim +/ubmad_create_rt_work +141 drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c

e34a52d4eed891 Wen Chen 2025-11-12  140  
e34a52d4eed891 Wen Chen 2025-11-12 @141  struct ubmad_rt_work *ubmad_create_rt_work(struct workqueue_struct *rt_wq,
e34a52d4eed891 Wen Chen 2025-11-12  142  					   struct ubmad_msn_mgr *msn_mgr,
e34a52d4eed891 Wen Chen 2025-11-12  143  					   struct ubmad_msg *msg,
e34a52d4eed891 Wen Chen 2025-11-12  144  					   struct ubmad_tjetty *tjetty,
e34a52d4eed891 Wen Chen 2025-11-12  145  					   struct ubmad_jetty_resource *rsrc)
e34a52d4eed891 Wen Chen 2025-11-12  146  {
e34a52d4eed891 Wen Chen 2025-11-12  147  	struct ubmad_rt_work *rt_work;
e34a52d4eed891 Wen Chen 2025-11-12  148  
e34a52d4eed891 Wen Chen 2025-11-12  149  	rt_work = kzalloc(sizeof(struct ubmad_rt_work),
e34a52d4eed891 Wen Chen 2025-11-12  150  			  GFP_KERNEL); // free in ubmad_rt_work_handler()
e34a52d4eed891 Wen Chen 2025-11-12  151  	if (IS_ERR_OR_NULL(rt_work))
e34a52d4eed891 Wen Chen 2025-11-12  152  		return ERR_PTR(-ENOMEM);
e34a52d4eed891 Wen Chen 2025-11-12  153  	rt_work->msn = msg->msn;
e34a52d4eed891 Wen Chen 2025-11-12  154  	rt_work->msn_mgr = msn_mgr;
e34a52d4eed891 Wen Chen 2025-11-12  155  	rt_work->msg = msg;
e34a52d4eed891 Wen Chen 2025-11-12  156  	rt_work->tjetty = tjetty;
e34a52d4eed891 Wen Chen 2025-11-12  157  	rt_work->rsrc = rsrc;
e34a52d4eed891 Wen Chen 2025-11-12  158  	rt_work->rt_wq = rt_wq;
e34a52d4eed891 Wen Chen 2025-11-12  159  	rt_work->rt_cnt = 0;
e34a52d4eed891 Wen Chen 2025-11-12  160  
e34a52d4eed891 Wen Chen 2025-11-12  161  	INIT_DELAYED_WORK(&rt_work->delay_work, ubmad_rt_work_handler);
e34a52d4eed891 Wen Chen 2025-11-12  162  	if (queue_delayed_work(rt_wq, &rt_work->delay_work,
e34a52d4eed891 Wen Chen 2025-11-12  163  			       UBMAD_RETRANSMIT_PERIOD) != true) {
e34a52d4eed891 Wen Chen 2025-11-12  164  		ubcm_log_err("queue rt work failed\n");
e34a52d4eed891 Wen Chen 2025-11-12  165  		kfree(rt_work);
e34a52d4eed891 Wen Chen 2025-11-12  166  		return NULL;
e34a52d4eed891 Wen Chen 2025-11-12  167  	}
e34a52d4eed891 Wen Chen 2025-11-12  168  
e34a52d4eed891 Wen Chen 2025-11-12  169  	return rt_work;
e34a52d4eed891 Wen Chen 2025-11-12  170  }
e34a52d4eed891 Wen Chen 2025-11-12  171  

:::::: The code at line 141 was first introduced by commit
:::::: e34a52d4eed8912f6dfdc7d68152c45f7a071ca8 ubcore: implement ubcore connection management and messaging feature.

:::::: TO: Wen Chen <chenwen54@huawei.com>
:::::: CC: Yongqiang Guo <guoyongqiang12@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
