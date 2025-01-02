Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5CE1547FB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 16:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835903; cv=none; b=p6/R0lr7LXybvhuISqVzGIr8WcTGCTGHMnqjG9tv/Fh19thdB4xZDPSErid+VuGQNLeJLJ5wc390797yfRg7N6jwUTyLH5mCCtOat7IJTIrUY8vZ3iqrpi9MdsuwybLJZwwMi7BoJlWYFcUtnhBLv3yksqUAs27Kdon4yjtELRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835903; c=relaxed/simple;
	bh=4aue3GyUxFqGlzp4anvA0J/aA5U3MUGX80zoWerbIaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7mhKdtdjuA2OjVS+JaxMkIseJa9eurEIhUS1YkoxHlktY5LpUuKcGijI48VTGIrnHLfrH8ZYdpzSgtxQf/Yjo1ic0fZ5RHvDLycKlisHwyU/VTnGAkM+V8/PNEjXNOpS4wv4lwA6IFdaMC3c9TjKZfLaEzi6S2JVUKd441apD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmDjlFVJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmDjlFVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735835876; x=1767371876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aue3GyUxFqGlzp4anvA0J/aA5U3MUGX80zoWerbIaI=;
  b=MmDjlFVJzys1ez3Mu99Q32qeNQzCmAGuuFLzBqJ3C41n0rawwMchwYmJ
   zw7GGY6tOARfuLUVy/hOOt8urPucjHzpA5qPQddzvEvXkK2bi8f/3Pvvf
   AFBsfAIYcUXisEy2pyn8D00F3zc5tpy+gj2/yWJrMaSwgmED3+FQc48f5
   HSbz4id+m12YyxltOfAygXvmrHedmWbG6NnvcyQfFEe0wQKlZC4ax2dPs
   Yh/I4fXnSTi9M1aUFXLMKqkHjwNR9VDWQyKsprldXhlegD071P4a91QWU
   MlXGioKSz8EsW9QuTJnShn0LYcC6hH7hdTJ6DJ+aDKrZKC2eM2Q1LjKah
   g==;
X-CSE-ConnectionGUID: +cuh+urHRiuysezJWIGUJQ==
X-CSE-MsgGUID: xoDgFAW/RESdNjmCtPzV9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36304327"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36304327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 08:37:54 -0800
X-CSE-ConnectionGUID: gVwiqYDSQ7asVkHg1px2mg==
X-CSE-MsgGUID: DW2JS8EZRYqeDB44+N1UMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101380204"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2025 08:37:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTOCk-0008e7-0f;
	Thu, 02 Jan 2025 16:37:50 +0000
Date: Fri, 3 Jan 2025 00:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Stevens <stevensd@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or
 struct member 'dma_buf' not described in 'virtio_dma_buf_attach'
Message-ID: <202501030012.OWkcvg5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: a0308938ec81cd0dca9d75833ec0dd1b8708917e virtio: add dma-buf support for exported objects
date:   4 years, 5 months ago
config: csky-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20250103/202501030012.OWkcvg5F-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030012.OWkcvg5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030012.OWkcvg5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or struct member 'dma_buf' not described in 'virtio_dma_buf_attach'
>> drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or struct member 'attach' not described in 'virtio_dma_buf_attach'


vim +41 drivers/virtio/virtio_dma_buf.c

    35	
    36	/**
    37	 * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
    38	 */
    39	int virtio_dma_buf_attach(struct dma_buf *dma_buf,
    40				  struct dma_buf_attachment *attach)
  > 41	{
    42		int ret;
    43		const struct virtio_dma_buf_ops *ops =
    44			container_of(dma_buf->ops,
    45				     const struct virtio_dma_buf_ops, ops);
    46	
    47		if (ops->device_attach) {
    48			ret = ops->device_attach(dma_buf, attach);
    49			if (ret)
    50				return ret;
    51		}
    52		return 0;
    53	}
    54	EXPORT_SYMBOL(virtio_dma_buf_attach);
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
