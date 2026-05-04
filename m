Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3413D3016
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777924215; cv=none; b=DXtg0HG1Ag6euTGs/FjjGYx9PK88Oxhu08zar7MC26+DRLl10QuqY0r6A+CGLIVtMM/4g9vj6Hl7A+bXqDKx9ECC1146WLC+oNsJaXLok9rO399DQicZfyaf3sXey4NRHK+6SkYetK3xHImzpEBUYsUm2LnXa4OE9rc+lHBdfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777924215; c=relaxed/simple;
	bh=fWwEjgrvGoFC8bQ/vU/AjOtSKG16KtRQsNCE3GncVzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PY4m76slAqjO0c/z7mwn/Vo/aUDVHo6KqsE8e39NabJdNU94cTVuvmH8d9TGflhXRJhT1Ymr733oIvUIwvIjKD4IhccPZ8QL8f201Ht5KsLNk8tgC3dzfNZ7XUoNNP9E9wmGQ9SDml/ATPAoPUU5FO7kk6gZqdKPJSwf2Z4GGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRig63Sc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRig63Sc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777924212; x=1809460212;
  h=date:from:to:cc:subject:message-id;
  bh=fWwEjgrvGoFC8bQ/vU/AjOtSKG16KtRQsNCE3GncVzc=;
  b=gRig63ScydCsMAv1Y6kraZj81qqSEBjq8K1GyPQAXcn0Mwq1vXDOrfIl
   l/uhEaZXH8adyTJmo2qb9utVjZvOsRwkoplkZZ5DK/z9USxRBav22Slao
   VoVv/wPNQ6r+10kkNWUKFux3mjrLqsZ/PUdjhqnFKbgaOVlCOleRNu5oB
   LAvl4XoD52SNsMAmvvOj8rXkbplFnOf80HnL77jjgltYFHc+pEwmhQZM4
   5C0kI5S7gV0kMyRtBKw1/faKVmpoMiHL2JjzWIjxp33lXCfeYqKSIPX0a
   EOzR0pC3hkvPmpkr0lY6vI9QmtYveBsOqHiWTdGDP8uHjEox6RzC3drvY
   Q==;
X-CSE-ConnectionGUID: p7UHyMiUR+mb5TVHwNNjlg==
X-CSE-MsgGUID: SFPvtnsuRJq4QDxLJQLEqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89484639"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89484639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 12:50:11 -0700
X-CSE-ConnectionGUID: pfr0ft7BSUqRglPpDAzCjA==
X-CSE-MsgGUID: XzRXRTUoTXGGaFiqy2io7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232468001"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 12:50:10 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJzIm-000000003yT-1XZc;
	Mon, 04 May 2026 19:50:02 +0000
Date: Tue, 05 May 2026 03:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Guodong Xu <guodong@riscstar.com>
Subject: [broonie-ci:spi-7.2 9/9]
 drivers/spi/spi-spacemit-k1.c:393:38: warning: integer overflow in expression
 of type 'long int' results in '-589934592'
Message-ID: <202605050317.Tf9j487w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-7.2
head:   efcd8b9d111177d48c841d09beca43b15d5b9e5f
commit: efcd8b9d111177d48c841d09beca43b15d5b9e5f [9/9] spi: spacemit: introduce SpacemiT K1 SPI controller driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605050317.Tf9j487w-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050317.Tf9j487w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050317.Tf9j487w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-spacemit-k1.c: In function 'k1_spi_set_speed':
>> drivers/spi/spi-spacemit-k1.c:393:38: warning: integer overflow in expression of type 'long int' results in '-589934592' [-Woverflow]
     393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
         |                                      ^


vim +393 drivers/spi/spi-spacemit-k1.c

   356	
   357	/* Set the transfer speed; the SPI core code ensures it is supported */
   358	static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
   359				    struct spi_transfer *transfer)
   360	{
   361		struct clk *clk = drv_data->clk;
   362		u64 nsec_per_word;
   363		u64 bus_ticks;
   364		u32 timeout;
   365		u32 val;
   366		int ret;
   367	
   368		ret = clk_set_rate(clk, transfer->speed_hz);
   369		if (ret)
   370			return ret;
   371	
   372		drv_data->rate = clk_get_rate(clk);
   373	
   374		/* No need for RX FIFO timeout if we're not receiving anything */
   375		if (!transfer->rx_buf)
   376			return 0;
   377	
   378		/*
   379		 * Compute the RX FIFO inactivity timeout value that should be used.
   380		 * The inactivity timer restarts with each word that lands in the
   381		 * FIFO.  If several "word transfer times" pass without any new data
   382		 * in the RX FIFO, we might as well read what's there.
   383		 *
   384		 * The rate at which words land in the FIFO is determined by the
   385		 * word size and the transfer rate.  One bit is transferred per
   386		 * clock tick, and 8 (or 16 or 32) bits are transferred per word.
   387		 *
   388		 * So we can get word transfer time (in nanoseconds) from:
   389		 *   nsec_per_tick = NSEC_PER_SEC / drv_data->rate;
   390		 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
   391		 * We do the divide last for better accuracy.
   392		 */
 > 393		nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
   394		nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
   395	
   396		/*
   397		 * The timeout (which we'll set to three word transfer times) is
   398		 * expressed as a number of APB clock ticks.
   399		 *   bus_ticks = 3 * nsec * (drv_data->bus_rate / NSEC_PER_SEC)
   400		 */
   401		bus_ticks = 3 * nsec_per_word * drv_data->bus_rate;
   402		timeout = DIV_ROUND_UP_ULL(bus_ticks, NSEC_PER_SEC);
   403	
   404		/* Set the RX timeout period (required for both DMA and PIO) */
   405		val = FIELD_PREP(SSP_TIMEOUT_MASK, timeout);
   406		writel(val, drv_data->base + SSP_TIMEOUT);
   407	
   408		return 0;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
