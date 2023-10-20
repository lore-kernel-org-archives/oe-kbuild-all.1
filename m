Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4FCA75
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig6OtTtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697801408; x=1729337408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ujDJGqBMHC6BnUAx0rbVKyHyfSKrdlukXoGBGCJFJJs=;
  b=ig6OtTtPrSZjqhTSnIQRGpaSVkAbT1bDOIcWbhtU6MgiXk54lr1A61he
   qwXYXfc34JrjyLMza6cVso0rPMNHlQVdcR4IUBeNcnr+xNpjoU4EqKpsD
   pJjU2Cy94jSN6p4GfbBWkZ9KpzBkx/3RvHqR/F5B2P3nwyM/cGsSYDP6H
   rnGYiFg+zn9oSR6+qAQv6KZwik5NdLESFtY4RXPXi1qV0J/G6KCxxj4WX
   Jh8XOEcVd4/q8bpUtn1aMtZ+xuBq7BHEWJvWr9GdKlSZYhfH2D9jOCO6p
   cis0HFTh7IbgIanIsZ+QXhHGHsL1Q6QzsZ5ijnA06+/rge8GS2/zY7N2S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="371553328"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="371553328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 04:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5090593"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2023 04:28:56 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtnhc-0003SY-19;
	Fri, 20 Oct 2023 11:30:04 +0000
Date: Fri, 20 Oct 2023 19:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx_copy_fallback 4/19] zc_rx.c:undefined reference to
 `dev_get_by_index'
Message-ID: <202310201949.CH1cN4Rv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx_copy_fallback
head:   0a9519b651f43b22e1f6eef1e800cdb204290e4e
commit: 313630ba4b08b92ab6f4d01ca11e9b31be426453 [4/19] io_uring: setup ZC for an RX queue when registering an ifq
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231020/202310201949.CH1cN4Rv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201949.CH1cN4Rv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201949.CH1cN4Rv-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
>> zc_rx.c:(.text+0x210): undefined reference to `dev_get_by_index'
   sh4-linux-ld: zc_rx.c:(.text+0x214): undefined reference to `init_net'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
