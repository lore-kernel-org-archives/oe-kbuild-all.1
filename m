Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C652E54AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988936; cv=none; b=rlmgFRp56YVRhTzVFZjfhgs1GpAjtRt0Urb9KvIu6c/BDiFZfX/XbdezRTy9d1hIZcrpwjhuzUcOnRNAMHS5LT6TCOH66cpIm4DJYhm4xeOhPDeUWKC+6zKza0WrSATxNcWDAfx45b1Cd5Kd9AIfRFuD/AkFbD0zX3sGxPi17V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988936; c=relaxed/simple;
	bh=0m1tTUwcW9CXTn51ikb7frLBhZJkqc+IwtJqEgtu4vA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQoTbjDvwrcCq378FbDcDl97cZmtUuCmwQxSQ+zcKpbWUVp7t2GTiDpevywK3IPM947TzO90syWNsJK3Q+FgWIs9avCw0bespyqtfBx8gPeDp1hfU98jLG5Px3FrKWk+100cfM97xoWwQ/QI06gCQ68JjaOyx8FL8e6RPobUMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N39fJJun; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N39fJJun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754988935; x=1786524935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0m1tTUwcW9CXTn51ikb7frLBhZJkqc+IwtJqEgtu4vA=;
  b=N39fJJunFSxPoY1UjkytgkjHtIXZ76kvZ6EctknWXOEo/hQo6lsJeLmD
   O0Ljnl7dXnclDL3K5Sl13bAcmkyGlaF8PzQFQEact+23w4Lc1XBKo7XMx
   /ETjty+7x9gzp/GtnsVuA+KNG1xDNPZbdfF4INAq0IZEHAli/3pKu4z76
   6xqezOhOpkgpb/ewAho3/yPxdf/dy/b6c0JuytalBmN4nwk/7olbTQHH+
   wuwnGXAT+e/sCVfUgnS308b0EYsvdWi7uyyhAoGZsU5JZJRQ0NKw+iPa3
   59WHRMdR3Q0CAEbTKtW25xPnHaDmEibncttx+xFUnESYVeFepn5TJtgfQ
   w==;
X-CSE-ConnectionGUID: 7lvJLBVMQ6qTQp0NQw4P/Q==
X-CSE-MsgGUID: 17KDJNN7RMSAQ/tgj3TEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79827958"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="79827958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 01:55:28 -0700
X-CSE-ConnectionGUID: oWeqyuHXSjm+prcLKeBHAw==
X-CSE-MsgGUID: MiSP8LV9Q/a4U0R82gP/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166530222"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2025 01:55:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulkmV-0006bP-2J;
	Tue, 12 Aug 2025 08:55:01 +0000
Date: Tue, 12 Aug 2025 16:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2669/2669]
 drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c:330:5: warning: no
 previous prototype for function 'wait_done_dma_queue'
Message-ID: <202508121628.Gr4EiznB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   68ac72c2610cc9a280d47c6f733db0eff92efc15
commit: 85502a982830072aff2efa8b65f75c240b4d6181 [2669/2669] Huawei iBMA: Added support for Hi1712 Chip
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250812/202508121628.Gr4EiznB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121628.Gr4EiznB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121628.Gr4EiznB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c:330:5: warning: no previous prototype for function 'wait_done_dma_queue' [-Wmissing-prototypes]
     330 | s32 wait_done_dma_queue(unsigned long timeout)
         |     ^
   drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c:330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     330 | s32 wait_done_dma_queue(unsigned long timeout)
         | ^
         | static 
   1 warning generated.


vim +/wait_done_dma_queue +330 drivers/net/ethernet/huawei/bma/edma_drv/edma_queue.c

   329	
 > 330	s32 wait_done_dma_queue(unsigned long timeout)
   331	{
   332		struct dma_ch_cq_s *p_cur_last_cq;
   333		struct dma_ch_cq_s *p_dma_cq;
   334		unsigned long end;
   335		u32 sq_tail;
   336		u32 sq_valid;
   337		u32 cq_tail;
   338		u32 cq_valid;
   339	
   340		p_dma_cq = (struct dma_ch_cq_s *)((&get_bma_dev()->edma_host)->edma_cq_addr);
   341		end = jiffies + timeout;
   342	
   343		while (time_before(jiffies, end)) {
   344			(void)get_dma_queue_sq_tail(&sq_tail);
   345			(void)get_dma_queue_cq_tail(&cq_tail);
   346	
   347			cq_valid = (cq_tail + CQ_DEPTH - 1) % (CQ_DEPTH);
   348			p_cur_last_cq = &p_dma_cq[cq_valid];
   349			sq_valid = (sq_tail + SQ_DEPTH - 1) % (SQ_DEPTH);
   350			BMA_LOG(DLOG_DEBUG,
   351				"sq_tail %d, cq_tail %d, cq_valid %d, sq_valid %d, p_cur_last_cq->sqhd %d\n",
   352				sq_tail, cq_tail, cq_valid, sq_valid, p_cur_last_cq->sqhd);
   353			if (p_cur_last_cq->sqhd == sq_valid) {
   354				set_dma_queue_cq_head(cq_valid);
   355				return 0;
   356			}
   357		}
   358	
   359		return -ETIMEDOUT;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
