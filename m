Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2C1F1537
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905970; cv=none; b=O1VyIYavllu0zjtsHwDfs9GN7d8HzcQp9bvvA63JyD5QEXEXO7HtrU02271Dr6KovByoIhBGj244JdQwH8zRZBcsna6zEL3/uoPbDtbISnNdihJeSl1gWL9u4ncQTFdG14HBbgZzqZsOrdhXCKeMlBdyw6fuPOkkcDDoco23fEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905970; c=relaxed/simple;
	bh=luv6p2QOmOJqdvCZ6ZPJMCEpXLkx6U3a7ZyEyeEoKvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdA1oQneVCPeusYTN1844uHoRJ+/iH+PKPtVZOlFA4IlJI0lWT3uog1KmYoz0l9GDW5pVr3/3+2+tyC4lSIlZpBNV/23LMU9cHUrLyZebnas1UI8iwtbBXK/efpemO7UJcyjYT1005KoSJ+qm9PzNc7eUTh8h9D8owN1/TBcXq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4OxNXJ4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4OxNXJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753905969; x=1785441969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=luv6p2QOmOJqdvCZ6ZPJMCEpXLkx6U3a7ZyEyeEoKvk=;
  b=f4OxNXJ4g6C4e7jh6+/uDsbSGF6riLNf9IDPbx39QfGngr1735MLZ7Op
   QfqfICGAeAgBJ7TOR+FQ2Jywgk9Uwn5yfAgoJbX2PykyrL0VuKIkMTCDK
   lz6RLSQjRk+Wu4Oxch3OP8pCFTVKOW1tRPGWmtxCnosideBIglVkosiZr
   XPGjmuXgIwxgxL2Ps+CoSGc2Z661wVyzuOVHpQOqENzy3migbnAIeOb39
   c+00odcasDKAn+yu1O07BL4gmE+56PZQ9EEVKJsWNZ5ule77zvVnkEcxk
   6GS71xP+NWzngKaCjIwT0Ln4ESSnNiYt+X8MqHvghocOKeHrRhiDLlWQI
   w==;
X-CSE-ConnectionGUID: 1lDQveV/ShKMeIle1JHwYg==
X-CSE-MsgGUID: CdSSHeR/SfS0b2BkwfJ1Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60035965"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="60035965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 13:06:08 -0700
X-CSE-ConnectionGUID: 4TyMlVnKSJmEhKcZz7g0fw==
X-CSE-MsgGUID: 69Si1V1jR2O1aLCHKXPmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163414743"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2025 13:06:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhD3t-00036u-1Y;
	Wed, 30 Jul 2025 20:06:05 +0000
Date: Thu, 31 Jul 2025 04:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel
 pass a cookie to of_xlate
Message-ID: <202507310304.OdNSnFmm-lkp@intel.com>
References: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>

Hi Konrad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 79fb37f39b77bbf9a56304e9af843cd93a7a1916]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-dma-qcom-gpi-Retire-passing-the-protocol-ID/20250730-173806
base:   79fb37f39b77bbf9a56304e9af843cd93a7a1916
patch link:    https://lore.kernel.org/r/20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f%40oss.qualcomm.com
patch subject: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel pass a cookie to of_xlate
config: i386-buildonly-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310304.OdNSnFmm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310304.OdNSnFmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310304.OdNSnFmm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/ntb/ntb_transport.c:52:
>> include/linux/dmaengine.h:1555:18: warning: no previous prototype for 'dma_request_chan_w_data' [-Wmissing-prototypes]
    1555 | struct dma_chan *dma_request_chan_w_data(struct device *dev,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
--
   ld: drivers/md/raid5-cache.o: in function `dma_request_chan_w_data':
>> raid5-cache.c:(.text+0x31dc): multiple definition of `dma_request_chan_w_data'; drivers/md/raid5.o:raid5.c:(.text+0x735c): first defined here
   ld: drivers/md/raid5-ppl.o: in function `dma_request_chan_w_data':
   raid5-ppl.c:(.text+0x1f54): multiple definition of `dma_request_chan_w_data'; drivers/md/raid5.o:raid5.c:(.text+0x735c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
