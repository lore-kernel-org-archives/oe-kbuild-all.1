Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B118EB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770942766; cv=none; b=hYXQEUmIpUFmRBcWJKnfykESUJlUcI8M1IvKgvGQL2D9Js4FMktKA8sIq51r35k2hyeWHpLA86GYCwqPAqvUYH1KFmH5jkK2M49GHLuMPyjxhF1i/nTnirOmLmNVMb/C0OZM93rhmtNIfbaSmBSpLz6/KEL5Q2RZNVNZKZI8aBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770942766; c=relaxed/simple;
	bh=KPP4m92cow1/VWxVTG5olxilIysOTSBhQmFu0kMgCWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzlsJ2Q+o0xlVgm6A4uNTq3y2FUlEDxyFBSzRvFM4nGicv3PRNIXPvRNRyTtfaJeUdqnyT6QiK32yDEd5ElhHR+yOfp+dmE3fWfMBbqgC8mG5PtWqR3EB9xYJYfAkQ7GbdNXkE5X4+ZCJ5mB+m9cs3qGnQBu2zAV0CW67FplNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0FjRo4s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0FjRo4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770942765; x=1802478765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPP4m92cow1/VWxVTG5olxilIysOTSBhQmFu0kMgCWE=;
  b=J0FjRo4s+f+xzEvY2pnlUuvrKRyHV0TY3uv+098kM6KtmeRCgV2w9l9H
   SZriJ2XfVxnnDJpMRBSmFAHX30QcG/G3ywbTm9PPm1C/cAcOe1YQlVyyz
   hsDZO5pe6b0psbuQYUOEpDYjDvRsKuyqS6aCj26mHtgHPvK0zJ1v6EMrY
   D6qvLhsdD0+DSu97KK97QMJH4jQ9dwXrvAieHZzhZdYJR12bo4y13nC50
   O7o38z2fBInOo1c5mP0u3hbK+5aqpBh7dZnbLPbjl8OEsyBEM2viVYNXd
   rjUcltJybFelUy4+dTsvXyMuQsDsiSgEHwftZuefWHmfAfX2ddvr3hC9Z
   Q==;
X-CSE-ConnectionGUID: egO7ospOQOaEEJ8vNhyZ4g==
X-CSE-MsgGUID: ak7P3KiMQAytuY0qIo2aQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72116029"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72116029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 16:32:44 -0800
X-CSE-ConnectionGUID: DMsq1YzCTj+JD07nrTcntQ==
X-CSE-MsgGUID: soWWioL6S/Cevl5f1pps+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="235746260"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2026 16:32:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqh6t-00000000uGO-1xEU;
	Fri, 13 Feb 2026 00:32:39 +0000
Date: Fri, 13 Feb 2026 08:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Gabriel Beaulieu <gabriel.beaulieu@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
Message-ID: <202602130822.5syxoFy2-lkp@intel.com>
References: <20260212144352.93043-15-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-15-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-15-damien.riegel%40silabs.com
patch subject: [PATCH v3 14/14] greybus: cpc: add CPC SDIO host driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260213/202602130822.5syxoFy2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130822.5syxoFy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130822.5syxoFy2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/greybus/cpc/sdio.c: In function 'gb_cpc_sdio_tx':
>> drivers/greybus/cpc/sdio.c:286:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     286 |         int err;
         |             ^~~


vim +/err +286 drivers/greybus/cpc/sdio.c

   279	
   280	static int gb_cpc_sdio_tx(struct cpc_sdio *ctx)
   281	{
   282		struct sk_buff_head frame_list;
   283		unsigned char *tx_buff;
   284		size_t tx_len;
   285		int pkt_sent;
 > 286		int err;
   287	
   288		skb_queue_head_init(&frame_list);
   289	
   290		cpc_hd_dequeue_many(ctx->cpc_hd, &frame_list, ctx->max_aggregation);
   291	
   292		if (skb_queue_empty(&frame_list))
   293			return 0;
   294	
   295		tx_len = cpc_sdio_build_aggregated_frame(ctx, &frame_list, &tx_buff);
   296		if (!tx_len) {
   297			dev_err(ctx->dev, "failed to build aggregated frame\n");
   298			goto cleanup_frames;
   299		}
   300	
   301		sdio_claim_host(ctx->func);
   302		err = sdio_writesb(ctx->func, GB_CPC_SDIO_ADDR_FIFO, tx_buff, tx_len);
   303		sdio_release_host(ctx->func);
   304	
   305		kfree(tx_buff);
   306	
   307	cleanup_frames:
   308		pkt_sent = skb_queue_len(&frame_list);
   309		skb_queue_purge(&frame_list);
   310	
   311		return pkt_sent;
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
