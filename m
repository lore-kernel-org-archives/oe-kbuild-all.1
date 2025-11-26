Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3151F584C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192686; cv=none; b=aqpPt/lbw+KRpGEZB3sQmTO7M7thkouMv5znA9qfd9EaNyZEbgYZObSt143AV75BJf7+XuypqUwLOMMhKkGq9mXOzuwz35IWHq7e6vUiUdEvpdTgmCi3Mc22pfnvgDXke4cM3xS2ZOtp/bmBCB6LOF3Ml1n1kVYa9qFmue3SRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192686; c=relaxed/simple;
	bh=MfjS1Rnmolz00tRZbeqHcepFhc1sPM3LRmUt6IfdOzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l51GEPC0MV0jkD3be6awb7vZJSniQfWNRmqmGEFS/B6pFZ9r+lSNBCL22rd4nMg3LXsmT9dutaohwlVyXnRhpisv0kuQRuDnR8IDpN9vkHgUgaU4T2D1e059RCisRyU9ZDrR2GFe2af1EQjHrdcDYSL4gl7HITfxjt23N1hR7iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCJ9JWaO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCJ9JWaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764192685; x=1795728685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MfjS1Rnmolz00tRZbeqHcepFhc1sPM3LRmUt6IfdOzw=;
  b=OCJ9JWaO7bFm4zkyZeL/EkmH59xzBMGG2OzifUX+OPYBAvnOARykU9ko
   dGgmCWaAku+xyz7MjIZ0WPRR8FofcncXtrULR1QupxtTKuUfybI3IMYBZ
   mO9PeDK0tO9ZZCDVsBvMXommynzjXH7oqogovKrqY8mJWFFzrEO7ID/Ez
   A/hsW9nEEh/MW3XGZufYeBItZzWWA4t9jBodNL1eIcBpaplRzo2IFvTE4
   2RamOIFWAc3CoJH3/flpSS8Ee0Uv7ztRRIkC52h88Ldm/wA1T3CUSkNhr
   kM7A4ybIq0tHi2G0iefYY0ISyRXRwPIo2ePgvbwvoc6LhcOOCerjzbFd4
   Q==;
X-CSE-ConnectionGUID: ocUIJ4XkQhi2M1Lyt0VAyg==
X-CSE-MsgGUID: A4nvupWmTWqHRX8rYR3D3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66185486"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66185486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:31:24 -0800
X-CSE-ConnectionGUID: Tu1HdTdwQ1OcV7BlBLHs5g==
X-CSE-MsgGUID: Bv9xuYt2TnWmanzpD8fk7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193153405"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 13:31:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vON6e-000000003NZ-3g0d;
	Wed, 26 Nov 2025 21:31:20 +0000
Date: Thu, 27 Nov 2025 05:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
Message-ID: <202511270504.VyAUjuYi-lkp@intel.com>
References: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>

Hi Pavel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.18-rc7 next-20251126]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/file-add-callback-for-pre-mapping-dmabuf/20251124-065343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence%40gmail.com
patch subject: [RFC v2 05/11] block: add infra to handle dmabuf tokens
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20251127/202511270504.VyAUjuYi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270504.VyAUjuYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270504.VyAUjuYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: block/bdev.o: in function `blkdev_dma_map':
>> block/bdev.c:75:(.text+0x13fc): undefined reference to `blk_mq_dma_map'
>> block/bdev.c:75:(.text+0x13fc): relocation truncated to fit: R_NIOS2_CALL26 against `blk_mq_dma_map'
   nios2-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
>> block/blk-mq.c:3225:(.text+0x6e7c): undefined reference to `blk_rq_assign_dma_map'
>> block/blk-mq.c:3225:(.text+0x6e7c): relocation truncated to fit: R_NIOS2_CALL26 against `blk_rq_assign_dma_map'


vim +75 block/bdev.c

    64	
    65	struct dma_token *blkdev_dma_map(struct file *file,
    66					 struct dma_token_params *params)
    67	{
    68		struct request_queue *q = bdev_get_queue(file_bdev(file));
    69	
    70		if (!(file->f_flags & O_DIRECT))
    71			return ERR_PTR(-EINVAL);
    72		if (!q->mq_ops)
    73			return ERR_PTR(-EINVAL);
    74	
  > 75		return blk_mq_dma_map(q, params);
    76	}
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
