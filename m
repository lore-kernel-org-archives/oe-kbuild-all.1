Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C817B51C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680332; cv=none; b=DECaMLHiyhlIMRp2xYD1Q9rouzxFb6D0/A9Rq41F/rtQWBZUnwjALOt1smQ+ErMIy7rWFGke85PNGicS0yI19J/m0aPVWklBHO4GAeOM/KYju6d7GSth/mjtNDEgLsqTFDtl/cNDSWh1ShzjgAGkRzwR4zKNvfO6bV2C342rOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680332; c=relaxed/simple;
	bh=7duO9MVILcIS/upadXk2mLV0dtLcoo6R2fr7cbYSKAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh5eXgMoIRqq4mtPWm+Gu8ZeTnmFsjshYuqDiwNKXkWHWoiRi1DiFNbzYnSiN6nYSjP7Zs1CbIoAtw93V8c616QdReZBD2gvemMdaqS0+S1TvrjtugZrgS6o/8GNAdRPKDt7H3K9BM+jz10wjWHJIftfciEsn7O8wIwTwEnoONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/+TR7Wc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/+TR7Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724680331; x=1756216331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7duO9MVILcIS/upadXk2mLV0dtLcoo6R2fr7cbYSKAc=;
  b=B/+TR7Wc+P1EZNzyKevIN56q4Ubaqn8X/x0i+ZQcVco9OdbgzAeffKYo
   CIjhVBgK4q07vPmGpTJGF/XWAWPrGr+dfMPTOrjU05tPgrr9NQ7Whjivq
   WnaOtwf61xptu7035o26ZPoKj4dOrolcP6nOyXca6tzggm7SKyh9D49DJ
   Rl7t+dO4skiFC72GFV5ggNbriIehdljTmgsN96Lu3prptDryijW0D6lgh
   WTIOp8b9x8bhoVxxRFd7+MwP5+9lI5G0O5NsVuAbsvNlOM/XoHveJq2qh
   zuDERGrY4pMyKkvM51XprKIxvhgZ3oVUjR/ii4QZHpQ7K0Z2nzqaz8rlB
   g==;
X-CSE-ConnectionGUID: m+cuVavuTkuoFmllhVeTbw==
X-CSE-MsgGUID: ZhrHnVCBT9uEFeWnNLgctA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33673341"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33673341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:52:09 -0700
X-CSE-ConnectionGUID: XkJ47ffsSnCAyLemj5XdnA==
X-CSE-MsgGUID: AfB4mCxaRyauzF/J7rZkSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93246362"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:52:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sia8b-000H9x-10;
	Mon, 26 Aug 2024 13:52:05 +0000
Date: Mon, 26 Aug 2024 21:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Cheng Xu <chengyou@linux.alibaba.com>, jgg@ziepe.ca, leon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	KaiShen@linux.alibaba.com
Subject: Re: [PATCH for-next 2/4] RDMA/erdma: Refactor the initialization and
 destruction of EQ
Message-ID: <202408262144.SpsbTKs7-lkp@intel.com>
References: <20240823075058.89488-3-chengyou@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823075058.89488-3-chengyou@linux.alibaba.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Xu/RDMA-erdma-Make-the-device-probe-process-more-robust/20240826-123256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20240823075058.89488-3-chengyou%40linux.alibaba.com
patch subject: [PATCH for-next 2/4] RDMA/erdma: Refactor the initialization and destruction of EQ
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240826/202408262144.SpsbTKs7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262144.SpsbTKs7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262144.SpsbTKs7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/erdma/erdma_eq.c:141:6: warning: no previous prototype for 'erdma_aeq_destroy' [-Wmissing-prototypes]
     141 | void erdma_aeq_destroy(struct erdma_dev *dev)
         |      ^~~~~~~~~~~~~~~~~


vim +/erdma_aeq_destroy +141 drivers/infiniband/hw/erdma/erdma_eq.c

f2a0a630b95345 Cheng Xu 2022-07-27  140  
f2a0a630b95345 Cheng Xu 2022-07-27 @141  void erdma_aeq_destroy(struct erdma_dev *dev)
f2a0a630b95345 Cheng Xu 2022-07-27  142  {
f2a0a630b95345 Cheng Xu 2022-07-27  143  	struct erdma_eq *eq = &dev->aeq;
f2a0a630b95345 Cheng Xu 2022-07-27  144  
f0697bf078368d Boshi Yu 2024-03-11  145  	dma_free_coherent(&dev->pdev->dev, eq->depth << EQE_SHIFT, eq->qbuf,
f2a0a630b95345 Cheng Xu 2022-07-27  146  			  eq->qbuf_dma_addr);
f0697bf078368d Boshi Yu 2024-03-11  147  
fdb09ed15f272a Boshi Yu 2024-03-11  148  	dma_pool_free(dev->db_pool, eq->dbrec, eq->dbrec_dma);
f2a0a630b95345 Cheng Xu 2022-07-27  149  }
f2a0a630b95345 Cheng Xu 2022-07-27  150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
