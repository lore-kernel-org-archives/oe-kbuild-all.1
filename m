Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571115;
	b=TLHKshNTn0u0mlYlqEDCRF2Pl5A6y+RBWC/YseX1A9ORhlJNhzv59EPzCHwfyg9AXUYY
	 4hadGwoGTLysNPG0MK2aBCFbq1SW0m2C1gbz0fBOmrQa+YkuezIVCCYayHOqieENvv++3
	 TEJ7mX8hOVuCOwxkjiqsZhZnyTXJMjiyG4wCr1YwCOYU71363KNFdfZk6kxZcpiy9pIqJ
	 RSXegQJoW5n2eOdMySBxtB3Z6mfP/SGMOoTosxbwBKUgsN27CaScI6hiC78o9qZBYhFBz
	 rhCVT1JmffCWkbkBJ4h1g6TcAEC4wOLrEGLuVr+tsbiQDF1w4YA+KdkFmJXuniFzzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oE5Uy4JTY2dhQ+PHpBbfRSLItBKwxPOAG7EcvajU7/E=;
	b=4W64GAiofFmzlC7nmAUdNoA25JQtgaNJZtP01e4rLoN4YOos/bqvXDvzVOm8AM7p2X6G
	 WuaHe/i5N4/5HHqV+4S7QK3d9OZPApLmP2ornoj50NGuEaN60J1yv6F4TtbQH3TtnL5GV
	 9w3e/KqLcID7y3DpIIJ6Xl4bb9S/0hmEvt0RJLPmMrJ2ldzO9/u+7nAqN0qQNNsPtdK3C
	 zHYQhuBn4ewnZVw+FxB9dLVmmET1F/uiyNLyi4rm+fFTqdJfCxB9hHxZ88f8mSpmPOfRf
	 RzKRYVqJ63e6Ry5VnqxDvZmrZJAcQsl+3fQAFAGIsOR2PRTbBmpVLWdaM3yJ8IRnpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4jgBtVZ;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EF606A323
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 01:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46EF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4jgBtVZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795571113; x=1827107113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaxtKRtzjluJFgLeD+jCQamcgyCOTLDoz+vU29I2d5g=;
  b=V4jgBtVZhs5xFUHxwC9/c3nBTHNQt25O8JusDRvBnghHFjmxIV9W0KaG
   kdMAMICgldd6q/jkEnA8f5cl3fd1wGSvq8OH/F7LvFrnwAmiTmTXsDkYo
   5XuyzybiV5Zdm5bejCuNYpRvAB2tLds/g5mVmVAHZGL8kh1mqYTWjdDMl
   yYc+yEt9ojf5kXCLbI2+SJnDtwbrIcKutzs+F4mUNukCnRpVu3su9G2Jy
   UfI+SLxeSN2sTVAQQBGi01eB4F9C3OINTDSb7dWdxxcWxn8emgWqcBqA7
   I2gIZHu+BcDx0veBj+RUrAjYyFnASdddL9wodMEic6CzXJ5RT7aWkjzxT
   g==;
X-CSE-ConnectionGUID: fhOMMib9SKuTcKeK9pP7bw==
X-CSE-MsgGUID: RP5xHZc1Tj+8TArZKaQazQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334050"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4334050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 17:45:13 -0800
X-CSE-ConnectionGUID: OPNKmngkRuyQW0LFsChLhQ==
X-CSE-MsgGUID: MSDQ13MQQPOSj6avr7MSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12062149"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 17:45:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW24K-00000001Qdu-2rj1;
	Wed, 25 Nov 2026 01:45:08 +0000
Date: Wed, 25 Nov 2026 09:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20261125093804.Ygd8f4XE-lkp@intel.com>
References: <awXJ__-grexFFPb4@sirena.org.uk>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXJ__-grexFFPb4@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261123]
[cannot apply to drm-tip/drm-tip linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-drm-misc-tree/20261124-173143
base:   next-20261123
patch link:    https://lore.kernel.org/r/awXJ__-grexFFPb4%40sirena.org.uk
patch subject: linux-next: build failure after merge of the drm-misc tree
config: parisc-randconfig-1001-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125093804.Ygd8f4XE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125093804.Ygd8f4XE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125093804.Ygd8f4XE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c: In function 'vc_sm_clean_up_dmabuf':
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:217:17: error: implicit declaration of function 'dma_buf_unmap_sgt_unlocked'; did you mean 'dma_buf_vunmap_unlocked'? [-Werror=implicit-function-declaration]
     217 |                 dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 dma_buf_vunmap_unlocked
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c: In function 'vc_sm_cma_import_dmabuf_internal':
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:15: error: implicit declaration of function 'dma_buf_map_sgt_unlocked'; did you mean 'dma_buf_vmap_unlocked'? [-Werror=implicit-function-declaration]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               dma_buf_vmap_unlocked
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:13: warning: assignment to 'struct sg_table *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |             ^
   cc1: some warnings being treated as errors


vim +217 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c

   208	
   209	/*
   210	 * Cleans up imported dmabuf.
   211	 * Should be called with mutex held.
   212	 */
   213	static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
   214	{
   215		/* Handle cleaning up imported dmabufs */
   216		if (buffer->sgt) {
 > 217			dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
   218						   DMA_BIDIRECTIONAL);
   219			buffer->sgt = NULL;
   220		}
   221		if (buffer->attach) {
   222			dma_buf_detach(buffer->imported_dma_buf, buffer->attach);
   223			buffer->attach = NULL;
   224		}
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
